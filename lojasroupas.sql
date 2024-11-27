CREATE DATABASE LojaRoupas;
USE LojaRoupas;

CREATE TABLE Categoria (
	id_categoria INT AUTO_INCREMENT,
    nome VARCHAR(50)
    );
    
CREATE TABLE Produtos (
	id_produto INT AUTO_INCREMENT,
    nome VARCHAR(100),
    tamanho VARCHAR(50),
    cor VARCHAR(30),
    preco DECIMAL(10,2),
    estoque INT,
    id_categoria INT,
    id_fornecedor INT
    );
    
CREATE TABLE Clientes (
	id_cliente INT AUTO_INCREMENT,
    nome VARCHAR(100),
    email VARCHAR(100),
    telefone VARCHAR(15),
    endereco VARCHAR(255)
    );
    
CREATE TABLE Vendas (
	id_venda INT AUTO_INCREMENT,
    id_cliente INT,
    data_venda DATETIME,
    valor_total DECIMAL(10, 2)
    );
    
CREATE TABLE ItensVenda (
	id_item INT AUTO_INCREMENT,
    id_venda INT,
    id_produto INT,
    quantidade INT,
    preco_unitario DECIMAL(10, 2)
    );
    
CREATE TABLE Fornecedores (
	id_fornecedor INT AUTO_INCREMENT,
    nome VARCHAR(100),
    telefone VARCHAR(15),
    endereco VARCHAR(255)
    );
    
