resource "aws_eip" "nat_gateway_a" {
  vpc = true
}
resource "aws_eip" "nat_gateway_b" {
  vpc = true
}
resource "aws_eip" "nat_gateway_c" {
  vpc = true
}

resource "aws_nat_gateway" "natgw_subnet_a" {
  allocation_id = aws_eip.nat_gateway_a.id
  subnet_id     = aws_subnet.subnetpub_az_a.id
  tags = {
    Name = "ngw_${var.project_name}"
  }
}
resource "aws_nat_gateway" "natgw_subnet_b" {
  allocation_id = aws_eip.nat_gateway_b.id
  subnet_id     = aws_subnet.subnetpub_az_b.id
  tags = {
    Name = "ngw_${var.project_name}"
  }
}
resource "aws_nat_gateway" "natgw_subnet_c" {
  allocation_id = aws_eip.nat_gateway_c.id
  subnet_id     = aws_subnet.subnetpub_az_c.id
  tags = {
    Name = "ngw_${var.project_name}"
  }
}

resource "aws_route_table" "route_table_nat_a" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.natgw_subnet_a.id
  }

  tags = {
    Name = "routetable_nat_a_${var.project_name}"
  }
}

resource "aws_route_table" "route_table_nat_b" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.natgw_subnet_b.id
  }

  tags = {
    Name = "routetable_nat_b_${var.project_name}"
  }
}

resource "aws_route_table" "route_table_nat_c" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.natgw_subnet_c.id
  }

  tags = {
    Name = "routetable_nat_c_${var.project_name}"
  }
}

resource "aws_route_table_association" "route_table_nat_association_a" {
  subnet_id      = aws_subnet.subnetpriv_az_a.id
  route_table_id = aws_route_table.route_table_nat_a.id
}

resource "aws_route_table_association" "route_table_nat_association_b" {
  subnet_id      = aws_subnet.subnetpriv_az_b.id
  route_table_id = aws_route_table.route_table_nat_b.id
}

resource "aws_route_table_association" "route_table_nat_association_c" {
  subnet_id      = aws_subnet.subnetpriv_az_c.id
  route_table_id = aws_route_table.route_table_nat_c.id
}