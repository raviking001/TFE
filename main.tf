provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "Jadoogar" {
  ami           = "ami-08f63db601b82ff5f"
  instance_type = "t2.micro"
  tags = {
    Name = "JadooBhai"
  }
  monitoring             = true
  vpc_security_group_ids = [aws_security_group.sg.id]
  key_name               = "Jadoo-KeyPair"


}


resource "aws_security_group" "sg" {
  name = "Jadoo-EC2-sg"
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "SG for allowing web traffic"
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "SG for allowing ssh traffic"
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
  }
}

//output "ipaddress" {
//  value = aws_instance.Jadoogar.name
//}

output "sg" {
  value = aws_security_group.sg.name
}

// Add Security Group