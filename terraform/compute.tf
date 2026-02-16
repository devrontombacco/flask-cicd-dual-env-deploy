data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}


resource "aws_instance" "ec2_prod" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.public_subnet.id
  provider                    = aws.ireland
  key_name                    = "my_aws_key"
  associate_public_ip_address = true
  #vpc_security_group_ids     = [aws_security_group. ]
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name

  tags = {
    Name = "ec2_prod"
  }
}

resource "aws_instance" "ec2_dev" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.public_subnet.id
  key_name                    = "my_aws_key"
  associate_public_ip_address = true
  #vpc_security_group_ids     = [aws_security_group. ]
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name

  tags = {
    Name = "ec2_dev"
  }
}
