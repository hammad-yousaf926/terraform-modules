output "db_instance_endpoint" {
  description = "The connection endpoint for the database."
  value       = aws_db_instance.default.endpoint
}

output "db_instance_username" {
  description = "The username for the database administrator."
  value       = var.db_username
}
