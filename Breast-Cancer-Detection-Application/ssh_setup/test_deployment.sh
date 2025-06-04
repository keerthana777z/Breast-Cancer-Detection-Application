#!/bin/bash

# This script tests the deployment of the Breast Cancer Detection Application

# Replace these variables with your server details
SERVER_IP="your_server_ip"
SERVER_USER="your_server_username"
SSH_KEY_PATH="$HOME/.ssh/breast-cancer-app/id_rsa"
SSH_PORT="22"  # Change if your server uses a different SSH port

# Check if the SSH key exists
if [ ! -f "$SSH_KEY_PATH" ]; then
    echo "Error: SSH key not found at $SSH_KEY_PATH"
    exit 1
fi

# Test SSH connection
echo "Testing SSH connection to $SERVER_USER@$SERVER_IP..."
ssh -i "$SSH_KEY_PATH" -p $SSH_PORT $SERVER_USER@$SERVER_IP "echo 'SSH connection successful!'"

if [ $? -ne 0 ]; then
    echo "Failed to connect to the server via SSH."
    exit 1
fi

# Test Docker on the server
echo "Testing Docker on the server..."
ssh -i "$SSH_KEY_PATH" -p $SSH_PORT $SERVER_USER@$SERVER_IP "docker --version"

if [ $? -ne 0 ]; then
    echo "Docker is not installed or not working on the server."
    exit 1
fi

# Test Docker Compose on the server
echo "Testing Docker Compose on the server..."
ssh -i "$SSH_KEY_PATH" -p $SSH_PORT $SERVER_USER@$SERVER_IP "docker-compose --version"

if [ $? -ne 0 ]; then
    echo "Docker Compose is not installed or not working on the server."
    exit 1
fi

# Check if the deployment directory exists
echo "Checking if the deployment directory exists..."
ssh -i "$SSH_KEY_PATH" -p $SSH_PORT $SERVER_USER@$SERVER_IP "mkdir -p ~/breast-cancer-app && echo 'Deployment directory exists or was created.'"

# Create a test docker-compose file
echo "Creating a test docker-compose file..."
ssh -i "$SSH_KEY_PATH" -p $SSH_PORT $SERVER_USER@$SERVER_IP "cat > ~/breast-cancer-app/test-docker-compose.yml << EOF
version: '3'
services:
  hello:
    image: hello-world
EOF"

# Test Docker Compose with the test file
echo "Testing Docker Compose with the test file..."
ssh -i "$SSH_KEY_PATH" -p $SSH_PORT $SERVER_USER@$SERVER_IP "cd ~/breast-cancer-app && docker-compose -f test-docker-compose.yml up"

if [ $? -ne 0 ]; then
    echo "Failed to run Docker Compose on the server."
    exit 1
fi

# Clean up
echo "Cleaning up..."
ssh -i "$SSH_KEY_PATH" -p $SSH_PORT $SERVER_USER@$SERVER_IP "rm ~/breast-cancer-app/test-docker-compose.yml"

echo "All tests passed! Your server is ready for deployment."
echo ""
echo "Now you can add the following secrets to your GitHub repository:"
echo ""
echo "SSH_HOST: $SERVER_IP"
echo "SSH_USERNAME: $SERVER_USER"
echo "SSH_PORT: $SSH_PORT"
echo "SSH_PRIVATE_KEY: (The content of $SSH_KEY_PATH)"
