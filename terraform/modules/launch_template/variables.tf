variable "ami_id" {
  description = "AMI ID for EC2 launch template"
  type        = string
}

variable "instance_type" {
  description = "EC2 Instance type"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "SSH Key Pair name"
  type        = string
  default     = null
}

variable "security_group_ids" {
  description = "List of security group IDs"
  type        = list(string)
}

variable "iam_instance_profile_name" {
  description = "IAM instance profile name"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "user_data" {
  description = "Base64 encoded bootstrap script"
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags map"
  type        = map(string)
  default     = {}
}
