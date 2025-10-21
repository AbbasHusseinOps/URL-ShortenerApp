variable "exec_permissions_boundary_arn" {
  type    = string
  default = null
}

variable "task_permissions_boundary_arn" {
  type    = string
  default = null
}
variable "codedeploy_permissions_boundary_arn" {
  type    = string
  default = null
}

variable "codedeploy_role_name" {
  type    = string
  default = "CodeDeployRole-ECS"
}

variable "ecs_task_execution_role_name" {
  type    = string
  default = "ecsTaskExecutionRole"
}

variable "ecs_task_role_name" {
  type    = string
  default = "ecsTaskRole"
}

variable "codedeploy_policy_name" {
  type    = string
  default = "codedeploy-ecs-bluegreen"
}

variable "exec_policy_name" {
  type    = string
  default = "ecs-task-execution-base"
}

variable "ecs_task_policy_name" {
  type    = string
  default = "ecs-task-runtime"
}

variable "task_ddb_table_arn" {
  type = string
}
variable "githubrepo" {
  type = string
  default = "https://github.com/AbbasHusseinOps/URL-ShortenerApp"
  description = "the github repo youre using "
}
variable "region" {
  type = string
  default = ""
}
variable "account_id" {
  type = string
  default = ""
  description = "the aws accoutn youre using to run your infrastructre"
}
variable "ecr_repo" {
  type = string
  default = ""
  description = "the ecr repo which hold your docker image you pushed during build stage "
}
variable "codedeploy_app" {
  type = string
  default = "value"
}
variable "codedeploy_dg" {
  type = string
}