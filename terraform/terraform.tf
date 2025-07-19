terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "latest"
    }
  }

  backend "s3" {
    bucket       = "aer-finalproject"
    key          = "aer-finalproject.tfstate"
    region       = "us-east-1"
    use_lockfile = true
  }
}
