
provider "aws" {
  region = "us-west-1"
}

resource "aws_vpc" "dev_vpc" {
  cidr_block = var.dev_vpc_cidr
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "dev-vpc"
  }
}

resource "aws_subnet" "dev_subnet" {
  vpc_id            = aws_vpc.dev_vpc.id
  cidr_block        = var.dev_subnet_cidr
  map_public_ip_on_launch = true
  availability_zone = "us-west-1a"
  tags = {
    Name = "dev-subnet"
  }
}

resource "aws_key_pair" "dev_key" {
  key_name   = "dev-key"
  public_key = file(var.dev_public_key_path)
}

resource "aws_instance" "dev_instance" {
  ami           = var.ami_id
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.dev_subnet.id
  key_name      = aws_key_pair.dev_key.key_name
  tags = {
    Name = "DevInstance"
  }
}
