resource "aws_vpc" "my_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "public_subnet" {
  count                  = length(var.public_subnets)
  vpc_id                 = aws_vpc.my_vpc.id
  cidr_block             = var.public_subnets[count.index]
  availability_zone      = var.vpc_azs[count.index]
  map_public_ip_on_launch = true
}

resource "aws_subnet" "private_subnet" {
  count                  = length(var.private_subnets)
  vpc_id                 = aws_vpc.my_vpc.id
  cidr_block             = var.private_subnets[count.index]
  availability_zone      = var.vpc_azs[count.index]
  map_public_ip_on_launch = true
}
resource "aws_security_group" "my_security_group" {
  vpc_id = aws_vpc.my_vpc.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
