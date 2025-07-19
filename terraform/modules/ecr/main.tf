resource "aws_ecr_repository" "aer_app" {
  name                 = "aer-app"
  image_tag_mutability = "MUTABLE"
  force_delete         = true
}

resource "aws_ecr_replication_configuration" "replication" {
  replication_configuration {
    rule {
      destinations {
        region       = "us-east-2"
        registry_id  = var.account_id
      }
    }
  }
}


output "ecr_repo_url" {
  value = aws_ecr_repository.aer_app.ecr_repo_url
}