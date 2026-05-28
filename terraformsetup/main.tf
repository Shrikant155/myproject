terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}
provider "aws" {
  region = var.region
}
resource "aws_security_group" "shrik_sec_group" {
  ingress {
    description = "ssh"
    from_port = 22
    to_port = 22
    protocol = "tcp"
      cidr_blocks=["106.192.136.223/32"] 
  }
  ingress {
    description = "http"
    from_port = 80
    to_port = 80
    protocol = "tcp"
      cidr_blocks=["106.192.136.223/32"] 
  }
  ingress {
    description = "https"
    from_port = 443
    to_port = 443
    protocol = "tcp"
      cidr_blocks=["106.192.136.223/32"] 
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}