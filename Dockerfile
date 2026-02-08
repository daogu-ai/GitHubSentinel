# Dockerfile

# Use official Python 3.12 base image
FROM python:3.12-slim

# Set working directory
WORKDIR /app

# Copy requirements.txt and install dependencies
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy all project files to container
COPY . .

# Copy and execute validate_tests.sh script
COPY validate_tests.sh .
RUN chmod +x validate_tests.sh
RUN ./validate_tests.sh

# Set container entry point
CMD ["python", "src/daemon_process.py"]
