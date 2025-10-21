resource "aws_codedeploy_app" "deployer" {
  compute_platform = "ECS"
  name             = var.name_prefix
}

resource "aws_codedeploy_deployment_config" "app" {
  deployment_config_name = "canary-${var.percentage}-${var.min}"
  compute_platform       = "ECS"

  traffic_routing_config {
    type = "TimeBasedCanary"
    time_based_canary {
      interval   = var.min
      percentage = var.percentage
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_codedeploy_deployment_group" "ecs" {
  deployment_group_name  = var.deployment_group_name
  app_name               = var.app_name
  deployment_config_name = aws_codedeploy_deployment_config.app.deployment_config_name
  service_role_arn       = var.codedeploy_iam

  ecs_service {
    cluster_name = var.ecs_cluster
    service_name = var.ecs_service
  }

  deployment_style {
    deployment_option = "WITH_TRAFFIC_CONTROL"
    deployment_type   = "BLUE_GREEN"
  }

  blue_green_deployment_config {
    terminate_blue_instances_on_deployment_success {
      action                           = "TERMINATE"
      termination_wait_time_in_minutes = var.terminate_blue_minutes
    }

    deployment_ready_option {
      action_on_timeout    = var.action_on_timeout
      wait_time_in_minutes = 0
    }
  }

  auto_rollback_configuration {
    enabled = true
    events  = ["DEPLOYMENT_FAILURE", "DEPLOYMENT_STOP_ON_ALARM", "DEPLOYMENT_STOP_ON_REQUEST"]
  }

  load_balancer_info {
    target_group_pair_info {
      target_group { name = var.targetblue }
      target_group { name = var.targetgreen }
      prod_traffic_route  { listener_arns = [var.blue_listener] }
      test_traffic_route  { listener_arns = [var.greentest_listener] }
    }
  }
}

  
