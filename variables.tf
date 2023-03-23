variable "name" {
  type        = string
  description = "The name of the K8S deployment lambda and its resources"
}

variable "namespace" {
  type        = string
  description = "Kubernetes namespace"
  default     = "default"
}

variable "create_role" {
  type        = bool
  description = "Whether to create or not the IAM Role for the lambda function"
  default     = true
}

variable "role_path" {
  description = "Path of IAM role"
  type        = string
  default     = "/"
}

variable "role_permissions_boundary_arn" {
  description = "Permissions boundary ARN to use for IAM role"
  type        = string
  default     = null
}

variable "role_description" {
  description = "IAM Role description"
  type        = string
  default     = null
}

variable "role_name_prefix" {
  description = "IAM role name prefix"
  type        = string
  default     = null
}

variable "policy_name_prefix" {
  description = "IAM policy name prefix"
  type        = string
  default     = "eks-policy"
}

variable "tags" {
  description = "A map of tags to add the the IAM role"
  type        = map(any)
  default     = {}
}



variable "force_detach_policies" {
  description = "Whether policies should be detached from this role when destroying"
  type        = bool
  default     = true
}

variable "max_session_duration" {
  description = "Maximum CLI/API session duration in seconds between 3600 and 43200"
  type        = number
  default     = null
}

variable "role_name" {
  description = "Name of IAM role"
  type        = string
  default     = null
}

variable "role_policy_arns" {
  description = "ARNs of any policies to attach to the IAM role"
  type        = set(string)
  default     = []
}

variable "tracing_mode" {
  type        = string
  default     = "PassThrough"
  description = "Whether to sample and trace a subset of incoming requests with AWS X-Ray"
}

variable "timeout" {
  type        = number
  description = "Amount of time your Lambda Function has to run in seconds."
  default     = 180
}

variable "reserved_concurrent_executions" {
  type        = string
  default     = "-1"
  description = "mount of reserved concurrent executions for this lambda function. A value of 0 disables lambda from being triggered and -1 removes any concurrency limitations."
}


variable "lambda_ephemeral_storage_size" {
  type        = number
  description = "The amount of Ephemeral storage(/tmp) to allocate for the Lambda Function in MB. This parameter is used to expand the total amount of Ephemeral storage available, beyond the default amount of 512MB"
  default     = 512
}

variable "lambda_memory_size" {
  type        = number
  description = "Amount of memory in MB your Lambda Function can use at runtime. Defaults to 128"
  default     = 128
}

variable "lambda_function_image_uri" {
  type        = string
  description = "ECR image URI containing the function's deployment package."
}


variable "vpc_id" {
  description = "ID of the VPC where to create security group"
  type        = string
  default     = null
}

variable "security_group_rules" {
  description = "A map of security group  rule definitions to add to the security group created"
  type        = map(any)
  default     = {}
}

variable "create_security_group" {
  description = "Determines whether to create security group for RDS cluster"
  type        = bool
  default     = true
}

variable "security_group_name" {
  type        = string
  description = "RDS Security Group Name"
  default     = ""
}

variable "security_group_ids" {
  type        = list(string)
  description = "A list of security group ids that should be attached to lambda function"
  default     = null
}

variable "subnet_ids" {
  type        = list(string)
  description = "A list of subnets that will be attached to lambda function"
  default     = null
}

variable "lambda_iam_role" {
  type        = string
  description = "The ARN of the IAM Role that will be used by the Lambda Function"
  default     = null
}

variable "lambda_role_policy_arns" {
  description = "List of Amazon Resource Names (ARNs) of IAM policies to attach to the IAM roles used by the Lambda function."
  type        = set(string)
  default     = []
}

variable "env_vars" {
  description = "Map of environment variables to set for the Lambda function."
  type        = map(string)
  default     = {}
}

variable "architectures" {
  description = "Architecture for Lambda function. Valid values are x86_64 and arm64"
  type        = list(string)
  default     = null
}
