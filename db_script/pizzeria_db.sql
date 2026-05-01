-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: pizzeria_pm02
-- ------------------------------------------------------
-- Server version	8.0.41

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `menu_items`
--

DROP TABLE IF EXISTS `menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_items` (
  `item_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `description` text,
  `price` decimal(10,2) DEFAULT NULL,
  `category` varchar(45) DEFAULT NULL,
  `image` text,
  `offer_id` int DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `offer_fk_idx` (`offer_id`),
  CONSTRAINT `offer_fk` FOREIGN KEY (`offer_id`) REFERENCES `special_offers` (`offer_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_items`
--

LOCK TABLES `menu_items` WRITE;
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
INSERT INTO `menu_items` VALUES (2,'Пепперони','Острая пицца с пепперони и сыром',520.00,'Пицца','pepperoni.jpg',NULL),(3,'Гавайская','Пицца с курицей и ананасами',490.00,'Пицца','hawaiian.jpg',NULL),(4,'Цезарь с курицей','Салат с курицей, сухариками и соусом Цезарь',380.00,'Салаты','caesar.jpg',NULL),(5,'Греческий салат','Салат с фетой, оливками и овощами',350.00,'Салаты','greek.jpg',2),(6,'Карбонара','Паста с беконом и сливочным соусом',420.00,'Паста','carbonara.jpg',3),(7,'Болоньезе','Паста с мясным соусом',440.00,'Паста','bolognese.jpg',NULL),(8,'Картофель фри','Хрустящий картофель с солью',180.00,'Закуски','fries.jpg',2),(9,'Крылышки BBQ','Куриные крылышки в соусе барбекю',320.00,'Закуски','wings.jpg',NULL),(10,'Морс клюквенный','Освежающий клюквенный морс',120.00,'Напитки','mors.jpg',4),(11,'Лимонад','Домашний лимонад с мятой',150.00,'Напитки','lemonade.jpg',5),(12,'Чизкейк','Нежный чизкейк с ягодным соусом',280.00,'Десерты','cheesecake.jpg',NULL),(13,'Тирамису','Итальянский десерт с маскарпоне',300.00,'Десерты','tiramisu.jpg',4);
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `item_id` int DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `unit_price` decimal(10,2) DEFAULT NULL,
  KEY `item_m_fk_idx` (`item_id`),
  KEY `order_id_idx` (`order_id`),
  CONSTRAINT `item_m_fk` FOREIGN KEY (`item_id`) REFERENCES `menu_items` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (2,21,1,520.00),(8,21,2,180.00),(2,30,1,520.00),(4,22,1,380.00),(6,22,1,420.00),(9,22,1,320.00),(3,23,2,490.00),(10,23,2,120.00),(12,23,1,280.00),(5,25,1,350.00),(7,25,1,440.00),(2,24,2,520.00),(11,24,3,150.00),(13,24,1,300.00),(5,27,1,350.00),(8,27,1,180.00),(11,27,1,150.00),(4,28,1,380.00),(6,28,1,420.00),(9,28,1,320.00),(2,29,1,520.00),(13,29,2,300.00);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `order_type` varchar(45) DEFAULT NULL,
  `delivery_address` text,
  `customer_comment` text,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `item_id` int DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `user_fk_idx` (`user_id`),
  KEY `items_fk_idx` (`item_id`),
  CONSTRAINT `items_fk` FOREIGN KEY (`item_id`) REFERENCES `menu_items` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (21,2,'2024-01-15','Доставка','ул. Ленина, д.10, кв.5','Позвоните перед доставкой',1250.00,'Доставлен',NULL),(22,2,'2024-01-16','Самовывоз',NULL,NULL,520.00,'Готово',NULL),(23,2,'2024-01-17','Доставка','пр. Мира, д.25, кв.12','Без лука пожалуйста',970.00,'В пути',NULL),(24,2,'2024-01-18','Доставка','ул. Ленина, д.10, кв.5',NULL,1500.00,'В пути',NULL),(25,2,'2024-01-19','Самовывоз',NULL,'Острый соус отдельно',630.00,'Отменен',NULL),(26,2,'2024-01-20','Доставка','ул. Гагарина, д.8, кв.3','Домофон 123',1840.00,'Доставлен',NULL),(27,2,'2024-01-21','Доставка','б-р Победы, д.15','Вход со двора',450.00,'Доставлен',NULL),(28,2,'2024-01-22','Самовывоз',NULL,NULL,780.00,'Готово',NULL),(29,2,'2024-01-23','Доставка','ул. Ленина, д.10, кв.5','Два пакета соевого соуса',1120.00,'В пути',NULL),(30,2,'2024-01-24','Доставка','ул. Советская, д.45, кв.8',NULL,2100.00,'Доставлен',NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `review_id` int NOT NULL AUTO_INCREMENT,
  `rating` int DEFAULT NULL,
  `comment` text,
  `review_date` date DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `item_id` int DEFAULT NULL,
  PRIMARY KEY (`review_id`),
  KEY `menu_item_id_idx` (`item_id`),
  KEY `users_fk_idx` (`user_id`),
  CONSTRAINT `menu_item_id` FOREIGN KEY (`item_id`) REFERENCES `menu_items` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `users_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,3,'fadf',NULL,2,NULL),(3,4,'Хорошая пицца, но немного острая','2024-01-17',2,2),(4,5,'Очень нежный чизкейк','2024-01-19',2,12),(5,3,'Салат свежий, но маловато заправки','2024-01-20',2,4),(6,5,'Лучший лимонад в городе!','2024-01-21',2,11),(7,4,'Крылышки вкусные, но долго везли','2024-01-22',2,9),(8,5,'Карбонара просто божественна','2024-01-23',2,6),(9,2,'Картошка была холодная','2024-01-24',2,8),(10,4,'Хорошая паста, большая порция','2024-01-25',2,7),(11,5,'Пицца Пепперони - огонь!','2024-01-26',2,2),(12,3,'Обычный морс, ничего особенного','2024-01-27',2,10),(13,5,'Тирамису великолепен','2024-01-28',2,13),(14,4,'Греческий салат свежий и вкусный','2024-01-29',2,5),(15,5,'Очень вкусно, буду заказывать еще','2024-01-30',2,3);
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'client'),(2,'operator'),(3,'admin'),(4,'manager');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `special_offers`
--

DROP TABLE IF EXISTS `special_offers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `special_offers` (
  `offer_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `discount_percentage` int DEFAULT NULL,
  `valid_from` date DEFAULT NULL,
  `valid_to` date DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`offer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `special_offers`
--

LOCK TABLES `special_offers` WRITE;
/*!40000 ALTER TABLE `special_offers` DISABLE KEYS */;
INSERT INTO `special_offers` VALUES (2,'Счастливые часы',10,'2024-01-01','2024-12-31',NULL),(3,'Комбо-обед',20,'2024-02-01','2024-12-31',NULL),(4,'Скидка для именинников',25,'2024-01-01','2024-12-31',NULL),(5,'Первая доставка',30,'2024-03-01','2024-09-30',NULL);
/*!40000 ALTER TABLE `special_offers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `contact_info` varchar(45) DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `role_fk_idx` (`role_id`),
  CONSTRAINT `role_fk` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','1234','Админ','email',3),(2,'client','client1','Клиент','email',1),(3,'opera','oper','Оператор','email',2),(4,'man','manager','Менеджер','email',4);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-01 17:38:16
