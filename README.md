# Sistema de Sorteio de Clientes para Modelo "Marea"

Este repositório contém uma aplicação desenvolvida em *Delphi* para realizar o sorteio de clientes baseado em critérios específicos, bem como funcionalidades auxiliares para manipulação de dados e integração com um banco de dados relacional.

## Funcionalidades

1. Cadastro de novos clientes e modelos de carros.
   
2. *Gerenciamento de Vendas*:
   - Registro de vendas associadas a clientes e modelos de carros.
   
3. *Sorteio de Clientes*:
   - Seleção dos 15 primeiros clientes que atenderem os critérios:
     - CPF iniciado com 0.
     - Modelo do carro "Marea".
     - Ano de lançamento 2021.
     - Não pode ter mais de uma compra do modelo "Marea".
   - Exclusão de vendas que não são dos clientes sorteados.

4. *Massa de Dados para Testes*:
   - Script SQL para popular o banco de dados com dados fictícios para validação da aplicação.

## Estrutura do Projeto

- *Classes*: Representam as tabelas Clientes, Carros e Vendas do banco de dados.
- *Scripts SQL*: Scripts para criação de tabelas e inserção de dados fictícios.
- *Métodos Auxiliares*:
  - InserirDadosBD: Para executar comandos de inserção.
  - ExecutarSql: Para recuperar dados do banco.

## Requisitos

- Banco de Dados Relacional compatível (MySQL, PostgreSQL, etc.)
- Conexão configurada (via componentes ADO, Zeos, ou similar).

