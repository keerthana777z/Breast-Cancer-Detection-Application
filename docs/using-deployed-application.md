# Using the Deployed Application

This document explains how to use the deployed Breast Cancer Detection Application.

## Accessing the Frontend

The frontend of the application is deployed to GitHub Pages and can be accessed at:
https://keerthana777z.github.io/Breast-Cancer-Detection-Application/

## Using the Backend

The backend is built as a Docker image and its artifacts are stored on GitHub Pages. You can download and load the Docker image:

```bash
# Download the backend Docker image artifact
curl -L -o backend.tar https://keerthana777z.github.io/Breast-Cancer-Detection-Application/backend-artifacts/backend.tar

# Load the Docker image
docker load < backend.tar

# Run the backend container
docker run -p 5003:5003 breast-cancer-detection-backend:latest
```

## Connecting Frontend to Backend

By default, the deployed frontend is configured to connect to a backend at a specific URL. If you're running the backend locally, you may need to modify the API endpoint in the frontend code.

### Option 1: Use a Proxy Server

You can set up a proxy server to forward requests from the frontend to your locally running backend.

### Option 2: Deploy Backend to a Cloud Provider

For a complete deployment, you can deploy the backend to a cloud provider:

1. **Heroku**:
   ```bash
   # Login to Heroku
   heroku login

   # Create a new Heroku app
   heroku create breast-cancer-detection-api

   # Set up Heroku container registry
   heroku container:login

   # Build and push the Docker image
   heroku container:push web -a breast-cancer-detection-api

   # Release the container
   heroku container:release web -a breast-cancer-detection-api
   ```

2. **AWS Elastic Beanstalk**:
   - Create an Elastic Beanstalk environment
   - Deploy the Docker image using the AWS console or CLI

3. **Google Cloud Run**:
   ```bash
   # Build and push to Google Container Registry
   gcloud builds submit --tag gcr.io/YOUR_PROJECT_ID/breast-cancer-detection-backend

   # Deploy to Cloud Run
   gcloud run deploy breast-cancer-detection-backend \
     --image gcr.io/YOUR_PROJECT_ID/breast-cancer-detection-backend \
     --platform managed
   ```

## Testing the Deployed Application

1. Open the frontend URL in your browser
2. Upload a histopathological image
3. Click "Predict" to analyze the image
4. View the prediction results

## Troubleshooting

If you encounter issues with the deployed application:

1. **Frontend Issues**:
   - Check the browser console for errors
   - Verify that the frontend is correctly configured to connect to the backend

2. **Backend Issues**:
   - Ensure the backend container is running
   - Check the container logs for error messages
   - Verify that the required ports are open and accessible

3. **Connection Issues**:
   - Check for CORS (Cross-Origin Resource Sharing) issues
   - Verify that the backend URL is correctly configured in the frontend
   - Ensure network connectivity between frontend and backend
