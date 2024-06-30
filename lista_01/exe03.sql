CREATE DATABASE db_escola;

USE db_escola;

CREATE TABLE tb_estudantes(
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100),
nota DECIMAL(10,2),
ano INT,
professor VARCHAR(100)
);

INSERT INTO tb_estudantes(nome, nota, ano, professor)
values
('Joaozinho', 8.0, 2, 'Marcos'),
('Mariazinha', 5.0, 1, 'Lola'),
('Carlinho', 6.0, 3, 'Adelaide'),
('Joaninha', 7.0, 4, 'Marcos'),
('Jorel', 9.0, 3, 'Marcos'),
('Lola', 4.0, 4, 'Adelaide'),
('Nico', 6.0, 1, 'Lola'),
('Billy', 8.0, 3, 'Lola');

SELECT * FROM tb_estudantes WHERE nota > 7.0;
SELECT * FROM tb_estudantes WHERE nota < 7.0;

UPDATE tb_estudantes SET nota = 7.5 WHERE nome = 'Nico';

SELECT * FROM tb_estudantes;
