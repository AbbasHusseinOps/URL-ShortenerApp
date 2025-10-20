variable "parent_domain" {
     type = string 
     default = "abbashussein.com"
}
variable "subdomain" {
    type = string
    default = "url"
  
}
variable "parent_zone_id" {
     type = string 
     default = "Z03921363KLP3BVUI94ZZ"
}
variable "alb_dns_name"  { 
    type = string 
}
variable "alb_zone_id"   { 
    type = string 
}
variable "ns_ttl"        { 
    type = number 
    default = 300 
}
