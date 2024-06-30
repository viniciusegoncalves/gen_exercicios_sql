CREATE SCHEMA IF NOT EXISTS db_construindo_vidas;
USE db_construindo_vidas;

CREATE TABLE tb_categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
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
("Hidráulica", "Produtos hidráulicos"),
("Elétrica", "Produtos elétricos"),
("Ferramentas", "Ferramentas manuais e elétricas"),
("Tintas", "Tintas e acessórios para pintura"),
("Materiais de Construção", "Materiais básicos de construção");

INSERT INTO tb_produtos (nome, descricao, valor, estoque, categoria_id) VALUES
("Chave de Fenda", "Chave de fenda simples", 15.00, 100, 3),
("Martelo", "Martelo de aço", 30.00, 50, 3),
("Fio Elétrico", "Fio de cobre", 75.00, 200, 2),
("Tinta Branca", "Tinta branca 18L", 120.00, 40, 4),
("Tubo PVC", "Tubo de PVC 100mm", 20.00, 150, 1),
("Cimento", "Saco de cimento 50kg", 25.00, 300, 5),
("Parafuso", "Parafuso de aço", 10.00, 500, 5),
("Interruptor", "Interruptor simples", 12.00, 200, 2);

SELECT * FROM tb_produtos WHERE valor > 100.00;
SELECT * FROM tb_produtos WHERE valor BETWEEN 70.00 AND 150.00;
SELECT * FROM tb_produtos WHERE nome LIKE "%C%";

SELECT * FROM tb_produtos 
INNER JOIN tb_categorias
ON tb_produtos.categoria_id = tb_categorias.id;

SELECT * FROM tb_produtos
INNER JOIN tb_categorias
ON tb_produtos.categoria_id = tb_categorias.id 
WHERE tb_categorias.nome = "Hidráulica";