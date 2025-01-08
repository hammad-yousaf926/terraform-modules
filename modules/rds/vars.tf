variable "project_name" {
  type        = string
  description = "Name of the project to tag resources."
}

variable "environment" {
  type        = string
  description = "Deployment environment (e.g., prod, dev, stage)."
}

variable "db_instance_class" {
  type        = string
  description = "The instance type of the RDS instance."
  default     = "db.t3.micro"
}

variable "db_name" {
  type        = string
  description = "The name of the database to create when the DB instance is created."
}

variable "db_username" {
  type        = string
  description = "Username for the database administrator."
}

variable "db_password" {
  type        = string
  description = "Password for the database administrator. It is recommended to use secrets management."
}

variable "allocated_storage" {
  type        = number
  description = "The allocated storage in gigabytes."
  default     = 20
}

variable "engine" {
  type        = string
  description = "The database engine to use (e.g., mysql, postgresql, oracle-se2)."
  default     = "mysql"
}

variable "engine_version" {
  type        = string
  description = "The version number of the database engine to use."
  default     = "8.0"
}

variable "subnet_group_name" {
  type        = string
  description = "Name of the DB subnet group."
}

variable "vpc_security_group_ids" {
  type        = list(string)
  description = "List of VPC security group IDs to associate."
}

variable "backup_retention_period" {
  type        = number
  description = "The days to retain backups for."
  default     = 7
}

variable "multi_az" {
  type        = bool
  description = "Specifies if the RDS instance is multi-AZ."
  default     = false
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "A mapping of tags to assign to the resource."
}

variable "vpc_id" {
  type        = string
  description = "The VPC ID where the RDS instance and other resources will reside."
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs for the DB subnet group."
}

variable "allowed_cidr_blocks" {
  type        = list(string)
  description = "List of CIDR blocks that are allowed to access the RDS instance."
}
