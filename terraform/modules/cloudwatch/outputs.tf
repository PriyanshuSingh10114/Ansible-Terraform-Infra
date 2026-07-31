output "app_log_group_name" {
  description = "Application CloudWatch Log Group name"
  value       = aws_cloudwatch_log_group.app_logs.name
}

output "system_log_group_name" {
  description = "System CloudWatch Log Group name"
  value       = aws_cloudwatch_log_group.sys_logs.name
}

output "high_cpu_alarm_arn" {
  description = "High CPU Alarm ARN"
  value       = length(aws_cloudwatch_metric_alarm.high_cpu) > 0 ? aws_cloudwatch_metric_alarm.high_cpu[0].arn : null
}
