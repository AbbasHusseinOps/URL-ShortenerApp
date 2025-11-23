terraform {
  required_providers {
    aws = { source = "hashicorp/aws", version = "~> 5.0" }
  }
}

provider "aws" {
  region = var.region
}

module "vpc" {
  source = "../../modules/vpc"
}

module "sgs" {
  source = "../../modules/sgs"
  vpc_id = module.vpc.vpc_id
}

module "alb" {
  source            = "../../modules/alb"
  vpc_id            = module.vpc.vpc_id
  certificate_arn   = module.acm.certificate_arn
  alb_sg_id         = module.sgs.alb_sg_id
  public_subnet_ids = module.vpc.public_subnet_ids
}

module "route53" {
  source       = "../../modules/route53"
  alb_dns_name = module.alb.alb_dns_name
  alb_zone_id  = module.alb.alb_zone_id
}
module "acm" {
  source                = "../../modules/acm"
  sub_zone_id           = module.route53.sub_zone_id
  ns_delegate_record_id = module.route53.ns_delegate_record_id
}
module "ecs" {
  source                = "../../modules/ecs"
  security_group_ids    = [module.sgs.ecs_task_sg_id]
  prod_target_group_arn = module.alb.tg_blue_arn
  subnet_ids            = module.vpc.private_subnet_ids
  db_table_name         = module.dynamodb.table_name
  execution_role_arn    = module.iam.ecs_task_execution_role_arn
  task_role_arn         = module.iam.ecs_task_role_arn
}
module "dynamodb" {
  source = "../../modules/dynamodb"
}

module "iam" {
  source             = "../../modules/iam"
  codedeploy_dg      = module.codedeploy.deployment_group_id
  task_ddb_table_arn = module.dynamodb.table_arn
}
module "codedeploy" {
  source             = "../../modules/codedeploy"
  codedeploy_iam     = module.iam.codedeploy_role_arn
  ecs_cluster        = module.ecs.cluster_name
  ecs_service        = module.ecs.service_name
  targetblue         = module.alb.tg_blue_arn
  targetgreen        = module.alb.tg_green_arn
  blue_listener      = module.alb.https_blue_listener_arn
  greentest_listener = module.alb.https_green_listener_arn
}

module "vpcend" {
  source                  = "../../modules/vpcend"
  vpc_id                  = module.vpc.vpc_id
  security_group_ids      = [module.sgs.vpce_sg_id]
  private_route_table_ids = module.vpc.private_route_table_ids
  private_subnet_ids      = module.vpc.private_subnet_ids
}

module "waf" {
  source  = "../../modules/waf"
  alb_arn = module.alb.alb_arn
}
module "ecr" {
  source = "../../modules/ecr"
}