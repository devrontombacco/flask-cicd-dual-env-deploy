resource "aws_vpc" "vpc_main" {
  cidr_block = "10.5.0.0/16"

  tags = {
    Name = "vpc_main"
  }
}
