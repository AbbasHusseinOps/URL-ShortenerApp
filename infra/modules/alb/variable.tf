variable "app_port"            {
    type=number
   default=8080
}
variable "health_check_path"   { 
    type = string 
 default = "/healthz" 
 }

variable "http_port"           { 
    type = number 
    default = 80 
    }     
variable "https_blue_port"     { 
    type = number 
    default = 443 
}
variable "https_green_port"     { 
    type = number 
    default = 9443 
    }
variable "certificate_arn"     { 
    type = string 
}                 
variable "ssl_policy"          { 
    type = string 
    default = "ELBSecurityPolicy-2016-08" 
}

variable "idle_timeout"        { 
    type = number 
    default = 60 
}
variable "deregistration_delay"{ 
    type = number 
    default = 30 
}

variable "vpc_id" {
  type = string
}
variable "alb_sg_id" {
    type = string
  
}
variable "public_subnet_ids" {
  type = list(string)
}