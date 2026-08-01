#!/usr/bin/env bash
set -Eeuo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
BOOTSTRAP_DIR="$PROJECT_ROOT/bootstrap/remote-state"

echo "======================================================"
echo " AWS Ansible Terraform Infra - Remote State Bootstrap"
echo " Target Directory: $BOOTSTRAP_DIR"
echo "======================================================"

# 1. Pre-flight Binary Checks
if ! command -v aws &>/dev/null; then
  echo "[ERROR] AWS CLI is not installed or not in PATH."
  exit 1
fi

if ! command -v terraform &>/dev/null; then
  echo "[ERROR] Terraform CLI is not installed or not in PATH."
  exit 1
fi

if ! command -v jq &>/dev/null; then
  echo "[ERROR] jq is not installed or not in PATH."
  exit 1
fi

# 2. Pre-flight AWS STS Authentication
echo "[INFO] Verifying AWS Credentials..."
if AWS_IDENTITY=$(aws sts get-caller-identity --output json 2>/dev/null); then
  ACCOUNT_ID=$(echo "$AWS_IDENTITY" | jq -r '.Account')
  USER_ARN=$(echo "$AWS_IDENTITY" | jq -r '.Arn')
  echo "[SUCCESS] Authenticated as AWS Account ID: $ACCOUNT_ID ($USER_ARN)"
else
  echo "[ERROR] AWS Authentication failed! Please run 'aws configure' first."
  exit 1
fi

AWS_REGION=$(aws configure get region 2>/dev/null || echo "ap-south-1")
echo "[INFO] Effective AWS Region: $AWS_REGION"

# 3. Verify Bootstrap Files Integrity
if [ ! -d "$BOOTSTRAP_DIR" ]; then
  echo "[ERROR] Bootstrap directory $BOOTSTRAP_DIR does not exist!"
  exit 1
fi

REQUIRED_FILES=("main.tf" "variables.tf" "outputs.tf" "providers.tf" "versions.tf")
for req_file in "${REQUIRED_FILES[@]}"; do
  if [ ! -f "$BOOTSTRAP_DIR/$req_file" ]; then
    echo "[ERROR] Missing required bootstrap file: $BOOTSTRAP_DIR/$req_file"
    exit 1
  fi
done

# 4. Terraform Initialization & Plan
cd "$BOOTSTRAP_DIR"

if [ -f "terraform.tfvars.example" ] && [ ! -f "terraform.tfvars" ]; then
  echo "[INFO] Creating default terraform.tfvars from example..."
  cp terraform.tfvars.example terraform.tfvars
fi

echo "[INFO] Initializing Terraform for Bootstrap (Local State)..."
terraform init -reconfigure

echo "[INFO] Validating Bootstrap Terraform Code..."
terraform validate

echo "[INFO] Generating Bootstrap Terraform Plan..."
terraform plan -out=tfplan

echo "[INFO] Applying Bootstrap Terraform Plan..."
terraform apply -auto-approve tfplan
rm -f tfplan

# 5. Extract & Verify Bucket Outputs
STATE_BUCKET=$(terraform output -raw state_bucket_name 2>/dev/null || echo "")

if [ -z "$STATE_BUCKET" ]; then
  echo "[ERROR] Bootstrap failed: No remote state bucket ID output found!"
  exit 1
fi

echo "[INFO] Verifying S3 Bucket existence in AWS API: $STATE_BUCKET..."
if aws s3api head-bucket --bucket "$STATE_BUCKET" 2>/dev/null; then
  echo "[SUCCESS] S3 Bucket '$STATE_BUCKET' confirmed active."
else
  echo "[ERROR] AWS Verification failed: Bucket '$STATE_BUCKET' is not accessible."
  exit 1
fi

# 6. Verify Bucket Security Controls
VERSIONING_STATUS=$(aws s3api get-bucket-versioning --bucket "$STATE_BUCKET" --query "Status" --output text 2>/dev/null || echo "Disabled")
echo "[INFO] Bucket Versioning Status: $VERSIONING_STATUS"

ENCRYPTION_ALGO=$(aws s3api get-bucket-encryption --bucket "$STATE_BUCKET" --query "ServerSideEncryptionConfiguration.Rules[0].ApplyServerSideEncryptionByDefault.SSEAlgorithm" --output text 2>/dev/null || echo "None")
echo "[INFO] Bucket Default Encryption: $ENCRYPTION_ALGO"

PUBLIC_BLOCK=$(aws s3api get-public-access-block --bucket "$STATE_BUCKET" --query "PublicAccessBlockConfiguration.BlockPublicAcls" --output text 2>/dev/null || echo "false")
echo "[INFO] Public Access Block Status: $PUBLIC_BLOCK"

echo "======================================================"
echo " [SUCCESS] Remote State S3 Bucket Bootstrap Complete!"
echo " Bucket Name: $STATE_BUCKET"
echo " AWS Region:  $AWS_REGION"
echo "======================================================"
