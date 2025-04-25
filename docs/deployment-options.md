# Deployment Options

This document explains the different deployment options available for the Breast Cancer Detection Application.

## Current Deployment Status

The application is currently deployed to GitHub Pages at:
https://keerthana777z.github.io/Breast-Cancer-Detection-Application/

This is a simple demo page that confirms the CI/CD pipeline is working correctly.

## 1. GitHub Pages (Frontend Only)

GitHub Pages is the simplest option for deploying the frontend of your application. It's free and directly integrated with GitHub.

### Setup:

1. Go to your GitHub repository
2. Navigate to Settings > Pages
3. Under "Source", select "Deploy from a branch"
4. Select the "gh-pages" branch and click "Save"

The GitHub Actions workflow will automatically deploy your frontend to GitHub Pages when you push changes to the main branch.

### Limitations:
- GitHub Pages can only host static content, so the backend cannot be deployed here
- You'll need to configure the frontend to use a separately deployed backend API

## 2. Netlify (Frontend with Optional Backend)

Netlify is a popular platform for deploying web applications with a generous free tier.

### Setup:

1. Create a Netlify account at https://netlify.com
2. Connect your GitHub repository to Netlify
3. Add the following secrets to your GitHub repository:
   - `NETLIFY_AUTH_TOKEN`: Your Netlify personal access token
   - `NETLIFY_SITE_ID`: The ID of your Netlify site

### For Backend:
You can use Netlify Functions to deploy serverless backend functions.

## 3. Render.com (Full Stack)

Render.com is a cloud provider that makes it easy to deploy both frontend and backend applications.

### Setup:

1. Create a Render account at https://render.com
2. Create a Web Service for your backend
3. Create a Static Site for your frontend
4. Add the following secrets to your GitHub repository:
   - `RENDER_SERVICE_ID`: The ID of your Render service
   - `RENDER_API_KEY`: Your Render API key

## 4. AWS Elastic Beanstalk (Full Stack)

AWS Elastic Beanstalk is a more advanced option that provides more control and scalability.

### Setup:
Follow the instructions in [aws-setup.md](aws-setup.md) to set up AWS resources.

## Choosing the Right Option

- **GitHub Pages**: Best for simple frontend-only demos
- **Netlify**: Good for frontend with limited backend needs
- **Render.com**: Good balance of simplicity and features for full-stack apps
- **AWS**: Best for production applications that need scalability and advanced features

## Troubleshooting

If you encounter deployment issues:

1. Check the GitHub Actions logs for error messages
2. Verify that you've added the necessary secrets to your GitHub repository
3. Make sure your application is properly configured for the deployment platform
4. Check the platform-specific documentation for troubleshooting tips
