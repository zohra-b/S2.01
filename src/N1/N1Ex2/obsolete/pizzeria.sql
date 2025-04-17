-- -----------------------------------------------------
-- Schema pizzeria
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `pizzeria` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `pizzeria` ;

-- -----------------------------------------------------
-- Table `pizzeria`.`provinces`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`provinces` (
  `id_province` INT NOT NULL,
  `provinces` VARCHAR(45) NULL,
  PRIMARY KEY (`id_province`))



-- -----------------------------------------------------
-- Table `pizzeria`.`cities`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`cities` (
  `id_city` INT NOT NULL,
  `city` VARCHAR(45) NULL,
  `provinces_id_province` INT NOT NULL,
  PRIMARY KEY (`id_city`),
  INDEX `fk_cities_provinces_idx` (`provinces_id_province` ASC) VISIBLE,
  CONSTRAINT `fk_cities_provinces`
    FOREIGN KEY (`provinces_id_province`)
    REFERENCES `pizzeria`.`provinces` (`id_province`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

-- -----------------------------------------------------
-- Table `pizzeria`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`customers` (
  `id_customer` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `surname` VARCHAR(45) NULL,
  `address` VARCHAR(70) NULL,
  `cp` VARCHAR(10) NULL,
  `city` VARCHAR(45) NULL,
  `phone_number` VARCHAR(45) NULL,
  `cities_id_city` INT NOT NULL,

  PRIMARY KEY (`id_customer`),
  INDEX `fk_customers_cities1_idx` (`cities_id_city` ASC) VISIBLE,
  CONSTRAINT `fk_customers_cities1`
    FOREIGN KEY (`cities_id_city`)
    REFERENCES `pizzeria`.`cities` (`id_city`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

 ALTER TABLE customers
 DROP COLUMN city;

-- -----------------------------------------------------
-- Table `pizzeria`.`stores`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `pizzeria`.`stores` (
  `id_store` INT NOT NULL,
  `address` VARCHAR(60) NULL,
  `cp` VARCHAR(10) NULL,
  `cities_id_city` INT NOT NULL,
  PRIMARY KEY (`id_store`),
  INDEX `fk_stores_cities1_idx` (`cities_id_city` ASC) VISIBLE,
  CONSTRAINT `fk_stores_cities1`
    FOREIGN KEY (`cities_id_city`)
    REFERENCES `pizzeria`.`cities` (`id_city`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)


-- -----------------------------------------------------
-- Table `pizzeria`.`employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`employees` (
  `id_employees` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `surname` VARCHAR(45) NOT NULL,
  `nif` VARCHAR(20) NOT NULL,
  `phone_number` VARCHAR(45) NULL,
  `role` ENUM('Kitchen', 'Delivery') NULL,
  `stores_id_store` INT NOT NULL,
  PRIMARY KEY (`id_employees`),
  INDEX `fk_employees_stores1_idx` (`stores_id_store` ASC) VISIBLE,
  CONSTRAINT `fk_employees_stores1`
    FOREIGN KEY (`stores_id_store`)
    REFERENCES `pizzeria`.`stores` (`id_store`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

-- -----------------------------------------------------
-- Table `pizzeria`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`orders` (
  `id_order` INT NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `order_type` ENUM('Home delivery', 'Store collection') NULL,
  `total_price` DECIMAL(3,2) NULL,
  `customers_id_customer` INT NOT NULL,
  `stores_id_store` INT NOT NULL,
  `employees_id_employees` INT NOT NULL,
  `delivery_orders_delivery_order_id` INT NOT NULL,
  PRIMARY KEY (`id_order`),
  INDEX `fk_orders_customers1_idx` (`customers_id_customer` ASC) VISIBLE,
  INDEX `fk_orders_stores1_idx` (`stores_id_store` ASC) VISIBLE,
  INDEX `fk_orders_employees1_idx` (`employees_id_employees` ASC) VISIBLE,
  CONSTRAINT `fk_orders_customers1`
    FOREIGN KEY (`customers_id_customer`)
    REFERENCES `pizzeria`.`customers` (`id_customer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_stores1`
    FOREIGN KEY (`stores_id_store`)
    REFERENCES `pizzeria`.`stores` (`id_store`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_employees1`
    FOREIGN KEY (`employees_id_employees`)
    REFERENCES `pizzeria`.`employees` (`id_employees`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

-- -----------------------------------------------------
-- Table `pizzeria`.`product_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS product_type (
    product_type_id INT PRIMARY KEY AUTO_INCREMENT,
    product_type_name VARCHAR(50) NOT NULL
);

INSERT INTO product_type (product_type_name) VALUES ('Pizza'), ('Burger'), ('Drink');
ALTER TABLE product_type
ADD COLUMN price DECIMAL(5,2);



-- -----------------------------------------------------
-- Table `pizzeria`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`products` (
  `id_product` INT NOT NULL,
  `product_type` VARCHAR(45) NOT NULL,
  `description` TEXT NULL,
  `image` BLOB NULL,
  `product_type_id` INT NOT NULL,
  PRIMARY KEY (`id_product`),
  INDEX `fk_products_product_type_idx` (`product_type_id` ASC) VISIBLE,
  CONSTRAINT `fk_products_product_type`
    FOREIGN KEY (`product_type_id`)
    REFERENCES `pizzeria`.`product_type` (`product_type_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)


-- -----------------------------------------------------
-- Table `pizzeria`.`pizza_categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`pizza_categories` (
  `id_pizza_categories` INT NOT NULL,
  `pizza_category` VARCHAR(45) NULL,
  PRIMARY KEY (`id_pizza_categories`))

 -- -----------------------------------------------------
 -- Table `pizzeria`.`pizzas`
 -- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`pizzas` (
    `pizza_id` INT NOT NULL AUTO_INCREMENT,
    `pizza_name` VARCHAR(45) NOT NULL,
    `products_id_product` INT NOT NULL,
    `pizza_categories_id_pizza_categories` INT NOT NULL,
    PRIMARY KEY (`pizza_id`),
    INDEX `fk_pizzas_products1_idx` (`products_id_product` ASC) VISIBLE,
    INDEX `fk_pizzas_pizza_categories1_idx` (`pizza_categories_id_pizza_categories` ASC) VISIBLE,
    CONSTRAINT `fk_pizzas_products1`
      FOREIGN KEY (`products_id_product`)
      REFERENCES `pizzeria`.`products` (`id_product`)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
    CONSTRAINT `fk_pizzas_pizza_categories1`
      FOREIGN KEY (`pizza_categories_id_pizza_categories`)
      REFERENCES `pizzeria`.`pizza_categories` (`id_pizza_categories`)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION)

drop table pizzas;

-- -----------------------------------------------------
-- Table `pizzeria`.`delivery_orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`delivery_orders` (
  `delivery_order_id` INT NOT NULL,
  `delivery_datetime` DATETIME NULL,
  `employees_id_employees` INT NOT NULL,
  `orders_id_order` INT NOT NULL,
  PRIMARY KEY (`delivery_order_id`),
  INDEX `fk_delivery_orders_employees1_idx` (`employees_id_employees` ASC) VISIBLE,
  INDEX `fk_delivery_orders_orders1_idx` (`orders_id_order` ASC) VISIBLE,
  CONSTRAINT `fk_delivery_orders_employees1`
    FOREIGN KEY (`employees_id_employees`)
    REFERENCES `pizzeria`.`employees` (`id_employees`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_delivery_orders_orders1`
    FOREIGN KEY (`orders_id_order`)
    REFERENCES `pizzeria`.`orders` (`id_order`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

SET FOREIGN_KEY_CHECKS=0;
ALTER TABLE customers modify id_customer INT NOT NULL AUTO_INCREMENT;
ALTER TABLE delivery_orders modify delivery_order_id INT NOT NULL AUTO_INCREMENT;
ALTER TABLE employees modify id_employees INT NOT NULL AUTO_INCREMENT;
ALTER TABLE orders  modify id_order INT NOT NULL AUTO_INCREMENT;
ALTER TABLE pizza_categories modify id_pizza_categories INT NOT NULL AUTO_INCREMENT;
ALTER TABLE products modify id_product INT NOT NULL AUTO_INCREMENT;
ALTER TABLE stores modify id_store INT NOT NULL AUTO_INCREMENT;
SET FOREIGN_KEY_CHECKS=1;

ALTER TABLE product_type modify product_type_name ENUM('Pizza', 'Burger', 'Drink');
ALTER TABLE product_type modify price DECIMAL(5,2);

ALTER table products drop column product_type;
ALTER TABLE orders_products DROP COLUMN product_id;

ALTER TABLE products DROP FOREIGN KEY fk_products_product_type;
ALTER TABLE products DROP COLUMN product_type_id;
DROP TABLE product_type;