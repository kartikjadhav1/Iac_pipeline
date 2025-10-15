terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.12.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}


resource "aws_vpc" "myvpc" {
    cidr_block = "10.10.0.0/16"
    
}
