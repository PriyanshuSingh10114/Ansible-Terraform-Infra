ubuntu@ip-172-31-3-226:~/Ansible-Terraform-Infra/terraform/environments/dev$ rm -f tfplan

terraform fmt
terraform validate
terraform plan -out=tfplan
Success! The configuration is valid.

data.aws_ami.ubuntu: Reading...
data.aws_ami.ubuntu: Read complete after 0s [id=ami-0aa761682283b4cc8]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # module.cloudwatch.aws_cloudwatch_log_group.app_logs will be created
  + resource "aws_cloudwatch_log_group" "app_logs" {
      + arn               = (known after apply)
      + id                = (known after apply)
      + log_group_class   = (known after apply)
      + name              = "/aws/ec2/dev-app-logs"
      + name_prefix       = (known after apply)
      + retention_in_days = 7
      + skip_destroy      = false
      + tags              = {
          + "Environment" = "dev"
          + "ManagedBy"   = "Terraform"
          + "Project"     = "aws-terraform-ansible-infra"
        }
      + tags_all          = {
          + "Environment" = "dev"
          + "ManagedBy"   = "Terraform"
          + "Project"     = "aws-terraform-ansible-infra"
        }
    }

  # module.cloudwatch.aws_cloudwatch_log_group.sys_logs will be created
  + resource "aws_cloudwatch_log_group" "sys_logs" {
      + arn               = (known after apply)
      + id                = (known after apply)
      + log_group_class   = (known after apply)
      + name              = "/aws/ec2/dev-system-logs"
      + name_prefix       = (known after apply)
      + retention_in_days = 7
      + skip_destroy      = false
      + tags              = {
          + "Environment" = "dev"
          + "ManagedBy"   = "Terraform"
          + "Project"     = "aws-terraform-ansible-infra"
        }
      + tags_all          = {
          + "Environment" = "dev"
          + "ManagedBy"   = "Terraform"
          + "Project"     = "aws-terraform-ansible-infra"
        }
    }

  # module.ec2.aws_eip.bastion will be created
  + resource "aws_eip" "bastion" {
      + allocation_id        = (known after apply)
      + arn                  = (known after apply)
      + association_id       = (known after apply)
      + carrier_ip           = (known after apply)
      + customer_owned_ip    = (known after apply)
      + domain               = "vpc"
      + id                   = (known after apply)
      + instance             = (known after apply)
      + ipam_pool_id         = (known after apply)
      + network_border_group = (known after apply)
      + network_interface    = (known after apply)
      + private_dns          = (known after apply)
      + private_ip           = (known after apply)
      + ptr_record           = (known after apply)
      + public_dns           = (known after apply)
      + public_ip            = (known after apply)
      + public_ipv4_pool     = (known after apply)
      + tags                 = {
          + "Environment" = "dev"
          + "ManagedBy"   = "Terraform"
          + "Name"        = "dev-bastion-eip"
          + "Project"     = "aws-terraform-ansible-infra"
        }
      + tags_all             = {
          + "Environment" = "dev"
          + "ManagedBy"   = "Terraform"
          + "Name"        = "dev-bastion-eip"
          + "Project"     = "aws-terraform-ansible-infra"
        }
      + vpc                  = (known after apply)
    }

  # module.ec2.aws_instance.bastion will be created
  + resource "aws_instance" "bastion" {
      + ami                                  = "ami-0aa761682283b4cc8"
      + arn                                  = (known after apply)
      + associate_public_ip_address          = (known after apply)
      + availability_zone                    = (known after apply)
      + cpu_core_count                       = (known after apply)
      + cpu_threads_per_core                 = (known after apply)
      + disable_api_stop                     = (known after apply)
      + disable_api_termination              = (known after apply)
      + ebs_optimized                        = (known after apply)
      + enable_primary_ipv6                  = (known after apply)
      + get_password_data                    = false
      + host_id                              = (known after apply)
      + host_resource_group_arn              = (known after apply)
      + iam_instance_profile                 = "dev-ec2-instance-profile"
      + id                                   = (known after apply)
      + instance_initiated_shutdown_behavior = (known after apply)
      + instance_lifecycle                   = (known after apply)
      + instance_state                       = (known after apply)
      + instance_type                        = "t3.micro"
      + ipv6_address_count                   = (known after apply)
      + ipv6_addresses                       = (known after apply)
      + key_name                             = "terraform-ansible-automation-infrastructure"
      + monitoring                           = (known after apply)
      + outpost_arn                          = (known after apply)
      + password_data                        = (known after apply)
      + placement_group                      = (known after apply)
      + placement_partition_number           = (known after apply)
      + primary_network_interface_id         = (known after apply)
      + private_dns                          = (known after apply)
      + private_ip                           = (known after apply)
      + public_dns                           = (known after apply)
      + public_ip                            = (known after apply)
      + secondary_private_ips                = (known after apply)
      + security_groups                      = (known after apply)
      + source_dest_check                    = true
      + spot_instance_request_id             = (known after apply)
      + subnet_id                            = (known after apply)
      + tags                                 = {
          + "Environment" = "dev"
          + "ManagedBy"   = "Terraform"
          + "Name"        = "dev-bastion-host"
          + "Project"     = "aws-terraform-ansible-infra"
        }
      + tags_all                             = {
          + "Environment" = "dev"
          + "ManagedBy"   = "Terraform"
          + "Name"        = "dev-bastion-host"
          + "Project"     = "aws-terraform-ansible-infra"
        }
      + tenancy                              = (known after apply)
      + user_data                            = (known after apply)
      + user_data_base64                     = (known after apply)
      + user_data_replace_on_change          = false
      + vpc_security_group_ids               = (known after apply)

      + capacity_reservation_specification (known after apply)

      + cpu_options (known after apply)

      + ebs_block_device (known after apply)

      + enclave_options (known after apply)

      + ephemeral_block_device (known after apply)

      + instance_market_options (known after apply)

      + maintenance_options (known after apply)

      + metadata_options {
          + http_endpoint               = "enabled"
          + http_protocol_ipv6          = "disabled"
          + http_put_response_hop_limit = 1
          + http_tokens                 = "required"
          + instance_metadata_tags      = (known after apply)
        }

      + network_interface (known after apply)

      + private_dns_name_options (known after apply)

      + root_block_device {
          + delete_on_termination = true
          + device_name           = (known after apply)
          + encrypted             = true
          + iops                  = (known after apply)
          + kms_key_id            = (known after apply)
          + tags_all              = (known after apply)
          + throughput            = (known after apply)
          + volume_id             = (known after apply)
          + volume_size           = 20
          + volume_type           = "gp3"
        }
    }

  # module.iam.aws_iam_instance_profile.ec2_profile will be created
  + resource "aws_iam_instance_profile" "ec2_profile" {
      + arn         = (known after apply)
      + create_date = (known after apply)
      + id          = (known after apply)
      + name        = "dev-ec2-instance-profile"
      + name_prefix = (known after apply)
      + path        = "/"
      + role        = "dev-ec2-role"
      + tags        = {
          + "Environment" = "dev"
          + "ManagedBy"   = "Terraform"
          + "Name"        = "dev-ec2-instance-profile"
          + "Project"     = "aws-terraform-ansible-infra"
        }
      + tags_all    = {
          + "Environment" = "dev"
          + "ManagedBy"   = "Terraform"
          + "Name"        = "dev-ec2-instance-profile"
          + "Project"     = "aws-terraform-ansible-infra"
        }
      + unique_id   = (known after apply)
    }

  # module.iam.aws_iam_policy.s3_access will be created
  + resource "aws_iam_policy" "s3_access" {
      + arn              = (known after apply)
      + attachment_count = (known after apply)
      + description      = "Allows access to application S3 bucket"
      + id               = (known after apply)
      + name             = "dev-s3-access-policy"
      + name_prefix      = (known after apply)
      + path             = "/"
      + policy           = (known after apply)
      + policy_id        = (known after apply)
      + tags_all         = {
          + "Environment" = "dev"
          + "ManagedBy"   = "Terraform"
          + "Project"     = "aws-terraform-ansible-infra"
        }
    }

  # module.iam.aws_iam_role.ec2_role will be created
  + resource "aws_iam_role" "ec2_role" {
      + arn                   = (known after apply)
      + assume_role_policy    = jsonencode(
            {
              + Statement = [
                  + {
                      + Action    = "sts:AssumeRole"
                      + Effect    = "Allow"
                      + Principal = {
                          + Service = "ec2.amazonaws.com"
                        }
                    },
                ]
              + Version   = "2012-10-17"
            }
        )
      + create_date           = (known after apply)
      + force_detach_policies = false
      + id                    = (known after apply)
      + managed_policy_arns   = (known after apply)
      + max_session_duration  = 3600
      + name                  = "dev-ec2-role"
      + name_prefix           = (known after apply)
      + path                  = "/"
      + tags                  = {
          + "Environment" = "dev"
          + "ManagedBy"   = "Terraform"
          + "Name"        = "dev-ec2-role"
          + "Project"     = "aws-terraform-ansible-infra"
        }
      + tags_all              = {
          + "Environment" = "dev"
          + "ManagedBy"   = "Terraform"
          + "Name"        = "dev-ec2-role"
          + "Project"     = "aws-terraform-ansible-infra"
        }
      + unique_id             = (known after apply)

      + inline_policy (known after apply)
    }

  # module.iam.aws_iam_role_policy_attachment.cloudwatch_agent will be created
  + resource "aws_iam_role_policy_attachment" "cloudwatch_agent" {
      + id         = (known after apply)
      + policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
      + role       = "dev-ec2-role"
    }

  # module.iam.aws_iam_role_policy_attachment.s3_access_attach will be created
  + resource "aws_iam_role_policy_attachment" "s3_access_attach" {
      + id         = (known after apply)
      + policy_arn = (known after apply)
      + role       = "dev-ec2-role"
    }

  # module.iam.aws_iam_role_policy_attachment.ssm_core will be created
  + resource "aws_iam_role_policy_attachment" "ssm_core" {
      + id         = (known after apply)
      + policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
      + role       = "dev-ec2-role"
    }

  # module.internet_gateway.aws_internet_gateway.this will be created
  + resource "aws_internet_gateway" "this" {
      + arn      = (known after apply)
      + id       = (known after apply)
      + owner_id = (known after apply)
      + tags     = {
          + "Environment" = "dev"
          + "ManagedBy"   = "Terraform"
          + "Name"        = "dev-igw"
          + "Project"     = "aws-terraform-ansible-infra"
        }
      + tags_all = {
          + "Environment" = "dev"
          + "ManagedBy"   = "Terraform"
          + "Name"        = "dev-igw"
          + "Project"     = "aws-terraform-ansible-infra"
        }
      + vpc_id   = (known after apply)
    }

  # module.route_tables.aws_route_table.public will be created
  + resource "aws_route_table" "public" {
      + arn              = (known after apply)
      + id               = (known after apply)
      + owner_id         = (known after apply)
      + propagating_vgws = (known after apply)
      + route            = [
          + {
              + cidr_block                 = "0.0.0.0/0"
              + gateway_id                 = (known after apply)
                # (11 unchanged attributes hidden)
            },
        ]
      + tags             = {
          + "Environment" = "dev"
          + "ManagedBy"   = "Terraform"
          + "Name"        = "dev-public-rt"
          + "Project"     = "aws-terraform-ansible-infra"
        }
      + tags_all         = {
          + "Environment" = "dev"
          + "ManagedBy"   = "Terraform"
          + "Name"        = "dev-public-rt"
          + "Project"     = "aws-terraform-ansible-infra"
        }
      + vpc_id           = (known after apply)
    }

  # module.route_tables.aws_route_table_association.public[0] will be created
  + resource "aws_route_table_association" "public" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # module.route_tables.aws_route_table_association.public[1] will be created
  + resource "aws_route_table_association" "public" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # module.s3.aws_s3_bucket.this will be created
  + resource "aws_s3_bucket" "this" {
      + acceleration_status         = (known after apply)
      + acl                         = (known after apply)
      + arn                         = (known after apply)
      + bucket                      = "aws-dev-app-assets-storage-unique-12345"
      + bucket_domain_name          = (known after apply)
      + bucket_prefix               = (known after apply)
      + bucket_regional_domain_name = (known after apply)
      + force_destroy               = false
      + hosted_zone_id              = (known after apply)
      + id                          = (known after apply)
      + object_lock_enabled         = (known after apply)
      + policy                      = (known after apply)
      + region                      = (known after apply)
      + request_payer               = (known after apply)
      + tags                        = {
          + "Environment" = "dev"
          + "ManagedBy"   = "Terraform"
          + "Name"        = "aws-dev-app-assets-storage-unique-12345"
          + "Project"     = "aws-terraform-ansible-infra"
        }
      + tags_all                    = {
          + "Environment" = "dev"
          + "ManagedBy"   = "Terraform"
          + "Name"        = "aws-dev-app-assets-storage-unique-12345"
          + "Project"     = "aws-terraform-ansible-infra"
        }
      + website_domain              = (known after apply)
      + website_endpoint            = (known after apply)

      + cors_rule (known after apply)

      + grant (known after apply)

      + lifecycle_rule (known after apply)

      + logging (known after apply)

      + object_lock_configuration (known after apply)

      + replication_configuration (known after apply)

      + server_side_encryption_configuration (known after apply)

      + versioning (known after apply)

      + website (known after apply)
    }

  # module.s3.aws_s3_bucket_public_access_block.this will be created
  + resource "aws_s3_bucket_public_access_block" "this" {
      + block_public_acls       = true
      + block_public_policy     = true
      + bucket                  = (known after apply)
      + id                      = (known after apply)
      + ignore_public_acls      = true
      + restrict_public_buckets = true
    }

  # module.s3.aws_s3_bucket_server_side_encryption_configuration.this will be created
  + resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
      + bucket = (known after apply)
      + id     = (known after apply)

      + rule {
          + apply_server_side_encryption_by_default {
              + sse_algorithm     = "AES256"
                # (1 unchanged attribute hidden)
            }
        }
    }

  # module.s3.aws_s3_bucket_versioning.this will be created
  + resource "aws_s3_bucket_versioning" "this" {
      + bucket = (known after apply)
      + id     = (known after apply)

      + versioning_configuration {
          + mfa_delete = (known after apply)
          + status     = "Enabled"
        }
    }

  # module.security_group.aws_security_group.ec2 will be created
  + resource "aws_security_group" "ec2" {
      + arn                    = (known after apply)
      + description            = "Security group for EC2 instance running App, Nginx, Prometheus, Grafana"
      + egress                 = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = "Allow all outbound traffic"
              + from_port        = 0
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "-1"
              + security_groups  = []
              + self             = false
              + to_port          = 0
            },
        ]
      + id                     = (known after apply)
      + ingress                = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = "Grafana Dashboard Ingress"
              + from_port        = 3001
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 3001
            },
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = "HTTP Ingress for Nginx Reverse Proxy"
              + from_port        = 80
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 80
            },
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = "Prometheus UI Ingress"
              + from_port        = 9090
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 9090
            },
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = "SSH Ingress"
              + from_port        = 22
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 22
            },
          + {
              + cidr_blocks      = [
                  + "10.0.0.0/16",
                ]
              + description      = "Node Exporter Metric Scraping"
              + from_port        = 9100
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 9100
            },
          + {
              + cidr_blocks      = [
                  + "10.0.0.0/16",
                ]
              + description      = "cAdvisor Metric Scraping"
              + from_port        = 8080
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 8080
            },
        ]
      + name                   = "dev-ec2-sg"
      + name_prefix            = (known after apply)
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags                   = {
          + "Environment" = "dev"
          + "ManagedBy"   = "Terraform"
          + "Name"        = "dev-ec2-sg"
          + "Project"     = "aws-terraform-ansible-infra"
        }
      + tags_all               = {
          + "Environment" = "dev"
          + "ManagedBy"   = "Terraform"
          + "Name"        = "dev-ec2-sg"
          + "Project"     = "aws-terraform-ansible-infra"
        }
      + vpc_id                 = (known after apply)
    }

  # module.subnets.aws_subnet.public[0] will be created
  + resource "aws_subnet" "public" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "ap-south-1a"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.0.1.0/24"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = true
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags                                           = {
          + "Environment" = "dev"
          + "ManagedBy"   = "Terraform"
          + "Name"        = "dev-public-subnet-1"
          + "Project"     = "aws-terraform-ansible-infra"
          + "Type"        = "Public"
        }
      + tags_all                                       = {
          + "Environment" = "dev"
          + "ManagedBy"   = "Terraform"
          + "Name"        = "dev-public-subnet-1"
          + "Project"     = "aws-terraform-ansible-infra"
          + "Type"        = "Public"
        }
      + vpc_id                                         = (known after apply)
    }

  # module.subnets.aws_subnet.public[1] will be created
  + resource "aws_subnet" "public" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "ap-south-1b"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.0.2.0/24"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = true
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags                                           = {
          + "Environment" = "dev"
          + "ManagedBy"   = "Terraform"
          + "Name"        = "dev-public-subnet-2"
          + "Project"     = "aws-terraform-ansible-infra"
          + "Type"        = "Public"
        }
      + tags_all                                       = {
          + "Environment" = "dev"
          + "ManagedBy"   = "Terraform"
          + "Name"        = "dev-public-subnet-2"
          + "Project"     = "aws-terraform-ansible-infra"
          + "Type"        = "Public"
        }
      + vpc_id                                         = (known after apply)
    }

  # module.vpc.aws_vpc.this will be created
  + resource "aws_vpc" "this" {
      + arn                                  = (known after apply)
      + cidr_block                           = "10.0.0.0/16"
      + default_network_acl_id               = (known after apply)
      + default_route_table_id               = (known after apply)
      + default_security_group_id            = (known after apply)
      + dhcp_options_id                      = (known after apply)
      + enable_dns_hostnames                 = true
      + enable_dns_support                   = true
      + enable_network_address_usage_metrics = (known after apply)
      + id                                   = (known after apply)
      + instance_tenancy                     = "default"
      + ipv6_association_id                  = (known after apply)
      + ipv6_cidr_block                      = (known after apply)
      + ipv6_cidr_block_network_border_group = (known after apply)
      + main_route_table_id                  = (known after apply)
      + owner_id                             = (known after apply)
      + tags                                 = {
          + "Environment" = "dev"
          + "ManagedBy"   = "Terraform"
          + "Name"        = "dev-vpc"
          + "Project"     = "aws-terraform-ansible-infra"
        }
      + tags_all                             = {
          + "Environment" = "dev"
          + "ManagedBy"   = "Terraform"
          + "Name"        = "dev-vpc"
          + "Project"     = "aws-terraform-ansible-infra"
        }
    }

