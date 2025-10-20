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
certificate_arn = var.certificate_arn
alb_sg_id = module.sgs.alb_sg_id
public_subnet_ids = module.vpc.public_subnet_ids
}

module "route53" {
source = "../../modules/route53"
alb_dns_name = module.alb.alb_dns_name
alb_zone_id = module.alb.alb_zone_id
}
