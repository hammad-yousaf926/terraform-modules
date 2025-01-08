output "zone_type" {
  description = "The type of the hosted zone, either 'private' or 'public'"
  value       = var.zone_type
}

output "zone_id" {
  description = "The ID of the Route 53 hosted zone"
  value       = aws_route53_zone.zone.id
}

output "zone_name" {
  description = "The name of the Route 53 hosted zone"
  value       = aws_route53_zone.zone.name
}

output "inbound_endpoint_sg_id" {
  description = "The ID of the security group for the Route 53 inbound endpoint"
  value       = var.zone_type == "private" ? aws_security_group.inbound_endpoint_sg[0].id : null
}

output "resolver_endpoint_id" {
  description = "The ID of the Route 53 resolver endpoint"
  value       = var.zone_type == "private" ? aws_route53_resolver_endpoint.inbound_endpoint[0].id : null
}

output "resolver_endpoint_ip_addresses" {
  description = "The list of IP addresses assigned to the Route 53 resolver endpoint"
  value       = var.zone_type == "private" ? [for ip in aws_route53_resolver_endpoint.inbound_endpoint[0].ip_address: ip.ip] : []
}
