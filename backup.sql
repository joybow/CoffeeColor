-- MySQL dump 10.13  Distrib 8.2.0, for macos13.5 (arm64)
--
-- Host: localhost    Database: CoffeeColor
-- ------------------------------------------------------
-- Server version	8.2.0

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
-- Table structure for table `active_storage_attachments`
--

DROP TABLE IF EXISTS `active_storage_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `active_storage_attachments` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `record_type` varchar(255) NOT NULL,
  `record_id` bigint NOT NULL,
  `blob_id` bigint NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_active_storage_attachments_uniqueness` (`record_type`,`record_id`,`name`,`blob_id`),
  KEY `index_active_storage_attachments_on_blob_id` (`blob_id`),
  CONSTRAINT `fk_rails_c3b3935057` FOREIGN KEY (`blob_id`) REFERENCES `active_storage_blobs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `active_storage_attachments`
--

LOCK TABLES `active_storage_attachments` WRITE;
/*!40000 ALTER TABLE `active_storage_attachments` DISABLE KEYS */;
INSERT INTO `active_storage_attachments` VALUES (50,'post_images','Post',1,50,'2023-12-18 07:08:24'),(51,'post_images','Post',1,51,'2023-12-18 07:08:24'),(52,'post_images','Post',1,52,'2023-12-18 07:08:24'),(53,'post_images','Post',1,53,'2023-12-18 07:08:24'),(54,'post_images','Post',1,54,'2023-12-18 07:08:24'),(55,'image','ActiveStorage::VariantRecord',1,55,'2023-12-18 08:01:10'),(56,'image','ActiveStorage::VariantRecord',2,56,'2023-12-18 08:01:10'),(57,'image','ActiveStorage::VariantRecord',3,57,'2023-12-18 08:01:10'),(58,'image','ActiveStorage::VariantRecord',4,58,'2023-12-18 08:01:10'),(59,'image','ActiveStorage::VariantRecord',5,59,'2023-12-18 08:01:12'),(67,'post_images','Post',9,67,'2023-12-25 04:36:01'),(80,'post_images','Post',12,80,'2024-01-12 10:49:06'),(81,'post_images','Post',12,81,'2024-01-12 10:49:06'),(85,'user_image','User',1,85,'2024-01-15 01:22:44'),(96,'post_images','Post',11,96,'2024-03-07 01:42:40'),(100,'user_image','User',6,100,'2024-03-07 01:48:07');
/*!40000 ALTER TABLE `active_storage_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `active_storage_blobs`
--

