output "dev_public_ip" {
  description = "Public IP of the DEV EC2 instance"
  value       = aws_instance.dev.public_ip
}

output "prod_public_ip" {
  description = "Public IP of the PROD EC2 instance"
  value       = aws_instance.prod.public_ip
}

output "ecr_repository_url" {
  description = "ECR repository URL for Docker image pushes"
  value       = aws_ecr_repository.app.repository_url
}
