provider "aws" {
  region  = "us-east-1"
}
resource "aws_instance" "instance1" {
  ami           = "ami-04cb4ca688797756f"
  instance_type = "t2.micro"
  key_name  = "Java-project"
  aws_security_group =["Project-SG"]

  tags = {
    Name = "Instance_project"
  }
}

resource "aws_security_group" "Project-SG" {
  name        = "Project-SG"
  description = "SSH_Access"
 // vpc_id      = aws_vpc.main.id   until now without VPC

  ingress {
    description      = "ssh"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "SSH-prot"
  }
}