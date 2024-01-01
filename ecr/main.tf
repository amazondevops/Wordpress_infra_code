resource "aws_ecr_repository" "app_repository" {
  name                 = var.repo_name
  image_tag_mutability = "IMMUTABLE"
 
  image_scanning_configuration {
    scan_on_push = var.image_scan
  }
 
 
  tags = {
    environment = var.app_environment
  }
}

resource "aws_ecr_lifecycle_policy" "image_age" {
  count = var.image_age > 0 ? 1 : 0
 
  repository = aws_ecr_repository.app_repository.name
 
  policy = jsonencode({
    "rules" : [
      {
        "description" : "Delete images older than ${var.image_age} days.",
        "rulePriority" : 1,
        "selection" : {
          "tagStatus" : "any",
          "countType" : "sinceImagePushed",
          "countUnit" : "days",
          "countNumber" : "${var.image_age}"
        },
        "action" : {
          "type" : "expire"
        }
      }
    ]
  })
}
