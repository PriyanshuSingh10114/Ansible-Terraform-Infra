variable "aws_region" {
  description = "AWS Region for bootstrapping remote state"
  type        = string
  default     = "ap-south-1"
}

variable "state_bucket_name" {
  description = "Globally unique S3 bucket name for storing Terraform remote state"
  type        = string
  default     = "aws-infra-remote-tfstate-bucket-unique"
}
