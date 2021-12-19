provider "aws" {
  region = "sa-east-1"
}

variable "resource_id" {
  type        = string
  description = "ID da máquina"
}

variable "ami_version" {
  type        = string
  description = "Versão da imagem"
}

resource "aws_ami_from_instance" "ami-projetofinal" {
  name               = "terraform-projetofinal-${var.ami_version}"
  source_instance_id = var.resource_id
}

output "ami" {
  value = [
    "AMI: ${aws_ami_from_instance.ami-projetofinal.id}"
  ]
}