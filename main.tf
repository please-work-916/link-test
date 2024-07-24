terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }


  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_security_group" "my-group3" {
    name        = "allow_tls"
    description = "Allow TLS inbound traffic"
    ingress = [
    {
      description      = "TLS from VPC"
      from_port        = 3389
      to_port          = 3389
      protocol         = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }]
}


resource "aws_instance" "db_server" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"
  monitoring    = false

  tags = {
    Name = "ExampleDBInstance"
  }
}
