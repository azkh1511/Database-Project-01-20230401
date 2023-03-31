-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemonDB` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- This schema was created for a stub table

-- -----------------------------------------------------
-- Schema mydb
--
-- This schema was created for a stub table
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` ;
USE `LittleLemonDB` ;

-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Staffs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Staffs` (
  `staff_id` INT NOT NULL,
  `first_name` VARCHAR(100) NOT NULL,
  `last_name` VARCHAR(100) NOT NULL,
  `shift` VARCHAR(100) NOT NULL,
  `salary` INT NOT NULL,
  `position` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`staff_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Customers` (
  `Customer_id` INT NOT NULL,
  `first_name` VARCHAR(100) NOT NULL,
  `last_name` VARCHAR(100) NOT NULL,
  `phone_num` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`Customer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Bookings` (
  `booking_id` INT NOT NULL,
  `booking_date` DATE NOT NULL,
  `table_num` INT NOT NULL,
  `customer_id` INT NOT NULL,
  `staff_id` INT NULL,
  PRIMARY KEY (`booking_id`),
  INDEX `staff_key_idx` (`staff_id` ASC) VISIBLE,
  INDEX `cust_key_idx` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `staff_key`
    FOREIGN KEY (`staff_id`)
    REFERENCES `LittleLemonDB`.`Staffs` (`staff_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `customer_key`
    FOREIGN KEY (`customer_id`)
    REFERENCES `LittleLemonDB`.`Customers` (`Customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Delivery`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Delivery` (
  `delivery_id` INT NOT NULL,
  `delivery_date` DATE NOT NULL,
  `delivery_status` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`delivery_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Menu` (
  `item_id` INT NOT NULL,
  `item_name` VARCHAR(100) NOT NULL,
  `item_price` DECIMAL(10,2) NOT NULL,
  `item_category` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`item_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Orders` (
  `order_id` INT NOT NULL,
  `order_date` DATE NOT NULL,
  `order_quantity` INT NOT NULL,
  `total_cost` DECIMAL(10,2) NOT NULL,
  `customer_id` INT NOT NULL,
  `delivery_id` INT NOT NULL,
  `item_id` INT NOT NULL,
  `staff_id` INT NOT NULL,
  PRIMARY KEY (`order_id`),
  INDEX `cust_key_idx` (`customer_id` ASC) VISIBLE,
  INDEX `del_key_idx` (`delivery_id` ASC) VISIBLE,
  INDEX `item_key_idx` (`item_id` ASC) VISIBLE,
  INDEX `staff_key_idx` (`staff_id` ASC) VISIBLE,
  CONSTRAINT `cust_key`
    FOREIGN KEY (`customer_id`)
    REFERENCES `LittleLemonDB`.`Customers` (`Customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `del_key`
    FOREIGN KEY (`delivery_id`)
    REFERENCES `LittleLemonDB`.`Delivery` (`delivery_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `item_key`
    FOREIGN KEY (`item_id`)
    REFERENCES `LittleLemonDB`.`Menu` (`item_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `sta_key`
    FOREIGN KEY (`staff_id`)
    REFERENCES `LittleLemonDB`.`Staffs` (`staff_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `mydb` ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
