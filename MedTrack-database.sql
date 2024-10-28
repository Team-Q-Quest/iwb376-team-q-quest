-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: pharmacy_database
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
-- Table structure for table `medicine`
--

DROP TABLE IF EXISTS `medicine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicine` (
  `medicine_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`medicine_id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicine`
--

LOCK TABLES `medicine` WRITE;
/*!40000 ALTER TABLE `medicine` DISABLE KEYS */;
INSERT INTO `medicine` VALUES (1,'Aspirin','Pain relief medicine used for headaches',200.00),(2,'Ibuprofen','Anti-inflammatory medicine used for pain and swelling',4.00),(3,'Paracetamol','Used to reduce fever and relieve pain',2.75),(4,'Amoxicillin','Antibiotic for bacterial infections',8.25),(5,'Cetirizine','Antihistamine used for allergies',5.00),(6,'Lisinopril','Used to treat high blood pressure',12.50),(7,'Metformin','Used for managing type 2 diabetes',10.00),(8,'Omeprazole','Used for treating acid reflux and stomach ulcers',6.25),(9,'Atorvastatin','Cholesterol-lowering medication',14.50),(10,'Simvastatin','Used for managing high cholesterol',13.00),(11,'Levothyroxine','Thyroid hormone replacement therapy',18.00),(12,'Pantoprazole','Used for acid reflux and gastrointestinal issues',7.75),(13,'Losartan','Used to treat high blood pressure',9.50),(14,'Clopidogrel','Blood thinner to prevent heart attacks',11.00),(15,'Furosemide','Diuretic used to reduce fluid retention',6.50),(16,'Metoprolol','Used for high blood pressure and heart issues',15.25),(17,'Amlodipine','Used to treat high blood pressure',8.00),(18,'Hydrochlorothiazide','Diuretic used to treat high blood pressure',7.50),(19,'Albuterol','Bronchodilator used for asthma',18.25),(20,'Fluoxetine','Antidepressant for managing depression and anxiety',20.00),(21,'Sertraline','Antidepressant used for depression and anxiety',19.50),(22,'Citalopram','Used to treat depression and anxiety',18.75),(23,'Gabapentin','Used to treat nerve pain and seizures',15.00),(24,'Prednisone','Steroid used for inflammation',10.50),(25,'Tamsulosin','Used for urinary problems',13.75),(26,'Baclofen','Muscle relaxant',7.25),(27,'Meloxicam','Used for arthritis pain',9.00),(28,'Spironolactone','Diuretic used to treat fluid retention',10.25),(29,'Warfarin','Blood thinner to prevent clots',21.50),(31,'Doxycycline','Antibiotic for infections',16.00),(32,'Azithromycin','Antibiotic used to treat infections',12.75),(33,'Montelukast','Used for asthma and allergies',15.50),(34,'Ranitidine','Used for heartburn and ulcers',8.50),(35,'Cyclobenzaprine','Muscle relaxant',9.75),(36,'Naproxen','Used for pain relief and inflammation',7.00),(37,'Diazepam','Used to treat anxiety and muscle spasms',11.50),(38,'Lorazepam','Used for anxiety and insomnia',13.50),(39,'Oxycodone','Pain relief medicine',25.00),(40,'Tramadol','Used for pain relief',22.50),(41,'Codeine','Pain relief and cough suppressant',19.25),(42,'Hydrocodone','Used for severe pain',24.00),(43,'Ketorolac','Used for short-term pain relief',6.00),(44,'Amantadine','Used for Parkinson’s and flu prevention',14.00),(45,'Nitrofurantoin','Antibiotic for urinary tract infections',8.75),(46,'Propranolol','Used for heart problems and anxiety',12.25),(47,'Clonazepam','Used for seizures and anxiety',15.75),(48,'Risperidone','Antipsychotic for mental disorders',20.50),(49,'Olanzapine','Used for mental disorders',23.25),(50,'Quetiapine','Antipsychotic for depression and schizophrenia',22.00),(52,'Lamotrigine','Used to treat epilepsy and bipolar disorder',18.25),(53,'Topiramate','Used for epilepsy and migraines',16.50),(54,'Levetiracetam','Used to treat epilepsy',21.00),(55,'Valproic Acid','Used for epilepsy and bipolar disorder',19.75),(56,'Lithium','Used for mood disorders',22.50),(57,'Phenytoin','Used for seizure control',18.75),(58,'Divalproex','Used for seizure control',20.00),(59,'Erythromycin','Antibiotic for bacterial infections',14.50),(60,'Zidovudine','Antiretroviral for HIV',30.00),(61,'Tenofovir','Used to treat HIV',35.00),(62,'Lamivudine','Antiretroviral used for HIV and hepatitis B',28.75),(63,'Efavirenz','Used to treat HIV infections',33.50),(64,'Ritonavir','Antiretroviral for HIV',29.00),(65,'Darunavir','Used to treat HIV',40.50),(66,'Isoniazid','Used for tuberculosis treatment',12.50),(67,'Rifampin','Antibiotic used for tuberculosis',15.00),(68,'Pyrazinamide','Used to treat tuberculosis',18.00),(69,'Ethambutol','Used for tuberculosis treatment',14.75),(70,'Clarithromycin','Antibiotic for bacterial infections',17.50),(71,'Vancomycin','Antibiotic used for serious bacterial infections',35.75),(72,'Ceftriaxone','Antibiotic used for bacterial infections',28.25),(73,'Cephalexin','Antibiotic for bacterial infections',16.75),(74,'Ciprofloxacin','Antibiotic for infections',18.00),(75,'Levofloxacin','Used for bacterial infections',19.25),(76,'Moxifloxacin','Antibiotic for bacterial infections',22.00),(77,'Daptomycin','Antibiotic used for serious infections',42.50),(78,'Linezolid','Used for bacterial infections',37.25),(79,'Tigecycline','Antibiotic for bacterial infections',45.50),(80,'Meropenem','Used for severe bacterial infections',55.75),(81,'Imipenem','Antibiotic for bacterial infections',50.00),(82,'Cefuroxime','Used for bacterial infections',21.75),(83,'Amikacin','Antibiotic used for bacterial infections',33.00),(84,'Gentamicin','Used for bacterial infections',24.50),(85,'Tobramycin','Antibiotic for infections',29.50),(86,'Neomycin','Antibiotic for infections',26.75),(87,'Sulfasalazine','Used for inflammatory bowel disease',15.25),(88,'Mesalamine','Used to treat ulcerative colitis',20.75),(89,'Azathioprine','Used for autoimmune diseases',22.75),(90,'Mercaptopurine','Used for cancer treatment',28.00),(91,'Methotrexate','Used for cancer and autoimmune diseases',30.75),(98,'Tofacitinib','Used for rheumatoid arthritis',62.50),(99,'Upadacitinib','Used for inflammatory conditions',65.00),(100,'Filgotinib','Used for rheumatoid arthritis',67.50),(104,'Haloperidol','Antipsychotic used for schizophrenia and agitation',35.00),(105,'Chlorpromazine','Antipsychotic used for psychotic disorders',20.00),(106,'Aripiprazole','Antipsychotic used for schizophrenia and bipolar disorder',55.00),(107,'Brexpiprazole','Antipsychotic used for schizophrenia and depression',65.00),(108,'Suvorexant','Used to treat insomnia',80.00),(109,'Eszopiclone','Used for insomnia',70.00),(110,'Loperamide','Used to treat diarrhea',6.50),(111,'Scopolamine','Used to prevent motion sickness',10.00),(112,'Phenylephrine','Decongestant used for nasal congestion',5.75),(113,'Pseudoephedrine','Decongestant used for nasal congestion',12.00),(114,'Tadalafil','Used to treat erectile dysfunction',60.00),(115,'Finasteride','Used to treat male pattern baldness',25.50),(116,'Dutasteride','Used to treat an enlarged prostate',40.00),(117,'Imiquimod','Used to treat skin conditions like warts',45.00),(118,'Permethrin','Used to treat lice and scabies',10.00),(119,'Tacrolimus','Immunosuppressant used for organ transplant',120.00),(120,'Sirolimus','Immunosuppressant used for organ transplant',135.00),(121,'Everolimus','Used to treat cancer and prevent organ rejection',150.00),(122,'Mycophenolate','Used to prevent organ transplant rejection',85.00),(123,'Ciclosporin','Immunosuppressant used for organ transplants',100.00),(124,'Adalimumab','Used to treat autoimmune conditions',120.00),(125,'Infliximab','Used to treat autoimmune conditions',180.00),(126,'Etanercept','Used to treat autoimmune conditions',160.00),(127,'Certolizumab','Used to treat autoimmune conditions',200.00),(128,'Golimumab','Used to treat autoimmune conditions',220.00),(130,'Ustekinumab','Used to treat psoriasis and Crohn’s disease',260.00),(131,'Secukinumab','Used to treat psoriasis and ankylosing spondylitis',300.00),(132,'Ixekizumab','Used to treat psoriasis and arthritis',320.00),(133,'Dupilumab','Used to treat eczema and asthma',340.00),(134,'Omalizumab','Used to treat allergic asthma',400.00),(135,'Mepolizumab','Used to treat eosinophilic asthma',450.00),(136,'Benralizumab','Used to treat severe asthma',500.00),(137,'Reslizumab','Used to treat eosinophilic asthma',550.00),(138,'Brodalumab','Used to treat plaque psoriasis',600.00),(139,'Sarilumab','Used to treat rheumatoid arthritis',650.00),(140,'Erenumab','Used to prevent migraines',700.00),(141,'Fremanezumab','Used to prevent migraines',750.00),(142,'Galcanezumab','Used to prevent migraines',800.00),(143,'Eptinezumab','Used to prevent migraines',850.00),(144,'Zavegepant','Used to treat migraines',900.00),(145,'Lasmiditan','Used to treat migraines',950.00),(146,'Remdesivir','Used to treat COVID-19',1000.00),(147,'Molnupiravir','Used to treat COVID-19',1100.00),(148,'Paxlovid','Used to treat COVID-19',1200.00),(149,'Baricitinib','Used to treat severe COVID-19',1300.00),(150,'Tocilizumab','Used to treat severe COVID-19',1400.00),(151,'penadol','best for headaches',2.00),(152,'paracetamol ','utilized for treating pain and fever.',2.00),(153,'paracitamol','Utilized for treating pain and fever',0.11);
/*!40000 ALTER TABLE `medicine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharmacy`
--

DROP TABLE IF EXISTS `pharmacy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pharmacy` (
  `pharmacy_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `address` text,
  `city` varchar(255) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `open_hour` time DEFAULT NULL,
  `close_hour` time DEFAULT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `img` longblob,
  `approved` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`pharmacy_id`)
) ENGINE=InnoDB AUTO_INCREMENT=206 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharmacy`
--

LOCK TABLES `pharmacy` WRITE;
/*!40000 ALTER TABLE `pharmacy` DISABLE KEYS */;
INSERT INTO `pharmacy` VALUES (1,'Health Mart','No. 45, Galle Road','Colombo','011-1234567','08:00:00','20:00:00',12.34567800,98.76543200,NULL,1),(2,'Care Plus Pharmacy','No. 12, 1st Cross Street','Dehiwala','011-2345678','09:00:00','21:00:00',12.50000000,98.80000000,NULL,1),(3,'City Drugs','No. 78, Madiwela Road','Nugegoda','011-3456789','07:30:00','19:30:00',12.60000000,98.70000000,NULL,1),(4,'Pharmacy World','No. 101, Station Road','Wellawatte','011-4567890','08:00:00','22:00:00',12.60000000,98.70000000,NULL,1),(5,'Wellness Pharmacy','No. 32, S. de S. Jayasinghe Mawatha','Bambalapitiya','011-5678901','10:00:00','18:00:00',12.60000000,98.70000000,NULL,1),(6,'Family Pharmacy','No. 22, Lumbini Avenue','Pettah','011-6789012','08:00:00','19:00:00',12.60000000,98.70000000,NULL,1),(7,'Quick Care Pharmacy','No. 90, Havelock Road','Kirulapone','011-7890123','09:00:00','20:00:00',12.60000000,98.70000000,NULL,1),(8,'Healthy Life Pharmacy','No. 10, Galle Face','Colombo','011-8901234','08:30:00','20:30:00',12.60000000,98.70000000,NULL,1),(9,'PharmaCenter','No. 5, Muthuwella Rd','Moratuwa','011-9012345','09:00:00','21:00:00',12.60000000,98.70000000,NULL,1),(10,'Local Rx','No. 15, A2 Road','Mount Lavinia','011-0123456','10:00:00','18:00:00',12.60000000,98.70000000,NULL,1),(11,'Main Street Pharmacy','No. 28, St. Anthony’s Mawatha','Borella','011-1357902','08:00:00','19:00:00',12.60000000,98.70000000,NULL,1),(12,'Care First Pharmacy','No. 55, Badhulla Road','Kollupitiya','011-2468013','09:30:00','20:30:00',12.60000000,98.70000000,NULL,1),(13,'Cure Pharmacy','No. 3, St. John’s Road','Wattala','011-3579124','08:00:00','21:00:00',12.60000000,98.70000000,NULL,1),(14,'Evergreen Pharmacy','No. 20, Lankapura Road','Ratmalana','011-4680235','09:00:00','18:00:00',12.60000000,98.70000000,NULL,0),(15,'Community Pharmacy','No. 60, Temple Road','Nawala','011-5791346','08:30:00','19:30:00',12.60000000,98.70000000,NULL,1),(16,'Your Health Pharmacy','No. 12, Rajagiriya Road','Rajagiriya','011-6802457','10:00:00','20:00:00',12.60000000,98.70000000,NULL,1),(17,'Sunshine Pharmacy','No. 35, New Nugegoda Rd','Piliyandala','011-7913568','09:00:00','21:00:00',12.60000000,98.70000000,NULL,1),(18,'Vitality Pharmacy','No. 18, Old Road','Kottawa','011-8024679','08:00:00','19:00:00',12.60000000,98.70000000,NULL,1),(19,'Guardian Pharmacy','No. 8, Station Road','Maharagama','011-9135780','08:30:00','20:30:00',12.60000000,98.70000000,NULL,1),(20,'Smart Health Pharmacy','No. 4, Hunnasgiriya Rd','Kadawatha','011-0246891','09:00:00','21:00:00',12.60000000,98.70000000,NULL,1),(21,'Anupa Perera','1/22\npahala imbulgoda imbulgoda','gampaha','0741130285','21:42:00','22:40:00',6.79716631,79.89306923,NULL,0),(22,'sample','sample','gm','0741150257','21:45:00','22:14:00',6.25845840,79.25451000,NULL,1),(23,'katubedda healthcare','135/B,Horana rd,Alubomulla,Panadura.','Panadura','0779716314','06:30:00','18:30:00',7.08116480,79.99651840,NULL,0),(201,'City Care Pharmacy','No. 23, Main Street','Colombo','0111234567','09:00:00','21:00:00',7.08116480,79.99651840,NULL,1),(202,'Wellness Pharmacy','No. 12, Lake Road','Colombo','0119876543','08:30:00','19:30:00',7.08116480,79.99651840,NULL,1),(203,'MediPlus','No. 9, Market Street','Colombo','0114567890','07:00:00','22:00:00',7.08116480,79.99651840,NULL,1),(204,'Good Health Pharmacy','No. 67, Park Avenue','Colombo','0117654321','08:00:00','20:00:00',7.08116480,79.99651840,NULL,1),(205,'CarePlus Pharmacy','No. 89, Ocean Drive','Colombo','0113456789','08:00:00','18:00:00',7.08116480,79.99651840,NULL,1);
/*!40000 ALTER TABLE `pharmacy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharmacy_admin`
--

DROP TABLE IF EXISTS `pharmacy_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pharmacy_admin` (
  `pharmacy_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`pharmacy_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  CONSTRAINT `pharmacy_admin_ibfk_1` FOREIGN KEY (`pharmacy_id`) REFERENCES `pharmacy` (`pharmacy_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharmacy_admin`
--

LOCK TABLES `pharmacy_admin` WRITE;
/*!40000 ALTER TABLE `pharmacy_admin` DISABLE KEYS */;
INSERT INTO `pharmacy_admin` VALUES (1,'admin_healthmart','admin@healthmart.com'),(2,'admin_careplus','admin@carepluspharmacy.com'),(3,'admin_citydrugs','admin@citydrugs.com'),(4,'admin_pharmacyworld','admin@pharmacyworld.com'),(5,'admin_wellness','admin@wellnesspharmacy.com'),(6,'admin_familypharmacy','admin@familypharmacy.com'),(7,'admin_quickcare','admin@quickcarepharmacy.com'),(8,'admin_healthylife','admin@healthylifepharmacy.com'),(9,'admin_pharmacenter','admin@pharmacenter.com'),(10,'admin_localrx','admin@localrx.com'),(11,'admin_mainstreet','admin@mainstreetpharmacy.com'),(12,'admin_carefirst','admin@carefirstpharmacy.com'),(13,'admin_curepharmacy','admin@curepharmacy.com'),(14,'admin_evergreen','admin@evergreenpharmacy.com'),(15,'admin_community','admin@communitypharmacy.com'),(16,'admin_yourhealth','admin@yourhealthpharmacy.com'),(17,'admin_sunshine','admin@sunshinepharmacy.com'),(18,'admin_vitality','admin@vitalitypharmacy.com'),(19,'admin_guardian','admin@guardianpharmacy.com'),(20,'admin_smarthealth','admin@smarthealthpharmacy.com'),(21,'anupa','anupaprabash@gmail.com'),(22,'anupa2','anupa.pp112@gmail.com'),(23,'Risinu Wijesinghe','risinuwijesinghe4@gmail.com');
/*!40000 ALTER TABLE `pharmacy_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock` (
  `pharmacy_id` int NOT NULL,
  `medicine_id` int NOT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`pharmacy_id`,`medicine_id`),
  KEY `medicine_id_idx` (`medicine_id`),
  CONSTRAINT `medicine_id` FOREIGN KEY (`medicine_id`) REFERENCES `medicine` (`medicine_id`),
  CONSTRAINT `pharmacy_id` FOREIGN KEY (`pharmacy_id`) REFERENCES `pharmacy` (`pharmacy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES (1,2,3),(2,1,98),(2,2,92),(2,3,63),(2,4,40),(2,5,10),(2,6,31),(2,7,22),(2,8,16),(2,9,17),(2,10,34),(2,11,18),(2,12,86),(2,13,79),(2,14,35),(2,15,40),(2,16,91),(2,17,35),(2,18,3),(2,19,8),(2,20,32),(2,21,34),(2,22,73),(2,23,65),(2,24,4),(2,25,24),(2,26,10),(2,27,76),(2,28,48),(2,29,14),(3,2,3),(3,3,25),(3,4,35),(3,5,45),(4,6,40),(4,7,50),(4,8,30),(4,9,20),(4,10,10),(5,11,60),(5,12,70),(5,13,20),(5,14,30),(5,15,40),(6,16,80),(6,17,90),(6,18,100),(6,19,110),(6,20,120),(7,21,15),(7,22,25),(7,23,35),(7,24,45),(7,25,55),(9,31,110),(9,32,120),(9,33,130),(9,34,140),(9,35,150),(10,36,15),(10,37,25),(10,38,35),(10,39,45),(10,40,55),(11,41,60),(11,42,70),(11,43,80),(11,44,90),(11,45,100),(12,46,110),(12,47,120),(12,48,130),(12,49,140),(12,50,150),(15,61,120),(15,62,130),(15,63,140),(15,64,150),(15,65,15),(16,66,25),(16,67,35),(16,68,45),(16,69,55),(16,70,65),(21,1,100),(21,2,100),(21,3,100),(21,4,100),(21,5,100),(23,4,134),(23,5,120),(23,7,23),(23,17,60),(23,152,3),(23,153,35),(201,1,100),(201,2,60),(201,3,220),(201,4,160),(201,5,98),(202,1,98),(202,2,45),(202,3,90),(202,4,56),(202,5,14),(203,1,400),(203,2,140),(203,3,440),(203,4,168),(203,5,998),(204,1,130),(204,2,160),(204,3,420),(204,4,430),(204,5,197),(205,1,110),(205,2,160),(205,3,120),(205,4,160),(205,5,198);
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_admin`
--

DROP TABLE IF EXISTS `system_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_admin` (
  `admin_id` int NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(255) NOT NULL,
  `admin_email` varchar(255) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_admin`
