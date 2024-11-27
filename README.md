# LojaRoupas - Banco de Dados

Este repositório contém o código SQL para a criação de um banco de dados chamado **LojaRoupas**, projetado para gerenciar uma loja de roupas. O banco de dados inclui tabelas para armazenar informações sobre categorias de produtos, produtos, clientes, vendas, itens de venda e fornecedores.

## Estrutura do Banco de Dados

O banco de dados `LojaRoupas` é composto por seis tabelas principais:

### 1. **Tabela Categoria**

Armazena as categorias dos produtos (por exemplo, Camisas, Calças, etc.).

```sql
CREATE TABLE Categoria (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);
```

#### Colunas:
- `id_categoria`: Identificador único para cada categoria (Chave Primária).
- `nome`: Nome da categoria do produto.

### 2. **Tabela Produtos**

Armazena os produtos disponíveis na loja.

```sql
CREATE TABLE Produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    tamanho VARCHAR(50),
    cor VARCHAR(30),
    preco DECIMAL(10,2),
    estoque INT,
    id_categoria INT,
    id_fornecedor INT,
    FOREIGN KEY (id_categoria) REFERENCES Categoria(id_categoria),
    FOREIGN KEY (id_fornecedor) REFERENCES Fornecedores(id_fornecedor)
);
```

#### Colunas:
- `id_produto`: Identificador único para cada produto (Chave Primária).
- `nome`: Nome do produto.
- `tamanho`: Tamanho do produto.
- `cor`: Cor do produto.
- `preco`: Preço do produto.
- `estoque`: Quantidade disponível do produto.
- `id_categoria`: Referência à tabela `Categoria` (Chave Estrangeira).
- `id_fornecedor`: Referência à tabela `Fornecedores` (Chave Estrangeira).

### 3. **Tabela Clientes**

Armazena informações dos clientes da loja.

```sql
CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    telefone VARCHAR(15),
    endereco VARCHAR(255)
);
```

#### Colunas:
- `id_cliente`: Identificador único para cada cliente (Chave Primária).
- `nome`: Nome do cliente.
- `email`: Endereço de e-mail do cliente.
- `telefone`: Número de telefone do cliente.
- `endereco`: Endereço do cliente.

### 4. **Tabela Vendas**

Armazena informações sobre as vendas realizadas na loja.

```sql
CREATE TABLE Vendas (
    id_venda INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    data_venda DATETIME,
    valor_total DECIMAL(10, 2),
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);
```

#### Colunas:
- `id_venda`: Identificador único para cada venda (Chave Primária).
- `id_cliente`: Referência à tabela `Clientes` (Chave Estrangeira).
- `data_venda`: Data e hora da venda.
- `valor_total`: Valor total da venda.

### 5. **Tabela ItensVenda**

Armazena os itens vendidos em cada venda.

```sql
CREATE TABLE ItensVenda (
    id_item INT AUTO_INCREMENT PRIMARY KEY,
    id_venda INT,
    id_produto INT,
    quantidade INT,
    preco_unitario DECIMAL(10, 2),
    FOREIGN KEY (id_venda) REFERENCES Vendas(id_venda),
    FOREIGN KEY (id_produto) REFERENCES Produtos(id_produto)
);
```

#### Colunas:
- `id_item`: Identificador único para cada item de venda (Chave Primária).
- `id_venda`: Referência à tabela `Vendas` (Chave Estrangeira).
- `id_produto`: Referência à tabela `Produtos` (Chave Estrangeira).
- `quantidade`: Quantidade do produto vendido.
- `preco_unitario`: Preço do produto no momento da venda.

### 6. **Tabela Fornecedores**

Armazena informações dos fornecedores dos produtos.

```sql
CREATE TABLE Fornecedores (
    id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    telefone VARCHAR(15),
    endereco VARCHAR(255)
);
```

#### Colunas:
- `id_fornecedor`: Identificador único para cada fornecedor (Chave Primária).
- `nome`: Nome do fornecedor.
- `telefone`: Número de telefone do fornecedor.
- `endereco`: Endereço do fornecedor.

## Relacionamentos

- **Produto-Categoria**: Cada produto pertence a uma categoria, e a tabela `Produtos` faz referência à tabela `Categoria` através da coluna `id_categoria`.
- **Produto-Fornecedor**: Cada produto tem um fornecedor, e a tabela `Produtos` faz referência à tabela `Fornecedores` através da coluna `id_fornecedor`.
- **Venda-Cliente**: Cada venda é associada a um cliente, e a tabela `Vendas` faz referência à tabela `Clientes` através da coluna `id_cliente`.
- **Venda-ItensVenda**: Cada venda pode ter múltiplos itens, e a tabela `ItensVenda` faz referência à tabela `Vendas` e `Produtos`.

## Como Usar

1. Execute o código SQL em um ambiente de banco de dados MySQL ou MariaDB para criar o banco de dados e as tabelas.
2. Você pode usar este esquema para gerenciar informações de produtos, clientes, vendas e fornecedores de uma loja de roupas.
3. Insira dados nas tabelas usando os comandos `INSERT INTO` para registrar informações sobre produtos, clientes, vendas, etc.
4. Realize consultas com `SELECT` para obter relatórios ou detalhes sobre vendas, estoque, clientes e produtos.

## Exemplo de Consultas

1. **Consultar todos os produtos disponíveis:**
   ```sql
   SELECT nome, tamanho, cor, preco, estoque FROM Produtos;
   ```

2. **Consultar todas as vendas de um cliente específico:**
   ```sql
   SELECT v.id_venda, v.data_venda, v.valor_total
   FROM Vendas v
   JOIN Clientes c ON v.id_cliente = c.id_cliente
   WHERE c.nome = 'Nome do Cliente';
   ```

3. **Consultar itens vendidos em uma venda específica:**
   ```sql
   SELECT p.nome, iv.quantidade, iv.preco_unitario
   FROM ItensVenda iv
   JOIN Produtos p ON iv.id_produto = p.id_produto
   WHERE iv.id_venda = 1;
   ```
