resource "aws_lb" "this" {

  load_balancer_type = "application"
  internal           = false
  security_groups    = [var.alb_sg_id]
  subnets            = var.public_subnet_ids
  idle_timeout       = var.idle_timeout
}

resource "aws_lb_target_group" "blue" {
  vpc_id      = var.vpc_id
  port        = var.app_port
  protocol    = "HTTP"
  target_type = "ip"

  health_check {
    enabled             = true
    path                = var.health_check_path
    matcher             = "200-399"
    interval            = 15
    healthy_threshold   = 3
    unhealthy_threshold = 3
    timeout             = 5
  }

  deregistration_delay = var.deregistration_delay
}

resource "aws_lb_target_group" "green" {
   vpc_id      = var.vpc_id
  port        = var.app_port
  protocol    = "HTTP"
  target_type = "ip"

  health_check {
    enabled             = true
    path                = var.health_check_path
    matcher             = "200-399"
    interval            = 15
    healthy_threshold   = 3
    unhealthy_threshold = 3
    timeout             = 5
  }

  deregistration_delay = var.deregistration_delay
}


resource "aws_lb_listener" "http_redirect" {
  load_balancer_arn = aws_lb.this.arn
  port              = var.http_port
  protocol          = "HTTP"

  default_action {
    type = "redirect"
    redirect {
      protocol    = "HTTPS"
      port        = tostring(var.https_blue_port)
      status_code = "HTTP_301"
    }
  }
}

resource "aws_lb_listener" "blue" {
  load_balancer_arn = aws_lb.this.arn
  port              = var.https_blue_port
  protocol          = "HTTPS"
  certificate_arn   = var.certificate_arn
  ssl_policy        = var.ssl_policy

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.blue.arn
  }
}

resource "aws_lb_listener" "green" {
  load_balancer_arn = aws_lb.this.arn
  port              = var.https_green_port
  protocol          = "HTTPS"
  certificate_arn   = var.certificate_arn
  ssl_policy        = var.ssl_policy

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.green.arn
  }
}