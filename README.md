# Flask CI/CD Dual Environment Deployment

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


 -->
