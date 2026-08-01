variable "app_bucket_arn" {
  description = "ARN of application S3 bucket for restricted access policy"
  type        = string
  default     = "*"
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "tags" {
  description = "Tags map"
  type        = map(string)
  default     = {}
}
