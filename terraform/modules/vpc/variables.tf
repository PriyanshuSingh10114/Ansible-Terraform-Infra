variable "cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "enable_dns_hostnames" {
  description = "A feature flag to enable/disable DNS hostnames in the VPC"
  type        = bool
  default     = true
}

variable "enable_dns_support" {
  description = "A feature flag to enable/disable DNS support in the VPC"
  type        = bool
  default     = true
}

variable "environment" {
  description = "Deployment environment name (e.g. dev, prod)"
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the VPC resource"
  type        = map(string)
  default     = {}
}
