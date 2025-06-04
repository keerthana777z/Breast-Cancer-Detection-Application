#!/bin/bash
# Script to generate SSH deploy keys for GitHub Actions

# Set variables
KEY_NAME="github_deploy_key"
KEY_COMMENT="github-actions-deploy@example.com"
KEY_PATH="$HOME/.ssh/$KEY_NAME"

# Create .ssh directory if it doesn't exist
mkdir -p "$HOME/.ssh"

# Check if key already exists
if [ -f "$KEY_PATH" ]; then
  echo "Warning: Key already exists at $KEY_PATH"
  read -p "Do you want to overwrite it? (y/n): " OVERWRITE
  if [ "$OVERWRITE" != "y" ]; then
    echo "Aborted. Existing key not overwritten."
    exit 1
  fi
fi

# Generate the SSH key pair
echo "Generating SSH key pair..."
ssh-keygen -t ed25519 -C "$KEY_COMMENT" -f "$KEY_PATH" -N ""

# Display instructions
echo ""
echo "=== SSH Deploy Key Generated Successfully ==="
echo ""
echo "Next steps:"
echo ""
echo "1. Add the public key to your GitHub repository as a deploy key:"
echo "   - Go to your repository on GitHub"
echo "   - Navigate to Settings > Deploy keys"
echo "   - Click 'Add deploy key'"
echo "   - Title: GitHub Actions Deploy Key"
echo "   - Key: (copy the content below)"
echo "   - Check 'Allow write access'"
echo "   - Click 'Add key'"
echo ""
echo "--- Public Key (copy this) ---"
cat "$KEY_PATH.pub"
echo "-------------------------------"
echo ""
echo "2. Add the private key as a GitHub secret:"
echo "   - Go to your repository on GitHub"
echo "   - Navigate to Settings > Secrets and variables > Actions"
echo "   - Click 'New repository secret'"
echo "   - Name: SSH_DEPLOY_KEY"
echo "   - Value: (copy the content below, including BEGIN and END lines)"
echo "   - Click 'Add secret'"
echo ""
echo "--- Private Key (copy this) ---"
cat "$KEY_PATH"
echo "-------------------------------"
echo ""
echo "Your keys have been saved to:"
echo "- Private key: $KEY_PATH"
echo "- Public key: $KEY_PATH.pub"
echo ""
echo "IMPORTANT: Keep your private key secure and never share it publicly!"
