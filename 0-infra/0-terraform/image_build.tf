data "aws_ami" "ami-ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
  owners = ["099720109477"]
}

resource "aws_instance" "build_k8s" {
  subnet_id                   = aws_subnet.subnetpub_az_a.id
  ami                         = data.aws_ami.ami-ubuntu.id
  instance_type               = "t2.large"
  associate_public_ip_address = true
  key_name                    = var.key_pair_name
  root_block_device {
    encrypted   = true
    volume_size = 30
  }
  tags = {
    Name = "build_k8s_${var.project_name}"
  }
  vpc_security_group_ids = [aws_security_group.sg_image_k8s.id]
}

resource "aws_security_group" "sg_image_k8s" {
  name        = "image_k8s_${var.project_name}"
  description = "projetofinal_kubernetes inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress = [
    {
      description      = "SSH from VPC"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = null,
      security_groups : null,
      self : null
    },
    {
      description      = "SSH from VPC"
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = null,
      security_groups : null,
      self : null
    },
  ]

  egress = [
    {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"],
      prefix_list_ids  = null,
      security_groups : null,
      self : null,
      description : "Libera dados da rede interna"
    }
  ]

  tags = {
    Name = "image_k8s_${var.project_name}"
  }
}

output "image_k8s" {
  value = [
    "resource_id: ${aws_instance.build_k8s.id}",
    "public_ip: ${aws_instance.build_k8s.public_ip}",
    "public_dns: ${aws_instance.build_k8s.public_dns}",
    "ssh -i ${var.path_kp} ubuntu@${aws_instance.build_k8s.public_dns}"
  ]
}