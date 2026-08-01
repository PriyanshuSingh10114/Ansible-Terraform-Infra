# Terraform S3 Remote State Backend Configuration for Production
# Uses S3 native S3 lockfiles (use_lockfile = true) available in Terraform 1.10+ & S3 backends without DynamoDB

terraform {
  backend "s3" {
    bucket       = "priyanshu-ansible-terraform-tfstate-2026"
    key          = "prod/terraform.tfstate"
    region       = "ap-south-1"
    encrypt      = true
    use_lockfile = true
  }
}
