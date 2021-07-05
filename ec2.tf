resource "aws_instance" "web" {
  ami                         = "ami-ae6272b8"
  instance_type               = "t3.micro"
  count                       = 1
  associate_public_ip_address = true
  monitoring                  = true
  key_name                    = aws_key_pair.wordpress.key_name
  user_data                   = file("user_data.sh")
  tags = {
    Name      = "Wordpress"
    Environment = "Dev"
    Team      = "DevOps"


  }
  }
  resource "aws_route53_record" "wordpress" {
  zone_id = "Z0357744NT0HQR6KQC8F"
  name    = "wordpress.melissayavuz.com"
  type    = "A"
  ttl     = "300"
  records = [aws_instance.web[0].public_ip]
}

resource "aws_security_group" "wordpress" {
  name        = "wordpress"
  description = "Allow sec inbound traffic"
  

  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]

  }

ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]

}

  ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]

  }


  
    
}
  
 


output "SomeOutput" {
  value = <<EOF

        Machine has the following IP address   ${"aws_instance.web[0].public_ip"}
        Machine has the following ID           ${"aws_instance.web[0].id"}
        Machine is in                          ${"aws_instance.web[0].availability_zone"}
        Machine uses following key pair        ${"aws_key_pair.wordpress.key_name"}
        machine has following DNS              ${"ec2-3-85-166-99.compute-1.amazonaws.com"}



EOF

}



