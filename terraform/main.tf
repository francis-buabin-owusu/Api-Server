provider "aws" {
  region = "eu-west-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0cc4e06e6e710cd94"
  instance_type = "t2.micro"
  key_name      = "playground"

  tags = {
    Name = "userdata-instance"
  }

  connection {
    host        = aws_instance.example.public_ip
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("/home/cyril/.ssh/playground.pem")
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y docker.io nodejs git",
      "sudo chmod 777 /var/run/docker.sock",
      "git config --global user.name \"${local.git_username}\"",
      "git config --global user.email \"<email>\"",
      "echo \"https://${local.git_username}:${local.git_password}@github.com\" > ~/.git-credentials",
      "sudo git clone https://github.com/CyrilBaah/Api-Server.git",
      "cd Api-Server",
      "docker build -t api-server .",
      "docker run -p 3000:3000 api-server &"
    ]
  }
}

resource "aws_security_group" "instance" {
  name        = "instance"
  description = "Allow SSH and HTTP traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

locals {
  git_username = var.git_username
  git_password = var.git_password
}

output "instance_public_ip" {
  value = aws_instance.example.public_ip
}

variable "git_username" {
  type = string
}

variable "git_password" {
  type = string
}
