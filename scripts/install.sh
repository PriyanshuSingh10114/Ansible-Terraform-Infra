# Update system
sudo apt update && sudo apt upgrade -y

# Install essential packages
sudo apt install -y \
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

# Install AWS CLI (skip if already installed)
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip -o awscliv2.zip
sudo ./aws/install
rm -rf aws awscliv2.zip

# Install Terraform
wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg >/dev/null

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com \
$(lsb_release -cs) main" | \
sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt update
sudo apt install terraform -y

# Install Ansible
sudo apt install ansible -y

# Install Docker
curl -fsSL https://get.docker.com | sudo sh

# Add current user to Docker group
sudo usermod -aG docker $USER

# Install Docker Compose plugin
sudo apt install docker-compose-plugin -y

# Enable Docker
sudo systemctl enable docker
sudo systemctl start docker
