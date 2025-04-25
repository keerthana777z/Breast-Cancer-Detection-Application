# Breast Cancer Detection Application

[![CI/CD Pipeline](https://github.com/keerthana777z/Breast-Cancer-Detection-Application/actions/workflows/complete-cicd-pipeline.yml/badge.svg)](https://github.com/keerthana777z/Breast-Cancer-Detection-Application/actions/workflows/complete-cicd-pipeline.yml)
[![Frontend](https://img.shields.io/badge/frontend-deployed-brightgreen)](https://keerthana777z.github.io/Breast-Cancer-Detection-Application/)
[![Backend](https://img.shields.io/badge/backend-packaged-blue)](https://keerthana777z.github.io/Breast-Cancer-Detection-Application/backend-artifacts/backend-package.zip)

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

## CI/CD Pipeline with GitHub Pages Deployment (Updated)

This project uses GitHub Actions for a complete CI/CD pipeline that automatically builds, tests, and deploys the application:

- **Continuous Integration**: Automatically runs tests and builds Docker images on every push and pull request
- **Frontend Deployment**: Deploys the React frontend to GitHub Pages
- **Backend Packaging**: Creates a downloadable package for the backend

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
- Deploys the built frontend to GitHub Pages
- Makes the application accessible at https://keerthana777z.github.io/Breast-Cancer-Detection-Application/

#### 3. Backend Deployment
- Creates a deployable backend package with source code and instructions
- Packages the backend as a zip file
- Deploys the package to GitHub Pages
- Creates a deployment record

### How to Use

When you push changes to the main branch or manually trigger the workflow:

1. The CI/CD pipeline will run tests and build the application
2. It will then deploy the frontend to GitHub Pages
3. It will package the backend and make it available for download
4. You can access the frontend at https://keerthana777z.github.io/Breast-Cancer-Detection-Application/
5. You can download and run the backend package from https://keerthana777z.github.io/Breast-Cancer-Detection-Application/backend-artifacts/backend-package.zip

### Required Permissions

This workflow uses the built-in `GITHUB_TOKEN` secret which is automatically provided by GitHub Actions. No additional secrets are required for this deployment approach.

## Usage

### Using the Deployed Application

After the CI/CD pipeline runs, the application will be available at:

- **Frontend**: [https://keerthana777z.github.io/Breast-Cancer-Detection-Application/](https://keerthana777z.github.io/Breast-Cancer-Detection-Application/)
- **Backend Package**: [https://keerthana777z.github.io/Breast-Cancer-Detection-Application/backend-artifacts/backend-package.zip](https://keerthana777z.github.io/Breast-Cancer-Detection-Application/backend-artifacts/backend-package.zip)

To use the application:

1. Download and extract the backend package
2. **Important**: Copy your `my_model3.h5` file to the backend-package directory
   ```bash
   # From your local repository
   cp /path/to/your/BACKEND/my_model3.h5 /path/to/backend-package/
   ```
3. Run the backend:
   ```bash
   cd backend-package
   pip install -r requirements.txt
   python app.py
   ```
4. Open the frontend URL in your browser
5. Upload a histopathological image using the "Choose File" button
6. Click "Predict" to analyze the image
7. View the prediction result (Cancerous or Non-Cancerous)

### Manual Local Setup

If you prefer to run the entire application locally:

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
