
variable "primary_region" { default = "us-east-1" }
variable "standby_region" { default = "us-east-2" }
variable "account_id" {type        = string}
variable "alert_email" {
  type        = string
  description = "Email to notify via SNS"
}



