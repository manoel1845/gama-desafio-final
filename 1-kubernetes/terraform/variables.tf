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

variable ami_id {
  type        = string
  description = "ID da AMI criada"
}

variable "subnets" {
  default     = {
    az_a = "subnet-0eb6a9f3bf6a5ca29",
    az_b = "subnet-068927366474ced56",
    az_c = "subnet-09e5e9fe931dae14d"
  }
}