--

LOCK TABLES `system_admin` WRITE;
/*!40000 ALTER TABLE `system_admin` DISABLE KEYS */;
INSERT INTO `system_admin` VALUES (1,'Pesara Desilva','pesara.21@cse.mrt.ac.lk');
/*!40000 ALTER TABLE `system_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'pharmacy_database'
--

--
-- Dumping routines for database 'pharmacy_database'
--
/*!50003 DROP PROCEDURE IF EXISTS `GetNearestPharmaciesWithMedicines` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetNearestPharmaciesWithMedicines`(
    IN input_latitude DECIMAL(10, 6),
    IN input_longitude DECIMAL(10, 6),
    IN medicine_name_list VARCHAR(255), 
    IN d_range DECIMAL(10, 2) 
)
BEGIN
    DECLARE num_all_medicine_pharmacies INT DEFAULT 0;
    DECLARE remaining_limit INT DEFAULT 0;

    -- Step 1: Select pharmacies that have all the medicines
    SELECT COUNT(*) INTO num_all_medicine_pharmacies
    FROM (
        SELECT p.pharmacy_id, 
               (6371 * ACOS(COS(RADIANS(input_latitude)) * COS(RADIANS(p.latitude)) * 
               COS(RADIANS(p.longitude) - RADIANS(input_longitude)) + 
               SIN(RADIANS(input_latitude)) * SIN(RADIANS(p.latitude)))) AS distance
        FROM pharmacy p
        JOIN stock s ON p.pharmacy_id = s.pharmacy_id
        JOIN medicine m ON s.medicine_id = m.medicine_id
        WHERE FIND_IN_SET(m.name, medicine_name_list) > 0
        GROUP BY p.pharmacy_id
        HAVING COUNT(m.medicine_id) = (SELECT COUNT(*) FROM medicine WHERE FIND_IN_SET(name, medicine_name_list) > 0)
        AND distance <= d_range
    ) AS all_medicine_pharmacies;

    -- Step 2: Fetch the nearest pharmacies with all medicines
    IF num_all_medicine_pharmacies >= 7 THEN
        SELECT p.*, 
               (6371 * ACOS(COS(RADIANS(input_latitude)) * COS(RADIANS(p.latitude)) * 
               COS(RADIANS(p.longitude) - RADIANS(input_longitude)) + 
               SIN(RADIANS(input_latitude)) * SIN(RADIANS(p.latitude)))) AS distance
        FROM pharmacy p
        JOIN stock s ON p.pharmacy_id = s.pharmacy_id
        JOIN medicine m ON s.medicine_id = m.medicine_id
        WHERE FIND_IN_SET(m.name, medicine_name_list) > 0
        GROUP BY p.pharmacy_id
        HAVING COUNT(m.medicine_id) = (SELECT COUNT(*) FROM medicine WHERE FIND_IN_SET(name, medicine_name_list) > 0)
        AND distance <= d_range
        ORDER BY distance ASC
        LIMIT 7;

    ELSE
        SELECT p.*, 
               (6371 * ACOS(COS(RADIANS(input_latitude)) * COS(RADIANS(p.latitude)) * 
               COS(RADIANS(p.longitude) - RADIANS(input_longitude)) + 
               SIN(RADIANS(input_latitude)) * SIN(RADIANS(p.latitude)))) AS distance
        FROM pharmacy p
        JOIN stock s ON p.pharmacy_id = s.pharmacy_id
        JOIN medicine m ON s.medicine_id = m.medicine_id
        WHERE FIND_IN_SET(m.name, medicine_name_list) > 0
        GROUP BY p.pharmacy_id
        HAVING COUNT(m.medicine_id) = (SELECT COUNT(*) FROM medicine WHERE FIND_IN_SET(name, medicine_name_list) > 0)
        AND distance <= d_range
        ORDER BY distance ASC;

        SET remaining_limit = 7 - num_all_medicine_pharmacies;

        IF remaining_limit > 0 THEN
            SELECT p.*, 
                   (6371 * ACOS(COS(RADIANS(input_latitude)) * COS(RADIANS(p.latitude)) * 
                   COS(RADIANS(p.longitude) - RADIANS(input_longitude)) + 
                   SIN(RADIANS(input_latitude)) * SIN(RADIANS(p.latitude)))) AS distance,
                   COUNT(m.medicine_id) AS medicines_found
            FROM pharmacy p
            JOIN stock s ON p.pharmacy_id = s.pharmacy_id
            JOIN medicine m ON s.medicine_id = m.medicine_id
            WHERE FIND_IN_SET(m.name, medicine_name_list) > 0
            GROUP BY p.pharmacy_id
            HAVING COUNT(m.medicine_id) < (SELECT COUNT(*) FROM medicine WHERE FIND_IN_SET(name, medicine_name_list) > 0)
            AND distance <= d_range
            ORDER BY medicines_found DESC, distance ASC
            LIMIT remaining_limit;
        END IF;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertDummyData` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertDummyData`()
BEGIN
    DECLARE pharmacy_id INT;
    DECLARE medicine_id INT;
    DECLARE quantity INT;

    -- Loop through pharmacy_id from 2 to 16
    SET pharmacy_id = 2;
    WHILE pharmacy_id <= 16 DO
        SET medicine_id = 1;

        -- Loop through medicine_id from 1 to 150
        WHILE medicine_id <= 150 DO
            SET quantity = FLOOR(RAND() * 100) + 1; -- Random quantity between 1 and 100
            INSERT INTO stock (pharmacy_id, medicine_id, quantity)
            VALUES (pharmacy_id, medicine_id, quantity);
            SET medicine_id = medicine_id + 1; -- Increment medicine_id
        END WHILE;

        SET pharmacy_id = pharmacy_id + 1; -- Increment pharmacy_id
    END WHILE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-28 10:53:45
