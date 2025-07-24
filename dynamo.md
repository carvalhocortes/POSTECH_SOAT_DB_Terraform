# 🧾 Justificativa para o uso do DynamoDB

O **DynamoDB** foi escolhido como banco de dados deste projeto por razões técnicas e práticas. Abaixo destacam-se os principais pontos que justificam essa escolha:

---

## 📌 1. Modelo flexível de dados (NoSQL)

O DynamoDB permite armazenar dados em **itens com atributos flexíveis**, o que facilita a modelagem de estruturas como:
- Pedidos com seus itens personalizados.
- Produtos com variações e atributos opcionais.

Essa estrutura é ideal em um cenário onde:
- Nem todos os registros possuem os mesmos campos.
- Dados como preferências do cliente ou variações do produto são opcionais.
- Os pedidos podem conter estruturas aninhadas e personalizadas.

---

## 📌 2. Baixa latência e alta performance

Como um serviço **gerenciado pela AWS**, o DynamoDB oferece:
- **Leitura e escrita em milissegundos**, essenciais para registrar e atualizar pedidos em tempo real.
- Performance consistente mesmo sob carga, garantindo uma boa experiência para:
  - Cozinheiros visualizando pedidos.
  - Clientes acompanhando o status de seus pedidos.
  - Administradores acessando relatórios em tempo real.

---

## 📌 3. Escalabilidade automática e alta disponibilidade

O DynamoDB oferece escalabilidade automática sem necessidade de gerenciamento de infraestrutura. Isso é ideal para um sistema que precisa:
- Crescer com a expansão do negócio (mais lojas ou quiosques).
- Garantir disponibilidade mesmo em horários de pico (ex: horários de almoço e jantar).
- Suportar múltiplas regiões com replicação global, se necessário.

---

## 📌 4. Facilidade de manutenção e custo sob demanda

Por ser **serverless** e com **billing sob demanda**, o DynamoDB reduz os custos operacionais:
- Não há necessidade de gerenciar instâncias ou clusters.
- O custo é baseado na utilização (leitura, escrita e armazenamento), sendo eficiente para sistemas com variações sazonais de uso.

---

# 📘 Estrutura do Banco de Dados (DynamoDB)

Abaixo está um diagrama UML atualizado com foco na modelagem para o **DynamoDB**, mantendo a lógica de documentos, mas com atenção ao acesso por chave primária e chaves de ordenação.

```mermaid
classDiagram
    class Counter {
        +ObjectId _id
        +string name
        +number seq
    }

    class Customer {
        +ObjectId _id
        +string cpf
        +string name
        +string email
        +Date createdAt
        +Date updatedAt
    }

    class Product {
        +ObjectId _id
        +string name
        +string category
        +number price
        +string description
        +string[] images
        +Date createdAt
        +Date updatedAt
    }

    class Order {
        +ObjectId _id
        +ObjectId customerId
        +ProductItem[] products
        +number orderNumber
        +number total
        +string status
        +string paymentStatus
        +string paymentId
        +Date createdAt
        +Date updatedAt
    }

    class ProductItem {
        +ObjectId id
        +number quantity
    }

    %% Relações
    Customer "1" --> "many" Order : has
    Order "many" --> "1" ProductItem : contains
    ProductItem --> Product : references
    ```
