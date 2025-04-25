# Breast Cancer Detection Application

[![CI/CD Pipeline](https://github.com/keerthana777z/Breast-Cancer-Detection-Application/actions/workflows/complete-cicd-pipeline.yml/badge.svg)](https://github.com/keerthana777z/Breast-Cancer-Detection-Application/actions/workflows/complete-cicd-pipeline.yml)
[![Frontend](https://img.shields.io/badge/frontend-React-blue)](http://localhost:3000)
[![Backend](https://img.shields.io/badge/backend-Flask-green)](http://localhost:5003)

A web application for detecting breast cancer from histopathological images using deep learning.

## Features

- Upload histopathological images for analysis
- Real-time prediction using a trained deep learning model
- Responsive web interface
- Dockerized application for easy deployment

## Technology Stack

- **Frontend**: React.js
- **Backend**: Flask (Python)
- **Machine Learning**: TensorFlow/Keras
- **Containerization**: Docker & Docker Compose
- **CI/CD**: GitHub Actions

## Architecture

The application consists of two main components:

1. **Frontend**: A React application that provides the user interface for uploading images and displaying results.
2. **Backend**: A Flask API that processes images using a pre-trained deep learning model to predict whether the tissue is cancerous or non-cancerous.

## Getting Started

### Prerequisites

- Docker and Docker Compose
- Git

### Installation and Running

1. Clone the repository:
   ```bash
   git clone https://github.com/keerthana777z/Breast-Cancer-Detection-Application.git
   cd Breast-Cancer-Detection-Application
   ```

2. Start the application using Docker Compose:
   ```bash
   docker-compose up --build
   ```

3. Access the application:
   - Frontend: http://localhost:8080
   - Backend API: http://localhost:5003

### Development Setup

If you want to run the application without Docker for development:

1. Start the backend:
   ```bash
   cd BACKEND
   pip install -r requirements.txt
   python app.py
   ```

2. Start the frontend:
   ```bash
   cd my-app
   npm install
   npm start
   ```

## Comprehensive CI/CD Pipeline

This project uses GitHub Actions for a complete CI/CD pipeline that automatically builds, tests, and deploys the application to a production server:

- **Continuous Integration**: Automatically runs tests and builds Docker images on every push and pull request
- **Continuous Deployment**: Pushes Docker images to Docker Hub and deploys to a production server
- **Docker Compose**: Uses Docker Compose for orchestrating the application containers
- **SSH Deployment**: Securely deploys to your production server using SSH

### Pipeline Workflow

The CI/CD pipeline is defined in `.github/workflows/complete-cicd-pipeline.yml` and consists of a single job with multiple steps:

#### Build, Test, and Deploy
1. **Setup Environment**
   - Checks out the code
   - Sets up Node.js and Python environments
   - Configures Docker and Docker Compose

2. **Install Dependencies & Verify**
   - Installs frontend and backend dependencies
   - Verifies the model file exists

3. **Run Tests**
   - Runs frontend tests
   - Builds and tests Docker containers

4. **Build and Push Docker Images**
   - Logs in to Docker Hub
   - Builds and pushes frontend and backend images

5. **Deploy to Production**
   - Creates deployment files (docker-compose.prod.yml and deploy.sh)
   - Copies files to the production server
   - Executes the deployment script on the server
   - Notifies of deployment success or failure

### How to Use

When you push changes to the main branch or manually trigger the workflow:

1. The CI/CD pipeline will run tests and build the application
2. It will then build and push Docker images to Docker Hub
3. Finally, it will deploy the application to your production server
4. You can access the application at http://your-server-ip

### Required Secrets

To use this CI/CD pipeline, you need to set up the following secrets in your GitHub repository:

1. **Docker Hub Credentials**
   - `DOCKER_HUB_USERNAME`: Your Docker Hub username
   - `DOCKER_HUB_ACCESS_TOKEN`: Your Docker Hub access token

2. **SSH Deployment Credentials**
   - `SSH_HOST`: The IP address or hostname of your production server
   - `SSH_USERNAME`: The username for SSH access to your server
   - `SSH_PRIVATE_KEY`: Your SSH private key for server access
   - `SSH_PORT`: The SSH port (usually 22)

You can add these secrets in your GitHub repository under Settings > Secrets and variables > Actions.

## Usage

### Using the Application

After the CI/CD pipeline runs, the application will be available locally:

- **Frontend**: http://localhost:3000
- **Backend API**: http://localhost:5003

To use the application:

1. The application will automatically open in your browser after deployment
2. Upload a histopathological image using the "Choose File" button
3. Click "Predict" to analyze the image
4. View the prediction result (Cancerous or Non-Cancerous)

### Manual Local Setup

If you prefer to run the application manually:

1. Clone the repository
2. Start the backend:
   ```bash
   cd BACKEND
   pip install -r requirements.txt
   python app.py
   ```
3. Start the frontend:
   ```bash
   cd my-app
   npm install
   npm start
   ```
4. Open http://localhost:3000 in your browser

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- The model was trained on the [Breast Cancer Histopathological Database (BreakHis)](https://web.inf.ufpr.br/vri/databases/breast-cancer-histopathological-database-breakhis/)
