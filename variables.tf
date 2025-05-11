variable "region" {
  description = "Região AWS"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "ambiente que estão os recursos"
  type        = string
  default     = "Production"
}

variable "aws_account_id" {
  description = "ID da conta AWS onde está a role LabRole"
  type        = string
}
