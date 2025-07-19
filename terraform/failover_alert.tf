resource "aws_route53_health_check" "primary" {
  fqdn              = var.primary_lb_dns
  port              = 80
  type              = "HTTP"
  resource_path     = "/health"
  failure_threshold = 3
  request_interval  = 30
}

resource "aws_cloudwatch_metric_alarm" "failover_alarm" {
  alarm_name          = "primary-lb-unhealthy"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "HealthCheckStatus"
  namespace           = "AWS/Route53"
  period              = 60
  statistic           = "Minimum"
  threshold           = 1
  alarm_actions       = [aws_sns_topic.alerts.arn]
}

resource "aws_sns_topic" "alerts" {
  name = "failover-alerts"
}