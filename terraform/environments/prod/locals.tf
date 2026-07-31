locals {
  name_prefix = "${var.environment}-infra"

  common_tags = {
    Environment = var.environment
    ManagedBy   = "Terraform"
    Project     = "aws-terraform-ansible-infra"
  }
}
