resource "aws_cloudwatch_event_rule" "this" {
  name           = var.event_rule_name
  event_bus_name = var.event_bus_name
  event_pattern = templatefile(
    "${path.module}/event_pattern.tpl", {
      log_group_name_prefixes = var.log_group_name_prefixes
  })
  is_enabled = true
}

resource "aws_cloudwatch_event_target" "this" {
  arn  = var.lambda_function_arn
  rule = aws_cloudwatch_event_rule.this.name
}