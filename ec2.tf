resource "aws_instance" "web" {
  ami           = "ami-0277b52859bac6f4b"
  instance_type = "t3.micro"
  key_name = aws_key_pair.mykey.key_name
  monitoring = "true"

  tags = {
    Name = "HelloWorld"
  }
}