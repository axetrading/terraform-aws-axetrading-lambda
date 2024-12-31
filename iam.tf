locals {
  lambda_role_name   = var.role_name != null ? format("%s-%s", var.role_name, "lambda") : null
  lambda_role_prefix = var.role_name_prefix != null ? format("%s-%s", var.role_name_prefix, "lambda") : null
}

data "aws_iam_policy_document" "lambda" {
  count = var.create_role ? 1 : 0

  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "lambda" {
  count = var.create_role ? 1 : 0

  name        = local.lambda_role_name
  name_prefix = module.short-name[0].result
  path        = var.role_path
  description = var.role_description

  assume_role_policy    = data.aws_iam_policy_document.lambda[0].json
  max_session_duration  = var.max_session_duration
  permissions_boundary  = var.role_permissions_boundary_arn
  force_detach_policies = var.force_detach_policies

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "lambda" {
  count      = length(var.lambda_role_policy_arns)
  role       = aws_iam_role.lambda[0].name
  policy_arn = var.lambda_role_policy_arns[count.index]
}

resource "aws_iam_role_policy_attachment" "vpc_execution_role" {
  count      = var.subnet_ids != null && (var.security_group_ids != null || var.create_security_group) ? 1 : 0
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole"
  role       = aws_iam_role.lambda[0].name
}

module "short-name" {
  count      = local.lambda_role_prefix != null ? 1 : 0
  source     = "git@github.com:axetrading/terraform-null-short-name.git?ref=v1.0.0"
  max_length = 38
  value      = local.lambda_role_prefix
}

