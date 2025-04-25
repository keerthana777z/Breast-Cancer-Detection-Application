# SSH Keys Setup for CI/CD Deployment

This guide will help you set up SSH keys for deploying your Breast Cancer Detection Application using GitHub Actions.

## Files in This Directory

- `add_ssh_key_to_server.sh`: Script to add the public key to your server
- `test_deployment.sh`: Script to test the deployment setup
- `github_secrets_guide.md`: Guide for adding secrets to GitHub
- `server_setup_guide.md`: Guide for setting up your server
- `ssh_keys_readme.md`: Information about the SSH keys

## Step 1: SSH Keys

SSH keys have been generated in `~/.ssh/breast-cancer-app/`:
- Private key: `~/.ssh/breast-cancer-app/id_rsa`
- Public key: `~/.ssh/breast-cancer-app/id_rsa.pub`

## Step 2: Server Setup

Follow the instructions in `server_setup_guide.md` to prepare your server for deployment.

## Step 3: Add SSH Key to Server

Edit the `add_ssh_key_to_server.sh` script with your server details:

```bash
# Open the script
nano add_ssh_key_to_server.sh

# Update these variables
SERVER_IP="your_server_ip"
SERVER_USER="your_server_username"
SSH_PORT="22"  # Change if your server uses a different SSH port
```

Then run the script:

```bash
./add_ssh_key_to_server.sh
```

## Step 4: Test Deployment

Edit the `test_deployment.sh` script with your server details:

```bash
# Open the script
nano test_deployment.sh

# Update these variables
SERVER_IP="your_server_ip"
SERVER_USER="your_server_username"
SSH_PORT="22"  # Change if your server uses a different SSH port
```

Then run the script:

```bash
./test_deployment.sh
```

## Step 5: Add Secrets to GitHub

Follow the instructions in `github_secrets_guide.md` to add the required secrets to your GitHub repository.

## Step 6: Run the CI/CD Pipeline

1. Go to your GitHub repository
2. Click on the "Actions" tab
3. Select the "Complete CI/CD Pipeline" workflow
4. Click "Run workflow"
5. Select the branch (usually "main")
6. Click "Run workflow"

## Troubleshooting

If you encounter any issues:

1. Check the GitHub Actions logs for error messages
2. Verify that all secrets are correctly added to GitHub
3. Ensure your server is properly set up with Docker and Docker Compose
4. Test the SSH connection manually:
   ```bash
   ssh -i ~/.ssh/breast-cancer-app/id_rsa your_username@your_server_ip
   ```
5. Check if the deployment directory exists on your server:
   ```bash
   ssh -i ~/.ssh/breast-cancer-app/id_rsa your_username@your_server_ip "ls -la ~/breast-cancer-app"
   ```
