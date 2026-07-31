variable "environment" {
  description = "Environment name"
  type        = string
}

variable "retention_in_days" {
  description = "CloudWatch log group retention in days"
  type        = number
  default     = 30
}

variable "asg_name" {
  description = "Auto Scaling Group name to monitor"
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags map"
  type        = map(string)
  default     = {}
}
