resource "aws_ecr_repository" "aer_app" {
  name                 = "aer-app"
  image_tag_mutability = "MUTABLE"
  force_delete         = true
}

resource "aws_ecr_replication_configuration" "replication" {
  replication_configuration {
    rules {
      destinations {
        region       = "us-east-2"
        registry_id  = var.account_id
      }
    }
  }
}