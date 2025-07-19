resource "aws_sns_topic_subscription" "email_alert_subscriber" {
  topic_arn = aws_sns_topic.alerts.arn
  protocol  = "email"
  endpoint  = var.alert_email
}