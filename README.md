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

## 1. Learning Objectives

By using and studying this project, you will master:
- **Modular Terraform Development**: Writing reusable, parameterized IaC modules (`vpc`, `subnets`, `security_group`, `iam`, `ec2`, `s3`, `cloudwatch`, `remote_state`).
- **Configuration Management**: Automating Linux OS hardening, package management, security updates, Nginx reverse proxies, and system users via Ansible roles.
- **Student Cost Optimization**: Building production-inspired cloud architectures within AWS Free Tier limits ($0/month baseline) without compromising modularity.
- **Container Orchestration**: Running microservices and complete telemetry stacks (Prometheus, Grafana, Node Exporter, cAdvisor) using Docker Compose.
- **Continuous Integration**: Validating Terraform code formatting, module syntax, and Ansible playbooks automatically via GitHub Actions workflows.

---

## 2. Architecture Diagram & Explanation

```mermaid
graph TD
    Client[Internet Client / Browser] -->|HTTP Port 80| Nginx[Nginx Reverse Proxy]
    Client -->|SSH Port 22| EC2[Ubuntu EC2 Instance]
    Client -->|HTTP Port 3000| Grafana[Grafana Dashboard]
    Client -->|HTTP Port 9090| Prom[Prometheus UI]

    subgraph AWS VPC (10.0.0.0/16)
        subgraph Public Subnet (10.0.1.0/24)
            IGW[Internet Gateway] <--> RouteTable[Public Route Table]
            RouteTable <--> EC2
            
            subgraph EC2 Instance Services (Docker Compose Stack)
                Nginx -->|Proxy Pass 127.0.0.1:3000| NodeApp[Node.js Express App]
                NodeExporter[Node Exporter :9100] --> Prom
                cAdvisor[cAdvisor :8080] --> Prom
                NodeApp -->|/metrics| Prom
                Prom --> Grafana
                CWAgent[CloudWatch Agent] -->|Push System & Nginx Logs| CloudWatch[AWS CloudWatch Logs]
            end
        end
        SG[Security Group] --> EC2
        IAMProfile[IAM Instance Profile] --> EC2
    end

    EC2 -->|S3 API Read/Write| S3Bucket[App S3 Bucket]
    TFLocal[Developer Workstation / CI] -->|S3 State + DynamoDB Lock| TFState[Terraform Remote Backend]
```

### Architecture Components
1. **AWS VPC & Network**: Custom VPC (`10.0.0.0/16`) with DNS support, single public subnet (`10.0.1.0/24`), Internet Gateway, and Route Table for public internet connectivity.
2. **Compute & Security**: Single `t3.micro` Ubuntu 22.04 LTS EC2 instance secured with least-privilege Security Groups and IAM Role (with SSM Core & CloudWatch Agent policies).
3. **Application Tier**: Dockerized Node.js web application running inside Docker Compose, proxied by Nginx on Port 80 with health checks (`/health`).
4. **Monitoring Stack**: Prometheus, Grafana, Node Exporter, cAdvisor, and AWS CloudWatch Agent collecting CPU, Memory, Disk, Network, and Container metrics.
5. **Terraform Remote State**: S3 Bucket with server-side encryption & versioning + DynamoDB table for state locking.

---

## 3. Student Cost Safety & AWS Budget Analysis

| AWS Resource | Included | Free Tier Limit | Est. Monthly Cost | Cost Reduction Rationale |
| :--- | :---: | :--- | :--- | :--- |
| **VPC & Internet Gateway** | Yes | Always Free | **$0.00** | Core networking zero hourly charge |
| **1x Public Subnet** | Yes | Always Free | **$0.00** | Direct route to IGW |
| **1x EC2 Instance (t3.micro)** | Yes | 750 hours/month | **$0.00** | Fits entirely inside 12-month AWS Free Tier |
| **S3 Bucket & DynamoDB Table** | Yes | 5GB S3 + 25 WCU DynamoDB | **$0.00** | S3 & DynamoDB PAY_PER_REQUEST free tier |
| **CloudWatch Log Group** | Yes | 5GB Log Ingestion free | **$0.00** | Set to 7-day log retention |
| **ALB / NAT Gateway / RDS** | **Excluded** | Non-Free Tier | **Saved ~$70+/mo** | Skipped per student budget safety rules |

---

## 4. Repository Structure

