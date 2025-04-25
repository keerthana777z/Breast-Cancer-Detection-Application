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

## Local Deployment with CI/CD Pipeline

This project uses GitHub Actions for a complete CI/CD pipeline that automatically runs the application locally:

- **Continuous Integration**: Automatically runs tests and builds Docker images on every push and pull request
- **Local Deployment**: Starts both frontend and backend servers locally
- **Automatic Launch**: Opens the application in a browser after deployment

### Pipeline Workflow

The CI/CD pipeline is defined in `.github/workflows/complete-cicd-pipeline.yml` and consists of two jobs:

#### 1. Test and Build
- Checks out the code
- Sets up Node.js and Python environments
- Installs dependencies for both frontend and backend
- Runs frontend tests
- Builds and tests Docker images
- Verifies containers are running correctly

#### 2. Deploy and Run
- Installs all dependencies for frontend and backend
- Starts the backend server on port 5003
- Starts the frontend development server on port 3000
- Automatically opens the application in a browser
- Keeps the servers running for 1 hour to allow testing

### How to Use

When you push changes to the main branch or manually trigger the workflow:

1. The CI/CD pipeline will run tests and build the application
2. It will then start both the frontend and backend servers
3. The application will automatically open in a browser
4. You can use the application to make predictions for 1 hour before the servers shut down

This approach allows you to immediately test and use the application after deployment without any manual setup.

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
