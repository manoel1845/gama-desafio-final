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

variable "key_pair_name" {
  type    = string
  default = "kp-mineiro"
}

variable "path_kp" {
  type        = string
  default     = "~/kp-mineiro.pem"
  description = "Caminho completo para chave privada com o nome da chave"
}

