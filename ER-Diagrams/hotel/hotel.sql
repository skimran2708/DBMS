-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema hotel_booking
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema hotel_booking
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hotel_booking` ;
USE `hotel_booking` ;

-- -----------------------------------------------------
-- Table `hotel_booking`.`hotel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel_booking`.`hotel` (
  `hotel_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`hotel_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotel_booking`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel_booking`.`customer` (
  `customer_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `age` INT NOT NULL,
  `email` VARCHAR(45) NULL,
  `phone` INT NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotel_booking`.`reservation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel_booking`.`reservation` (
  `reservation_id` INT NOT NULL,
  `date&time` DATETIME NOT NULL,
  `customer_customer_id` INT NULL,
  `hotel_hotel_id` INT NOT NULL,
  PRIMARY KEY (`reservation_id`, `hotel_hotel_id`),
  INDEX `fk_reservation_customer1_idx` (`customer_customer_id` ASC) VISIBLE,
  INDEX `fk_reservation_hotel1_idx` (`hotel_hotel_id` ASC) VISIBLE,
  UNIQUE INDEX `hotel_hotel_id_UNIQUE` (`hotel_hotel_id` ASC) VISIBLE,
  UNIQUE INDEX `customer_customer_id_UNIQUE` (`customer_customer_id` ASC) VISIBLE,
  CONSTRAINT `fk_reservation_customer1`
    FOREIGN KEY (`customer_customer_id`)
    REFERENCES `hotel_booking`.`customer` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reservation_hotel1`
    FOREIGN KEY (`hotel_hotel_id`)
    REFERENCES `hotel_booking`.`hotel` (`hotel_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
