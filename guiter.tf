terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "cv_uploads" {
  bucket        = "guitter-cv-uploads-unique-12345"  # Change to a unique bucket name
  force_destroy = true
}

resource "aws_iam_role" "lambda_exec" {
  name = "guitter-lambda-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action    = "sts:AssumeRole"
      Principal = {
        Service = "lambda.amazonaws.com"
      }
      Effect = "Allow"
      Sid    = ""
    }]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_basic_execution" {
  role       = aws_iam_role.lambda_exec.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_iam_role_policy" "s3_access" {
  name = "guitter-s3-access"
  role = aws_iam_role.lambda_exec.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect   = "Allow",
      Action   = ["s3:PutObject", "s3:GetObject", "s3:ListBucket"],
      Resource = [
        aws_s3_bucket.cv_uploads.arn,
        "${aws_s3_bucket.cv_uploads.arn}/*"
      ]
    }]
  })
}

resource "aws_lambda_function" "guitter_lambda" {
  filename         = "../deployment_package.zip"  # Path from terraform folder
  function_name    = "guitter-function"
  role             = aws_iam_role.lambda_exec.arn
  handler          = "app.handler"
  runtime          = "python3.11"
  source_code_hash = filebase64sha256("../deployment_package.zip")
  timeout          = 30

  environment {
    variables = {
      S3_BUCKET = aws_s3_bucket.cv_uploads.bucket
    }
  }
}

resource "aws_apigatewayv2_api" "guitter_api" {
  name          = "guitter-api"
  protocol_type = "HTTP"
}

resource "aws_apigatewayv2_integration" "lambda_integration" {
  api_id             = aws_apigatewayv2_api.guitter_api.id
  integration_type   = "AWS_PROXY"
  integration_uri    = aws_lambda_function.guitter_lambda.invoke_arn
  integration_method = "POST"
  payload_format_version = "2.0"
}

resource "aws_apigatewayv2_route" "default_route" {
  api_id    = aws_apigatewayv2_api.guitter_api.id
  route_key = "$default"
  target    = "integrations/${aws_apigatewayv2_integration.lambda_integration.id}"
}

resource "aws_apigatewayv2_stage" "default_stage" {
  api_id      = aws_apigatewayv2_api.guitter_api.id
  name        = "$default"
  auto_deploy = true
}

resource "aws_lambda_permission" "apigw_invoke" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.guitter_lambda.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_apigatewayv2_api.guitter_api.execution_arn}/*/*"
}

output "guitter_api_url" {
  description = "URL of the Guitter API Gateway"
  value       = aws_apigatewayv2_api.guitter_api.api_endpoint
}
