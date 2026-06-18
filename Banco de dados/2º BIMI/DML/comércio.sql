-- Tabela: Clientes
INSERT INTO clientes (nome, email, telefone)
VALUES
('Dhyego', 'dhyego@gmail.com', '(63) 99999-1111'),
('Carol Souza', 'carol@gmail.com', '(63) 99999-2222'),
('Dhaphini Lima', 'dhaphini@gmail.com', '(63) 99999-3333'),
('Devid', 'devid@gmail.com', '(63) 99999-4444'),
('Helyza', 'helyza@gmail.com', '(63) 99999-5555');


-- Tabela: Produtos
INSERT INTO produtos (nome_produto, preco, estoque)
VALUES
('Notebook', 3500.00, 10),
('Mouse Gamer', 120.00, 30),
('Teclado Mecânico', 250.00, 20),
('Monitor 24"', 900.00, 15),
('Headset Gamer', 200.00, 25);


-- TAabela: Pedidos
INSERT INTO pedidos (data_pedido, id_cliente)
VALUES
('2026-06-01', 1),
('2026-09-02', 2),
('2026-02-03', 3),
('2026-05-04', 4),
('2026-04-05', 5);


-- TAabela: itens_pedido
INSERT INTO itens_pedido (id_pedido, id_produto, quantidade)
VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 1),
(4, 4, 1),
(5, 5, 2);


SELECT * FROM clientes;

SELECT nome, email FROM clientes;

SELECT * FROM produtos
WHERE preco > 200;


-- UPDATES

UPDATE produtos
SET estoque = 50
WHERE id_produto = 1;

UPDATE clientes
SET nome = 'Carol Santos',
    email = 'carolsantos@gmail.com'
WHERE id_cliente = 2;

SELECT * FROM produtos WHERE id_produto = 1;
SELECT * FROM clientes WHERE id_cliente = 2;


-- DELETES

-- REMOÇÃO DOS ITENS DO PEDIDO 5
DELETE FROM itens_pedido
WHERE id_pedido = 5;


-- REMOÇÃO DO PEDIDO 5
DELETE FROM pedidos
WHERE id_pedido = 5;


-- REMOÇÃO DO CLIENTE 5
DELETE FROM clientes
WHERE id_cliente = 5;


-- CONFERÊNCIA DAS EXCLUSÕES
SELECT * FROM clientes;
SELECT * FROM pedidos;


-- JOINS

-- Pedidos E Clientes
SELECT
    c.nome AS cliente,
    p.id_pedido,
    p.data_pedido
FROM pedidos p
INNER JOIN clientes c
    ON p.id_cliente = c.id_cliente;


--  Itens do pedido e produtos
SELECT
    i.id_pedido,
    pr.nome_produto,
    i.quantidade
FROM itens_pedido i
INNER JOIN produtos pr
    ON i.id_produto = pr.id_produto;