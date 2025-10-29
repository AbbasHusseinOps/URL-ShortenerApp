variable "project" {
  type    = string
  default = "url-shortener"
}

variable "region" {
  type    = string
  default = "eu-west-2"
}

variable "account_id" {
  type    = string
  default = "885073318616"
}

variable "github_oidc_thumbprint" {
  type    = string
  default = "6938fd4d98bab03faadb97b34396831e3780aea1"
}

variable "allowed_github_subjects" {
  type    = list(string)
  default = [
    "repo:AbbasHusseinOps/URL-ShortenerApp:ref:refs/heads/main"
  ]
}

variable "ci_passrole_arns" {
  type = list(string)
  default = [
    "arn:aws:iam::885073318616:role/ecsTaskExecutionRole",
    "arn:aws:iam::885073318616:role/ecsTaskRole"
  ]
}

variable "tf_passrole_arns" {
  type = list(string)
  default = [
    "arn:aws:iam::885073318616:role/ecsTaskExecutionRole",
    "arn:aws:iam::885073318616:role/ecsTaskRole"
  ]
}
variable "ecr_repo" {
  type = string
  default = "abbas-url-app"
}