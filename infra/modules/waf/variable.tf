variable "denied_ips_v4" {
    type = list(string)
    default =  [""]
    description = "lsit of ip4 you want blocked"

}
variable "alb_arn" {
    type = string
}