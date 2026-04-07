CREATE DATABASE  IF NOT EXISTS `newssite` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `newssite`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: newssite
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id_comment` int NOT NULL AUTO_INCREMENT,
  `user` int DEFAULT NULL,
  `message` varchar(150) DEFAULT NULL,
  `date_publish` date DEFAULT NULL,
  `post` int DEFAULT NULL,
  PRIMARY KEY (`id_comment`),
  KEY `fk_post_idx` (`post`),
  KEY `fk_user_idx` (`user`),
  CONSTRAINT `fk_post` FOREIGN KEY (`post`) REFERENCES `posts` (`id_post`),
  CONSTRAINT `fk_user` FOREIGN KEY (`user`) REFERENCES `users` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,3,'выфвфвфыфвф','2026-03-30',2);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id_post` int NOT NULL AUTO_INCREMENT,
  `post_name` varchar(100) DEFAULT NULL,
  `description` text,
  `user` int DEFAULT NULL,
  `image` text,
  `date_create` date DEFAULT NULL,
  PRIMARY KEY (`id_post`),
  KEY `fk_user_idx` (`user`),
  KEY `fk_useres_idx` (`user`),
  CONSTRAINT `fk_useres` FOREIGN KEY (`user`) REFERENCES `users` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (2,'Запись №3','Короткое превью для карточки записи №3',3,'https://picsum.photos/seed/post-3/1200/750','2026-03-30'),(3,'Запись №4','Короткое превью для карточки записи №4',3,'https://picsum.photos/seed/post-4/1200/750','2026-03-30'),(4,'Запись №5','Короткое превью для карточки записи №5',3,'https://picsum.photos/seed/post-5/1200/750','2026-03-30'),(5,'Запись №6','Короткое превью для карточки записи №6',3,'https://picsum.photos/seed/post-6/1200/750','2026-03-30'),(6,'Запись №7','Короткое превью для карточки записи №7',3,'https://picsum.photos/seed/post-7/1200/750','2026-03-30'),(7,'Запись №8','Короткое превью для карточки записи №8',3,'https://picsum.photos/seed/post-8/1200/750','2026-03-30'),(8,'Запись №9','Короткое превью для карточки записи №9',3,'https://picsum.photos/seed/post-9/1200/750','2026-03-30'),(9,'Запись №10','Короткое превью для карточки записи №10',3,'https://picsum.photos/seed/post-10/1200/750','2026-03-30'),(10,'Запись №11','Короткое превью для карточки записи №11',3,'https://picsum.photos/seed/post-11/1200/750','2026-03-30'),(11,'Запись №12','Короткое превью для карточки записи №12',3,'https://picsum.photos/seed/post-12/1200/750','2026-03-30'),(17,'Черная дыра','Просто дыра',3,'https://picsum.photos/seed/post-1/1200/750','2026-04-01');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reputations`
--

DROP TABLE IF EXISTS `reputations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reputations` (
  `id_reputation` int NOT NULL AUTO_INCREMENT,
  `like` enum('like','dislile','none') DEFAULT NULL,
  `user` int DEFAULT NULL,
  `post` int DEFAULT NULL,
  PRIMARY KEY (`id_reputation`),
  KEY `fk_poster_idx` (`post`),
  KEY `fk_user_like_idx` (`user`),
  CONSTRAINT `fk_poster` FOREIGN KEY (`post`) REFERENCES `posts` (`id_post`),
  CONSTRAINT `fk_user_like` FOREIGN KEY (`user`) REFERENCES `users` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reputations`
--

LOCK TABLES `reputations` WRITE;
/*!40000 ALTER TABLE `reputations` DISABLE KEYS */;
INSERT INTO `reputations` VALUES (2,'like',3,2),(6,'like',5,17);
/*!40000 ALTER TABLE `reputations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id_role` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_role`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Пользователь'),(2,'Менеджер');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `login` varchar(90) DEFAULT NULL,
  `password` varchar(90) DEFAULT NULL,
  `phone` varchar(90) DEFAULT NULL,
  `role` int DEFAULT NULL,
  PRIMARY KEY (`id_user`),
  KEY `fk_role_idx` (`role`),
  CONSTRAINT `fk_role` FOREIGN KEY (`role`) REFERENCES `roles` (`id_role`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (3,'qwe','Canlet30','432432',1),(4,'Doppy','Canlet31','6546464',2),(5,'Alex','Canlet32','79659451886',1),(6,'qwe1234','qwe12345','+79659451',1);
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

-- Dump completed on 2026-04-07 13:11:25
