-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: pizzeria
-- ------------------------------------------------------
-- Server version	8.0.41

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `id_city` int NOT NULL,
  `city` varchar(45) NOT NULL,
  `provinces_id_province` int NOT NULL,
  PRIMARY KEY (`id_city`),
  KEY `fk_cities_provinces_idx` (`provinces_id_province`),
  CONSTRAINT `fk_cities_provinces` FOREIGN KEY (`provinces_id_province`) REFERENCES `provinces` (`id_province`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,'Barcelone',8),(2,'L\'Hospitalet de Llobregat',8),(3,'Badalona',8),(4,'Sabadell',8),(5,'Terrassa',8);
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id_customer` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `surname` varchar(45) DEFAULT NULL,
  `address` varchar(70) DEFAULT NULL,
  `cp` varchar(10) DEFAULT NULL,
  `phone_number` varchar(45) DEFAULT NULL,
  `cities_id_city` int NOT NULL,
  PRIMARY KEY (`id_customer`),
  KEY `fk_customers_cities1_idx` (`cities_id_city`),
  CONSTRAINT `fk_customers_cities1` FOREIGN KEY (`cities_id_city`) REFERENCES `cities` (`id_city`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Antonio','González','Calle de la Paz, 15','08001','612345678',1),(2,'María','Fernández','Avenida del Mar, 23','08002','609876543',2),(3,'José','Lopez','Carrer de la Creu, 45','08003','617654321',3),(4,'Carmen','Martínez','Calle del Sol, 10','08004','623456789',4),(5,'Juan','Sánchez','Carrer de l\'Estrella, 30','08005','634567890',5),(6,'Laura','Rodríguez','Carrer de la Rambla, 12','08006','655432109',1),(7,'Miguel','Díaz','Avenida de Catalunya, 18','08007','661234567',2),(8,'Pedro','Álvarez','Calle de Santa Clara, 8','08008','662345678',3),(9,'Ana','Pérez','Carrer del Mar, 50','08009','673456789',4),(10,'Francisco','Gómez','Calle de la Sierra, 3','08010','681234567',5);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_orders`
--

