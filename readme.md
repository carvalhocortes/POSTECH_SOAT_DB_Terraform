## 🧾 Justificativa para o uso do MongoDB

O **MongoDB** foi escolhido como banco de dados deste projeto por razões técnicas e práticas. Abaixo destacam-se os principais pontos que justificam essa escolha:

---

### 📌 1. Modelo flexível de dados (document-based)

O MongoDB permite armazenar dados em **documentos JSON-like**, o que facilita a modelagem de estruturas como:
- Pedidos com seus itens **personalizados**.
- Produtos com variações e atributos opcionais.

Isso é especialmente útil em um cenário onde:
- Nem todos os pedidos têm os mesmos campos.
- Os dados do cliente são parcialmente opcionais.
- Os itens dos pedidos (como lanches personalizados) podem ter estruturas dinâmicas.

---

### 📌 2. Alta performance em leitura e escrita

Por ser um banco **NoSQL orientado a documentos**, o MongoDB é altamente eficiente em operações de leitura e escrita, o que é fundamental para:
- Registrar pedidos em tempo real.
- Atualizar rapidamente os status do pedido (Recebido → Preparando → Pronto → Finalizado).
- Permitir a leitura simultânea dos pedidos por múltiplos sistemas (cozinha, painel do cliente, administração).

---

### 📌 3. Escalabilidade horizontal

Com a possibilidade de **sharding nativo**, o MongoDB permite escalar horizontalmente conforme a demanda cresce — ideal para acompanhar a **expansão do negócio da lanchonete** para múltiplas unidades ou quiosques de autoatendimento.

---

### 📌 4. Modelagem ágil e rápida evolução

Durante o desenvolvimento incremental do sistema, é comum que os requisitos mudem. A flexibilidade do MongoDB reduz a necessidade de **migrações de schema** pesadas, permitindo:
- Adição de novos campos em produtos ou pedidos sem impacto em dados antigos.
- Evolução da aplicação de forma iterativa e rápida.


---

## 📘 Estrutura do Banco de Dados (MongoDB)

Abaixo está um diagrama UML da modelagem principal, usando `Mermaid` para representar as relações entre documentos.

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
