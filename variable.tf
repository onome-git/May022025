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
default="my love"
}
variable "full_text" {
type=string
default= "i love the country called canada, it is awesome"
}
variable "my_text" {
type=string
default = "my name is onome"
}
 variable "trimmed_word" {
  type    = string
  default = "  I love Terraform  "
}
variable "terms" {
  default = "Smoked meat is not a sandwich. It's a religion."
}
variable "sentence_4" {
  default = "Why does St-Laurent never sleep?"
}
variable "sentence_2" {
  type    = string
  default = "Poutine should be a food group."
}

