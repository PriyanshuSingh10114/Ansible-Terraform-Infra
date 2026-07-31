variable "ami_id" {
  description = "The AMI ID to use for the EC2 instance"
  type        = string

  validation {
    condition     = can(regex("^ami-[0-9a-f]{8,17}$", var.ami_id))
    error_message = "The ami_id variable must be a valid AWS AMI ID string starting with 'ami-'."
  }
}

variable "instance_type" {
  description = "The EC2 instance type (e.g. t3.micro)"
  type        = string
  default     = "t3.micro"
}

variable "subnet_id" {
  description = "The Subnet ID where the EC2 instance will be launched"
  type        = string
}

variable "security_group_ids" {
  description = "List of Security Group IDs to associate with the EC2 instance"
  type        = list(string)
}

variable "key_name" {
  description = "Optional SSH key pair name for access"
  type        = string
  default     = null
}

variable "iam_instance_profile" {
  description = "Optional IAM instance profile name to attach to the instance"
  type        = string
  default     = null
}

variable "environment" {
  description = "Deployment environment name (e.g., dev, prod)"
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the EC2 instance resources"
  type        = map(string)
  default     = {}
}
