output "deployment_group_name" {
  value = aws_codedeploy_deployment_group.ecs.deployment_group_name
}

output "deployment_group_id" {
  value = aws_codedeploy_deployment_group.ecs.id
}
output "codedeploy_app" {
  value = aws_codedeploy_app.deployer.id
}
output "application_name" {
  value = aws_codedeploy_app.deployer.name
}