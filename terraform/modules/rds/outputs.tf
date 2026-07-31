output "endpoint" {
  description = "Connection endpoint for the RDS PostgreSQL database"
  value       = aws_db_instance.this.endpoint
}

output "address" {
  description = "Hostname address of the RDS database"
  value       = aws_db_instance.this.address
}

output "port" {
  description = "Port of the RDS database"
  value       = aws_db_instance.this.port
}

output "db_name" {
  description = "Database name"
  value       = aws_db_instance.this.db_name
}

output "db_instance_id" {
  description = "Database instance ID"
  value       = aws_db_instance.this.id
}
