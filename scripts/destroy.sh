#!/usr/bin/env bash
set -euo pipefail

ENV="${1:-dev}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
TF_DIR="$PROJECT_ROOT/terraform/environments/$ENV"

echo "======================================================"
echo " Destroying AWS Infrastructure for Environment: $ENV"
echo " Target Directory: $TF_DIR"
echo "======================================================"

if [ ! -d "$TF_DIR" ]; then
  echo "[ERROR] Environment directory $TF_DIR does not exist!"
  exit 1
fi

cd "$TF_DIR"
terraform init
terraform destroy -auto-approve

echo "======================================================"
echo " [SUCCESS] Infrastructure destroyed successfully."
echo "======================================================"
