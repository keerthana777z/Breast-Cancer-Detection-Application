# SSH Key and GitHub Token Deployment

This document explains the deployment methods used in this project.

## Current Deployment Method

The current workflow uses the GitHub token (`GITHUB_TOKEN`) for deployment, which is automatically provided by GitHub Actions. This is the simplest approach and doesn't require any additional setup.

## SSH Key Generation (For Demonstration)

The workflow also demonstrates how to generate SSH keys, which can be useful for other deployment scenarios:

1. The workflow generates an SSH key pair during the run
2. The public key is displayed in the workflow logs
3. This is for educational purposes only - the actual deployment uses the GitHub token

## Alternative: Using SSH Keys for Deployment

If you prefer to use SSH keys for deployment instead of the GitHub token, you can modify the workflow as follows:

### 1. Generate an SSH Key Pair

```bash
ssh-keygen -t rsa -b 4096 -C "your-email@example.com" -f github_deploy_key
```

### 2. Add the Public Key to Your GitHub Repository

1. Go to your GitHub repository
2. Navigate to Settings > Deploy keys
3. Click "Add deploy key"
4. Give it a title (e.g., "GitHub Actions Deployment Key")
5. Paste the content of `github_deploy_key.pub`
6. Check "Allow write access" (this is required for deployment)
7. Click "Add key"

### 3. Add the Private Key as a GitHub Secret

1. Go to your GitHub repository
2. Navigate to Settings > Secrets and variables > Actions
3. Click "New repository secret"
4. Name: `DEPLOY_KEY`
5. Value: Copy the entire content of the `github_deploy_key` file
6. Click "Add secret"

### 4. Update the Workflow File

Modify the `.github/workflows/deploy-github-pages.yml` file to use the SSH key:

```yaml
- name: Deploy to GitHub Pages
  uses: peaceiris/actions-gh-pages@v3
  with:
    deploy_key: ${{ secrets.DEPLOY_KEY }}
    publish_dir: ./demo
```

## Security Considerations

- The GitHub token has limited permissions and is automatically rotated
- SSH keys provide more control but require manual setup
- Always treat deployment credentials as sensitive information
