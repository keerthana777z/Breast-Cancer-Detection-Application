# Adding Required Secrets to GitHub Repository

Follow these steps to add the necessary secrets to your GitHub repository for the CI/CD pipeline:

## 1. Docker Hub Credentials

### DOCKER_HUB_USERNAME
1. Go to your GitHub repository
2. Click on "Settings" tab
3. In the left sidebar, click on "Secrets and variables" → "Actions"
4. Click "New repository secret"
5. Name: `DOCKER_HUB_USERNAME`
6. Value: Your Docker Hub username
7. Click "Add secret"

### DOCKER_HUB_ACCESS_TOKEN
1. Go to [Docker Hub](https://hub.docker.com/)
2. Click on your username in the top-right corner
3. Select "Account Settings"
4. Click on "Security" in the left sidebar
5. Click "New Access Token"
6. Give it a name (e.g., "GitHub Actions")
7. Select appropriate permissions (at least "Read & Write")
8. Click "Generate"
9. Copy the generated token
10. Go to your GitHub repository
11. Click on "Settings" tab
12. In the left sidebar, click on "Secrets and variables" → "Actions"
13. Click "New repository secret"
14. Name: `DOCKER_HUB_ACCESS_TOKEN`
15. Value: The access token you copied
16. Click "Add secret"

## 2. SSH Deployment Credentials

### SSH_HOST
1. Go to your GitHub repository
2. Click on "Settings" tab
3. In the left sidebar, click on "Secrets and variables" → "Actions"
4. Click "New repository secret"
5. Name: `SSH_HOST`
6. Value: The IP address or hostname of your server
7. Click "Add secret"

### SSH_USERNAME
1. Go to your GitHub repository
2. Click on "Settings" tab
3. In the left sidebar, click on "Secrets and variables" → "Actions"
4. Click "New repository secret"
5. Name: `SSH_USERNAME`
6. Value: The username for SSH access to your server
7. Click "Add secret"

### SSH_PRIVATE_KEY
1. Copy the entire content of your private key file (including BEGIN and END lines)
   ```
   cat ~/.ssh/breast-cancer-app/id_rsa
   ```
2. Go to your GitHub repository
3. Click on "Settings" tab
4. In the left sidebar, click on "Secrets and variables" → "Actions"
5. Click "New repository secret"
6. Name: `SSH_PRIVATE_KEY`
7. Value: The entire private key content you copied
8. Click "Add secret"

### SSH_PORT
1. Go to your GitHub repository
2. Click on "Settings" tab
3. In the left sidebar, click on "Secrets and variables" → "Actions"
4. Click "New repository secret"
5. Name: `SSH_PORT`
6. Value: The SSH port (usually 22)
7. Click "Add secret"

## Verifying Secrets

After adding all the secrets, you should see the following secrets in your repository:
- DOCKER_HUB_USERNAME
- DOCKER_HUB_ACCESS_TOKEN
- SSH_HOST
- SSH_USERNAME
- SSH_PRIVATE_KEY
- SSH_PORT

These secrets will be used by the GitHub Actions workflow to build, push, and deploy your application.
