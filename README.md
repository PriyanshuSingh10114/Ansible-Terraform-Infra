# AWS Production-Grade Infrastructure Automation Platform (`aws-terraform-ansible-infra`)

[![Terraform](https://img.shields.io/badge/Terraform-%3E%3D1.6.0-623CE4?logo=terraform&logoColor=white)](https://www.terraform.io/)
[![Ansible](https://img.shields.io/badge/Ansible-2.15-EE0000?logo=ansible&logoColor=white)](https://www.ansible.com/)
[![Docker](https://img.shields.io/badge/Docker-24.0-2496ED?logo=docker&logoColor=white)](https://www.docker.com/)
[![Prometheus](https://img.shields.io/badge/Prometheus-2.47-E6522C?logo=prometheus&logoColor=white)](https://prometheus.io/)
[![Grafana](https://img.shields.io/badge/Grafana-10.1-F46800?logo=grafana&logoColor=white)](https://grafana.com/)
[![AWS](https://img.shields.io/badge/AWS-Free%20Tier-FF9900?logo=amazon-aws&logoColor=white)](https://aws.amazon.com/)

An enterprise-ready, modular, secure, and cost-optimized Infrastructure as Code (IaC) and Automation platform. Built with **Terraform 1.6+**, **Ansible**, **Docker Compose**, **Nginx**, **Prometheus**, **Grafana**, and **AWS Services** following AWS Well-Architected Framework guidelines.

---

## Author & Maintainer

**Priyanshu Singh**
- **GitHub**: [@PriyanshuSingh10114](https://github.com/PriyanshuSingh10114)
- **Repository**: [PriyanshuSingh10114/Ansible-Terraform-Infra](https://github.com/PriyanshuSingh10114/Ansible-Terraform-Infra)
- **Role**: Cloud & DevOps Engineer

---

## 1. Project Architecture

```mermaid
graph TD
    Client[Internet Client / Admin] -->|HTTP Port 80| Nginx[Nginx Reverse Proxy]
    Client -->|SSH Port 22| EC2[Ubuntu EC2 Instance]
    Client -->|HTTP Port 3000| Grafana[Grafana Dashboard]
    Client -->|HTTP Port 9090| Prom[Prometheus UI]

    subgraph AWS VPC (10.0.0.0/16)
        subgraph Public Subnet (10.0.1.0/24)
            IGW[Internet Gateway] <--> RouteTable[Public Route Table]
            RouteTable <--> EC2
            
            subgraph Container Engine (Docker Compose)
                Nginx -->|Proxy Pass 127.0.0.1:3000| NodeApp[Node.js Express App]
                NodeExporter[Node Exporter :9100] --> Prom
                cAdvisor[cAdvisor :8080] --> Prom
                NodeApp -->|/metrics| Prom
                Prom --> Grafana
                CWAgent[CloudWatch Agent] -->|Push Logs| CloudWatch[AWS CloudWatch Logs]
            end
        end
        SG[Security Group] --> EC2
        IAMProfile[IAM Instance Profile] --> EC2
    end

    EC2 -->|S3 API Read/Write| S3Bucket[App S3 Bucket]
    Bootstrap[Bootstrap Remote State] -->|S3 State + Lockfile| S3State[S3 Remote State Bucket]
```

---

## 2. Student Cost Safety & AWS Budget Analysis

| AWS Resource | Included | Free Tier Limit | Est. Monthly Cost | Cost Reduction Rationale |
| :--- | :---: | :--- | :--- | :--- |
| **VPC & Internet Gateway** | Yes | Always Free | **$0.00** | Core networking zero hourly charge |
| **1x Public Subnet** | Yes | Always Free | **$0.00** | Direct route to IGW |
| **1x EC2 Instance (t3.micro)** | Yes | 750 hours/month | **$0.00** | Fits entirely inside 12-Month AWS Free Tier |
| **S3 Buckets (App + State)** | Yes | 5GB S3 Storage free | **$0.00** | Native S3 lockfiles (`use_lockfile = true`), no DynamoDB fees |
| **CloudWatch Log Group** | Yes | 5GB Log Ingestion free | **$0.00** | Set to 7-day retention |
| **ALB / NAT Gateway / RDS** | **Excluded** | Non-Free Tier | **Saved ~$70+/mo** | Excluded per student budget safety rules |

---

## 3. Directory Structure

```text
aws-terraform-ansible-infra/
├── .github/
│   └── workflows/
│       └── ci-cd.yml                   # GitHub Actions pipeline
├── bootstrap/
│   └── remote-state/                   # Terraform Remote State S3 Bootstrapping
│       ├── versions.tf
│       ├── providers.tf
│       ├── variables.tf
│       ├── terraform.tfvars
│       ├── main.tf
│       └── outputs.tf
├── terraform/
│   ├── modules/                        # Reusable Single-Responsibility Modules
│   │   ├── vpc/
│   │   ├── subnets/
│   │   ├── internet_gateway/
│   │   ├── route_tables/
│   │   ├── security_group/
│   │   ├── iam/
│   │   ├── ec2/
│   │   ├── s3/                         # Reusable S3 module
│   │   └── cloudwatch/
│   └── environments/                   # Infrastructure Environments
│       ├── dev/
│       └── prod/
├── ansible/                            # Configuration Management
│   ├── ansible.cfg
│   ├── site.yml
│   ├── group_vars/
│   ├── inventories/
│   └── roles/
│       ├── common/
│       ├── security/
│       ├── users/
│       ├── docker/
│       ├── nginx/
│       ├── application/
│       ├── monitoring/
│       └── backup/
├── app/                                # Dockerized Node.js Web Service
├── monitoring/                         # Observability Stack (Prometheus/Grafana)
├── scripts/                            # Operational Helper Scripts
│   ├── install.sh
│   ├── deploy.sh
│   ├── destroy.sh
│   ├── validate.sh
│   └── cleanup.sh
├── Makefile                            # One-command execution targets
└── README.md
```

---

## 4. One-Command Execution Guide

### Prerequisites
1. Linux/macOS environment or WSL2 on Windows.
2. Active AWS Account credentials (`aws configure`).

### Setup & One-Command Deployment
```bash
# 1. Install all prerequisites (AWS CLI, Terraform, Ansible, Docker)
make install   # or ./scripts/install.sh

# 2. Bootstrap Terraform Remote State S3 Bucket
make bootstrap

# 3. Validate system code and Ansible syntax
make validate

# 4. Deploy full infrastructure and application stack
make deploy ENV=dev

# 5. Destroy infrastructure when finished to maintain $0 costs
make destroy ENV=dev

# 6. Clean temporary build caches
make clean
```

---

## 5. Available Makefile Targets

| Target | Description |
| :--- | :--- |
| `make bootstrap` | Provision S3 Remote State bucket via bootstrap module |
| `make init` | Run `terraform init` for environment (`ENV=dev\|prod`) |
| `make fmt` | Format all Terraform code recursively |
| `make validate` | Validate Terraform syntax and Ansible playbooks |
| `make plan` | Preview infrastructure changes (`ENV=dev\|prod`) |
| `make apply` | Apply infrastructure changes (`ENV=dev\|prod`) |
| `make deploy` | Run end-to-end Terraform apply and Ansible playbook deployment |
| `make destroy` | Destroy target infrastructure (`ENV=dev\|prod`) |
| `make clean` | Clean local `.terraform` caches and temporary log files |

---

## 6. Verification Steps

1. **Web Service**: Access `http://<EC2_PUBLIC_IP>/` -> JSON status output.
2. **Health Check**: Access `http://<EC2_PUBLIC_IP>/health` -> `{"status":"UP"}`.
3. **Grafana Dashboards**: Access `http://<EC2_PUBLIC_IP>:3000` (User: `admin` / Password: `adminpass`).
4. **Prometheus UI**: Access `http://<EC2_PUBLIC_IP>:9090/targets` -> Verify targets are `UP`.

---

## 7. Troubleshooting Guide

| Issue | Root Cause | Solution |
| :--- | :--- | :--- |
| `BucketAlreadyExists` | Bucket name collision | Change `state_bucket_name` in `bootstrap/remote-state/terraform.tfvars`. |
| `Host key verification failed` | First SSH connect | `ansible.cfg` sets `host_key_checking = False` by default. |
| `Permission denied` on scripts | Missing execution bit | Run `chmod +x scripts/*.sh`. |

---

## 8. License & Acknowledgments

Licensed under the MIT License. Built for educational and portfolio demonstration purposes.
