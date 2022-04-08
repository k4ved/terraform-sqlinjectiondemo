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

data "template_file" "user_data" {
  template = file("scripts/cloud-init.yaml")
}

resource "aws_instance" "injection_demo" {
  ami           = "ami-09fa80f679072f684"
  instance_type = "t3.small"
  key_name = "${var.ssh_key_name}"
  security_groups = [aws_security_group.injection_demo.name]
  user_data                   = data.template_file.user_data.rendered
  tags = {
    Name = "HelloWorld"
  }
}
