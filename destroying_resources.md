ubuntu@ip-172-31-3-226:~/Ansible-Terraform-Infra/terraform/environments/dev$ cd ~/Ansible-Terraform-Infra/terraform/environments/dev

terraform plan -destroy
module.cloudwatch.aws_cloudwatch_log_group.sys_logs: Refreshing state... [id=/aws/ec2/dev-system-logs]
module.vpc.aws_vpc.this: Refreshing state... [id=vpc-02bbd8bdd83126d09]
data.aws_ami.ubuntu: Reading...
module.iam.aws_iam_role.ec2_role: Refreshing state... [id=dev-ec2-role]
module.cloudwatch.aws_cloudwatch_log_group.app_logs: Refreshing state... [id=/aws/ec2/dev-app-logs]
module.s3.aws_s3_bucket.this: Refreshing state... [id=aws-dev-app-assets-storage-unique-12345]
module.s3.aws_s3_bucket_public_access_block.this: Refreshing state... [id=aws-dev-app-assets-storage-unique-12345]
data.aws_ami.ubuntu: Read complete after 0s [id=ami-0aa761682283b4cc8]
module.s3.aws_s3_bucket_versioning.this: Refreshing state... [id=aws-dev-app-assets-storage-unique-12345]
module.iam.aws_iam_policy.s3_access: Refreshing state... [id=arn:aws:iam::383234049116:policy/dev-s3-access-policy]
module.s3.aws_s3_bucket_server_side_encryption_configuration.this: Refreshing state... [id=aws-dev-app-assets-storage-unique-12345]
module.security_group.aws_security_group.ec2: Refreshing state... [id=sg-0fec03b485702c34d]
module.subnets.aws_subnet.public[0]: Refreshing state... [id=subnet-0437bd180a210fbc0]
module.subnets.aws_subnet.public[1]: Refreshing state... [id=subnet-0464e9ef42b415ae6]
module.internet_gateway.aws_internet_gateway.this: Refreshing state... [id=igw-0cedbdc6da4e0cb9b]
module.route_tables.aws_route_table.public: Refreshing state... [id=rtb-0986b4e0100eb322f]
module.route_tables.aws_route_table_association.public[0]: Refreshing state... [id=rtbassoc-0d2ce7b7e93ec7964]
module.route_tables.aws_route_table_association.public[1]: Refreshing state... [id=rtbassoc-0133e428f2035a787]
module.iam.aws_iam_instance_profile.ec2_profile: Refreshing state... [id=dev-ec2-instance-profile]
module.iam.aws_iam_role_policy_attachment.s3_access_attach: Refreshing state... [id=dev-ec2-role-20260801091440821300000003]
module.iam.aws_iam_role_policy_attachment.ssm_core: Refreshing state... [id=dev-ec2-role-20260801091440410300000002]
module.iam.aws_iam_role_policy_attachment.cloudwatch_agent: Refreshing state... [id=dev-ec2-role-20260801091440374900000001]
module.ec2.aws_instance.bastion: Refreshing state... [id=i-0a4e5c0ffbd790910]
module.ec2.aws_eip.bastion: Refreshing state... [id=eipalloc-03fd89d43aa4ea0cb]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # module.cloudwatch.aws_cloudwatch_log_group.app_logs will be destroyed
  - resource "aws_cloudwatch_log_group" "app_logs" {
      - arn               = "arn:aws:logs:ap-south-1:383234049116:log-group:/aws/ec2/dev-app-logs" -> null
      - id                = "/aws/ec2/dev-app-logs" -> null
      - log_group_class   = "STANDARD" -> null
      - name              = "/aws/ec2/dev-app-logs" -> null
      - retention_in_days = 7 -> null
      - skip_destroy      = false -> null
      - tags              = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Project"     = "aws-terraform-ansible-infra"
        } -> null
      - tags_all          = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Project"     = "aws-terraform-ansible-infra"
        } -> null
        # (2 unchanged attributes hidden)
    }

  # module.cloudwatch.aws_cloudwatch_log_group.sys_logs will be destroyed
  - resource "aws_cloudwatch_log_group" "sys_logs" {
      - arn               = "arn:aws:logs:ap-south-1:383234049116:log-group:/aws/ec2/dev-system-logs" -> null
      - id                = "/aws/ec2/dev-system-logs" -> null
      - log_group_class   = "STANDARD" -> null
      - name              = "/aws/ec2/dev-system-logs" -> null
      - retention_in_days = 7 -> null
      - skip_destroy      = false -> null
      - tags              = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Project"     = "aws-terraform-ansible-infra"
        } -> null
      - tags_all          = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Project"     = "aws-terraform-ansible-infra"
        } -> null
        # (2 unchanged attributes hidden)
    }

  # module.ec2.aws_eip.bastion will be destroyed
  - resource "aws_eip" "bastion" {
      - allocation_id            = "eipalloc-03fd89d43aa4ea0cb" -> null
      - arn                      = "arn:aws:ec2:ap-south-1:383234049116:elastic-ip/eipalloc-03fd89d43aa4ea0cb" -> null
      - association_id           = "eipassoc-0327d1d34c5ab20fe" -> null
      - domain                   = "vpc" -> null
      - id                       = "eipalloc-03fd89d43aa4ea0cb" -> null
      - instance                 = "i-0a4e5c0ffbd790910" -> null
      - network_border_group     = "ap-south-1" -> null
      - network_interface        = "eni-0c58280bcab2223ae" -> null
      - private_dns              = "ip-10-0-1-222.ap-south-1.compute.internal" -> null
      - private_ip               = "10.0.1.222" -> null
      - public_dns               = "ec2-13-205-92-122.ap-south-1.compute.amazonaws.com" -> null
      - public_ip                = "13.205.92.122" -> null
      - public_ipv4_pool         = "amazon" -> null
      - tags                     = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "dev-bastion-eip"
          - "Project"     = "aws-terraform-ansible-infra"
        } -> null
      - tags_all                 = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "dev-bastion-eip"
          - "Project"     = "aws-terraform-ansible-infra"
        } -> null
      - vpc                      = true -> null
        # (4 unchanged attributes hidden)
    }

  # module.ec2.aws_instance.bastion will be destroyed
  - resource "aws_instance" "bastion" {
      - ami                                  = "ami-0aa761682283b4cc8" -> null
      - arn                                  = "arn:aws:ec2:ap-south-1:383234049116:instance/i-0a4e5c0ffbd790910" -> null
      - associate_public_ip_address          = true -> null
      - availability_zone                    = "ap-south-1a" -> null
      - cpu_core_count                       = 1 -> null
      - cpu_threads_per_core                 = 2 -> null
      - disable_api_stop                     = false -> null
      - disable_api_termination              = false -> null
      - ebs_optimized                        = false -> null
      - get_password_data                    = false -> null
      - hibernation                          = false -> null
      - iam_instance_profile                 = "dev-ec2-instance-profile" -> null
      - id                                   = "i-0a4e5c0ffbd790910" -> null
      - instance_initiated_shutdown_behavior = "stop" -> null
      - instance_state                       = "running" -> null
      - instance_type                        = "t3.micro" -> null
      - ipv6_address_count                   = 0 -> null
      - ipv6_addresses                       = [] -> null
      - key_name                             = "terraform-ansible-automation-infrastructure" -> null
      - monitoring                           = false -> null
      - placement_partition_number           = 0 -> null
      - primary_network_interface_id         = "eni-0c58280bcab2223ae" -> null
      - private_dns                          = "ip-10-0-1-222.ap-south-1.compute.internal" -> null
      - private_ip                           = "10.0.1.222" -> null
      - public_dns                           = "ec2-13-205-92-122.ap-south-1.compute.amazonaws.com" -> null
      - public_ip                            = "13.205.92.122" -> null
      - secondary_private_ips                = [] -> null
      - security_groups                      = [] -> null
      - source_dest_check                    = true -> null
      - subnet_id                            = "subnet-0437bd180a210fbc0" -> null
      - tags                                 = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "dev-bastion-host"
          - "Project"     = "aws-terraform-ansible-infra"
        } -> null
      - tags_all                             = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "dev-bastion-host"
          - "Project"     = "aws-terraform-ansible-infra"
        } -> null
      - tenancy                              = "default" -> null
      - user_data_replace_on_change          = false -> null
      - vpc_security_group_ids               = [
          - "sg-0fec03b485702c34d",
        ] -> null
        # (6 unchanged attributes hidden)

      - capacity_reservation_specification {
          - capacity_reservation_preference = "open" -> null
        }

      - cpu_options {
          - core_count       = 1 -> null
          - threads_per_core = 2 -> null
            # (1 unchanged attribute hidden)
        }

      - credit_specification {
          - cpu_credits = "unlimited" -> null
        }

      - enclave_options {
          - enabled = false -> null
        }

      - maintenance_options {
          - auto_recovery = "default" -> null
        }

      - metadata_options {
          - http_endpoint               = "enabled" -> null
          - http_protocol_ipv6          = "disabled" -> null
          - http_put_response_hop_limit = 1 -> null
          - http_tokens                 = "required" -> null
          - instance_metadata_tags      = "disabled" -> null
        }

      - private_dns_name_options {
          - enable_resource_name_dns_a_record    = false -> null
          - enable_resource_name_dns_aaaa_record = false -> null
          - hostname_type                        = "ip-name" -> null
        }

      - root_block_device {
          - delete_on_termination = true -> null
          - device_name           = "/dev/sda1" -> null
          - encrypted             = true -> null
          - iops                  = 3000 -> null
          - kms_key_id            = "arn:aws:kms:ap-south-1:383234049116:key/1b5ae09a-356d-46f0-a67c-7f010547569f" -> null
          - tags                  = {} -> null
          - tags_all              = {
              - "Environment" = "dev"
              - "ManagedBy"   = "Terraform"
              - "Project"     = "aws-terraform-ansible-infra"
            } -> null
          - throughput            = 125 -> null
          - volume_id             = "vol-09104d7eaaf6cef61" -> null
          - volume_size           = 20 -> null
          - volume_type           = "gp3" -> null
        }
    }

  # module.iam.aws_iam_instance_profile.ec2_profile will be destroyed
  - resource "aws_iam_instance_profile" "ec2_profile" {
      - arn         = "arn:aws:iam::383234049116:instance-profile/dev-ec2-instance-profile" -> null
      - create_date = "2026-08-01T09:14:39Z" -> null
      - id          = "dev-ec2-instance-profile" -> null
      - name        = "dev-ec2-instance-profile" -> null
      - path        = "/" -> null
      - role        = "dev-ec2-role" -> null
      - tags        = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "dev-ec2-instance-profile"
          - "Project"     = "aws-terraform-ansible-infra"
        } -> null
      - tags_all    = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "dev-ec2-instance-profile"
          - "Project"     = "aws-terraform-ansible-infra"
        } -> null
      - unique_id   = "AIPAVSOUHQROEP72K6KLE" -> null
        # (1 unchanged attribute hidden)
    }

  # module.iam.aws_iam_policy.s3_access will be destroyed
  - resource "aws_iam_policy" "s3_access" {
      - arn              = "arn:aws:iam::383234049116:policy/dev-s3-access-policy" -> null
      - attachment_count = 1 -> null
      - description      = "Allows access to application S3 bucket" -> null
      - id               = "arn:aws:iam::383234049116:policy/dev-s3-access-policy" -> null
      - name             = "dev-s3-access-policy" -> null
      - path             = "/" -> null
      - policy           = jsonencode(
            {
              - Statement = [
                  - {
                      - Action   = [
                          - "s3:GetObject",
                          - "s3:PutObject",
                          - "s3:ListBucket",
                        ]
                      - Effect   = "Allow"
                      - Resource = [
                          - "arn:aws:s3:::aws-dev-app-assets-storage-unique-12345",
                          - "arn:aws:s3:::aws-dev-app-assets-storage-unique-12345/*",
                        ]
                    },
                ]
              - Version   = "2012-10-17"
            }
        ) -> null
      - policy_id        = "ANPAVSOUHQROJO6ZVB5HT" -> null
      - tags             = {} -> null
      - tags_all         = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Project"     = "aws-terraform-ansible-infra"
        } -> null
        # (1 unchanged attribute hidden)
    }

  # module.iam.aws_iam_role.ec2_role will be destroyed
  - resource "aws_iam_role" "ec2_role" {
      - arn                   = "arn:aws:iam::383234049116:role/dev-ec2-role" -> null
      - assume_role_policy    = jsonencode(
            {
              - Statement = [
                  - {
                      - Action    = "sts:AssumeRole"
                      - Effect    = "Allow"
                      - Principal = {
                          - Service = "ec2.amazonaws.com"
                        }
                    },
                ]
              - Version   = "2012-10-17"
            }
        ) -> null
      - create_date           = "2026-08-01T09:14:38Z" -> null
      - force_detach_policies = false -> null
      - id                    = "dev-ec2-role" -> null
      - managed_policy_arns   = [
          - "arn:aws:iam::383234049116:policy/dev-s3-access-policy",
          - "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore",
          - "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy",
        ] -> null
      - max_session_duration  = 3600 -> null
      - name                  = "dev-ec2-role" -> null
      - path                  = "/" -> null
      - tags                  = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "dev-ec2-role"
          - "Project"     = "aws-terraform-ansible-infra"
        } -> null
      - tags_all              = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "dev-ec2-role"
          - "Project"     = "aws-terraform-ansible-infra"
        } -> null
      - unique_id             = "AROAVSOUHQROPI36BYWYF" -> null
        # (3 unchanged attributes hidden)
    }

  # module.iam.aws_iam_role_policy_attachment.cloudwatch_agent will be destroyed
  - resource "aws_iam_role_policy_attachment" "cloudwatch_agent" {
      - id         = "dev-ec2-role-20260801091440374900000001" -> null
      - policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy" -> null
      - role       = "dev-ec2-role" -> null
    }

  # module.iam.aws_iam_role_policy_attachment.s3_access_attach will be destroyed
  - resource "aws_iam_role_policy_attachment" "s3_access_attach" {
      - id         = "dev-ec2-role-20260801091440821300000003" -> null
      - policy_arn = "arn:aws:iam::383234049116:policy/dev-s3-access-policy" -> null
      - role       = "dev-ec2-role" -> null
    }

  # module.iam.aws_iam_role_policy_attachment.ssm_core will be destroyed
  - resource "aws_iam_role_policy_attachment" "ssm_core" {
      - id         = "dev-ec2-role-20260801091440410300000002" -> null
      - policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore" -> null
      - role       = "dev-ec2-role" -> null
    }

  # module.internet_gateway.aws_internet_gateway.this will be destroyed
  - resource "aws_internet_gateway" "this" {
      - arn      = "arn:aws:ec2:ap-south-1:383234049116:internet-gateway/igw-0cedbdc6da4e0cb9b" -> null
      - id       = "igw-0cedbdc6da4e0cb9b" -> null
      - owner_id = "383234049116" -> null
      - tags     = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "dev-igw"
          - "Project"     = "aws-terraform-ansible-infra"
        } -> null
      - tags_all = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "dev-igw"
          - "Project"     = "aws-terraform-ansible-infra"
        } -> null
      - vpc_id   = "vpc-02bbd8bdd83126d09" -> null
    }

  # module.route_tables.aws_route_table.public will be destroyed
  - resource "aws_route_table" "public" {
      - arn              = "arn:aws:ec2:ap-south-1:383234049116:route-table/rtb-0986b4e0100eb322f" -> null
      - id               = "rtb-0986b4e0100eb322f" -> null
      - owner_id         = "383234049116" -> null
      - propagating_vgws = [] -> null
      - route            = [
          - {
              - cidr_block                 = "0.0.0.0/0"
              - gateway_id                 = "igw-0cedbdc6da4e0cb9b"
                # (11 unchanged attributes hidden)
            },
        ] -> null
      - tags             = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "dev-public-rt"
          - "Project"     = "aws-terraform-ansible-infra"
        } -> null
      - tags_all         = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "dev-public-rt"
          - "Project"     = "aws-terraform-ansible-infra"
        } -> null
      - vpc_id           = "vpc-02bbd8bdd83126d09" -> null
    }

  # module.route_tables.aws_route_table_association.public[0] will be destroyed
  - resource "aws_route_table_association" "public" {
      - id             = "rtbassoc-0d2ce7b7e93ec7964" -> null
      - route_table_id = "rtb-0986b4e0100eb322f" -> null
      - subnet_id      = "subnet-0437bd180a210fbc0" -> null
        # (1 unchanged attribute hidden)
    }

  # module.route_tables.aws_route_table_association.public[1] will be destroyed
  - resource "aws_route_table_association" "public" {
      - id             = "rtbassoc-0133e428f2035a787" -> null
      - route_table_id = "rtb-0986b4e0100eb322f" -> null
      - subnet_id      = "subnet-0464e9ef42b415ae6" -> null
        # (1 unchanged attribute hidden)
    }

  # module.s3.aws_s3_bucket.this will be destroyed
  - resource "aws_s3_bucket" "this" {
      - arn                         = "arn:aws:s3:::aws-dev-app-assets-storage-unique-12345" -> null
      - bucket                      = "aws-dev-app-assets-storage-unique-12345" -> null
      - bucket_domain_name          = "aws-dev-app-assets-storage-unique-12345.s3.amazonaws.com" -> null
      - bucket_regional_domain_name = "aws-dev-app-assets-storage-unique-12345.s3.ap-south-1.amazonaws.com" -> null
      - force_destroy               = false -> null
      - hosted_zone_id              = "Z11RGJOFQNVJUP" -> null
      - id                          = "aws-dev-app-assets-storage-unique-12345" -> null
      - object_lock_enabled         = false -> null
      - region                      = "ap-south-1" -> null
      - request_payer               = "BucketOwner" -> null
      - tags                        = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "aws-dev-app-assets-storage-unique-12345"
          - "Project"     = "aws-terraform-ansible-infra"
        } -> null
      - tags_all                    = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "aws-dev-app-assets-storage-unique-12345"
          - "Project"     = "aws-terraform-ansible-infra"
        } -> null
        # (3 unchanged attributes hidden)

      - grant {
          - id          = "0dcfd5919cd71b317c7609e729e717151e9a8b9bec1a1dea6a19116a8dc9b538" -> null
          - permissions = [
              - "FULL_CONTROL",
            ] -> null
          - type        = "CanonicalUser" -> null
            # (1 unchanged attribute hidden)
        }

      - server_side_encryption_configuration {
          - rule {
              - bucket_key_enabled = false -> null

              - apply_server_side_encryption_by_default {
                  - sse_algorithm     = "AES256" -> null
                    # (1 unchanged attribute hidden)
                }
            }
        }

      - versioning {
          - enabled    = true -> null
          - mfa_delete = false -> null
        }
    }

  # module.s3.aws_s3_bucket_public_access_block.this will be destroyed
  - resource "aws_s3_bucket_public_access_block" "this" {
      - block_public_acls       = true -> null
      - block_public_policy     = true -> null
      - bucket                  = "aws-dev-app-assets-storage-unique-12345" -> null
      - id                      = "aws-dev-app-assets-storage-unique-12345" -> null
      - ignore_public_acls      = true -> null
      - restrict_public_buckets = true -> null
    }

  # module.s3.aws_s3_bucket_server_side_encryption_configuration.this will be destroyed
  - resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
      - bucket                = "aws-dev-app-assets-storage-unique-12345" -> null
      - id                    = "aws-dev-app-assets-storage-unique-12345" -> null
        # (1 unchanged attribute hidden)

      - rule {
          - bucket_key_enabled = false -> null

          - apply_server_side_encryption_by_default {
              - sse_algorithm     = "AES256" -> null
                # (1 unchanged attribute hidden)
            }
        }
    }

  # module.s3.aws_s3_bucket_versioning.this will be destroyed
  - resource "aws_s3_bucket_versioning" "this" {
      - bucket                = "aws-dev-app-assets-storage-unique-12345" -> null
      - id                    = "aws-dev-app-assets-storage-unique-12345" -> null
        # (1 unchanged attribute hidden)

      - versioning_configuration {
          - status     = "Enabled" -> null
            # (1 unchanged attribute hidden)
        }
    }

  # module.security_group.aws_security_group.ec2 will be destroyed
  - resource "aws_security_group" "ec2" {
      - arn                    = "arn:aws:ec2:ap-south-1:383234049116:security-group/sg-0fec03b485702c34d" -> null
      - description            = "Security group for EC2 instance running App, Nginx, Prometheus, Grafana" -> null
      - egress                 = [
          - {
              - cidr_blocks      = [
                  - "0.0.0.0/0",
                ]
              - description      = "Allow all outbound traffic"
              - from_port        = 0
              - ipv6_cidr_blocks = []
              - prefix_list_ids  = []
              - protocol         = "-1"
              - security_groups  = []
              - self             = false
              - to_port          = 0
            },
        ] -> null
      - id                     = "sg-0fec03b485702c34d" -> null
      - ingress                = [
          - {
              - cidr_blocks      = [
                  - "0.0.0.0/0",
                ]
              - description      = "Grafana Dashboard Ingress"
              - from_port        = 3001
              - ipv6_cidr_blocks = []
              - prefix_list_ids  = []
              - protocol         = "tcp"
              - security_groups  = []
              - self             = false
              - to_port          = 3001
            },
          - {
              - cidr_blocks      = [
                  - "0.0.0.0/0",
                ]
              - description      = "HTTP Ingress for Nginx Reverse Proxy"
              - from_port        = 80
              - ipv6_cidr_blocks = []
              - prefix_list_ids  = []
              - protocol         = "tcp"
              - security_groups  = []
              - self             = false
              - to_port          = 80
            },
          - {
              - cidr_blocks      = [
                  - "0.0.0.0/0",
                ]
              - description      = "Prometheus UI Ingress"
              - from_port        = 9090
              - ipv6_cidr_blocks = []
              - prefix_list_ids  = []
              - protocol         = "tcp"
              - security_groups  = []
              - self             = false
              - to_port          = 9090
            },
          - {
              - cidr_blocks      = [
                  - "0.0.0.0/0",
                ]
              - description      = "SSH Ingress"
              - from_port        = 22
              - ipv6_cidr_blocks = []
              - prefix_list_ids  = []
              - protocol         = "tcp"
              - security_groups  = []
              - self             = false
              - to_port          = 22
            },
          - {
              - cidr_blocks      = [
                  - "10.0.0.0/16",
                ]
              - description      = "Node Exporter Metric Scraping"
              - from_port        = 9100
              - ipv6_cidr_blocks = []
              - prefix_list_ids  = []
              - protocol         = "tcp"
              - security_groups  = []
              - self             = false
              - to_port          = 9100
            },
          - {
              - cidr_blocks      = [
                  - "10.0.0.0/16",
                ]
              - description      = "cAdvisor Metric Scraping"
              - from_port        = 8080
              - ipv6_cidr_blocks = []
              - prefix_list_ids  = []
              - protocol         = "tcp"
              - security_groups  = []
              - self             = false
              - to_port          = 8080
            },
        ] -> null
      - name                   = "dev-ec2-sg" -> null
      - owner_id               = "383234049116" -> null
      - revoke_rules_on_delete = false -> null
      - tags                   = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "dev-ec2-sg"
          - "Project"     = "aws-terraform-ansible-infra"
        } -> null
      - tags_all               = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "dev-ec2-sg"
          - "Project"     = "aws-terraform-ansible-infra"
        } -> null
      - vpc_id                 = "vpc-02bbd8bdd83126d09" -> null
        # (1 unchanged attribute hidden)
    }

  # module.subnets.aws_subnet.public[0] will be destroyed
  - resource "aws_subnet" "public" {
      - arn                                            = "arn:aws:ec2:ap-south-1:383234049116:subnet/subnet-0437bd180a210fbc0" -> null
      - assign_ipv6_address_on_creation                = false -> null
      - availability_zone                              = "ap-south-1a" -> null
      - availability_zone_id                           = "aps1-az1" -> null
      - cidr_block                                     = "10.0.1.0/24" -> null
      - enable_dns64                                   = false -> null
      - enable_lni_at_device_index                     = 0 -> null
      - enable_resource_name_dns_a_record_on_launch    = false -> null
      - enable_resource_name_dns_aaaa_record_on_launch = false -> null
      - id                                             = "subnet-0437bd180a210fbc0" -> null
      - ipv6_native                                    = false -> null
      - map_customer_owned_ip_on_launch                = false -> null
      - map_public_ip_on_launch                        = true -> null
      - owner_id                                       = "383234049116" -> null
      - private_dns_hostname_type_on_launch            = "ip-name" -> null
      - tags                                           = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "dev-public-subnet-1"
          - "Project"     = "aws-terraform-ansible-infra"
          - "Type"        = "Public"
        } -> null
      - tags_all                                       = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "dev-public-subnet-1"
          - "Project"     = "aws-terraform-ansible-infra"
          - "Type"        = "Public"
        } -> null
      - vpc_id                                         = "vpc-02bbd8bdd83126d09" -> null
        # (4 unchanged attributes hidden)
    }

  # module.subnets.aws_subnet.public[1] will be destroyed
  - resource "aws_subnet" "public" {
      - arn                                            = "arn:aws:ec2:ap-south-1:383234049116:subnet/subnet-0464e9ef42b415ae6" -> null
      - assign_ipv6_address_on_creation                = false -> null
      - availability_zone                              = "ap-south-1b" -> null
      - availability_zone_id                           = "aps1-az3" -> null
      - cidr_block                                     = "10.0.2.0/24" -> null
      - enable_dns64                                   = false -> null
      - enable_lni_at_device_index                     = 0 -> null
      - enable_resource_name_dns_a_record_on_launch    = false -> null
      - enable_resource_name_dns_aaaa_record_on_launch = false -> null
      - id                                             = "subnet-0464e9ef42b415ae6" -> null
      - ipv6_native                                    = false -> null
      - map_customer_owned_ip_on_launch                = false -> null
      - map_public_ip_on_launch                        = true -> null
      - owner_id                                       = "383234049116" -> null
      - private_dns_hostname_type_on_launch            = "ip-name" -> null
      - tags                                           = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "dev-public-subnet-2"
          - "Project"     = "aws-terraform-ansible-infra"
          - "Type"        = "Public"
        } -> null
      - tags_all                                       = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "dev-public-subnet-2"
          - "Project"     = "aws-terraform-ansible-infra"
          - "Type"        = "Public"
        } -> null
      - vpc_id                                         = "vpc-02bbd8bdd83126d09" -> null
        # (4 unchanged attributes hidden)
    }

  # module.vpc.aws_vpc.this will be destroyed
  - resource "aws_vpc" "this" {
      - arn                                  = "arn:aws:ec2:ap-south-1:383234049116:vpc/vpc-02bbd8bdd83126d09" -> null
      - assign_generated_ipv6_cidr_block     = false -> null
      - cidr_block                           = "10.0.0.0/16" -> null
      - default_network_acl_id               = "acl-0f4c87de3ec9e20f2" -> null
      - default_route_table_id               = "rtb-049d0ac20fcbc399e" -> null
      - default_security_group_id            = "sg-0b3eebc7749420ff1" -> null
      - dhcp_options_id                      = "dopt-0dc05d96a069b7753" -> null
      - enable_dns_hostnames                 = true -> null
      - enable_dns_support                   = true -> null
      - enable_network_address_usage_metrics = false -> null
      - id                                   = "vpc-02bbd8bdd83126d09" -> null
      - instance_tenancy                     = "default" -> null
      - ipv6_netmask_length                  = 0 -> null
      - main_route_table_id                  = "rtb-049d0ac20fcbc399e" -> null
      - owner_id                             = "383234049116" -> null
      - tags                                 = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "dev-vpc"
          - "Project"     = "aws-terraform-ansible-infra"
        } -> null
      - tags_all                             = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "dev-vpc"
          - "Project"     = "aws-terraform-ansible-infra"
        } -> null
        # (4 unchanged attributes hidden)
    }

