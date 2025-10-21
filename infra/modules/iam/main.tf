resource "aws_iam_role" "codedeploy" {
  name                 = var.codedeploy_role_name
  permissions_boundary = var.codedeploy_permissions_boundary_arn
  assume_role_policy   = jsonencode({
    Version   = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = {
          Service = "codedeploy.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role" "ecs_task_execution" {
  name                 = var.ecs_task_execution_role_name
  permissions_boundary = var.exec_permissions_boundary_arn
  assume_role_policy   = jsonencode({
    Version   = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
        Action = "sts:AssumeRole" 
      }
    ]
  })
}

resource "aws_iam_role" "ecs_task" {
  name                 = var.ecs_task_role_name
  permissions_boundary = var.task_permissions_boundary_arn
  assume_role_policy   = jsonencode({
    Version   = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_policy" "codedeploy" {
  name   = var.codedeploy_policy_name
  policy = <<JSON
{
  "Version": "2012-10-17",
  "Statement": [{
    "Sid": "AllBlueGreenControlPlane",
    "Effect": "Allow",
    "Action": [
      "ecs:CreateTaskSet",
      "ecs:UpdateServicePrimaryTaskSet",
      "ecs:DeleteTaskSet",
      "ecs:DescribeServices",
      "ecs:DescribeTaskSets",
      "ecs:DescribeTaskDefinition",
      "elasticloadbalancing:ModifyListener",
      "elasticloadbalancing:ModifyRule",
      "elasticloadbalancing:DescribeListeners",
      "elasticloadbalancing:DescribeTargetGroups",
      "elasticloadbalancing:DescribeTargetHealth",
      "elasticloadbalancing:DescribeRules"
    ],
    "Resource": "*"
  }]
}
JSON
}

resource "aws_iam_policy" "exec_base" {
  name   = var.exec_policy_name
  policy = <<JSON
{
  "Version": "2012-10-17",
  "Statement": [{
    "Sid": "AllImagePullAndLogs",
    "Effect": "Allow",
    "Action": [
      "ecr:GetAuthorizationToken",
      "ecr:BatchCheckLayerAvailability",
      "ecr:GetDownloadUrlForLayer",
      "ecr:BatchGetImage",
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ],
    "Resource": "*"
  }]
}
JSON
}

resource "aws_iam_policy" "ecs_task" {
  name   = var.ecs_task_policy_name
  policy = <<JSON
{
  "Version": "2012-10-17",
  "Statement": [{
    "Sid": "DynamoDbSingleTable",
    "Effect": "Allow",
    "Action": [
      "dynamodb:GetItem",
      "dynamodb:PutItem",
      "dynamodb:UpdateItem",
      "dynamodb:DeleteItem",
      "dynamodb:Query"
    ],
    "Resource": "${var.task_ddb_table_arn}"
  }]
}
JSON
}
resource "aws_iam_role_policy_attachment" "codedeploy_managed" {
  role       = aws_iam_role.codedeploy.name
  policy_arn = aws_iam_policy.codedeploy.arn
}

resource "aws_iam_role_policy_attachment" "ecs_exec_attach" {
  role       = aws_iam_role.ecs_task_execution.name
  policy_arn = aws_iam_policy.exec_base.arn
}

resource "aws_iam_role_policy_attachment" "ecs_task_attach" {
  role       = aws_iam_role.ecs_task.name
  policy_arn = aws_iam_policy.ecs_task.arn
}