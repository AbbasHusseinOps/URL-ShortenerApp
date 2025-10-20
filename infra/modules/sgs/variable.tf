variable "http_port" {
type = string
default = "80"
}
variable "canarytest_https_port" {
  type = string
  default = "9443"
}

variable "https_port" {
  type = string
  default = "443"
}
variable "app_port" {
  type = string
  default = "8080"
}

variable "allowed_cidr_blocks" {
  type = list(string)
  default = [ "0.0.0.0/0" ]
  
}

variable "name_prefix" {
  description = "name"
  type = string
  default = "Abbas-ECS-URL-Shortener"
  }

variable "vpc_id" {
  type = string
}