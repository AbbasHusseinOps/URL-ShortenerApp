output "certificate_arn"  {
value = aws_acm_certificate.this.arn 
}
output "validation_fqdns" { 
value = [for r in aws_route53_record.acm_validation : r.fqdn] 
}
