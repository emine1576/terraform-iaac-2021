resource "aws_key_pair" "practice" {
  key_name   = "practice"
  public_key = file("~/.ssh/id_rsa.pub")
}