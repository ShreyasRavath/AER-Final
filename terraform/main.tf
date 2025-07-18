module "primary_eks" {
  source = "./modules/eks_cluster"
  providers = { aws = aws.primary }
  cluster_name = "primary-eks"
  region       = var.primary_region
}

module "standby_eks" {
  source = "./modules/eks_cluster"
  providers = { aws = aws.standby }
  cluster_name = "standby-eks"
  region       = var.standby_region
}

module "primary_efs" {
  source = "./modules/efs_storage"
  providers = { aws = aws.primary }
  file_system_name = "primary-efs"
  region           = var.primary_region
}

module "standby_efs" {
  source = "./modules/efs_storage"
  providers = { aws = aws.standby }
  file_system_name = "standby-efs"
  region           = var.standby_region
}

resource "aws_route53_record" "primary_failover" {
  zone_id = var.route53_zone_id
  name    = var.app_domain
  type    = "CNAME"
  alias {
    name                   = module.primary_eks.load_balancer_dns
    zone_id                = module.primary_eks.load_balancer_zone_id
    evaluate_target_health = true
  }
  set_identifier = "primary"
  failover_routing_policy { type = "PRIMARY" }
  health_check_id = aws_route53_health_check.primary.id
}

resource "aws_route53_record" "standby_failover" {
  zone_id = var.route53_zone_id
  name    = var.app_domain
  type    = "CNAME"
  alias {
    name                   = module.standby_eks.load_balancer_dns
    zone_id                = module.standby_eks.load_balancer_zone_id
    evaluate_target_health = true
  }
  set_identifier = "standby"
  failover_routing_policy { type = "SECONDARY" }
  health_check_id = aws_route53_health_check.primary.id
}

resource "aws_route53_health_check" "primary" {
  fqdn              = module.primary_eks.load_balancer_dns
  port              = 80
  type              = "HTTP"
  resource_path     = "/health"
  failure_threshold = 3
  request_interval  = 30
}