Plan: 22 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + cloudwatch_system_log_group = "/aws/ec2/dev-system-logs"
  + ec2_instance_id             = (known after apply)
  + ec2_public_ip               = (known after apply)
  + public_subnet_ids           = [
      + (known after apply),
      + (known after apply),
    ]
  + s3_bucket_name              = (known after apply)
  + vpc_id                      = (known after apply)

─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Saved the plan to: tfplan

To perform exactly these actions, run the following command to apply:
    terraform apply "tfplan"
ubuntu@ip-172-31-3-226:~/Ansible-Terraform-Infra/terraform/environments/dev$ terraform show -no-color tfplan | grep -E 'instance_type|key_name|availability_zone'
      + availability_zone                    = (known after apply)
      + instance_type                        = "t3.micro"
      + key_name                             = "terraform-ansible-automation-infrastructure"
      + availability_zone                              = "ap-south-1a"
      + availability_zone_id                           = (known after apply)
      + availability_zone                              = "ap-south-1b"
      + availability_zone_id                           = (known after apply)
ubuntu@ip-172-31-3-226:~/Ansible-Terraform-Infra/terraform/environments/dev$ terraform apply "tfplan"
module.vpc.aws_vpc.this: Creating...
module.cloudwatch.aws_cloudwatch_log_group.sys_logs: Creating...
module.iam.aws_iam_role.ec2_role: Creating...
module.s3.aws_s3_bucket.this: Creating...
module.cloudwatch.aws_cloudwatch_log_group.app_logs: Creating...
module.cloudwatch.aws_cloudwatch_log_group.sys_logs: Creation complete after 0s [id=/aws/ec2/dev-system-logs]
module.cloudwatch.aws_cloudwatch_log_group.app_logs: Creation complete after 0s [id=/aws/ec2/dev-app-logs]
module.s3.aws_s3_bucket.this: Creation complete after 2s [id=aws-dev-app-assets-storage-unique-12345]
module.s3.aws_s3_bucket_server_side_encryption_configuration.this: Creating...
module.s3.aws_s3_bucket_public_access_block.this: Creating...
module.iam.aws_iam_policy.s3_access: Creating...
module.s3.aws_s3_bucket_versioning.this: Creating...
module.iam.aws_iam_role.ec2_role: Creation complete after 2s [id=dev-ec2-role]
module.iam.aws_iam_role_policy_attachment.cloudwatch_agent: Creating...
module.iam.aws_iam_role_policy_attachment.ssm_core: Creating...
module.iam.aws_iam_instance_profile.ec2_profile: Creating...
module.s3.aws_s3_bucket_public_access_block.this: Creation complete after 0s [id=aws-dev-app-assets-storage-unique-12345]
module.s3.aws_s3_bucket_server_side_encryption_configuration.this: Creation complete after 0s [id=aws-dev-app-assets-storage-unique-12345]
module.iam.aws_iam_policy.s3_access: Creation complete after 1s [id=arn:aws:iam::383234049116:policy/dev-s3-access-policy]
module.iam.aws_iam_role_policy_attachment.s3_access_attach: Creating...
module.iam.aws_iam_role_policy_attachment.cloudwatch_agent: Creation complete after 1s [id=dev-ec2-role-20260801091440374900000001]
module.iam.aws_iam_role_policy_attachment.ssm_core: Creation complete after 1s [id=dev-ec2-role-20260801091440410300000002]
module.iam.aws_iam_role_policy_attachment.s3_access_attach: Creation complete after 0s [id=dev-ec2-role-20260801091440821300000003]
module.s3.aws_s3_bucket_versioning.this: Creation complete after 1s [id=aws-dev-app-assets-storage-unique-12345]
module.iam.aws_iam_instance_profile.ec2_profile: Creation complete after 7s [id=dev-ec2-instance-profile]
module.vpc.aws_vpc.this: Still creating... [00m10s elapsed]
module.vpc.aws_vpc.this: Creation complete after 11s [id=vpc-02bbd8bdd83126d09]
module.security_group.aws_security_group.ec2: Creating...
module.subnets.aws_subnet.public[1]: Creating...
module.subnets.aws_subnet.public[0]: Creating...
module.internet_gateway.aws_internet_gateway.this: Creating...
module.internet_gateway.aws_internet_gateway.this: Creation complete after 1s [id=igw-0cedbdc6da4e0cb9b]
module.route_tables.aws_route_table.public: Creating...
module.route_tables.aws_route_table.public: Creation complete after 0s [id=rtb-0986b4e0100eb322f]
module.security_group.aws_security_group.ec2: Creation complete after 2s [id=sg-0fec03b485702c34d]
module.subnets.aws_subnet.public[1]: Still creating... [00m10s elapsed]
module.subnets.aws_subnet.public[0]: Still creating... [00m10s elapsed]
module.subnets.aws_subnet.public[1]: Creation complete after 11s [id=subnet-0464e9ef42b415ae6]
module.subnets.aws_subnet.public[0]: Creation complete after 14s [id=subnet-0437bd180a210fbc0]
module.route_tables.aws_route_table_association.public[0]: Creating...
module.ec2.aws_instance.bastion: Creating...
module.route_tables.aws_route_table_association.public[1]: Creating...
module.route_tables.aws_route_table_association.public[1]: Creation complete after 0s [id=rtbassoc-0133e428f2035a787]
module.route_tables.aws_route_table_association.public[0]: Creation complete after 0s [id=rtbassoc-0d2ce7b7e93ec7964]
module.ec2.aws_instance.bastion: Still creating... [00m10s elapsed]
module.ec2.aws_instance.bastion: Creation complete after 12s [id=i-0a4e5c0ffbd790910]
module.ec2.aws_eip.bastion: Creating...
module.ec2.aws_eip.bastion: Creation complete after 2s [id=eipalloc-03fd89d43aa4ea0cb]

