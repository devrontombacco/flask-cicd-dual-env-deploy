resource "aws_internet_gateway" "igw_main" {
  provider = aws.ireland
  vpc_id   = aws_vpc.vpc_main.id

  tags = {
    Name = "igw_main"
  }
}
