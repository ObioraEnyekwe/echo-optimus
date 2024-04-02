resource "random_string" "naming" {
  special = false
  upper   = false
  length  = 20
}

locals {
  prefix = var.prefix != "" ? var.prefix : "capstone-project${random_string.naming.result}"
  sg_egress_ports     = [443, 3306, 6666]
  sg_ingress_protocol = ["tcp", "udp"]
  sg_egress_protocol  = ["tcp", "udp"]
  workspace_confs = { //add more workspaces here, remove from here to delete specific workspace
    workspace_1 = var.workspace_1_config

  }
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.2.0"
  cidr    = "192.0.0.0/25" 
  enable_dns_support = true
  enable_dns_hostnames = true 
  # Add module configuration options here
}

