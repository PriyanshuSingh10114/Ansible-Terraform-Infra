output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "Public Subnet IDs"
  value       = module.subnets.public_subnet_ids
}

output "ec2_public_ip" {
  description = "EC2 Instance Public Elastic IP"
  value       = module.ec2.public_ip
}

output "ec2_instance_id" {
  description = "EC2 Instance ID"
  value       = module.ec2.instance_id
}

output "s3_bucket_name" {
  description = "Application S3 Storage Bucket"
  value       = module.s3.bucket_id
}

output "cloudwatch_system_log_group" {
  description = "CloudWatch System Log Group Name"
  value       = module.cloudwatch.system_log_group_name
}
