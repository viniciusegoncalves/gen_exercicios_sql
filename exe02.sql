create database db_myecommerce;

use db_myecommerce;

create table tb_produtos (
    id int auto_increment primary key,
    nome_produto varchar(100),
    descricao varchar(250),
    preco decimal(10, 2),
    categoria varchar(100)
);

insert into tb_produtos (nome_produto, descricao, preco, categoria)
values
    ('Amortecedor', 'Amortecedor automovio para celta', 750.00, 'Peças Automotivas'),
    ('Maquiagem', 'Maquiagem para todos os tipos de pele', 150.00, 'Estética e beleza'),
    ('Painel solar', 'Painel para captaçao de energia', 15000.00, 'Painéis Solares'),
    ('Macarrao estantaneo', 'Macarrao que fica pronto em 3 minutos',
    10.00, 'Alimentos e bebidas'),
    ('Sofá', 'Sofá cama para casal', 1200.00, 'Casa, móveis e decoraçao'),
    ('Tábua de carne', 'Tábua para cortar carnes', 80.00, 'Cozinha, Utensílios e acessórios'),
    ('Pack 6 Cervejas', 'Caixa com 6 garrafas de 300ml', 35.00, 'Alimentos e bebidas'),
    ('Chinelo', 'Conforto para o seu dia a dia', 25.90, 'Vestuario');

select * from tb_produtos where preco > 500;

select * from tb_produtos where preco < 500;

UPDATE tb_produtos SET preco = 30.90 WHERE nome_produto = 'Chinelo';

SELECT * FROM tb_produtos;