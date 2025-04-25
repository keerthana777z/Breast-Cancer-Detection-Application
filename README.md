# Breast Cancer Detection Application

[![CI/CD Pipeline](https://github.com/keerthana777z/Breast-Cancer-Detection-Application/actions/workflows/ci-cd.yml/badge.svg)](https://github.com/keerthana777z/Breast-Cancer-Detection-Application/actions/workflows/ci-cd.yml)
[![Deploy with SSH Keys](https://github.com/keerthana777z/Breast-Cancer-Detection-Application/actions/workflows/deploy-github-pages.yml/badge.svg)](https://github.com/keerthana777z/Breast-Cancer-Detection-Application/actions/workflows/deploy-github-pages.yml)
[![Deployed Demo](https://img.shields.io/badge/demo-live-brightgreen)](https://keerthana777z.github.io/Breast-Cancer-Detection-Application/)

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

## CI/CD Pipeline

This project uses GitHub Actions for continuous integration and deployment:

- **Continuous Integration**: Automatically runs tests and builds Docker images on every push and pull request.
- **Continuous Deployment**: Automatically deploys the application using SSH key authentication when changes are pushed to the main branch.

The CI/CD pipeline performs the following steps:

### Testing and Building
1. Checks out the code
2. Sets up Node.js and Python environments
3. Installs dependencies
4. Runs frontend tests
5. Builds Docker images
6. Starts the containers and verifies they're running correctly

### Deployment with SSH Keys
7. Generates an SSH key pair during the workflow run
8. Sets up SSH authentication with GitHub
9. Deploys the application to GitHub Pages using SSH

### SSH Key Setup
To enable the deployment with SSH keys, you need to:
1. Run the workflow once to generate the SSH key
2. Add the public key (displayed in the workflow logs) to your repository's deploy keys
3. Make sure to give the deploy key write access

For detailed instructions, see [SSH Key Setup](docs/ssh-key-setup.md).

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
