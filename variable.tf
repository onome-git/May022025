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

variable "servicename" {
  default = "abracadabra"
}

variable "env" {
  default = "non-prod"
}

variable "service_name" {
  default = "onome"
}

variable "environments" {
  default = ["dev", "qa", "stage", "prod"]
}
variable "configs_folder" {
  type        = string
  default     = "configs"  
}

variable "folderlocation" {
  type        = string
  default     = "windows_configs" 
}

variable "name" {
  description = "The name of the storage account"
  type        = string
}

variable "account_tier" {
  description = "The tier of the storage account"
  type        = string
}

variable "account_replication_type" {
  description = "Replication type of the storage account"
  type        = string
}

variable "access_tier" {
  description = "Access tier (e.g. Hot, Cool)"
  type        = string
}

variable "tags" {
  description = "Tags for the storage account"
  type        = map(string)
}
