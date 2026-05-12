create database if not exists BdEstoque;
use BdEstoque;

create table if not exists TbProduto
(
cod_produto int auto_increment primary key,
nome_produto varchar(100) not null,
descricao text,
preco decimal(10,2) not null,
data_entrada timestamp default current_timestamp
);

create table if not exists TbFuncionarios
(
id int auto_increment primary key,
nome varchar(100) not null,
email varchar(30) not null,
cargo varchar(30) not null
);

create table if not exists TbEstoque
(
produto_id int not null,
quantidade int not null,
funcionario_id int not null,
tipo_movimentacao enum ('Entrada','Saida') not null,
data_movimentacao timestamp default current_timestamp,
foreign key(produto_id) references TbProduto(cod_produto),
foreign key(funcionario_id) references TbFuncionarios(id)
);