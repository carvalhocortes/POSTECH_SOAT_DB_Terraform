resource "aws_dynamodb_table" "products" {
  name         = "products"
  billing_mode = "PROVISIONED"

  read_capacity  = 5
  write_capacity = 5

  hash_key = "id"
  attribute {
    name = "id"
    type = "S"
  }
  attribute {
    name = "category"
    type = "S"
  }

  global_secondary_index {
    name            = "category-index"
    hash_key        = "category"
    projection_type = "ALL"
    read_capacity   = 5
    write_capacity  = 5
  }

  tags = {
    "Environment" = var.environment
    "Project"     = var.project_name
  }
}

resource "aws_dynamodb_table" "orders" {
  name         = "orders"
  billing_mode = "PROVISIONED"

  read_capacity  = 5
  write_capacity = 5

  hash_key = "id"
  attribute {
    name = "id"
    type = "S"
  }

  tags = {
    "Environment" = var.environment
    "Project"     = var.project_name
  }
}

resource "aws_dynamodb_table" "customers" {
  name         = "customers"
  billing_mode = "PROVISIONED"

  read_capacity  = 5
  write_capacity = 5

  hash_key = "id"
  attribute {
    name = "id"
    type = "S"
  }
  attribute {
    name = "cpf"
    type = "S"
  }

  global_secondary_index {
    name            = "cpf-index"
    hash_key        = "cpf"
    projection_type = "ALL"
    read_capacity   = 5
    write_capacity  = 5
  }

  tags = {
    "Environment" = var.environment
    "Project"     = var.project_name
  }
}

resource "aws_dynamodb_table" "counters" {
  name         = "counters"
  billing_mode = "PROVISIONED"

  read_capacity  = 5
  write_capacity = 5

  hash_key = "name"
  attribute {
    name = "name"
    type = "S"
  }

  tags = {
    "Environment" = var.environment
    "Project"     = var.project_name
  }
}
