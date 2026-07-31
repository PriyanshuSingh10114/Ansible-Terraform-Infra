#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

echo "======================================================"
echo " Cleaning Temporary & Cache Files"
echo "======================================================"

cd "$PROJECT_ROOT"

echo "[INFO] Removing .terraform directories..."
find . -name ".terraform" -type d -exec rm -rf {} + 2>/dev/null || true

echo "[INFO] Removing terraform state backups and lock files..."
find . -name "*.tfstate.backup" -type f -delete 2>/dev/null || true
find . -name ".terraform.lock.hcl" -type f -delete 2>/dev/null || true

echo "[INFO] Removing Ansible retry and cache files..."
find . -name "*.retry" -type f -delete 2>/dev/null || true
find . -name "*.log" -type f -delete 2>/dev/null || true

echo "======================================================"
echo " [SUCCESS] Cleanup completed successfully."
echo "======================================================"
