# Provider definitions
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.67.0"
    }
    databricks = {
      source  = "databricks/databricks"
      version = ">=1.13.0"
    }
  }
}
