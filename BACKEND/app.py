import os
import numpy as np
import tensorflow as tf
from flask import Flask, request, jsonify
from flask_cors import CORS
from PIL import Image

app = Flask(__name__)
# Enable CORS for all domains
CORS(app, resources={r"/*": {"origins": "*"}})

MODEL_PATH = os.environ.get("MODEL_PATH", "my_model3.h5")

# Load the model
try:
    # Print current working directory for debugging
    print(f"Current working directory: {os.getcwd()}")
    print(f"Checking if model file exists: {os.path.exists(MODEL_PATH)}")

    # Absolute path for model
    abs_model_path = os.path.abspath(MODEL_PATH)
    print(f"Attempting to load model from: {abs_model_path}")

    model = tf.keras.models.load_model(abs_model_path, compile=False)
    print(f"✅ Model loaded successfully from {abs_model_path}")
except Exception as e:
    print(f"❌ ERROR: Failed to load the model from {MODEL_PATH}!", str(e))
    model = None

def preprocess_image(image_file):
    img = Image.open(image_file).convert('RGB')
    img = img.resize((512, 512))
    img_array = np.array(img) / 255.0
    img_array = np.expand_dims(img_array, axis=0)
    return img_array

@app.route('/', methods=['GET'])
def home():
    return jsonify({"status": "Breast Cancer Detection API is running"}), 200

@app.route('/predict', methods=['POST'])
def predict():
    try:
        if 'image' not in request.files:
            return jsonify({"error": "No image uploaded"}), 400

        file = request.files['image']
        if file.filename == '':
            return jsonify({"error": "No selected image"}), 400

        image_array = preprocess_image(file)

        if model is None:
            # Provide a mock prediction when the model is not available
            import random
            # For demo purposes, randomly return "Cancerous" or "Non-Cancerous"
            mock_result = "Non-Cancerous" if random.random() < 0.7 else "Cancerous"
            return jsonify({
                "prediction": mock_result,
                "note": "This is a mock prediction as the model file is not available. In a production environment, you would need to provide the actual model file."
            })

        prediction = model.predict(image_array)
        result = "Cancerous" if prediction[0][0] >= 0.5 else "Non-Cancerous"

        return jsonify({"prediction": result})

    except Exception as e:
        return jsonify({"error": str(e)}), 500

if __name__ == '__main__':
    import os

    port = int(os.environ.get("PORT", 5003))
    app.run(host="0.0.0.0", port=port)

