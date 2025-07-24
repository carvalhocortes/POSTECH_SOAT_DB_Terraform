CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Tabela: customers
-- A coluna "cpf" tem uma restrição UNIQUE para garantir que não haja duplicatas.
CREATE TABLE customers (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    cpf VARCHAR(11) NOT NULL UNIQUE,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE
);

-- Cria um índice na coluna "cpf" para otimizar buscas
CREATE INDEX idx_customers_cpf ON customers(cpf);

--------------------------------------------------------------------------------

-- Tabela: products
CREATE TABLE products (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(255) NOT NULL,
    category VARCHAR(100) NOT NULL,
    price NUMERIC(10, 2) NOT NULL,
    description TEXT
);

-- Cria um índice na coluna "category"
CREATE INDEX idx_products_category ON products(category);

--------------------------------------------------------------------------------

-- Tabela: orders
CREATE TABLE orders (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    customer_id UUID NOT NULL,
    order_date TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(50) NOT NULL DEFAULT 'PENDING',
    CONSTRAINT fk_customer
      FOREIGN KEY(customer_id)
    REFERENCES customers(id)
);

CREATE TABLE order_items (
    order_id UUID NOT NULL,
    product_id UUID NOT NULL,
    quantity INTEGER NOT NULL,
    price_at_time NUMERIC(10, 2) NOT NULL,
    PRIMARY KEY (order_id, product_id),
    CONSTRAINT fk_order
      FOREIGN KEY(order_id)
    REFERENCES orders(id),
    CONSTRAINT fk_product
      FOREIGN KEY(product_id)
    REFERENCES products(id)
);

--------------------------------------------------------------------------------

-- Tabela: counters
CREATE TABLE counters (
    name VARCHAR(100) PRIMARY KEY,
    current_value BIGINT NOT NULL DEFAULT 0
);

-- Inicia um contador
INSERT INTO counters (name, current_value) VALUES ('order_number', 1000);
