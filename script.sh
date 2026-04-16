#!/bin/bash

# Update system
dnf upgrade -y

# Install Docker repo
dnf install -y dnf-plugins-core
dnf config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo

# Install Docker
dnf install -y docker-ce docker-ce-cli containerd.io

# Start Docker
systemctl enable docker
systemctl start docker
echo "DOCKER STARTED"

# Install SSM Agent
dnf install -y https://s3.amazonaws.com/amazon-ssm-us-east-1/latest/linux_amd64/amazon-ssm-agent.rpm

# Start SSM Agent
systemctl start amazon-ssm-agent
systemctl enable amazon-ssm-agent
echo "SSM INSTALL DONE"

# Add ec2-user to docker group
usermod -aG docker ec2-user

# Wait Docker
sleep 10

# Run container
docker run -d -p 5000:5000 python:3.11 python -m http.server 5000