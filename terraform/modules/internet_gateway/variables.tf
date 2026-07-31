variable "vpc_id" {
  description = "The VPC ID to attach the Internet Gateway"
  type        = string
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
