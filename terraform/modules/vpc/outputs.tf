output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.this.id
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = aws_vpc.this.cidr_block
}

output "arn" {
  description = "Amazon Resource Name (ARN) of VPC"
  value       = aws_vpc.this.arn
}
