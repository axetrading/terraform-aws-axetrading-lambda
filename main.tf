resource "aws_lambda_function" "this" {
  function_name                  = var.name
  image_uri                      = var.lambda_function_image_uri
  memory_size                    = var.lambda_memory_size
  package_type                   = "Image"
  architectures                  = var.architectures
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
  ephemeral_storage {
    size = var.lambda_ephemeral_storage_size
  }
  tracing_config {
    mode = var.tracing_mode
  }

  tags = var.tags
}
