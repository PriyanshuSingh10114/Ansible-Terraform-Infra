variable "db_name" {
  description = "Database name"
  type        = string
  default     = "appdb"
}

variable "username" {
  description = "Master database username"
  type        = string
  default     = "dbadmin"
}

variable "password" {
  description = "Master database password"
  type        = string
  sensitive   = true
}

variable "allocated_storage" {
  description = "Allocated storage in GB"
  type        = number
  default     = 20
}

variable "max_allocated_storage" {
  description = "Maximum storage auto-scaling threshold in GB"
  type        = number
  default     = 100
}

variable "instance_class" {
  description = "RDS instance size class"
  type        = string
  default     = "db.t3.micro"
}

variable "engine_version" {
  description = "PostgreSQL engine version"
  type        = string
  default     = "15.4"
}

variable "private_subnet_ids" {
  description = "List of private subnets for DB subnet group"
  type        = list(string)
}

variable "vpc_security_group_ids" {
  description = "Security group IDs for RDS"
  type        = list(string)
}

variable "multi_az" {
  description = "Enable Multi-AZ deployment"
  type        = bool
  default     = false
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "tags" {
  description = "Tags map"
  type        = map(string)
  default     = {}
}
