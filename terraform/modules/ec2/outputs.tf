output "instance_id" {
  description = "EC2 Instance ID"
  value       = aws_instance.bastion.id
}

output "public_ip" {
  description = "Elastic IP attached to EC2 instance"
  value       = aws_eip.bastion.public_ip
}

output "private_ip" {
  description = "Private IP address of EC2 instance"
  value       = aws_instance.bastion.private_ip
}
