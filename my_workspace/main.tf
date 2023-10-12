provider "aws" {
  region = "us-east-1"
}

module "ec2_instance" {
  source = "./modules/ec2_instance"
  ami_value = "put-an-ami-value-here"
  instance_type_value = "t2.micro"
  user_data = <<-EOF
  #!/bin/bash
  sudo yum update -y
  sudo wget -O /etc/yum.repos.d/jenkins.repo \
  https://pkg.jenkins.io/redhat-stable/jenkins.repo
  sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
  sudo yum upgrade -y
  sudo dnf install java-17-amazon-corretto -y
  sudo yum install jenkins -y
  sudo systemctl enable jenkins
  sudo systemctl start jenkins
  sudo systemctl status jenkins
  EOF
}

resource "aws_security_group" "jenkins_sg" {
  name = "jenkins_terraform_sg"
  description = "Allow ssh and http traffic"
  vpc_id = "vpc-0836b7ea9e983cd74"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
 
  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_s3_bucket" "tf-backend-2023" {
  bucket = "your-bucket-name"
}