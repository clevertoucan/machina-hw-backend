-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: web_hw
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `_prisma_migrations`
--

DROP TABLE IF EXISTS `_prisma_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `checksum` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logs` text COLLATE utf8mb4_unicode_ci,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `applied_steps_count` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_prisma_migrations`
--

LOCK TABLES `_prisma_migrations` WRITE;
/*!40000 ALTER TABLE `_prisma_migrations` DISABLE KEYS */;
INSERT INTO `_prisma_migrations` VALUES ('8016e806-8c47-49cd-92a1-8f37bfdeda03','afb7c0026890a8ef2bfdf8494764599cacfc069ce8687d386d49fd92c169dcb0','2023-02-11 00:50:49.665','20230211005048_foreign_keys',NULL,NULL,'2023-02-11 00:50:48.880',1),('af7a3197-24e4-49f7-b45a-6e6711a30365','47e6c1cad4209a92b2d1149fb0ed4ac72df23d216c7a9e4baa0ee09820212b6b','2023-02-12 00:05:01.102','20230212000500_add_job_relations',NULL,NULL,'2023-02-12 00:05:00.560',1),('dd0bef52-8360-48d6-a0af-d70aa75c7fc2','0dc9a3835ac6482cf57888f469455ce1a65d0650c57a5c228095d0336cea1c1a','2023-02-11 00:27:26.253','20230211002613_initial_migration','',NULL,'2023-02-11 00:27:26.253',0);
/*!40000 ALTER TABLE `_prisma_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `build_files`
--

DROP TABLE IF EXISTS `build_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `build_files` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `slice_file_ID` int DEFAULT NULL,
  `file_name` varchar(45) DEFAULT NULL,
  `blob_name` varchar(45) DEFAULT NULL,
  `container` varchar(45) DEFAULT NULL,
  `upload_time` datetime DEFAULT NULL,
  `job_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `build_files_slice_file_ID_fkey` (`slice_file_ID`),
  KEY `build_files_job_ID_fkey` (`job_ID`),
  CONSTRAINT `build_files_job_ID_fkey` FOREIGN KEY (`job_ID`) REFERENCES `job` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `build_files_slice_file_ID_fkey` FOREIGN KEY (`slice_file_ID`) REFERENCES `slice_files` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `build_files`
--

