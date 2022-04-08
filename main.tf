terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
}

resource "aws_instance" "injection_demo" {
  ami           = "ami-09fa80f679072f684"
  instance_type = "t3.small"
  key_name = "${var.ssh_key_name}"
  security_groups = [aws_security_group.injection_demo.name]
  tags = {
    Name = "HelloWorld"
  }
}
