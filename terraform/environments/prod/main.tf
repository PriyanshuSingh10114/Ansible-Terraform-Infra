# 1. VPC Module
module "vpc" {
  source               = "../../modules/vpc"
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
  environment          = var.environment
  tags                 = local.common_tags
}

# 2. Subnets Module (Public Subnet)
module "subnets" {
  source               = "../../modules/subnets"
  vpc_id               = module.vpc.vpc_id
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = []
  availability_zones   = var.availability_zones
  environment          = var.environment
  tags                 = local.common_tags
}

# 3. Internet Gateway Module
module "internet_gateway" {
  source      = "../../modules/internet_gateway"
  vpc_id      = module.vpc.vpc_id
  environment = var.environment
  tags        = local.common_tags
}

# 4. Route Tables Module
module "route_tables" {
  source             = "../../modules/route_tables"
  vpc_id             = module.vpc.vpc_id
  igw_id             = module.internet_gateway.igw_id
  nat_gateway_ids    = []
  public_subnet_ids  = module.subnets.public_subnet_ids
  private_subnet_ids = []
  single_nat_gateway = false
  environment        = var.environment
  tags               = local.common_tags
}

# 5. Security Group Module
module "security_group" {
  source      = "../../modules/security_group"
  vpc_id      = module.vpc.vpc_id
  environment = var.environment
  tags        = local.common_tags
}

# 6. IAM Role & Instance Profile Module
module "iam" {
  source      = "../../modules/iam"
  environment = var.environment
  tags        = local.common_tags
}

# 7. S3 Bucket Module
module "s3" {
  source            = "../../modules/s3"
  bucket_name       = var.app_bucket_name
  environment       = var.environment
  enable_versioning = true
  tags              = local.common_tags
}

# 8. Base EC2 Instance Module (Runs App + Docker + Nginx + Prometheus + Grafana)
module "ec2" {
  source               = "../../modules/ec2"
  ami_id               = var.ami_id
  instance_type        = "t3.micro"
  subnet_id            = module.subnets.public_subnet_ids[0]
  security_group_ids   = [module.security_group.ec2_security_group_id]
  key_name             = var.ssh_key_name
  iam_instance_profile = module.iam.ec2_instance_profile_name
  environment          = var.environment
  tags                 = local.common_tags
}

# 9. CloudWatch Log Group Module
module "cloudwatch" {
  source            = "../../modules/cloudwatch"
  environment       = var.environment
  retention_in_days = 30
  tags              = local.common_tags
}
