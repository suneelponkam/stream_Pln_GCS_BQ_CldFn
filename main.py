from flask import Flask, request, render_template
from google.cloud import storage
import os

app = Flask(__name__)

# Set this environment variable OR set manually:
# os.environ["GOOGLE_APPLICATION_CREDENTIALS"] = "path/to/your-service-account.json"

BUCKET_NAME = 'cap_bukt'

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/upload', methods=['POST'])
def upload_file():
    if 'file' not in request.files:
        return 'No file uploaded', 400

    file = request.files['file']
    if file.filename == '':
        return 'No selected file', 400

    client = storage.Client()
    bucket = client.bucket(BUCKET_NAME)
    blob = bucket.blob(file.filename)
    blob.upload_from_file(file)

    return f'File "{file.filename}" uploaded successfully to GCS!'

if __name__ == '__main__':
    app.run(debug=True)
