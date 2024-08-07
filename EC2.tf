provider "aws" {
  region = "us-west-1"
}

resource "aws_instance" "ec2Instance" {
  ami             = "ami-0ff591da048329e00"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.mysecurity_grp.name]
  tags = {
    "Name" = "My_EC2_Instance"
  }
}

resource "aws_security_group" "mysecurity_grp" {
  name        = "Security Group Using Terraform"
  description = "SecGrpTerraform"
  vpc_id      = "vpc-0fc512cdbe2389fe7"

  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "HTTPs"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "mysecurity_grp"
  }
}