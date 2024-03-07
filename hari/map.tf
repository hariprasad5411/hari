provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "one" {
  ami           = "ami-07761f3ae34c4478d"
  instance_type = "t2.micro"
  tags          = var.itags
}
variable "itags" {
  type = map(string)
  default = {
    Name        = "instance_name"
    Project     = "flm"
    Environment = "dev"
  }
}
output "two" {
  value = [aws_instance.one.public_ip, aws_instance.one.private_ip, aws_instance.one.public_dns]
}
