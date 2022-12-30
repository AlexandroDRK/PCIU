-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema PCIU
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema PCIU
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `PCIU` DEFAULT CHARACTER SET utf8mb3 ;
USE `PCIU` ;

-- -----------------------------------------------------
-- Table `PCIU`.`Curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PCIU`.`Curso` (
  `id` INT NOT NULL,
  `nome` VARCHAR(90) NOT NULL,
  `descricao` VARCHAR(150) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `PCIU`.`Turma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PCIU`.`Turma` (
  `id` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `curso_id` INT NOT NULL,
  `periodo` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Turma_Curso_idx` (`curso_id` ASC) VISIBLE,
  CONSTRAINT `fk_Turma_Curso`
    FOREIGN KEY (`curso_id`)
    REFERENCES `PCIU`.`Curso` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `PCIU`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PCIU`.`Usuario` (
  `matricula` INT NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `senha` VARCHAR(32) NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `tipo` ENUM('Aluno', 'Professor') NOT NULL DEFAULT 'Aluno',
  PRIMARY KEY (`matricula`),
  UNIQUE INDEX `matrícula_UNIQUE` (`matricula` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `PCIU`.`Comunicado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PCIU`.`Comunicado` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(150) NOT NULL,
  `corpo` VARCHAR(3000) NOT NULL,
  `horario` DATETIME NOT NULL,
  `turma_id` INT NOT NULL,
  `autor_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Comunicado_Turma1_idx` (`turma_id` ASC) VISIBLE,
  INDEX `fk_Comunicado_Usuário1_idx` (`autor_id` ASC) VISIBLE,
  CONSTRAINT `fk_Comunicado_Turma1`
    FOREIGN KEY (`turma_id`)
    REFERENCES `PCIU`.`Turma` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Comunicado_Usuário1`
    FOREIGN KEY (`autor_id`)
    REFERENCES `PCIU`.`Usuario` (`matricula`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `PCIU`.`Comentario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PCIU`.`Comentario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `corpo` VARCHAR(1000) NOT NULL,
  `horario` DATETIME NOT NULL,
  `comunicado_id` INT NOT NULL,
  PRIMARY KEY (`id`, `comunicado_id`),
  INDEX `fk_Comentário_Comunicado1_idx` (`comunicado_id` ASC) VISIBLE,
  CONSTRAINT `fk_Comentário_Comunicado1`
    FOREIGN KEY (`comunicado_id`)
    REFERENCES `PCIU`.`Comunicado` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `PCIU`.`Comentario_Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PCIU`.`Comentario_Usuario` (
  `comentario_id` INT NOT NULL,
  `usuario_id` INT NOT NULL,
  PRIMARY KEY (`comentario_id`, `usuario_id`),
  INDEX `fk_Comentário_has_Usuário_Usuário1_idx` (`usuario_id` ASC) VISIBLE,
  INDEX `fk_Comentário_has_Usuário_Comentário1_idx` (`comentario_id` ASC) VISIBLE,
  CONSTRAINT `fk_Comentário_has_Usuário_Comentário1`
    FOREIGN KEY (`comentario_id`)
    REFERENCES `PCIU`.`Comentario` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Comentário_has_Usuário_Usuário1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `PCIU`.`Usuario` (`matricula`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `PCIU`.`Turma_Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PCIU`.`Turma_Usuario` (
  `turma_id` INT NOT NULL,
  `usuario_id` INT NOT NULL,
  PRIMARY KEY (`turma_id`, `usuario_id`),
  INDEX `fk_Turma_has_Usuário_Usuário1_idx` (`usuario_id` ASC) VISIBLE,
  CONSTRAINT `fk_Turma_has_Usuário_Turma1`
    FOREIGN KEY (`turma_id`)
    REFERENCES `PCIU`.`Turma` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Turma_has_Usuário_Usuário1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `PCIU`.`Usuario` (`matricula`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
