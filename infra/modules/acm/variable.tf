variable "parent_domain" {
  type    = string
  default = "abbashussein.com"
}

variable "subdomain" {
  type    = string
  default = "url"
}

variable "subject_alternative_names" {
  type    = list(string)
  default = []
}

variable "domain_name" {
  type = string
  default = "url.abbashussein.com"
}

variable "sub_zone_id" {
  type = string
}
variable "ns_delegate_record_id" { 
  type = string 
}
