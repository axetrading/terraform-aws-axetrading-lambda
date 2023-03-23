output "lambda_function_arn" {
  value = aws_lambda_function.this.arn
}

output "lambda_function_name" {
  value = aws_lambda_function.this.function_name
}

output "security_group_id" {
  value = try(aws_security_group.this[0].id, "")
}

output "iam_role_name" {
  value = try(aws_iam_role.lambda[0].id, "")
}

output "lambda_function_url" {
  description = "The URL of the Lambda Function URL"
  value       = try(aws_lambda_function_url.this[0].function_url, "")
}

output "lambda_function_url_id" {
  description = "The Lambda Function URL generated id"
  value       = try(aws_lambda_function_url.this[0].url_id, "")
}
