-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema irctc
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema irctc
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `irctc` ;
USE `irctc` ;

-- -----------------------------------------------------
-- Table `irctc`.`train`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `irctc`.`train` (
  `train_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `start_station` VARCHAR(45) NOT NULL,
  `end_station` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`train_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `irctc`.`reservation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `irctc`.`reservation` (
  `reservation_id` INT NOT NULL,
  `seat_no` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`reservation_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `irctc`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `irctc`.`customer` (
  `customer_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `age` INT NOT NULL,
  `contact` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `irctc`.`ticket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `irctc`.`ticket` (
  `ticket_id` INT NOT NULL,
  `cost` INT NOT NULL,
  `date&time` DATETIME NOT NULL,
  `is_reserved` TINYINT NOT NULL,
  `reservation_reservation_id` INT NULL,
  `customer_customer_id` INT NOT NULL,
  `train_train_id` INT NOT NULL,
  PRIMARY KEY (`ticket_id`, `train_train_id`),
  INDEX `fk_ticket_reservation1_idx` (`reservation_reservation_id` ASC) VISIBLE,
  INDEX `fk_ticket_customer1_idx` (`customer_customer_id` ASC) VISIBLE,
  INDEX `fk_ticket_train1_idx` (`train_train_id` ASC) VISIBLE,
  UNIQUE INDEX `customer_customer_id_UNIQUE` (`customer_customer_id` ASC) VISIBLE,
  UNIQUE INDEX `date&time_UNIQUE` (`date&time` ASC) VISIBLE,
  CONSTRAINT `fk_ticket_reservation1`
    FOREIGN KEY (`reservation_reservation_id`)
    REFERENCES `irctc`.`reservation` (`reservation_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ticket_customer1`
    FOREIGN KEY (`customer_customer_id`)
    REFERENCES `irctc`.`customer` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ticket_train1`
    FOREIGN KEY (`train_train_id`)
    REFERENCES `irctc`.`train` (`train_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
