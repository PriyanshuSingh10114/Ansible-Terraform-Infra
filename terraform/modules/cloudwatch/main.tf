resource "aws_cloudwatch_log_group" "app_logs" {
  name              = "/aws/ec2/${var.environment}-app-logs"
  retention_in_days = var.retention_in_days

  tags = merge(
    {
      "Environment" = var.environment
      "ManagedBy"   = "Terraform"
    },
    var.tags
  )
}

resource "aws_cloudwatch_log_group" "sys_logs" {
  name              = "/aws/ec2/${var.environment}-system-logs"
  retention_in_days = var.retention_in_days

  tags = merge(
    {
      "Environment" = var.environment
      "ManagedBy"   = "Terraform"
    },
    var.tags
  )
}

resource "aws_cloudwatch_metric_alarm" "high_cpu" {
  count               = var.asg_name != null ? 1 : 0
  alarm_name          = "${var.environment}-high-cpu-alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 120
  statistic           = "Average"
  threshold           = 85.0
  alarm_description   = "This alarm monitors high CPU utilization across ASG"

  dimensions = {
    AutoScalingGroupName = var.asg_name
  }

  tags = merge(
    {
      "Environment" = var.environment
      "ManagedBy"   = "Terraform"
    },
    var.tags
  )
}
