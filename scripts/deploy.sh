#!/usr/bin/env bash
set -euo pipefail

ENV="${1:-dev}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

echo "======================================================"
echo " Starting Full Infrastructure & Application Deployment"
echo " Environment: $ENV"
echo " Project Root: $PROJECT_ROOT"
echo "======================================================"

# Step 1: Provision Infrastructure via Terraform
TF_DIR="$PROJECT_ROOT/terraform/environments/$ENV"
if [ ! -d "$TF_DIR" ]; then
  echo "[ERROR] Environment directory $TF_DIR does not exist!"
  exit 1
fi

echo "[INFO] Initializing and Applying Terraform in $TF_DIR..."
cd "$TF_DIR"

if [ ! -f "terraform.tfvars" ]; then
  if [ -f "terraform.tfvars.example" ]; then
    echo "[INFO] Creating terraform.tfvars from template..."
    cp terraform.tfvars.example terraform.tfvars
  fi
fi

terraform init
terraform apply -auto-approve

# Step 2: Configure Server via Ansible
ANSIBLE_DIR="$PROJECT_ROOT/ansible"
INVENTORY_DIR="$ANSIBLE_DIR/inventories/$ENV"
INVENTORY="$INVENTORY_DIR/hosts.yml"

echo "[INFO] Capturing infrastructure outputs for Ansible configuration..."
EC2_PUBLIC_IP=$(terraform output -raw ec2_public_ip 2>/dev/null || echo "")

if [ -n "$EC2_PUBLIC_IP" ]; then
  echo "[INFO] Dynamically updating Ansible inventory ($INVENTORY) with public IP: $EC2_PUBLIC_IP"
  mkdir -p "$INVENTORY_DIR"
  cat <<EOF > "$INVENTORY"
---
all:
  children:
    webservers:
      hosts:
        web-$ENV-01:
          ansible_host: $EC2_PUBLIC_IP
          ansible_user: ubuntu
EOF
fi

echo "[INFO] Running Ansible Configuration Playbook..."
cd "$ANSIBLE_DIR"

if [ -f "$INVENTORY" ]; then
  ansible-playbook -i "$INVENTORY" site.yml
else
  echo "[WARNING] Inventory file $INVENTORY not found. Skipping Ansible run."
fi

echo "======================================================"
echo " [SUCCESS] Deployment completed successfully!"
echo "======================================================"
