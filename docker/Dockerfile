# Dockerfile for AI Core Docker Integration
# Specify which base layers (default dependencies) to use
FROM python:3.12

# Creates directory within your Docker image
RUN mkdir -p /app/src/

# Copies file from your Local system TO path in Docker image
COPY src/main.py /app/src/
COPY requirements.txt /app/src/

# Installs dependencies within you Docker image
RUN pip3 install -r /app/src/requirements.txt

# Enable permission to execute anything inside the folder app
RUN chgrp -R 65534 /app && \
    chmod -R 777 /app
