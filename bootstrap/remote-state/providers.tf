provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Environment = "bootstrap"
      Project     = "aws-terraform-ansible-infra"
      ManagedBy   = "Terraform"
    }
  }
}
