provider "aws" {
  region = var.region
}

resource "aws_dynamodb_table" "products" {
  name = "products"
  billing_mode = "PROVISIONED"
  hash_key = "id"
  attribute {
    name = "id"
    type = "S"
  }
  attribute {
    name = "category"
    type = "S"
  }

  provisioned_throughput {
    read_capacity = 5
    write_capacity = 5
  }

  global_secondary_index {
    name = "category-index"
    hash_key = "category"
    projection_type = "ALL"
    provisioned_throughput {
      read_capacity = 5
      write_capacity = 5
    }
  }

  tags = {
    "Environment" = var.environment
    "Project"     = "fiap-soat-lanchonete"
  }
}

resource "aws_dynamodb_table" "orders" {
  name = "orders"
  billing_mode = "PROVISIONED"
  hash_key = "id"
  attribute {
    name = "id"
    type = "S"
  }
  attribute {
    name = "customerId"
    type = "S"
  }
  attribute {
    name = "orderNumber"
    type = "N"
  }

  provisioned_throughput {
    read_capacity = 5
    write_capacity = 5
  }

  global_secondary_index {
    name = "customerId-index"
    hash_key = "customerId"
    projection_type = "ALL"
    provisioned_throughput {
      read_capacity = 5
      write_capacity = 5
    }
  }

  tags = {
    "Environment" = var.environment
    "Project"     = "fiap-soat-lanchonete"
  }
}

 Tabela de Clientes
resource "aws_dynamodb_table" "customers" {
  name = "customers"
  billing_mode = "PROVISIONED"
  hash_key = "id"
  attribute {
    name = "id"
    type = "S"
  }

  provisioned_throughput {
    read_capacity = 5
    write_capacity = 5
  }

  tags = {
    "Environment" = var.environment
    "Project"     = "fiap-soat-lanchonete"
  }
}

resource "aws_dynamodb_table" "counters" {
  name = "counters"
  billing_mode = "PROVISIONED"
  hash_key = "name"
  attribute {
    name = "name"
    type = "S"
  }
  attribute {
    name = "seq"
    type = "N"
  }

  provisioned_throughput {
    read_capacity = 5
    write_capacity = 5
  }

  tags = {
    "Environment" = var.environment
    "Project"     = "fiap-soat-lanchonete"
  }
}
