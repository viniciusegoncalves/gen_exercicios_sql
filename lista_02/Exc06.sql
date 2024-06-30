CREATE SCHEMA IF NOT EXISTS db_curso_da_minha_vida;
USE db_curso_da_minha_vida;

CREATE TABLE tb_categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(255)
);
CREATE TABLE tb_cursos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(255),
    valor DECIMAL(10, 2) NOT NULL,
    carga_horaria INT NOT NULL,
    categoria_id INT,
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

INSERT INTO tb_categorias (nome, descricao) VALUES
("Programação", "Cursos de programação em geral"),
("Design", "Cursos de design e criação visual"),
("Administração", "Cursos de administração de empresas"),
("Marketing", "Cursos de marketing digital"),
("Idiomas", "Cursos de idiomas estrangeiros");

INSERT INTO tb_cursos (nome, descricao, valor, carga_horaria, categoria_id) VALUES
("Curso de Java Avançado", "Aprenda Java de forma avançada", 800.00, 40, 1),
("Curso de Photoshop", "Domine o Photoshop para design gráfico", 600.00, 30, 2),
("Curso de Gestão Empresarial", "Conceitos essenciais de gestão", 500.00, 20, 3),
("Curso de Marketing Digital", "Estratégias modernas de marketing", 900.00, 45, 4),
("Curso de Inglês Intermediário", "Aprimore seu inglês intermediário", 700.00, 50, 5),
("Curso de Python para Data Science", "Fundamentos de Python para ciência de dados", 1000.00, 60, 1),
("Curso de Illustrator", "Técnicas avançadas de ilustração digital", 850.00, 35, 2),
("Curso de Espanhol Básico", "Introdução ao espanhol básico", 600.00, 40, 5);

SELECT * FROM tb_cursos WHERE valor > 500.00;
SELECT * FROM tb_cursos WHERE valor BETWEEN 600.00 AND 1000.00;
SELECT * FROM tb_cursos WHERE nome LIKE "%J%";

SELECT * FROM tb_cursos 
INNER JOIN tb_categorias
ON tb_cursos.categoria_id = tb_categorias.id;

SELECT * FROM tb_cursos
INNER JOIN tb_categorias
ON tb_cursos.categoria_id = tb_categorias.id 
WHERE tb_categorias.nome = "Programação";