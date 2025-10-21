resource "aws_wafv2_web_acl" "waf" {
  name        = "alb-waf"
  description = "Firewall for ALB"
  scope       = "REGIONAL" 

  default_action {
    allow {}
  }

  rule {
    name     = "denied-ips"
    priority = 1

    action {
      block {}
    }

    statement {
      ip_set_reference_statement {
        arn = aws_wafv2_ip_set.deny_v4.arn
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "DenyIPs"
      sampled_requests_enabled   = true
    }
  }
  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = "alb-waf"
    sampled_requests_enabled   = true
  }
}


resource "aws_wafv2_ip_set" "deny_v4" {
  name               = "deny-ips-v4"
  scope              = "REGIONAL"
  ip_address_version = "IPV4"
  addresses          = var.denied_ips_v4
}


resource "aws_wafv2_web_acl_association" "alb_assoc" {
  resource_arn = var.alb_arn
  web_acl_arn  = aws_wafv2_web_acl.waf.arn
}