DROP TABLE IF EXISTS `active_storage_blobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `active_storage_blobs` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `content_type` varchar(255) DEFAULT NULL,
  `metadata` text,
  `service_name` varchar(255) NOT NULL,
  `byte_size` bigint NOT NULL,
  `checksum` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_active_storage_blobs_on_key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `active_storage_blobs`
--

LOCK TABLES `active_storage_blobs` WRITE;
/*!40000 ALTER TABLE `active_storage_blobs` DISABLE KEYS */;
INSERT INTO `active_storage_blobs` VALUES (50,'c7ke68584szog8hyiqgs0otk8z7z','IMG_0003.png','image/png','{\"identified\":true,\"width\":2048,\"height\":2048,\"analyzed\":true}','local',5979146,'FR0O2swe9rCiPleqyfkCYw==','2023-12-18 07:08:24'),(51,'ur0u9n50ytd7zm1s4t4pg2jkc2cp','IMG_5413.jpeg','image/jpeg','{\"identified\":true,\"width\":1109,\"height\":1479,\"analyzed\":true}','local',556189,'LAIheuzkh2TpYnEVoANzDw==','2023-12-18 07:08:24'),(52,'uxfs4cs8y5zl2zzongnhjb04037f','IMG_5412.jpeg','image/jpeg','{\"identified\":true,\"width\":1109,\"height\":1479,\"analyzed\":true}','local',541948,'sKLavZU3G39qDQKP6ZfStg==','2023-12-18 07:08:24'),(53,'e5vvgwnvzgfzp55kstddvvq6uorv','IMG_5411.jpeg','image/jpeg','{\"identified\":true,\"width\":1109,\"height\":1479,\"analyzed\":true}','local',409295,'fgEWwAJyiOb9uogjk8FmhQ==','2023-12-18 07:08:24'),(54,'m6fz9v125cyh50kn7do8v1gjrsv3','IMG_5410.jpeg','image/jpeg','{\"identified\":true,\"width\":1109,\"height\":1479,\"analyzed\":true}','local',386784,'U/z+PdmNtUeKZUsItZt4Cg==','2023-12-18 07:08:24'),(55,'cje261n9780rhtn0xfoohhgvaz38','IMG_5413.jpeg','image/jpeg','{\"identified\":true,\"width\":1109,\"height\":1479,\"analyzed\":true}','local',561560,'9BnUywKtCa4klyY+3qa2rw==','2023-12-18 08:01:10'),(56,'t9ihory75o2xgjg4o4nyyuk4kpl9','IMG_5412.jpeg','image/jpeg','{\"identified\":true,\"width\":1109,\"height\":1479,\"analyzed\":true}','local',551505,'6ikHD2Kua8kgshUb1mdjeA==','2023-12-18 08:01:10'),(57,'rn53z85ujoufwhm79s18drdzzvks','IMG_5410.jpeg','image/jpeg','{\"identified\":true,\"width\":1109,\"height\":1479,\"analyzed\":true}','local',408774,'i36bMVYF8GUW+3h/f9hAzw==','2023-12-18 08:01:10'),(58,'r2o338yxdr8yeihymuuulkwnob5i','IMG_5411.jpeg','image/jpeg','{\"identified\":true,\"width\":1109,\"height\":1479,\"analyzed\":true}','local',430147,'eg0NKojeCSZggO/dQfhONQ==','2023-12-18 08:01:10'),(59,'0ed6z1vdjezksqzfk0hd2z6dvyr5','IMG_0003.png','image/png','{\"identified\":true,\"width\":2048,\"height\":2048,\"analyzed\":true}','local',3750224,'2ptbzYXq175yYSAiEd5Dvg==','2023-12-18 08:01:12'),(67,'pmyo8k2lfca9thgrqa5vs95yeian','IMG_5474.jpeg','image/jpeg','{\"identified\":true,\"width\":3024,\"height\":4032,\"analyzed\":true}','local',2978915,'qjXJYl04ZXnpysx0+yLKeg==','2023-12-25 04:36:01'),(80,'i4sea5z180nax74fzz0n4519xqux','IMG_5698.jpeg','image/jpeg','{\"identified\":true,\"width\":3024,\"height\":4032,\"analyzed\":true}','local',4744826,'MnVr8JecKTDllpAF8/0wBA==','2024-01-12 10:49:06'),(81,'fmnoarorrn2iev20ep7nviscr6gm','IMG_5697.jpeg','image/jpeg','{\"identified\":true,\"width\":3024,\"height\":4032,\"analyzed\":true}','local',4458518,'nYsnr4rYkSxdy0brXd6K6A==','2024-01-12 10:49:06'),(85,'mvy9qvrclthrhj2vnmbiej6089c2','IMG_5432.jpeg','image/jpeg','{\"identified\":true,\"width\":3024,\"height\":4032,\"analyzed\":true}','local',2616837,'piaM6kE0wSgFBfnnZBnj7g==','2024-01-15 01:22:44'),(96,'nd4bmn2syzfhkh92g03ripoyfoh0','IMG_5944.jpeg','image/jpeg','{\"identified\":true,\"width\":2048,\"height\":2048,\"analyzed\":true}','local',582664,'yTlwZNgEigIo6/JTtRrRDg==','2024-03-07 01:42:40'),(100,'2lpi6f5idaf5matt3chbx7xsr2o8','IMG_5944.jpeg','image/jpeg','{\"identified\":true,\"width\":2048,\"height\":2048,\"analyzed\":true}','local',582664,'yTlwZNgEigIo6/JTtRrRDg==','2024-03-07 01:48:07');
/*!40000 ALTER TABLE `active_storage_blobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `active_storage_variant_records`
--