Plan: 0 to add, 0 to change, 22 to destroy.

Changes to Outputs:
  - cloudwatch_system_log_group = "/aws/ec2/dev-system-logs" -> null
  - ec2_instance_id             = "i-0a4e5c0ffbd790910" -> null
  - ec2_public_ip               = "13.205.92.122" -> null
  - public_subnet_ids           = [
      - "subnet-0437bd180a210fbc0",
      - "subnet-0464e9ef42b415ae6",
    ] -> null
  - s3_bucket_name              = "aws-dev-app-assets-storage-unique-12345" -> null
  - vpc_id                      = "vpc-02bbd8bdd83126d09" -> null

─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply" now.
ubuntu@ip-172-31-3-226:~/Ansible-Terraform-Infra/terraform/environments/dev$ cd ~/Ansible-Terraform-Infra/terraform/environments/dev

terraform plan -destroy
module.cloudwatch.aws_cloudwatch_log_group.app_logs: Refreshing state... [id=/aws/ec2/dev-app-logs]
module.s3.aws_s3_bucket.this: Refreshing state... [id=aws-dev-app-assets-storage-unique-12345]
module.cloudwatch.aws_cloudwatch_log_group.sys_logs: Refreshing state... [id=/aws/ec2/dev-system-logs]
module.vpc.aws_vpc.this: Refreshing state... [id=vpc-02bbd8bdd83126d09]
module.iam.aws_iam_role.ec2_role: Refreshing state... [id=dev-ec2-role]
data.aws_ami.ubuntu: Reading...
module.s3.aws_s3_bucket_server_side_encryption_configuration.this: Refreshing state... [id=aws-dev-app-assets-storage-unique-12345]
module.iam.aws_iam_policy.s3_access: Refreshing state... [id=arn:aws:iam::383234049116:policy/dev-s3-access-policy]
module.s3.aws_s3_bucket_versioning.this: Refreshing state... [id=aws-dev-app-assets-storage-unique-12345]
module.s3.aws_s3_bucket_public_access_block.this: Refreshing state... [id=aws-dev-app-assets-storage-unique-12345]
data.aws_ami.ubuntu: Read complete after 0s [id=ami-0aa761682283b4cc8]
module.internet_gateway.aws_internet_gateway.this: Refreshing state... [id=igw-0cedbdc6da4e0cb9b]
module.subnets.aws_subnet.public[0]: Refreshing state... [id=subnet-0437bd180a210fbc0]
module.subnets.aws_subnet.public[1]: Refreshing state... [id=subnet-0464e9ef42b415ae6]
module.security_group.aws_security_group.ec2: Refreshing state... [id=sg-0fec03b485702c34d]
module.route_tables.aws_route_table.public: Refreshing state... [id=rtb-0986b4e0100eb322f]
module.route_tables.aws_route_table_association.public[1]: Refreshing state... [id=rtbassoc-0133e428f2035a787]
module.route_tables.aws_route_table_association.public[0]: Refreshing state... [id=rtbassoc-0d2ce7b7e93ec7964]
module.iam.aws_iam_instance_profile.ec2_profile: Refreshing state... [id=dev-ec2-instance-profile]
module.iam.aws_iam_role_policy_attachment.ssm_core: Refreshing state... [id=dev-ec2-role-20260801091440410300000002]
module.iam.aws_iam_role_policy_attachment.cloudwatch_agent: Refreshing state... [id=dev-ec2-role-20260801091440374900000001]
module.iam.aws_iam_role_policy_attachment.s3_access_attach: Refreshing state... [id=dev-ec2-role-20260801091440821300000003]
module.ec2.aws_instance.bastion: Refreshing state... [id=i-0a4e5c0ffbd790910]
module.ec2.aws_eip.bastion: Refreshing state... [id=eipalloc-03fd89d43aa4ea0cb]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # module.cloudwatch.aws_cloudwatch_log_group.app_logs will be destroyed
  - resource "aws_cloudwatch_log_group" "app_logs" {
      - arn               = "arn:aws:logs:ap-south-1:383234049116:log-group:/aws/ec2/dev-app-logs" -> null
      - id                = "/aws/ec2/dev-app-logs" -> null
      - log_group_class   = "STANDARD" -> null
      - name              = "/aws/ec2/dev-app-logs" -> null
      - retention_in_days = 7 -> null
      - skip_destroy      = false -> null
      - tags              = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Project"     = "aws-terraform-ansible-infra"
        } -> null
      - tags_all          = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Project"     = "aws-terraform-ansible-infra"
        } -> null
        # (2 unchanged attributes hidden)
    }

  # module.cloudwatch.aws_cloudwatch_log_group.sys_logs will be destroyed
  - resource "aws_cloudwatch_log_group" "sys_logs" {
      - arn               = "arn:aws:logs:ap-south-1:383234049116:log-group:/aws/ec2/dev-system-logs" -> null
      - id                = "/aws/ec2/dev-system-logs" -> null
      - log_group_class   = "STANDARD" -> null
      - name              = "/aws/ec2/dev-system-logs" -> null
      - retention_in_days = 7 -> null
      - skip_destroy      = false -> null
      - tags              = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Project"     = "aws-terraform-ansible-infra"
        } -> null
      - tags_all          = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Project"     = "aws-terraform-ansible-infra"
        } -> null
        # (2 unchanged attributes hidden)
    }

  # module.ec2.aws_eip.bastion will be destroyed
  - resource "aws_eip" "bastion" {
      - allocation_id            = "eipalloc-03fd89d43aa4ea0cb" -> null
      - arn                      = "arn:aws:ec2:ap-south-1:383234049116:elastic-ip/eipalloc-03fd89d43aa4ea0cb" -> null
      - association_id           = "eipassoc-0327d1d34c5ab20fe" -> null
      - domain                   = "vpc" -> null
      - id                       = "eipalloc-03fd89d43aa4ea0cb" -> null
      - instance                 = "i-0a4e5c0ffbd790910" -> null
      - network_border_group     = "ap-south-1" -> null
      - network_interface        = "eni-0c58280bcab2223ae" -> null
      - private_dns              = "ip-10-0-1-222.ap-south-1.compute.internal" -> null
      - private_ip               = "10.0.1.222" -> null
      - public_dns               = "ec2-13-205-92-122.ap-south-1.compute.amazonaws.com" -> null
      - public_ip                = "13.205.92.122" -> null
      - public_ipv4_pool         = "amazon" -> null
      - tags                     = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "dev-bastion-eip"
          - "Project"     = "aws-terraform-ansible-infra"
        } -> null
      - tags_all                 = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "dev-bastion-eip"
          - "Project"     = "aws-terraform-ansible-infra"
        } -> null
      - vpc                      = true -> null
        # (4 unchanged attributes hidden)
    }

  # module.ec2.aws_instance.bastion will be destroyed
  - resource "aws_instance" "bastion" {
      - ami                                  = "ami-0aa761682283b4cc8" -> null
      - arn                                  = "arn:aws:ec2:ap-south-1:383234049116:instance/i-0a4e5c0ffbd790910" -> null
      - associate_public_ip_address          = true -> null
      - availability_zone                    = "ap-south-1a" -> null
      - cpu_core_count                       = 1 -> null
      - cpu_threads_per_core                 = 2 -> null
      - disable_api_stop                     = false -> null
      - disable_api_termination              = false -> null
      - ebs_optimized                        = false -> null
      - get_password_data                    = false -> null
      - hibernation                          = false -> null
      - iam_instance_profile                 = "dev-ec2-instance-profile" -> null
      - id                                   = "i-0a4e5c0ffbd790910" -> null
      - instance_initiated_shutdown_behavior = "stop" -> null
      - instance_state                       = "running" -> null
      - instance_type                        = "t3.micro" -> null
      - ipv6_address_count                   = 0 -> null
      - ipv6_addresses                       = [] -> null
      - key_name                             = "terraform-ansible-automation-infrastructure" -> null
      - monitoring                           = false -> null
      - placement_partition_number           = 0 -> null
      - primary_network_interface_id         = "eni-0c58280bcab2223ae" -> null
      - private_dns                          = "ip-10-0-1-222.ap-south-1.compute.internal" -> null
      - private_ip                           = "10.0.1.222" -> null
      - public_dns                           = "ec2-13-205-92-122.ap-south-1.compute.amazonaws.com" -> null
      - public_ip                            = "13.205.92.122" -> null
      - secondary_private_ips                = [] -> null
      - security_groups                      = [] -> null
      - source_dest_check                    = true -> null
      - subnet_id                            = "subnet-0437bd180a210fbc0" -> null
      - tags                                 = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "dev-bastion-host"
          - "Project"     = "aws-terraform-ansible-infra"
        } -> null
      - tags_all                             = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "dev-bastion-host"
          - "Project"     = "aws-terraform-ansible-infra"
        } -> null
      - tenancy                              = "default" -> null
      - user_data_replace_on_change          = false -> null
      - vpc_security_group_ids               = [
          - "sg-0fec03b485702c34d",
        ] -> null
        # (6 unchanged attributes hidden)

      - capacity_reservation_specification {
          - capacity_reservation_preference = "open" -> null
        }

      - cpu_options {
          - core_count       = 1 -> null
          - threads_per_core = 2 -> null
            # (1 unchanged attribute hidden)
        }

      - credit_specification {
          - cpu_credits = "unlimited" -> null
        }

      - enclave_options {
          - enabled = false -> null
        }

      - maintenance_options {
          - auto_recovery = "default" -> null
        }

      - metadata_options {
          - http_endpoint               = "enabled" -> null
          - http_protocol_ipv6          = "disabled" -> null
          - http_put_response_hop_limit = 1 -> null
          - http_tokens                 = "required" -> null
          - instance_metadata_tags      = "disabled" -> null
        }

      - private_dns_name_options {
          - enable_resource_name_dns_a_record    = false -> null
          - enable_resource_name_dns_aaaa_record = false -> null
          - hostname_type                        = "ip-name" -> null
        }

      - root_block_device {
          - delete_on_termination = true -> null
          - device_name           = "/dev/sda1" -> null
          - encrypted             = true -> null
          - iops                  = 3000 -> null
          - kms_key_id            = "arn:aws:kms:ap-south-1:383234049116:key/1b5ae09a-356d-46f0-a67c-7f010547569f" -> null
          - tags                  = {} -> null
          - tags_all              = {
              - "Environment" = "dev"
              - "ManagedBy"   = "Terraform"
              - "Project"     = "aws-terraform-ansible-infra"
            } -> null
          - throughput            = 125 -> null
          - volume_id             = "vol-09104d7eaaf6cef61" -> null
          - volume_size           = 20 -> null
          - volume_type           = "gp3" -> null
        }
    }

  # module.iam.aws_iam_instance_profile.ec2_profile will be destroyed
  - resource "aws_iam_instance_profile" "ec2_profile" {
      - arn         = "arn:aws:iam::383234049116:instance-profile/dev-ec2-instance-profile" -> null
      - create_date = "2026-08-01T09:14:39Z" -> null
      - id          = "dev-ec2-instance-profile" -> null
      - name        = "dev-ec2-instance-profile" -> null
      - path        = "/" -> null
      - role        = "dev-ec2-role" -> null
      - tags        = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "dev-ec2-instance-profile"
          - "Project"     = "aws-terraform-ansible-infra"
        } -> null
      - tags_all    = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "dev-ec2-instance-profile"
          - "Project"     = "aws-terraform-ansible-infra"
        } -> null
      - unique_id   = "AIPAVSOUHQROEP72K6KLE" -> null
        # (1 unchanged attribute hidden)
    }

  # module.iam.aws_iam_policy.s3_access will be destroyed
  - resource "aws_iam_policy" "s3_access" {
      - arn              = "arn:aws:iam::383234049116:policy/dev-s3-access-policy" -> null
      - attachment_count = 1 -> null
      - description      = "Allows access to application S3 bucket" -> null
      - id               = "arn:aws:iam::383234049116:policy/dev-s3-access-policy" -> null
      - name             = "dev-s3-access-policy" -> null
      - path             = "/" -> null
      - policy           = jsonencode(
            {
              - Statement = [
                  - {
                      - Action   = [
                          - "s3:GetObject",
                          - "s3:PutObject",
                          - "s3:ListBucket",
                        ]
                      - Effect   = "Allow"
                      - Resource = [
                          - "arn:aws:s3:::aws-dev-app-assets-storage-unique-12345",
                          - "arn:aws:s3:::aws-dev-app-assets-storage-unique-12345/*",
                        ]
                    },
                ]
              - Version   = "2012-10-17"
            }
        ) -> null
      - policy_id        = "ANPAVSOUHQROJO6ZVB5HT" -> null
      - tags             = {} -> null
      - tags_all         = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Project"     = "aws-terraform-ansible-infra"
        } -> null
        # (1 unchanged attribute hidden)
    }

  # module.iam.aws_iam_role.ec2_role will be destroyed
  - resource "aws_iam_role" "ec2_role" {
      - arn                   = "arn:aws:iam::383234049116:role/dev-ec2-role" -> null
      - assume_role_policy    = jsonencode(
            {
              - Statement = [
                  - {
                      - Action    = "sts:AssumeRole"
                      - Effect    = "Allow"
                      - Principal = {
                          - Service = "ec2.amazonaws.com"
                        }
                    },
                ]
              - Version   = "2012-10-17"
            }
        ) -> null
      - create_date           = "2026-08-01T09:14:38Z" -> null
      - force_detach_policies = false -> null
      - id                    = "dev-ec2-role" -> null
      - managed_policy_arns   = [
          - "arn:aws:iam::383234049116:policy/dev-s3-access-policy",
          - "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore",
          - "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy",
        ] -> null
      - max_session_duration  = 3600 -> null
      - name                  = "dev-ec2-role" -> null
      - path                  = "/" -> null
      - tags                  = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "dev-ec2-role"
          - "Project"     = "aws-terraform-ansible-infra"
        } -> null
      - tags_all              = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "dev-ec2-role"
          - "Project"     = "aws-terraform-ansible-infra"
        } -> null
      - unique_id             = "AROAVSOUHQROPI36BYWYF" -> null
        # (3 unchanged attributes hidden)
    }

  # module.iam.aws_iam_role_policy_attachment.cloudwatch_agent will be destroyed
  - resource "aws_iam_role_policy_attachment" "cloudwatch_agent" {
      - id         = "dev-ec2-role-20260801091440374900000001" -> null
      - policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy" -> null
      - role       = "dev-ec2-role" -> null
    }

  # module.iam.aws_iam_role_policy_attachment.s3_access_attach will be destroyed
  - resource "aws_iam_role_policy_attachment" "s3_access_attach" {
      - id         = "dev-ec2-role-20260801091440821300000003" -> null
      - policy_arn = "arn:aws:iam::383234049116:policy/dev-s3-access-policy" -> null
      - role       = "dev-ec2-role" -> null
    }

  # module.iam.aws_iam_role_policy_attachment.ssm_core will be destroyed
  - resource "aws_iam_role_policy_attachment" "ssm_core" {
      - id         = "dev-ec2-role-20260801091440410300000002" -> null
      - policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore" -> null
      - role       = "dev-ec2-role" -> null
    }

  # module.internet_gateway.aws_internet_gateway.this will be destroyed
  - resource "aws_internet_gateway" "this" {
      - arn      = "arn:aws:ec2:ap-south-1:383234049116:internet-gateway/igw-0cedbdc6da4e0cb9b" -> null
      - id       = "igw-0cedbdc6da4e0cb9b" -> null
      - owner_id = "383234049116" -> null
      - tags     = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "dev-igw"
          - "Project"     = "aws-terraform-ansible-infra"
        } -> null
      - tags_all = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "dev-igw"
          - "Project"     = "aws-terraform-ansible-infra"
        } -> null
      - vpc_id   = "vpc-02bbd8bdd83126d09" -> null
    }

  # module.route_tables.aws_route_table.public will be destroyed
  - resource "aws_route_table" "public" {
      - arn              = "arn:aws:ec2:ap-south-1:383234049116:route-table/rtb-0986b4e0100eb322f" -> null
      - id               = "rtb-0986b4e0100eb322f" -> null
      - owner_id         = "383234049116" -> null
      - propagating_vgws = [] -> null
      - route            = [
          - {
              - cidr_block                 = "0.0.0.0/0"
              - gateway_id                 = "igw-0cedbdc6da4e0cb9b"
                # (11 unchanged attributes hidden)
            },
        ] -> null
      - tags             = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "dev-public-rt"
          - "Project"     = "aws-terraform-ansible-infra"
        } -> null
      - tags_all         = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "dev-public-rt"
          - "Project"     = "aws-terraform-ansible-infra"
        } -> null
      - vpc_id           = "vpc-02bbd8bdd83126d09" -> null
    }

  # module.route_tables.aws_route_table_association.public[0] will be destroyed
  - resource "aws_route_table_association" "public" {
      - id             = "rtbassoc-0d2ce7b7e93ec7964" -> null
      - route_table_id = "rtb-0986b4e0100eb322f" -> null
      - subnet_id      = "subnet-0437bd180a210fbc0" -> null
        # (1 unchanged attribute hidden)
    }

  # module.route_tables.aws_route_table_association.public[1] will be destroyed
  - resource "aws_route_table_association" "public" {
      - id             = "rtbassoc-0133e428f2035a787" -> null
      - route_table_id = "rtb-0986b4e0100eb322f" -> null
      - subnet_id      = "subnet-0464e9ef42b415ae6" -> null
        # (1 unchanged attribute hidden)
    }

  # module.s3.aws_s3_bucket.this will be destroyed
  - resource "aws_s3_bucket" "this" {
      - arn                         = "arn:aws:s3:::aws-dev-app-assets-storage-unique-12345" -> null
      - bucket                      = "aws-dev-app-assets-storage-unique-12345" -> null
      - bucket_domain_name          = "aws-dev-app-assets-storage-unique-12345.s3.amazonaws.com" -> null
      - bucket_regional_domain_name = "aws-dev-app-assets-storage-unique-12345.s3.ap-south-1.amazonaws.com" -> null
      - force_destroy               = false -> null
      - hosted_zone_id              = "Z11RGJOFQNVJUP" -> null
      - id                          = "aws-dev-app-assets-storage-unique-12345" -> null
      - object_lock_enabled         = false -> null
      - region                      = "ap-south-1" -> null
      - request_payer               = "BucketOwner" -> null
      - tags                        = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "aws-dev-app-assets-storage-unique-12345"
          - "Project"     = "aws-terraform-ansible-infra"
        } -> null
      - tags_all                    = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "aws-dev-app-assets-storage-unique-12345"
          - "Project"     = "aws-terraform-ansible-infra"
        } -> null
        # (3 unchanged attributes hidden)

      - grant {
          - id          = "0dcfd5919cd71b317c7609e729e717151e9a8b9bec1a1dea6a19116a8dc9b538" -> null
          - permissions = [
              - "FULL_CONTROL",
            ] -> null
          - type        = "CanonicalUser" -> null
            # (1 unchanged attribute hidden)
        }

      - server_side_encryption_configuration {
          - rule {
              - bucket_key_enabled = false -> null

              - apply_server_side_encryption_by_default {
                  - sse_algorithm     = "AES256" -> null
                    # (1 unchanged attribute hidden)
                }
            }
        }

      - versioning {
          - enabled    = true -> null
          - mfa_delete = false -> null
        }
    }

  # module.s3.aws_s3_bucket_public_access_block.this will be destroyed
  - resource "aws_s3_bucket_public_access_block" "this" {
      - block_public_acls       = true -> null
      - block_public_policy     = true -> null
      - bucket                  = "aws-dev-app-assets-storage-unique-12345" -> null
      - id                      = "aws-dev-app-assets-storage-unique-12345" -> null
      - ignore_public_acls      = true -> null
      - restrict_public_buckets = true -> null
    }

  # module.s3.aws_s3_bucket_server_side_encryption_configuration.this will be destroyed
  - resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
      - bucket                = "aws-dev-app-assets-storage-unique-12345" -> null
      - id                    = "aws-dev-app-assets-storage-unique-12345" -> null
        # (1 unchanged attribute hidden)

      - rule {
          - bucket_key_enabled = false -> null

          - apply_server_side_encryption_by_default {
              - sse_algorithm     = "AES256" -> null
                # (1 unchanged attribute hidden)
            }
        }
    }

  # module.s3.aws_s3_bucket_versioning.this will be destroyed
  - resource "aws_s3_bucket_versioning" "this" {
      - bucket                = "aws-dev-app-assets-storage-unique-12345" -> null
      - id                    = "aws-dev-app-assets-storage-unique-12345" -> null
        # (1 unchanged attribute hidden)

      - versioning_configuration {
          - status     = "Enabled" -> null
            # (1 unchanged attribute hidden)
        }
    }

  # module.security_group.aws_security_group.ec2 will be destroyed
  - resource "aws_security_group" "ec2" {
      - arn                    = "arn:aws:ec2:ap-south-1:383234049116:security-group/sg-0fec03b485702c34d" -> null
      - description            = "Security group for EC2 instance running App, Nginx, Prometheus, Grafana" -> null
      - egress                 = [
          - {
              - cidr_blocks      = [
                  - "0.0.0.0/0",
                ]
              - description      = "Allow all outbound traffic"
              - from_port        = 0
              - ipv6_cidr_blocks = []
              - prefix_list_ids  = []
              - protocol         = "-1"
              - security_groups  = []
              - self             = false
              - to_port          = 0
            },
        ] -> null
      - id                     = "sg-0fec03b485702c34d" -> null
      - ingress                = [
          - {
              - cidr_blocks      = [
                  - "0.0.0.0/0",
                ]
              - description      = "Grafana Dashboard Ingress"
              - from_port        = 3001
              - ipv6_cidr_blocks = []
              - prefix_list_ids  = []
              - protocol         = "tcp"
              - security_groups  = []
              - self             = false
              - to_port          = 3001
            },
          - {
              - cidr_blocks      = [
                  - "0.0.0.0/0",
                ]
              - description      = "HTTP Ingress for Nginx Reverse Proxy"
              - from_port        = 80
              - ipv6_cidr_blocks = []
              - prefix_list_ids  = []
              - protocol         = "tcp"
              - security_groups  = []
              - self             = false
              - to_port          = 80
            },
          - {
              - cidr_blocks      = [
                  - "0.0.0.0/0",
                ]
              - description      = "Prometheus UI Ingress"
              - from_port        = 9090
              - ipv6_cidr_blocks = []
              - prefix_list_ids  = []
              - protocol         = "tcp"
              - security_groups  = []
              - self             = false
              - to_port          = 9090
            },
          - {
              - cidr_blocks      = [
                  - "0.0.0.0/0",
                ]
              - description      = "SSH Ingress"
              - from_port        = 22
              - ipv6_cidr_blocks = []
              - prefix_list_ids  = []
              - protocol         = "tcp"
              - security_groups  = []
              - self             = false
              - to_port          = 22
            },
          - {
              - cidr_blocks      = [
                  - "10.0.0.0/16",
                ]
              - description      = "Node Exporter Metric Scraping"
              - from_port        = 9100
              - ipv6_cidr_blocks = []
              - prefix_list_ids  = []
              - protocol         = "tcp"
              - security_groups  = []
              - self             = false
              - to_port          = 9100
            },
          - {
              - cidr_blocks      = [
                  - "10.0.0.0/16",
                ]
              - description      = "cAdvisor Metric Scraping"
              - from_port        = 8080
              - ipv6_cidr_blocks = []
              - prefix_list_ids  = []
              - protocol         = "tcp"
              - security_groups  = []
              - self             = false
              - to_port          = 8080
            },
        ] -> null
      - name                   = "dev-ec2-sg" -> null
      - owner_id               = "383234049116" -> null
      - revoke_rules_on_delete = false -> null
      - tags                   = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "dev-ec2-sg"
          - "Project"     = "aws-terraform-ansible-infra"
        } -> null
      - tags_all               = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "dev-ec2-sg"
          - "Project"     = "aws-terraform-ansible-infra"
        } -> null
      - vpc_id                 = "vpc-02bbd8bdd83126d09" -> null
        # (1 unchanged attribute hidden)
    }

  # module.subnets.aws_subnet.public[0] will be destroyed
  - resource "aws_subnet" "public" {
      - arn                                            = "arn:aws:ec2:ap-south-1:383234049116:subnet/subnet-0437bd180a210fbc0" -> null
      - assign_ipv6_address_on_creation                = false -> null
      - availability_zone                              = "ap-south-1a" -> null
      - availability_zone_id                           = "aps1-az1" -> null
      - cidr_block                                     = "10.0.1.0/24" -> null
      - enable_dns64                                   = false -> null
      - enable_lni_at_device_index                     = 0 -> null
      - enable_resource_name_dns_a_record_on_launch    = false -> null
      - enable_resource_name_dns_aaaa_record_on_launch = false -> null
      - id                                             = "subnet-0437bd180a210fbc0" -> null
      - ipv6_native                                    = false -> null
      - map_customer_owned_ip_on_launch                = false -> null
      - map_public_ip_on_launch                        = true -> null
      - owner_id                                       = "383234049116" -> null
      - private_dns_hostname_type_on_launch            = "ip-name" -> null
      - tags                                           = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "dev-public-subnet-1"
          - "Project"     = "aws-terraform-ansible-infra"
          - "Type"        = "Public"
        } -> null
      - tags_all                                       = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "dev-public-subnet-1"
          - "Project"     = "aws-terraform-ansible-infra"
          - "Type"        = "Public"
        } -> null
      - vpc_id                                         = "vpc-02bbd8bdd83126d09" -> null
        # (4 unchanged attributes hidden)
    }

  # module.subnets.aws_subnet.public[1] will be destroyed
  - resource "aws_subnet" "public" {
      - arn                                            = "arn:aws:ec2:ap-south-1:383234049116:subnet/subnet-0464e9ef42b415ae6" -> null
      - assign_ipv6_address_on_creation                = false -> null
      - availability_zone                              = "ap-south-1b" -> null
      - availability_zone_id                           = "aps1-az3" -> null
      - cidr_block                                     = "10.0.2.0/24" -> null
      - enable_dns64                                   = false -> null
      - enable_lni_at_device_index                     = 0 -> null
      - enable_resource_name_dns_a_record_on_launch    = false -> null
      - enable_resource_name_dns_aaaa_record_on_launch = false -> null
      - id                                             = "subnet-0464e9ef42b415ae6" -> null
      - ipv6_native                                    = false -> null
      - map_customer_owned_ip_on_launch                = false -> null
      - map_public_ip_on_launch                        = true -> null
      - owner_id                                       = "383234049116" -> null
      - private_dns_hostname_type_on_launch            = "ip-name" -> null
      - tags                                           = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "dev-public-subnet-2"
          - "Project"     = "aws-terraform-ansible-infra"
          - "Type"        = "Public"
        } -> null
      - tags_all                                       = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "dev-public-subnet-2"
          - "Project"     = "aws-terraform-ansible-infra"
          - "Type"        = "Public"
        } -> null
      - vpc_id                                         = "vpc-02bbd8bdd83126d09" -> null
        # (4 unchanged attributes hidden)
    }

  # module.vpc.aws_vpc.this will be destroyed
  - resource "aws_vpc" "this" {
      - arn                                  = "arn:aws:ec2:ap-south-1:383234049116:vpc/vpc-02bbd8bdd83126d09" -> null
      - assign_generated_ipv6_cidr_block     = false -> null
      - cidr_block                           = "10.0.0.0/16" -> null
      - default_network_acl_id               = "acl-0f4c87de3ec9e20f2" -> null
      - default_route_table_id               = "rtb-049d0ac20fcbc399e" -> null
      - default_security_group_id            = "sg-0b3eebc7749420ff1" -> null
      - dhcp_options_id                      = "dopt-0dc05d96a069b7753" -> null
      - enable_dns_hostnames                 = true -> null
      - enable_dns_support                   = true -> null
      - enable_network_address_usage_metrics = false -> null
      - id                                   = "vpc-02bbd8bdd83126d09" -> null
      - instance_tenancy                     = "default" -> null
      - ipv6_netmask_length                  = 0 -> null
      - main_route_table_id                  = "rtb-049d0ac20fcbc399e" -> null
      - owner_id                             = "383234049116" -> null
      - tags                                 = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "dev-vpc"
          - "Project"     = "aws-terraform-ansible-infra"
        } -> null
      - tags_all                             = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "dev-vpc"
          - "Project"     = "aws-terraform-ansible-infra"
        } -> null
        # (4 unchanged attributes hidden)
    }

