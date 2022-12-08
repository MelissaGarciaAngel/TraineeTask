#Creating the VPC
resource "aws_vpc" "VPC1" {
  cidr_block = "10.20.20.0/26"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    "Name" = "VPC-1"
  }
}

#Creating the first subnet
resource "aws_subnet" "SUBNET_AZ1" {
  vpc_id            = aws_vpc.VPC1.id
  cidr_block        = "10.20.20.0/28"
  availability_zone = "us-east-1a"
  tags = {
    "Name" = "SUBNET_AZ1"
  }
}

#Creating the second subnet
resource "aws_subnet" "SUBNET_AZ2" {
  vpc_id            = aws_vpc.VPC1.id
  cidr_block        = "10.20.20.16/28"
  availability_zone = "us-east-1b"
  tags = {
    "Name" = "SUBNET_AZ2"
  }
}

#Creating the route_table
resource "aws_route_table" "VPC1-rt" {
  vpc_id = aws_vpc.VPC1.id
  tags = {
    "Name" = "route-table"
  }
}

#Associating the previous subnets with the route table
resource "aws_route_table_association" "SUBNET_AZ1" {
  subnet_id      = aws_subnet.SUBNET_AZ1.id
  route_table_id = aws_route_table.VPC1-rt.id
}
resource "aws_route_table_association" "SUBNET_AZ2" {
  subnet_id      = aws_subnet.SUBNET_AZ2.id
  route_table_id = aws_route_table.VPC1-rt.id
}

#Creating the internet gateway
resource "aws_internet_gateway" "VPC1-igw" {
  vpc_id = aws_vpc.VPC1.id
  tags = {
    "Name" = "internet_gateway"
  }
}

#Giving access to all the internet
resource "aws_route" "internet-route" {
  destination_cidr_block = "0.0.0.0/0"
  route_table_id         = aws_route_table.VPC1-rt.id
  gateway_id             = aws_internet_gateway.VPC1-igw.id
}