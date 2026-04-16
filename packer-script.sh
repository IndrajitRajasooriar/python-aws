#!/bin/bash

set -e

# Install Docker repo
echo "Installing Docker repo..."
sudo dnf install -y dnf-plugins-core
sudo dnf config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo

# Install Docker
echo "Installing Docker..."
sudo dnf install -y docker-ce docker-ce-cli containerd.io

# Start Docker
echo "Starting Docker..."
sudo systemctl enable docker
sudo systemctl start docker
echo "DOCKER STARTED"
docker --version

# Install SSM Agent
echo "Installing SSM Agent..."

sudo dnf install -y https://s3.eu-west-1.amazonaws.com/amazon-ssm-eu-west-1/latest/linux_amd64/amazon-ssm-agent.rpm

# Start SSM Agent
sudo systemctl start amazon-ssm-agent
sudo systemctl enable amazon-ssm-agent
echo "SSM INSTALL DONE"

echo "Setup completed"
