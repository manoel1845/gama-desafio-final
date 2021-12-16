resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr_block
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  tags = {
    Name = "vpc-${var.project_name}"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "main"
  }
}

resource "aws_subnet" "subnetpriv-az-a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.10.0.0/24"
  availability_zone = "${var.region}a"
  tags = {
    Name = "subnetpriv-az-a-${var.project_name}"
  }
}

resource "aws_subnet" "subnetpriv-az-b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.10.1.0/24"
  availability_zone = "${var.region}b"
  tags = {
    Name = "subnetpriv-az-b-${var.project_name}"
  }
}

resource "aws_subnet" "subnetpriv-az-c" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.10.2.0/24"
  availability_zone = "${var.region}c"
  tags = {
    Name = "subnetpriv-az-c-${var.project_name}"
  }
}

resource "aws_subnet" "subnetpub-az-a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.10.10.0/24"
  availability_zone = "${var.region}a"
  tags = {
    Name = "subnetpub-az-a-${var.project_name}"
  }
}

resource "aws_subnet" "subnetpub-az-b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.10.11.0/24"
  availability_zone = "${var.region}b"
  tags = {
    Name = "subnetpub-az-b-${var.project_name}"
  }
}

resource "aws_subnet" "subnetpub-az-c" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.10.12.0/24"
  availability_zone = "${var.region}c"
  tags = {
    Name = "subnetpub-az-c-${var.project_name}"
  }
}


resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "route-table-${var.project_name}"
  }
}

resource "aws_route_table_association" "route_table-association-a" {
  subnet_id      = aws_subnet.subnetpub-az-a.id
  route_table_id = aws_route_table.route_table.id
}

resource "aws_route_table_association" "route_table-association-b" {
  subnet_id      = aws_subnet.subnetpub-az-b.id
  route_table_id = aws_route_table.route_table.id
}

resource "aws_route_table_association" "route_table-association-c" {
  subnet_id      = aws_subnet.subnetpub-az-c.id
  route_table_id = aws_route_table.route_table.id
}