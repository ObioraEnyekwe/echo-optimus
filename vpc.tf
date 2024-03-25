#Provider definitions
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.15.0"
    }
    databricks = {
      source  = "databricks/databricks"
      version = ">= 1.38.0"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}
# Create a VPC
resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/25"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "example-vpc"
    Environment = "dev"
  }
}
# Create a subnet
resource "aws_subnet" "example-pub-subnet" {
  vpc_id = aws_vpc.example.id
  cidr_block = "10.0.0.0/26"
  availability_zone = "us-west-2a"
  map_public_ip_on_launch = true
  tags = {
    Name = "example-pub-subnet"
  }
}
# Create an internet gateway
resource "aws_internet_gateway" "example" {
  vpc_id = aws_vpc.example.id
  tags = {
    Name = "example-igw"
  }
}

# Attach the internet gateway to the VPC
resource "aws_internet_gateway_attachment" "example-igw-attachment" {
  vpc_id = aws_vpc.example.id
  internet_gateway_id = aws_internet_gateway.example.id
}

# Create a route table
resource "aws_route_table" "example-public-route-table" {
  vpc_id = aws_vpc.example.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.example.id
  }
  tags = {
    Name = "example-public-route-table"
  }
}
# Associate the route table with the subnet
resource "aws_route_table_association" "example-public-route-table-assoc" {
  subnet_id = aws_subnet.example-pub-subnet.id
  route_table_id = aws_route_table.example-public-route-table.id
}
# Create a security group
resource "aws_security_group" "example" {
  vpc_id = aws_vpc.example.id
  ingress {
    from_port = 0
    to_port = 65535
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 65535
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "example-sg"
  }
}
# Create s3 bucket

resource "aws_s3_bucket_acl" "example" {
  bucket = "example-bucket"
  acl = "private"
}
# Create vpc endpoint
resource "aws_vpc_endpoint" "example" {
  vpc_id = aws_vpc.example.id
  service_name = "com.amazonaws.us-west-2.s3"
  route_table_ids = [aws_route_table.example-public-route-table.id]
  tags = {
    Name = "example-vpc-endpoint"
  }
}
provider "databricks" {
  username = "okoerikingsley1@gmail.com"
  password = "f5Da?5yLET88V5+" # Add provider configuration here if necessary
}

# Create Databricks cluster
resource "databricks_cluster" "example" {
  cluster_name = "example-cluster"
  spark_version = "7.3.x-scala2.12"
  node_type_id = "Standard_DS3_v2"
  num_workers = 2
  aws_attributes {
    availability = "ON_DEMAND"
    first_on_demand = 1
    spot_bid_price_percent = 100
  }
}

