resource "aws_db_instance" "postgres_db" {
  allocated_storage      = 20
  engine                 = "postgres"
  instance_class         = "db.t3.micro"
  db_name                = "fiapdbPostgres"
  username               = "terraformAdmin"
  password               = var.db_password
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  skip_final_snapshot    = true
  publicly_accessible    = true
}
