module "remote_state_s3" {
  source            = "../../terraform/modules/s3"
  bucket_name       = var.state_bucket_name
  environment       = "bootstrap"
  enable_versioning = true
  force_destroy     = false

  tags = {
    Purpose   = "TerraformRemoteStateStorage"
    ManagedBy = "TerraformBootstrap"
  }
}
