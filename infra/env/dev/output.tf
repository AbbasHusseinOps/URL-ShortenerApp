output "ecs_cluster_name" {
  value = module.ecs.cluster_name
}

output "ecs_service_name" {
  value = module.ecs.service_name
}

output "ecs_container_name" {
  value = module.ecs.container_name
}

output "ecr_repository_name" {
  value = module.ecr.repository_name
}

output "codedeploy_application_name" {
  value = module.codedeploy.application_name
}

output "codedeploy_deployment_group_name" {
  value = module.codedeploy.deployment_group_name
}

output "dynamodb_table_name" {
  value = module.dynamodb.table_name
}

output "dynamodb_table_arn" {
  value = module.dynamodb.table_arn
}
