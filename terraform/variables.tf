
variable "primary_region" { default = "us-east-1" }
variable "standby_region" { default = "us-west-2" }

variable "primary_subnet_ids" { type = list(string) }
variable "standby_subnet_ids" { type = list(string) }

variable "primary_vpc_id" { type = string }
variable "standby_vpc_id" { type = string }

variable "primary_sg" { type = string }
variable "standby_sg" { type = string }
