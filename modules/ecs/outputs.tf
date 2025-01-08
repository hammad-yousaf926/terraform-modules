output "ecs_cluster_name" {
  value = aws_ecs_cluster.autosoft_cluster.name
}

output "ecs_service_name" {
  value = aws_ecs_service.autosoft_service.name
}
