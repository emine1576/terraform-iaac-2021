resource "aws_key_pair" "wordpress" {
  key_name   = "wordpress"
  public_key = file("~/.ssh/id_rsa.pub")
  tags = {
      Name = "DevOps"
  }
}

