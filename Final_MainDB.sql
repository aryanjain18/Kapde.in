-- MySQL dump 10.16  Distrib 10.1.48-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: db
-- ------------------------------------------------------
-- Server version	10.1.48-MariaDB-0+deb9u2
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */
;

/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */
;

/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */
;

/*!40101 SET NAMES utf8mb4 */
;

/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */
;

/*!40103 SET TIME_ZONE='+00:00' */
;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */
;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */
;

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */
;

/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */
;

--
-- Table structure for table `Admin`
--
DROP TABLE IF EXISTS `Admin`;

/*!40101 SET @saved_cs_client     = @@character_set_client */
;

/*!40101 SET character_set_client = utf8 */
;

CREATE TABLE `Admin` (
  `id` varchar(0) DEFAULT NULL,
  `password` varchar(0) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

/*!40101 SET character_set_client = @saved_cs_client */
;

--
-- Dumping data for table `Admin`
--
LOCK TABLES `Admin` WRITE;

/*!40000 ALTER TABLE `Admin` DISABLE KEYS */
;

/*!40000 ALTER TABLE `Admin` ENABLE KEYS */
;

UNLOCK TABLES;

--
-- Table structure for table `Brand`
--
DROP TABLE IF EXISTS `Brand`;

/*!40101 SET @saved_cs_client     = @@character_set_client */
;

/*!40101 SET character_set_client = utf8 */
;

CREATE TABLE `Brand` (
  `id` tinyint(4) DEFAULT NULL,
  `name` varchar(22) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

/*!40101 SET character_set_client = @saved_cs_client */
;

--
-- Dumping data for table `Brand`
--
LOCK TABLES `Brand` WRITE;

/*!40000 ALTER TABLE `Brand` DISABLE KEYS */
;

INSERT INTO
  `Brand`
VALUES
  (1, 'Louis Vuitton'),
(2, 'Gucci'),
(3, 'Prada'),
(4, 'CHANEL'),
(5, 'Dior'),
(6, 'Hermès'),
(7, 'Ralph Lauren'),
(8, 'Versace'),
(9, 'Balenciaga'),
(10, 'Adidas'),
(11, 'Armani'),
(12, 'Burberry'),
(13, 'Dolce and Gabbana logo'),
(14, 'Nike'),
(15, 'Fendi'),
(16, 'Saint Laurent'),
(17, 'ZARA'),
(18, 'Valentino');

/*!40000 ALTER TABLE `Brand` ENABLE KEYS */
;

UNLOCK TABLES;

--
-- Table structure for table `CartItem`
--
DROP TABLE IF EXISTS `CartItem`;

/*!40101 SET @saved_cs_client     = @@character_set_client */
;

/*!40101 SET character_set_client = utf8 */
;

CREATE TABLE `CartItem` (
  `id` tinyint(4) DEFAULT NULL,
  `product_id` tinyint(4) DEFAULT NULL,
  `user_id` tinyint(4) DEFAULT NULL,
  `quantity` tinyint(4) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

/*!40101 SET character_set_client = @saved_cs_client */
;

--
-- Dumping data for table `CartItem`
--
LOCK TABLES `CartItem` WRITE;

/*!40000 ALTER TABLE `CartItem` DISABLE KEYS */
;

INSERT INTO
  `CartItem`
VALUES
  (1, 35, 5, 5),
(2, 6, 27, 4),
(3, 44, 3, 8),
(4, 46, 13, 13),
(5, 25, 7, 15),
(6, 29, 15, 3),
(7, 50, 13, 15),
(8, 23, 19, 3),
(9, 16, 17, 6),
(10, 50, 25, 14),
(11, 32, 26, 3),
(12, 50, 5, 15),
(13, 24, 12, 5),
(14, 20, 11, 4),
(15, 26, 17, 11),
(16, 15, 21, 7),
(17, 43, 28, 9),
(18, 24, 13, 9),
(19, 4, 28, 5),
(20, 10, 15, 11),
(21, 41, 2, 13),
(22, 35, 13, 1),
(23, 39, 6, 11),
(24, 16, 13, 9),
(25, 22, 2, 3),
(26, 40, 6, 11),
(27, 44, 8, 10),
(28, 11, 7, 3),
(29, 7, 10, 15),
(30, 22, 5, 8);

/*!40000 ALTER TABLE `CartItem` ENABLE KEYS */
;

UNLOCK TABLES;

--
-- Table structure for table `OrderItem`
--
DROP TABLE IF EXISTS `OrderItem`;

/*!40101 SET @saved_cs_client     = @@character_set_client */
;

/*!40101 SET character_set_client = utf8 */
;

CREATE TABLE `OrderItem` (
  `user_id` varchar(0) DEFAULT NULL,
  `order_id` varchar(0) DEFAULT NULL,
  `product_id` varchar(0) DEFAULT NULL,
  `quantity` varchar(0) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

/*!40101 SET character_set_client = @saved_cs_client */
;

--
-- Dumping data for table `OrderItem`
--
LOCK TABLES `OrderItem` WRITE;

/*!40000 ALTER TABLE `OrderItem` DISABLE KEYS */
;

/*!40000 ALTER TABLE `OrderItem` ENABLE KEYS */
;

UNLOCK TABLES;

--
-- Table structure for table `Orders`
--
DROP TABLE IF EXISTS `Orders`;

/*!40101 SET @saved_cs_client     = @@character_set_client */
;

/*!40101 SET character_set_client = utf8 */
;

CREATE TABLE `Orders` (
  `id` varchar(0) DEFAULT NULL,
  `user_id` varchar(0) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

/*!40101 SET character_set_client = @saved_cs_client */
;

--
-- Dumping data for table `Orders`
--
LOCK TABLES `Orders` WRITE;

/*!40000 ALTER TABLE `Orders` DISABLE KEYS */
;

/*!40000 ALTER TABLE `Orders` ENABLE KEYS */
;

UNLOCK TABLES;

--
-- Table structure for table `Product`
--
DROP TABLE IF EXISTS `Product`;

/*!40101 SET @saved_cs_client     = @@character_set_client */
;

/*!40101 SET character_set_client = utf8 */
;

CREATE TABLE `Product` (
  `id` tinyint(4) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(34) DEFAULT NULL,
  `price` decimal(5, 1) DEFAULT NULL,
  `brand_id` tinyint(4) DEFAULT NULL,
  `quantity` tinyint(4) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

/*!40101 SET character_set_client = @saved_cs_client */
;

--
-- Dumping data for table `Product`
--
LOCK TABLES `Product` WRITE;

/*!40000 ALTER TABLE `Product` DISABLE KEYS */
;

INSERT INTO
  `Product`
VALUES
  (
    1,
    'CHANEL Baggy Textured Jogger 3XL',
    'Trendy Jogger by CHANEL',
    3314.0,
    4,
    18
  ),
(
    2,
    'Burberry Oversized Denim Jeans S',
    'Trendy Jeans by Burberry',
    4147.0,
    12,
    30
  ),
(
    3,
    'ZARA Oversized Textured Pullover XL',
    'Trendy Pullover by ZARA',
    4415.0,
    17,
    19
  ),
(
    4,
    'Ralph Lauren Relaxed Denim Short 3XL',
    'Trendy Short by Ralph Lauren',
    4691.0,
    7,
    26
  ),
(
    5,
    'Armani Straight Corduroy Sweater XL',
    'Trendy Sweater by Armani',
    2661.0,
    11,
    27
  ),
(
    6,
    'Saint Laurent Baggy Denim Jacket M',
    'Trendy Jacket by Saint Laurent',
    4708.0,
    16,
    22
  ),
(
    7,
    'ZARA Loose Ribbed Blazer XXL',
    'Trendy Blazer by ZARA',
    4775.0,
    17,
    29
  ),
(
    8,
    'ZARA Oversized Ribbed Sweatshirt XXS',
    'Trendy Sweatshirt by ZARA',
    2931.0,
    17,
    17
  ),
(
    9,
    'Fendi Slim Denim Capri XXS',
    'Trendy Capri by Fendi',
    3826.0,
    15,
    15
  ),
(
    10,
    'Nike Relaxed Corduroy Jeans 3XL',
    'Trendy Jeans by Nike',
    2687.0,
    14,
    14
  ),
(
    11,
    'Ralph Lauren Relaxed Textured Capri XXS',
    'Trendy Capri by Ralph Lauren',
    3671.0,
    7,
    1
  ),
(
    12,
    'Prada Relaxed Denim Blazer L',
    'Trendy Blazer by Prada',
    2269.0,
    3,
    29
  ),
(
    13,
    'Fendi Baggy Denim Cargo S',
    'Trendy Cargo by Fendi',
    4402.0,
    15,
    11
  ),
(
    14,
    'Armani Slim Corduroy Jacket XXL',
    'Trendy Jacket by Armani',
    2315.0,
    11,
    2
  ),
(
    15,
    'Nike Oversized Ribbed Pant XXL',
    'Trendy Pant by Nike',
    2611.0,
    14,
    22
  ),
(
    16,
    'Louis Vuitton Oversized Denim Shirt XL',
    'Trendy Shirt by Louis Vuitton',
    4995.0,
    1,
    16
  ),
(
    17,
    'Hermes Oversized Ribbed Coat XL',
    'Trendy Coat by Hermes',
    3041.0,
    6,
    27
  ),
(
    18,
    'CHANEL Loose Corduroy Jogger S',
    'Trendy Jogger by CHANEL',
    2422.0,
    4,
    20
  ),
(
    19,
    'Dior Straight Textured Jacket XL',
    'Trendy Jacket by Dior',
    3312.0,
    5,
    10
  ),
(
    20,
    'Gucci Regular Colour-Block Overshirt S',
    'Trendy Overshirt by Gucci',
    2188.0,
    2,
    24
  ),
(
    21,
    'ZARA Relaxed Textured Shirt L',
    'Trendy Shirt by ZARA',
    2638.0,
    17,
    6
  ),
(
    22,
    'CHANEL Baggy Textured Pullover L',
    'Trendy Pullover by CHANEL',
    3687.0,
    4,
    5
  ),
(
    23,
    'Valentino Baggy Plain Jacket M',
    'Trendy Jacket by Valentino',
    2898.0,
    18,
    16
  ),
(
    24,
    'Dior Relaxed Colour-Block Capri S',
    'Trendy Capri by Dior',
    4305.0,
    5,
    9
  ),
(
    25,
    'Dior Oversized Ribbed Sweatshirt XL',
    'Trendy Sweatshirt by Dior',
    4405.0,
    5,
    12
  ),
(
    26,
    'Gucci Slim Colour-Block Sweatpants XL',
    'Trendy Sweatpants by Gucci',
    2497.0,
    2,
    7
  ),
(
    27,
    'Valentino Relaxed Denim Coat S',
    'Trendy Coat by Valentino',
    3865.0,
    18,
    30
  ),
(
    28,
    'Burberry Baggy Textured Cargo XS',
    'Trendy Cargo by Burberry',
    3124.0,
    12,
    7
  ),
(
    29,
    'Hermes Regular Textured Short XXS',
    'Trendy Short by Hermes',
    3519.0,
    6,
    14
  ),
(
    30,
    'Armani Baggy Denim Sweatshirt L',
    'Trendy Sweatshirt by Armani',
    3538.0,
    11,
    14
  ),
(
    31,
    'Burberry Regular Denim Jogger S',
    'Trendy Jogger by Burberry',
    2420.0,
    12,
    25
  ),
(
    32,
    'Hermes Relaxed Ribbed Jeans L',
    'Trendy Jeans by Hermes',
    3223.0,
    6,
    1
  ),
(
    33,
    'Fendi Baggy Denim Jeans XL',
    'Trendy Jeans by Fendi',
    3294.0,
    15,
    3
  ),
(
    34,
    'Burberry Loose Ribbed Short S',
    'Trendy Short by Burberry',
    3190.0,
    12,
    12
  ),
(
    35,
    'Balenciaga Baggy Corduroy Capri S',
    'Trendy Capri by Balenciaga',
    2629.0,
    9,
    6
  ),
(
    36,
    'Ralph Lauren Loose Plain Cargo XL',
    'Trendy Cargo by Ralph Lauren',
    4729.0,
    7,
    27
  ),
(
    37,
    'ZARA Straight Denim Jogger XS',
    'Trendy Jogger by ZARA',
    3279.0,
    17,
    1
  ),
(
    38,
    'Fendi Baggy Colour-Block Capri M',
    'Trendy Capri by Fendi',
    2810.0,
    15,
    12
  ),
(
    39,
    'Burberry Slim Corduroy Short S',
    'Trendy Short by Burberry',
    4745.0,
    12,
    3
  ),
(
    40,
    'Valentino Relaxed Colour-Block Sweatpants 3XL',
    'Trendy Sweatpants by Valentino',
    3843.0,
    18,
    18
  ),
(
    41,
    'Balenciaga Slim Denim Pant M',
    'Trendy Pant by Balenciaga',
    3163.0,
    9,
    28
  ),
(
    42,
    'Ralph Lauren Relaxed Denim Overshirt M',
    'Trendy Overshirt by Ralph Lauren',
    2986.0,
    7,
    4
  ),
(
    43,
    'Burberry Regular Plain Cargo L',
    'Trendy Cargo by Burberry',
    3893.0,
    12,
    16
  ),
(
    44,
    'Armani Loose Ribbed Sweatpants 3XL',
    'Trendy Sweatpants by Armani',
    4754.0,
    11,
    25
  ),
(
    45,
    'Dior Loose Denim Trousers XXL',
    'Trendy Trousers by Dior',
    2687.0,
    5,
    19
  ),
(
    46,
    'CHANEL Oversized Denim Trousers XXS',
    'Trendy Trousers by CHANEL',
    4292.0,
    4,
    19
  ),
(
    47,
    'Gucci Straight Textured Hoodie XXS',
    'Trendy Hoodie by Gucci',
    2176.0,
    2,
    28
  ),
(
    48,
    'Fendi Baggy Denim Shirt XXL',
    'Trendy Shirt by Fendi',
    4375.0,
    15,
    1
  ),
(
    49,
    'Ralph Lauren Baggy Textured Capri XXS',
    'Trendy Capri by Ralph Lauren',
    2742.0,
    7,
    19
  ),
(
    50,
    'Louis Vuitton Relaxed Textured Sweatshirt XXL',
    'Trendy Sweatshirt by Louis Vuitton',
    4414.0,
    1,
    23
  );

/*!40000 ALTER TABLE `Product` ENABLE KEYS */
;

UNLOCK TABLES;

--
-- Table structure for table `User`
--
DROP TABLE IF EXISTS `User`;

/*!40101 SET @saved_cs_client     = @@character_set_client */
;

/*!40101 SET character_set_client = utf8 */
;

CREATE TABLE `User` (
  `id` tinyint(4) DEFAULT NULL,
  `username` varchar(14) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `is_customer` tinyint(4) DEFAULT NULL,
  `house_num` varchar(6) DEFAULT NULL,
  `locality` varchar(15) DEFAULT NULL,
  `city` varchar(9) DEFAULT NULL,
  `state` varchar(13) DEFAULT NULL,
  `pin_code` mediumint(9) DEFAULT NULL,
  `country` varchar(5) DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

/*!40101 SET character_set_client = @saved_cs_client */
;

--
-- Dumping data for table `User`
--
LOCK TABLES `User` WRITE;

/*!40000 ALTER TABLE `User` DISABLE KEYS */
;

INSERT INTO
  `User`
VALUES
  (
    1,
    'Amit Singh',
    'd74ff0ee8da3b9806b18c877dbf29bbde50b5bd8e4dad7a3a725000feb82e8f1',
    1,
    'A-123',
    'Connaught Place',
    'New Delhi',
    'Delhi',
    110001,
    'India',
    'M'
  ),
(
    2,
    'Deepika Sharma',
    'd74ff0ee8da3b9806b18c877dbf29bbde50b5bd8e4dad7a3a725000feb82e8f1',
    1,
    'B-456',
    'Koregaon Park',
    'Pune',
    'Maharashtra',
    411001,
    'India',
    'F'
  ),
(
    3,
    'Vikram Patel',
    'd74ff0ee8da3b9806b18c877dbf29bbde50b5bd8e4dad7a3a725000feb82e8f1',
    1,
    'C-789',
    'Koramangala',
    'Bangalore',
    'Karnataka',
    560001,
    'India',
    'M'
  ),
(
    4,
    'Ananya Gupta',
    'd74ff0ee8da3b9806b18c877dbf29bbde50b5bd8e4dad7a3a725000feb82e8f1',
    1,
    'D-456',
    'Baner',
    'Pune',
    'Maharashtra',
    411045,
    'India',
    'F'
  ),
(
    5,
    'Rahul Kumar',
    'd74ff0ee8da3b9806b18c877dbf29bbde50b5bd8e4dad7a3a725000feb82e8f1',
    1,
    'E-789',
    'Malviya Nagar',
    'Jaipur',
    'Rajasthan',
    302017,
    'India',
    'M'
  ),
(
    6,
    'Neha Agarwal',
    'd74ff0ee8da3b9806b18c877dbf29bbde50b5bd8e4dad7a3a725000feb82e8f1',
    1,
    'F-101',
    'Viman Nagar',
    'Pune',
    'Maharashtra',
    411014,
    'India',
    'F'
  ),
(
    7,
    'Rajesh Singh',
    'd74ff0ee8da3b9806b18c877dbf29bbde50b5bd8e4dad7a3a725000feb82e8f1',
    1,
    'G-123',
    'Bandra',
    'Mumbai',
    'Maharashtra',
    400050,
    'India',
    'M'
  ),
(
    8,
    'Pooja Sharma',
    'd74ff0ee8da3b9806b18c877dbf29bbde50b5bd8e4dad7a3a725000feb82e8f1',
    1,
    'H-456',
    'Sadar Bazaar',
    'Agra',
    'Uttar Pradesh',
    282001,
    'India',
    'F'
  ),
(
    9,
    'Sandeep Kumar',
    'd74ff0ee8da3b9806b18c877dbf29bbde50b5bd8e4dad7a3a725000feb82e8f1',
    1,
    'I-789',
    'Indiranagar',
    'Bangalore',
    'Karnataka',
    560008,
    'India',
    'M'
  ),
(
    10,
    'Anjali Mishra',
    'd74ff0ee8da3b9806b18c877dbf29bbde50b5bd8e4dad7a3a725000feb82e8f1',
    1,
    'J-101',
    'Gomti Nagar',
    'Lucknow',
    'Uttar Pradesh',
    226010,
    'India',
    'F'
  ),
(
    11,
    'Manoj Patel',
    'd74ff0ee8da3b9806b18c877dbf29bbde50b5bd8e4dad7a3a725000feb82e8f1',
    1,
    'K-123',
    'Ballygunge',
    'Kolkata',
    'West Bengal',
    700019,
    'India',
    'M'
  ),
(
    12,
    'Shreya Gupta',
    'd74ff0ee8da3b9806b18c877dbf29bbde50b5bd8e4dad7a3a725000feb82e8f1',
    1,
    'L-456',
    'Jayanagar',
    'Bangalore',
    'Karnataka',
    560011,
    'India',
    'F'
  ),
(
    13,
    'Arun Kumar',
    'd74ff0ee8da3b9806b18c877dbf29bbde50b5bd8e4dad7a3a725000feb82e8f1',
    1,
    'M-789',
    'Anna Nagar',
    'Chennai',
    'Tamil Nadu',
    600040,
    'India',
    'M'
  ),
(
    14,
    'Riya Singh',
    'd74ff0ee8da3b9806b18c877dbf29bbde50b5bd8e4dad7a3a725000feb82e8f1',
    1,
    'N-101',
    'Alipore',
    'Kolkata',
    'West Bengal',
    700027,
    'India',
    'F'
  ),
(
    15,
    'Sanjay Sharma',
    'd74ff0ee8da3b9806b18c877dbf29bbde50b5bd8e4dad7a3a725000feb82e8f1',
    1,
    'O-123',
    'Hinjewadi',
    'Pune',
    'Maharashtra',
    411057,
    'India',
    'M'
  ),
(
    16,
    'Ananya Verma',
    'd74ff0ee8da3b9806b18c877dbf29bbde50b5bd8e4dad7a3a725000feb82e8f1',
    1,
    'P-456',
    'Juhu',
    'Mumbai',
    'Maharashtra',
    400049,
    'India',
    'F'
  ),
(
    17,
    'Vivek Gupta',
    'd74ff0ee8da3b9806b18c877dbf29bbde50b5bd8e4dad7a3a725000feb82e8f1',
    1,
    'Q-789',
    'Nungambakkam',
    'Chennai',
    'Tamil Nadu',
    600034,
    'India',
    'M'
  ),
(
    18,
    'Preeti Patel',
    'd74ff0ee8da3b9806b18c877dbf29bbde50b5bd8e4dad7a3a725000feb82e8f1',
    1,
    'R-101',
    'Kukatpally',
    'Hyderabad',
    'Telangana',
    500072,
    'India',
    'F'
  ),
(
    19,
    'Kunal Shah',
    'd74ff0ee8da3b9806b18c877dbf29bbde50b5bd8e4dad7a3a725000feb82e8f1',
    1,
    'S-123',
    'M.G. Road',
    'Bangalore',
    'Karnataka',
    560001,
    'India',
    'M'
  ),
(
    20,
    'Swati Mishra',
    'd74ff0ee8da3b9806b18c877dbf29bbde50b5bd8e4dad7a3a725000feb82e8f1',
    1,
    'T-456',
    'Jayanagar',
    'Bangalore',
    'Karnataka',
    560069,
    'India',
    'F'
  ),
(
    21,
    'Rahul Sharma',
    'd74ff0ee8da3b9806b18c877dbf29bbde50b5bd8e4dad7a3a725000feb82e8f1',
    1,
    'U-789',
    'Hazratganj',
    'Lucknow',
    'Uttar Pradesh',
    226001,
    'India',
    'M'
  ),
(
    22,
    'Shivani Gupta',
    'd74ff0ee8da3b9806b18c877dbf29bbde50b5bd8e4dad7a3a725000feb82e8f1',
    1,
    'V-101',
    'Dadar',
    'Mumbai',
    'Maharashtra',
    400014,
    'India',
    'F'
  ),
(
    23,
    'Alok Singh',
    'd74ff0ee8da3b9806b18c877dbf29bbde50b5bd8e4dad7a3a725000feb82e8f1',
    1,
    'W-123',
    'Salt Lake City',
    'Kolkata',
    'West Bengal',
    700064,
    'India',
    'M'
  ),
(
    24,
    'Meera Patel',
    'd74ff0ee8da3b9806b18c877dbf29bbde50b5bd8e4dad7a3a725000feb82e8f1',
    1,
    'X-456',
    'Pashan',
    'Pune',
    'Maharashtra',
    411021,
    'India',
    'F'
  ),
(
    25,
    'Rahul Verma',
    'd74ff0ee8da3b9806b18c877dbf29bbde50b5bd8e4dad7a3a725000feb82e8f1',
    1,
    'Y-789',
    'Thiruvanmiyur',
    'Chennai',
    'Tamil Nadu',
    600041,
    'India',
    'M'
  ),
(
    26,
    'Kavya Sharma',
    'd74ff0ee8da3b9806b18c877dbf29bbde50b5bd8e4dad7a3a725000feb82e8f1',
    1,
    'Z-101',
    'Koramangala',
    'Bangalore',
    'Karnataka',
    560034,
    'India',
    'F'
  ),
(
    27,
    'Amit Singh',
    'd74ff0ee8da3b9806b18c877dbf29bbde50b5bd8e4dad7a3a725000feb82e8f1',
    1,
    'AA-123',
    'Hadapsar',
    'Pune',
    'Maharashtra',
    411028,
    'India',
    'M'
  ),
(
    28,
    'Shweta Gupta',
    'd74ff0ee8da3b9806b18c877dbf29bbde50b5bd8e4dad7a3a725000feb82e8f1',
    1,
    'AB-456',
    'Kalina',
    'Mumbai',
    'Maharashtra',
    400098,
    'India',
    'F'
  );

/*!40000 ALTER TABLE `User` ENABLE KEYS */
;

UNLOCK TABLES;

--
-- Table structure for table `sqlite_sequence`
--
DROP TABLE IF EXISTS `sqlite_sequence`;

/*!40101 SET @saved_cs_client     = @@character_set_client */
;

/*!40101 SET character_set_client = utf8 */
;

CREATE TABLE `sqlite_sequence` (
  `name` varchar(8) DEFAULT NULL,
  `seq` tinyint(4) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

/*!40101 SET character_set_client = @saved_cs_client */
;

--
-- Dumping data for table `sqlite_sequence`
--
LOCK TABLES `sqlite_sequence` WRITE;

/*!40000 ALTER TABLE `sqlite_sequence` DISABLE KEYS */
;

INSERT INTO
  `sqlite_sequence`
VALUES
  ('User', 28),
('Brand', 18),
('Product', 50),
('CartItem', 30);

/*!40000 ALTER TABLE `sqlite_sequence` ENABLE KEYS */
;

UNLOCK TABLES;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */
;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */
;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */
;

/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */
;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */
;

/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */
;

/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */
;

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */
;

-- Dump completed on 2023-11-11 11:57:01