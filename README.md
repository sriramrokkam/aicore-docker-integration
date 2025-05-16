# aicore_test
AI Core - Docker

---

## Dockerfile

This project includes a Dockerfile for building a Python 3.12 environment with all dependencies required for running large NLP/ML libraries (such as `bertopic`) in SAP AI Core or similar platforms.

### Key Features
- Uses official Python 3.12 base image
- Installs dependencies from `requirements.txt`
- Copies your main application code to `/app/src/`
- Sets open permissions for `/app` (for containerized execution)

### Build Instructions

1. Place your `main.py` and `requirements.txt` in the project root or update the COPY paths as needed.
2. Build the Docker image:
   ```sh
   docker build -t your-dockerhub-username/aicore:bertopic -f docker/Dockerfile ..
   ```
   (Adjust the path if building from the `docker/` directory.)

3. Push to Docker Hub:
   ```sh
   docker push your-dockerhub-username/aicore:bertopic
   ```

### Usage

- This image is designed to be used in SAP AI Core pipelines or any workflow that requires a reproducible Python environment with heavy dependencies.
- The default command should be set in your pipeline YAML or when running the container, e.g.:
  ```sh
  docker run --rm -it your-dockerhub-username/aicore:bertopic python /app/src/main.py
  ```

### Notes
- Ensure your Docker and cloud quotas are sufficient for large libraries (e.g., `bertopic` can be >6GB).
- For custom workflows, modify `main.py` and update the Dockerfile as needed.

---

## File Descriptions

### 1. `src/main.py`
This is the main Python script executed inside the Docker container. It demonstrates the use of large libraries (like `bertopic` and `pandas`) and prints confirmation logs. You can extend this script to include your own data processing or machine learning logic.

### 2. `requirements.txt`
Lists all Python dependencies required for your project. The key entry is `bertopic`, a large NLP topic modeling library, and `scikit-learn`, a common ML dependency. This file is used by Docker to install all necessary packages.

### 3. `docker/Dockerfile`
Defines the container image for your project:
- Uses Python 3.12 as the base image.
- Copies your code and requirements into the image.
- Installs dependencies from `requirements.txt`.
- Sets permissions for the `/app` directory.
This image is used both locally and in SAP AI Core pipelines.

### 4. `pipeline/aicore-pipeline.yaml`
An Argo WorkflowTemplate for SAP AI Core. It:
- Pulls your custom Docker image (with all dependencies pre-installed).
- Runs `python /app/src/main.py` inside the container.
- Is designed for scalable, reproducible execution in SAP AI Core.

### 5. `README.md`
Provides an overview, setup instructions, and usage notes for the project. It explains the folder structure, how to build and push the Docker image, and how to use the pipeline in SAP AI Core.

### 6. `.gitignore`
Specifies files and folders to be ignored by git (e.g., Python cache files, environment files, OS-specific files).

### 7. `LICENSE`
The open source license for your project (MIT by default). Allows others to use, modify, and distribute your code.

---

## Folder Structure

- `src/` — Source code (main Python scripts)
- `docker/` — Dockerfile and related documentation
- `pipeline/` — Pipeline YAML and workflow definitions
- Project root — README, requirements, license, and ignore files

---

## Usage Notes
- Update the Docker image name in the pipeline YAML before deploying.
- Extend `src/main.py` for your own ML/data processing tasks.
- For new dependencies, add them to `requirements.txt` and rebuild the Docker image.

---

## Further Details

For comprehensive, step-by-step instructions (including screenshots and advanced configuration), please refer to the attached PDF:

- `SAP_AI_Core Docker Integration.pdf`

This document provides in-depth guidance on setup, deployment, and troubleshooting for this project.
