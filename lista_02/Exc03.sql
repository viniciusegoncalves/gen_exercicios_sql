CREATE SCHEMA IF NOT EXISTS db_farmacia_bem_estar;
USE db_farmacia_bem_estar;

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
("Medicamentos", "Produtos farmacêuticos para tratamento de doenças"),
("Cosméticos", "Produtos para cuidados pessoais e beleza"),
("Suplementos", "Produtos para suplementação alimentar e esportiva"),
("Higiene", "Produtos de higiene pessoal"),
("Infantil", "Produtos voltados para o público infantil");

INSERT INTO tb_produtos (nome, descricao, valor, estoque, categoria_id) VALUES
("Paracetamol", "Analgésico e antitérmico", 12.50, 100, 1),
("Shampoo Anticaspa", "Shampoo para tratamento de caspa", 25.00, 50, 2),
("Vitamina C", "Suplemento de vitamina C", 35.00, 80, 3),
("Sabonete Líquido", "Sabonete líquido para higiene pessoal", 15.00, 60, 4),
("Fralda Descartável", "Fralda descartável tamanho M", 40.00, 200, 5),
("Creme Hidratante", "Creme hidratante para pele", 60.00, 30, 2),
("Ômega 3", "Suplemento de ômega 3", 80.00, 40, 3),
("Protetor Solar", "Protetor solar FPS 50", 55.00, 70, 2);

SELECT * FROM tb_produtos WHERE valor > 50.00;
SELECT * FROM tb_produtos WHERE valor BETWEEN 5.00 AND 60.00;
SELECT * FROM tb_produtos WHERE nome LIKE "%C%";

SELECT * FROM tb_produtos 
INNER JOIN tb_categorias ON tb_produtos.categoria_id = tb_categorias.id;

SELECT * FROM tb_produtos
INNER JOIN tb_categorias ON tb_produtos.categoria_id = tb_categorias.id
WHERE tb_categorias.nome = "Cosméticos";