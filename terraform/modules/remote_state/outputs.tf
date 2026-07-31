output "s3_bucket_id" {
  description = "Remote state S3 bucket name"
  value       = aws_s3_bucket.state.id
}

output "s3_bucket_arn" {
  description = "Remote state S3 bucket ARN"
  value       = aws_s3_bucket.state.arn
}

output "dynamodb_table_name" {
  description = "DynamoDB lock table name"
  value       = aws_dynamodb_table.locks.name
}

output "dynamodb_table_arn" {
  description = "DynamoDB lock table ARN"
  value       = aws_dynamodb_table.locks.arn
}
