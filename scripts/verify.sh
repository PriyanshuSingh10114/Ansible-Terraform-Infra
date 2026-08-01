#!/usr/bin/env bash
set -euo pipefail

ENV="${1:-dev}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
TF_DIR="$PROJECT_ROOT/terraform/environments/$ENV"

echo "======================================================"
echo " AWS Ansible Terraform Infra - Runtime Verification"
echo " Environment: $ENV"
echo " Target Directory: $TF_DIR"
echo "======================================================"

TOTAL_CHECKS=0
PASSED_CHECKS=0

report_result() {
  local check_name="$1"
  local status="$2"
  local detail="${3:-}"

  TOTAL_CHECKS=$((TOTAL_CHECKS + 1))
  if [ "$status" = "PASS" ]; then
    PASSED_CHECKS=$((PASSED_CHECKS + 1))
    echo -e "  [PASS] $check_name $detail"
  elif [ "$status" = "WARN" ]; then
    echo -e "  [WARN] $check_name $detail"
  else
    echo -e "  [FAIL] $check_name $detail"
  fi
}

# 1. AWS Pre-flight Verification
echo "[INFO] Checking AWS Credentials & Identity..."
if AWS_IDENTITY=$(aws sts get-caller-identity --output json 2>/dev/null); then
  ACCOUNT_ID=$(echo "$AWS_IDENTITY" | jq -r '.Account')
  report_result "AWS STS Authentication" "PASS" "(Account: $ACCOUNT_ID)"
else
  report_result "AWS STS Authentication" "FAIL" "(Unable to authenticate with AWS CLI)"
  exit 1
fi

AWS_REGION=$(aws configure get region 2>/dev/null || echo "ap-south-1")
report_result "AWS Effective Region" "PASS" "($AWS_REGION)"

# 2. Terraform Outputs Extraction
if [ -d "$TF_DIR" ]; then
  cd "$TF_DIR"
  EC2_PUBLIC_IP=$(terraform output -raw ec2_public_ip 2>/dev/null || echo "")
  EC2_INSTANCE_ID=$(terraform output -raw ec2_instance_id 2>/dev/null || echo "")

  if [ -n "$EC2_PUBLIC_IP" ] && [ -n "$EC2_INSTANCE_ID" ]; then
    report_result "Terraform Output Retrieval" "PASS" "(IP: $EC2_PUBLIC_IP, ID: $EC2_INSTANCE_ID)"
  else
    report_result "Terraform Output Retrieval" "FAIL" "(No deployed infrastructure found in $TF_DIR)"
    exit 1
  fi
else
  report_result "Terraform Directory" "FAIL" "($TF_DIR does not exist)"
  exit 1
fi

# 3. AWS EC2 Instance State Check
INSTANCE_STATE=$(aws ec2 describe-instances --instance-ids "$EC2_INSTANCE_ID" --query "Reservations[0].Instances[0].State.Name" --output text 2>/dev/null || echo "unknown")
if [ "$INSTANCE_STATE" = "running" ]; then
  report_result "EC2 Instance Status" "PASS" "(State: running)"
else
  report_result "EC2 Instance Status" "FAIL" "(State: $INSTANCE_STATE)"
fi

# 4. Network & SSH Connectivity Check
echo "[INFO] Verifying Network Port & SSH Reachability..."
if command -v nc &>/dev/null; then
  if nc -z -w 5 "$EC2_PUBLIC_IP" 22 &>/dev/null; then
    report_result "SSH Port 22 Reachability" "PASS"
  else
    report_result "SSH Port 22 Reachability" "FAIL" "(Port 22 closed or unreachable)"
  fi
else
  report_result "SSH Port 22 Reachability" "WARN" "(netcat/nc tool not installed locally)"
fi

# 5. Ansible Ping Test
ANSIBLE_DIR="$PROJECT_ROOT/ansible"
INVENTORY="$ANSIBLE_DIR/inventories/$ENV/hosts.yml"
if [ -f "$INVENTORY" ] && command -v ansible &>/dev/null; then
  if (cd "$ANSIBLE_DIR" && ansible -i "$INVENTORY" all -m ping &>/dev/null); then
    report_result "Ansible Ping Verification" "PASS"
  else
    report_result "Ansible Ping Verification" "FAIL" "(Ansible ping failed)"
  fi
else
  report_result "Ansible Ping Verification" "WARN" "(Inventory $INVENTORY or Ansible CLI missing)"
fi

# 6. HTTP Application & Nginx Reverse Proxy Verification
echo "[INFO] Testing Application & Nginx HTTP Endpoints..."
APP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "http://$EC2_PUBLIC_IP/" 2>/dev/null || echo "000")
if [ "$APP_STATUS" = "200" ]; then
  report_result "Nginx Reverse Proxy (Port 80)" "PASS" "(HTTP $APP_STATUS OK)"
else
  report_result "Nginx Reverse Proxy (Port 80)" "FAIL" "(HTTP Status: $APP_STATUS)"
fi

HEALTH_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "http://$EC2_PUBLIC_IP/health" 2>/dev/null || echo "000")
if [ "$HEALTH_STATUS" = "200" ]; then
  report_result "Web App Health Endpoint (/health)" "PASS" "(HTTP $HEALTH_STATUS UP)"
else
  report_result "Web App Health Endpoint (/health)" "FAIL" "(HTTP Status: $HEALTH_STATUS)"
fi

# 7. Monitoring Services Verification
echo "[INFO] Testing Observability & Monitoring Endpoints..."
PROM_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "http://$EC2_PUBLIC_IP:9090/-/healthy" 2>/dev/null || echo "000")
if [ "$PROM_STATUS" = "200" ]; then
  report_result "Prometheus Telemetry Service (Port 9090)" "PASS" "(HTTP $PROM_STATUS OK)"
else
  report_result "Prometheus Telemetry Service (Port 9090)" "WARN" "(HTTP Status: $PROM_STATUS)"
fi

GRAFANA_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "http://$EC2_PUBLIC_IP:3001/api/health" 2>/dev/null || echo "000")
if [ "$GRAFANA_STATUS" = "200" ]; then
  report_result "Grafana Dashboard Service (Port 3001)" "PASS" "(HTTP $GRAFANA_STATUS OK)"
else
  report_result "Grafana Dashboard Service (Port 3001)" "WARN" "(HTTP Status: $GRAFANA_STATUS)"
fi

echo "======================================================"
echo " VERIFICATION SUMMARY: $PASSED_CHECKS / $TOTAL_CHECKS checks passed."
echo "======================================================"

if [ "$PASSED_CHECKS" -eq "$TOTAL_CHECKS" ]; then
  echo "[SUCCESS] ALL SYSTEM COMPONENT VERIFICATIONS PASSED!"
  exit 0
else
  echo "[WARNING] SOME VERIFICATION CHECKS FAILED OR RETURNED WARNINGS."
  exit 0
fi
