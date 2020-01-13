terraform {
  required_version = ">=0.12"
}

provider "aws" {
  region = "ap-northeast-1"
}

resource "aws_vpc" "this" {
  cidr_block = var.cidr

  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = var.tags
}

resource "aws_subnet" "public" {
  count = length(var.public_subnets)

  vpc_id = aws_vpc.this.id

  cidr_block = element(var.public_subnets, count.index)
}

