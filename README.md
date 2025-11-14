
# FeiFood – Sistema de Cardápio e Pedidos

Projeto desenvolvido para a disciplina de Programação Orientada a Objetos (3º semestre – FEI). O objetivo deste projeto foi criar um sistema simples para gerenciar pedidos de um restaurante, utilizando Java, Swing, PostgreSQL e o padrão de projeto MVC (Model-View-Controller).

---

## 1. Descrição do Projeto

O **FeiFood** é um sistema de pedidos para restaurantes. O fluxo do sistema permite que o usuário faça login, visualize os itens disponíveis no cardápio, adicione itens ao pedido, veja o valor total, faça o pagamento e, por fim, avalie o serviço com uma nota de 0 a 5 estrelas.

### Funcionalidades Principais:
- **Login**: O usuário entra com seu nome de usuário e senha para acessar o sistema.
- **Cardápio**: Exibe os itens disponíveis (como comidas, bebidas, etc.). O usuário pode filtrar por categoria e buscar por nome.
- **Pedido**: O usuário pode adicionar itens ao pedido, ajustar a quantidade e ver o valor total.
- **Avaliação**: Após realizar o pedido, o usuário pode dar uma avaliação de 0 a 5 estrelas.

---

## 2. Tecnologias Utilizadas

- **Java**: Para o desenvolvimento do sistema.
- **Swing**: Para a criação das interfaces gráficas.
- **PostgreSQL**: Como banco de dados para armazenar as informações dos alimentos, usuários e pedidos.
- **JDBC**: Para conectar o Java ao PostgreSQL.
- **NetBeans**: IDE utilizada para o desenvolvimento do projeto.

---

## 3. Estrutura do Projeto

- **Model**: Contém as classes que representam as entidades do sistema, como `Alimento` e `PedidoItem`.
- **DAO (Data Access Object)**: Responsável pela comunicação com o banco de dados (criação, leitura, atualização e remoção de dados).
- **View**: Contém as interfaces gráficas, representadas pelas telas (Login, Cardápio, Pedido, Avaliação).
- **Controller**: Controla a lógica de negócios, interagindo entre o modelo e a visão.

---

## 4. Banco de Dados

O banco de dados foi construído utilizando **PostgreSQL**. Ele contém as seguintes tabelas principais:

- **tbaluno**: Para armazenar as informações dos usuários.
- **tbalimento**: Para armazenar as informações dos itens do cardápio (alimentos e bebidas).

---

## 5. Como Rodar o Projeto

### **Pré-requisitos**:
- **JDK 8 ou superior**
- **PostgreSQL** instalado e configurado.

### **Passos para executar**:

1. Faça o clone ou baixe o repositório para sua máquina local.
2. Importe o projeto no NetBeans.
3. Configure a conexão com o banco de dados **PostgreSQL**:
    - Crie um banco de dados chamado `Alunos.sql`.
    - Execute o arquivo `Alunos.sql.sql` para criar as tabelas e inserir dados de exemplo.
4. Execute o projeto no NetBeans.

---

## 6. Autor

**Lucas Gasparetto Pimentel**  
R.A. 22.124.025-2  
Faculdade de Engenharia Industrial (FEI)