DROP TABLE IF EXISTS `active_storage_variant_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `active_storage_variant_records` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `blob_id` bigint NOT NULL,
  `variation_digest` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_active_storage_variant_records_uniqueness` (`blob_id`,`variation_digest`),
  CONSTRAINT `fk_rails_993965df05` FOREIGN KEY (`blob_id`) REFERENCES `active_storage_blobs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `active_storage_variant_records`
--

LOCK TABLES `active_storage_variant_records` WRITE;
/*!40000 ALTER TABLE `active_storage_variant_records` DISABLE KEYS */;
INSERT INTO `active_storage_variant_records` VALUES (5,50,'ZdVGo0ad//BX1vZ3s5nvYkfU7qk='),(1,51,'DzcJmuzh7H3pzYOg1gZBDu0yLco='),(2,52,'DzcJmuzh7H3pzYOg1gZBDu0yLco='),(4,53,'DzcJmuzh7H3pzYOg1gZBDu0yLco='),(3,54,'DzcJmuzh7H3pzYOg1gZBDu0yLco=');
/*!40000 ALTER TABLE `active_storage_variant_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admins` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_admins_on_email` (`email`),
  UNIQUE KEY `index_admins_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (2,'永田純一','juntwolead2@gmail.com','$2a$12$zT.JBqLolOe6Fk.1doaNGOzAPk8DozwYv9OiXvlxpPNRKMWgoCf1S',NULL,NULL,NULL,'2024-01-22 00:17:25.243802','2024-01-22 00:17:25.243802');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ar_internal_metadata`
--

DROP TABLE IF EXISTS `ar_internal_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ar_internal_metadata`
--

