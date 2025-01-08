resource "aws_db_subnet_group" "default" {
  name        = "${var.project_name}-${var.environment}-db-subnet-group"
  subnet_ids  = var.subnet_ids

  tags = {
    Name = "MyDBSubnetGroup"
    Environment = var.environment
    Project = var.project_name
  }
}

resource "aws_security_group" "db" {
  name        = "${var.project_name}-${var.environment}-rds-sg"
  description = "Security group for RDS MySQL instance"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = var.allowed_cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "MyDBSecurityGroup"
    Environment = var.environment
    Project = var.project_name
  }
}

resource "aws_db_instance" "default" {
  instance_class       = var.db_instance_class
  allocated_storage    = var.allocated_storage
  engine               = var.engine
  engine_version       = var.engine_version
  identifier           = "${var.project_name}-${var.environment}-rds"
  db_name                 = var.db_name
  username             = var.db_username
  password             = var.db_password
  db_subnet_group_name = aws_db_subnet_group.default.name
  vpc_security_group_ids = [aws_security_group.db.id]
  backup_retention_period = var.backup_retention_period
  multi_az             = var.multi_az
  publicly_accessible  = false
  skip_final_snapshot = true

  tags = {
    Name = "${var.project_name}-${var.environment}-rds-instance"
    Environment = var.environment
    Project = var.project_name
  }

  # Apply additional settings as per your security, performance, and monitoring needs
}

# terraform {
#   required_version = ">= 1.9.8"
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = ">= 5.74.0"
#     }
#   }
# }

# provider "aws" {
#   region = "us-east-1"
# }