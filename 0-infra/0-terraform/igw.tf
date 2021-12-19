resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "main"
  }
}

resource "aws_route_table" "route_table_igw" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "routetable_igw_${var.project_name}"
  }
}

resource "aws_route_table_association" "route_table_igw_association_a" {
  subnet_id      = aws_subnet.subnetpub_az_a.id
  route_table_id = aws_route_table.route_table_igw.id
}

resource "aws_route_table_association" "route_table_igw_association_b" {
  subnet_id      = aws_subnet.subnetpub_az_b.id
  route_table_id = aws_route_table.route_table_igw.id
}

resource "aws_route_table_association" "route_table_igw_association_c" {
  subnet_id      = aws_subnet.subnetpub_az_c.id
  route_table_id = aws_route_table.route_table_igw.id
}