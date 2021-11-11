-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema imdb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema imdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `imdb` ;
USE `imdb` ;

-- -----------------------------------------------------
-- Table `imdb`.`movie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `imdb`.`movie` (
  `movie_id` INT NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  `description` TEXT NULL,
  `rating` DOUBLE NULL,
  PRIMARY KEY (`movie_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `imdb`.`tvseries`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `imdb`.`tvseries` (
  `series_id` INT NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  `description` TEXT NULL,
  `seasons` VARCHAR(45) NOT NULL,
  `rating` DOUBLE NULL,
  PRIMARY KEY (`series_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `imdb`.`actors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `imdb`.`actors` (
  `actor_id` INT NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `remuneration` DOUBLE NULL,
  PRIMARY KEY (`actor_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `imdb`.`movie_has_actors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `imdb`.`movie_has_actors` (
  `movie_movie_id` INT NOT NULL,
  `actors_actor_id` INT NOT NULL,
  PRIMARY KEY (`movie_movie_id`, `actors_actor_id`),
  INDEX `fk_movie_has_actors_actors1_idx` (`actors_actor_id` ASC) VISIBLE,
  INDEX `fk_movie_has_actors_movie_idx` (`movie_movie_id` ASC) VISIBLE,
  CONSTRAINT `fk_movie_has_actors_movie`
    FOREIGN KEY (`movie_movie_id`)
    REFERENCES `imdb`.`movie` (`movie_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_movie_has_actors_actors1`
    FOREIGN KEY (`actors_actor_id`)
    REFERENCES `imdb`.`actors` (`actor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `imdb`.`tvseries_has_actors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `imdb`.`tvseries_has_actors` (
  `tvseries_series_id` INT NOT NULL,
  `actors_actor_id` INT NOT NULL,
  PRIMARY KEY (`tvseries_series_id`, `actors_actor_id`),
  INDEX `fk_tvseries_has_actors_actors1_idx` (`actors_actor_id` ASC) VISIBLE,
  INDEX `fk_tvseries_has_actors_tvseries1_idx` (`tvseries_series_id` ASC) VISIBLE,
  CONSTRAINT `fk_tvseries_has_actors_tvseries1`
    FOREIGN KEY (`tvseries_series_id`)
    REFERENCES `imdb`.`tvseries` (`series_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tvseries_has_actors_actors1`
    FOREIGN KEY (`actors_actor_id`)
    REFERENCES `imdb`.`actors` (`actor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
