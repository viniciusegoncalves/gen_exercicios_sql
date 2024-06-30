CREATE SCHEMA IF NOT EXISTS db_pizzaria_legal;
USE db_pizzaria_legal ;
CREATE TABLE IF NOT EXISTS db_pizzaria_legal.tb_categoria (
  id BIGINT NOT NULL AUTO_INCREMENT,
  tipo VARCHAR(255) NOT NULL,
  massa VARCHAR(255) NOT NULL,
  PRIMARY KEY (id))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS db_pizzaria_legal.tb_pizza (
  id BIGINT NOT NULL AUTO_INCREMENT,
  sabor VARCHAR(255) NOT NULL,
  valor DECIMAL(6,2) NOT NULL,
  tamanho VARCHAR(1) NOT NULL,
  descricao VARCHAR(255) NOT NULL,
  categoria_id BIGINT NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_tb_pizza_tb_categoria
  FOREIGN KEY (categoria_id)
  REFERENCES db_pizzaria_legal.tb_categoria(id)
);

INSERT INTO tb_categoria(tipo, massa)
VALUES
    ("Salgada", "Massa fina"),
    ("Doce", "Massa fina"),
    ("Salgada", "Massa tradicional"),
    ("doce", "Massa tradicional"),
    ("Salgada", "Massa sem glúten"),
    ("Doce", "Massa sem glúten");
    

INSERT INTO tb_pizza(sabor, valor, tamanho, descricao, categoria_id)
VALUES
    ("Margherita", 39.90, "G" , "DELICIOSA PIZZA DE MARTHERITA!", 1),
    ("Portuguesa", 49.90, "M" , "DELICIOSA PIZZA DE PORTUGUESA!", 3),
    ("Brocolis", 59.90, "P" , "DELICIOSA PIZZA DE BROCOLIS!", 5),
    ("Banana", 39.90, "G" , "DELICIOSA PIZZA DE BANANA!", 2),
    ("Doce de Leite", 44.90, "G" , "DELICIOSA PIZZA DE DOCE DE LEITE!", 4),
    ("Chocolate", 39.90, "P" , "DELICIOSA PIZZA DE CHOCOLATE!", 6),
    ("Quatro queijos", 49.90, "M" , "DELICIOSA PIZZA DE QUATRO QUEIJOS!", 1),
    ("Frango com catupiry", 49.90, "M" , "DELICIOSA PIZZA DE FRANGO COM CATUPIRY!", 3);

SELECT * FROM tb_categoria;
SELECT * FROM tb_pizza;

SELECT * FROM tb_pizza WHERE valor > 45.00;

SELECT * FROM tb_pizza WHERE valor BETWEEN 50 AND 100;

SELECT * FROM tb_pizza WHERE sabor like "%m%";

SELECT * FROM tb_pizza as tp INNER JOIN tb_categoria as tc ON tp.categoria_id = tc.id;

SELECT * FROM tb_pizza as tp INNER JOIN tb_categoria as tc ON tp.categoria_id = tc.id WHERE tc.tipo = "Doce";



