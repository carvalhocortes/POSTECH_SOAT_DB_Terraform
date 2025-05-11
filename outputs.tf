output "products_table_arn" {
  description = "ARN da tabela de Produtos"
  value       = aws_dynamodb_table.products.arn
}

output "orders_table_arn" {
  description = "ARN da tabela de Pedidos"
  value       = aws_dynamodb_table.orders.arn
}

output "customers_table_arn" {
  description = "ARN da tabela de Clientes"
  value       = aws_dynamodb_table.customers.arn
}

output "counters_table_arn" {
  description = "ARN da tabela de Contadores"
  value       = aws_dynamodb_table.counters.arn
}
