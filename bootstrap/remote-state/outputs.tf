output "remote_state_s3_bucket_id" {
  description = "The S3 Bucket ID for Terraform remote state"
  value       = module.remote_state_s3.bucket_id
}

output "remote_state_s3_bucket_arn" {
  description = "The S3 Bucket ARN for Terraform remote state"
  value       = module.remote_state_s3.bucket_arn
}
