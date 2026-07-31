# Terraform S3 Remote State Backend Configuration
# Fill in your bucket, key, region, and dynamodb_table when initializing state
# Usage: terraform init -backend-config="bucket=my-tf-state-bucket" -backend-config="key=dev/terraform.tfstate" -backend-config="region=us-east-1" -backend-config="dynamodb_table=my-tf-locks"

terraform {
  backend "s3" {
    bucket         = "aws-infra-dev-tfstate-bucket"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "aws-infra-dev-tflocks"
    encrypt        = true
  }
}
