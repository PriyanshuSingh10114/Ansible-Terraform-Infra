output "ec2_iam_role_name" {
  description = "Name of EC2 IAM Role"
  value       = aws_iam_role.ec2_role.name
}

output "ec2_iam_role_arn" {
  description = "ARN of EC2 IAM Role"
  value       = aws_iam_role.ec2_role.arn
}

output "ec2_instance_profile_name" {
  description = "Name of EC2 Instance Profile"
  value       = aws_iam_instance_profile.ec2_profile.name
}

output "ec2_instance_profile_arn" {
  description = "ARN of EC2 Instance Profile"
  value       = aws_iam_instance_profile.ec2_profile.arn
}
