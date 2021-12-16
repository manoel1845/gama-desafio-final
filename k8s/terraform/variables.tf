variable "project_name" {
  type        = string
  default     = "turma3"
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

