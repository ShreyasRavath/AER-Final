
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

resource "aws_efs_file_system" "efs" {
  provider = aws
  creation_token = var.file_system_name
}

resource "aws_efs_mount_target" "mount_target" {
  provider = aws
  file_system_id  = aws_efs_file_system.efs.id
  subnet_id       = var.subnet_ids[0]
  security_groups = [var.security_group_id]
}
