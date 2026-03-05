# Flask CI/CD Dual Environment Deployment

A complete CI/CD pipeline demonstrating automated Docker containerization and multi-environment deployment to AWS using GitHub Actions.

## Overview

This project showcases:

- Flask web application containerized with Docker
- Infrastructure as Code using Terraform
- Automated CI/CD pipeline with GitHub Actions
- Multi-environment deployment (DEV/PROD)
- AWS services integration (VPC, EC2, ECR, IAM)

## Architecture

![Screenshot](/docs/initial_setup.png)
![Screenshot](/docs/CICD_pipeline.png)
![Screenshot](/docs/flask_cicd_terraform_infra.png)

## Prerequisites before installation

AWS Account with appropriate permissions

- Terraform installed
- Docker installed locally
- GitHub account
- AWS CLI configured

## Deployment

### 1. Clone the Repository

```bash
git clone https://github.com/YOUR_USERNAME/flask-cicd-dual-env-deploy.git
cd flask-cicd-dual-env-deploy
```

### 2. Set Up Local Environment

```bash
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

### 3. Test Locally

```bash
# Run Flask app
ENVIRONMENT=LOCAL python app.py

# Build Docker image
docker build -t flask-app .

# Run container
docker run -p 5000:5000 -e ENVIRONMENT=LOCAL flask-app
```

Visit `http://localhost:5000`

### 4. Deploy Infrastructure

```bash
cd terraform

# Initialize Terraform
terraform init

# Set your IP as environment variable
export TF_VAR_my_ip_address=$(curl -s ifconfig.me)

# Review planned changes
terraform plan

# Apply infrastructure
terraform apply
```

Save the outputs:

- `dev_public_ip`
- `prod_public_ip`
- `ecr_repository_url`

### 5. Configure EC2 Instances

SSH into both EC2 instances and install dependencies:

```bash
# Connect to DEV
ssh -i ~/.ssh/your-key.pem ubuntu@<dev_public_ip>

# Install Docker and AWS CLI
sudo apt-get update
sudo apt-get install -y docker.io awscli
sudo usermod -aG docker ubuntu

# Log out and back in for docker group to take effect
exit

# Repeat for PROD instance
```

### 6. Set Up GitHub Secrets

In your GitHub repository, go to Settings → Secrets and variables → Actions

Add these secrets:

- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`
- `DEV_EC2_IP`
- `PROD_EC2_IP`
- `EC2_SSH_PRIVATE_KEY` (contents of your .pem file)

### 7. Trigger Deployment

```bash
git add .
git commit -m "Initial deployment"
git push origin main
```

Watch the deployment in the Actions tab!

### 8. Access Your Application

```
DEV:  http://<dev_public_ip>:5000
PROD: http://<prod_public_ip>:5000
```

## Project Structure

```
flask-cicd-dual-env-deploy/
├── app.py                    # Flask application
├── Dockerfile                # Container configuration
├── requirements.txt          # Python dependencies
├── templates/                # HTML templates
│   └── index.html
├── static/                   # CSS and JS files
│   ├── style.css
│   └── script.js
├── .github/
│   └── workflows/
│       └── deploy.yml        # CI/CD pipeline
└── terraform/                # Infrastructure as Code
    ├── main.tf
    ├── variables.tf
    ├── outputs.tf
    ├── iam.tf
    ├── security.tf
    └── ecr.tf
```

## CI/CD Pipeline

The pipeline automatically:

1. Builds Docker image
2. Runs health check tests
3. Pushes to Amazon ECR
4. Deploys to DEV environment
5. Deploys to PROD environment

## Cleanup

To destroy all resources:

```bash
cd terraform
terraform destroy
```

## License

This project is open source and available under the MIT License.

## Author

Devron:

- LinkedIn: [linkedin.com/in/devrontombacco](https://www.linkedin.com/in/devrontombacco/)
- Github: [github.com/devrontombacco](https://github.com/devrontombacco)
