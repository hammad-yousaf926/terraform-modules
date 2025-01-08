variable "zone_name" {
  description = "The name of the private hosted zone (e.g., dev.lb.service)"
  type        = string
  default     = "dev.local.service"
}

variable "vpc_id" {
  description = "The VPC ID where the private hosted zone and inbound endpoint will be created"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for the inbound endpoint's IP addresses"
  type        = list(string)
}

variable "environment" {
  description = "The environment name (e.g., dev, stage, prod)"
  type        = string
}

variable "allowed_cidr_blocks" {
  description = "List of CIDR blocks allowed to access the inbound endpoint (e.g., on-premises IP ranges)"
  type        = list(string)
  default     = ["0.0.0.0/0"] # Change this to your on-premises network CIDR
}

variable "zone_type" {
  description = "The type of hosted zone, either 'private' or 'public'."
  type        = string
  default     = "private"
}