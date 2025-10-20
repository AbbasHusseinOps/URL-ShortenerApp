output "alb_sg_id" {
  description = "The ID of the security group"
  value       = aws_security_group.alb.id
}
output "vpce_sg_id" { 
    value = aws_security_group.vpce.id 
}
output "ecs_task_sg_id" {
    value = aws_security_group.ecs_tasks.id
}

