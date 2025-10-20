data "aws_route53_zone" "parent" {
  name         = "abbashussein.com"
  private_zone = false
}
resource "aws_route53_zone" "sub" {
  name = "${var.subdomain}.${var.parent_domain}."
}

resource "aws_route53_record" "ns_delegate" {
  zone_id = data.aws_route53_zone.parent.zone_id 
  name    = "${var.subdomain}.${var.parent_domain}."
  type    = "NS"
  ttl = var.ns_ttl
  records = aws_route53_zone.sub.name_servers
}

resource "aws_route53_record" "apex_alias" {
  zone_id = aws_route53_zone.sub.zone_id
  name    = ""
  type    = "A"
  alias {
    name                   = var.alb_dns_name
    zone_id                = var.alb_zone_id
    evaluate_target_health = false
  }
}
