
# HistoAI: Intelligent Early Cancer Detection 🧬

**HistoAI** takes the uncertainty out of early cancer detection with intelligent, data-driven precision. Designed to support doctors and empower patients, it leverages cutting-edge machine learning to analyze diagnostic data, spot subtle patterns, and predict the risk of breast cancer — faster and more accurately than ever before.

From real-time analysis to personalized risk assessments, HistoAI bridges the gap between technology and healthcare, delivering results that matter when time is critical. It’s smart, seamless, and built for a future where AI and medicine work hand in hand to save lives.

---

## 🚀 Features

- 🧠 **Machine learning-powered** breast cancer risk prediction
- ⚡ **Real-time diagnostic** data analysis
- 🌐 **Frontend** developed with **React**
- 🔥 **Backend** powered by **Flask (Python)**
- 📦 **Dockerized** frontend and backend for easy deployment
- 🔄 **Fully automated CI/CD** pipeline using Jenkins
- 🧪 **Automated end-to-end testing** integrated into the pipeline
- 🚀 **Scalable and production-ready** architecture

---

## 🛠️ Development Preparation

### 🔧 Frontend & Backend
- Built **frontend** using **React.js**
- Developed **backend** using **Flask**, integrating ML models (ResNet50)

### 🐳 Dockerization
- Created **Dockerfiles** for both frontend and backend
- Containerized apps for consistent environment setup
- Used **Docker Compose** for orchestration

### 🔁 Version Control
- Managed via **Git**
- All codebases (frontend, backend, ML, CI/CD) tracked in one repo

---

## ⚙️ CI/CD Pipeline with Jenkins

### 🧱 Jenkins Setup
- Configured Jenkins for **automated Continuous Integration**
- Pipeline triggers on `git push`

### 🛠 Docker Build and Deployment
- Built optimized, multi-stage Docker images
- Used **Docker Compose** to map:
  - Frontend: `http://localhost`
  - Backend API: `http://localhost:5000`

### 🚀 Pipeline Optimization
- Leveraged **build caching** and efficient sourcing
- Optimized build workflow for faster deployments

---

## 🧪 Deployment and Testing

### 🖥 Local Deployment

```bash
git clone https://github.com/keerthana777z/histoai.git
cd histoai
docker-compose up --build
````

* Access Frontend: `http://localhost`
* Access Backend API: `http://localhost:5000`

### ✅ Automated End-to-End Testing

* Test scripts run automatically via Jenkins after deployment
* Verified full-stack functionality and communication

---

## 📈 Outcome and Impact

* ✅ **Completed Deployment**: Full-stack app running locally
* ⚡ **Boosted Efficiency**: Fast CI/CD cycle with Jenkins
* 🌍 **Scalable Design**: Ready for real-world cloud deployment

---

## 🧰 Technologies Used

* **Frontend**: React.js
* **Backend**: Flask (Python)
* **ML Model**: ResNet50
* **Containerization**: Docker, Docker Compose
* **CI/CD**: Jenkins
* **Version Control**: Git

---

## 🌱 Future Enhancements

* ☁️ Cloud Deployment (AWS / GCP / Azure)
* 📊 Advanced monitoring & logging (Prometheus, Grafana)
* 🏥 Healthcare DB integration for real-world validation
* 🔍 Model explainability using **SHAP** or **LIME**

---

## 👩‍💻 Author

**AR Keerthana**
🔗 [GitHub Profile](https://github.com/keerthana777z)


