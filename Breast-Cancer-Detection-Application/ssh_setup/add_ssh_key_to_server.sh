#!/bin/bash

# This script adds the SSH public key to your server's authorized_keys file

# Replace these variables with your server details
SERVER_IP="your_server_ip"
SERVER_USER="your_server_username"
SSH_PORT="22"  # Change if your server uses a different SSH port

# The path to your public key
PUBLIC_KEY_PATH="$HOME/.ssh/breast-cancer-app/id_rsa.pub"

# Check if the public key exists
if [ ! -f "$PUBLIC_KEY_PATH" ]; then
    echo "Error: Public key not found at $PUBLIC_KEY_PATH"
    exit 1
fi

# Read the public key
PUBLIC_KEY=$(cat "$PUBLIC_KEY_PATH")

# Add the key to the server
echo "Adding SSH key to $SERVER_USER@$SERVER_IP..."
ssh -p $SSH_PORT $SERVER_USER@$SERVER_IP "mkdir -p ~/.ssh && chmod 700 ~/.ssh && echo '$PUBLIC_KEY' >> ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys"

if [ $? -eq 0 ]; then
    echo "SSH key added successfully!"
    echo "Now you can add the following secrets to your GitHub repository:"
    echo ""
    echo "SSH_HOST: $SERVER_IP"
    echo "SSH_USERNAME: $SERVER_USER"
    echo "SSH_PORT: $SSH_PORT"
    echo "SSH_PRIVATE_KEY: (The content of $HOME/.ssh/breast-cancer-app/id_rsa)"
else
    echo "Failed to add SSH key to the server."
    echo "Please check your server details and try again."
fi
