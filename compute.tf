 #Creating the security group
 resource "aws_security_group" "http-sg" {
  name        = "allow_http_access"
  description = "allow inbound http traffic"
  vpc_id      = aws_vpc.VPC1.id

  ingress {
    description = "Anyone can access by port 80"
    from_port   = "80"
    to_port     = "80"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  #No data can egress
  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    to_port     = "0"
  }
  tags = {
    "Name" = "SG-access"
  }
}

#Selecting Linux based Amazon's AMI
data "aws_ami" "amazon_ami" {
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.0.20220606.1-x86_64-gp2"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  most_recent = true
  owners      = ["amazon"]
}

#Creating the first VM
resource "aws_instance" "VM1_AZ1" {
  instance_type          = "t2.micro"
  ami                    = data.aws_ami.amazon_ami.id
  vpc_security_group_ids = [aws_security_group.http-sg.id]
  subnet_id              = aws_subnet.SUBNET_AZ1.id
  associate_public_ip_address = true
  user_data = file("user_data/user_data.tpl")
    tags = {
      Name = "VM1_AZ1"
    }
}

#Creating the second VM
resource "aws_instance" "VM2_AZ2" {
  instance_type          = "t2.micro"
  ami                    = data.aws_ami.amazon_ami.id
  vpc_security_group_ids = [aws_security_group.http-sg.id]
  subnet_id              = aws_subnet.SUBNET_AZ2.id
  associate_public_ip_address = true
  user_data = file("user_data/user_data.tpl")
      tags = {
      Name = "VM2_AZ2"
    }
}