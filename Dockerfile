# Use a slim Python 3.9 image for a smaller footprint
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Copy only the requirements file first to leverage caching
COPY requirements.txt .

# Install dependencies efficiently
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY app.py .

# Expose port 5000 (matches your app.py)
EXPOSE 5000

# Start the Flask application
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]