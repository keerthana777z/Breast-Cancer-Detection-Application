# Deploying to Render.com

This guide explains how to deploy the Breast Cancer Detection Application to Render.com.

## Why Render.com?

Render.com is a cloud provider that offers:
- Free tier for both static sites and web services
- Easy deployment from GitHub
- Automatic HTTPS
- Custom domains
- CI/CD integration

## Deployment Steps

### 1. Create a Render.com Account

1. Go to [Render.com](https://render.com/)
2. Sign up for an account (you can use your GitHub account)

### 2. Deploy the Backend

1. In your Render dashboard, click "New" and select "Web Service"
2. Connect your GitHub repository
3. Configure the service:
   - Name: `breast-cancer-detection-api`
   - Environment: `Python 3`
   - Build Command: `pip install -r requirements.txt`
   - Start Command: `python app.py`
   - Select the "Free" plan
   - Under "Advanced", add the environment variable:
     - Key: `PORT`
     - Value: `5003`
4. Click "Create Web Service"

### 3. Deploy the Frontend

1. In your Render dashboard, click "New" and select "Static Site"
2. Connect your GitHub repository
3. Configure the service:
   - Name: `breast-cancer-detection-frontend`
   - Build Command: `cd my-app && npm install && npm run build`
   - Publish Directory: `my-app/build`
   - Select the "Free" plan
4. Click "Create Static Site"

### 4. Connect Frontend to Backend

The frontend code has already been updated to connect to the deployed backend at:
```
https://breast-cancer-detection-api.onrender.com
```

If your backend URL is different, update the `DEPLOYED_BACKEND_URL` variable in `my-app/src/App.js`.

### 5. Using the Blueprint (Optional)

Render.com supports a feature called "Blueprints" that allows you to deploy multiple services at once using a YAML configuration file.

1. In your Render dashboard, click "New" and select "Blueprint"
2. Connect your GitHub repository
3. Render will automatically detect the `render.yaml` file in your repository
4. Review the services and click "Apply"

## Troubleshooting

### Backend Issues

1. **Model Loading Errors**:
   - Check the logs in the Render dashboard
   - Ensure the model file is properly included in the repository

2. **CORS Issues**:
   - The backend is configured to allow requests from all origins
   - If you're still having issues, check the browser console for specific errors

### Frontend Issues

1. **API Connection Errors**:
   - Verify that the `DEPLOYED_BACKEND_URL` in `App.js` matches your actual backend URL
   - Check the browser console for network errors

2. **Build Failures**:
   - Check the build logs in the Render dashboard
   - Ensure all dependencies are properly specified in `package.json`

## Monitoring and Scaling

1. **Free Tier Limitations**:
   - Free services on Render spin down after 15 minutes of inactivity
   - The first request after inactivity may take a few seconds to respond

2. **Upgrading**:
   - If you need more reliable performance, consider upgrading to a paid plan
   - Paid plans start at $7/month and offer improved performance and uptime