Plan: 0 to add, 0 to change, 22 to destroy.

Changes to Outputs:
  - cloudwatch_system_log_group = "/aws/ec2/dev-system-logs" -> null
  - ec2_instance_id             = "i-0a4e5c0ffbd790910" -> null
  - ec2_public_ip               = "13.205.92.122" -> null
  - public_subnet_ids           = [
      - "subnet-0437bd180a210fbc0",
      - "subnet-0464e9ef42b415ae6",
    ] -> null
  - s3_bucket_name              = "aws-dev-app-assets-storage-unique-12345" -> null
  - vpc_id                      = "vpc-02bbd8bdd83126d09" -> null

─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply" now.
ubuntu@ip-172-31-3-226:~/Ansible-Terraform-Infra/terraform/environments/dev$ terraform destroy
data.aws_ami.ubuntu: Reading...
module.vpc.aws_vpc.this: Refreshing state... [id=vpc-02bbd8bdd83126d09]
module.s3.aws_s3_bucket.this: Refreshing state... [id=aws-dev-app-assets-storage-unique-12345]
module.cloudwatch.aws_cloudwatch_log_group.app_logs: Refreshing state... [id=/aws/ec2/dev-app-logs]
module.iam.aws_iam_role.ec2_role: Refreshing state... [id=dev-ec2-role]
module.cloudwatch.aws_cloudwatch_log_group.sys_logs: Refreshing state... [id=/aws/ec2/dev-system-logs]
data.aws_ami.ubuntu: Read complete after 1s [id=ami-0aa761682283b4cc8]
module.s3.aws_s3_bucket_public_access_block.this: Refreshing state... [id=aws-dev-app-assets-storage-unique-12345]
module.iam.aws_iam_policy.s3_access: Refreshing state... [id=arn:aws:iam::383234049116:policy/dev-s3-access-policy]
module.s3.aws_s3_bucket_server_side_encryption_configuration.this: Refreshing state... [id=aws-dev-app-assets-storage-unique-12345]
module.s3.aws_s3_bucket_versioning.this: Refreshing state... [id=aws-dev-app-assets-storage-unique-12345]
module.subnets.aws_subnet.public[0]: Refreshing state... [id=subnet-0437bd180a210fbc0]
module.security_group.aws_security_group.ec2: Refreshing state... [id=sg-0fec03b485702c34d]
module.internet_gateway.aws_internet_gateway.this: Refreshing state... [id=igw-0cedbdc6da4e0cb9b]
module.subnets.aws_subnet.public[1]: Refreshing state... [id=subnet-0464e9ef42b415ae6]
module.route_tables.aws_route_table.public: Refreshing state... [id=rtb-0986b4e0100eb322f]
module.route_tables.aws_route_table_association.public[0]: Refreshing state... [id=rtbassoc-0d2ce7b7e93ec7964]
module.route_tables.aws_route_table_association.public[1]: Refreshing state... [id=rtbassoc-0133e428f2035a787]
module.iam.aws_iam_instance_profile.ec2_profile: Refreshing state... [id=dev-ec2-instance-profile]
module.iam.aws_iam_role_policy_attachment.cloudwatch_agent: Refreshing state... [id=dev-ec2-role-20260801091440374900000001]
module.iam.aws_iam_role_policy_attachment.ssm_core: Refreshing state... [id=dev-ec2-role-20260801091440410300000002]
module.iam.aws_iam_role_policy_attachment.s3_access_attach: Refreshing state... [id=dev-ec2-role-20260801091440821300000003]
module.ec2.aws_instance.bastion: Refreshing state... [id=i-0a4e5c0ffbd790910]
module.ec2.aws_eip.bastion: Refreshing state... [id=eipalloc-03fd89d43aa4ea0cb]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # module.cloudwatch.aws_cloudwatch_log_group.app_logs will be destroyed
  - resource "aws_cloudwatch_log_group" "app_logs" {
      - arn               = "arn:aws:logs:ap-south-1:383234049116:log-group:/aws/ec2/dev-app-logs" -> null
      - id                = "/aws/ec2/dev-app-logs" -> null
      - log_group_class   = "STANDARD" -> null
      - name              = "/aws/ec2/dev-app-logs" -> null
      - retention_in_days = 7 -> null
      - skip_destroy      = false -> null
      - tags              = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Project"     = "aws-terraform-ansible-infra"
        } -> null
      - tags_all          = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Project"     = "aws-terraform-ansible-infra"
        } -> null
        # (2 unchanged attributes hidden)
    }

  # module.cloudwatch.aws_cloudwatch_log_group.sys_logs will be destroyed
  - resource "aws_cloudwatch_log_group" "sys_logs" {
      - arn               = "arn:aws:logs:ap-south-1:383234049116:log-group:/aws/ec2/dev-system-logs" -> null
      - id                = "/aws/ec2/dev-system-logs" -> null
      - log_group_class   = "STANDARD" -> null
      - name              = "/aws/ec2/dev-system-logs" -> null
      - retention_in_days = 7 -> null
      - skip_destroy      = false -> null
      - tags              = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Project"     = "aws-terraform-ansible-infra"
        } -> null
      - tags_all          = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Project"     = "aws-terraform-ansible-infra"
        } -> null
        # (2 unchanged attributes hidden)
    }

  # module.ec2.aws_eip.bastion will be destroyed
  - resource "aws_eip" "bastion" {
      - allocation_id            = "eipalloc-03fd89d43aa4ea0cb" -> null
      - arn                      = "arn:aws:ec2:ap-south-1:383234049116:elastic-ip/eipalloc-03fd89d43aa4ea0cb" -> null
      - association_id           = "eipassoc-0327d1d34c5ab20fe" -> null
      - domain                   = "vpc" -> null
      - id                       = "eipalloc-03fd89d43aa4ea0cb" -> null
      - instance                 = "i-0a4e5c0ffbd790910" -> null
      - network_border_group     = "ap-south-1" -> null
      - network_interface        = "eni-0c58280bcab2223ae" -> null
      - private_dns              = "ip-10-0-1-222.ap-south-1.compute.internal" -> null
      - private_ip               = "10.0.1.222" -> null
      - public_dns               = "ec2-13-205-92-122.ap-south-1.compute.amazonaws.com" -> null
      - public_ip                = "13.205.92.122" -> null
      - public_ipv4_pool         = "amazon" -> null
      - tags                     = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "dev-bastion-eip"
          - "Project"     = "aws-terraform-ansible-infra"
        } -> null
      - tags_all                 = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "dev-bastion-eip"
          - "Project"     = "aws-terraform-ansible-infra"
        } -> null
      - vpc                      = true -> null
        # (4 unchanged attributes hidden)
    }

  # module.ec2.aws_instance.bastion will be destroyed
  - resource "aws_instance" "bastion" {
      - ami                                  = "ami-0aa761682283b4cc8" -> null
      - arn                                  = "arn:aws:ec2:ap-south-1:383234049116:instance/i-0a4e5c0ffbd790910" -> null
      - associate_public_ip_address          = true -> null
      - availability_zone                    = "ap-south-1a" -> null
      - cpu_core_count                       = 1 -> null
      - cpu_threads_per_core                 = 2 -> null
      - disable_api_stop                     = false -> null
      - disable_api_termination              = false -> null
      - ebs_optimized                        = false -> null
      - get_password_data                    = false -> null
      - hibernation                          = false -> null
      - iam_instance_profile                 = "dev-ec2-instance-profile" -> null
      - id                                   = "i-0a4e5c0ffbd790910" -> null
      - instance_initiated_shutdown_behavior = "stop" -> null
      - instance_state                       = "running" -> null
      - instance_type                        = "t3.micro" -> null
      - ipv6_address_count                   = 0 -> null
      - ipv6_addresses                       = [] -> null
      - key_name                             = "terraform-ansible-automation-infrastructure" -> null
      - monitoring                           = false -> null
      - placement_partition_number           = 0 -> null
      - primary_network_interface_id         = "eni-0c58280bcab2223ae" -> null
      - private_dns                          = "ip-10-0-1-222.ap-south-1.compute.internal" -> null
      - private_ip                           = "10.0.1.222" -> null
      - public_dns                           = "ec2-13-205-92-122.ap-south-1.compute.amazonaws.com" -> null
      - public_ip                            = "13.205.92.122" -> null
      - secondary_private_ips                = [] -> null
      - security_groups                      = [] -> null
      - source_dest_check                    = true -> null
      - subnet_id                            = "subnet-0437bd180a210fbc0" -> null
      - tags                                 = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "dev-bastion-host"
          - "Project"     = "aws-terraform-ansible-infra"
        } -> null
      - tags_all                             = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "dev-bastion-host"
          - "Project"     = "aws-terraform-ansible-infra"
        } -> null
      - tenancy                              = "default" -> null
      - user_data_replace_on_change          = false -> null
      - vpc_security_group_ids               = [
          - "sg-0fec03b485702c34d",
        ] -> null
        # (6 unchanged attributes hidden)

      - capacity_reservation_specification {
          - capacity_reservation_preference = "open" -> null
        }

      - cpu_options {
          - core_count       = 1 -> null
          - threads_per_core = 2 -> null
            # (1 unchanged attribute hidden)
        }

      - credit_specification {
          - cpu_credits = "unlimited" -> null
        }

      - enclave_options {
          - enabled = false -> null
        }

      - maintenance_options {
          - auto_recovery = "default" -> null
        }

      - metadata_options {
          - http_endpoint               = "enabled" -> null
          - http_protocol_ipv6          = "disabled" -> null
          - http_put_response_hop_limit = 1 -> null
          - http_tokens                 = "required" -> null
          - instance_metadata_tags      = "disabled" -> null
        }

      - private_dns_name_options {
          - enable_resource_name_dns_a_record    = false -> null
          - enable_resource_name_dns_aaaa_record = false -> null
          - hostname_type                        = "ip-name" -> null
        }

      - root_block_device {
          - delete_on_termination = true -> null
          - device_name           = "/dev/sda1" -> null
          - encrypted             = true -> null
          - iops                  = 3000 -> null
          - kms_key_id            = "arn:aws:kms:ap-south-1:383234049116:key/1b5ae09a-356d-46f0-a67c-7f010547569f" -> null
          - tags                  = {} -> null
          - tags_all              = {
              - "Environment" = "dev"
              - "ManagedBy"   = "Terraform"
              - "Project"     = "aws-terraform-ansible-infra"
            } -> null
          - throughput            = 125 -> null
          - volume_id             = "vol-09104d7eaaf6cef61" -> null
          - volume_size           = 20 -> null
          - volume_type           = "gp3" -> null
        }
    }

  # module.iam.aws_iam_instance_profile.ec2_profile will be destroyed
  - resource "aws_iam_instance_profile" "ec2_profile" {
      - arn         = "arn:aws:iam::383234049116:instance-profile/dev-ec2-instance-profile" -> null
      - create_date = "2026-08-01T09:14:39Z" -> null
      - id          = "dev-ec2-instance-profile" -> null
      - name        = "dev-ec2-instance-profile" -> null
      - path        = "/" -> null
      - role        = "dev-ec2-role" -> null
      - tags        = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "dev-ec2-instance-profile"
          - "Project"     = "aws-terraform-ansible-infra"
        } -> null
      - tags_all    = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "dev-ec2-instance-profile"
          - "Project"     = "aws-terraform-ansible-infra"
        } -> null
      - unique_id   = "AIPAVSOUHQROEP72K6KLE" -> null
        # (1 unchanged attribute hidden)
    }

  # module.iam.aws_iam_policy.s3_access will be destroyed
  - resource "aws_iam_policy" "s3_access" {
      - arn              = "arn:aws:iam::383234049116:policy/dev-s3-access-policy" -> null
      - attachment_count = 1 -> null
      - description      = "Allows access to application S3 bucket" -> null
      - id               = "arn:aws:iam::383234049116:policy/dev-s3-access-policy" -> null
      - name             = "dev-s3-access-policy" -> null
      - path             = "/" -> null
      - policy           = jsonencode(
            {
              - Statement = [
                  - {
                      - Action   = [
                          - "s3:GetObject",
                          - "s3:PutObject",
                          - "s3:ListBucket",
                        ]
                      - Effect   = "Allow"
                      - Resource = [
                          - "arn:aws:s3:::aws-dev-app-assets-storage-unique-12345",
                          - "arn:aws:s3:::aws-dev-app-assets-storage-unique-12345/*",
                        ]
                    },
                ]
              - Version   = "2012-10-17"
            }
        ) -> null
      - policy_id        = "ANPAVSOUHQROJO6ZVB5HT" -> null
      - tags             = {} -> null
      - tags_all         = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Project"     = "aws-terraform-ansible-infra"
        } -> null
        # (1 unchanged attribute hidden)
    }

  # module.iam.aws_iam_role.ec2_role will be destroyed
  - resource "aws_iam_role" "ec2_role" {
      - arn                   = "arn:aws:iam::383234049116:role/dev-ec2-role" -> null
      - assume_role_policy    = jsonencode(
            {
              - Statement = [
                  - {
                      - Action    = "sts:AssumeRole"
                      - Effect    = "Allow"
                      - Principal = {
                          - Service = "ec2.amazonaws.com"
                        }
                    },
                ]
              - Version   = "2012-10-17"
            }
        ) -> null
      - create_date           = "2026-08-01T09:14:38Z" -> null
      - force_detach_policies = false -> null
      - id                    = "dev-ec2-role" -> null
      - managed_policy_arns   = [
          - "arn:aws:iam::383234049116:policy/dev-s3-access-policy",
          - "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore",
          - "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy",
        ] -> null
      - max_session_duration  = 3600 -> null
      - name                  = "dev-ec2-role" -> null
      - path                  = "/" -> null
      - tags                  = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "dev-ec2-role"
          - "Project"     = "aws-terraform-ansible-infra"
        } -> null
      - tags_all              = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "dev-ec2-role"
          - "Project"     = "aws-terraform-ansible-infra"
        } -> null
      - unique_id             = "AROAVSOUHQROPI36BYWYF" -> null
        # (3 unchanged attributes hidden)
    }

  # module.iam.aws_iam_role_policy_attachment.cloudwatch_agent will be destroyed
  - resource "aws_iam_role_policy_attachment" "cloudwatch_agent" {
      - id         = "dev-ec2-role-20260801091440374900000001" -> null
      - policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy" -> null
      - role       = "dev-ec2-role" -> null
    }

  # module.iam.aws_iam_role_policy_attachment.s3_access_attach will be destroyed
  - resource "aws_iam_role_policy_attachment" "s3_access_attach" {
      - id         = "dev-ec2-role-20260801091440821300000003" -> null
      - policy_arn = "arn:aws:iam::383234049116:policy/dev-s3-access-policy" -> null
      - role       = "dev-ec2-role" -> null
    }

  # module.iam.aws_iam_role_policy_attachment.ssm_core will be destroyed
  - resource "aws_iam_role_policy_attachment" "ssm_core" {
      - id         = "dev-ec2-role-20260801091440410300000002" -> null
      - policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore" -> null
      - role       = "dev-ec2-role" -> null
    }

  # module.internet_gateway.aws_internet_gateway.this will be destroyed
  - resource "aws_internet_gateway" "this" {
      - arn      = "arn:aws:ec2:ap-south-1:383234049116:internet-gateway/igw-0cedbdc6da4e0cb9b" -> null
      - id       = "igw-0cedbdc6da4e0cb9b" -> null
      - owner_id = "383234049116" -> null
      - tags     = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "dev-igw"
          - "Project"     = "aws-terraform-ansible-infra"
        } -> null
      - tags_all = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "dev-igw"
          - "Project"     = "aws-terraform-ansible-infra"
        } -> null
      - vpc_id   = "vpc-02bbd8bdd83126d09" -> null
    }

  # module.route_tables.aws_route_table.public will be destroyed
  - resource "aws_route_table" "public" {
      - arn              = "arn:aws:ec2:ap-south-1:383234049116:route-table/rtb-0986b4e0100eb322f" -> null
      - id               = "rtb-0986b4e0100eb322f" -> null
      - owner_id         = "383234049116" -> null
      - propagating_vgws = [] -> null
      - route            = [
          - {
              - cidr_block                 = "0.0.0.0/0"
              - gateway_id                 = "igw-0cedbdc6da4e0cb9b"
                # (11 unchanged attributes hidden)
            },
        ] -> null
      - tags             = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "dev-public-rt"
          - "Project"     = "aws-terraform-ansible-infra"
        } -> null
      - tags_all         = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "dev-public-rt"
          - "Project"     = "aws-terraform-ansible-infra"
        } -> null
      - vpc_id           = "vpc-02bbd8bdd83126d09" -> null
    }

  # module.route_tables.aws_route_table_association.public[0] will be destroyed
  - resource "aws_route_table_association" "public" {
      - id             = "rtbassoc-0d2ce7b7e93ec7964" -> null
      - route_table_id = "rtb-0986b4e0100eb322f" -> null
      - subnet_id      = "subnet-0437bd180a210fbc0" -> null
        # (1 unchanged attribute hidden)
    }

  # module.route_tables.aws_route_table_association.public[1] will be destroyed
  - resource "aws_route_table_association" "public" {
      - id             = "rtbassoc-0133e428f2035a787" -> null
      - route_table_id = "rtb-0986b4e0100eb322f" -> null
      - subnet_id      = "subnet-0464e9ef42b415ae6" -> null
        # (1 unchanged attribute hidden)
    }

  # module.s3.aws_s3_bucket.this will be destroyed
  - resource "aws_s3_bucket" "this" {
      - arn                         = "arn:aws:s3:::aws-dev-app-assets-storage-unique-12345" -> null
      - bucket                      = "aws-dev-app-assets-storage-unique-12345" -> null
      - bucket_domain_name          = "aws-dev-app-assets-storage-unique-12345.s3.amazonaws.com" -> null
      - bucket_regional_domain_name = "aws-dev-app-assets-storage-unique-12345.s3.ap-south-1.amazonaws.com" -> null
      - force_destroy               = false -> null
      - hosted_zone_id              = "Z11RGJOFQNVJUP" -> null
      - id                          = "aws-dev-app-assets-storage-unique-12345" -> null
      - object_lock_enabled         = false -> null
      - region                      = "ap-south-1" -> null
      - request_payer               = "BucketOwner" -> null
      - tags                        = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "aws-dev-app-assets-storage-unique-12345"
          - "Project"     = "aws-terraform-ansible-infra"
        } -> null
      - tags_all                    = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "aws-dev-app-assets-storage-unique-12345"
          - "Project"     = "aws-terraform-ansible-infra"
        } -> null
        # (3 unchanged attributes hidden)

      - grant {
          - id          = "0dcfd5919cd71b317c7609e729e717151e9a8b9bec1a1dea6a19116a8dc9b538" -> null
          - permissions = [
              - "FULL_CONTROL",
            ] -> null
          - type        = "CanonicalUser" -> null
            # (1 unchanged attribute hidden)
        }

      - server_side_encryption_configuration {
          - rule {
              - bucket_key_enabled = false -> null

              - apply_server_side_encryption_by_default {
                  - sse_algorithm     = "AES256" -> null
                    # (1 unchanged attribute hidden)
                }
            }
        }

      - versioning {
          - enabled    = true -> null
          - mfa_delete = false -> null
        }
    }

  # module.s3.aws_s3_bucket_public_access_block.this will be destroyed
  - resource "aws_s3_bucket_public_access_block" "this" {
      - block_public_acls       = true -> null
      - block_public_policy     = true -> null
      - bucket                  = "aws-dev-app-assets-storage-unique-12345" -> null
      - id                      = "aws-dev-app-assets-storage-unique-12345" -> null
      - ignore_public_acls      = true -> null
      - restrict_public_buckets = true -> null
    }

  # module.s3.aws_s3_bucket_server_side_encryption_configuration.this will be destroyed
  - resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
      - bucket                = "aws-dev-app-assets-storage-unique-12345" -> null
      - id                    = "aws-dev-app-assets-storage-unique-12345" -> null
        # (1 unchanged attribute hidden)

      - rule {
          - bucket_key_enabled = false -> null

          - apply_server_side_encryption_by_default {
              - sse_algorithm     = "AES256" -> null
                # (1 unchanged attribute hidden)
            }
        }
    }

  # module.s3.aws_s3_bucket_versioning.this will be destroyed
  - resource "aws_s3_bucket_versioning" "this" {
      - bucket                = "aws-dev-app-assets-storage-unique-12345" -> null
      - id                    = "aws-dev-app-assets-storage-unique-12345" -> null
        # (1 unchanged attribute hidden)

      - versioning_configuration {
          - status     = "Enabled" -> null
            # (1 unchanged attribute hidden)
        }
    }

  # module.security_group.aws_security_group.ec2 will be destroyed
  - resource "aws_security_group" "ec2" {
      - arn                    = "arn:aws:ec2:ap-south-1:383234049116:security-group/sg-0fec03b485702c34d" -> null
      - description            = "Security group for EC2 instance running App, Nginx, Prometheus, Grafana" -> null
      - egress                 = [
          - {
              - cidr_blocks      = [
                  - "0.0.0.0/0",
                ]
              - description      = "Allow all outbound traffic"
              - from_port        = 0
              - ipv6_cidr_blocks = []
              - prefix_list_ids  = []
              - protocol         = "-1"
              - security_groups  = []
              - self             = false
              - to_port          = 0
            },
        ] -> null
      - id                     = "sg-0fec03b485702c34d" -> null
      - ingress                = [
          - {
              - cidr_blocks      = [
                  - "0.0.0.0/0",
                ]
              - description      = "Grafana Dashboard Ingress"
              - from_port        = 3001
              - ipv6_cidr_blocks = []
              - prefix_list_ids  = []
              - protocol         = "tcp"
              - security_groups  = []
              - self             = false
              - to_port          = 3001
            },
          - {
              - cidr_blocks      = [
                  - "0.0.0.0/0",
                ]
              - description      = "HTTP Ingress for Nginx Reverse Proxy"
              - from_port        = 80
              - ipv6_cidr_blocks = []
              - prefix_list_ids  = []
              - protocol         = "tcp"
              - security_groups  = []
              - self             = false
              - to_port          = 80
            },
          - {
              - cidr_blocks      = [
                  - "0.0.0.0/0",
                ]
              - description      = "Prometheus UI Ingress"
              - from_port        = 9090
              - ipv6_cidr_blocks = []
              - prefix_list_ids  = []
              - protocol         = "tcp"
              - security_groups  = []
              - self             = false
              - to_port          = 9090
            },
          - {
              - cidr_blocks      = [
                  - "0.0.0.0/0",
                ]
              - description      = "SSH Ingress"
              - from_port        = 22
              - ipv6_cidr_blocks = []
              - prefix_list_ids  = []
              - protocol         = "tcp"
              - security_groups  = []
              - self             = false
              - to_port          = 22
            },
          - {
              - cidr_blocks      = [
                  - "10.0.0.0/16",
                ]
              - description      = "Node Exporter Metric Scraping"
              - from_port        = 9100
              - ipv6_cidr_blocks = []
              - prefix_list_ids  = []
              - protocol         = "tcp"
              - security_groups  = []
              - self             = false
              - to_port          = 9100
            },
          - {
              - cidr_blocks      = [
                  - "10.0.0.0/16",
                ]
              - description      = "cAdvisor Metric Scraping"
              - from_port        = 8080
              - ipv6_cidr_blocks = []
              - prefix_list_ids  = []
              - protocol         = "tcp"
              - security_groups  = []
              - self             = false
              - to_port          = 8080
            },
        ] -> null
      - name                   = "dev-ec2-sg" -> null
      - owner_id               = "383234049116" -> null
      - revoke_rules_on_delete = false -> null
      - tags                   = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "dev-ec2-sg"
          - "Project"     = "aws-terraform-ansible-infra"
        } -> null
      - tags_all               = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "dev-ec2-sg"
          - "Project"     = "aws-terraform-ansible-infra"
        } -> null
      - vpc_id                 = "vpc-02bbd8bdd83126d09" -> null
        # (1 unchanged attribute hidden)
    }

  # module.subnets.aws_subnet.public[0] will be destroyed
  - resource "aws_subnet" "public" {
      - arn                                            = "arn:aws:ec2:ap-south-1:383234049116:subnet/subnet-0437bd180a210fbc0" -> null
      - assign_ipv6_address_on_creation                = false -> null
      - availability_zone                              = "ap-south-1a" -> null
      - availability_zone_id                           = "aps1-az1" -> null
      - cidr_block                                     = "10.0.1.0/24" -> null
      - enable_dns64                                   = false -> null
      - enable_lni_at_device_index                     = 0 -> null
      - enable_resource_name_dns_a_record_on_launch    = false -> null
      - enable_resource_name_dns_aaaa_record_on_launch = false -> null
      - id                                             = "subnet-0437bd180a210fbc0" -> null
      - ipv6_native                                    = false -> null
      - map_customer_owned_ip_on_launch                = false -> null
      - map_public_ip_on_launch                        = true -> null
      - owner_id                                       = "383234049116" -> null
      - private_dns_hostname_type_on_launch            = "ip-name" -> null
      - tags                                           = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "dev-public-subnet-1"
          - "Project"     = "aws-terraform-ansible-infra"
          - "Type"        = "Public"
        } -> null
      - tags_all                                       = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "dev-public-subnet-1"
          - "Project"     = "aws-terraform-ansible-infra"
          - "Type"        = "Public"
        } -> null
      - vpc_id                                         = "vpc-02bbd8bdd83126d09" -> null
        # (4 unchanged attributes hidden)
    }

  # module.subnets.aws_subnet.public[1] will be destroyed
  - resource "aws_subnet" "public" {
      - arn                                            = "arn:aws:ec2:ap-south-1:383234049116:subnet/subnet-0464e9ef42b415ae6" -> null
      - assign_ipv6_address_on_creation                = false -> null
      - availability_zone                              = "ap-south-1b" -> null
      - availability_zone_id                           = "aps1-az3" -> null
      - cidr_block                                     = "10.0.2.0/24" -> null
      - enable_dns64                                   = false -> null
      - enable_lni_at_device_index                     = 0 -> null
      - enable_resource_name_dns_a_record_on_launch    = false -> null
      - enable_resource_name_dns_aaaa_record_on_launch = false -> null
      - id                                             = "subnet-0464e9ef42b415ae6" -> null
      - ipv6_native                                    = false -> null
      - map_customer_owned_ip_on_launch                = false -> null
      - map_public_ip_on_launch                        = true -> null
      - owner_id                                       = "383234049116" -> null
      - private_dns_hostname_type_on_launch            = "ip-name" -> null
      - tags                                           = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "dev-public-subnet-2"
          - "Project"     = "aws-terraform-ansible-infra"
          - "Type"        = "Public"
        } -> null
      - tags_all                                       = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "dev-public-subnet-2"
          - "Project"     = "aws-terraform-ansible-infra"
          - "Type"        = "Public"
        } -> null
      - vpc_id                                         = "vpc-02bbd8bdd83126d09" -> null
        # (4 unchanged attributes hidden)
    }

  # module.vpc.aws_vpc.this will be destroyed
  - resource "aws_vpc" "this" {
      - arn                                  = "arn:aws:ec2:ap-south-1:383234049116:vpc/vpc-02bbd8bdd83126d09" -> null
      - assign_generated_ipv6_cidr_block     = false -> null
      - cidr_block                           = "10.0.0.0/16" -> null
      - default_network_acl_id               = "acl-0f4c87de3ec9e20f2" -> null
      - default_route_table_id               = "rtb-049d0ac20fcbc399e" -> null
      - default_security_group_id            = "sg-0b3eebc7749420ff1" -> null
      - dhcp_options_id                      = "dopt-0dc05d96a069b7753" -> null
      - enable_dns_hostnames                 = true -> null
      - enable_dns_support                   = true -> null
      - enable_network_address_usage_metrics = false -> null
      - id                                   = "vpc-02bbd8bdd83126d09" -> null
      - instance_tenancy                     = "default" -> null
      - ipv6_netmask_length                  = 0 -> null
      - main_route_table_id                  = "rtb-049d0ac20fcbc399e" -> null
      - owner_id                             = "383234049116" -> null
      - tags                                 = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "dev-vpc"
          - "Project"     = "aws-terraform-ansible-infra"
        } -> null
      - tags_all                             = {
          - "Environment" = "dev"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "dev-vpc"
          - "Project"     = "aws-terraform-ansible-infra"
        } -> null
        # (4 unchanged attributes hidden)
    }

