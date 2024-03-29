variable "databricks_account_id" {
  type        = string
  description = "Databricks Account ID"
}
variable "databricks_account_username" {
  type        = string
  description = "Databricks Account Username"
}

variable "databricks_account_password" {
  type        = string
  description = "Databricks Account Password"
}

variable "databricks_host" {
  type        = string
  description = "Databricks host URL"
}

variable "databricks_auth_type" {
  type        = string
  description = "Databricks Authentication type"
}
variable "tags" {
  default     = {}
  type        = map(string)
  description = "Optional tags to add to created resources"
}

variable "cidr_block" {
  description = ""
  type        = string
  default     = "192.0.0.0/25"
}

variable "region" {
  default     = "us-east-2"
  type        = string
  description = "AWS region to deploy to"
}

variable "prefix" {
  default     = "capstone-demo"
  type        = string
  description = "Prefix for use in the generated names"
}
