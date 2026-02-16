output "dev_public_ip" {
  value = aws_instance.dev.public_ip
}

output "prod_public_ip" {
  value = aws_instance.prod.public_ip
}

output "ecr_repository_url" {
  value = aws_ecr_repository.app.repository_url
}
