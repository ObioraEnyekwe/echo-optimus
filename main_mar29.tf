resource "random_string" "naming" {
  special = false
  upper   = false
  length  = 20
}

locals {
  prefix = var.prefix != "" ? var.prefix : "capstone-demo${random_string.naming.result}"
}
