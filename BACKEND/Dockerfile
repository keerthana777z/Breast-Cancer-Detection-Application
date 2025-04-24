FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .

# Install wget, curl, and gdown (for Google Drive downloads)
RUN apt-get update && \
    apt-get install -y wget curl && \
    pip install gdown

# Download the model using gdown
RUN gdown https://drive.google.com/uc?id=1vuuDocQ6HaxRAuXo1s_ZdjQenPMHFbgl -O my_model3.h5

# Cleanup
RUN apt-get remove -y wget && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 5003

CMD ["python", "app.py"]




