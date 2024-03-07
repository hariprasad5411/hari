provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "one" {
  ami           = "ami-07761f3ae34c4478d"
  instance_type = "t2.micro"

  tags = {
    Name        = "${terraform.workspace}-instance"
    Environment = "${terraform.workspace}"
  }
}
