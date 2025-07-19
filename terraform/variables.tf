
variable "primary_region" { default = "us-east-1" }
variable "standby_region" { default = "us-east-2" }
variable "account_id" {
  description = "AWS account ID for ECR replication"
  type        = string
}

