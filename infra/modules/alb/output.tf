output "alb_dns_name"  { 
value = aws_lb.this.dns_name 
}
output "alb_zone_id"   { 
value = aws_lb.this.zone_id 
}
output "https_blue_listener_arn"  { 
value = aws_lb_listener.blue.arn 
}
output "https_green_listener_arn"  { 
value = aws_lb_listener.green.arn 
}
output "tg_blue_arn" { 
value = aws_lb_target_group.blue.arn 
}
output "tg_green_arn" { 
value = aws_lb_target_group.green.arn 
}
output "alb_arn" {
value = aws_lb.this.arn
}