variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "igw_id" {
  description = "Internet Gateway ID for public route table"
  type        = string
}

variable "nat_gateway_ids" {
  description = "List of NAT Gateway IDs for private route tables"
  type        = list(string)
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs to associate"
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs to associate"
  type        = list(string)
}

variable "single_nat_gateway" {
  description = "Whether single NAT Gateway is used"
  type        = bool
  default     = false
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
