resource "aws_eip" "nat" {
  count  = var.single_nat_gateway ? 1 : length(var.public_subnet_ids)
  domain = "vpc"

  tags = merge(
    {
      "Name"        = "${var.environment}-nat-eip-${count.index + 1}"
      "Environment" = var.environment
      "ManagedBy"   = "Terraform"
    },
    var.tags
  )
}

resource "aws_nat_gateway" "this" {
  count         = var.single_nat_gateway ? 1 : length(var.public_subnet_ids)
  allocation_id = aws_eip.nat[count.index].id
  subnet_id     = var.public_subnet_ids[count.index]

  tags = merge(
    {
      "Name"        = "${var.environment}-nat-gw-${count.index + 1}"
      "Environment" = var.environment
      "ManagedBy"   = "Terraform"
    },
    var.tags
  )
}
