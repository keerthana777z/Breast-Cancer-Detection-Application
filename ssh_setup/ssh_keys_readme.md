# SSH Keys for Breast Cancer Detection Application Deployment

This directory contains the SSH keys for deploying the Breast Cancer Detection Application.

## Files

- `id_rsa`: The private key (KEEP THIS SECURE!)
- `id_rsa.pub`: The public key (to be added to your server)

## Using the Keys

### 1. Add the Public Key to Your Server

Run the `add_ssh_key_to_server.sh` script after updating it with your server details:

```bash
# Edit the script with your server details
nano add_ssh_key_to_server.sh

# Run the script
./add_ssh_key_to_server.sh
```

Alternatively, you can manually add the public key to your server:

```bash
# Copy the public key
cat ~/.ssh/breast-cancer-app/id_rsa.pub

# On your server, add it to authorized_keys
echo "PASTE_PUBLIC_KEY_HERE" >> ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys
```

### 2. Add the Private Key to GitHub Secrets

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

### 3. Test the SSH Connection

```bash
# Test SSH connection to your server
ssh -i ~/.ssh/breast-cancer-app/id_rsa your_username@your_server_ip
```

## Security Notes

- Never share your private key (`id_rsa`)
- Store your private key securely
- Use these keys only for this specific deployment
- Consider setting a passphrase for additional security
- Regularly rotate your SSH keys for better security
