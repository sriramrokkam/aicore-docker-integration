# Dockerfile

# Builds a Python 3.12 environment for running large ML/NLP libraries (e.g., bertopic) in SAP AI Core or similar platforms.
#
# - Installs dependencies from requirements.txt
# - Copies your main application code to /app/src/
# - Sets open permissions for /app (for containerized execution)
#
# Usage:
#   docker build -t your-dockerhub-username/aicore:bertopic -f docker/Dockerfile ..
#   docker push your-dockerhub-username/aicore:bertopic
#   docker run --rm -it your-dockerhub-username/aicore:bertopic python /app/src/main.py

# Specify which base layers (default dependencies) to use
# You may find more base layers at https://hub.docker.com/
FROM python:3.12
#
# Creates directory within your Docker image
RUN mkdir -p /app/src/
#
# Copies file from your Local system TO path in Docker image
COPY main.py /app/src/
COPY requirements.txt /app/src/
#
# Installs dependencies within you Docker image
RUN pip3 install -r /app/src/requirements.txt
#
# Enable permission to execute anything inside the folder app
RUN chgrp -R 65534 /app && \
    chmod -R 777 /app

