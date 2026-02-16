resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = aws_vpc.vpc_main.id
  provider                = aws.ireland
  cidr_block              = "10.5.0.0/24"
  availability_zone       = "eu-west-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "public_subnet_1"
  }
}
