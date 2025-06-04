# SSH Deploy Key Setup for GitHub Actions

This document provides detailed instructions for setting up SSH deploy keys for GitHub Actions deployment.

## Overview

SSH deploy keys provide a secure way to authenticate with GitHub for deployment purposes. Unlike personal access tokens or the GitHub token, SSH deploy keys:

- Are specific to a single repository
- Can be restricted to read-only or read-write access
- Use asymmetric cryptography for enhanced security

## Step 1: Generate an SSH Key Pair Locally

First, you need to generate an SSH key pair on your local machine. This consists of a private key (kept secret) and a public key (shared with GitHub).

Open a terminal and run:

```bash
# Create a directory for the key if it doesn't exist
mkdir -p ~/.ssh

# Generate the SSH key pair
ssh-keygen -t ed25519 -C "github-actions-deploy@example.com" -f ~/.ssh/github_deploy_key -N ""
```

This creates:
- Private key: `~/.ssh/github_deploy_key`
- Public key: `~/.ssh/github_deploy_key.pub`

## Step 2: Add the Public Key to GitHub as a Deploy Key

1. Display and copy the public key:
   ```bash
   cat ~/.ssh/github_deploy_key.pub
   ```

2. Go to your GitHub repository
3. Navigate to Settings > Deploy keys
4. Click "Add deploy key"
5. Title: "GitHub Actions Deploy Key"
6. Key: Paste the public key you copied
7. Check "Allow write access" (required for deployment)
8. Click "Add key"

## Step 3: Add the Private Key as a GitHub Secret

1. Display and copy the private key:
   ```bash
   cat ~/.ssh/github_deploy_key
   ```

2. Go to your GitHub repository
3. Navigate to Settings > Secrets and variables > Actions
4. Click "New repository secret"
5. Name: `SSH_DEPLOY_KEY`
6. Value: Paste the entire private key, including the BEGIN and END lines
7. Click "Add secret"

## Step 4: Verify the Workflow Configuration

The workflow is already configured to use the SSH deploy key:

```yaml
- name: Install SSH key
  uses: shimataro/ssh-key-action@v2
  with:
    key: ${{ secrets.SSH_DEPLOY_KEY }}
    known_hosts: unnecessary
    if_key_exists: fail

- name: Add known hosts
  run: |
    mkdir -p ~/.ssh
    ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts

- name: Deploy to GitHub Pages
  uses: peaceiris/actions-gh-pages@v3
  with:
    deploy_key: ${{ secrets.SSH_DEPLOY_KEY }}
    publish_dir: ./demo
```

## Step 5: Run the Workflow

1. Go to the Actions tab in your GitHub repository
2. Select the "Deploy with SSH Deploy Keys" workflow
3. Click "Run workflow"
4. The workflow will use your SSH deploy key to authenticate and deploy to GitHub Pages

## Troubleshooting

If you encounter issues:

1. **Permission denied errors**:
   - Verify the deploy key has write access
   - Check that the private key in the secret matches the public key in deploy keys
   - Ensure the key format is correct (includes BEGIN and END lines)

2. **Known hosts errors**:
   - The workflow adds GitHub to known hosts automatically
   - If you see errors, try running the workflow again

3. **Invalid key format**:
   - Make sure you copied the entire key, including BEGIN and END lines
   - Ensure there are no extra spaces or line breaks

## Security Best Practices

- Never share your private key
- Use a unique deploy key for each repository
- Rotate keys periodically (generate new keys and update both the deploy key and secret)
- Consider using passphrase-protected keys for additional security (requires additional workflow configuration)
