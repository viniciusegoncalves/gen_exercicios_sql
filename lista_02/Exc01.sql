SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS db_game ;
USE db_game ;
CREATE TABLE IF NOT EXISTS db_game.tb_classe (
  id BIGINT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(255) NOT NULL,
  descricao VARCHAR(255) NOT NULL,
  PRIMARY KEY (id))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS db_game.tb_personagem (
  id BIGINT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(255) NOT NULL,
  nivel INT NOT NULL,
  ataque DECIMAL(6,2) NOT NULL,
  defesa DECIMAL(6,2) NOT NULL,
  velocidade DECIMAL(6,2) NOT NULL,
  classe_id BIGINT NOT NULL,
  PRIMARY KEY (id),
  INDEX fk_tb_personagem_tb_classe_idx (classe_id ASC),
  CONSTRAINT fk_tb_personagem_tb_classe
    FOREIGN KEY (classe_id)
    REFERENCES db_game.tb_classe (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


INSERT INTO tb_classe(nome, descricao)
VALUES
    ("Mago", "Classe para quem gosta de usar muita magia"),
    ("Guerreiro", "Classe para combate físico"),
    ("Arqueiro", "Classe para lutar a distância"),
    ("Sacerdote", "Classe para dar suporte a equipe"),
    ("Bardo", "Classe para buffar a equipe");



INSERT INTO tb_personagem(nome, nivel, ataque, defesa, velocidade, classe_id)
VALUES
    ("Joaozinho", 10, 2000, 4, 12, 1),
    ("Pedrinho", 20, 1500, 7, 10, 2),
    ("Mariaziha", 37, 3000, 15, 25, 3),
    ("Joaninha", 45, 1200, 10, 10, 4),
    ("Zequinha", 77, 1000, 35, 37, 5),
    ("Amandinha", 7, 2800, 5, 5, 1),
    ("Carlinhos", 40, 1900, 30, 10, 2),
    ("Marquinho", 27, 1800, 32, 15, 3);

SELECT * FROM tb_classe;
SELECT * FROM tb_personagem;

SELECT * FROM tb_personagem WHERE ataque > 2000;

SELECT * FROM tb_personagem WHERE ataque BETWEEN 1000 AND 2000;

SELECT * FROM tb_personagem WHERE nome like "%c%";

SELECT * FROM tb_personagem as tp INNER JOIN tb_classe as tc ON tp.classe_id = tc.id;

SELECT * FROM tb_personagem as tp INNER JOIN tb_classe as tc ON tp.classe_id = tc.id WHERE tc.nome = "Mago";