Plan: 0 to add, 0 to change, 22 to destroy.

Changes to Outputs:
  - cloudwatch_system_log_group = "/aws/ec2/dev-system-logs" -> null
  - ec2_instance_id             = "i-0a4e5c0ffbd790910" -> null
  - ec2_public_ip               = "13.205.92.122" -> null
  - public_subnet_ids           = [
      - "subnet-0437bd180a210fbc0",
      - "subnet-0464e9ef42b415ae6",
    ] -> null
  - s3_bucket_name              = "aws-dev-app-assets-storage-unique-12345" -> null
  - vpc_id                      = "vpc-02bbd8bdd83126d09" -> null

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

module.route_tables.aws_route_table_association.public[0]: Destroying... [id=rtbassoc-0d2ce7b7e93ec7964]
module.s3.aws_s3_bucket_server_side_encryption_configuration.this: Destroying... [id=aws-dev-app-assets-storage-unique-12345]
module.cloudwatch.aws_cloudwatch_log_group.app_logs: Destroying... [id=/aws/ec2/dev-app-logs]
module.iam.aws_iam_role_policy_attachment.s3_access_attach: Destroying... [id=dev-ec2-role-20260801091440821300000003]
module.ec2.aws_eip.bastion: Destroying... [id=eipalloc-03fd89d43aa4ea0cb]
module.cloudwatch.aws_cloudwatch_log_group.sys_logs: Destroying... [id=/aws/ec2/dev-system-logs]
module.iam.aws_iam_role_policy_attachment.ssm_core: Destroying... [id=dev-ec2-role-20260801091440410300000002]
module.s3.aws_s3_bucket_versioning.this: Destroying... [id=aws-dev-app-assets-storage-unique-12345]
module.s3.aws_s3_bucket_public_access_block.this: Destroying... [id=aws-dev-app-assets-storage-unique-12345]
module.iam.aws_iam_role_policy_attachment.cloudwatch_agent: Destroying... [id=dev-ec2-role-20260801091440374900000001]
module.cloudwatch.aws_cloudwatch_log_group.sys_logs: Destruction complete after 0s
module.route_tables.aws_route_table_association.public[1]: Destroying... [id=rtbassoc-0133e428f2035a787]
module.cloudwatch.aws_cloudwatch_log_group.app_logs: Destruction complete after 0s
module.route_tables.aws_route_table_association.public[0]: Destruction complete after 0s
module.route_tables.aws_route_table_association.public[1]: Destruction complete after 0s
module.route_tables.aws_route_table.public: Destroying... [id=rtb-0986b4e0100eb322f]
module.s3.aws_s3_bucket_public_access_block.this: Destruction complete after 0s
module.s3.aws_s3_bucket_server_side_encryption_configuration.this: Destruction complete after 0s
module.route_tables.aws_route_table.public: Destruction complete after 0s
module.internet_gateway.aws_internet_gateway.this: Destroying... [id=igw-0cedbdc6da4e0cb9b]
module.iam.aws_iam_role_policy_attachment.s3_access_attach: Destruction complete after 1s
module.iam.aws_iam_policy.s3_access: Destroying... [id=arn:aws:iam::383234049116:policy/dev-s3-access-policy]
module.iam.aws_iam_role_policy_attachment.cloudwatch_agent: Destruction complete after 1s
module.s3.aws_s3_bucket_versioning.this: Destruction complete after 1s
module.iam.aws_iam_role_policy_attachment.ssm_core: Destruction complete after 1s
module.iam.aws_iam_policy.s3_access: Destruction complete after 0s
module.s3.aws_s3_bucket.this: Destroying... [id=aws-dev-app-assets-storage-unique-12345]
module.ec2.aws_eip.bastion: Destruction complete after 1s
module.ec2.aws_instance.bastion: Destroying... [id=i-0a4e5c0ffbd790910]
module.s3.aws_s3_bucket.this: Destruction complete after 1s
module.internet_gateway.aws_internet_gateway.this: Still destroying... [id=igw-0cedbdc6da4e0cb9b, 00m10s elapsed]
module.ec2.aws_instance.bastion: Still destroying... [id=i-0a4e5c0ffbd790910, 00m10s elapsed]
module.internet_gateway.aws_internet_gateway.this: Still destroying... [id=igw-0cedbdc6da4e0cb9b, 00m20s elapsed]
module.ec2.aws_instance.bastion: Still destroying... [id=i-0a4e5c0ffbd790910, 00m20s elapsed]
module.internet_gateway.aws_internet_gateway.this: Still destroying... [id=igw-0cedbdc6da4e0cb9b, 00m30s elapsed]
module.ec2.aws_instance.bastion: Still destroying... [id=i-0a4e5c0ffbd790910, 00m30s elapsed]
module.internet_gateway.aws_internet_gateway.this: Destruction complete after 37s
module.ec2.aws_instance.bastion: Destruction complete after 40s
module.subnets.aws_subnet.public[1]: Destroying... [id=subnet-0464e9ef42b415ae6]
module.iam.aws_iam_instance_profile.ec2_profile: Destroying... [id=dev-ec2-instance-profile]
module.security_group.aws_security_group.ec2: Destroying... [id=sg-0fec03b485702c34d]
module.subnets.aws_subnet.public[0]: Destroying... [id=subnet-0437bd180a210fbc0]
module.subnets.aws_subnet.public[1]: Destruction complete after 1s
module.iam.aws_iam_instance_profile.ec2_profile: Destruction complete after 1s
module.iam.aws_iam_role.ec2_role: Destroying... [id=dev-ec2-role]
module.subnets.aws_subnet.public[0]: Destruction complete after 1s
module.security_group.aws_security_group.ec2: Destruction complete after 1s
module.vpc.aws_vpc.this: Destroying... [id=vpc-02bbd8bdd83126d09]
module.iam.aws_iam_role.ec2_role: Destruction complete after 0s
module.vpc.aws_vpc.this: Destruction complete after 0s

Destroy complete! Resources: 22 destroyed.
ubuntu@ip-172-31-3-226:~/Ansible-Terraform-Infra/terraform/environments/dev$

ubuntu@ip-172-31-3-226:~/Ansible-Terraform-Infra/terraform/environments/dev$ terraform state list
ubuntu@ip-172-31-3-226:~/Ansible-Terraform-Infra/terraform/environments/dev$ aws ec2 describe-instances \
  --region ap-south-1 \
  --filters "Name=tag:Environment,Values=dev" \
  --query 'Reservations[].Instances[].{ID:InstanceId,State:State.Name}' \
  --output table
---------------------------------------
|          DescribeInstances          |
+----------------------+--------------+
|          ID          |    State     |
+----------------------+--------------+
|  i-0a4e5c0ffbd790910 |  terminated  |
+----------------------+--------------+
ubuntu@ip-172-31-3-226:~/Ansible-Terraform-Infra/terraform/environments/dev$