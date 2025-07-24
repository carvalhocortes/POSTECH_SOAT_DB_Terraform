variable "project_name" {
  description = "Nome do projeto"
  type        = string
  default     = "fiap-soat-lanchonete"
}

variable "region" {
  description = "Região AWS"
  type        = string
  default     = "us-west-2"
}

variable "environment" {
  description = "ambiente que estão os recursos"
  type        = string
  default     = "Production"
}

variable "db_password" {
  description = "A senha para o usuário master do banco de dados RDS."
  type        = string
  sensitive   = true
}
