variable region {
  type        = string
  default     = "sa-east-1"
  description = "Região da AWS"
}

variable vpc_cidr_block {
  type        = string
  default     = "10.10.0.0/16"
  description = "VPC CIDR block"
}


variable key_pair_name {
  type        = string
  default     = "kp-mineiro"
}

variable subnet-az-a {
  type        = string
  default     = "subnet-0842414f901483088"
}

variable vpc_id {
  type        = string
  default     = "vpc-03d1b7e53da104e7c"
  description = "description"
}

variable project_name {
  type        = string
  default     = "turma3"
  description = "Adicionar seu nome"
}
