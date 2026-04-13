#!/bin/bash

# Update system
dnf upgrade -y

# Install Docker

sudo dnf -y install dnf-plugins-core
sudo dnf config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo

# Enable Docker service
systemctl enable docker
systemctl start docker
echo "DOCKER STARTED"

# Install SSM Agent
dnf install -y https://s3.amazonaws.com/amazon-ssm-us-east-1/latest/linux_amd64/amazon-ssm-agent.rpm

# Start SSM Agent
systemctl start amazon-ssm-agent
systemctl enable amazon-ssm-agent

echo "SSM INSTALL DONE"

# Add ubuntu user to docker group
usermod -aG docker ubuntu

# Wait Docker to be ready
sleep 10

# Run container (à adapter)
docker run -d -p 5000:5000 python:3.11 python -m http.server 5000



