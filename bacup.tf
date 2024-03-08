terraform {
  backend "s3" {
    bucket = "jocker.net"
    key    = "statefiles/terraform.tfstate"
    region = "us-east-1"
  }
}

