variable "bucket_name" {
  description = "Name of the S3 bucket (must be globally unique)"
  type        = string

  validation {
    condition     = length(var.bucket_name) >= 3 && length(var.bucket_name) <= 63
    error_message = "The S3 bucket name must be between 3 and 63 characters long."
  }
}

variable "environment" {
  description = "Deployment environment name (e.g., dev, prod, bootstrap)"
  type        = string
}

variable "enable_versioning" {
  description = "Enable S3 bucket versioning"
  type        = bool
  default     = true
}

variable "force_destroy" {
  description = "Boolean option to force destroy all objects in the bucket upon deletion"
  type        = bool
  default     = false
}

variable "tags" {
  description = "A map of tags to assign to the S3 bucket resource"
  type        = map(string)
  default     = {}
}
