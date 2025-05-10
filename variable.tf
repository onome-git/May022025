variable "subscription_id"{
  type=string
  }
variable "client_id"{
  type=string
  }
variable "client_secret"{
  type=string
  }
variable "tenant_id"{
  type=string
  }
variable "onomestoragemay"{ 
type=string
default="myfilestorsgeaccount"
}
variable "numbers" {
  type        = list(string)
  default     = ["42", "77", "13", "98", "3", "64", "55", "27", "89", "6"]
  description = "List of numbers as strings"
}
