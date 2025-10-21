resource "aws_ecr_repository" "this" {
  name                 = var.repo_name
  image_tag_mutability = var.tag_mutability
  image_scanning_configuration { scan_on_push = var.scan_on_push }
  
}
resource "aws_ecr_lifecycle_policy" "this" {
  repository = var.repo_name

  policy = jsonencode({
    rules = [
      {
        rulePriority = 1
        description  = "Keep only the 5 most recent untagged images"
        selection = {
          tagStatus   = "untagged"
          countType   = "imageCountMoreThan"
          countNumber = 5
        }
        action = {
          type = "expire"
        }
      }
    ]
  })
}
