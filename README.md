# terraform-aws-axetrading-lambda
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cloudwatch_log_group_trigger"></a> [cloudwatch\_log\_group\_trigger](#module\_cloudwatch\_log\_group\_trigger) | ./modules/cloudwatch-log-group-trigger | n/a |
| <a name="module_short-name"></a> [short-name](#module\_short-name) | axetrading/short-name/null | 1.0.0 |

## Resources

| Name | Type |
|------|------|
| [aws_iam_role.lambda](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.lambda](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.vpc_execution_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_lambda_function.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function) | resource |
| [aws_lambda_function_url.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function_url) | resource |
| [aws_lambda_permission.eventbridge_invoke](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_permission) | resource |
| [aws_lambda_permission.url](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_permission) | resource |
| [aws_security_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_iam_policy_document.lambda](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_architectures"></a> [architectures](#input\_architectures) | Architecture for Lambda function. Valid values are x86\_64 and arm64 | `list(string)` | `null` | no |
| <a name="input_authorization_type"></a> [authorization\_type](#input\_authorization\_type) | The type of authentication that the function URL uses. | `string` | `"AWS_IAM"` | no |
| <a name="input_cloudwatch_log_group_trigger_enabled"></a> [cloudwatch\_log\_group\_trigger\_enabled](#input\_cloudwatch\_log\_group\_trigger\_enabled) | Whether to create a CloudWatch Log Group Trigger for the Lambda function. | `bool` | `false` | no |
| <a name="input_create_lambda_function_url"></a> [create\_lambda\_function\_url](#input\_create\_lambda\_function\_url) | Specifies whether to create a Lambda function URL resource or not. | `bool` | `false` | no |
| <a name="input_create_role"></a> [create\_role](#input\_create\_role) | Whether to create or not the IAM Role for the lambda function | `bool` | `true` | no |
| <a name="input_create_security_group"></a> [create\_security\_group](#input\_create\_security\_group) | Determines whether to create security group for RDS cluster | `bool` | `true` | no |
| <a name="input_efs_filesystem_arn"></a> [efs\_filesystem\_arn](#input\_efs\_filesystem\_arn) | The ARN of the EFS filesystem to mount. | `string` | `null` | no |
| <a name="input_efs_mount_path"></a> [efs\_mount\_path](#input\_efs\_mount\_path) | The local mount path for the EFS filesystem. | `string` | `null` | no |
| <a name="input_env_vars"></a> [env\_vars](#input\_env\_vars) | Map of environment variables to set for the Lambda function. | `map(string)` | `{}` | no |
| <a name="input_filename"></a> [filename](#input\_filename) | The path to the function's deployment package within the local filesystem. | `string` | `null` | no |
| <a name="input_force_detach_policies"></a> [force\_detach\_policies](#input\_force\_detach\_policies) | Whether policies should be detached from this role when destroying | `bool` | `true` | no |
| <a name="input_handler"></a> [handler](#input\_handler) | The name of the function that Lambda calls to begin execution. | `string` | `null` | no |
| <a name="input_invoke_mode"></a> [invoke\_mode](#input\_invoke\_mode) | Determines how the Lambda function responds to an invocation. | `string` | `"BUFFERED"` | no |
| <a name="input_lambda_ephemeral_storage_size"></a> [lambda\_ephemeral\_storage\_size](#input\_lambda\_ephemeral\_storage\_size) | The amount of Ephemeral storage(/tmp) to allocate for the Lambda Function in MB. This parameter is used to expand the total amount of Ephemeral storage available, beyond the default amount of 512MB | `number` | `null` | no |
| <a name="input_lambda_function_image_uri"></a> [lambda\_function\_image\_uri](#input\_lambda\_function\_image\_uri) | ECR image URI containing the function's deployment package. | `string` | `null` | no |
| <a name="input_lambda_iam_role"></a> [lambda\_iam\_role](#input\_lambda\_iam\_role) | The ARN of the IAM Role that will be used by the Lambda Function | `string` | `null` | no |
| <a name="input_lambda_memory_size"></a> [lambda\_memory\_size](#input\_lambda\_memory\_size) | Amount of memory in MB your Lambda Function can use at runtime. Defaults to 128 | `number` | `128` | no |
| <a name="input_lambda_package_type"></a> [lambda\_package\_type](#input\_lambda\_package\_type) | The type of Lambda deployment package to use (Zip or Image). | `string` | `"Zip"` | no |
| <a name="input_lambda_role_policy_arns"></a> [lambda\_role\_policy\_arns](#input\_lambda\_role\_policy\_arns) | List of Amazon Resource Names (ARNs) of IAM policies to attach to the IAM roles used by the Lambda function. | `list(string)` | `[]` | no |
| <a name="input_log_group_name_prefixes"></a> [log\_group\_name\_prefixes](#input\_log\_group\_name\_prefixes) | List of log group name prefixes | `list(string)` | `null` | no |
| <a name="input_max_session_duration"></a> [max\_session\_duration](#input\_max\_session\_duration) | Maximum CLI/API session duration in seconds between 3600 and 43200 | `number` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the K8S deployment lambda and its resources | `string` | n/a | yes |
| <a name="input_policy_name_prefix"></a> [policy\_name\_prefix](#input\_policy\_name\_prefix) | IAM policy name prefix | `string` | `"eks-policy"` | no |
| <a name="input_principals"></a> [principals](#input\_principals) | A list of IAM principals that are allowed to invoke the Lambda function URL | `list(string)` | `[]` | no |
| <a name="input_reserved_concurrent_executions"></a> [reserved\_concurrent\_executions](#input\_reserved\_concurrent\_executions) | mount of reserved concurrent executions for this lambda function. A value of 0 disables lambda from being triggered and -1 removes any concurrency limitations. | `string` | `"-1"` | no |
| <a name="input_role_description"></a> [role\_description](#input\_role\_description) | IAM Role description | `string` | `null` | no |
| <a name="input_role_name"></a> [role\_name](#input\_role\_name) | Name of IAM role | `string` | `null` | no |
| <a name="input_role_name_prefix"></a> [role\_name\_prefix](#input\_role\_name\_prefix) | IAM role name prefix | `string` | `null` | no |
| <a name="input_role_path"></a> [role\_path](#input\_role\_path) | Path of IAM role | `string` | `"/"` | no |
| <a name="input_role_permissions_boundary_arn"></a> [role\_permissions\_boundary\_arn](#input\_role\_permissions\_boundary\_arn) | Permissions boundary ARN to use for IAM role | `string` | `null` | no |
| <a name="input_role_policy_arns"></a> [role\_policy\_arns](#input\_role\_policy\_arns) | ARNs of any policies to attach to the IAM role | `set(string)` | `[]` | no |
| <a name="input_runtime"></a> [runtime](#input\_runtime) | The identifier of the function's runtime. | `string` | `null` | no |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | A list of security group ids that should be attached to lambda function | `list(string)` | `null` | no |
| <a name="input_security_group_name"></a> [security\_group\_name](#input\_security\_group\_name) | AWS Lambda Security Group Name | `string` | `""` | no |
| <a name="input_security_group_rules"></a> [security\_group\_rules](#input\_security\_group\_rules) | A map of security group  rule definitions to add to the security group created | `map(any)` | `{}` | no |
| <a name="input_source_code_hash"></a> [source\_code\_hash](#input\_source\_code\_hash) | Used to trigger updates. Must be set to a base64-encoded SHA256 hash of the package file specified with either filename or image\_uri. | `string` | `null` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | A list of subnets that will be attached to lambda function | `list(string)` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add the the IAM role | `map(any)` | `{}` | no |
| <a name="input_timeout"></a> [timeout](#input\_timeout) | Amount of time your Lambda Function has to run in seconds. | `number` | `180` | no |
| <a name="input_tracing_mode"></a> [tracing\_mode](#input\_tracing\_mode) | Whether to sample and trace a subset of incoming requests with AWS X-Ray | `string` | `"PassThrough"` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | ID of the VPC where to create security group | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_lambda_function_arn"></a> [lambda\_function\_arn](#output\_lambda\_function\_arn) | n/a |
| <a name="output_lambda_function_name"></a> [lambda\_function\_name](#output\_lambda\_function\_name) | n/a |
| <a name="output_lambda_function_url"></a> [lambda\_function\_url](#output\_lambda\_function\_url) | n/a |
| <a name="output_lambda_iam_role_arn"></a> [lambda\_iam\_role\_arn](#output\_lambda\_iam\_role\_arn) | n/a |
| <a name="output_lambda_iam_role_name"></a> [lambda\_iam\_role\_name](#output\_lambda\_iam\_role\_name) | n/a |
| <a name="output_lambda_security_group_id"></a> [lambda\_security\_group\_id](#output\_lambda\_security\_group\_id) | n/a |
<!-- END_TF_DOCS -->