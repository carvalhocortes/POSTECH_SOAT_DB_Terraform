# 🛒 Sistema de Gerenciamento de Vendas e Usuários

Este projeto utiliza MongoDB para gerenciar usuários, produtos, pedidos e itens de venda. Ele é ideal para pequenos negócios que desejam um sistema simples para controle de vendas com autenticação de usuários.

---

## 📘 Estrutura do Banco de Dados (MongoDB)

Abaixo está um diagrama UML da modelagem principal, usando `Mermaid` para representar as relações entre documentos.

```mermaid
classDiagram
    class User {
        +ObjectId _id
        +string name
        +string email
        +string passwordHash
        +string role
        +date createdAt
    }

    class Product {
        +ObjectId _id
        +string name
        +string description
        +float price
        +int stock
        +date createdAt
    }

    class Order {
        +ObjectId _id
        +ObjectId userId
        +date orderDate
        +float total
        +string status
    }

    class OrderItem {
        +ObjectId _id
        +ObjectId orderId
        +ObjectId productId
        +int quantity
        +float unitPrice
    }

    User "1" --> "many" Order : places
    Order "1" --> "many" OrderItem : contains
    Product "1" --> "many" OrderItem : is part of
