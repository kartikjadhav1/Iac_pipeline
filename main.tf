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

resource "aws_vpc" "myvpc1" {
    cidr_block = "20.20.0.0/16"
    
}

resource "aws_vpc" "myvpc2" {
    cidr_block = "30.30.0.0/16"
    
}
resource "aws_subnet" "pub_sub" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = "10.10.1.0/24"
  availability_zone = "us-east-1a"

}

resource "aws_internet_gateway" "kj_igw01" {
  vpc_id = aws_vpc.myvpc.id
}


resource "aws_route_table" "custom_main_rtb" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.kj_igw01.id

  }

}

resource "aws_route_table_association" "pub_sub_assoc" {
  subnet_id = aws_subnet.pub_sub.id
  route_table_id = aws_route_table.custom_main_rtb.id
  
}