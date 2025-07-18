variable "primary_region" {
  default = "us-east-1"
}

variable "standby_region" {
  default = "us-west-2"
}

variable "route53_zone_id" {
  default = "<your-route53-hosted-zone-id>"
}

variable "app_domain" {
  default = "shop.example.com"
}