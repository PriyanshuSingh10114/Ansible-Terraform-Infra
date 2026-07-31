#!/usr/bin/env bash
set -euo pipefail

echo "======================================================"
echo " AWS Ansible Terraform Infra - Tooling Installation"
echo "======================================================"

# Check OS compatibility
if [[ "$OSTYPE" != "linux-gnu"* && "$OSTYPE" != "darwin"* ]]; then
  echo "[WARNING] This script is optimized for Linux/Debian/Ubuntu/macOS environments."
fi

# 1. Update system packages if apt is available
if command -v apt-get &>/dev/null; then
  echo "[INFO] Updating package indices..."
  sudo apt-get update -y
  sudo apt-get install -y \
    git \
    curl \
    wget \
    unzip \
    zip \
    jq \
    tree \
    vim \
    make \
    software-properties-common \
    ca-certificates \
    gnupg \
    lsb-release \
    python3 \
    python3-pip \
    python3-venv
fi

# 2. Install AWS CLI v2 if not present
if ! command -v aws &>/dev/null; then
  echo "[INFO] Installing AWS CLI v2..."
  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/tmp/awscliv2.zip"
  unzip -q -o /tmp/awscliv2.zip -d /tmp/
  sudo /tmp/aws/install --update || true
  rm -rf /tmp/aws /tmp/awscliv2.zip
else
  echo "[INFO] AWS CLI is already installed: $(aws --version)"
fi

# 3. Install Terraform if not present
if ! command -v terraform &>/dev/null; then
  echo "[INFO] Installing Terraform..."
  if command -v apt-get &>/dev/null; then
    wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg >/dev/null
    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list >/dev/null
    sudo apt-get update -y && sudo apt-get install -y terraform
  fi
else
  echo "[INFO] Terraform is already installed: $(terraform --version | head -n 1)"
fi

# 4. Install Ansible if not present
if ! command -v ansible &>/dev/null; then
  echo "[INFO] Installing Ansible..."
  if command -v apt-get &>/dev/null; then
    sudo apt-get install -y ansible
  else
    pip3 install ansible community.general community.docker
  fi
else
  echo "[INFO] Ansible is already installed: $(ansible --version | head -n 1)"
fi

# 5. Install Docker Engine & Compose if not present
if ! command -v docker &>/dev/null; then
  echo "[INFO] Installing Docker Engine..."
  curl -fsSL https://get.docker.com | sudo sh || true
  if command -v systemctl &>/dev/null; then
    sudo systemctl enable --now docker || true
  fi
  sudo usermod -aG docker "$USER" || true
else
  echo "[INFO] Docker is already installed: $(docker --version)"
fi

echo "======================================================"
echo " [SUCCESS] Prerequisites installation check complete."
echo "======================================================"
