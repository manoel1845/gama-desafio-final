variable "subnet_ids" {
  default = ["subnet-016a5e1eac8a42cd8", "subnet-0390ee1a74740e732", "subnet-0ba89781f5c817e70"]
}

# variable "environments" {
#   default = {
#     az_a = "dev",
#     az_b = "stage",
#     az_c = "prod"
#   }
# }

variable "path_kp" {
  type        = string
  default     = "~/kp-mineiro.pem"
  description = "Caminho completo para chave privada com o nome da chave"
}

variable "vpc_id" {
  type    = string
  default = "vpc-0e1d4202750496496"
}

variable "ami_id" {
  type    = string
  default = "ami-0e66f5495b4efdd0f"
}

variable "key_pair" {
  type    = string
  default = "kp-mineiro"
}

variable "project_name" {
  type        = string
  default     = "desafio"
  description = "Adicionar seu nome"
}