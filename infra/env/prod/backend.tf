terraform {
  required_version = ">= 1.13.0"
  backend "s3" {
    bucket        = "abbas-url-shortener-app"
    key           = "envs/prod/terraform.tfstate"
    region        = "eu-west-2"
    encrypt       = true
    use_lockfile  = true
  }
}
