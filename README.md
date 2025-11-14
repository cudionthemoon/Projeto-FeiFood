# FeiFood – Sistema de Cardápio e Pedidos

Projeto desenvolvido para a disciplina de Programação Orientada a Objetos (3º semestre – FEI). O objetivo foi criar um sistema simples de cardápio e pedidos utilizando Java, Swing, PostgreSQL e o padrão MVC.

## 1. O que foi feito

### Tela de Login
- Usuário informa login e senha.
- Validação feita no PostgreSQL (tbaluno).
- Acesso ao cardápio caso as credenciais estejam corretas.

### Tela de Cardápio
- Lista todos os alimentos cadastrados.
- Filtro por categoria.
- Busca por nome.
- Botão para continuar e montar o pedido.

### Tela de Pedido
- Mostra ID do pedido gerado.
- Data e hora do pedido.
- Tabela com itens escolhidos.
- Spinner para quantidade.
- Cálculo automático de subtotal e total.
- Remover itens.
- Botão “Realizar Pedido”.

### Tela de Avaliação
- Exibe ID do pedido.
- Usuário escolhe de 0 a 5 estrelas.
- Mensagem de confirmação.
- Retorno ao cardápio.

## 2. Estrutura do Projeto (MVC)

### Model
- Alimento
- PedidoItem

### DAO
- Conexao
- AlimentoDAO

### View
- Login
- Cardápio
- Pedido
- Avaliação

### Controller
- ControllerAlimento

## 3. Banco de Dados

### Tabela tbaluno
```
CREATE TABLE tbaluno (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    usuario VARCHAR(50) UNIQUE NOT NULL,
    senha VARCHAR(50) NOT NULL
);
```

### Tabela tbalimento
```
CREATE TABLE tbalimento (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    tipo VARCHAR(20),
    preco DECIMAL(10,2)
);
```

## 4. Fluxo do Sistema
1. Login
2. Cardápio
3. Seleção dos alimentos
4. Tela de pedido
5. Ajuste de quantidades e total
6. Realizar Pedido
7. Avaliação
8. Volta ao cardápio

## 5. Autor
**Lucas Gasparetto Pimentel** 
R.A.: 22.124.025-2
