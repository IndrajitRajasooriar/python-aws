resource "aws_vpc" "main_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    project     = "python-aws"
    environment = "dev"

  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    project     = "python-aws"
    environment = "dev"
  }
}

resource "aws_internet_gateway" "internet_gateway_main" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    project     = "python-aws"
    environment = "dev"
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway_main.id
  }


  tags = {
    project     = "python-aws"
    environment = "dev"
  }
}

resource "aws_route_table_association" "route_table_association_main" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}   