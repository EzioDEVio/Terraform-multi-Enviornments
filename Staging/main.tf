provider "aws" {
  region = "us-west-1"
}

resource "aws_vpc" "staging_vpc" {
  cidr_block = var.staging_vpc_cidr
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "staging-vpc"
  }
}

resource "aws_subnet" "staging_subnet" {
  vpc_id            = aws_vpc.staging_vpc.id
  cidr_block        = var.staging_subnet_cidr
  map_public_ip_on_launch = true
  availability_zone = "us-west-1a"
  tags = {
    Name = "staging-subnet"
  }
}

resource "aws_key_pair" "staging_key" {
  key_name   = "dev-key"
  public_key = file(var.staging_public_key_path)
}

resource "aws_instance" "staging_instance" {
  ami           = var.ami_id
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.staging_subnet.id
  key_name      = aws_key_pair.staging_key.key_name
  tags = {
    Name = "stagingInstance"
  }
}
