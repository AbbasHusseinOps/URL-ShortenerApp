variable "cluster_name"  {
     type = string
     default = "url-shortener"
 }
variable "service_name"  { 
    type = string 
    default = "abbasurl-app"
}
variable "task_family"   { 
    type = string 
    default = "Abbas-URLShortener"
}
variable "container_name" { 
    type = string 
    default = "url-app"
}
variable "container_image" { 
    type = string 
    default = "885073318616.dkr.ecr.eu-west-2.amazonaws.com/abbas-url-app:latest"

}
variable "container_port"  { 
    type = number 
    default = 8080
}
variable "cpu"             { 
    type = number 
    default = 256
}
variable "memory"          { 
    type = number
    default = 512
}
variable "subnet_ids"      { 
    type = list(string) 
}
variable "security_group_ids"  {
     type = list(string) 
    }
variable "desired_count"   { 
    type = number
    default = 1 
}
variable "prod_target_group_arn" {
     type = string 
}
variable "log_group_name"   { 
    type = string
    default = "abbas-url-app"
}
variable "log_retention"    { 
    type = number
 default = 14 
 }

variable "region" {
    type = string
    default = "eu-west-2"
  
}
variable "db_table_name" {
  description = "the dynamo db table the app neeeds"
  type = string
}
variable "task_role_arn" {
type = string
}
variable "execution_role_arn" {
    type = string
}