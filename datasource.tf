data "aws_availability_zones" "all" {}

output "AZ" {
  value = data.aws_availability_zones.all.names[0]
}



resource "aws_key_pair" "wordpress" {
  key_name   = "wordpress"
  public_key = file("~/.ssh/id_rsa.pub")
  tags = {
      Name = "DevOps"
  }
}

