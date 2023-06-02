output "event_rule_name" {
  description = "Name of the CloudWatch event rule"
  value       = aws_cloudwatch_event_rule.this.name
}

output "event_rule_arn" {
  description = "ARN of the CloudWatch event rule"
  value       = aws_cloudwatch_event_rule.this.arn
}

output "event_target_id" {
  description = "ID of the CloudWatch event target"
  value       = aws_cloudwatch_event_target.this.id
}

output "event_target_arn" {
  description = "ARN of the CloudWatch event target"
  value       = aws_cloudwatch_event_target.this.arn
}