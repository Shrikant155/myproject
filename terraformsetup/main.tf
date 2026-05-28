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
      cidr_blocks=["0.0.0.0/0"] 
  }
  ingress {
    description = "http"
    from_port = 80
    to_port = 80
    protocol = "tcp"
      cidr_blocks=["0.0.0.0/0"] 
  }
  ingress {
    description = "https"
    from_port = 443
    to_port = 443
    protocol = "tcp"
      cidr_blocks=["0.0.0.0/0"] 
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_instance" "shrik_deploy_server" {
    ami = "ami-05d62b9bc5a6ca605"
    instance_type = "t3.medium"
    key_name = "aws-ssh-key"
    vpc_security_group_ids = [ aws_security_group.shrik_sec_group.id ]
    
    tags = {
      Name ="deployment_server"
    }

}
