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
