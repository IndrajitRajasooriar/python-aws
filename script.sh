#!/bin/bash

# Update system
apt-get update -y

# Install Docker
apt-get install -y docker.io

# Enable Docker service
systemctl enable docker
systemctl start docker

# Add ubuntu user to docker group
usermod -aG docker ubuntu

# Wait Docker to be ready
sleep 10

# Run container (à adapter)
docker run -d -p 5000:5000 python:3.11 python -m http.server 5000

