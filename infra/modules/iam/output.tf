output "codedeploy_role_arn" {
  value = aws_iam_role.codedeploy.arn
}

output "ecs_task_execution_role_arn" {
  value = aws_iam_role.ecs_task_execution.arn
}

output "ecs_task_role_arn" {
  value = aws_iam_role.ecs_task.arn
}
output "codedeploy_policy_arn" {
  value = aws_iam_policy.codedeploy.arn
}

output "exec_base_policy_arn" {
  value = aws_iam_policy.exec_base.arn
}

output "ecs_task_policy_arn" {
  value = aws_iam_policy.ecs_task.arn
}