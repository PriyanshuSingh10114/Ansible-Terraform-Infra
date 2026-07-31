output "launch_template_id" {
  description = "Launch Template ID"
  value       = aws_launch_template.this.id
}

output "launch_template_arn" {
  description = "Launch Template ARN"
  value       = aws_launch_template.this.arn
}

output "latest_version" {
  description = "Latest version of Launch Template"
  value       = aws_launch_template.this.latest_version
}