LOCK TABLES `build_files` WRITE;
/*!40000 ALTER TABLE `build_files` DISABLE KEYS */;
INSERT INTO `build_files` VALUES (1,1,'buildfile.csv',NULL,'PathPlanning',NULL,1),(2,2,'part_out_test2.csv',NULL,'PathPlanning',NULL,1),(3,3,'hat_out.csv',NULL,'PathPlanning',NULL,2);
/*!40000 ALTER TABLE `build_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cad_files`
--

DROP TABLE IF EXISTS `cad_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cad_files` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `parent_CAD_ID` int DEFAULT NULL,
  `file_name` varchar(45) DEFAULT NULL,
  `container` varchar(45) DEFAULT NULL,
  `upload_time` datetime DEFAULT NULL,
  `blob_name` varchar(45) DEFAULT NULL,
  `job_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `cad_files_parent_CAD_ID_fkey` (`parent_CAD_ID`),
  KEY `cad_files_job_ID_fkey` (`job_ID`),
  CONSTRAINT `cad_files_job_ID_fkey` FOREIGN KEY (`job_ID`) REFERENCES `job` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `cad_files_parent_CAD_ID_fkey` FOREIGN KEY (`parent_CAD_ID`) REFERENCES `cad_files` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cad_files`
--

LOCK TABLES `cad_files` WRITE;
/*!40000 ALTER TABLE `cad_files` DISABLE KEYS */;
INSERT INTO `cad_files` VALUES (1,NULL,'Original_CAD.stl','CAD',NULL,NULL,1),(2,1,'Prepped_CAD.step','CAD',NULL,NULL,1),(3,NULL,'CustomerB_CAD.stl','CAD',NULL,NULL,2);
/*!40000 ALTER TABLE `cad_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contract`
--

DROP TABLE IF EXISTS `contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contract` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `customer_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `contract_customer_ID_fkey` (`customer_ID`),
  CONSTRAINT `contract_customer_ID_fkey` FOREIGN KEY (`customer_ID`) REFERENCES `customer` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contract`
--

LOCK TABLES `contract` WRITE;
/*!40000 ALTER TABLE `contract` DISABLE KEYS */;
INSERT INTO `contract` VALUES (1,1001),(2,1002);
/*!40000 ALTER TABLE `contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `gov_not_comm` tinyint DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1001,'CustomerA',1),(1002,'CustomerB',0);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_parts`
--

DROP TABLE IF EXISTS `customer_parts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_parts` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `customer_ID` int DEFAULT NULL,
  `CAD_file_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `customer_parts_customer_ID_fkey` (`customer_ID`),
  KEY `customer_parts_CAD_file_ID_fkey` (`CAD_file_ID`),
  CONSTRAINT `customer_parts_CAD_file_ID_fkey` FOREIGN KEY (`CAD_file_ID`) REFERENCES `cad_files` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `customer_parts_customer_ID_fkey` FOREIGN KEY (`customer_ID`) REFERENCES `customer` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_parts`
--

LOCK TABLES `customer_parts` WRITE;
/*!40000 ALTER TABLE `customer_parts` DISABLE KEYS */;
INSERT INTO `customer_parts` VALUES (1,1001,1),(2,1002,3);
/*!40000 ALTER TABLE `customer_parts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `contract_ID` int DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `job_contract_ID_fkey` (`contract_ID`),
  CONSTRAINT `job_contract_ID_fkey` FOREIGN KEY (`contract_ID`) REFERENCES `contract` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` VALUES (1,1,'Flange'),(2,2,'Stiffener');
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `run`
--

DROP TABLE IF EXISTS `run`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `run` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `influx_UUID` bigint unsigned DEFAULT NULL,
  `job_ID` int DEFAULT NULL,
  `configuration` varchar(15) DEFAULT NULL,
  `build_file_ID` int DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `operator_ID` int DEFAULT NULL,
  `cell_ID` int DEFAULT NULL,
  `status` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `run_job_ID_fkey` (`job_ID`),
  KEY `run_build_file_ID_fkey` (`build_file_ID`),
  CONSTRAINT `run_build_file_ID_fkey` FOREIGN KEY (`build_file_ID`) REFERENCES `build_files` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `run_job_ID_fkey` FOREIGN KEY (`job_ID`) REFERENCES `job` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `run`
--

LOCK TABLES `run` WRITE;
/*!40000 ALTER TABLE `run` DISABLE KEYS */;
INSERT INTO `run` VALUES (1,12345,1,NULL,1,NULL,NULL,NULL,1,'ESTOP'),(2,12346,1,NULL,1,NULL,NULL,NULL,1,'FAILED'),(3,12347,1,'test2',2,NULL,NULL,NULL,1,'SUCCESSFUL'),(4,12348,2,NULL,3,NULL,NULL,NULL,9,'FAILED');
/*!40000 ALTER TABLE `run` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scan_metric`
--

DROP TABLE IF EXISTS `scan_metric`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scan_metric` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `scan_ID` int DEFAULT NULL,
  `container` varchar(45) DEFAULT NULL,
  `zmetric_file_name` varchar(45) DEFAULT NULL,
  `zmetric_upload_time` datetime DEFAULT NULL,
  `proximity_file_name` varchar(45) DEFAULT NULL,
  `proximity_upload_time` datetime DEFAULT NULL,
  `job_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `scan_metric_scan_ID_fkey` (`scan_ID`),
  KEY `scan_metric_job_ID_fkey` (`job_ID`),
  CONSTRAINT `scan_metric_job_ID_fkey` FOREIGN KEY (`job_ID`) REFERENCES `job` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `scan_metric_scan_ID_fkey` FOREIGN KEY (`scan_ID`) REFERENCES `scan_raw` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scan_metric`
--

LOCK TABLES `scan_metric` WRITE;
/*!40000 ALTER TABLE `scan_metric` DISABLE KEYS */;
INSERT INTO `scan_metric` VALUES (1,1,'Scan','zmetric.json',NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `scan_metric` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scan_raw`
--

DROP TABLE IF EXISTS `scan_raw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scan_raw` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `run_ID` int DEFAULT NULL,
  `cell_ID` int DEFAULT NULL,
  `operator_ID` int DEFAULT NULL,
  `container` varchar(45) DEFAULT NULL,
  `scan_file_name` varchar(45) DEFAULT NULL,
  `scan_blob_name` varchar(45) DEFAULT NULL,
  `scan_upload_time` datetime DEFAULT NULL,
  `rsi_file_name` varchar(45) DEFAULT NULL,
  `rsi_blob_name` varchar(45) DEFAULT NULL,
  `rsi_upload_time` datetime DEFAULT NULL,
  `job_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `scan_raw_run_ID_fkey` (`run_ID`),
  KEY `scan_raw_job_ID_fkey` (`job_ID`),
  CONSTRAINT `scan_raw_job_ID_fkey` FOREIGN KEY (`job_ID`) REFERENCES `job` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `scan_raw_run_ID_fkey` FOREIGN KEY (`run_ID`) REFERENCES `run` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scan_raw`
--

LOCK TABLES `scan_raw` WRITE;
/*!40000 ALTER TABLE `scan_raw` DISABLE KEYS */;
INSERT INTO `scan_raw` VALUES (1,3,1,NULL,'Scan','scanner_c1r1.log',NULL,NULL,'rsi1way_c1r1_state.log',NULL,NULL,1);
/*!40000 ALTER TABLE `scan_raw` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scan_result`
--

DROP TABLE IF EXISTS `scan_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scan_result` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `scan_ID` int DEFAULT NULL,
  `container` varchar(45) DEFAULT NULL,
  `mesh_file_name` varchar(45) DEFAULT NULL,
  `mesh_blob_name` varchar(45) DEFAULT NULL,
  `mesh_upload_time` datetime DEFAULT NULL,
  `ptcloud_file_name` varchar(45) DEFAULT NULL,
  `ptcloud_blob_name` varchar(45) DEFAULT NULL,
  `ptcloud_upload_time` datetime DEFAULT NULL,
  `job_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `scan_result_scan_ID_fkey` (`scan_ID`),
  KEY `scan_result_job_ID_fkey` (`job_ID`),
  CONSTRAINT `scan_result_job_ID_fkey` FOREIGN KEY (`job_ID`) REFERENCES `job` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `scan_result_scan_ID_fkey` FOREIGN KEY (`scan_ID`) REFERENCES `scan_raw` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scan_result`
--

LOCK TABLES `scan_result` WRITE;
/*!40000 ALTER TABLE `scan_result` DISABLE KEYS */;
INSERT INTO `scan_result` VALUES (1,1,'Scan','scan_mesh.ply',NULL,NULL,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `scan_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slice_files`
--

DROP TABLE IF EXISTS `slice_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slice_files` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `CAD_file_ID` int DEFAULT NULL,
  `file_name` varchar(45) DEFAULT NULL,
  `blob_name` varchar(45) DEFAULT NULL,
  `container` varchar(45) DEFAULT NULL,
  `upload_time` datetime DEFAULT NULL,
  `job_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `slice_files_CAD_file_ID_fkey` (`CAD_file_ID`),
  KEY `slice_files_job_ID_fkey` (`job_ID`),
  CONSTRAINT `slice_files_CAD_file_ID_fkey` FOREIGN KEY (`CAD_file_ID`) REFERENCES `cad_files` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `slice_files_job_ID_fkey` FOREIGN KEY (`job_ID`) REFERENCES `job` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slice_files`
--

LOCK TABLES `slice_files` WRITE;
/*!40000 ALTER TABLE `slice_files` DISABLE KEYS */;
INSERT INTO `slice_files` VALUES (1,2,'part.csv',NULL,'PathPlanning',NULL,1),(2,2,'part_test2.csv',NULL,'PathPlanning',NULL,1),(3,3,'hat.csv',NULL,'PathPlanning',NULL,2);
/*!40000 ALTER TABLE `slice_files` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-12 16:02:19
