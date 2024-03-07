provider "aws" {
  region = "us-east-1"
}
resource "aws_iam_user" "flm" {
  count = length(var.abc)
  name  = var.abc[count.index]
}
variable "abc" {
  type    = list(string)
  default = ["aws", "azure", "gcp"]
}
