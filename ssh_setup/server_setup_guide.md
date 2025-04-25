# Server Setup Guide for Breast Cancer Detection Application

Follow these steps to prepare your server for the CI/CD deployment:

## 1. Install Docker

```bash
# Update package index
sudo apt update

# Install prerequisites
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# Add Docker's official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Add Docker repository
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Update package index again
sudo apt update

# Install Docker CE
sudo apt install -y docker-ce

# Add your user to the docker group to run Docker without sudo
sudo usermod -aG docker $USER

# Verify Docker installation
docker --version
```

## 2. Install Docker Compose

```bash
# Download Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Apply executable permissions
sudo chmod +x /usr/local/bin/docker-compose

# Verify Docker Compose installation
docker-compose --version
```

## 3. Create Deployment Directory

```bash
# Create a directory for the application
mkdir -p ~/breast-cancer-app

# Set appropriate permissions
chmod 755 ~/breast-cancer-app
```

## 4. Configure Firewall (if applicable)

```bash
# Allow SSH
sudo ufw allow ssh

# Allow HTTP (port 80) for frontend
sudo ufw allow 80/tcp

# Allow port 5003 for backend
sudo ufw allow 5003/tcp

# Enable firewall
sudo ufw enable

# Check firewall status
sudo ufw status
```

## 5. Add SSH Public Key

Run the `add_ssh_key_to_server.sh` script from your local machine after updating it with your server details:

```bash
# Edit the script with your server details
nano add_ssh_key_to_server.sh

# Run the script
./add_ssh_key_to_server.sh
```

## 6. Test Docker and Docker Compose

```bash
# Test Docker
docker run hello-world

# Create a test docker-compose.yml file
cat > ~/test-docker-compose.yml << EOF
version: '3'
services:
  hello:
    image: hello-world
EOF

# Test Docker Compose
docker-compose -f ~/test-docker-compose.yml up

# Clean up
rm ~/test-docker-compose.yml
```

## 7. Verify Deployment Directory

Make sure the deployment directory exists and has the correct permissions:

```bash
# Verify directory
ls -la ~/breast-cancer-app

# If needed, create it again
mkdir -p ~/breast-cancer-app
```

Your server is now ready for the CI/CD deployment of the Breast Cancer Detection Application!
