variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "alb_name" {
  type    = string
  default = "app-alb"
}