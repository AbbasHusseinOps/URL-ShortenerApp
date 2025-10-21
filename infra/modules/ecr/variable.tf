variable "repo_name"  { 
    type = string 
    default = "abbas-url"
}
variable "scan_on_push" {
     type = bool   
     default = true 
}
variable "tag_mutability"  { 
    type = string 
    default = "MUTABLE"
} 
    