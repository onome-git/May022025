locals {
  region       = "eastus"
  is_primary   = local.region == "eastus" ? true : false
  environment  = local.is_primary ? "production" : "staging"
}
 
