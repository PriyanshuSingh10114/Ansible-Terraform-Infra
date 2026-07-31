resource "aws_db_subnet_group" "this" {
  name       = "${var.environment}-db-subnet-group"
  subnet_ids = var.private_subnet_ids

  tags = merge(
    {
      "Name"        = "${var.environment}-db-subnet-group"
      "Environment" = var.environment
      "ManagedBy"   = "Terraform"
    },
    var.tags
  )
}

resource "aws_db_parameter_group" "this" {
  name   = "${var.environment}-pg15-params"
  family = "postgres15"

  parameter {
    name  = "log_connections"
    value = "1"
  }

  parameter {
    name  = "log_disconnections"
    value = "1"
  }

  tags = merge(
    {
      "Environment" = var.environment
      "ManagedBy"   = "Terraform"
    },
    var.tags
  )
}

resource "aws_db_instance" "this" {
  identifier             = "${var.environment}-postgres-db"
  allocated_storage      = var.allocated_storage
  max_allocated_storage  = var.max_allocated_storage
  engine                 = "postgres"
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  db_name                = var.db_name
  username               = var.username
  password               = var.password
  db_subnet_group_name   = aws_db_subnet_group.this.name
  vpc_security_group_ids = var.vpc_security_group_ids
  parameter_group_name   = aws_db_parameter_group.this.name
  multi_az               = var.multi_az
  skip_final_snapshot    = var.environment == "dev" ? true : false
  final_snapshot_identifier = var.environment == "prod" ? "${var.environment}-postgres-final-snapshot" : null
  storage_encrypted      = true
  deletion_protection    = var.environment == "prod" ? true : false

  tags = merge(
    {
      "Name"        = "${var.environment}-postgres-db"
      "Environment" = var.environment
      "ManagedBy"   = "Terraform"
    },
    var.tags
  )
}
