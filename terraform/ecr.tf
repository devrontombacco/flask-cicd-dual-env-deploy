resource "aws_ecr_repository" "app" {
  name                 = "flask-cicd-dual-env-deploy"
  image_tag_mutability = "MUTABLE"
  force_delete         = true

  image_scanning_configuration {
    scan_on_push = true
  }
  tags = {
    Name = "app"
  }
}
