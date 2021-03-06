resource "aws_security_group" "acessos_masters" {
  name        = "k8s_acessos_masters_${var.project_name}"
  description = "acessos inbound traffic"
  vpc_id      = aws_vpc.main.id

  egress = [
    {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = [],
      prefix_list_ids  = null,
      security_groups : null,
      self : null,
      description : "Libera dados da rede interna"
    }
  ]

  tags = {
    Name = "acessos_masters_${var.project_name}"
  }
}

resource "aws_security_group" "acessos_haproxy" {
  name        = "k8s_haproxy_${var.project_name}"
  description = "acessos inbound traffic"
  vpc_id      = aws_vpc.main.id

  egress = [
    {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = [],
      prefix_list_ids  = null,
      security_groups : null,
      self : null,
      description : "Libera dados da rede interna"
    }
  ]

  tags = {
    Name = "allow_haproxy_ssh_${var.project_name}"
  }
}

resource "aws_security_group" "acessos_workers" {
  name        = "k8s_workers_${var.project_name}"
  description = "acessos inbound traffic"
  vpc_id      = aws_vpc.main.id

  egress = [
    {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = [],
      prefix_list_ids  = null,
      security_groups : null,
      self : null,
      description : "Libera dados da rede interna"
    }
  ]

  tags = {
    Name = "acessos_workers_${var.project_name}"
  }
}