-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ecommerce
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ecommerce
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ecommerce` ;
USE `ecommerce` ;

-- -----------------------------------------------------
-- Table `ecommerce`.`supplier`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`supplier` (
  `supplier_id` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`supplier_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce`.`items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`items` (
  `item_id` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `cost` DOUBLE NOT NULL,
  `supplier_supplier_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`item_id`, `supplier_supplier_id`),
  INDEX `fk_items_supplier_idx` (`supplier_supplier_id` ASC) VISIBLE,
  CONSTRAINT `fk_items_supplier`
    FOREIGN KEY (`supplier_supplier_id`)
    REFERENCES `ecommerce`.`supplier` (`supplier_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`customer` (
  `customer_id` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`order` (
  `order_id` VARCHAR(45) NOT NULL,
  `order_date` DATETIME NOT NULL,
  `cost` DOUBLE NOT NULL,
  `quantity` INT NOT NULL,
  `customer_customer_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`order_id`, `customer_customer_id`),
  INDEX `fk_order_customer1_idx` (`customer_customer_id` ASC) VISIBLE,
  CONSTRAINT `fk_order_customer1`
    FOREIGN KEY (`customer_customer_id`)
    REFERENCES `ecommerce`.`customer` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce`.`ordered_items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`ordered_items` (
  `order_order_id` VARCHAR(45) NOT NULL,
  `items_item_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`order_order_id`, `items_item_id`),
  INDEX `fk_order_has_items_items1_idx` (`items_item_id` ASC) VISIBLE,
  INDEX `fk_order_has_items_order1_idx` (`order_order_id` ASC) VISIBLE,
  CONSTRAINT `fk_order_has_items_order1`
    FOREIGN KEY (`order_order_id`)
    REFERENCES `ecommerce`.`order` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_has_items_items1`
    FOREIGN KEY (`items_item_id`)
    REFERENCES `ecommerce`.`items` (`item_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
