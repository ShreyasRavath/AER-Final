
variable "primary_region" { default = "us-east-1" }
variable "standby_region" { default = "us-east-2" }
variable "account_id" {type        = string}
variable "alert_email" {
  description = "Email address to subscribe to SNS alerts"
  type        = string
}


