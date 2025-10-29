terraform {
  required_version = ">= 1.3.0"

  backend "s3" {
    bucket        = "abbas-url-shortener-app"
    key           = "oidc/terraform.tfstate"   
    region        = "eu-west-2"
    encrypt       = true
    use_lockfile  = true
  }
}
