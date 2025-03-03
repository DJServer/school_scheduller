-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: localhost    Database: laravel
-- ------------------------------------------------------
-- Server version       8.0.32

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
mysqldump: Error: 'Access denied; you need (at least one of) the PROCESS privilege(s) for this operation' when trying to dump tablespaces

--
-- Table structure for table `bells`
--

DROP TABLE IF EXISTS `bells`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bells` (
                         `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                         `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                         `start_time` time NOT NULL,
                         `end_time` time NOT NULL,
                         `is_break` tinyint(1) NOT NULL DEFAULT '0',
                         `created_at` timestamp NULL DEFAULT NULL,
                         `updated_at` timestamp NULL DEFAULT NULL,
                         PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bells`
--

LOCK TABLES `bells` WRITE;
/*!40000 ALTER TABLE `bells` DISABLE KEYS */;
INSERT INTO `bells` VALUES (1,'Первый урок','08:00:00','08:45:00',0,'2025-03-03 18:00:45','2025-03-03 18:00:45'),(2,'Перемена','08:45:00','09:00:00',1,'2025-03-03 18:00:45','2025-03-03 18:00:45'),(3,'Второй урок','09:00:00','09:45:00',0,'2025-03-03 18:00:45','2025-03-03 18:00:45'),(4,'Перемена','09:45:00','10:00:00',1,'2025-03-03 18:00:45','2025-03-03 18:00:45'),(5,'Третий урок','10:00:00','10:45:00',0,'2025-03-03 18:00:45','2025-03-03 18:00:45'),(6,'Перемена','10:45:00','11:00:00',1,'2025-03-03 18:00:45','2025-03-03 18:00:45'),(7,'Четвертый урок','11:00:00','11:45:00',0,'2025-03-03 18:00:45','2025-03-03 18:00:45'),(8,'Перемена','11:45:00','12:00:00',1,'2025-03-03 18:00:45','2025-03-03 18:00:45'),(9,'Пятый урок','12:00:00','12:45:00',0,'2025-03-03 18:00:45','2025-03-03 18:00:45');
/*!40000 ALTER TABLE `bells` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
                         `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                         `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
                         `expiration` int NOT NULL,
                         PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
INSERT INTO `cache` VALUES ('laravel_cache_gtasity3@gmail.com|172.19.0.1','i:3;',1741030392),('laravel_cache_gtasity3@gmail.com|172.19.0.1:timer','i:1741030392;',1741030392);
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
                               `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                               `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                               `expiration` int NOT NULL,
                               PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_subject`
--

DROP TABLE IF EXISTS `class_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class_subject` (
                                 `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                 `class_id` bigint unsigned NOT NULL,
                                 `subject_id` bigint unsigned NOT NULL,
                                 `hours_per_year` int NOT NULL,
                                 `created_at` timestamp NULL DEFAULT NULL,
                                 `updated_at` timestamp NULL DEFAULT NULL,
                                 PRIMARY KEY (`id`),
                                 KEY `class_subject_class_id_foreign` (`class_id`),
                                 KEY `class_subject_subject_id_foreign` (`subject_id`),
                                 CONSTRAINT `class_subject_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
                                 CONSTRAINT `class_subject_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_subject`
--

LOCK TABLES `class_subject` WRITE;
/*!40000 ALTER TABLE `class_subject` DISABLE KEYS */;
/*!40000 ALTER TABLE `class_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classes` (
                           `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                           `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                           `created_at` timestamp NULL DEFAULT NULL,
                           `updated_at` timestamp NULL DEFAULT NULL,
                           PRIMARY KEY (`id`),
                           UNIQUE KEY `classes_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` VALUES (1,'1-А','2025-03-03 18:00:45','2025-03-03 18:00:45'),(2,'1-Б','2025-03-03 18:00:45','2025-03-03 18:00:45'),(3,'2-А','2025-03-03 18:00:45','2025-03-03 18:00:45'),(4,'2-Б','2025-03-03 18:00:45','2025-03-03 18:00:45'),(5,'3-А','2025-03-03 18:00:45','2025-03-03 18:00:45'),(6,'3-Б','2025-03-03 18:00:45','2025-03-03 18:00:45'),(7,'4-А','2025-03-03 18:00:45','2025-03-03 18:00:45'),(8,'4-Б','2025-03-03 18:00:45','2025-03-03 18:00:45');
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `days`
--

DROP TABLE IF EXISTS `days`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `days` (
                        `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                        `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                        `created_at` timestamp NULL DEFAULT NULL,
                        `updated_at` timestamp NULL DEFAULT NULL,
                        PRIMARY KEY (`id`),
                        UNIQUE KEY `days_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `days`
--

LOCK TABLES `days` WRITE;
/*!40000 ALTER TABLE `days` DISABLE KEYS */;
INSERT INTO `days` VALUES (1,'Понедельник','2025-03-03 18:00:45','2025-03-03 18:00:45'),(2,'Вторник','2025-03-03 18:00:45','2025-03-03 18:00:45'),(3,'Среда','2025-03-03 18:00:45','2025-03-03 18:00:45'),(4,'Четверг','2025-03-03 18:00:45','2025-03-03 18:00:45'),(5,'Пятница','2025-03-03 18:00:45','2025-03-03 18:00:45');
/*!40000 ALTER TABLE `days` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
                               `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                               `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                               `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
                               `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
                               `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
                               `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
                               `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                               PRIMARY KEY (`id`),
                               UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
                               `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                               `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                               `total_jobs` int NOT NULL,
                               `pending_jobs` int NOT NULL,
                               `failed_jobs` int NOT NULL,
                               `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
                               `options` mediumtext COLLATE utf8mb4_unicode_ci,
                               `cancelled_at` int DEFAULT NULL,
                               `created_at` int NOT NULL,
                               `finished_at` int DEFAULT NULL,
                               PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
                        `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                        `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                        `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
                        `attempts` tinyint unsigned NOT NULL,
                        `reserved_at` int unsigned DEFAULT NULL,
                        `available_at` int unsigned NOT NULL,
                        `created_at` int unsigned NOT NULL,
                        PRIMARY KEY (`id`),
                        KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
                              `id` int unsigned NOT NULL AUTO_INCREMENT,
                              `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                              `batch` int NOT NULL,
                              PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2025_02_28_163219_create_classes_table',1),(5,'2025_02_28_163308_create_subjects_table',1),(6,'2025_02_28_163329_create_teachers_table',1),(7,'2025_02_28_163351_create_days_table',1),(8,'2025_02_28_163534_create_bells_table',1),(9,'2025_02_28_163632_create_class_subject_table',1),(10,'2025_02_28_163700_create_teacher_subject_table',1),(11,'2025_02_28_163733_create_schedule_table',1),(12,'2025_03_03_174426_add_two_factor_columns_to_users_table',1),(13,'2025_03_03_174435_create_personal_access_tokens_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
                                         `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                                         `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                                         `created_at` timestamp NULL DEFAULT NULL,
                                         PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
                                          `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                          `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                                          `tokenable_id` bigint unsigned NOT NULL,
                                          `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                                          `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
                                          `abilities` text COLLATE utf8mb4_unicode_ci,
                                          `last_used_at` timestamp NULL DEFAULT NULL,
                                          `expires_at` timestamp NULL DEFAULT NULL,
                                          `created_at` timestamp NULL DEFAULT NULL,
                                          `updated_at` timestamp NULL DEFAULT NULL,
                                          PRIMARY KEY (`id`),
                                          UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
                                          KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule` (
                            `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                            `day_id` bigint unsigned NOT NULL,
                            `bell_id` bigint unsigned NOT NULL,
                            `class_id` bigint unsigned NOT NULL,
                            `subject_id` bigint unsigned NOT NULL,
                            `teacher_id` bigint unsigned NOT NULL,
                            `created_at` timestamp NULL DEFAULT NULL,
                            `updated_at` timestamp NULL DEFAULT NULL,
                            PRIMARY KEY (`id`),
                            UNIQUE KEY `schedule_day_id_bell_id_class_id_unique` (`day_id`,`bell_id`,`class_id`),
                            UNIQUE KEY `schedule_day_id_bell_id_teacher_id_unique` (`day_id`,`bell_id`,`teacher_id`),
                            KEY `schedule_bell_id_foreign` (`bell_id`),
                            KEY `schedule_class_id_foreign` (`class_id`),
                            KEY `schedule_subject_id_foreign` (`subject_id`),
                            KEY `schedule_teacher_id_foreign` (`teacher_id`),
                            CONSTRAINT `schedule_bell_id_foreign` FOREIGN KEY (`bell_id`) REFERENCES `bells` (`id`) ON DELETE CASCADE,
                            CONSTRAINT `schedule_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
                            CONSTRAINT `schedule_day_id_foreign` FOREIGN KEY (`day_id`) REFERENCES `days` (`id`) ON DELETE CASCADE,
                            CONSTRAINT `schedule_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE,
                            CONSTRAINT `schedule_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES (1,1,1,1,5,7,'2025-03-03 20:21:48','2025-03-03 20:21:48'),(2,1,3,1,3,4,'2025-03-03 20:21:48','2025-03-03 20:21:48'),(3,1,5,1,1,4,'2025-03-03 20:21:48','2025-03-03 20:21:48'),(4,1,7,1,2,3,'2025-03-03 20:21:48','2025-03-03 20:21:48'),(5,1,9,1,6,3,'2025-03-03 20:21:48','2025-03-03 20:21:48'),(6,1,1,2,1,5,'2025-03-03 20:21:48','2025-03-03 20:21:48'),(7,1,3,2,4,7,'2025-03-03 20:21:48','2025-03-03 20:21:48'),(8,1,1,3,6,3,'2025-03-03 20:21:48','2025-03-03 20:21:48'),(9,1,3,3,2,2,'2025-03-03 20:21:48','2025-03-03 20:21:48'),(10,1,5,3,1,5,'2025-03-03 20:21:48','2025-03-03 20:21:48'),(11,1,7,3,3,1,'2025-03-03 20:21:48','2025-03-03 20:21:48'),(12,1,9,3,5,2,'2025-03-03 20:21:48','2025-03-03 20:21:48'),(13,1,1,4,4,6,'2025-03-03 20:21:48','2025-03-03 20:21:48'),(14,1,3,4,5,3,'2025-03-03 20:21:48','2025-03-03 20:21:48'),(15,1,3,5,6,5,'2025-03-03 20:21:48','2025-03-03 20:21:48'),(16,1,5,5,3,6,'2025-03-03 20:21:48','2025-03-03 20:21:48'),(17,1,7,5,4,6,'2025-03-03 20:21:48','2025-03-03 20:21:48'),(18,1,9,5,5,7,'2025-03-03 20:21:48','2025-03-03 20:21:48'),(19,1,1,6,2,1,'2025-03-03 20:21:48','2025-03-03 20:21:48'),(20,1,3,6,1,6,'2025-03-03 20:21:48','2025-03-03 20:21:48'),(21,1,7,7,5,2,'2025-03-03 20:21:48','2025-03-03 20:21:48'),(22,1,9,7,2,1,'2025-03-03 20:21:48','2025-03-03 20:21:48'),(23,1,5,8,2,3,'2025-03-03 20:21:48','2025-03-03 20:21:48'),(24,1,7,8,6,5,'2025-03-03 20:21:48','2025-03-03 20:21:48'),(25,1,9,8,3,4,'2025-03-03 20:21:48','2025-03-03 20:21:48'),(26,2,1,1,5,2,'2025-03-03 20:21:48','2025-03-03 20:21:48'),(27,2,3,1,4,6,'2025-03-03 20:21:48','2025-03-03 20:21:48'),(28,2,5,1,7,5,'2025-03-03 20:21:48','2025-03-03 20:21:48'),(29,2,7,1,1,4,'2025-03-03 20:21:48','2025-03-03 20:21:48'),(30,2,1,2,3,4,'2025-03-03 20:21:48','2025-03-03 20:21:48'),(31,2,3,2,6,3,'2025-03-03 20:21:48','2025-03-03 20:21:48'),(32,2,5,2,4,6,'2025-03-03 20:21:48','2025-03-03 20:21:48'),(33,2,1,3,6,5,'2025-03-03 20:21:48','2025-03-03 20:21:48'),(34,2,3,3,2,2,'2025-03-03 20:21:48','2025-03-03 20:21:48'),(35,2,5,3,4,7,'2025-03-03 20:21:48','2025-03-03 20:21:48'),(36,2,7,3,3,1,'2025-03-03 20:21:48','2025-03-03 20:21:48'),(37,2,9,3,1,5,'2025-03-03 20:21:48','2025-03-03 20:21:48'),(38,2,1,4,2,3,'2025-03-03 20:21:48','2025-03-03 20:21:48'),(39,2,3,4,1,5,'2025-03-03 20:21:48','2025-03-03 20:21:48'),(40,2,7,4,7,5,'2025-03-03 20:21:48','2025-03-03 20:21:48'),(41,2,9,4,5,7,'2025-03-03 20:21:48','2025-03-03 20:21:48'),(42,2,3,5,5,7,'2025-03-03 20:21:48','2025-03-03 20:21:48'),(43,2,1,6,3,6,'2025-03-03 20:21:48','2025-03-03 20:21:48'),(44,2,1,7,2,1,'2025-03-03 20:21:48','2025-03-03 20:21:48'),(45,2,5,7,6,3,'2025-03-03 20:21:48','2025-03-03 20:21:48'),(46,2,7,7,3,6,'2025-03-03 20:21:48','2025-03-03 20:21:48'),(47,2,9,7,4,6,'2025-03-03 20:21:48','2025-03-03 20:21:48'),(48,3,1,1,1,5,'2025-03-03 20:21:48','2025-03-03 20:21:48'),(49,3,3,1,6,5,'2025-03-03 20:21:48','2025-03-03 20:21:48'),(50,3,1,2,7,7,'2025-03-03 20:21:48','2025-03-03 20:21:48'),(51,3,3,2,4,7,'2025-03-03 20:21:48','2025-03-03 20:21:48'),(52,3,1,3,2,3,'2025-03-03 20:21:48','2025-03-03 20:21:48'),(53,3,3,3,1,4,'2025-03-03 20:21:48','2025-03-03 20:21:48'),(54,3,5,3,6,3,'2025-03-03 20:21:48','2025-03-03 20:21:48'),(55,3,7,3,3,1,'2025-03-03 20:21:48','2025-03-03 20:21:48'),(56,3,9,3,5,2,'2025-03-03 20:21:48','2025-03-03 20:21:48'),(57,3,1,4,5,2,'2025-03-03 20:21:48','2025-03-03 20:21:48'),(58,3,3,4,6,3,'2025-03-03 20:21:48','2025-03-03 20:21:48'),(59,3,5,4,3,4,'2025-03-03 20:21:48','2025-03-03 20:21:48'),(60,3,7,4,7,7,'2025-03-03 20:21:49','2025-03-03 20:21:49'),(61,3,1,5,4,6,'2025-03-03 20:21:49','2025-03-03 20:21:49'),(62,3,3,5,2,1,'2025-03-03 20:21:49','2025-03-03 20:21:49'),(63,3,3,6,2,2,'2025-03-03 20:21:49','2025-03-03 20:21:49'),(64,3,5,6,6,5,'2025-03-03 20:21:49','2025-03-03 20:21:49'),(65,3,5,7,7,7,'2025-03-03 20:21:49','2025-03-03 20:21:49'),(66,3,7,7,3,4,'2025-03-03 20:21:49','2025-03-03 20:21:49'),(67,3,1,8,3,4,'2025-03-03 20:21:49','2025-03-03 20:21:49'),(68,4,1,1,2,2,'2025-03-03 20:21:49','2025-03-03 20:21:49'),(69,4,3,1,3,4,'2025-03-03 20:21:49','2025-03-03 20:21:49'),(70,4,5,1,7,7,'2025-03-03 20:21:49','2025-03-03 20:21:49'),(71,4,7,1,5,7,'2025-03-03 20:21:49','2025-03-03 20:21:49'),(72,4,9,1,6,3,'2025-03-03 20:21:49','2025-03-03 20:21:49'),(73,4,1,2,6,5,'2025-03-03 20:21:49','2025-03-03 20:21:49'),(74,4,3,2,5,2,'2025-03-03 20:21:49','2025-03-03 20:21:49'),(75,4,5,2,1,6,'2025-03-03 20:21:49','2025-03-03 20:21:49'),(76,4,1,3,2,3,'2025-03-03 20:21:49','2025-03-03 20:21:49'),(77,4,3,3,5,7,'2025-03-03 20:21:49','2025-03-03 20:21:49'),(78,4,1,4,1,4,'2025-03-03 20:21:49','2025-03-03 20:21:49'),(79,4,3,4,2,3,'2025-03-03 20:21:49','2025-03-03 20:21:49'),(80,4,1,5,3,1,'2025-03-03 20:21:49','2025-03-03 20:21:49'),(81,4,5,5,7,5,'2025-03-03 20:21:49','2025-03-03 20:21:49'),(82,4,7,5,5,2,'2025-03-03 20:21:49','2025-03-03 20:21:49'),(83,4,1,6,4,7,'2025-03-03 20:21:49','2025-03-03 20:21:49'),(84,4,3,6,2,1,'2025-03-03 20:21:49','2025-03-03 20:21:49'),(85,4,5,6,3,4,'2025-03-03 20:21:49','2025-03-03 20:21:49'),(86,4,3,8,3,6,'2025-03-03 20:21:49','2025-03-03 20:21:49'),(87,4,7,8,1,6,'2025-03-03 20:21:49','2025-03-03 20:21:49'),(88,4,9,8,4,6,'2025-03-03 20:21:49','2025-03-03 20:21:49'),(89,5,1,1,4,7,'2025-03-03 20:21:49','2025-03-03 20:21:49'),(90,5,3,1,6,3,'2025-03-03 20:21:49','2025-03-03 20:21:49'),(91,5,5,1,3,4,'2025-03-03 20:21:49','2025-03-03 20:21:49'),(92,5,7,1,1,6,'2025-03-03 20:21:49','2025-03-03 20:21:49'),(93,5,9,1,7,5,'2025-03-03 20:21:49','2025-03-03 20:21:49'),(94,5,1,2,3,6,'2025-03-03 20:21:49','2025-03-03 20:21:49'),(95,5,3,2,2,2,'2025-03-03 20:21:49','2025-03-03 20:21:49'),(96,5,5,2,1,6,'2025-03-03 20:21:49','2025-03-03 20:21:49'),(97,5,7,2,7,7,'2025-03-03 20:21:49','2025-03-03 20:21:49'),(98,5,1,3,6,5,'2025-03-03 20:21:49','2025-03-03 20:21:49'),(99,5,3,3,2,1,'2025-03-03 20:21:49','2025-03-03 20:21:49'),(100,5,5,3,5,2,'2025-03-03 20:21:49','2025-03-03 20:21:49'),(101,5,7,3,7,5,'2025-03-03 20:21:49','2025-03-03 20:21:49'),(102,5,9,3,4,6,'2025-03-03 20:21:49','2025-03-03 20:21:49'),(103,5,1,4,6,3,'2025-03-03 20:21:49','2025-03-03 20:21:49'),(104,5,3,4,3,6,'2025-03-03 20:21:49','2025-03-03 20:21:49'),(105,5,5,4,5,7,'2025-03-03 20:21:49','2025-03-03 20:21:49'),(106,5,1,5,1,4,'2025-03-03 20:21:49','2025-03-03 20:21:49'),(107,5,1,6,2,1,'2025-03-03 20:21:49','2025-03-03 20:21:49'),(108,5,3,6,7,7,'2025-03-03 20:21:49','2025-03-03 20:21:49'),(109,5,5,6,3,1,'2025-03-03 20:21:49','2025-03-03 20:21:49'),(110,5,7,6,5,3,'2025-03-03 20:21:49','2025-03-03 20:21:49'),(111,5,3,7,3,4,'2025-03-03 20:21:49','2025-03-03 20:21:49'),(112,5,7,7,1,4,'2025-03-03 20:21:49','2025-03-03 20:21:49'),(113,5,9,7,7,7,'2025-03-03 20:21:49','2025-03-03 20:21:49'),(114,5,7,8,2,2,'2025-03-03 20:21:49','2025-03-03 20:21:49');
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
                            `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                            `user_id` bigint unsigned DEFAULT NULL,
                            `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                            `user_agent` text COLLATE utf8mb4_unicode_ci,
                            `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
                            `last_activity` int NOT NULL,
                            PRIMARY KEY (`id`),
                            KEY `sessions_user_id_index` (`user_id`),
                            KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('dtr4Lpw8FNbCAGkoLxGqQnBPVHIGEpXrzNoZ9L2e',NULL,'172.19.0.1','Mozilla/5.0 (X11; Linux x86_64; rv:131.0) Gecko/20100101 Firefox/131.0','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiTFAwaHNvQVF4ZFFQSTJ0Y1hZZWE4S2Z2dHBhYXE4bnJ6Q1pOb3RGVyI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyNjoiaHR0cDovL2xvY2FsaG9zdC9kYXNoYm9hcmQiO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoyMjoiaHR0cDovL2xvY2FsaG9zdC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1741030335),('LrsTTkWvGTEuViQj6EaMh6va5dPddSPkp9G5UIz5',1,'172.19.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiTkRiOEdvbHJvc21LdTg0ZTJnQkV5YjZEb1JwcEE4ZHp2WkcyV3J1WSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9sb2NhbGhvc3QvZGFzaGJvYXJkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjIxOiJwYXNzd29yZF9oYXNoX3NhbmN0dW0iO3M6NjA6IiQyeSQxMiRMdjZCYXQxTkNQSXlJaFIxMUtlbGYuM0FrRlVHaVVqWFpjT2ZqY3BubS5JZ0lPdVlSbC5LMiI7fQ==',1741033387);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subjects` (
                            `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                            `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                            `created_at` timestamp NULL DEFAULT NULL,
                            `updated_at` timestamp NULL DEFAULT NULL,
                            PRIMARY KEY (`id`),
                            UNIQUE KEY `subjects_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` VALUES (1,'Математика','2025-03-03 18:00:45','2025-03-03 18:00:45'),(2,'История','2025-03-03 18:00:45','2025-03-03 18:00:45'),(3,'Литература','2025-03-03 18:00:45','2025-03-03 18:00:45'),(4,'Физика','2025-03-03 18:00:45','2025-03-03 18:00:45'),(5,'Химия','2025-03-03 18:00:45','2025-03-03 18:00:45'),(6,'Биология','2025-03-03 18:00:45','2025-03-03 18:00:45'),(7,'География','2025-03-03 18:00:45','2025-03-03 18:00:45');
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher_subject`
--

DROP TABLE IF EXISTS `teacher_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher_subject` (
                                   `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                   `teacher_id` bigint unsigned NOT NULL,
                                   `subject_id` bigint unsigned NOT NULL,
                                   `created_at` timestamp NULL DEFAULT NULL,
                                   `updated_at` timestamp NULL DEFAULT NULL,
                                   PRIMARY KEY (`id`),
                                   KEY `teacher_subject_teacher_id_foreign` (`teacher_id`),
                                   KEY `teacher_subject_subject_id_foreign` (`subject_id`),
                                   CONSTRAINT `teacher_subject_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE,
                                   CONSTRAINT `teacher_subject_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_subject`
--

LOCK TABLES `teacher_subject` WRITE;
/*!40000 ALTER TABLE `teacher_subject` DISABLE KEYS */;
INSERT INTO `teacher_subject` VALUES (1,1,2,NULL,NULL),(2,1,3,NULL,NULL),(3,2,2,NULL,NULL),(4,2,5,NULL,NULL),(5,3,2,NULL,NULL),(6,3,5,NULL,NULL),(7,3,6,NULL,NULL),(8,4,1,NULL,NULL),(9,4,3,NULL,NULL),(10,5,1,NULL,NULL),(11,5,6,NULL,NULL),(12,5,7,NULL,NULL),(13,6,1,NULL,NULL),(14,6,3,NULL,NULL),(15,6,4,NULL,NULL),(16,7,4,NULL,NULL),(17,7,5,NULL,NULL),(18,7,7,NULL,NULL);
/*!40000 ALTER TABLE `teacher_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teachers` (
                            `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                            `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                            `created_at` timestamp NULL DEFAULT NULL,
                            `updated_at` timestamp NULL DEFAULT NULL,
                            PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers`
--

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
INSERT INTO `teachers` VALUES (1,'Иван Петров','2025-03-03 18:00:45','2025-03-03 18:00:45'),(2,'Ольга Смирнова','2025-03-03 18:00:45','2025-03-03 18:00:45'),(3,'Алексей Сидоров','2025-03-03 18:00:45','2025-03-03 18:00:45'),(4,'Мария Иванова','2025-03-03 18:00:45','2025-03-03 18:00:45'),(5,'Григорий Коваленко','2025-03-03 18:00:45','2025-03-03 18:00:45'),(6,'Светлана Синица','2025-03-03 18:00:45','2025-03-03 18:00:45'),(7,'Анна Линько','2025-03-03 18:00:45','2025-03-03 18:00:45');
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
                         `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                         `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                         `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                         `email_verified_at` timestamp NULL DEFAULT NULL,
                         `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                         `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
                         `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
                         `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
                         `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                         `current_team_id` bigint unsigned DEFAULT NULL,
                         `profile_photo_path` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                         `created_at` timestamp NULL DEFAULT NULL,
                         `updated_at` timestamp NULL DEFAULT NULL,
                         PRIMARY KEY (`id`),
                         UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Петухов Евгений','gtasity3@gmail.com',NULL,'$2y$12$Lv6Bat1NCPIyIhR11Kelf.3AkFUGiUjXZcOfjcpnm.IgIOuYRl.K2',NULL,NULL,NULL,NULL,NULL,NULL,'2025-03-03 19:32:42','2025-03-03 19:32:42');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'laravel'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-03 20:37:27
