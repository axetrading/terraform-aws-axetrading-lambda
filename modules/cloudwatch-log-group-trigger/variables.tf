variable "lambda_function_arn" {
  description = "ARN of the Lambda function"
  type        = string
}

variable "event_rule_name" {
  description = "Name of the CloudWatch event rule"
  type        = string
}

variable "log_group_name_prefixes" {
  description = "List of log group name prefixes"
  type        = list(string)
  default     = null
}

variable "event_bus_name" {
  description = "Name of the CloudWatch event bus"
  type        = string
  default     = "default"
}