variable "vpc_id" {
  description = "VPC ID for ALB target group"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnets for ALB"
  type        = list(string)
}

variable "security_group_ids" {
  description = "Security groups for ALB"
  type        = list(string)
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "certificate_arn" {
  description = "ACM Certificate ARN for HTTPS listener (Optional)"
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags map"
  type        = map(string)
  default     = {}
}
