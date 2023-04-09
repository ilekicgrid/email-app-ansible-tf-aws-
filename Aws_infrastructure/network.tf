# Create a VPC
resource "aws_vpc" "email_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "email_vpc"
  }
}

# Create an Internet Gateway
resource "aws_internet_gateway" "email_vpc_igw" {
  vpc_id = aws_vpc.email_vpc.id
}

# Create two subnets in different availability zones
resource "aws_subnet" "web_server_subnet" {
  vpc_id = aws_vpc.email_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "eu-central-1a"
}

resource "aws_subnet" "web_client_subnet" {
  vpc_id = aws_vpc.email_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "eu-central-1b"
}

# Associate the subnets with the Internet Gateway
resource "aws_route_table" "email_vpc_rt" {
  vpc_id = aws_vpc.email_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.email_vpc_igw.id
  }

  # Associate the web_server_subnet with the Internet Gateway
  }
resource "aws_route_table_association" "web_server_rta" {
    subnet_id = aws_subnet.web_server_subnet.id
    route_table_id = aws_route_table.email_vpc_rt.id
  }

  # Associate the web_client_subnet with the Internet Gateway
  resource "aws_route_table_association" "web_client_rta" {
    subnet_id = aws_subnet.web_client_subnet.id
    route_table_id = aws_route_table.email_vpc_rt.id
  }

