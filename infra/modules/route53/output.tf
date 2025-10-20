output "fqdn" {
value = "${var.subdomain}.${var.parent_domain}"
}
output "sub_zone_id" { 
value = aws_route53_zone.sub.zone_id 
}
output "name_servers" { 
value = aws_route53_zone.sub.name_servers 
}
output "ns_delegate_record_id" {
value = aws_route53_record.ns_delegate.id
}

