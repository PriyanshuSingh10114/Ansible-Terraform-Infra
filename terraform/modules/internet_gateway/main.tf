resource "aws_internet_gateway" "this" {
  vpc_id = var.vpc_id

  tags = merge(
    {
      "Name"        = "${var.environment}-igw"
      "Environment" = var.environment
      "ManagedBy"   = "Terraform"
    },
    var.tags
  )
}
