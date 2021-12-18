provider "aws" {
  region = "sa-east-1"
}

data "aws_ami" "ami_ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
  owners = ["099720109477"]
}

resource "aws_instance" "mysql_instances" {
  subnet_id     = element(var.subnet_ids, count.index)
  count         = 3
  ami           = data.aws_ami.ami_ubuntu.id
  instance_type = "t3.large"
  key_name      = var.key_pair
  root_block_device {
    encrypted   = true
    volume_size = 20
  }
  tags = {
    Name = "mysql-${count.index}-${var.project_name}"
  }
  vpc_security_group_ids = [aws_security_group.mysql_sg.id]
}

resource "aws_security_group" "mysql_sg" {
  name        = "mysql_sg-${var.project_name}"
  description = "acessos inbound traffic"
  vpc_id      = var.vpc_id
  ingress = [
    {
      description      = "SSH from VPC"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = null,
      security_groups : null,
      self : null
    },
    {
      description      = "mysql"
      from_port        = 3306
      to_port          = 3306
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = null,
      security_groups : null,
      self : null
    }
  ]
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
      description : "Libera todo trafego de saida"
    }
  ]
  tags = {
    Name = "mysql_sg-${var.project_name}"
  }
}

output "mysql_instances" {
  value = [
    for key, item in aws_instance.mysql_instances :
    "mysql_instance_${key + 1} - ${item.private_ip}"
  ]
}

# output "mysql_instances" {
#   value = [
#     for key, item in aws_instance.mysql_instances :
#     "mysql_instance_${key + 1} - ${item.private_ip} - ssh -i ${var.path_kp} ubuntu@${item.private_ip} -o ServerAliveInterval=60"
#   ]
# }

# output "output-mysql-dev" {
#   value = [
#     "mysql_instance_dev ${aws_instance.mysql_instance-dev.private_ip}"
#   ]
# }

# output "output-mysql-stag" {
#   value = [
#     "mysql_instance_stag ${aws_instance.mysql_instance-stag.private_ip}"
#   ]
# }

# output "output-mysql-prod" {
#   value = ["mysql_instance_prod ${aws_instance.mysql_instance-prod.private_ip}"]
# }

# variable "vpc_id" {
#   type = string
# }

# variable "igw_id" {
#   type = string
# }

# variable "amiId" {
#   type = string
# }

# variable "subnetPrivada_a" {
#   type = string
# }

# variable "subnetPrivada_b" {
#   type = string
# }

# variable "subnetPrivada_c" {
#   type = string
# }

# variable "chave" {
#   type = string
# }

# resource "aws_instance" "mysql_instance-stag" {
#   subnet_id     = var.subnetPrivada_b
#   ami           = var.ami_id
#   instance_type = "t3.large"
#   key_name      = var.key_pair
#   root_block_device {
#     encrypted   = true
#     volume_size = 20
#   }
#   tags = {
#     Name = "projetofinal-mysql-stag"
#   }
#   vpc_security_group_ids = [aws_security_group.projetofinal-mysql-sgProd.id]
# }

# resource "aws_instance" "mysql_instance-prod" {
#   subnet_id     = var.subnetPrivada_c
#   ami           = var.ami_id
#   instance_type = "t3.large"
#   key_name      = var.key_pair
#   root_block_device {
#     encrypted   = true
#     volume_size = 20
#   }
#   tags = {
#     Name = "projetofinal-mysql-prod"
#   }
#   vpc_security_group_ids = [aws_security_group.projetofinal-mysql-sgProd.id]
# }

# resource "aws_security_group" "projetofinal-mysql-sgDev" {
#   name        = "projetofinal-mysql-sgDev"
#   description = "acessos inbound traffic"
#   vpc_id      = "${var.vpc_id}"
#   ingress = [
#     {
#       description      = "SSH from VPC"
#       from_port        = 22
#       to_port          = 22
#       protocol         = "tcp"
#       cidr_blocks      = ["0.0.0.0/0"]
#       ipv6_cidr_blocks = []
#       prefix_list_ids = null,
#       security_groups: null,
#       self: null
#     },
#     {
#       description      = "mysql"
#       from_port        = 3306
#       to_port          = 3306
#       protocol         = "tcp"
#       cidr_blocks      = ["0.0.0.0/0"]
#       ipv6_cidr_blocks = []
#       prefix_list_ids = null,
#       security_groups: null,
#       self: null
#     }
#   ]
#   egress = [
#     {
#       from_port        = 0
#       to_port          = 0
#       protocol         = "-1"
#       cidr_blocks      = ["0.0.0.0/0"]
#       ipv6_cidr_blocks = [],
#       prefix_list_ids = null,
#       security_groups: null,
#       self: null,
#       description: "Libera dados da rede interna"
#     }
#   ]
#   tags = {
#     Name = "projetofinal-mysql-sgDev"
#   }
# }

# resource "aws_security_group" "projetofinal-mysql-sgStag" {
#   name        = "projetofinal-mysql-sgStag"
#   description = "acessos inbound traffic"
#   vpc_id      = "${var.vpc_id}"
#   ingress = [
#     {
#       description      = "SSH from VPC"
#       from_port        = 22
#       to_port          = 22
#       protocol         = "tcp"
#       cidr_blocks      = ["0.0.0.0/0"]
#       ipv6_cidr_blocks = []
#       prefix_list_ids = null,
#       security_groups: null,
#       self: null
#     },
#     {
#       description      = "mysql"
#       from_port        = 3306
#       to_port          = 3306
#       protocol         = "tcp"
#       cidr_blocks      = ["0.0.0.0/0"]
#       ipv6_cidr_blocks = []
#       prefix_list_ids = null,
#       security_groups: null,
#       self: null
#     }
#   ]
#   egress = [
#     {
#       from_port        = 0
#       to_port          = 0
#       protocol         = "-1"
#       cidr_blocks      = ["0.0.0.0/0"]
#       ipv6_cidr_blocks = [],
#       prefix_list_ids = null,
#       security_groups: null,
#       self: null,
#       description: "Libera dados da rede interna"
#     }
#   ]
#   tags = {
#     Name = "projetofinal-mysql-sgStag"
#   }
# }

