terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = var.region
}

resource "aws_instance" "app_server" {
  ami           = "ami-0fc5d935ebf8bc3bc"
  instance_type = var.instance_type
  key_name      = var.ssh_key

  vpc_security_group_ids = [
    aws_security_group.app_sg.id
  ]
  tags = {
    Name = "app"
  }

  depends_on = [aws_security_group.app_sg]
}

resource "aws_key_pair" "ssk_key_res" {
  key_name   = var.ssh_key
  public_key = file("${var.ssh_key}.pub")
}

output "public_ip_out" {
  value = aws_instance.app_server.public_ip
}
