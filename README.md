# Flask CI/CD Dual Environment Deployment

A simple CI/CD pipeline from flask application to deployment on 2 environments, Prod and Dev.

<!-- STEPS
Phase 1: Flask app running locally
- write your app.py
- create venv
- use pip to freeze requirements.txt, so that Docker can use them later

Phase 2: Write Dockerfile + test locally in Docker
- write dockerfile

- Run Docker commands:
- docker build -t flask-cicd-dual-env-deploy .
- docker run -p 5000:5000 -e ENVIRONMENT=DEV flask-cicd-dual-env-deploy

Phase 3: AWS Infrastructure (Terraform)


Phase 4: GitHub Actions CI/CD


Phase 5: Full end-to-end test


PIPELINE
git push
    ↓
Checkout code
    ↓
Configure AWS credentials
    ↓
Login to ECR
    ↓
Build Docker image
    ↓
Run tests
    ↓
Push to ECR
    ↓
Deploy to DEV ──────────────────┐
    ↓                           ↓
Deploy to PROD            ubuntu@DEV_IP
    ↓                     pull latest
Done!                     run flask-dev
                          ENVIRONMENT=DEV

 -->
