# Sistema de Sorteio de Clientes para Modelo "Marea"

Este repositório contém uma aplicação desenvolvida em **Delphi** para realizar o sorteio de clientes baseado em critérios específicos, bem como funcionalidades auxiliares para manipulação de dados e integração com um banco de dados relacional.

## Funcionalidades

1. **CRUD de Clientes e Carros**:
   - Cadastro de novos clientes e modelos de carros.
   
2. **Gerenciamento de Vendas**:
   - Registro de vendas associadas a clientes e modelos de carros.
   
3. **Sorteio de Clientes**:
   - Seleção dos 15 primeiros clientes que atenderem os critérios:
     - CPF iniciado com `0`.
     - Modelo do carro "Marea".
     - Ano de lançamento 2021.
     - Não pode ter mais de uma compra do modelo "Marea".
   - Exclusão de vendas que não são dos clientes sorteados.

4. **Massa de Dados para Testes**:
   - Script SQL para popular o banco de dados com dados fictícios para validação da aplicação.

## Estrutura do Projeto

- **Classes**: Representam as tabelas `Clientes`, `Carros` e `Vendas` do banco de dados.
- **Scripts SQL**: Scripts para criação de tabelas e inserção de dados fictícios.
- **Métodos Auxiliares**:
  - `InserirDadosBD`: Para executar comandos de inserção.
  - `ExecutarSql`: Para recuperar dados do banco.

## Requisitos

- **Delphi 7**
- Banco de Dados Relacional compatível (FireBird)
- Conexão configurada (via componentes FireDac, ADO, Zeos, ou similar).

## Como Usar

1. Clone o repositório:
   ```bash
   git clone https://github.com/seu-usuario/nome-do-repositorio.git

2. Configure a conexão com o banco de dados no ambiente Delphi.

3. Execute os scripts SQL:
   - Criação das tabelas.
   - Inserção de massa de dados para testes.

4. Compile e rode a aplicação no Delphi 7.

## Estrutura do Banco de Dados
As tabelas do banco de dados têm o seguinte formato:

# Tabela Clientes
| Campo      | Tipo         | Descrição                       |
| ---------- | ------------ | ------------------------------- |
| id         | INT          | (PK)	Identificador do cliente. |
| nome       | VARCHAR(100) | Nome do cliente.                |
| cpf        | VARCHAR(11)  | CPF do cliente.                 |

# Tabela Carros
| Campo          | Tipo        | Descrição                       |
| -------------- | ----------- | ------------------------------- |
| id             | INT         | Identificador do carro.         |
| modelo         | VARCHAR(50) | Modelo do carro.                |
| ano_lancamento | INT         | Ano de lançamento do carro.     |

# Tabela Vendas
| Campo      | Tipo        | Descrição                      |
| -----------| ----------- | ------------------------------ |
| id         | INT         | Identificador da venda.        |
| id_cliente | VARCHAR(50) | Referência para o cliente.     |
| id_carro   | INT         | Referência para o carro.       |
| data_venda | DATETIME    | Data em que a venda foi feita. |

# Scripts SQL
Os scripts necessários estão disponíveis na pasta sql/. Eles incluem:

1. Criação das tabelas.
2. Inserção de dados fictícios para testes.

# Contribuição
Contribuições são bem-vindas! Siga os passos abaixo para contribuir:

1. Faça um fork do projeto.

2. Crie um branch para suas alterações:
   git checkout -b minha-nova-funcionalidade

3. Commit suas alterações:
   git commit -m "Adiciona nova funcionalidade"

4. Faça um push para o branch:
   git push origin minha-nova-funcionalidade

5. Abra um Pull Request.

# Licença
Este projeto está licenciado sob a licença MIT.

# Contato
Para dúvidas ou sugestões, entre em contato:

*Email:* oliveira.eduardo.dev@gmail.com

*GitHub:* Eduardo Oliveira(https://github.com/eduardo-olive)
