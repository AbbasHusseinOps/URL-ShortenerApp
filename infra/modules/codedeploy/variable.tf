variable "ecs_cluster" { 
    type = string 
}
variable "ecs_service" { 
    type = string 
}
variable "codedeploy_iam" { 
    type = string
}
variable "deployment_group_name" {
  type = string
  default = "CANARY"
}
variable "app_name" {
  type = string
  default = "url-shortener"
}
variable "deployment_config_name" {
  type = string
  default = "ECSCANARY"
}

variable "blue_listener"   { 
    type = string 
}
variable "greentest_listener" { 
    type = string 
}

variable "targetblue" { 
    type = string 
}
variable "targetgreen" { 
    type = string 
}

variable "percentage"  { 
    type = number
    default = 90 
}
variable "min"         { 
    type = number
    default = 5
}

variable "terminate_blue_minutes" {
    type = number 
    default = 5 
}
variable "action_on_timeout" { 
    type = string 
    default = "CONTINUE_DEPLOYMENT" 
}
variable "name_prefix" {
  type = string
  default = "url-shortener"
}