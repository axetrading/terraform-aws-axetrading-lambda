resource "aws_lambda_function" "this" {
  function_name                  = var.name
  architectures                  = var.architectures
  handler                        = var.lambda_package_type != "Zip" ? null : var.handler
  runtime                        = var.lambda_package_type != "Zip" ? null : var.runtime
  image_uri                      = var.lambda_function_image_uri
  memory_size                    = var.lambda_memory_size
  package_type                   = var.lambda_package_type
  reserved_concurrent_executions = var.reserved_concurrent_executions
  role                           = var.create_role ? aws_iam_role.lambda[0].arn : var.lambda_iam_role
  timeout                        = var.timeout

  environment {
    variables = var.env_vars
  }

  dynamic "vpc_config" {
    for_each = var.subnet_ids != null && (var.security_group_ids != null || var.create_security_group) ? [true] : []
    content {
      security_group_ids = try([aws_security_group.this[0].id], var.security_group_ids)
      subnet_ids         = var.subnet_ids
    }
  }

  dynamic "file_system_config" {
    for_each = var.efs_mount_path != null ? [true] : []
    content {
      arn              = var.efs_filesystem_arn
      local_mount_path = var.efs_mount_path
    }
  }

  ephemeral_storage {
    size = var.lambda_ephemeral_storage_size
  }

  tracing_config {
    mode = var.tracing_mode
  }

  tags = var.tags
}


resource "aws_lambda_function_url" "this" {
  count = var.create_lambda_function_url ? 1 : 0

  function_name      = aws_lambda_function.this.function_name
  authorization_type = var.authorization_type
  invoke_mode        = var.invoke_mode
}


resource "aws_lambda_permission" "url" {
  for_each               = var.create_lambda_function_url && var.authorization_type == "AWS_IAM" ? toset(var.principals) : []
  function_name          = aws_lambda_function.this.function_name
  principal              = each.value
  action                 = "lambda:InvokeFunctionUrl"
  function_url_auth_type = "AWS_IAM"
}
