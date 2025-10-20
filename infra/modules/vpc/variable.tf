variable "cidr_block" {
type = string
default = "10.0.0.0/16"
}
variable "azs" {
description = "avaialbility zones to place subnets in"
type = list(string)
default = [ "eu-west-2a" , "eu-west-2b" ]
  
}
variable "public_subnets" {
type = list(string)
default =[ "10.0.0.0/24", "10.0.1.0/24" ]
  }

variable "private_subnets" {
type = list(string)
default = ["10.0.2.0/24", "10.0.3.0/24"]
}
