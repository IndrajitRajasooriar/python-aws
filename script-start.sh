#!/bin/bash
set -e

echo "Updating system..."
sudo dnf update -y

# -------------------------
# Docker install (AL2023)
# -------------------------
echo "Installing Docker..."

sudo dnf install -y docker

# Enable and start Docker
sudo systemctl enable docker
sudo systemctl start docker

echo "DOCKER STARTED"
docker --version

sleep 10

# Add ec2-user to docker group
sudo usermod -aG docker ec2-user

# -------------------------
# SSM Agent (AL2023 way)
# -------------------------
echo "Installing SSM Agent..."

sudo dnf install -y amazon-ssm-agent

sudo systemctl enable amazon-ssm-agent
sudo systemctl start amazon-ssm-agent

echo "SSM INSTALL DONE"

echo "Setup completed"

# -------------------------
# Installing git
# -------------------------

echo "Installing git..."
sudo dnf install -y git

# -------------------------
# Clone the repository
# -------------------------

echo "Cloning the repository..."
cd /opt
git clone https://github.com/IndrajitRajasooriar/python-aws.git
cd python-aws

# -------------------------
# Docker build & run
# -------------------------

echo "Building the Docker image..."
sudo docker build -t flask-app .

sudo docker run -d -p 5000:5000 flask-app

echo "Checking logs..."
sudo docker logs $(sudo docker ps -q) || true