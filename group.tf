provider "aws" {
  region = "ap-south-1"
}
resource "aws_instance" "two" {
  tags = {
    Name        = "kamarthi"
    Environment = "dev"
  }
  ami                    = "ami-0187337106779cdf8"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.three.id]
}
