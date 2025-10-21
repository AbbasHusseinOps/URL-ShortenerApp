variable "private_subnet_ids" {
  type = list(string)
}
variable "security_group_ids" {
 type = list(string)
}

variable "private_route_table_ids" {
  type = list(string)
}
variable "vpc_id" {
  type = string
  
}