variable "bucket_name" {
  description = "Globally unique S3 bucket name for state storage"
  type        = string
}

variable "table_name" {
  description = "DynamoDB table name for state locking"
  type        = string
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
