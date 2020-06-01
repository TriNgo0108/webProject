-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: wefi
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `bestseller`
--

DROP TABLE IF EXISTS `bestseller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bestseller` (
  `pid` int(11) NOT NULL,
  PRIMARY KEY (`pid`),
  CONSTRAINT `fk_bs` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bestseller`
--

LOCK TABLES `bestseller` WRITE;
/*!40000 ALTER TABLE `bestseller` DISABLE KEYS */;
INSERT INTO `bestseller` VALUES (24),(28),(53),(61);
/*!40000 ALTER TABLE `bestseller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `uid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `quality` int(11) NOT NULL,
  PRIMARY KEY (`pid`,`uid`),
  KEY `fk_cart1` (`uid`),
  CONSTRAINT `fk_cart1` FOREIGN KEY (`uid`) REFERENCES `customer` (`uid`),
  CONSTRAINT `fk_cart2` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (9,16,1),(9,22,1),(10,22,7),(10,24,1),(10,28,6);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `city_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cid`),
  UNIQUE KEY `city_name` (`city_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (3,'An Giang'),(1,'Cần Thơ'),(4,'Hậu Giang'),(2,'Hồ Chí Minh');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `did` int(11) DEFAULT NULL,
  `street` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `email` (`email`),
  KEY `fk_user1` (`cid`),
  KEY `fk_user2` (`did`),
  CONSTRAINT `fk_user1` FOREIGN KEY (`cid`) REFERENCES `district` (`cid`),
  CONSTRAINT `fk_user2` FOREIGN KEY (`did`) REFERENCES `district` (`did`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'NgoTri','12345','tringo0108@gmail.com','123456789',1,1,'An khanh'),(9,'Yến','200499','yennhi2004@gmail.com','0358881616',3,43,'Huu Nghi'),(10,'glennngo','qwerty','glennngo@gmail.com','0771234567',1,1,'An khanh');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `district`
--

DROP TABLE IF EXISTS `district`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `district` (
  `cid` int(11) NOT NULL,
  `did` int(11) NOT NULL AUTO_INCREMENT,
  `district_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`did`,`cid`),
  KEY `cid` (`cid`),
  CONSTRAINT `district_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `city` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `district`
--

LOCK TABLES `district` WRITE;
/*!40000 ALTER TABLE `district` DISABLE KEYS */;
INSERT INTO `district` VALUES (1,1,' Quận Ninh kiều'),(1,2,'Quận Bình Thủy'),(1,3,'Quận Cái Răng'),(1,4,'Quận Ô Môn'),(1,5,'Quận Thốt Nốt'),(1,6,'Huyện Cờ Đỏ'),(1,7,'Huyện Phong Điền'),(1,8,'Huyện Thới Lai'),(1,9,'Huyện Vĩnh Thạnh'),(2,10,'Quận 1'),(2,11,'Quận 2'),(2,12,'Quận 3'),(2,13,'Quận 4'),(2,14,'Quận 5'),(2,15,'Quận 6'),(2,16,'Quận 7'),(2,17,'Quận 8'),(2,18,'Quận 9'),(2,19,'Quận 10'),(2,20,'Quận 11'),(2,21,'Quận 12'),(2,22,'Quận Bình Tân'),(2,23,'Quận Bình Thạnh'),(2,24,'Quận Gò Vấp'),(2,25,'Quận Phú Nhuận'),(2,26,'Quận Tân Bình'),(2,27,'Quận Tân Phú'),(2,28,'Quận Thủ Đức'),(2,29,'Huyện Bình Chánh'),(2,30,'Huyện Cần Giờ'),(2,31,'Huyện Củ Chi'),(2,32,'Huyện Hóc Môn'),(2,33,'Huyện Nhà Bè'),(3,34,'Thành Phố Long Xuyên'),(3,35,'Thành Phố Châu Đốc'),(3,36,'Thị Xã Tân Châu'),(3,37,'Huyện An Phú'),(3,38,'Huyện Châu Phú'),(3,39,'Huyện Châu Thành'),(3,40,'Huyện Chợ Mới'),(3,41,'Huyện Phú Tân'),(3,42,'Huyện Thoại Sơn'),(3,43,'Huyện Tịnh Biên'),(3,44,'Huyện Tri Tôn'),(4,45,'Thành Phố Vị Thanh'),(4,46,'Thành Phố Ngã Bảy'),(4,47,'Thị Xã Long Mỹ'),(4,48,'Huyện Châu Thành'),(4,49,'Huyện Châu Thành A'),(4,50,'Huyện Châu Thành'),(4,51,'Huyện Long Mỹ'),(4,52,'Huyện Phung Hiệp'),(4,53,'Huyện Vị Thủy');
/*!40000 ALTER TABLE `district` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes` (
  `uid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  PRIMARY KEY (`pid`,`uid`),
  KEY `fk_likes1` (`uid`),
  CONSTRAINT `fk_likes1` FOREIGN KEY (`uid`) REFERENCES `customer` (`uid`),
  CONSTRAINT `fk_likes2` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (1,16),(10,22),(10,28);
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `limitproduct`
--

DROP TABLE IF EXISTS `limitproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `limitproduct` (
  `pid` int(11) NOT NULL,
  PRIMARY KEY (`pid`),
  CONSTRAINT `fk_lp` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `limitproduct`
--

LOCK TABLES `limitproduct` WRITE;
/*!40000 ALTER TABLE `limitproduct` DISABLE KEYS */;
INSERT INTO `limitproduct` VALUES (19),(21),(22),(52);
/*!40000 ALTER TABLE `limitproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newproduct`
--

DROP TABLE IF EXISTS `newproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `newproduct` (
  `pid` int(11) NOT NULL,
  PRIMARY KEY (`pid`),
  CONSTRAINT `fk_np` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newproduct`
--

LOCK TABLES `newproduct` WRITE;
/*!40000 ALTER TABLE `newproduct` DISABLE KEYS */;
INSERT INTO `newproduct` VALUES (43),(56),(117),(118);
/*!40000 ALTER TABLE `newproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `uid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `quality` int(11) NOT NULL,
  `orderDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pid`,`uid`),
  KEY `fk_orders1` (`uid`),
  CONSTRAINT `fk_orders1` FOREIGN KEY (`uid`) REFERENCES `customer` (`uid`),
  CONSTRAINT `fk_orders2` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,1,'2020-05-25 03:26:56'),(1,7,1,'2020-05-26 00:13:06'),(1,16,1,'2020-05-25 23:19:42'),(1,53,1,'2020-05-28 03:20:27');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `pTid` int(11) DEFAULT NULL,
  `imageURL` varchar(50) DEFAULT NULL,
  `product_name` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  `about` varchar(800) DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `fk_product` (`pTid`),
  FULLTEXT KEY `product_name` (`product_name`),
  CONSTRAINT `fk_product` FOREIGN KEY (`pTid`) REFERENCES `producttype` (`pTid`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,1,'./img/game/7daystodie.jpg','7 days to die',400000,'The Fun Pimps,The game\'s events happen during aftermath of a nuclear Third World War that destroyed an extremely large part of the world.'),(2,1,'./img/game/ark.jpg','Ark: Survival Evolved',400000,'Studio Wildcard,Survival Evolved is an action-adventure survival game set in an open world environment with a dynamic'),(3,1,'./img/game/ASunity.jpg','Assassin\'s Creed Unity',400000,'Ubisoft,Assassin\'s Creed Unity is an action-adventure[2] stealth game set in an open world environment. '),(4,1,'./img/game/batman.jpg','Batman: Arkham City',400000,'Warner Bros. Interactive Entertainment,Batman: Arkham City is an open-world[13] action-adventure game that incorporates tactics from stealth games.'),(5,1,'./img/game/CallofDuty.jpg','Call Of Duty',400000,'Activision,World at War [5] features more mature themes than previous Call of Duty installments and [6] is open-ended, giving the player multiple ways to complete objectives'),(6,1,'./img/game/clannad.jpg','Clannad',400000,'The story follows the life of Tomoya Okazaki, an average high school student who meets many people in his last year at school'),(7,1,'./img/game/DeadbyDayLight.jpg','Dead by DayLight',400000,'Starbreeze Studios,A group of up to four survivors must elude one killer. The survivors\' perspectives are third-person,'),(8,1,'./img/game/Depth.jpg','Depth',400000,'Digital Confectioners,The game is a first-person shooter taking place in underwater environments. Players can either be divers or sharks. '),(9,1,'./img/game/DontStarve.jpg','Don\'t Starve',400000,'505 Games,The game follows a scientist named Wilson who finds himself in a dark, dreary world and must survive as long as possible. '),(10,1,'./img/game/ff9.jpg','Final Fanatsy IX',400000,'Square,The plot centers on the consequences of a war between nations in a medieval fantasy world called Gaia. Players follow bandit Zidane Tribal'),(11,1,'./img/game/GTA5.jpg','Grand Theft Auto V',400000,'Rockstar Games,Set within the fictional state of San Andreas, based on Southern California,'),(12,1,'./img/game/HL2.jpg','Half Life 2',400000,'Valve,Some years after Gordon Freeman and other scientists accidentally opened a portal to a dimension of hostile aliens at the Black Mesa Research Facility'),(13,1,'./img/game/MKX.jpg','Mortal Kombat X',400000,'Warner Bros. Interactive Entertainment,Two years after the defeat of Outworld\'s ruler, Shao Kahn, '),(14,1,'./img/game/paper.jpg','Paper Please!',400000,'3909 LLC,In Papers, Please, the player takes on the role of a border-crossing immigration officer in the fictional dystopian Eastern Bloc-like country of Arstotzka,'),(15,1,'./img/game/wichter3.jpg','The Wichter 3',400000,'CD Projekt,Players control Geralt of Rivia, a monster slayer known as a Witcher.[1] Geralt walks, runs, rolls and dodges, and (for the first time in the series) '),(16,2,'./img/figure/silica.jpg','Silica  - Kiếm kĩ trực tuyến',500000,'Reki Kawahara,A-1 Pictures,Vào năm 2022, trò chơi Virtual Reality Massively Multiplayer Online Role-Playing Game '),(17,2,'./img/figure/alice.jpg','Alice Zuberg - Sword art online alicization war of underworld',500000,'Reki Kawahara,A-1 Pictures,Inside an unknown VR environment, '),(18,2,'./img/figure/alice_1.jpg','Alice Zuberg - Sword art online alicization war of underworld',500000,'Reki Kawahara,A-1 Pictures,Inside an unknown VR environment,'),(19,2,'./img/figure/aqua.jpg','Aqua - Konosu',500000,'Natsume Akatsuki,Studio DEEN,Following an untimely and embarrassing death, Kazuma Satō, a Japanese teenager shut-in NEET, '),(20,2,'./img/figure/asta.jpg','Asta - Black Clover',500000,'Yūki Tabata,Pierrot,The series focuses on Asta, a young orphan who was raised from birth after being abandoned at an orphanage along with his fellow orphan, Yuno. '),(21,2,'./img/figure/asuna.jpg','Asuna  - Sword Art Online',500000,'Reki Kawahara,Tomohiko Itō,A-1 Pictures,Vào năm 2022, trò chơi Virtual Reality Massively Multiplayer Online Role-Playing Game '),(22,2,'./img/figure/asunaDress.jpg','Asuna  - Sword art online',500000,'Reki Kawahara,A-1 Pictures,Vào năm 2022, trò chơi Virtual Reality Massively Multiplayer Online Role-Playing Game '),(23,2,'./img/figure/asunaNormal.jpg','Asuna  - Sword art online',500000,'Reki Kawahara,A-1 Pictures,Vào năm 2022, trò chơi Virtual Reality Massively Multiplayer Online Role-Playing Game'),(24,2,'./img/figure/asunaStudent.jpg','Asuna  - Sword art online',500000,'Reki Kawahara,A-1 Pictures,Vào năm 2022, trò chơi Virtual Reality Massively Multiplayer Online Role-Playing Game '),(25,2,'./img/figure/asunaSword.jpg','Asuna  - Sword art online',500000,'Reki Kawahara,A-1 Pictures,Vào năm 2022, trò chơi Virtual Reality Massively Multiplayer Online Role-Playing Game '),(26,2,'./img/figure/blackGoku.jpg','Black goku - Dragon ball super',500000,'Akira Toriyama,Toei Animation,Goku Black\'s first television appearance is when he is seen by Future Trunks destroying buildings and cities, he then kills Future Trunks\' mother Future Bulma before he engaged in battle with Trunks. When Trunks turns into a Super Saiyan he is overwhelmed by Goku Black and he quickly finds a place to hide in order'),(27,2,'./img/figure/darkness.jpg','DarkNess - Konosuba',500000,'Natsume Akatsuki,Studio DEEN,Following an untimely and embarrassing death, Kazuma Satō, a Japanese teenager shut-in NEET, meets a goddess named Aqua, who offers to reincarnate him in a parallel world with MMORPG elements, where he can go on adventures and battle monsters. Despite being offered a superpowered item or ability to use in this new world, Kazuma'),(28,2,'./img/figure/dragon.jpg','Dragon God - Dragon Ball',500000,'Akira Toriyama,Bird Studio/Shueisha,During the early chapters of the manga Toriyama\'s editor, Kazuhiko Torishima, commented that Goku looked rather plain, so to combat this he added several characters like Kame-Sen\'nin and Kuririn, and created the Tenkaichi Budōkai martial arts tournament to focus the storyline on fighting. '),(29,2,'./img/figure/eugeo.jpg','Eugeo - Sword art online alicization war of underworld',500000,'Reki Kawahara,Tomohiko Itō,A-1 Pictures,Inside an unknown VR environment, Kirito spends his days as a child with his friends Eugeo and Alice. One day the three explore a cave in the outskirts of the Human Territory and get lost, ending up at the boundary of the Dark Territory. Alice trips and falls with her hand accidentally touching the Dark Territory. For this violation'),(30,2,'./img/figure/gokuBlue.jpg','Super sayan Blue - Dragon ball super',500000,'Akira Toriyama,Toei Animation,Goku Black\'s first television appearance is when he is seen by Future Trunks destroying buildings and cities, he then kills Future Trunks\' mother Future Bulma before he engaged in battle with Trunks. When Trunks turns into a Super Saiyan he is overwhelmed by Goku Black and he quickly finds a place to hide in order to find his time machine and go back in time merely escapes Goku Black with the time machine while severely injured. '),(31,2,'./img/figure/kakashi.jpg','Kakashi- Naruto',500000,'Masashi Kishimoto,Pierrot,A powerful fox known as the Nine-Tails attacks Konoha, the hidden leaf village in the Land of Fire, one of the Five Great Shinobi Countries in the Ninja World. In response, the leader of Konoha, the Fourth Hokage, seals the fox inside the body of his newborn son, Naruto Uzumaki, making Naruto a host of the beast;[e] this costs Naruto\'s father his life, and the Third Hokage returns from retirement to become leader of Konoha again.'),(32,2,'./img/figure/KiritoELF.jpg','Kirito  - Sword art online',500000,'Reki Kawahara,Tomohiko Itō,A-1 Pictures,Vào năm 2022, trò chơi Virtual Reality Massively Multiplayer Online Role-Playing Game (Game nhập vai thực tại ảo trực tuyến nhiều người chơi-VRMMORPG) đầu tiên, Sword Art Online (SAO), được ra mắt. Nhờ Nerve Gear, một chiếc mũ thực tại ảo có thể tác động vào năm giác quan của người sử dụng thông qua não bộ của họ, người chơi có thể trải nghiệm và điều khiển nhân vật ảo trong game của họ bằng ý nghĩ.'),(33,2,'./img/figure/kiritoStudent.jpg','Kirito  - Sword art online',500000,'Reki Kawahara,Tomohiko Itō,A-1 Pictures,Vào năm 2022, trò chơi Virtual Reality Massively Multiplayer Online Role-Playing Game (Game nhập vai thực tại ảo trực tuyến nhiều người chơi-VRMMORPG) đầu tiên, Sword Art Online (SAO), được ra mắt. Nhờ Nerve Gear, một chiếc mũ thực tại ảo có thể tác động vào năm giác quan của người sử dụng thông qua não bộ của họ, người chơi có thể trải nghiệm và điều khiển nhân vật ảo trong game của họ bằng ý nghĩ.'),(34,2,'./img/figure/llenn.jpg','Llenn  - Sword Art Online Alternative Gun Gale Online',500000,'Yōsuke Kuroda,3Hz,Due to the incident that occurred in VR MMORPG Sword Art Online—where 10,000 players were trapped in the game on launch day—the popularity of VR games has plummeted due to fear of similar incidents. The NerveGear SAO\'s VR device, was recalled and destroyed, but with the launch of its successor, the AmuSphere, combined with release of the license-free development support package the \"Seed\"'),(35,2,'./img/figure/luffy.jpg','Luffy  - One Piece',500000,'Eiichiro Oda,Production I.G,Câu truyện bắt đầu với cảnh xử tử của Vua Hải Tặc (海賊王 Kaizokuō?) Gol D. Roger. Ngay trước khi chết, Roger tiết lộ rằng kho báu của ông ta để hết ở ngoài biển ấy nếu ai tìm được sẽ là của kẻ đó. Và thế là những người có máu phiêu lưu và những kẻ tham vọng đều đổ xô ra biển tìm kiếm kho báu vĩ đại nhất, One Piece (ひとつなぎの大秘宝 ワンピース Wan Pīsu?). Kỉ nguyên Đại hải tặc (大海賊時代 Dai Kaizoku Jidai?) bắt đầu.22 '),(36,2,'./img/figure/megumi.jpg','Megumi - Konosuba',500000,'Natsume Akatsuki,Studio DEEN,Following an untimely and embarrassing death, Kazuma Satō, a Japanese teenager shut-in NEET, meets a goddess named Aqua, who offers to reincarnate him in a parallel world with MMORPG elements, where he can go on adventures and battle monsters. Despite being offered a superpowered item or ability to use in this new world, Kazuma, following some provocation,'),(37,2,'./img/figure/miku_special.jpg','Miku  - Hatsune Miku',500000,'Crypton Future Media,Crypton Future Media,Hatsune Miku was the first Vocaloid developed by Crypton Future Media after they handled the release of the Yamaha vocal Meiko and Kaito. The name of \"Hatsune Miku\" was conceived soon after the Vocaloid 2 announcements, when an English and Japanese vocal were developed for the character.'),(38,2,'./img/figure/mikuBirthDay.jpg','Miku  - Hatsune Miku',500000,'Crypton Future Media,Crypton Future Media,Hatsune Miku was the first Vocaloid developed by Crypton Future Media after they handled the release of the Yamaha vocal Meiko and Kaito. The name of \"Hatsune Miku\" was conceived soon after the Vocaloid 2 announcements, when an English and Japanese vocal were developed for the character.'),(39,2,'./img/figure/naruto.jpg','Naruto - Naruto',500000,'Masashi Kishimoto,Pierrot,A powerful fox known as the Nine-Tails attacks Konoha, the hidden leaf village in the Land of Fire, one of the Five Great Shinobi Countries in the Ninja World. In response, the leader of Konoha, the Fourth Hokage, seals the fox inside the body of his newborn son, Naruto Uzumaki, making Naruto a host of the beast;[e] this costs Naruto\'s father his life'),(40,2,'./img/figure/naruto_teen.jpg','Naruto - Naruto',500000,'Masashi Kishimoto,Pierrot,A powerful fox known as the Nine-Tails attacks Konoha, the hidden leaf village in the Land of Fire, one of the Five Great Shinobi Countries in the Ninja World. In response, the leader of Konoha, the Fourth Hokage, seals the fox inside the body of his newborn son, Naruto Uzumaki, making Naruto a host of the beast;[e] this costs Naruto\'s father his life'),(41,2,'./img/figure/nezuko.jpg','Nezuko  - Thanh gươm diệt quỷ',500000,'Gotōge Koyoharu,Ufotable,Thời Taisho, có nhiều tin đồn về việc loài quỷ ăn thịt người ẩn nấp trong rừng. Vì thế, người dân trong những làng bên cạnh không bao giờ dám ra ngoài vào ban đêm. Nhân vật chính Kamado Tanjirou[3] là một cậu bé tốt bụng, thông minh sống cùng gia đình trên núi và kiếm tiền bằng cách bán than củi. Tất cả mọi thứ thay đổi khi gia đình cậu bị tấn công và tàn sát bởi quỷ (oni)'),(42,2,'./img/figure/overlord.jpg','Ainz Ooal Gown   - Over Lord',500000,'Maruyama Kugane,Madhouse,Overlord lấy bối cảnh vào năm 2138 trong tương lai, khi khoa học công nghệ phát triển vượt bậc và ngành game thực tế ảo đang nở rộ hơn bao giờ hết. Câu chuyện bắt đầu trong những giây phút cuối tại tại Yggdrasil, một game online đình đám sắp phải đóng cửa. Nhân vật chính Momonga quyết định ở lại đến tận những phút cuối cùng với trò chơi yêu thích của mình và chờ server down'),(43,2,'./img/figure/rem_1.jpg','Rem - Re:Zero',500000,'Nagatsuki Tappei,White Fox,Subaru Natsuki là một hikikomori, người không làm gì ngoài chơi game. Một đêm nọ, sau khi ghé thăm một cửa hàng tiện lợi, cậu bất ngờ được triệu tập đến một thế giới khác. Không có dấu hiệu ai triệu tập cậu, cậu sớm kết bạn với một cô gái bán tinh linh tóc bạc cùng với một con mào biết phép thuật, người tự giới thiệu mình là Satella và Puck. Satella đề cập rằng phù hiệu của cô đã bị'),(44,2,'./img/figure/rem_2.jpg','Rem - Re:Zero',500000,'Nagatsuki Tappei,White Fox,Subaru Natsuki là một hikikomori, người không làm gì ngoài chơi game. Một đêm nọ, sau khi ghé thăm một cửa hàng tiện lợi, cậu bất ngờ được triệu tập đến một thế giới khác. Không có dấu hiệu ai triệu tập cậu, cậu sớm kết bạn với một cô gái bán tinh linh tóc bạc cùng với một con mào biết phép thuật, người tự giới thiệu mình là Satella và Puck. Satella đề cập rằng phù hiệu của cô đã bị'),(45,2,'./img/figure/rimuru.jpg','Rimuru Tempest - Tensei Shitara Slime Datta Ken',500000,'Fuse,8-Bit,Câu chuyện bắt đầu với anh chàng Satoru Mikami, một nhân viên 37 tuổi sống cuộc sống chán chường và không vui vẻ gì. Trong một lần gặp cướp, anh đã bị mất mạng. Tưởng chừng cuộc sống chán ngắt ấy đã kết thúc... Nhưng không! Ấy lại chính là sự khởi đầu của một cuộc sống mới. Mikami thức dậy, thấy mình đang ở trong một thế giới kì lạ. Và điều quái dị là anh không còn hình dạng con người nữa mà đã trở thành quái vật slime dẻo quẹo và không có mắt.'),(46,2,'./img/figure/shitamaru.jpg','Shitamaru - Naruto',500000,'Masashi Kishimoto,Pierrot,A powerful fox known as the Nine-Tails attacks Konoha, the hidden leaf village in the Land of Fire, one of the Five Great Shinobi Countries in the Ninja World. In response, the leader of Konoha, the Fourth Hokage, seals the fox inside the body of his newborn son, Naruto Uzumaki, making Naruto a host of the beast;[e] this costs Naruto\'s father his life, and the Third Hokage returns from retirement to become leader of Konoha again'),(47,2,'./img/figure/sasuke.jpg','Sasuke - Naruto',500000,'Masashi Kishimoto,Pierrot,A powerful fox known as the Nine-Tails attacks Konoha, the hidden leaf village in the Land of Fire, one of the Five Great Shinobi Countries in the Ninja World. In response, the leader of Konoha, the Fourth Hokage, seals the fox inside the body of his newborn son, Naruto Uzumaki, making Naruto a host of the beast;[e] this costs Naruto\'s father his life, and the Third Hokage returns from retirement to become leader of Konoha again.'),(48,2,'./img/figure/sora.jpg','Sora  - No Game No Life',500000,'Hai anh em Sora & Shiro tạo nên huyền thoại game thủ với thành tích quán quân trong tất cả bảng xếp hạng game dưới cái tên 『　　』 (Kūhaku (空白?)) hay còn được gọi là『 Blank』Bước ra khỏi thế giới ảo, họ là những NEET chính hiệu, không việc làm, không ăn học, cách ly và sợ tiếp xúc với bên ngoài, luôn nghĩ mình sinh nhầm thế giới. Một ngày nọ,có 1 tên kì lạ tự cho mình là thần (Tên: Tet, là 1 vị thần tối cao) đã hỏi 1 câu hỏi kì lạ \"2 người muốn vào 1 thế giới chỉ định đoạt bằng games ??'),(49,2,'./img/figure/tanjiro.jpg','Tanjiro  - Thanh gươm diệt quỷ',500000,'Gotōge Koyoharu,Ufotable,Thời Taisho, có nhiều tin đồn về việc loài quỷ ăn thịt người ẩn nấp trong rừng. Vì thế, người dân trong những làng bên cạnh không bao giờ dám ra ngoài vào ban đêm. Nhân vật chính Kamado Tanjirou[3] là một cậu bé tốt bụng, thông minh sống cùng gia đình trên núi và kiếm tiền bằng cách bán than củi. Tất cả mọi thứ thay đổi khi gia đình cậu bị tấn công và tàn sát bởi quỷ (oni). Tanjirou và em gái Nezuko là những người còn sống sót sau vụ việc đó, '),(50,2,'./img/figure/tempest.jpg','Veldora Tempest - Tensei Shitara Slime Datta Ken',500000,'Fuse,8-Bit,Câu chuyện bắt đầu với anh chàng Satoru Mikami, một nhân viên 37 tuổi sống cuộc sống chán chường và không vui vẻ gì. Trong một lần gặp cướp, anh đã bị mất mạng. Tưởng chừng cuộc sống chán ngắt ấy đã kết thúc... Nhưng không! Ấy lại chính là sự khởi đầu của một cuộc sống mới. Mikami thức dậy, thấy mình đang ở trong một thế giới kì lạ. Và điều quái dị là anh không còn hình dạng con người nữa mà đã trở thành quái vật slime dẻo quẹo và không có mắt.'),(51,2,'./img/figure/yourName.jpg','Taki & Mitsuha - Your Name',500000,'	Shinkai Makoto,	CoMix Wave Films,Mitsuha - cô nữ sinh sống tại một vùng quê Nhật Bản, chán ngán cuộc sống hiện tại và luôn mong được lên Tokyo sống. Taki - một cậu nam sinh ở Tokyo, làm thêm tại một nhà hàng Ý sau giờ học, thích vẽ vời và quan tâm đến ngành kiến trúc. Cả hai bắt đầu có những giấc mơ kỳ lạ kể từ khi ngôi sao chổi Tiamat huyền thoại xuất hiện trên bầu trời. Trong mơ, Mitsuha mơ thành một cậu nam sinh ở Tokyo còn Taki mơ mình là một cô nữ sinh ở vùng quê Nhật Bản. Và họ nhanh chóng nhận ra mình đã bị hoán đổi cơ thể. Để tránh những rắc rối,'),(52,2,'./img/figure/yukiStudent.jpg','Yuki  - Sword art online',500000,'Reki Kawahara,Tomohiko Itō,A-1 Pictures,Vào năm 2022, trò chơi Virtual Reality Massively Multiplayer Online Role-Playing Game (Game nhập vai thực tại ảo trực tuyến nhiều người chơi-VRMMORPG) đầu tiên, Sword Art Online (SAO), được ra mắt. Nhờ Nerve Gear, một chiếc mũ thực tại ảo có thể tác động vào năm giác quan của người sử dụng thông qua não bộ của họ, người chơi có thể trải nghiệm và điều khiển nhân vật ảo trong game của họ bằng ý nghĩ.'),(53,2,'./img/figure/yuki.jpg','Yuki  - Sword art online',500000,'Reki Kawahara,Tomohiko Itō,A-1 Pictures,Vào năm 2022, trò chơi Virtual Reality Massively Multiplayer Online Role-Playing Game (Game nhập vai thực tại ảo trực tuyến nhiều người chơi-VRMMORPG) đầu tiên, Sword Art Online (SAO), được ra mắt. Nhờ Nerve Gear, một chiếc mũ thực tại ảo có thể tác động vào năm giác quan của người sử dụng thông qua não bộ của họ, người chơi có thể trải nghiệm và điều khiển nhân vật ảo trong game của họ bằng ý nghĩ.,'),(54,2,'./img/figure/yuiAI.jpg','Yui  - Sword Art Online The Movie: Ordinal Scale',500000,'Itō Tomohiko,A-1 Pictures,Vào năm 2026, các Augma được phát hành ra để thay thế hệ thống AmuSphere, với chức năng mô phỏng thực tế trong khi người chơi vẫn còn giữ được ý thức, an toàn hơn so với công nghệ FullDive. trò chơi chiến đấu nổi bật nhất là Ordinal Scale, với một hệ thống xếp hạng khả năng người chơi.Asuna, Lisbeth và Silica đã khuyến khích Kirito chơi OS khi nghe được rằng các boss trong Aincrad sẽ xuất hiện. Kirito tham gia với Asuna và Klein trong một trận đánh boss nơi linh vật của game, ca sĩ thần tượng ảo Yuna,'),(55,2,'./img/figure/yunyun.jpg','YunYun - Konosuba',500000,'Natsume Akatsuki,Studio DEEN,Following an untimely and embarrassing death, Kazuma Satō, a Japanese teenager shut-in NEET, meets a goddess named Aqua, who offers to reincarnate him in a parallel world with MMORPG elements, where he can go on adventures and battle monsters. Despite being offered a superpowered item or ability to use in this new world, Kazuma, following some provocation, chooses Aqua herself to accompany him to the town of Axel, quickly finding her absent-mindedness to be less than beneficial.'),(56,2,'./img/figure/zoro.jpg','Zoro  - One Piece',500000,'Eiichiro Oda,Production I.G,Câu truyện bắt đầu với cảnh xử tử của Vua Hải Tặc (海賊王 Kaizokuō?) Gol D. Roger. Ngay trước khi chết, Roger tiết lộ rằng kho báu của ông ta để hết ở ngoài biển ấy nếu ai tìm được sẽ là của kẻ đó. Và thế là những người có máu phiêu lưu và những kẻ tham vọng đều đổ xô ra biển tìm kiếm kho báu vĩ đại nhất, One Piece (ひとつなぎの大秘宝 ワンピース Wan Pīsu?). Kỉ nguyên Đại hải tặc (大海賊時代 Dai Kaizoku Jidai?) bắt đầu.22 năm sau kể từ khi Roger bị xử tử, một cậu thiếu niên tên là Monkey D. Luffy được truyền cảm hứng '),(57,3,'./img/manga/aot.jpg','Attack on Titan',300000,'Hajime Isayama,Wit Studio Production I,Theo truyền thuyết, hơn 2000 năm trước, một phụ nữ trẻ tên là Ymir Fritz đã liên lạc và thực hiện một giao kèo với \"Quỷ dữ của Trái Đất\", trở thành người khổng lồ hình người đầu tiên với những sức mạnh đặc biệt. Những sinh vật đó về sau được gọi là Titans (巨人, Kyojin). Sức mạnh của cô đã bị Nhà Vua sử dụng để lập nên Đế chế Eldia, đồng thời nghiền nát quốc gia đối thủ là Marley. Khi cô chết, sức mạnh Titan của cô đã được truyền lại, cuối cùng phân thành 9 dạng riêng lẻ'),(58,3,'./img/manga/demonslayer1.jpg','Thanh gươm diệt quỷ - Tập 1',0,'Gotōge Koyoharu,Ufotable,Thời Taisho, có nhiều tin đồn về việc loài quỷ ăn thịt người ẩn nấp trong rừng. Vì thế, người dân trong những làng bên cạnh không bao giờ dám ra ngoài vào ban đêm. Nhân vật chính Kamado Tanjirou[3] là một cậu bé tốt bụng, thông minh sống cùng gia đình trên núi và kiếm tiền bằng cách bán than củi. Tất cả mọi thứ thay đổi khi gia đình cậu bị tấn công và tàn sát bởi quỷ (oni). Tanjirou và em gái Nezuko là những người còn sống sót sau vụ việc đó,'),(59,3,'./img/manga/demonslayer2.jpg','Thanh gươm diệt quỷ - Tập 2',0,'Gotōge Koyoharu,Ufotable,Thời Taisho, có nhiều tin đồn về việc loài quỷ ăn thịt người ẩn nấp trong rừng. Vì thế, người dân trong những làng bên cạnh không bao giờ dám ra ngoài vào ban đêm. Nhân vật chính Kamado Tanjirou[3] là một cậu bé tốt bụng, thông minh sống cùng gia đình trên núi và kiếm tiền bằng cách bán than củi. Tất cả mọi thứ thay đổi khi gia đình cậu bị tấn công và tàn sát bởi quỷ (oni). Tanjirou và em gái Nezuko là những người còn sống sót sau vụ việc đó,'),(60,3,'./img/manga/fivebride8.jpg','Nhà Có 5 Nàng Dâu - Tập 8',300000,'Haruba Negi,Tezuka Productions,Fuutarou Uesugi, một học sinh cao trung Nhật Bản có thành tích xuất sắc tại trường nhưng lại có một cuộc sống khó khăn: không mẹ, không bạn bè và một người cha phải vật lộn với những khoản nợ lớn trong nhà và người em gái Raiha lúc nào cũng đói.Một cơ hội của cậu để có thể trả món nợ là công việc làm gia sư kiếm tiền, cậu được một gia đình giàu có là Nakano thuê đến căn hộ (tại một khu chung cư) dạy học, nhưng cậu phát hiện ra người cậu phải kèm là năm chị em có vẻ ngoài giống hệt'),(61,3,'./img/manga/fruitsBasket1.jpg','Hóa giải lời nguyền - Tập 1',300000,'Fruits Basket dựa trên truyện cổ tích 12 con giáp của Trung Quốc. Nhân vật chính là Honda Tohru , một nữ sinh trung học hiền lành, dễ thương, đảm đang. Ít người biết cô bé đang phải sống tự lập trong một căn lều trong rừng, vì mẹ cô - Honda Kyoko, vừa mất trong một tai nạn giao thông và Tohru không muốn dựa dẫm vào ông nội mình. Một hôm, Touru đi ngang qua một căn nhà khang trang trong khu rừng cô đang trú ngụ, cô tình cờ nhìn thấy những bức tượng con giáp nho nhỏ rất đẹp mà ai đó đang phơi ngoài hiên. '),(62,3,'./img/manga/fruitsBasket7.jpg','Hóa giải lời nguyền - Tập 7',300000,'Fruits Basket dựa trên truyện cổ tích 12 con giáp của Trung Quốc. Nhân vật chính là Honda Tohru , một nữ sinh trung học hiền lành, dễ thương, đảm đang. Ít người biết cô bé đang phải sống tự lập trong một căn lều trong rừng, vì mẹ cô - Honda Kyoko, vừa mất trong một tai nạn giao thông và Tohru không muốn dựa dẫm vào ông nội mình. Một hôm, Touru đi ngang qua một căn nhà khang trang trong khu rừng cô đang trú ngụ, cô tình cờ nhìn thấy những bức tượng con giáp nho nhỏ rất đẹp mà ai đó đang phơi ngoài hiên.'),(63,3,'./img/manga/kaguya1.jpg','Nàng Kaguya muốn được tỏ tình ~Trận chiến tình yêu căng não giữa các thiên tài - Tập 1',300000,'Tại Học viện Shūchiin, Hội trưởng hội học sinh Shirogane Miyuki và phó hội trưởng Shinomiya Kaguya vẻ ngoài như một cặp đôi hoàn hảo. Kaguya là con gái của gia đình một tập đoàn giàu có, và Miyuki là học sinh luôn đứng đầu trường và nổi tiếng trên toàn tỉnh. Mặc dù họ thích nhau, nhưng họ quá tự cao khi thổ lộ tình cảm của mình vì họ đều nghĩ rằng ai tỏ tình trước sẽ thua. '),(64,3,'./img/manga/kaguya2.jpg','Nàng Kaguya muốn được tỏ tình ~Trận chiến tình yêu căng não giữa các thiên tài - Tập 2',300000,'Tại Học viện Shūchiin, Hội trưởng hội học sinh Shirogane Miyuki và phó hội trưởng Shinomiya Kaguya vẻ ngoài như một cặp đôi hoàn hảo. Kaguya là con gái của gia đình một tập đoàn giàu có, và Miyuki là học sinh luôn đứng đầu trường và nổi tiếng trên toàn tỉnh. Mặc dù họ thích nhau, nhưng họ quá tự cao khi thổ lộ tình cảm của mình vì họ đều nghĩ rằng ai tỏ tình trước sẽ thua. '),(65,3,'./img/manga/kaguya3.jpg','Nàng Kaguya muốn được tỏ tình ~Trận chiến tình yêu căng não giữa các thiên tài - Tập 3',300000,'Tại Học viện Shūchiin, Hội trưởng hội học sinh Shirogane Miyuki và phó hội trưởng Shinomiya Kaguya vẻ ngoài như một cặp đôi hoàn hảo. Kaguya là con gái của gia đình một tập đoàn giàu có, và Miyuki là học sinh luôn đứng đầu trường và nổi tiếng trên toàn tỉnh. Mặc dù họ thích nhau, nhưng họ quá tự cao khi thổ lộ tình cảm của mình vì họ đều nghĩ rằng ai tỏ tình trước sẽ thua. '),(66,3,'./img/manga/kaguya4.jpg','Nàng Kaguya muốn được tỏ tình ~Trận chiến tình yêu căng não giữa các thiên tài - Tập 4',300000,'Tại Học viện Shūchiin, Hội trưởng hội học sinh Shirogane Miyuki và phó hội trưởng Shinomiya Kaguya vẻ ngoài như một cặp đôi hoàn hảo. Kaguya là con gái của gia đình một tập đoàn giàu có, và Miyuki là học sinh luôn đứng đầu trường và nổi tiếng trên toàn tỉnh. Mặc dù họ thích nhau, nhưng họ quá tự cao khi thổ lộ tình cảm của mình vì họ đều nghĩ rằng ai tỏ tình trước sẽ thua. '),(67,3,'./img/manga/kaguya5.jpg','Nàng Kaguya muốn được tỏ tình ~Trận chiến tình yêu căng não giữa các thiên tài - Tập 5',300000,'Tại Học viện Shūchiin, Hội trưởng hội học sinh Shirogane Miyuki và phó hội trưởng Shinomiya Kaguya vẻ ngoài như một cặp đôi hoàn hảo. Kaguya là con gái của gia đình một tập đoàn giàu có, và Miyuki là học sinh luôn đứng đầu trường và nổi tiếng trên toàn tỉnh. Mặc dù họ thích nhau, nhưng họ quá tự cao khi thổ lộ tình cảm của mình vì họ đều nghĩ rằng ai tỏ tình trước sẽ thua. '),(68,3,'./img/manga/kaguya6.jpg','Nàng Kaguya muốn được tỏ tình ~Trận chiến tình yêu căng não giữa các thiên tài - Tập 6',300000,'Tại Học viện Shūchiin, Hội trưởng hội học sinh Shirogane Miyuki và phó hội trưởng Shinomiya Kaguya vẻ ngoài như một cặp đôi hoàn hảo. Kaguya là con gái của gia đình một tập đoàn giàu có, và Miyuki là học sinh luôn đứng đầu trường và nổi tiếng trên toàn tỉnh. Mặc dù họ thích nhau, nhưng họ quá tự cao khi thổ lộ tình cảm của mình vì họ đều nghĩ rằng ai tỏ tình trước sẽ thua. '),(69,3,'./img/manga/kaguya7.jpg','Nàng Kaguya muốn được tỏ tình ~Trận chiến tình yêu căng não giữa các thiên tài - Tập 7',300000,'Tại Học viện Shūchiin, Hội trưởng hội học sinh Shirogane Miyuki và phó hội trưởng Shinomiya Kaguya vẻ ngoài như một cặp đôi hoàn hảo. Kaguya là con gái của gia đình một tập đoàn giàu có, và Miyuki là học sinh luôn đứng đầu trường và nổi tiếng trên toàn tỉnh. Mặc dù họ thích nhau, nhưng họ quá tự cao khi thổ lộ tình cảm của mình vì họ đều nghĩ rằng ai tỏ tình trước sẽ thua. '),(70,3,'./img/manga/kaguya8.jpg','Nàng Kaguya muốn được tỏ tình ~Trận chiến tình yêu căng não giữa các thiên tài - Tập 8',300000,'Tại Học viện Shūchiin, Hội trưởng hội học sinh Shirogane Miyuki và phó hội trưởng Shinomiya Kaguya vẻ ngoài như một cặp đôi hoàn hảo. Kaguya là con gái của gia đình một tập đoàn giàu có, và Miyuki là học sinh luôn đứng đầu trường và nổi tiếng trên toàn tỉnh. Mặc dù họ thích nhau, nhưng họ quá tự cao khi thổ lộ tình cảm của mình vì họ đều nghĩ rằng ai tỏ tình trước sẽ thua. '),(71,3,'./img/manga/kaguya11.jpg','Nàng Kaguya muốn được tỏ tình ~Trận chiến tình yêu căng não giữa các thiên tài - Tập 11',300000,'Tại Học viện Shūchiin, Hội trưởng hội học sinh Shirogane Miyuki và phó hội trưởng Shinomiya Kaguya vẻ ngoài như một cặp đôi hoàn hảo. Kaguya là con gái của gia đình một tập đoàn giàu có, và Miyuki là học sinh luôn đứng đầu trường và nổi tiếng trên toàn tỉnh. Mặc dù họ thích nhau, nhưng họ quá tự cao khi thổ lộ tình cảm của mình vì họ đều nghĩ rằng ai tỏ tình trước sẽ thua.'),(72,3,'./img/manga/kaguya12.jpg','Nàng Kaguya muốn được tỏ tình ~Trận chiến tình yêu căng não giữa các thiên tài - Tập 12',300000,'Tại Học viện Shūchiin, Hội trưởng hội học sinh Shirogane Miyuki và phó hội trưởng Shinomiya Kaguya vẻ ngoài như một cặp đôi hoàn hảo. Kaguya là con gái của gia đình một tập đoàn giàu có, và Miyuki là học sinh luôn đứng đầu trường và nổi tiếng trên toàn tỉnh. Mặc dù họ thích nhau, nhưng họ quá tự cao khi thổ lộ tình cảm của mình vì họ đều nghĩ rằng ai tỏ tình trước sẽ thua.'),(73,3,'./img/manga/kaguya13.jpg','Nàng Kaguya muốn được tỏ tình ~Trận chiến tình yêu căng não giữa các thiên tài - Tập 13',300000,'Tại Học viện Shūchiin, Hội trưởng hội học sinh Shirogane Miyuki và phó hội trưởng Shinomiya Kaguya vẻ ngoài như một cặp đôi hoàn hảo. Kaguya là con gái của gia đình một tập đoàn giàu có, và Miyuki là học sinh luôn đứng đầu trường và nổi tiếng trên toàn tỉnh. Mặc dù họ thích nhau, nhưng họ quá tự cao khi thổ lộ tình cảm của mình vì họ đều nghĩ rằng ai tỏ tình trước sẽ thua.'),(74,3,'./img/manga/kaguya14.jpg','Nàng Kaguya muốn được tỏ tình ~Trận chiến tình yêu căng não giữa các thiên tài - Tập 14',300000,'Tại Học viện Shūchiin, Hội trưởng hội học sinh Shirogane Miyuki và phó hội trưởng Shinomiya Kaguya vẻ ngoài như một cặp đôi hoàn hảo. Kaguya là con gái của gia đình một tập đoàn giàu có, và Miyuki là học sinh luôn đứng đầu trường và nổi tiếng trên toàn tỉnh. Mặc dù họ thích nhau, nhưng họ quá tự cao khi thổ lộ tình cảm của mình vì họ đều nghĩ rằng ai tỏ tình trước sẽ thua.'),(75,3,'./img/manga/NoGameNoLife.jpg','No Game No Life',300000,'Yū Kamiya,Madhouse,Hai anh em Sora & Shiro tạo nên huyền thoại game thủ với thành tích quán quân trong tất cả bảng xếp hạng game dưới cái tên 『　　』 (Kūhaku (空白?)) hay còn được gọi là『 Blank』Bước ra khỏi thế giới ảo, họ là những NEET chính hiệu, không việc làm, không ăn học, cách ly và sợ tiếp xúc với bên ngoài, luôn nghĩ mình sinh nhầm thế giới. Một ngày nọ,có 1 tên kì lạ tự cho mình là thần (Tên: Tet, là 1 vị thần tối cao) đã hỏi 1 câu hỏi kì lạ \"2 người muốn vào 1 thế giới chỉ định đoạt bằng games ?? nếu nó thực sự tồn tại ?? \" '),(76,3,'./img/manga/SAO.jpg','Kiếm kĩ trực tiếp',300000,'Reki Kawahara,A-1 Pictures,Vào năm 2022, trò chơi Virtual Reality Massively Multiplayer Online Role-Playing Game (Game nhập vai thực tại ảo trực tuyến nhiều người chơi-VRMMORPG) đầu tiên, Sword Art Online (SAO), được ra mắt. Nhờ Nerve Gear, một chiếc mũ thực tại ảo có thể tác động vào năm giác quan của người sử dụng thông qua não bộ của họ, người chơi có thể trải nghiệm và điều khiển nhân vật ảo trong game của họ bằng ý nghĩ.'),(77,3,'./img/manga/SlientVoice.jpg','Dáng hình thanh âm',300000,'Yamada Naoko Yoshida Reiko,Kyōto Animation,Ishida Shōya là một cậu bé hiếu động, chơi thân với hai người bạn là Shimada và Hirose. Câu chuyện bắt đầu khi Nishimiya Shōko - một cô bé lớp 6 bị khiếm thính bẩm sinh chuyển vào lớp Shōya. Ban đầu, mọi người rất hào hứng bắt chuyện với Shōko, nhưng càng ngày càng phai nhạt dần bởi họ đã ngán ngẩm với cách giao tiếp khác thường của cô bé. '),(78,3,'./img/manga/smartphone9.jpg','Đến thế giới mới với smartphone ! - Tập 9',300000,'Fuyuhara Patora,Production Reed,Touya Mochizuki là một thanh niên 15 tuổi vô tình bị sét đánh trúng bởi Thượng Đế. Như một lời xin lỗi, Thượng đế cho phép anh được sống lại, nhưng vì ông không thể gửi anh về thế giới cũ của mình, nên thay vào đó, thượng đế tái sinh anh trong một thế giới phép thuật cùng với một yêu cầu đặc biệt. '),(79,3,'./img/manga/smartphone11.jpg','Đến thế giới mới với smartphone ! - Tập 11',300000,'Fuyuhara Patora,Production Reed,Touya Mochizuki là một thanh niên 15 tuổi vô tình bị sét đánh trúng bởi Thượng Đế. Như một lời xin lỗi, Thượng đế cho phép anh được sống lại, nhưng vì ông không thể gửi anh về thế giới cũ của mình, nên thay vào đó, thượng đế tái sinh anh trong một thế giới phép thuật cùng với một yêu cầu đặc biệt'),(80,3,'./img/manga/smartphone12.jpg','Đến thế giới mới với smartphone ! - Tập 12',300000,'Fuyuhara Patora,Production Reed,Touya Mochizuki là một thanh niên 15 tuổi vô tình bị sét đánh trúng bởi Thượng Đế. Như một lời xin lỗi, Thượng đế cho phép anh được sống lại, nhưng vì ông không thể gửi anh về thế giới cũ của mình, nên thay vào đó, thượng đế tái sinh anh trong một thế giới phép thuật cùng với một yêu cầu đặc biệt'),(81,3,'./img/manga/smartphone13.jpg','Đến thế giới mới với smartphone ! - Tập 13',300000,'Fuyuhara Patora,Production Reed,Touya Mochizuki là một thanh niên 15 tuổi vô tình bị sét đánh trúng bởi Thượng Đế. Như một lời xin lỗi, Thượng đế cho phép anh được sống lại, nhưng vì ông không thể gửi anh về thế giới cũ của mình, nên thay vào đó, thượng đế tái sinh anh trong một thế giới phép thuật cùng với một yêu cầu đặc biệt'),(82,3,'./img/manga/smartphone14.jpg','Đến thế giới mới với smartphone ! - Tập 14',300000,'Fuyuhara Patora,Production Reed,Touya Mochizuki là một thanh niên 15 tuổi vô tình bị sét đánh trúng bởi Thượng Đế. Như một lời xin lỗi, Thượng đế cho phép anh được sống lại, nhưng vì ông không thể gửi anh về thế giới cũ của mình, nên thay vào đó, thượng đế tái sinh anh trong một thế giới phép thuật cùng với một yêu cầu đặc biệt'),(84,3,'./img/manga/smartphone16.jpg','Đến thế giới mới với smartphone ! - Tập 16',300000,'Fuyuhara Patora,Production Reed,Touya Mochizuki là một thanh niên 15 tuổi vô tình bị sét đánh trúng bởi Thượng Đế. Như một lời xin lỗi, Thượng đế cho phép anh được sống lại, nhưng vì ông không thể gửi anh về thế giới cũ của mình, nên thay vào đó, thượng đế tái sinh anh trong một thế giới phép thuật cùng với một yêu cầu đặc biệt'),(85,3,'./img/manga/smartphone17.jpg','Đến thế giới mới với smartphone ! - Tập 17',300000,'Fuyuhara Patora,Production Reed,Touya Mochizuki là một thanh niên 15 tuổi vô tình bị sét đánh trúng bởi Thượng Đế. Như một lời xin lỗi, Thượng đế cho phép anh được sống lại, nhưng vì ông không thể gửi anh về thế giới cũ của mình, nên thay vào đó, thượng đế tái sinh anh trong một thế giới phép thuật cùng với một yêu cầu đặc biệt'),(86,3,'./img/manga/smartphone18.jpg','Đến thế giới mới với smartphone ! - Tập 18',300000,'Fuyuhara Patora,Production Reed,Touya Mochizuki là một thanh niên 15 tuổi vô tình bị sét đánh trúng bởi Thượng Đế. Như một lời xin lỗi, Thượng đế cho phép anh được sống lại, nhưng vì ông không thể gửi anh về thế giới cũ của mình, nên thay vào đó, thượng đế tái sinh anh trong một thế giới phép thuật cùng với một yêu cầu đặc biệt'),(87,3,'./img/manga/takagi1.jpg','Nhất quỷ nhì ma, thứ ba Takagi - Tập 1',300000,'Yamamoto Sōichirō,Shin-Ei Animation, Hai học sinh sơ trung Nishikata và Takagi ngồi cạnh nhau trong lớp. Takagi, người thích Nishikata, rất thích trêu trọc anh bạn ngồi kế với những trò tinh quái. Để đáp tra, Nishikata tạo những kế hoạch để trả thù nhưng chúng thường xuyên thất bại khi cô bạn biết điểm yếu và luôn nhắm vào nó'),(88,3,'./img/manga/takagi3.jpg','Nhất quỷ nhì ma, thứ ba Takagi - Tập 3',300000,'Yamamoto Sōichirō,Shin-Ei Animation, Hai học sinh sơ trung Nishikata và Takagi ngồi cạnh nhau trong lớp. Takagi, người thích Nishikata, rất thích trêu trọc anh bạn ngồi kế với những trò tinh quái. Để đáp tra, Nishikata tạo những kế hoạch để trả thù nhưng chúng thường xuyên thất bại khi cô bạn biết điểm yếu và luôn nhắm vào nó'),(89,3,'./img/manga/takagi4.jpg','Nhất quỷ nhì ma, thứ ba Takagi - Tập 4',300000,'Yamamoto Sōichirō,Shin-Ei Animation, Hai học sinh sơ trung Nishikata và Takagi ngồi cạnh nhau trong lớp. Takagi, người thích Nishikata, rất thích trêu trọc anh bạn ngồi kế với những trò tinh quái. Để đáp tra, Nishikata tạo những kế hoạch để trả thù nhưng chúng thường xuyên thất bại khi cô bạn biết điểm yếu và luôn nhắm vào nó'),(90,3,'./img/manga/takagi6.jpg','Nhất quỷ nhì ma, thứ ba Takagi - Tập 6',300000,'Yamamoto Sōichirō,Shin-Ei Animation, Hai học sinh sơ trung Nishikata và Takagi ngồi cạnh nhau trong lớp. Takagi, người thích Nishikata, rất thích trêu trọc anh bạn ngồi kế với những trò tinh quái. Để đáp tra, Nishikata tạo những kế hoạch để trả thù nhưng chúng thường xuyên thất bại khi cô bạn biết điểm yếu và luôn nhắm vào nó'),(91,3,'./img/manga/takagi7.jpg','Nhất quỷ nhì ma, thứ ba Takagi - Tập 7',300000,'Yamamoto Sōichirō,Shin-Ei Animation, Hai học sinh sơ trung Nishikata và Takagi ngồi cạnh nhau trong lớp. Takagi, người thích Nishikata, rất thích trêu trọc anh bạn ngồi kế với những trò tinh quái. Để đáp tra, Nishikata tạo những kế hoạch để trả thù nhưng chúng thường xuyên thất bại khi cô bạn biết điểm yếu và luôn nhắm vào nó'),(92,3,'./img/manga/takagi8.jpg','Nhất quỷ nhì ma, thứ ba Takagi - Tập 8',300000,'Yamamoto Sōichirō,Shin-Ei Animation, Hai học sinh sơ trung Nishikata và Takagi ngồi cạnh nhau trong lớp. Takagi, người thích Nishikata, rất thích trêu trọc anh bạn ngồi kế với những trò tinh quái. Để đáp tra, Nishikata tạo những kế hoạch để trả thù nhưng chúng thường xuyên thất bại khi cô bạn biết điểm yếu và luôn nhắm vào nó'),(93,3,'./img/manga/WeNeverLearn9.jpg','Chúng tớ không chịu học đâu - Tập 9',300000,'Tsutsui Taishi,Studio Silver,Bộ truyện kể về câu chuyện của Yuiga Nariyuki khi anh dạy kèm ba thiên tài thuộc các môn học khác nhau ở trường trung học để có được học bổng VIP đặc biệt. Furuhashi Fumino là một thiên tài về văn học nhưng học rất kém về toán học, Ogata Rizu là một thiên tài về toán học và khoa học nhưng văn học và nghệ thuật là những môn học kém đối với cô và Takemoto Uruka là một thiên tài trong lĩnh vực thể thao nhưng thực sự dở trong tất cả những môn khác. Cùng nhau, họ học tập rất chăm chỉ và muốn giỏi hơn ở những môn học mà họ còn kém trong khi Fumino và Ogata muốn đi học đại học và làm những môn này suốt đời. Khi các cô gái làm việc chăm chỉ với Nariyuki để đạt được mục tiêu học tập của mình, họ cũng phải đối phó với tình cảm của tuổi trẻ của mình dành cho anh'),(94,3,'./img/manga/Wotakoi1.jpg','Thật khó để yêu một Otaku',300000,'Fujita,A-1 Pictures,Narumi, một nữ nhân viên văn phòng nhưng giấu cách sống fujoshi của mình khỏi mọi người, và Hirotaka, một cậu thanh niên đẹp trai và là một otaku game. Cả hai có vẻ như là được sinh ra dành cho nhau, nhưng mà thật khó để yêu một otaku.'),(95,4,'./img/dvdAnime/5cen.jpg','5 Centimet trên giây',300000,'Shinkai Makoto,CoMix Wave Inc.,Bối cảnh phim bắt đầu từ những năm 90 thế kỷ XX đến hiện nay (năm 2008). Mỗi câu chuyện đều tập trung vào một nhân vật chính, Toono Takaki. Câu chuyện đầu tiên được diễn ra khi điện thoại di động không phổ biến và thư điện tử (email) vẫn chưa đến được với người dân nói chung.'),(96,4,'./img/dvdAnime/antiMagic.jpg','Anti-Magic Academy: The 35th Test Platoon',300000,'Kento Shimoyama,Silver Link,. In the present Takeru Kusanagi attends Anti-Magic Academy, a training school for Inquisitors, soldiers who prevent witches from destroying the world. Takeru wields a katana instead of guns or magic and is often mocked for it by his fellow students. Takeru is captain of the 35th Test Platoon, the least effective team in the school, consisting of himself, Usagi Saionji, a sniper who suffers from stage fright, and Ikaruga Suginami, a tech genius who enjoys sexually harassing people, especially Usagi. Oka Otori, a combat prodigy and adopted daughter '),(97,4,'./img/dvdAnime/blackClover.jpg',' Black Clover',500000,'Yūki Tabata,Pierrot,The series focuses on Asta, a young orphan who was raised from birth after being abandoned at an orphanage along with his fellow orphan, Yuno. While everyone is born with the ability to utilize Mana in the form of Magical Power (魔力, Maryoku), Asta is the only exception. He tries to gain magical power through physical training. Conversely, Yuno was born as a prodigy with immense magical power and the talent to control wind magic'),(98,4,'./img/dvdAnime/castle.jpg','Laputa: Lâu đài trên không',300000,'Hayao Miyazaki,Studio Ghibli,Theo truyền thuyết, loài người bị bầu trời cuốn hút, bởi vậy họ gia tăng việc tạo ra những phương thức phức tạp để nâng những chiếc máy bay khỏi mặt đất. Điều đó thậm chí đã tạo ra những thành phố và những pháo đài bay. Thời gian trôi qua, những thành phố đó đã rơi trở lại mặt đất, buộc những người sống sót phải sống trên mặt đất như trước kia. Chỉ có thành phố Laputa được cho là vẫn còn lơ lửng trên bầu trời, ẩn giấu giữa những xoáy mây của một cơn bão khổng lồ. Trong khi hầu hết mọi người đều cho đó chỉ là tưởng tượng, một vài người tin rằng truyền thuyết đó là có thật và đã cố gắng tìm kiếm thành phố cổ đó.'),(99,4,'./img/dvdAnime/charlotte.jpg','Charlotte',300000,'Maeda Jun,P.A.Works,Trong một thế giới khác, có một số lượng nhỏ những đứa trẻ có tiềm năng biểu lộ siêu năng lực khi bước vào tuổi dậy thì gọi là các Năng lực Gia. Otosaka Yuu, một chàng trai đã đánh thức khả năng sở hữu cơ thể người khác tạm thời và đoạt năng lực của họ (nếu có), kỳ vọng việc sử dụng năng lực sẽ giúp cậu ta có một cuộc sống dễ dàng ở trường trung học. Tuy nhiên, Otosaka Yuu đã bị Tomori Nao, một cô gái bí ẩn, bắt quả tang và buộc cậu ta phải chuyển đến Học viện Hoshinoumi (星ノ海学園 Hoshinoumi Gakuen?, \"Học viện Ngôi sao Đại dương\" hay \"Học viện Biển Sao\" hay \"Học viện Tinh Hải\"). '),(100,4,'./img/dvdAnime/darling.jpg','Darling in the Franxx',300000,'Mato,Trigger CloverWorks,Trong tương lai hậu khải huyền, đang bị đe dọa liên tục từ những sinh vật khổng lồ được gọi là Kyoryū (叫竜?). Kyoryū được phân thành ít nhất bốn loại dựa theo kích thước của chúng: \"Conrad\"[b], \"Mohorovičić\"[c], \"Gutenberg\"[d], và \"Lehmann\" [e]. Bị đẩy đến bờ vực hủy diệt, tổ chức bí ẩn tên là APE đã dẫn các tàn dư của nhân loại từ bỏ bề mặt trái đất để đến các thành phố pháo đài di động gọi là Plantation. Để bảo vệ Plantation, những đứa trẻ được gọi là Parasite được huấn luyện để điều khiển các cỗ máy khổng lồ có tên Franxx[f] (フランキス Furankisu?). Franxx hoạt động dựa trên sự đồng bộ của một cặp nam-nữ.'),(101,4,'./img/dvdAnime/dateALive.jpg','Date A Live',300000,'Kōshi Tachibana,AIC PLUS+ J.C.Staff,Ba mươi năm về trước, có một hiện tượng lạ gọi là \"không gian chấn\" tàn phá trung tâm lục địa Á-Âu, cướp đi sinh mạng của hơn 150 triệu người. Sau đó, các đợt không gian chấn xuất hiện với tần số thấp hơn. Itsuka Shido, một học sinh cao trung bình thường, gặp một cô gái bí ẩn tại trung tâm của một đợt không chấn. Sau đó, cậu biết rằng nguyên nhân xảy ra các vụ không gian chấn là do sự xuất hiện của các \"Tinh Linh\". Cậu cũng biết được rằng em gái cậu (Itsuka Kotori) là chỉ huy của phi thuyền Fraxinus, trực thuộc Ratatoskr, và được yêu cầu sử dụng năng lực bí ẩn của mình để phong ấn sức mạnh của các tinh linh'),(102,4,'./img/dvdAnime/firework.jpg','Pháo hoa, nên ngắm từ dưới hay bên cạnh?',300000,'Iwai Shunji,Shaft,Bộ phim lấy bối cảnh vào một ngày mùa hạ, kể về một nhóm những chàng trai trẻ chạy đi ngắm pháo hoa từ ngọn hải đăng của thị trấn mình. Trong lúc ấy, cậu Norimichi nhận được một tin nhắn từ Nazuna - người con gái cậu thầm thương - hãy cùng nhau đi trốn nhé'),(103,4,'./img/dvdAnime/foodWar.jpg','Shokugeki no Souma',300000,'	Yūto Tsukuda,J.C.Staff,Shokugeki no Souma kể câu chuyện về một cậu bé tên là Souma Yukihira, người mơ ước trở thành một đầu bếp chuyên nghiệp trong nhà hàng của cha mình và vượt qua kỹ năng nấu nướng của bố. Nhưng cũng giống như Sōma sinh viên tốt nghiệp trung học, cha cậu, Jōichirō Yukihira, nhận được một công việc mới đòi hỏi anh phải đi khắp thế giới và đóng cửa tiệm của mình. Tuy nhiên, tinh thần chiến đấu của Sōma lại được thổi lên bởi một thách thức từ Jōichirō, để tồn tại trong một trường dạy nấu ăn tinh hoa tên là Tootsuki, nơi chỉ có 10% sinh viên hoàn thành tốt nghiệp, '),(104,4,'./img/dvdAnime/fruitsBasket.jpg','Hóa giải lời nguyền',300000,'Takaya Natsuki,Studio Deen,Fruits Basket dựa trên truyện cổ tích 12 con giáp của Trung Quốc. Nhân vật chính là Honda Tohru , một nữ sinh trung học hiền lành, dễ thương, đảm đang. Ít người biết cô bé đang phải sống tự lập trong một căn lều trong rừng, vì mẹ cô - Honda Kyoko, vừa mất trong một tai nạn giao thông và Tohru không muốn dựa dẫm vào ông nội mình. Một hôm, Touru đi ngang qua một căn nhà khang trang trong khu rừng cô đang trú ngụ, cô tình cờ nhìn thấy những bức tượng con giáp nho nhỏ rất đẹp mà ai đó đang phơi ngoài hiên. Trong lúc mải mê xem những bức tượng, '),(105,4,'./img/dvdAnime/guilty.jpg','Guilty Crown',300000,'Hiroyuki Yoshino,Production I.G Division 6,High school student Shu Ouma encounters a wounded girl named Inori Yuzuriha, the vocalist of a popular internet group Egoist, taking refuge at his film club\'s workshop. The GHQ Anti Bodies storm the workshop and arrest her for involvement with Funeral Parlor. Shu follows the coordinates of Inori\'s robot to a drop zone where he meets Funeral Parlor\'s leader, Gai Tsutsugami, who asks him to safeguard a vial. As GHQ begins attacking the Roppongi area looking for the vial,'),(106,4,'./img/dvdAnime/isIt.jpg','Is It Wrong to Try to Pick Up Girls in a Dungeon?',300000,'Fujino Ōmori,J.C.Staff,The story follows the exploits of Bell Cranel, a 14-year-old solo adventurer under the goddess Hestia. As the only member of the Hestia Familia, he works hard every day in the dungeon to make ends meet while seeking to improve himself. He looks up to Aiz Wallenstein, a famous and powerful swordswoman who once saved his life, and with whom he fell in love. He is unaware that several other girls, deities and mortals alike, also develop affections towards him;'),(107,4,'./img/dvdAnime/nora.jpg','Vị thần lang thang',300000,'Adachitoka,	Bones,Là vị thần của thiên tai, nhưng gần như vô danh, Yato không những không có người thờ phụng mà thậm chí còn không có nổi một ngôi miếu thờ dành cho mình. Trên đường thay đổi điều đó, cậu sẵn sàng đáp ứng các lời thỉnh cầu của mọi người ở trần gian (Near Shore) với giá chỉ 5 yên để tích góp xây cho mình một ngôi đền. Trên đường làm nhiệm vụ, cậu quen với Iki Hiyori, một cô gái phàm trần có linh hồn thường xuyên bị tách ra khỏi thể xác, và Yukine, một hồn ma lang thang, người được cậu \"nhận nuôi\"'),(108,4,'./img/dvdAnime/one.jpg','One Piece',300000,'Eiichiro Oda,Production I.G,Câu truyện bắt đầu với cảnh xử tử của Vua Hải Tặc (海賊王 Kaizokuō?) Gol D. Roger. Ngay trước khi chết, Roger tiết lộ rằng kho báu của ông ta để hết ở ngoài biển ấy nếu ai tìm được sẽ là của kẻ đó. Và thế là những người có máu phiêu lưu và những kẻ tham vọng đều đổ xô ra biển tìm kiếm kho báu vĩ đại nhất, One Piece (ひとつなぎの大秘宝 ワンピース Wan Pīsu?). Kỉ nguyên Đại hải tặc (大海賊時代 Dai Kaizoku Jidai?) bắt đầu.22 năm sau kể từ khi Roger bị xử tử, một cậu thiếu niên tên là Monkey D. Luffy được truyền cảm hứng từ một hải tặc'),(109,4,'./img/dvdAnime/overlord.jpg','Over Lord',500000,'Maruyama Kugane,Madhouse,Overlord lấy bối cảnh vào năm 2138 trong tương lai, khi khoa học công nghệ phát triển vượt bậc và ngành game thực tế ảo đang nở rộ hơn bao giờ hết. Câu chuyện bắt đầu trong những giây phút cuối tại tại Yggdrasil, một game online đình đám sắp phải đóng cửa. Nhân vật chính Momonga quyết định ở lại đến tận những phút cuối cùng với trò chơi yêu thích của mình và chờ server down. Bất ngờ, server không shutdown, Momonga bị mắc kẹt trong nhân vật của chính mình và dịch chuyển tới một thế giới khác. Vị chúa tể hùng mạnh của đại'),(110,4,'./img/dvdAnime/pricessMononoke.jpg','Mononoke Hime',300000,'Miyazaki Hayao,Studio Ghibli,Ngôi làng bé nhỏ của bộ tộc Emishi ở phía Đông đột nhiên bị tấn công bởi Tatari Gami (tạm dịch là Tà Thần). Hoàng tử Ashitaka của tộc Emishi buộc phải dùng cung tên bắn chết Tatari Gami để bảo bệ dân làng. Trong lúc chiến đấu, anh đã bị nguyền khi để những con giun quỷ (thứ bao bọc lấy Tatari Gami) bám vào tay. Lời nguyền[1] đó vừa ban cho anh một sức mạnh phi thường đồng thời cũng hủy hoại linh hồn anh cho đến chết. Nhà tiên tri trong làng bảo đó là một vị thần heo rừng đến từ Tây vực xa xôi, nó đã bị mộ'),(111,4,'./img/dvdAnime/realGirl.jpg','3D Kanojo: Real Girl',300000,'Nanami Mao,Hoods Entertainment,Tsutsui Hikari một chàng Otaku với lối sống tách biệt, tính khí kỳ quặc, chỉ biết đến đi học, xem anime và game, trong một lần đi học muộn đã gặp gỡ Igarashi Iroha, một cô nàng \"hot girl\" rất có tiếng, cũng không rõ là danh tiếng hay tai tiếng nữa. Và sau một vài rắc rối, họ trở thành một cặp. Nhưng chuyện tình này sẽ đi đến đâu khi 6 tháng sau Iroha phải chuyển đi nơi khác.'),(112,4,'./img/dvdAnime/reLife.jpg','ReLIFE',300000,'Yayoiso,TMS Entertainment,Câu truyện xoay quanh Kaizaki Arata, 27 tuổi và thất nghiệp sau khi bỏ việc tại công ty đầu tiên sau 3 tháng đi làm, với lý do là bởi vì nó \"không phù hợp với tiềm năng của mình\". Vì lẽ đó, anh cảm thấy khó khăn trong việc kiếm việc làm tại một công ty khác và thay vào đó làm việc bán thời gian ở một siêu thị mini. Một ngày, một người đàn ông bí ẩn tên là Ryō Yoake mang đến cho anh một cơ hội đổi đời và việc làm sau này nhưng trước hết anh cần trở thành một đối tượng thí nghiệm cho ReLife: một dự án khoa học nhằm làm anh trẻ lại 10 tuổi và '),(113,4,'./img/dvdAnime/reZero.jpg','Re:Zero',500000,'Nagatsuki Tappei,White Fox,Subaru Natsuki là một hikikomori, người không làm gì ngoài chơi game. Một đêm nọ, sau khi ghé thăm một cửa hàng tiện lợi, cậu bất ngờ được triệu tập đến một thế giới khác. Không có dấu hiệu ai triệu tập cậu, cậu sớm kết bạn với một cô gái bán tinh linh tóc bạc cùng với một con mào biết phép thuật, người tự giới thiệu mình là Satella và Puck. Satella đề cập rằng phù hiệu của cô đã bị đánh cắp bởi một tên trộm tên là Felt. Trên đường tìm phù hiệu, cậu và Satella bị giết một cách bí ẩn, Subaru tỉnh dậy và phát hiện ra rằng cậu đã có được khả năng'),(114,4,'./img/dvdAnime/slientVoice.jpg','Dáng hình thanh âm',300000,'Yamada Naoko Yoshida Reiko,Kyōto Animation,Ishida Shōya là một cậu bé hiếu động, chơi thân với hai người bạn là Shimada và Hirose. Câu chuyện bắt đầu khi Nishimiya Shōko - một cô bé lớp 6 bị khiếm thính bẩm sinh chuyển vào lớp Shōya. Ban đầu, mọi người rất hào hứng bắt chuyện với Shōko, nhưng càng ngày càng phai nhạt dần bởi họ đã ngán ngẩm với cách giao tiếp khác thường của cô bé. Ngay cả Ueno - cô bạn đã giúp đỡ Shōko rất nhiều khi cô bé mới vào lớp nay cũng quay lưng lại. Trong khi Shōko bị cả lớp tẩy chay, chỉ có mình Sahara là muốn bắt chuyện với cô bé'),(115,4,'./img/dvdAnime/slime.jpg','Tensei Shitara Slime Datta Ken',500000,'Fuse,8-Bit,Câu chuyện bắt đầu với anh chàng Satoru Mikami, một nhân viên 37 tuổi sống cuộc sống chán chường và không vui vẻ gì. Trong một lần gặp cướp, anh đã bị mất mạng. Tưởng chừng cuộc sống chán ngắt ấy đã kết thúc... Nhưng không! Ấy lại chính là sự khởi đầu của một cuộc sống mới. Mikami thức dậy, thấy mình đang ở trong một thế giới kì lạ. Và điều quái dị là anh không còn hình dạng con người nữa mà đã trở thành quái vật slime dẻo quẹo và không có mắt. Khi dần quen với hình dáng mới này, anh bắt đầu khám phá thế giới cùng với những quái vật khác và công cuộc thay đổi thế giới mới đã bắt đầu.'),(116,4,'./img/dvdAnime/weathearing.jpg','Đứa con của thời tiết',300000,'Shinkai Makoto,CoMix Wave Films,Morishima Hodaka - một cậu học sinh năm nhất, chán ngấy với cuộc sống ở một hòn đảo hẻo lánh quyết bỏ nhà lên Tokyo. Trên đường băng qua đại dương bằng chiếc phà, bão lớn đánh vào phà, cậu được cứu bởi một người đàn ông trung niên tên Suga Keisuke. Keisuke đưa danh thiếp của mình cho cậu để tiện liên lạc. Tại Tokyo, Hodaka còn quá trẻ để xin việc hợp pháp, cậu không được nhận lần này đến lần khác, phải ở tạm một con hẻm với số tiền ít ỏi trong túi. Amano Hina - một cô gái chạc tuổi Hodaka, làm việc trong nhà ăn đã bắt gặp '),(117,4,'./img/dvdAnime/wiseman.jpg','Wise Man\'s Grandchild',300000,'Tsuyoshi Yoshioka,Silver Link,A young salaryman who died in an accident was reborn in another world filled with magic and demons. As a baby, he was picked up by the patriot hero \"Sage\" Merlin Wolford and was given the name Shin. He was raised as a grandson and soaked up Merlin\'s teachings, earning him some irresistible powers. However, when Shin became 15, Merlin realized, \"I forgot to teach him common sense!\" Diseum, king of the Earlshide Kingdom, recommends Shin to attend his Magic Academy, on the agreement of not using Shin for political warfare. In the'),(118,4,'./img/dvdAnime/worldBreak.jpg','World Break: Aria of Curse for a Holy Swordsman',300000,'Hiroshi Yamaguchi,Diomedéa,World Break: Aria of Curse for a Holy Swordsman takes place at a school named Akane Academy, where students with special powers and known as Saviors are trained to defend against monsters called Metaphysicals, which brutally and indiscriminately attack humans. Saviors, divided into Shirogane (White Iron) and Kuroma (Black Magic), are the reincarnations of talented individuals who possess awakened memories of their past lives. Shirogane manifest weapons and martial techniques while Kuroma manifest magic for defense purposes.'),(119,4,'./img/dvdAnime/yourName.jpg','Your Name',500000,'	Shinkai Makoto,	CoMix Wave Films,Mitsuha - cô nữ sinh sống tại một vùng quê Nhật Bản, chán ngán cuộc sống hiện tại và luôn mong được lên Tokyo sống. Taki - một cậu nam sinh ở Tokyo, làm thêm tại một nhà hàng Ý sau giờ học, thích vẽ vời và quan tâm đến ngành kiến trúc. Cả hai bắt đầu có những giấc mơ kỳ lạ kể từ khi ngôi sao chổi Tiamat huyền thoại xuất hiện trên bầu trời. Trong mơ, Mitsuha mơ thành một cậu nam sinh ở Tokyo còn Taki mơ mình là một cô nữ sinh ở vùng quê Nhật Bản. Và họ nhanh chóng nhận ra mình đã bị hoán đổi cơ thể. Để tránh những rắc rối, họ để lại cho'),(120,2,'./img/figure/aliceAngle2.png','Alice - Sword art online',500000,'Reki Kawahara,A-1 Pictures,Vào năm 2022, trò chơi Virtual Reality Massively Multiplayer Online Role-Playing Game (Game nhập vai thực tại ảo trực tuyến nhiều người chơi-VRMMORPG) đầu tiên, Sword Art Online (SAO), được ra mắt. Nhờ Nerve Gear, một chiếc mũ thực tại ảo có thể tác động vào năm giác quan của người sử dụng thông qua não bộ của họ, người chơi có thể trải nghiệm và điều khiển nhân vật ảo trong game của họ bằng ý nghĩ.');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producttype`
--

DROP TABLE IF EXISTS `producttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producttype` (
  `pTid` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`pTid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producttype`
--

LOCK TABLES `producttype` WRITE;
/*!40000 ALTER TABLE `producttype` DISABLE KEYS */;
INSERT INTO `producttype` VALUES (1,'Game'),(2,'Figure'),(3,'Managa'),(4,'DVD');
/*!40000 ALTER TABLE `producttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'wefi'
--
/*!50003 DROP PROCEDURE IF EXISTS `addCart` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addCart`(Puid int, Ppid int, Pquality int)
begin
	Insert into cart values(Puid,Ppid,Pquality);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addUser`(Pusername varchar(50),Ppassword varchar(50),Pemail varchar(50),Pphone varchar(10),Pcid int,Pdid int,Pstreet varchar(50))
begin
	Insert into customer(username,password,email,phone,cid,did,street) values(Pusername,Ppassword,Pemail,Pphone,Pcid,Pdid,Pstreet);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BLNproduct` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `BLNproduct`(pType varchar(10))
begin
	case 
		when pType ='B' then select p.pid,imageURL,product_name,price from bestseller b join product p on b.pid=p.pid;
        when pType ='L' then select p.pid,imageURL,product_name,price from limitproduct l join product p on l.pid=p.pid;
        when pType ='N' then select p.pid,imageURL,product_name,price from newproduct n join product p on n.pid=p.pid;
	end case;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteCart` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteCart`(Puid int, Ppid int)
begin
	delete from cart where Puid=uid and Ppid = pid;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteLike` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteLike`(Puid int, Ppid int)
begin
	delete from Likes where Puid=uid and Ppid = pid;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getCart` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getCart`(Puid int)
begin 
	select p.pid,imageURL,product_name,price,quality from cart c join product p on c.pid=p.pid where uid = Puid;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getCity` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getCity`()
begin
		select * from city order by cid ;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getCountCart` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getCountCart`(Puid int)
begin
	select count(pid) count from cart where uid=Puid;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getCountSearch` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getCountSearch`(keyword varchar(50))
begin
	select count(product_name) quality from product where match(product_name) against(keyword);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getDistrict` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getDistrict`(Pcid int)
begin
	select * from district where cid=Pcid order by did;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getLikeProduct` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getLikeProduct`(Puid int)
begin
	select p.pid,imageURL,product_name,price from likes l join product p on l.pid=p.pid where uid = Puid;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getOrders` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getOrders`(Puid int)
begin
	select (price*quality) total, product_name,orderDate from orders o join product p on o.pid=p.pid where Puid = uid;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getProduct` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getProduct`(Tid int,Pstart int, Plimit int)
begin
	select pid,imageURL,product_name,price from product where pTid=Tid limit Pstart, Plimit;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getProductDetail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getProductDetail`(Ppid int)
begin
	select * from product where pid = Ppid;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getQuality` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getQuality`(Tid int)
begin
 select count(pid) quality  from product where pTid=Tid;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getSearchProduct` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getSearchProduct`(keyword varchar(50),Pstart int, Plimit int)
begin
	select pid,imageURL,product_name,price from product where match(product_name) against(keyword) limit Pstart, Plimit;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getTotal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getTotal`(Puid int)
begin
	select sum(price*quality) total from cart c join product p on c.pid=p.pid where Puid=uid;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `likeProduct` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `likeProduct`(Puid int, Ppid int)
begin
	Insert into likes values(Puid,Ppid);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `login`(Pemail varchar(50),Pphone varchar(50),Ppassword varchar(50))
begin
	if Pemail is null then
		select uid,username,email,phone,cid,did,street from customer where phone=Pphone and password=Ppassword;
	else 
		select uid,username,email,phone,cid,did,street from customer where email=Pemail and password=Ppassword;
	end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `paidCart` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `paidCart`(Puid int)
begin
	insert into orders(uid,pid,quality) select * from cart where Puid = uid;
    delete from cart where Puid = uid;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateAccAddress` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateAccAddress`(Puid int , Pcid int ,Pdid int, Pstreet varchar(50))
begin
	update customer set cid=Pcid, did=Pdid,street=Pstreet where uid=Puid;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateAccInfor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateAccInfor`(Puid int,Pusername varchar(50),Pemail varchar(50),Pphone varchar(50))
begin
	update customer set username=Pusername , email=Pemail, phone=Pphone where uid=Puid;
end ;;
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

-- Dump completed on 2020-06-01  9:55:59
