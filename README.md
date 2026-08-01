# AWS Production-Grade Infrastructure Automation Platform (`aws-terraform-ansible-infra`)

<div align="center">

[![AWS Region](https://img.shields.io/badge/AWS-ap--south--1-FF9900?style=for-the-badge&logo=amazon-aws&logoColor=white)](https://aws.amazon.com/)
[![Terraform](https://img.shields.io/badge/Terraform-%3E%3D1.10.0-623CE4?style=for-the-badge&logo=terraform&logoColor=white)](https://www.terraform.io/)
[![Ansible](https://img.shields.io/badge/Ansible-2.15%2B-EE0000?style=for-the-badge&logo=ansible&logoColor=white)](https://www.ansible.com/)
[![Docker](https://img.shields.io/badge/Docker-Compose_v2-2496ED?style=for-the-badge&logo=docker&logoColor=white)](https://www.docker.com/)
[![Ubuntu](https://img.shields.io/badge/Ubuntu-22.04_LTS-E95420?style=for-the-badge&logo=ubuntu&logoColor=white)](https://ubuntu.com/)

[![Prometheus](https://img.shields.io/badge/Prometheus-2.47-E6522C?style=for-the-badge&logo=prometheus&logoColor=white)](https://prometheus.io/)
[![Grafana](https://img.shields.io/badge/Grafana-10.1-F46800?style=for-the-badge&logo=grafana&logoColor=white)](https://grafana.com/)
[![Nginx](https://img.shields.io/badge/Nginx-Reverse_Proxy-009639?style=for-the-badge&logo=nginx&logoColor=white)](https://nginx.org/)
[![AWS Free Tier](https://img.shields.io/badge/AWS_Free_Tier-100%25_Compliant-00C853?style=for-the-badge&logo=amazonaws&logoColor=white)](https://aws.amazon.com/free/)
[![License](https://img.shields.io/badge/License-MIT-blue.svg?style=for-the-badge)](LICENSE)

</div>

An enterprise-ready, modular, secure, and student-cost-optimized Infrastructure as Code (IaC) and Automation platform standardized on **AWS Region `ap-south-1` (Mumbai)**. Built with **Terraform 1.10+**, **Ansible**, **Docker Compose**, **Nginx**, **Prometheus**, **Grafana**, and **AWS Services** following AWS Well-Architected Framework guidelines.

---

## Author & Maintainer

**Priyanshu Singh**
- **GitHub**: [@PriyanshuSingh10114](https://github.com/PriyanshuSingh10114)
- **Repository**: [PriyanshuSingh10114/Ansible-Terraform-Infra](https://github.com/PriyanshuSingh10114/Ansible-Terraform-Infra)
- **Role**: Cloud & DevOps Engineer

---

## 1. Project Overview

Modern cloud infrastructure must be **repeatable, version-controlled, automated, secure, environment-aware, easy to validate, and simple to tear down**. Manually provisioning AWS resources via the Management Console introduces configuration drift, operational overhead, and human error.

This platform solves this problem by providing an automated, single-command Infrastructure as Code and Configuration Management pipeline:

```text
Developer / DevOps Engineer
        |
        v
     Makefile
        |
        +-----------------------------+
        |                             |
        v                             v
   Terraform                       Ansible
        |                             |
        v                             v
AWS Infrastructure          Server Configuration
        |                             |
        +--------------+--------------+
                       |
                       v
                 Dockerized App
                       |
                       v
               Monitoring / Logs
```

- **Terraform** provisions all AWS infrastructure (VPC, Subnets, IGW, Route Tables, Security Groups, IAM Roles, EC2, S3, CloudWatch).
- **Ansible** configures the target server (system hardening, package installation, Docker engine, Nginx, application code, telemetry stack).
- **Docker Compose** runs the application and observability workloads consistently in containers.
- **Bash & Make** provide a unified operational automation layer.

---

## 2. Problem Statement & Solution

| Challenge | IaC / Automation Solution |
| :--- | :--- |
| **Manual AWS Provisioning** | Declarative Terraform modules define 100% of cloud resources. |
| **Configuration Drift** | Reusable Ansible roles enforce identical server configurations across environments. |
| **Lack of Reproducibility** | Full environment stack can be created or destroyed via single `make` commands. |
| **State File Vulnerabilities** | Remote state stored in encrypted, versioned S3 buckets (`priyanshu-ansible-terraform-tfstate-2026`) with native lockfile protection (`use_lockfile = true`). |
| **High Cloud Costs** | Strictly designed for **$0.00/month AWS Free Tier** compliance in `ap-south-1`. |

---

## 3. Technology Stack

| Component | Technology | Purpose |
| :--- | :--- | :--- |
| **Cloud Provider** | AWS (`ap-south-1`) | Infrastructure hosting |
| **IaC** | Terraform `>= 1.10.0` | Declarative infrastructure provisioning |
| **Config Management** | Ansible `2.15+` | Server setup, security hardening, app deployment |
| **Container Engine** | Docker Compose v2 | Microservices & monitoring containerization |
| **Web Server / Proxy** | Nginx | Reverse proxy for Node.js application |
| **Observability** | Prometheus, Grafana, cAdvisor, Node Exporter | Infrastructure & app metrics, visual dashboards |
| **Logging** | AWS CloudWatch Agent | System & access log aggregation |
| **Automation** | Bash, GNU Make | One-command pipeline orchestration |


---

## 5. Student Cost Safety & AWS Budget Analysis

This project is engineered specifically for **AWS Free Tier ($0.00/month)** compliance:

| AWS Resource | Included | Free Tier Limit | Est. Monthly Cost | Cost Reduction Rationale |
| :--- | :---: | :--- | :--- | :--- |
| **VPC & Internet Gateway** | Yes | Always Free | **$0.00** | Core networking zero hourly charge |
| **1x Public Subnet** | Yes | Always Free | **$0.00** | Direct route to IGW |
| **1x EC2 Instance (t3.micro / t2.micro)** | Yes | 750 hours/month | **$0.00** | Fits entirely inside 12-Month AWS Free Tier |
| **S3 Buckets (App + State)** | Yes | 5GB S3 Storage free | **$0.00** | Native S3 lockfiles (`use_lockfile = true`), no DynamoDB fees |
| **CloudWatch Log Group** | Yes | 5GB Log Ingestion free | **$0.00** | Set to 7-day retention |

---

## 6. Directory & Module Structure

```text
Ansible-Terraform-Infra/
├── .github/
│   └── workflows/
│       └── ci-cd.yml                   # GitHub Actions validation workflow
├── bootstrap/
│   └── remote-state/                   # Self-contained S3 Remote State Bootstrapping
│       ├── versions.tf
│       ├── providers.tf
│       ├── variables.tf
│       ├── main.tf
│       ├── outputs.tf
│       └── terraform.tfvars.example
├── terraform/
│   ├── modules/                        # Reusable Single-Responsibility Modules
│   │   ├── vpc/
│   │   ├── subnets/
│   │   ├── internet_gateway/
│   │   ├── route_tables/
│   │   ├── security_group/
│   │   ├── iam/
│   │   ├── ec2/
│   │   ├── s3/
│   │   └── cloudwatch/
│   └── environments/                   # Environment Isolation (ap-south-1)
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
│   ├── bootstrap.sh
│   ├── validate.sh
│   ├── deploy.sh
│   ├── verify.sh
│   ├── destroy.sh
│   └── cleanup.sh
├── .env.example                        # Standard ap-south-1 environment configuration
├── Makefile                            # One-command execution targets
└── README.md
```

---

## 7. One-Command Operational Workflow

### Prerequisites
1. Linux/Ubuntu EC2 control host or WSL2 on Windows.
2. Active AWS Account credentials (`aws configure` set to region `ap-south-1`).

### Deployment Steps

```bash
# 1. Clone Repository
git clone https://github.com/PriyanshuSingh10114/Ansible-Terraform-Infra.git
cd Ansible-Terraform-Infra

# 2. Install Tooling Prerequisites (AWS CLI, Terraform, Ansible, Docker, Make)
make install

# 3. Configure AWS CLI (Standardized on ap-south-1)
aws configure

# 4. Bootstrap Remote State S3 Bucket in ap-south-1
make bootstrap

# 5. Run Full Code Syntax & Lint Validation
make validate

# 6. Preview Infrastructure Plan (Saves to tfplan)
make plan ENV=dev

# 7. Deploy Infrastructure & Microservices Stack
make deploy ENV=dev

# 8. Perform Non-Destructive Runtime Verification
make verify ENV=dev

# 9. Destroy Infrastructure (Preserving Remote State Bucket)
make destroy ENV=dev
```

---

## 8. Makefile Targets Reference

| Target | Description |
| :--- | :--- |
| `make install` | Install prerequisite tools (AWS CLI, Terraform, Ansible, Docker, Make) |
| `make bootstrap` | Provision S3 Remote State bucket (`priyanshu-ansible-terraform-tfstate-2026`) |
| `make init` | Run `terraform init` for environment (`ENV=dev\|prod`) |
| `make fmt` | Format all Terraform code recursively (`terraform fmt -recursive`) |
| `make validate` | Validate Terraform syntax, Ansible playbooks, and shell scripts |
| `make plan` | Preview infrastructure changes and save `tfplan` (`ENV=dev\|prod`) |
| `make apply` | Apply infrastructure changes from `tfplan` (`ENV=dev\|prod`) |
| `make deploy` | Run end-to-end Terraform apply and dynamic Ansible playbook deployment |
| `make verify` | Perform non-destructive runtime health verification (`ENV=dev\|prod`) |
| `make destroy` | Destroy target environment infrastructure (`ENV=dev\|prod`) |
| `make clean` | Clean local `.terraform` caches, `tfplan` files, and temporary logs |

---

## 9. Verification & Service Endpoint Map

Access deployed services using your EC2 Instance's Public IP:

| Microservice | Access URL | Expected Status / Output |
| :--- | :--- | :--- |
| **Web Service** | `http://<EC2_PUBLIC_IP>/` | `{"status":"success","message":"AWS Infrastructure Platform - Production Service Online"}` |
| **App Health Check** | `http://<EC2_PUBLIC_IP>/health` | `{"status":"UP","uptime":...}` |
| **Grafana Dashboard** | `http://<EC2_PUBLIC_IP>:3001` | Grafana Login (`admin` / `adminpass`) |
| **Prometheus Telemetry** | `http://<EC2_PUBLIC_IP>:9090/targets` | Targets `UP` (`node_exporter`, `cadvisor`, `web_app`) |

---

## 10. Security & Hardening Standards

- **State File Encryption**: Remote state bucket uses `AES256` default encryption, S3 versioning, and public access blocks.
- **Least Privilege IAM**: EC2 instance profile uses scoped S3 bucket policy (`app_bucket_arn`) instead of wildcard account access.
- **Instance Security**: EC2 uses IMDSv2 (`http_tokens = "required"`), encrypted gp3 root volumes, and security group rule isolation.
- **OS Hardening**: Ansible `security` role configures Fail2ban, disables SSH root login, and disables password authentication.

---

## 11. Troubleshooting Guide

| Issue | Root Cause | Solution |
| :--- | :--- | :--- |
| `BucketAlreadyExists` | S3 Bucket name collision | Update `state_bucket_name` in `bootstrap/remote-state/variables.tf`. |
| `Host key verification failed` | First SSH connection | `ansible.cfg` sets `host_key_checking = False` by default. |
| `Permission denied` on scripts | Missing execution permissions | Run `chmod +x scripts/*.sh`. |
| `Unsupported argument: use_lockfile` | Terraform version < 1.10 | Run `make install` to upgrade Terraform CLI to >= 1.10.0. |

---

## 12. License & Acknowledgments

Licensed under the **MIT License**. Built for educational, production readiness, and portfolio demonstration purposes.
