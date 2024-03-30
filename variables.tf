variable "databricks_account_id" {
  type        = string
  description = "Databricks Account ID"
}

variable "tags" {
  default     = {}
  type        = map(string)
  description = "Optional tags to add to created resources"
}

variable "vpc_cidr" {
  description = "The CIDR block of VPC"
  type        = string
  default     = "192.0.0.0/25"
}

variable "public_subnets_cidr" {
  type    = list(string)
  default = ["192.0.0.0/26"]
}

variable "privatelink_subnets_cidr" {
  type    = list(string)
  default = ["192.0.0.0/27", "192.0.0.32/27"]
}
variable "availability_zones" {
  type    = list(string)
  default = ["ca-central-1a", "ca-central-1b", "ca-central-1d"]
}


variable "region" {
  default     = "ca-central-1"
  type        = string
  description = "AWS region to deploy to"
}

variable "prefix" {
  default     = "capstone-proj"
  type        = string
  description = "Prefix for use in the generated names"
}



variable "workspace_1_config" {
  default = {
    private_subnet_pair = { subnet1_cidr = "10.0.0.64/26", subnet2_cidr = "10.0.0.128/26" }
    workspace_name      = "test-workspace-1"
    prefix              = "ws1" // prefix decides subnets name
    region              = "ca-central-1"
    root_bucket_name    = "test-workspace-1-rootbucket"
    block_list          = ["58.133.93.159"]
    allow_list          = [] // if allow_list empty, all public IP not blocked by block_list are allowed
    tags = {
      "Name" = "test-workspace-1-tags",
      "Env"  = "test-ws-1"
    }
  }
}

