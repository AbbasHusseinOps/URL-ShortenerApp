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
source = "../../modules/alb"
vpc_id = module.vpc.vpc_id
certificate_arn = module.acm.certificate_arn
alb_sg_id = module.sgs.alb_sg_id
public_subnet_ids = module.vpc.public_subnet_ids
}

module "route53" {
source = "../../modules/route53"
alb_dns_name = module.alb.alb_dns_name
alb_zone_id = module.alb.alb_zone_id
}
module "acm" {
source = "../../modules/acm"
sub_zone_id = module.route53.sub_zone_id
ns_delegate_record_id = module.route53.ns_delegate_record_id
}
module "ecs" {
source = "../../modules/ecs"
security_group_ids = module.sgs.ecs_task_sg_id
prod_target_group_arn = module.alb.tg_blue_arn
subnet_ids = module.vpc.private_subnet_ids
db_table_name = module.dynamodb.table_name
execution_role_arn =
task_role_arn = 
}
module "dynamodb" {
source = "../../modules/dynamodb"
}