CREATE SCHEMA IF NOT EXISTS db_cidade_das_carnes;
USE db_cidade_das_carnes;

CREATE TABLE tb_categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    descricao VARCHAR(255)
    );
    CREATE TABLE tb_produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(255),
    valor DECIMAL(10, 2) NOT NULL,
    estoque INT NOT NULL,
    categoria_id INT,
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

INSERT INTO tb_categorias (nome, descricao) VALUES
("Bovinos", "Carnes de gado"),
("Aves", "Carnes de aves"),
("Suínos", "Carnes de porco"),
("Peixes", "Carnes de peixe"),
("Outros", "Outros tipos de carne");

INSERT INTO tb_produtos (nome, descricao, valor, estoque, categoria_id) VALUES
("Picanha", "Carne de picanha bovina", 75.00, 50, 1),
("Frango", "Carne de frango", 20.00, 200, 2),
("Costelinha", "Costelinha de porco", 35.00, 80, 3),
("Salmão", "Filé de salmão", 100.00, 30, 4),
("Alcatra", "Carne de alcatra bovina", 60.00, 40, 1),
("Tilápia", "Filé de tilápia", 45.00, 70, 4),
("Linguiça", "Linguiça de porco", 25.00, 90, 3),
("Coxinha da Asa", "Coxinha da asa de frango", 15.00, 150, 2);

SELECT * FROM tb_produtos WHERE valor > 50.00;
SELECT * FROM tb_produtos WHERE valor BETWEEN 50.00 AND 150.00;
SELECT * FROM tb_produtos WHERE nome LIKE "%C%";

SELECT * FROM tb_produtos 
INNER JOIN tb_categorias
ON tb_produtos.categoria_id = tb_categorias.id;

SELECT * FROM tb_produtos
INNER JOIN tb_categorias
ON tb_produtos.categoria_id = tb_categorias.id 
WHERE tb_categorias.nome IN ("Aves", "Peixes");