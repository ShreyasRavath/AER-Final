resource "aws_route53_record" "blue" {
  zone_id = var.route53_zone_id
  name    = "app.example.com"
  type    = "A"

  alias {
    name                   = aws_lb.blue.dns_name
    zone_id                = aws_lb.blue.zone_id
    evaluate_target_health = true
  }

  set_identifier = "blue"
  weighted_routing_policy {
    weight = 100
  }
}

resource "aws_route53_record" "green" {
  zone_id = var.route53_zone_id
  name    = "app.example.com"
  type    = "A"

  alias {
    name                   = aws_lb.green.dns_name
    zone_id                = aws_lb.green.zone_id
    evaluate_target_health = true
  }

  set_identifier = "green"
  weighted_routing_policy {
    weight = 0
  }
}