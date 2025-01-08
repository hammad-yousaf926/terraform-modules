variable "aws_region" {
  type        = string
  description = "AWS region where the resources will be created."
  default     = "us-east-1"
}

variable "app_name" {
  type        = string
  description = "Name of the application for naming AWS resources."
}

variable "ecr_image_url" {
  type        = string
  description = "ECR image URL for the container."
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC."
}

variable "public_subnet_cidr_1" {
  type        = string
  description = "CIDR block for the first public subnet."
}

variable "public_subnet_cidr_2" {
  type        = string
  description = "CIDR block for the second public subnet."
}

variable "private_subnet_cidr_1" {
  type        = string
  description = "CIDR block for the first private subnet."
}

variable "private_subnet_cidr_2" {
  type        = string
  description = "CIDR block for the second private subnet."
}

variable "log_retention_days" {
  type        = number
  description = "Number of days to retain logs in CloudWatch."
  default     = 7
}

variable "desired_count" {
  type        = number
  description = "The number of instances of the task definition to place and keep running in your service."
}

