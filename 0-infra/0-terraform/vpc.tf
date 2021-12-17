resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr_block
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  tags = {
    Name = "vpc_${var.project_name}"
  }
}

resource "aws_subnet" "subnetpriv_az_a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.10.0.0/24"
  availability_zone = "${var.region}a"
  tags = {
    Name = "subnetpriv_az_a_${var.project_name}"
  }
}

resource "aws_subnet" "subnetpriv_az_b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.10.1.0/24"
  availability_zone = "${var.region}b"
  tags = {
    Name = "subnetpriv_az_b_${var.project_name}"
  }
}

resource "aws_subnet" "subnetpriv_az_c" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.10.2.0/24"
  availability_zone = "${var.region}c"
  tags = {
    Name = "subnetpriv_az_c_${var.project_name}"
  }
}

resource "aws_subnet" "subnetpub_az_a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.10.10.0/24"
  availability_zone = "${var.region}a"
  tags = {
    Name = "subnetpub_az_a_${var.project_name}"
  }
}

resource "aws_subnet" "subnetpub_az_b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.10.11.0/24"
  availability_zone = "${var.region}b"
  tags = {
    Name = "subnetpub_az_b_${var.project_name}"
  }
}

resource "aws_subnet" "subnetpub_az_c" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.10.12.0/24"
  availability_zone = "${var.region}c"
  tags = {
    Name = "subnetpub_az_c_${var.project_name}"
  }
}