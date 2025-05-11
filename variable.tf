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
variable "string_numbers" {
  type=list(string)
  default=["42", "77", "13", "98", "3", "64", "55", "27", "89", "6"]
}
variable "sentence"{
type=string
description ="A sentence to convert to uppercase"
default="hello class"
}
variable "full_text" {
type=string
default= "i love the country called canada, it is awesome"
}
