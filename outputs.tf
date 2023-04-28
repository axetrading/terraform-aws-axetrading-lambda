output "lambda_function_arn" {
  value = aws_lambda_function.this.arn
}

output "lambda_function_name" {
  value = aws_lambda_function.this.function_name
}

output "lambda_security_group_id" {
  value = try(aws_security_group.this[0].id, "")
}

output "lambda_iam_role_name" {
  value = try(aws_iam_role.lambda[0].id, "")
}

output "lambda_iam_role_arn" {
  value = try(aws_iam_role.lambda[0].arn, "")
}

output "lambda_function_url" {
  value = try(aws_lambda_function_url.this[0].function_url, "")
}