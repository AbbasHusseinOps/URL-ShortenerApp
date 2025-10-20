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