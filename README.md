# Breast Cancer Detection Application

[![Complete CI/CD Pipeline](https://github.com/keerthana777z/Breast-Cancer-Detection-Application/actions/workflows/complete-cicd-pipeline.yml/badge.svg)](https://github.com/keerthana777z/Breast-Cancer-Detection-Application/actions/workflows/complete-cicd-pipeline.yml)
[![Deployed Frontend](https://img.shields.io/badge/frontend-deployed-brightgreen)](https://keerthana777z.github.io/Breast-Cancer-Detection-Application/)
[![Backend Status](https://img.shields.io/badge/backend-artifacts-blue)](https://keerthana777z.github.io/Breast-Cancer-Detection-Application/backend-artifacts/deployment.txt)

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

This project uses GitHub Actions for a complete CI/CD pipeline that handles both frontend and backend:

- **Continuous Integration**: Automatically runs tests and builds Docker images on every push and pull request
- **Frontend Deployment**: Deploys the React frontend to GitHub Pages using SSH deploy keys
- **Backend Deployment**: Builds and pushes the backend Docker image to GitHub Container Registry

### Pipeline Workflow

The CI/CD pipeline is defined in `.github/workflows/complete-cicd-pipeline.yml` and consists of three jobs:

#### 1. Test and Build
- Checks out the code
- Sets up Node.js and Python environments
- Installs dependencies for both frontend and backend
- Runs frontend tests
- Builds and tests Docker images
- Verifies containers are running correctly

#### 2. Frontend Deployment
- Builds the React application
- Uses SSH deploy keys for secure authentication
- Deploys the built frontend to GitHub Pages
- Makes the application accessible at https://keerthana777z.github.io/Breast-Cancer-Detection-Application/

#### 3. Backend Deployment
- Creates a deployable backend package with source code and instructions
- Packages the backend as a zip file (under 100MB)
- Deploys the package to GitHub Pages
- Creates a deployment record
- Uses the same SSH deploy keys for authentication

### SSH Deploy Key Setup
The deployment uses SSH deploy keys for secure authentication:
1. SSH keys have been generated and configured
2. The public key is added to the repository's deploy keys (with write access)
3. The private key is stored as a repository secret named `SSH_DEPLOY_KEY`

For detailed information about the SSH key setup, see:
- [SSH Deploy Key Setup](docs/ssh-key-setup.md)

## Usage

1. Open the application in your web browser
2. Upload a histopathological image using the "Choose File" button
3. Click "Predict" to analyze the image
4. View the prediction result (Cancerous or Non-Cancerous)

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- The model was trained on the [Breast Cancer Histopathological Database (BreakHis)](https://web.inf.ufpr.br/vri/databases/breast-cancer-histopathological-database-breakhis/)
