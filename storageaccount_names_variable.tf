
variable "name" {
  description = "Name of the storage account"
  type        = string
}

variable "resourcev2_group_name" {
  type = string
}

variable "location1" {
  type = string
}

variable "account_tier" {
  type = string
}

variable "account_replication_type" {
  type = string
}

variable "kind" {
  type = string
}

variable "access_tier" {
  type = string
}

variable "tags" {
  type = map(string)
}
