
variable "primary_region" { default = "us-east-1" }
variable "standby_region" { default = "us-east-2" }
variable "account_id" {default = "381751878913"}
variable "alert_email" {default = "2007shreyas@gmail.com"}
variable "primary_cluster_name" {default = "eks-cluster-primary"}
variable "standby_cluster_name" {default = "eks-cluster-standby"}