# 🧾 Justificativa para o uso do PostgreSQL

O **PostgreSQL**, gerenciado através do **AWS RDS**, foi escolhido como banco de dados deste projeto devido à sua robustez, flexibilidade e ao seu poderoso conjunto de funcionalidades. Os pontos abaixo detalham os motivos para essa decisão.

---

## 📌 1. Integridade e Estrutura de Dados (SQL)

O PostgreSQL é um banco de dados relacional que impõe um esquema estruturado, garantindo a **consistência e a integridade dos dados**, o que é fundamental para um sistema transacional como o de pedidos.

- **Relacionamentos Claros**: O uso de **chaves estrangeiras** (`FOREIGN KEY`) assegura que um pedido não pode ser criado para um cliente inexistente, ou conter um produto que não está no catálogo.
- **Tipos de Dados Ricos**: Suporta uma vasta gama de tipos de dados, incluindo `NUMERIC` para valores monetários precisos, `TIMESTAMP` para datas e o poderoso tipo `JSONB`.
- **Flexibilidade com `JSONB`**: Permite armazenar dados semiestruturados, como atributos opcionais de produtos ou customizações de um pedido, combinando a rigidez do SQL com a flexibilidade do NoSQL no mesmo banco de dados.

---

## 📌 2. Poder e Flexibilidade em Consultas

A principal vantagem do SQL é sua capacidade de realizar **consultas complexas de forma eficiente**, algo essencial para a geração de relatórios e análises de negócio.

- **Junções (`JOINs`)**: Permite cruzar dados de múltiplas tabelas de forma simples e performática. Por exemplo, obter todos os pedidos de um cliente específico com os detalhes de cada produto em uma única consulta.
- **Funções de Agregação**: Calcular o faturamento total por dia, o produto mais vendido ou a média de itens por pedido torna-se trivial com funções como `SUM()`, `COUNT()` e `AVG()`.
- **Índices Otimizados**: Suporte a diferentes tipos de índices (B-Tree, GIN, etc.) que garantem alta performance tanto em buscas exatas quanto em consultas em campos `JSONB` ou texto.

---

## 📌 3. Escalabilidade e Confiabilidade com AWS RDS

Ao utilizar o PostgreSQL via **AWS RDS (Relational Database Service)**, obtemos os benefícios de um banco de dados relacional robusto com a facilidade de gerenciamento da nuvem.

- **Escalabilidade Gerenciada**: É simples escalar a capacidade da instância (verticalmente) ou adicionar **réplicas de leitura** (horizontalmente) para distribuir a carga de consultas, sem gerenciar a infraestrutura.
- **Alta Disponibilidade**: A configuração **Multi-AZ** cria uma réplica síncrona do banco de dados em outra zona de disponibilidade, garantindo a continuidade do serviço em caso de falha.
- **Manutenção Simplificada**: A AWS gerencia tarefas como backups automáticos, aplicação de patches de segurança e atualizações de versão, reduzindo drasticamente a carga operacional.

---

## 📌 4. Ecossistema Maduro e Extensível

PostgreSQL é um projeto de código aberto com décadas de desenvolvimento, resultando em um ecossistema extremamente confiável e rico em funcionalidades.

- **Extensibilidade**: Suporta um vasto número de extensões que adicionam novas funcionalidades, como o **PostGIS** para dados geoespaciais (ex: encontrar a loja mais próxima) ou o **pg_trgm** para buscas textuais avançadas.
- **Comunidade Forte**: Uma comunidade global ativa significa documentação abundante, ferramentas de mercado e suporte constante.

---

## 📘 Estrutura do Banco de Dados (PostgreSQL)

Abaixo está um diagrama UML que representa a estrutura de dados relacional no PostgreSQL. O modelo é **normalizado** para evitar redundância e garantir a integridade, utilizando uma tabela de junção (`order_items`) para o relacionamento entre pedidos e produtos.

```mermaid
classDiagram
    class Counter {
        +string name PK
        +bigint seq
    }

    class Customer {
        +UUID id PK
        +string cpf UK
        +string name
        +string email UK
        +timestamp createdAt
        +timestamp updatedAt
    }

    class Product {
        +UUID id PK
        +string name
        +string category
        +numeric price
        +string description
        +string[] images
        +timestamp createdAt
        +timestamp updatedAt
    }

    class Order {
        +UUID id PK
        +UUID customerId FK
        +integer orderNumber
        +numeric total
        +string status
        +string paymentStatus
        +string paymentId
        +timestamp createdAt
        +timestamp updatedAt
    }

    class OrderItems {
        +UUID orderId PK, FK
        +UUID productId PK, FK
        +integer quantity
        +numeric priceAtTime
    }

    %% Relações
    Customer "1" -- "0..*" Order : places
    Order "1" -- "1..*" OrderItems : contains
    Product "1" -- "0..*" OrderItems : is part of