Apply complete! Resources: 22 added, 0 changed, 0 destroyed.

Outputs:

cloudwatch_system_log_group = "/aws/ec2/dev-system-logs"
ec2_instance_id = "i-0a4e5c0ffbd790910"
ec2_public_ip = "13.205.92.122"
public_subnet_ids = [
  "subnet-0437bd180a210fbc0",
  "subnet-0464e9ef42b415ae6",
]
s3_bucket_name = "aws-dev-app-assets-storage-unique-12345"
vpc_id = "vpc-02bbd8bdd83126d09"
ubuntu@ip-172-31-3-226:~/Ansible-Terraform-Infra/terraform/environments/dev$ terraform output
terraform state list
cloudwatch_system_log_group = "/aws/ec2/dev-system-logs"
ec2_instance_id = "i-0a4e5c0ffbd790910"
ec2_public_ip = "13.205.92.122"
public_subnet_ids = [
  "subnet-0437bd180a210fbc0",
  "subnet-0464e9ef42b415ae6",
]
s3_bucket_name = "aws-dev-app-assets-storage-unique-12345"
vpc_id = "vpc-02bbd8bdd83126d09"
data.aws_ami.ubuntu
module.cloudwatch.aws_cloudwatch_log_group.app_logs
module.cloudwatch.aws_cloudwatch_log_group.sys_logs
module.ec2.aws_eip.bastion
module.ec2.aws_instance.bastion
module.iam.aws_iam_instance_profile.ec2_profile
module.iam.aws_iam_policy.s3_access
module.iam.aws_iam_role.ec2_role
module.iam.aws_iam_role_policy_attachment.cloudwatch_agent
module.iam.aws_iam_role_policy_attachment.s3_access_attach
module.iam.aws_iam_role_policy_attachment.ssm_core
module.internet_gateway.aws_internet_gateway.this
module.route_tables.aws_route_table.public
module.route_tables.aws_route_table_association.public[0]
module.route_tables.aws_route_table_association.public[1]
module.s3.aws_s3_bucket.this
module.s3.aws_s3_bucket_public_access_block.this
module.s3.aws_s3_bucket_server_side_encryption_configuration.this
module.s3.aws_s3_bucket_versioning.this
module.security_group.aws_security_group.ec2
module.subnets.aws_subnet.public[0]
module.subnets.aws_subnet.public[1]
module.vpc.aws_vpc.this
ubuntu@ip-172-31-3-226:~/Ansible-Terraform-Infra/terraform/environments/dev$ aws ec2 describe-instances \
  --region ap-south-1 \
  --filters "Name=tag:Environment,Values=dev" \
  --query 'Reservations[].Instances[].{ID:InstanceId,State:State.Name,IP:PublicIpAddress,Type:InstanceType}' \
  --output table
-----------------------------------------------------------------
|                       DescribeInstances                       |
+----------------------+-----------------+----------+-----------+
|          ID          |       IP        |  State   |   Type    |
+----------------------+-----------------+----------+-----------+
|  i-0a4e5c0ffbd790910 |  13.205.92.122  |  running |  t3.micro |
+----------------------+-----------------+----------+-----------+
ubuntu@ip-172-31-3-226:~/Ansible-Terraform-Infra/terraform/environments/dev$ cd ~/Ansible-Terraform-Infra/terraform/environments/dev

terraform output ec2_public_ip
"13.205.92.122"
ubuntu@ip-172-31-3-226:~/Ansible-Terraform-Infra/terraform/environments/dev$