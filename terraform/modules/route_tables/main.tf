# Public Route Table
resource "aws_route_table" "public" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.igw_id
  }

  tags = merge(
    {
      "Name"        = "${var.environment}-public-rt"
      "Environment" = var.environment
      "ManagedBy"   = "Terraform"
    },
    var.tags
  )
}

resource "aws_route_table_association" "public" {
  count          = length(var.public_subnet_ids)
  subnet_id      = var.public_subnet_ids[count.index]
  route_table_id = aws_route_table.public.id
}

# Private Route Tables (Evaluated safely when private subnets exist)
resource "aws_route_table" "private" {
  count  = length(var.private_subnet_ids) > 0 ? (var.single_nat_gateway ? 1 : length(var.private_subnet_ids)) : 0
  vpc_id = var.vpc_id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = var.single_nat_gateway ? var.nat_gateway_ids[0] : var.nat_gateway_ids[count.index]
  }

  tags = merge(
    {
      "Name"        = "${var.environment}-private-rt-${count.index + 1}"
      "Environment" = var.environment
      "ManagedBy"   = "Terraform"
    },
    var.tags
  )
}

resource "aws_route_table_association" "private" {
  count          = length(var.private_subnet_ids)
  subnet_id      = var.private_subnet_ids[count.index]
  route_table_id = var.single_nat_gateway ? aws_route_table.private[0].id : aws_route_table.private[count.index].id
}
