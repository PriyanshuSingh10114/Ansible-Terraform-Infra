terraform {
  backend "s3" {
    bucket         = "aws-infra-prod-tfstate-bucket"
    key            = "prod/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "aws-infra-prod-tflocks"
    encrypt        = true
  }
}