```text
aws-terraform-ansible-infra/
├── .github/workflows/ci-cd.yml          # GitHub Actions workflow
├── app/                                 # Node.js app & Docker Compose
│   ├── Dockerfile
│   ├── docker-compose.yml
│   ├── package.json
│   ├── server.js
│   └── nginx.conf
├── monitoring/                          # Observability stack config
│   ├── docker-compose.yml
│   ├── prometheus.yml
│   ├── amazon-cloudwatch-agent.json
│   └── dashboards/system-overview.json
├── ansible/                             # Configuration management
│   ├── ansible.cfg
│   ├── site.yml
│   ├── group_vars/
│   │   ├── all.yml
│   │   └── webservers.yml
│   ├── inventories/
│   │   ├── dev/hosts.yml
│   │   └── prod/hosts.yml
│   └── roles/
│       ├── common/
│       ├── security/
│       ├── users/
│       ├── docker/
│       ├── nginx/
│       ├── application/
│       ├── monitoring/
│       └── backup/
├── terraform/                           # Infrastructure as Code
│   ├── modules/                         # Reusable Terraform modules
│   │   ├── vpc/
│   │   ├── subnets/
│   │   ├── internet_gateway/
│   │   ├── nat_gateway/
│   │   ├── route_tables/
│   │   ├── security_group/
│   │   ├── iam/
│   │   ├── ec2/
│   │   ├── alb/
│   │   ├── autoscaling/
│   │   ├── launch_template/
│   │   ├── rds/
│   │   ├── s3/
│   │   ├── cloudwatch/
│   │   └── remote_state/
│   └── environments/                    # Environment deployments
│       ├── dev/
│       └── prod/
├── .gitignore
└── README.md                            # Master project documentation
```

---

## 5. Execution Guide

### Prerequisites
- Install [Terraform 1.6+](https://developer.hashicorp.com/terraform/downloads)
- Install [Ansible 2.15+](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
- AWS CLI configured with active credentials (`aws configure`)

### Step 1: Provision Infrastructure with Terraform
```bash
# Navigate to dev environment
cd terraform/environments/dev

# Copy example variables
cp terraform.tfvars.example terraform.tfvars

# Initialize Terraform modules
terraform init

# Validate configuration syntax
terraform validate

# Review execution plan
terraform plan

# Apply infrastructure creation
terraform apply -auto-approve
```

### Step 2: Deploy & Configure Server with Ansible
```bash
# Navigate to ansible directory
cd ../../../ansible

# Verify inventory connectivity
ansible all -m ping -i inventories/dev/hosts.yml

# Execute master playbook
ansible-playbook -i inventories/dev/hosts.yml site.yml
```

---

## 6. Verification Steps

### AWS Console Verification
1. **EC2 Console**: Verify that 1 `dev-bastion-host` instance is running in public subnet `10.0.1.0/24` with an attached Elastic IP.
2. **VPC Console**: Verify `dev-vpc` (`10.0.0.0/16`) has 1 Internet Gateway attached and route table pointing `0.0.0.0/0` to IGW.
3. **CloudWatch Console**: Navigate to Log Groups and locate `/aws/ec2/dev-system-logs`.
4. **S3 Console**: Confirm bucket `aws-dev-app-assets-storage-unique-12345` is created with encryption enabled.

### Live Application & Dashboard Verification
- **Web Application**: Open `http://<EC2_PUBLIC_IP>/` -> Returns JSON status response.
- **Application Health Check**: Open `http://<EC2_PUBLIC_IP>/health` -> Returns `{"status":"UP"}`.
- **Grafana Observability Dashboard**: Open `http://<EC2_PUBLIC_IP>:3000` (Login: `admin` / `adminpass`).
- **Prometheus Metrics Target**: Open `http://<EC2_PUBLIC_IP>:9090/targets` -> Verify Node Exporter and cAdvisor targets are `UP`.

---

## 7. Common Errors & Troubleshooting

| Symptom | Cause | Solution |
| :--- | :--- | :--- |
| `Error: No matching AMI found` | Invalid AMI ID for region | Update `ami_id` in `terraform.tfvars` with current Ubuntu 22.04 AMI for your AWS region. |
| `Permission denied (publickey)` | SSH key mismatch | Ensure your local SSH public key matches `ssh_key_name` passed to EC2 module. |
| `AccessDenied on S3 Backend` | Missing S3/DynamoDB IAM permissions | Run `aws sts get-caller-identity` to check IAM identity permissions. |
| `Docker Compose failed to start` | User not in `docker` group | Re-run Ansible role `docker` or execute `sudo usermod -aG docker ubuntu` on server. |

---

## 8. Interview Questions & Answers

### Q1: Why use modular Terraform structure with `environments/` and `modules/`?
**Answer**: Separating infrastructure definitions into reusable modules (`modules/`) and environment instantiations (`environments/dev`, `environments/prod`) promotes DRY (Don't Repeat Yourself) code, enforces standardization across teams, isolates state files, and prevents blast radius during updates.

### Q2: How does state locking prevent concurrent modification race conditions?
**Answer**: Terraform uses Amazon DynamoDB table hash keys (`LockID`) during operations (`plan`, `apply`, `destroy`). When an execution starts, Terraform writes an item into DynamoDB. Subsequent runs detect the active lock and halt, avoiding state file corruption.

### Q3: Why is Nginx placed in front of Node.js app containers?
**Answer**: Nginx handles client connection pooling, static asset caching, request buffering, rate limiting, and SSL/TLS termination efficiently before forwarding traffic to application runtimes over localhost.

---

## 9. Recommended Slash Commands

- Use `/goal` when you want the agent to execute long-running validation tasks thoroughly.
- Use `/schedule` to automate state monitoring timers.
- Use `/grill-me` for interactive design alignment.
- Use `/learn` to save repository-specific patterns into agent memory.
