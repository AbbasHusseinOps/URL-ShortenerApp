output "ci_role_arn" {
  value = aws_iam_role.ci.arn
}

output "terraform_role_arn" {
  value = aws_iam_role.terraform.arn
}

output "oidc_provider_arn" {
  value = aws_iam_openid_connect_provider.github.arn
}
