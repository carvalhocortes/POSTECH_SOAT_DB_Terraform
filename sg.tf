resource "aws_security_group" "rds_sg" {
  name        = "rds-sg"
  description = "Permitir trafego de entrada do PostgreSQL"
  vpc_id      = data.aws_vpc.vpc.id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # ATENÇÃO: Para produção, restrinja este CIDR para IPs específicos.
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
