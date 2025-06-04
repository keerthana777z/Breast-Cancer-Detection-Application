# AWS Setup for Deployment

This document explains how to set up the necessary AWS resources for deploying the Breast Cancer Detection Application.

## Prerequisites

1. An AWS account
2. AWS CLI installed and configured
3. Permissions to create the following resources:
   - Elastic Container Registry (ECR)
   - Elastic Beanstalk (EB)
   - IAM roles and policies

## Step 1: Create ECR Repositories

Create two ECR repositories to store your Docker images:

```bash
# Create repository for backend
aws ecr create-repository --repository-name breast-cancer-detection-backend

# Create repository for frontend
aws ecr create-repository --repository-name breast-cancer-detection-frontend
```

## Step 2: Create Elastic Beanstalk Application and Environment

```bash
# Create Elastic Beanstalk application
aws elasticbeanstalk create-application --application-name breast-cancer-detection

# Create Elastic Beanstalk environment
aws elasticbeanstalk create-environment \
  --application-name breast-cancer-detection \
  --environment-name breast-cancer-detection-env \
  --solution-stack-name "64bit Amazon Linux 2 v3.5.0 running Docker" \
  --option-settings file://eb-options.json
```

Create a file named `eb-options.json` with the following content:

```json
[
  {
    "Namespace": "aws:autoscaling:launchconfiguration",
    "OptionName": "IamInstanceProfile",
    "Value": "aws-elasticbeanstalk-ec2-role"
  },
  {
    "Namespace": "aws:elasticbeanstalk:application:environment",
    "OptionName": "PORT",
    "Value": "5003"
  }
]
```

## Step 3: Set up GitHub Secrets

Add the following secrets to your GitHub repository:

1. Go to your GitHub repository
2. Navigate to Settings > Secrets and variables > Actions
3. Add the following secrets:
   - `AWS_ACCESS_KEY_ID`: Your AWS access key
   - `AWS_SECRET_ACCESS_KEY`: Your AWS secret key

These credentials should belong to an IAM user with the following permissions:
- `AmazonECR-FullAccess`
- `AWSElasticBeanstalkFullAccess`

## Step 4: Enable GitHub Pages (for alternative deployment)

1. Go to your GitHub repository
2. Navigate to Settings > Pages
3. Under "Source", select "Deploy from a branch"
4. Select the "gh-pages" branch and click "Save"

## Troubleshooting

If you encounter issues with the deployment, check the following:

1. Ensure your AWS credentials have the necessary permissions
2. Verify that the ECR repositories and Elastic Beanstalk application/environment exist
3. Check the GitHub Actions logs for detailed error messages
