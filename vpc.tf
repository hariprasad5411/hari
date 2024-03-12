provider "aws" {
  region = "us-east-1"
}
resource "aws_vpc" "one" {
  tags = {
    Name = "new-vpc"
  }
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
}
resource "aws_subnet" "two" {
  vpc_id = aws_vpc.one.id
  tags = {
    Name = "new-subnet"
  }
  availability_zone = "us-east-1a"
  cidr_block        = "10.0.0.0/16"
}
resource "aws_internet_gateway" "three" {
  vpc_id = aws_vpc.one.id
  tags = {
    Name = "new-internet-gateway"
  }
}

resource "aws_route_table" "four" {
  vpc_id = aws_vpc.one.id
  tags = {
    Name = "new-routetable"
  }
  route {
    cidr_block = "0.0.0.0/0"

    gateway_id = aws_internet_gateway.three.id
  }
}
resource "aws_security_group" "six"{
vpc_id= aws_vpc.one.id
}

resource "aws_instance" "five" {
  tags = {
    Name = "terraform"
  }
  ami           = "ami-0f403e3180720dd7e"
  instance_type = "t2.micro"
  key_name = "hari"
  availability_zone= "us-east-1a"
  root_block_device{
 
    volume_size = 25
}
}
