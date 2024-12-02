-- Limpando tabelas
DELETE FROM Vendas;
DELETE FROM Carros;
DELETE FROM Clientes;

-- Zera valores dos generators
SET GENERATOR GEN_CLIENTE_ID TO 0;
SET GENERATOR GEN_CARRO_ID TO 0;
GENERATOR GEN_VENDA_ID TO 0;


-- Inserindo Carros
INSERT INTO Carros (id, modelo, ano_lancamento) VALUES (1, 'Marea', 2021);
INSERT INTO Carros (id, modelo, ano_lancamento) VALUES (2, 'Uno', 2022);
INSERT INTO Carros (id, modelo, ano_lancamento) VALUES (3, 'Palio', 2021);
INSERT INTO Carros (id, modelo, ano_lancamento) VALUES (4, 'Marea', 2020); -- Ano inválido para sorteio
INSERT INTO Carros (id, modelo, ano_lancamento) VALUES (5, 'Civic', 2023);
INSERT INTO Carros (id, modelo, ano_lancamento) VALUES (6, 'Marea', 2021);
INSERT INTO Carros (id, modelo, ano_lancamento) VALUES (7, 'Corolla', 2023);
INSERT INTO Carros (id, modelo, ano_lancamento) VALUES (8, 'Marea', 2021);
INSERT INTO Carros (id, modelo, ano_lancamento) VALUES (9, 'Onix', 2022);
INSERT INTO Carros (id, modelo, ano_lancamento) VALUES (10, 'T-Cross', 2021);

-- Inserindo Clientes
INSERT INTO Clientes (id, nome, cpf) VALUES (1, 'João Silva', '01234567890')
INSERT INTO Clientes (id, nome, cpf) VALUES (2, 'Maria Oliveira', '01122334455')
INSERT INTO Clientes (id, nome, cpf) VALUES (3, 'Pedro Santos', '01233445566')
INSERT INTO Clientes (id, nome, cpf) VALUES (4, 'Ana Costa', '01098765432')
INSERT INTO Clientes (id, nome, cpf) VALUES (5, 'Carla Nunes', '01222233344')
INSERT INTO Clientes (id, nome, cpf) VALUES (6, 'Lucas Mendes', '12345678901') -- CPF que não começa com 0
INSERT INTO Clientes (id, nome, cpf) VALUES (7, 'Paula Lima', '00987654321')  -- CPF válido para sorteio
INSERT INTO Clientes (id, nome, cpf) VALUES (8, 'Renata Souza', '00112233445') -- CPF válido para sorteio
INSERT INTO Clientes (id, nome, cpf) VALUES (9, 'Fernando Alves', '09876543210') -- CPF válido para sorteio
INSERT INTO Clientes (id, nome, cpf) VALUES (10, 'Juliana Prado', '08877665544') -- CPF válido para sorteio

-- Inserindo Vendas
INSERT INTO Vendas (id, id_cliente, id_carro, data_venda) VALUES (1, 1, 1, '2023-01-15'); -- João, Marea 2021  - SORTEADO
INSERT INTO Vendas (id, id_cliente, id_carro, data_venda) VALUES (2, 2, 1, '2023-01-16'); -- Maria, Marea 2021 - SORTEADO
INSERT INTO Vendas (id, id_cliente, id_carro, data_venda) VALUES (3, 3, 1, '2023-01-17'); -- Pedro, Marea 2021 - NÃO FOI SORTEADO
INSERT INTO Vendas (id, id_cliente, id_carro, data_venda) VALUES (4, 4, 2, '2023-01-18'); -- Ana, Uno
INSERT INTO Vendas (id, id_cliente, id_carro, data_venda) VALUES (5, 5, 1, '2023-01-19'); -- Carla, Marea 2021 - SORTEADO
INSERT INTO Vendas (id, id_cliente, id_carro, data_venda) VALUES (6, 6, 1, '2023-01-20'); -- Lucas, Marea 2021 - NÃO FOI SORTEADO
INSERT INTO Vendas (id, id_cliente, id_carro, data_venda) VALUES (7, 7, 1, '2023-01-21'); -- Paula, Marea 2021 - SORTEADO
INSERT INTO Vendas (id, id_cliente, id_carro, data_venda) VALUES (8, 8, 1, '2023-01-22'); -- Renata, Marea 2021 - NÃO FOI SORTEADO
INSERT INTO Vendas (id, id_cliente, id_carro, data_venda) VALUES (9, 8, 8, '2023-01-23'); -- Renata, 2º Marea (desclassificada)
INSERT INTO Vendas (id, id_cliente, id_carro, data_venda) VALUES (10, 9, 6, '2023-01-24'); -- Fernando, Marea 2021 - SORTEADO
INSERT INTO Vendas (id, id_cliente, id_carro, data_venda) VALUES (11, 10, 1, '2023-01-25'); -- Juliana, Marea 2021 - SORTEADO
INSERT INTO Vendas (id, id_cliente, id_carro, data_venda) VALUES (12, 10, 3, '2023-01-26'); -- Juliana, Palio - NÃO FOI SORTEADO
INSERT INTO Vendas (id, id_cliente, id_carro, data_venda) VALUES (13, 3, 4, '2023-01-27'); -- Pedro, Marea 2020 (desclassificado pelo ano)
INSERT INTO Vendas (id, id_cliente, id_carro, data_venda) VALUES (14, 2, 1, '2023-01-28'); -- Maria, 2º Marea (desclassificada)
INSERT INTO Vendas (id, id_cliente, id_carro, data_venda) VALUES (15, 5, 5, '2023-01-29'); -- Carla, Civic
