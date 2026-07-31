#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

echo "======================================================"
echo " Running Full System Validation Checks"
echo "======================================================"

cd "$PROJECT_ROOT"

# 1. Terraform Formatting Check
if command -v terraform &>/dev/null; then
  echo "[INFO] Checking Terraform Formatting..."
  terraform fmt -check -recursive

  # 2. Terraform Validate Bootstrap
  if [ -d "bootstrap/remote-state" ]; then
    echo "[INFO] Validating Bootstrap..."
    (cd bootstrap/remote-state && terraform init -backend=false && terraform validate)
  fi

  # 3. Terraform Validate Environments
  for env_dir in terraform/environments/*/; do
    if [ -d "$env_dir" ]; then
      echo "[INFO] Validating Terraform Environment: $env_dir..."
      (cd "$env_dir" && terraform init -backend=false && terraform validate)
    fi
  done
else
  echo "[WARNING] Terraform CLI not found. Skipping Terraform validation."
fi

# 4. Ansible Syntax Check
if command -v ansible-playbook &>/dev/null; then
  echo "[INFO] Validating Ansible Playbook Syntax..."
  (cd ansible && ansible-playbook -i inventories/dev/hosts.yml site.yml --syntax-check)
else
  echo "[WARNING] Ansible CLI not found. Skipping Ansible syntax check."
fi

echo "======================================================"
echo " [SUCCESS] All validation checks passed successfully!"
echo "======================================================"
