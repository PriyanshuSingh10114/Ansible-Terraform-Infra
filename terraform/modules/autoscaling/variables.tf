variable "launch_template_id" {
  description = "Launch Template ID"
  type        = string
}

variable "launch_template_version" {
  description = "Launch Template Version"
  type        = string
  default     = "$Latest"
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs for Auto Scaling placement"
  type        = list(string)
}

variable "target_group_arns" {
  description = "List of ALB Target Group ARNs"
  type        = list(string)
}

variable "min_size" {
  description = "Minimum capacity"
  type        = number
  default     = 2
}

variable "max_size" {
  description = "Maximum capacity"
  type        = number
  default     = 5
}

variable "desired_capacity" {
  description = "Desired capacity"
  type        = number
  default     = 2
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
