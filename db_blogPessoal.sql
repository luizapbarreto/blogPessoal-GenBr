-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db_blogpessoal
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_blogpessoal
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_blogpessoal` DEFAULT CHARACTER SET utf8 ;
USE `db_blogpessoal` ;

-- -----------------------------------------------------
-- Table `db_blogpessoal`.`tb_temas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_blogpessoal`.`tb_temas` (
  `id` BIGINT NOT NULL,
  `descrição` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_blogpessoal`.`tb_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_blogpessoal`.`tb_usuario` (
  `id` BIGINT NOT NULL,
  `nome` VARCHAR(255) NOT NULL,
  `usuario` VARCHAR(255) NOT NULL,
  `senha` VARCHAR(255) NOT NULL,
  `foto` VARCHAR(255) NULL,
  `tipo` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_blogpessoal`.`tb_postagem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_blogpessoal`.`tb_postagem` (
  `id` BIGINT NOT NULL,
  `titulo` VARCHAR(255) NOT NULL,
  `texto` VARCHAR(255) NOT NULL,
  `data` DATETIME(1) NULL,
  `tb_temas_id` BIGINT NOT NULL,
  `tb_usuario_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tb_postagem_tb_temas_idx` (`tb_temas_id` ASC) VISIBLE,
  INDEX `fk_tb_postagem_tb_usuario1_idx` (`tb_usuario_id` ASC) VISIBLE,
  CONSTRAINT `fk_tb_postagem_tb_temas`
    FOREIGN KEY (`tb_temas_id`)
    REFERENCES `db_blogpessoal`.`tb_temas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_postagem_tb_usuario1`
    FOREIGN KEY (`tb_usuario_id`)
    REFERENCES `db_blogpessoal`.`tb_usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
