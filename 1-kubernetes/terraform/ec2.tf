# data "aws_ami" "ami-ubuntu" {
#   most_recent = true

#   filter {
#     name   = "name"
#     values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
#   }
#   owners = ["099720109477"]
# }

resource "aws_instance" "k8s_proxy" {
  ami                         = var.ami_id
  subnet_id                   = element(var.subnet_ids, 1)
  instance_type               = "t3.medium"
  key_name                    = var.key_pair_name
  associate_public_ip_address = true
  tags = {
    Name = "k8s-haproxy-${var.project_name}"
  }
  root_block_device {
    delete_on_termination = true
    encrypted             = true
    volume_size           = 30
  }
  vpc_security_group_ids = [aws_security_group.acessos_haproxy.id]
}

resource "aws_instance" "k8s_masters" {
  ami                         = var.ami_id
  subnet_id                   = element(var.subnet_ids, count.index)
  associate_public_ip_address = true
  instance_type               = "t2.large"
  key_name                    = var.key_pair_name
  count                       = 3
  tags = {
    Name = "k8s-master-${count.index}-${var.project_name}"
  }
  root_block_device {
    delete_on_termination = true
    encrypted             = true
    volume_size           = 30
  }
  vpc_security_group_ids = [aws_security_group.acessos_masters.id]
  depends_on = [
    aws_instance.k8s_workers,
  ]
}

resource "aws_instance" "k8s_workers" {
  ami                         = var.ami_id
  subnet_id                   = element(var.subnet_ids, count.index)
  instance_type               = "t3.medium"
  key_name                    = var.key_pair_name
  associate_public_ip_address = true
  count                       = 3
  root_block_device {
    delete_on_termination = true
    encrypted             = true
    volume_size           = 30
  }
  tags = {
    Name = "k8s_workers-${count.index}-${var.project_name}"
  }
  vpc_security_group_ids = [aws_security_group.acessos_workers.id]
}