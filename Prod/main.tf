
provider "aws" {
  region = "us-west-1"
}

resource "aws_vpc" "prod_vpc" {
  cidr_block = var.prod_vpc_cidr
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "prod-vpc"
  }
}

resource "aws_subnet" "prod_subnet" {
  vpc_id            = aws_vpc.prod_vpc.id
  cidr_block        = var.prod_subnet_cidr
  map_public_ip_on_launch = true
  availability_zone = "us-west-1a"
  tags = {
    Name = "prod-subnet"
  }
}

resource "aws_key_pair" "prod_key" {
  key_name   = "prod-key"
  public_key = file(var.prod_public_key_path)
}

resource "aws_instance" "prod_instance" {
  ami           = var.ami_id
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.prod_subnet.id
  key_name      = aws_key_pair.prod_key.key_name
  tags = {
    Name = "ProdInstance"
  }
}
