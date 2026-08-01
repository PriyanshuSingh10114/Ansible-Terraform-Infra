# AWS Infrastructure Platform - Command Reference Guide

A complete, copy-paste ready command cheat sheet for managing the **Ansible-Terraform-Infra** platform.

---

## 1. Primary One-Command Workflow (Makefile)

```bash
# Install tool prerequisites (AWS CLI, Terraform, Ansible, Docker, Make)
make install

# Configure AWS CLI Credentials (ap-south-1)
aws configure

# Bootstrap Remote State S3 Bucket (ap-south-1)
make bootstrap

# Run System-Wide Validation (Terraform, Ansible, Shell)
make validate

# Preview Infrastructure Changes & Save Plan
make plan ENV=dev

# Apply Infrastructure & Run Ansible Deployment
make deploy ENV=dev

# Perform Non-Destructive Runtime Health Checks
make verify ENV=dev

# Destroy Environment Infrastructure
make destroy ENV=dev

# Clean Build & State Caches
make clean
```

---

## 2. AWS Pre-flight & Verification Commands

```bash
# Verify AWS Identity
aws sts get-caller-identity

# Check Configured Region
aws configure get region

# List S3 Buckets
aws s3api list-buckets --query "Buckets[].Name" --output table

# Verify Bootstrap S3 State Bucket
aws s3api head-bucket --bucket priyanshu-ansible-terraform-tfstate-2026

# Check State Bucket Versioning
aws s3api get-bucket-versioning --bucket priyanshu-ansible-terraform-tfstate-2026

# Describe EC2 Deployed Instances in ap-south-1
aws ec2 describe-instances \
  --region ap-south-1 \
  --filters "Name=tag:Environment,Values=dev" \
  --query 'Reservations[].Instances[?State.Name!=`terminated`].{Name:Tags[?Key==`Name`]|[0].Value,ID:InstanceId,State:State.Name,PublicIP:PublicIpAddress,PrivateIP:PrivateIpAddress,Key:KeyName}' \
  --output table
```

---

## 3. Terraform Operations (Manual / Debugging)

```bash
# Bootstrap Local State Execution
cd bootstrap/remote-state
terraform init -reconfigure
terraform validate
terraform plan -out=tfplan
terraform apply tfplan

# Inspect Bootstrap State & Outputs
terraform state list
terraform output

# Dev Environment Remote State Operations
cd ../../terraform/environments/dev
terraform init -reconfigure
terraform fmt -check -recursive
terraform validate
terraform plan -out=tfplan
terraform apply tfplan

# Inspect Environment State & Outputs
terraform state list
terraform output
terraform output -raw ec2_public_ip

# Environment Teardown
terraform destroy -auto-approve
```

---

## 4. Ansible Operations (Manual / Debugging)

```bash
cd ansible

# Check Inventory Graph
ansible-inventory -i inventories/dev/hosts.yml --graph

# Run Ansible Host Ping
ansible all -i inventories/dev/hosts.yml -m ping

# Playbook Syntax Verification
ansible-playbook -i inventories/dev/hosts.yml site.yml --syntax-check

# Execute Playbook
ansible-playbook -i inventories/dev/hosts.yml site.yml
```

---

## 5. Docker & Microservices Commands (Target EC2 Host)

```bash
# Check Docker Engine & Service Status
systemctl status docker
docker --version
docker compose version

# List Running Containers
docker ps

# Check Container Logs
docker logs web_application
docker logs monitoring_prometheus
docker logs monitoring_grafana

# Restart Container Stacks
docker compose -f /opt/app/docker-compose.yml restart
docker compose -f /opt/monitoring/docker-compose.yml restart
```

---

## 6. Verification cURL Endpoints

```bash
# Test Web App Landing Page
curl -i http://<EC2_PUBLIC_IP>/

# Test Web App Health Check
curl -i http://<EC2_PUBLIC_IP>/health

# Test Prometheus Telemetry Service
curl -i http://<EC2_PUBLIC_IP>:9090/-/healthy

# Test Grafana Health Check
curl -i http://<EC2_PUBLIC_IP>:3001/api/health
```
