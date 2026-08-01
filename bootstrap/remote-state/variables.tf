variable "aws_region" {
  description = "AWS region used for Terraform remote state"
  type        = string
  default     = "ap-south-1"
}

variable "state_bucket_name" {
  description = "Globally unique S3 bucket for Terraform remote state"
  type        = string
  default     = "aws-infra-remote-tfstate-bucket-unique"
}
