variable "project_name" {
  type        = string
  default     = "desafio"
  description = "Adicionar seu nome"
}

variable "region" {
  type        = string
  default     = "sa-east-1"
  description = "Região da AWS"
}

variable "vpc_cidr_block" {
  type        = string
  default     = "10.10.0.0/16"
  description = "VPC CIDR block"
}

variable "key_pair_name" {
  type    = string
  default = "kp-mineiro"
}

variable "path_kp" {
  type    = string
  default = "~/kp-mineiro.pem"
}

