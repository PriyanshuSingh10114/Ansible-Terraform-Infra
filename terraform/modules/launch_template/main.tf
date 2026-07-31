resource "aws_launch_template" "this" {
  name_prefix   = "${var.environment}-launch-template-"
  image_id      = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  network_interfaces {
    associate_public_ip_address = false
    security_groups             = var.security_group_ids
  }

  iam_instance_profile {
    name = var.iam_instance_profile_name
  }

  user_data = var.user_data

  block_device_mappings {
    device_name = "/dev/xvda"
    ebs {
      volume_size           = 20
      volume_type           = "gp3"
      encrypted             = true
      delete_on_termination = true
    }
  }

  monitoring {
    enabled = true
  }

  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required" # IMDSv2 enforcement
    http_put_response_hop_limit = 1
  }

  tag_specifications {
    resource_type = "instance"
    tags = merge(
      {
        "Name"        = "${var.environment}-web-instance"
        "Environment" = var.environment
        "ManagedBy"   = "Terraform"
      },
      var.tags
    )
  }

  lifecycle {
    create_before_destroy = true
  }
}
