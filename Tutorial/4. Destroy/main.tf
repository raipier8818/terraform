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
  region = "ap-northeast-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-040c33c6a51fd5d96" # Ubuntu 24.04 LTS (x86_64)
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}