LOCK TABLES `ar_internal_metadata` WRITE;
/*!40000 ALTER TABLE `ar_internal_metadata` DISABLE KEYS */;
INSERT INTO `ar_internal_metadata` VALUES ('environment','development','2023-12-12 07:21:25.712609','2023-12-12 07:21:25.712609');
/*!40000 ALTER TABLE `ar_internal_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `post_id` int NOT NULL,
  `content` text NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (10,1,1,'コメント','2023-12-21 11:08:04.831747','2023-12-21 11:08:04.831747'),(11,1,9,'コメント返し！','2023-12-25 05:10:17.751993','2023-12-25 05:10:17.751993'),(21,1,11,'すごい良い滝ー！','2024-01-09 03:31:26.322273','2024-01-09 03:31:26.322273'),(22,1,12,'一路可愛い！','2024-01-12 10:49:19.611365','2024-01-12 10:49:19.611365'),(23,5,1,'面白い変化ですね！','2024-01-30 05:35:49.975218','2024-01-30 05:35:49.975218'),(63,1,9,'test','2024-02-06 10:17:45.276880','2024-02-06 10:17:45.276880'),(66,7,1,'永　他順です。','2024-02-08 05:13:44.257549','2024-02-08 05:13:44.257549'),(71,7,1,'コメントしますよー！','2024-02-09 00:14:22.649317','2024-02-09 00:14:22.649317'),(73,7,1,'記念パピコ','2024-02-09 00:21:23.428764','2024-02-09 00:21:23.428764'),(74,7,9,'testtest','2024-02-21 11:35:03.875240','2024-02-21 11:35:03.875240'),(75,6,9,'美味しそう！','2024-02-21 12:20:36.164382','2024-02-21 12:20:36.164382'),(76,6,9,'これ限定品！','2024-02-21 12:30:14.086390','2024-02-21 12:30:14.086390'),(77,6,9,'hugahuga','2024-02-21 12:31:56.320089','2024-02-21 12:31:56.320089');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorites` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `post_id` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_favorites_on_user_id` (`user_id`),
  KEY `index_favorites_on_post_id` (`post_id`),
  CONSTRAINT `fk_rails_d15744e438` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_rails_dcaf44a136` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites`
--

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
INSERT INTO `favorites` VALUES (19,1,11,'2024-01-09 03:31:32.249147','2024-01-09 03:31:32.249147'),(32,7,1,'2024-02-08 05:13:50.688250','2024-02-08 05:13:50.688250'),(33,7,12,'2024-02-21 11:32:01.195628','2024-02-21 11:32:01.195628'),(34,6,11,'2024-02-21 11:44:05.443727','2024-02-21 11:44:05.443727');
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `visitor_id` int NOT NULL,
  `visited_id` int NOT NULL,
  `post_id` int DEFAULT NULL,
  `comment_id` int DEFAULT NULL,
  `action` varchar(255) NOT NULL,
  `checked` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_notifications_on_visitor_id` (`visitor_id`),
  KEY `index_notifications_on_visited_id` (`visited_id`),
  KEY `index_notifications_on_post_id` (`post_id`),
  KEY `index_notifications_on_comment_id` (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (1,1,1,9,63,'comment',1,'2024-02-06 10:17:45.472623','2024-02-06 10:17:45.472623'),(4,7,1,1,NULL,'like',1,'2024-02-08 05:13:50.931925','2024-02-08 05:15:32.942891'),(5,7,1,NULL,NULL,'follow',1,'2024-02-09 00:03:48.784476','2024-02-09 00:13:30.038256'),(8,7,1,1,73,'comment',1,'2024-02-09 00:21:23.576028','2024-02-09 00:21:43.219264'),(9,7,5,1,73,'comment',0,'2024-02-09 00:21:23.702568','2024-02-09 00:21:23.702568'),(10,7,2,NULL,NULL,'follow',0,'2024-02-20 06:49:51.116593','2024-02-20 06:49:51.116593'),(11,1,2,NULL,NULL,'follow',0,'2024-02-21 03:48:52.937082','2024-02-21 03:48:52.937082'),(12,1,6,NULL,NULL,'follow',1,'2024-02-21 11:01:01.425552','2024-02-21 11:43:54.949245'),(13,1,7,NULL,NULL,'follow',1,'2024-02-21 11:01:02.998420','2024-02-21 11:34:42.372562'),(14,7,1,12,NULL,'like',1,'2024-02-21 11:32:01.204998','2024-02-21 11:32:15.916376'),(15,6,7,NULL,NULL,'follow',1,'2024-02-21 11:34:28.568414','2024-02-21 11:34:42.361589'),(16,7,1,9,74,'comment',1,'2024-02-21 11:35:03.880874','2024-02-21 11:35:21.939221'),(17,6,1,11,NULL,'like',1,'2024-02-21 11:44:05.451619','2024-02-21 11:44:24.293234'),(18,6,1,9,75,'comment',0,'2024-02-21 12:20:36.188497','2024-02-21 12:20:36.188497'),(19,6,7,9,75,'comment',0,'2024-02-21 12:20:36.194917','2024-02-21 12:20:36.194917'),(20,6,1,9,76,'comment',0,'2024-02-21 12:30:14.095966','2024-02-21 12:30:14.095966'),(21,6,7,9,76,'comment',0,'2024-02-21 12:30:14.105081','2024-02-21 12:30:14.105081'),(22,6,1,9,77,'comment',0,'2024-02-21 12:31:56.343796','2024-02-21 12:31:56.343796'),(23,6,7,9,77,'comment',0,'2024-02-21 12:31:56.350111','2024-02-21 12:31:56.350111'),(24,6,5,NULL,NULL,'follow',0,'2024-02-22 03:29:34.369506','2024-02-22 03:29:34.369506');
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `user_id` int DEFAULT NULL,
  `coffee_name` int DEFAULT NULL,
  `coffee_from` int DEFAULT NULL,
  `review` int DEFAULT NULL,
  `coffee_color` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'丸山','美味しそうですねー',1,NULL,NULL,NULL,NULL,'2023-12-12 07:56:58.581390','2023-12-18 07:08:24.308099'),(9,'クリスマスといえば！','ケーキ！\r\nマリオットで可愛い形のケーキを購入！\r\n味は…まぁまぁでした\r\n',1,NULL,NULL,NULL,NULL,'2023-12-25 04:36:01.581358','2023-12-25 04:36:01.589719'),(11,'新年明けました！','嫁の実家のメンバーと一緒にデイキャンプ！\r\nハマりそうですし、自分のテントが欲しくなりました！\r\n面白かったー',1,NULL,NULL,NULL,NULL,'2024-01-09 03:30:54.263861','2024-03-07 01:42:40.879531'),(12,'一路です！楓です！','位置楓です！',1,NULL,NULL,NULL,NULL,'2024-01-12 10:48:50.384327','2024-01-12 10:49:06.432667'),(48,'test','test dan',6,NULL,NULL,NULL,NULL,'2024-03-07 01:12:13.305106','2024-03-07 01:24:22.763213'),(49,'テst','ate',6,NULL,NULL,NULL,NULL,'2024-03-07 11:52:58.325913','2024-03-07 11:52:58.325913'),(50,'test','test',6,NULL,NULL,NULL,NULL,'2024-03-07 11:53:34.906713','2024-03-07 11:53:34.906713');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relationships`
--

DROP TABLE IF EXISTS `relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relationships` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `follower_id` int DEFAULT NULL,
  `followed_id` int DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=216 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relationships`
--

LOCK TABLES `relationships` WRITE;
/*!40000 ALTER TABLE `relationships` DISABLE KEYS */;
INSERT INTO `relationships` VALUES (143,5,3,'2024-01-30 23:48:10.339101','2024-01-30 23:48:10.339101'),(160,1,1,'2024-01-31 07:14:41.896378','2024-01-31 07:14:41.896378'),(161,1,1,'2024-01-31 07:14:49.665737','2024-01-31 07:14:49.665737'),(162,1,1,'2024-01-31 07:14:55.816280','2024-01-31 07:14:55.816280'),(163,1,1,'2024-01-31 07:14:58.980744','2024-01-31 07:14:58.980744'),(176,6,1,'2024-02-05 04:06:48.945965','2024-02-05 04:06:48.945965'),(191,1,4,'2024-02-05 04:30:05.655446','2024-02-05 04:30:05.655446'),(196,7,4,'2024-02-07 23:31:50.075826','2024-02-07 23:31:50.075826'),(213,1,7,'2024-02-21 11:01:08.115889','2024-02-21 11:01:08.115889'),(214,6,7,'2024-02-21 11:34:28.555221','2024-02-21 11:34:28.555221');
/*!40000 ALTER TABLE `relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20231110060324'),('20231116050929'),('20231116052543'),('20231202032626'),('20231207032349'),('20231207235959'),('20231213005423'),('20231213015533'),('20240111003636'),('20240122002104'),('20240123022411');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tasks` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `start_time` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `plan` text,
  `place` text,
  `user_id` int DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` VALUES (1,'2024-06-06 13:00:00','Life meets Coffee Live!!','ライブイベント',NULL,NULL,1,'2024-02-13 04:33:11.862341','2024-02-13 04:33:11.862341'),(2,'2024-06-06 13:00:00','Life meets Coffee Live!!','ライブイベント',NULL,NULL,1,'2024-02-13 04:34:43.836474','2024-02-13 04:34:43.836474');
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `postal_code` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `is_roaster` int NOT NULL,
  `introduction` text,
  `local` int NOT NULL,
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `confirmation_token` varchar(255) DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `confirmation_sent_at` datetime DEFAULT NULL,
  `unconfirmed_email` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `deleted_flg` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'永田純一','4660044','名古屋市昭和区桜山町','09063526518',0,NULL,23,'juntwolead2@gmail.com','$2a$12$o9TB7lVdumM/F0lkTTnfzuVamMpsZ2jfaCJaAQHMGjv7kf.r52zcC',NULL,NULL,NULL,'t6eAVWkNJxxrvXQxPPWW','2023-12-12 07:23:46','2023-12-12 07:23:31',NULL,'2023-12-12 07:23:31.500226','2024-01-15 01:22:44.050905',0),(2,'永田一路','466-0044','名古屋市中区','0800000000',0,NULL,42,'test@test.com','$2a$12$AivXeiO0z2buNbJ10Ifm2.LyirUOFbNOOp8M0VSUaGzMt2MVYPnXy',NULL,NULL,NULL,'CjiDk7kfx_TkRNEQiz8v',NULL,'2023-12-18 01:46:29',NULL,'2023-12-18 01:46:29.401190','2023-12-18 01:46:29.401190',0),(3,'永田楓','466-0045','名古屋市錦','0800000001',2,NULL,20,'test1@test1.com','$2a$12$y9tMuve1oEieThU4BWvciOlULEAYjg0JS85I0KI6EddhcXCE0BEim',NULL,NULL,NULL,'6b5wZy1hGkWf6xemtL7y',NULL,'2023-12-18 01:46:33',NULL,'2023-12-18 01:46:33.476592','2023-12-18 01:46:33.476592',0),(4,'エディーコーフィー','4660044','名古屋市昭和区桜山町','09063526518',1,NULL,23,'twolead.almighty.junrock@ezweb.ne.jp','$2a$12$8.E/62ne/D1SHVO0rE9jjul/af1pbbRZnvyGFjOSFskD.MsfPIg9S',NULL,NULL,NULL,'8k6ggzYXJkx_Ve6xfEyx',NULL,'2023-12-20 00:21:35',NULL,'2023-12-20 00:21:35.990474','2023-12-20 00:21:35.990474',0),(5,'エディーコーフィー','4660044','名古屋市昭和区桜山町','09063526518',2,NULL,23,'junichidayonen@gmail.com','$2a$12$ZozKSyWPRkTgbwP1mJQ/n.IK4f2FuwTSUeUY5NBwskzF9CuDqTOcu',NULL,NULL,NULL,'EZ7-zStoQykkUFtDmRua','2023-12-20 00:29:39','2023-12-20 00:24:06',NULL,'2023-12-20 00:24:06.082608','2023-12-20 00:29:39.864371',0),(6,'永　友蔵','555-5555','北海道　でっかいどう','09063526518',0,NULL,1,'juntwolead2+test@gmail.com','$2a$12$/D5OBaTeIUfElq16NN3p0.wnjoOUF7b4ZiDqsxRr2tRbrxOU.fS/G',NULL,NULL,NULL,'ahCcYaGwGDbzBLQHPByX','2024-02-05 04:01:54','2024-02-05 04:01:22',NULL,'2024-02-05 04:01:22.521368','2024-03-07 01:48:07.626368',0),(7,'永　他順','4660044','宮城なのよねー','0002000',1,NULL,4,'juntwolead2+test3@gmail.com','$2a$12$rYWwnBznbgss4AnpoZAkv.UDilu/yJ4GqcIclfLtkkaE9W4rjgtDW',NULL,NULL,NULL,'aR97yBfeTztN-DPMS-a4','2024-02-07 05:40:45','2024-02-07 05:40:22',NULL,'2024-02-07 05:40:22.645056','2024-02-07 05:40:45.823970',0);
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

-- Dump completed on 2024-03-08  8:36:28
