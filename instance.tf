provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "one" {
  tags = {
    Name        = "hari"
    Environment = "dev"
  }
  ami           = "ami-07761f3ae34c4478d"
  instance_type = "t2.micro"
}

provider "aws" {
  region = "ap-south-1"
  alias  = "mumbai"
}
resource "aws_instance" "two" {
  provider = "aws.mumbai"
  tags = {
    Name        = "kamarthi"
    Environment = "dev"
  }
  ami           = "ami-0187337106779cdf8"
  instance_type = "t2.micro"
}
