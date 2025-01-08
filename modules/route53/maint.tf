resource "aws_route53_zone" "zone" {
  name = var.zone_name

  dynamic "vpc" {
    for_each = var.zone_type == "private" ? [var.vpc_id] : []
    content {
      vpc_id = vpc.value
    }
  }

  comment = "${var.zone_type} hosted zone for ${var.zone_name}"
}

resource "aws_security_group" "inbound_endpoint_sg" {
  count       = var.zone_type == "private" ? 1 : 0
  name        = "${var.environment}-inbound-endpoint-sg"
  description = "Security group for Route 53 inbound endpoints"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 53
    to_port     = 53  
    protocol    = "tcp"
    cidr_blocks = var.allowed_cidr_blocks
  }

  ingress {
    from_port   = 53
    to_port     = 53
    protocol    = "udp"
    cidr_blocks = var.allowed_cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_route53_resolver_endpoint" "inbound_endpoint" {
  count             = var.zone_type == "private" ? 1 : 0
  direction         = "INBOUND"
  security_group_ids = var.zone_type == "private" ? [aws_security_group.inbound_endpoint_sg[0].id] : []

  name              = "${var.environment}-inbound-endpoint"

  dynamic "ip_address" {
    for_each = var.subnet_ids
    content {
      subnet_id = ip_address.value
    }
  }

  tags = {
    Environment = var.environment
    Name        = "${var.environment}-inbound-endpoint"
  }
}


terraform {
  required_version = ">= 1.9.8"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.74.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}