CREATE TABLE IF NOT EXISTS `pizzeria`.`orders` (
  `id_order` INT NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `order_type` ENUM('Home delivery', 'Store collection') NULL,
  `quantity` INT NULL,
  `total_price` DECIMAL(3,2) NULL,
  `customers_id_customer` INT NOT NULL,
  `customers_cities_id_city` INT NOT NULL,
  `customers_cities_provinces_id_province` INT NOT NULL,
  `stores_id_store` INT NOT NULL,
  `stores_cities_id_city` INT NOT NULL,
  `stores_cities_provinces_id_province` INT NOT NULL,
  `employees_id_employees` INT NOT NULL,
  `employees_stores_id_store` INT NOT NULL,
  `employees_stores_cities_id_city` INT NOT NULL,
  `employees_stores_cities_provinces_id_province` INT NOT NULL,
  PRIMARY KEY (`id_order`),
  INDEX `fk_orders_customers1_idx` (`customers_id_customer` ASC, `customers_cities_id_city` ASC, `customers_cities_provinces_id_province` ASC) VISIBLE,
  INDEX `fk_orders_stores1_idx` (`stores_id_store` ASC, `stores_cities_id_city` ASC, `stores_cities_provinces_id_province` ASC) VISIBLE,
  INDEX `fk_orders_employees1_idx` (`employees_id_employees` ASC, `employees_stores_id_store` ASC, `employees_stores_cities_id_city` ASC, `employees_stores_cities_provinces_id_province` ASC) VISIBLE,
  CONSTRAINT `fk_orders_customers1`
    FOREIGN KEY (`customers_id_customer` , `customers_cities_id_city` , `customers_cities_provinces_id_province`)
    REFERENCES `pizzeria`.`customers` (`id_customer` , `cities_id_city` , `cities_provinces_id_province`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_stores1`
    FOREIGN KEY (`stores_id_store` , `stores_cities_id_city` , `stores_cities_provinces_id_province`)
    REFERENCES `pizzeria`.`stores` (`id_store` , `cities_id_city` , `cities_provinces_id_province`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_employees1`
    FOREIGN KEY (`employees_id_employees` , `employees_stores_id_store` , `employees_stores_cities_id_city` , `employees_stores_cities_provinces_id_province`)
    REFERENCES `pizzeria`.`employees` (`id_employees` , `stores_id_store` , `stores_cities_id_city` , `stores_cities_provinces_id_province`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB

CREATE TABLE IF NOT EXISTS `pizzeria`.`delivery_orders` (
  `delivery_order_id` INT NOT NULL,
  `delivery_datetime` DATETIME NULL,
  `employee_id` INT NULL,
  `order_id` INT NULL,
  `employees_id_employees` INT NOT NULL,
  PRIMARY KEY (`delivery_order_id`),
  INDEX `fk_delivery_orders_employees1_idx` (`employees_id_employees` ASC) VISIBLE,
  CONSTRAINT `fk_delivery_orders_employees1`
    FOREIGN KEY (`employees_id_employees`)
    REFERENCES `pizzeria`.`employees` (`id_employees`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB