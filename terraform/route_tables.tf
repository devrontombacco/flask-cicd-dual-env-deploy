resource "aws_route_table" "rt_main" {
  vpc_id = aws_vpc.vpc_main.id

  # Route to internet
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_main.id
  }

  tags = {
    Name = "rt_main"
  }
}

resource "aws_route_table_association" "vpc_main_subnet_assoc" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.rt_main.id
}
