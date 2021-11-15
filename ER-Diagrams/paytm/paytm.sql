-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema paytm
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema paytm
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `paytm` ;
USE `paytm` ;

-- -----------------------------------------------------
-- Table `paytm`.`accounts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `paytm`.`accounts` (
  `account_id` VARCHAR(45) NOT NULL,
  `acc_number` VARCHAR(45) NOT NULL,
  `acc_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`account_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `paytm`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `paytm`.`customer` (
  `customer_id` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `pan` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `paytm`.`branches`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `paytm`.`branches` (
  `branch_id` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `ifsc` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `contact` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`branch_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `paytm`.`customer_accounts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `paytm`.`customer_accounts` (
  `customer_customer_id` VARCHAR(45) NOT NULL,
  `accounts_account_id` VARCHAR(45) NOT NULL,
  `branches_branch_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`customer_customer_id`, `accounts_account_id`, `branches_branch_id`),
  INDEX `fk_customer_has_accounts_accounts1_idx` (`accounts_account_id` ASC) VISIBLE,
  INDEX `fk_customer_has_accounts_customer1_idx` (`customer_customer_id` ASC) VISIBLE,
  INDEX `fk_customer_has_accounts_branches1_idx` (`branches_branch_id` ASC) VISIBLE,
  CONSTRAINT `fk_customer_has_accounts_customer1`
    FOREIGN KEY (`customer_customer_id`)
    REFERENCES `paytm`.`customer` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_customer_has_accounts_accounts1`
    FOREIGN KEY (`accounts_account_id`)
    REFERENCES `paytm`.`accounts` (`account_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_customer_has_accounts_branches1`
    FOREIGN KEY (`branches_branch_id`)
    REFERENCES `paytm`.`branches` (`branch_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