DROP TABLE IF EXISTS `delivery_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_orders` (
  `delivery_order_id` int NOT NULL AUTO_INCREMENT,
  `delivery_datetime` datetime DEFAULT NULL,
  `employees_id_employees` int NOT NULL,
  `orders_id_order` int NOT NULL,
  PRIMARY KEY (`delivery_order_id`),
  KEY `fk_delivery_orders_employees1_idx` (`employees_id_employees`),
  KEY `fk_delivery_orders_orders1_idx` (`orders_id_order`),
  CONSTRAINT `fk_delivery_orders_employees1` FOREIGN KEY (`employees_id_employees`) REFERENCES `employees` (`id_employees`),
  CONSTRAINT `fk_delivery_orders_orders1` FOREIGN KEY (`orders_id_order`) REFERENCES `orders` (`id_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_orders`
--

LOCK TABLES `delivery_orders` WRITE;
/*!40000 ALTER TABLE `delivery_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `delivery_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `id_employees` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `surname` varchar(45) NOT NULL,
  `nif` varchar(20) NOT NULL,
  `phone_number` varchar(45) DEFAULT NULL,
  `role` enum('Kitchen','Delivery') DEFAULT NULL,
  `stores_id_store` int NOT NULL,
  PRIMARY KEY (`id_employees`),
  KEY `fk_employees_stores1_idx` (`stores_id_store`),
  CONSTRAINT `fk_employees_stores1` FOREIGN KEY (`stores_id_store`) REFERENCES `stores` (`id_store`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id_order` int NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `order_type` enum('Home delivery','Store collection') DEFAULT NULL,
  `total_price` decimal(5,2) DEFAULT NULL,
  `customers_id_customer` int NOT NULL,
  `stores_id_store` int NOT NULL,
  `employees_id_employees` int NOT NULL,
  `delivery_orders_delivery_order_id` int DEFAULT NULL,
  PRIMARY KEY (`id_order`),
  KEY `fk_orders_customers1_idx` (`customers_id_customer`),
  KEY `fk_orders_stores1_idx` (`stores_id_store`),
  KEY `fk_orders_employees1_idx` (`employees_id_employees`),
  CONSTRAINT `fk_orders_customers1` FOREIGN KEY (`customers_id_customer`) REFERENCES `customers` (`id_customer`),
  CONSTRAINT `fk_orders_employees1` FOREIGN KEY (`employees_id_employees`) REFERENCES `employees` (`id_employees`),
  CONSTRAINT `fk_orders_stores1` FOREIGN KEY (`stores_id_store`) REFERENCES `stores` (`id_store`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2025-04-08 11:20:32','Home delivery',25.50,1,1,1,NULL),(2,'2025-04-08 11:20:32','Store collection',18.75,2,3,2,NULL),(3,'2025-04-08 11:20:32','Home delivery',32.00,3,2,3,NULL),(4,'2025-04-08 11:20:32','Store collection',15.90,4,5,1,NULL),(5,'2025-04-08 11:20:32','Home delivery',21.20,5,4,2,NULL),(6,'2025-04-08 11:20:32','Home delivery',28.90,6,1,3,NULL),(7,'2025-04-08 11:20:32','Store collection',19.50,7,3,1,NULL),(8,'2025-04-08 11:20:32','Home delivery',23.60,8,2,2,NULL),(9,'2025-04-08 11:20:32','Store collection',17.15,9,5,3,NULL),(10,'2025-04-08 11:20:32','Home delivery',30.40,10,4,1,NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_products`
--

DROP TABLE IF EXISTS `orders_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_products` (
  `order_product_id` int NOT NULL AUTO_INCREMENT,
  `quantity` int DEFAULT '1',
  `orders_id_order` int NOT NULL,
  `products_id_product` int NOT NULL,
  PRIMARY KEY (`order_product_id`),
  KEY `fk_orders_products_orders1_idx` (`orders_id_order`),
  KEY `fk_orders_products_products1_idx` (`products_id_product`),
  CONSTRAINT `fk_orders_products_orders1` FOREIGN KEY (`orders_id_order`) REFERENCES `orders` (`id_order`),
  CONSTRAINT `fk_orders_products_products1` FOREIGN KEY (`products_id_product`) REFERENCES `products` (`id_product`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_products`
--

LOCK TABLES `orders_products` WRITE;
/*!40000 ALTER TABLE `orders_products` DISABLE KEYS */;
INSERT INTO `orders_products` VALUES (1,2,1,1),(2,1,1,3),(3,1,2,2),(4,1,3,1),(5,2,3,4),(6,1,4,5),(7,2,5,2),(8,1,6,3),(9,1,6,5),(10,1,7,4),(11,3,8,1),(12,1,9,2),(13,2,9,3),(14,1,10,5);
/*!40000 ALTER TABLE `orders_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pizza_categories`
--

DROP TABLE IF EXISTS `pizza_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pizza_categories` (
  `id_pizza_categories` int NOT NULL AUTO_INCREMENT,
  `pizza_category` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_pizza_categories`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pizza_categories`
--

LOCK TABLES `pizza_categories` WRITE;
/*!40000 ALTER TABLE `pizza_categories` DISABLE KEYS */;
INSERT INTO `pizza_categories` VALUES (1,'GENERAL'),(2,'VEGAN');
/*!40000 ALTER TABLE `pizza_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id_product` int NOT NULL AUTO_INCREMENT,
  `description` text,
  `image` blob,
  `price` decimal(5,2) DEFAULT NULL,
  `product_name` enum('Pizza','Burger','Drink') DEFAULT NULL,
  PRIMARY KEY (`id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provinces`
--

DROP TABLE IF EXISTS `provinces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provinces` (
  `id_province` int NOT NULL,
  `province` varchar(45) NOT NULL,
  PRIMARY KEY (`id_province`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provinces`
--

LOCK TABLES `provinces` WRITE;
/*!40000 ALTER TABLE `provinces` DISABLE KEYS */;
INSERT INTO `provinces` VALUES (8,'Barcelona'),(17,'Girona');
/*!40000 ALTER TABLE `provinces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stores`
--

DROP TABLE IF EXISTS `stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stores` (
  `id_store` int NOT NULL AUTO_INCREMENT,
  `address` varchar(60) DEFAULT NULL,
  `cp` varchar(10) DEFAULT NULL,
  `cities_id_city` int NOT NULL,
  PRIMARY KEY (`id_store`),
  KEY `fk_stores_cities1_idx` (`cities_id_city`),
  CONSTRAINT `fk_stores_cities1` FOREIGN KEY (`cities_id_city`) REFERENCES `cities` (`id_city`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stores`
--

LOCK TABLES `stores` WRITE;
/*!40000 ALTER TABLE `stores` DISABLE KEYS */;
INSERT INTO `stores` VALUES (1,'Barcelona','08001',1),(2,'L\'Hospitalet de Llobregat','08901',2),(3,'Badalona','08911',3),(4,'Sabadell','08201',4),(5,'Terrassa','08221',5);
/*!40000 ALTER TABLE `stores` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-08 13:39:03
