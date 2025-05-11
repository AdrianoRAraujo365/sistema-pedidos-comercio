###SCRIPT SQL – Criação de Banco de Dados com Tabelas produtos e pedidos
sql

##-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS comercio_local;
USE comercio_local;

-- Criação da tabela de produtos
CREATE TABLE produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    categoria VARCHAR(50),
    estoque INT DEFAULT 0
);

-- Criação da tabela de pedidos
CREATE TABLE pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    produto_id INT NOT NULL,
    data_pedido DATE NOT NULL,
    quantidade INT NOT NULL,
    total DECIMAL(10,2) AS (quantidade * preco_unitario) STORED,
    preco_unitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (produto_id) REFERENCES produtos(id)
);

-- Inserção de dados na tabela produtos
INSERT INTO produtos (nome, preco, categoria, estoque)
VALUES
('Café Expresso', 5.50, 'Bebidas', 100),
('Pão de Queijo', 3.00, 'Salgados', 50),
('Livro "Aprenda SQL"', 45.90, 'Livros', 20);

-- Inserção de dados na tabela pedidos
INSERT INTO pedidos (produto_id, data_pedido, quantidade, preco_unitario)
VALUES
(1, '2025-05-01', 2, 5.50),
(2, '2025-05-02', 3, 3.00),
(3, '2025-05-02', 1, 45.90);
