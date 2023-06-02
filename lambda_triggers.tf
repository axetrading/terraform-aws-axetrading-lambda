module "cloudwatch_log_group_trigger" {
  source = "./modules/cloudwatch-log-group-trigger"

  count = var.cloudwatch_log_group_trigger_enabled ? 1 : 0

  event_rule_name         = format("%s-%s", var.name, "trigger")
  lambda_function_arn     = aws_lambda_function.this.arn
  log_group_name_prefixes = var.log_group_name_prefixes

}