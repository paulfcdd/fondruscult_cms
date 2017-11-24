-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: fond
-- ------------------------------------------------------
-- Server version	5.7.20-0ubuntu0.17.10.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `file`
--

DROP TABLE IF EXISTS `file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `entity` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `foreign_key` int(11) NOT NULL,
  `mime_type` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `is_default` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8C9F36105E237E06` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file`
--

LOCK TABLES `file` WRITE;
/*!40000 ALTER TABLE `file` DISABLE KEYS */;
INSERT INTO `file` VALUES (1,'5a18384124155.png','AppBundle\\Entity\\Post',1,'png',1);
/*!40000 ALTER TABLE `file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page`
--

DROP TABLE IF EXISTS `page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `removed` tinyint(1) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seo_keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seo_description` longtext COLLATE utf8_unicode_ci,
  `in_navbar` tinyint(1) NOT NULL,
  `main_page` tinyint(1) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `post_category` int(11) DEFAULT NULL,
  `post_per_page` int(11) DEFAULT NULL,
  `sort_order` int(11) NOT NULL,
  `in_footer` tinyint(1) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime DEFAULT NULL,
  `date_removed` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_140AB6202B36786B` (`title`),
  UNIQUE KEY `UNIQ_140AB620727ACA70` (`parent_id`),
  KEY `IDX_140AB620F675F31B` (`author_id`),
  CONSTRAINT `FK_140AB620727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `page` (`id`),
  CONSTRAINT `FK_140AB620F675F31B` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page`
--

LOCK TABLES `page` WRITE;
/*!40000 ALTER TABLE `page` DISABLE KEYS */;
INSERT INTO `page` VALUES (1,1,NULL,'Главная',NULL,0,'/',NULL,NULL,0,0,'main_page',NULL,NULL,0,0,'2017-11-08 15:53:14',NULL,NULL),(2,1,NULL,'О фонде','<p>Фонд Русской Народной и Православной Культуры, Традиций и Ремесел (далее &ndash; Фонд Русской Культуры) был создан в 2013 году.</p>\r\n\r\n<p>Основными направлениями деятельности Фонда являются:</p>\r\n\r\n<ul>\r\n	<li>актуализация тем быта русского народа и русских национальных традиций;</li>\r\n	<li>организация мероприятий православной и народной направленности, призванных способствовать возрождению у населения России чувства любви и привязанности к своему Отечеству, уважению к своей великой истории;</li>\r\n	<li>организация образовательных программ, семинаров и мастер-классов, способствующих усилению национального и православного самосознания;</li>\r\n	<li>бережное сохранение предметов русского национального быта, музейная деятельность;</li>\r\n	<li>содействие возрождению традиционных для России ремесленных технологий;</li>\r\n	<li>производство и распространение традиционных русских товаров, имеющих как сувенирную, так и утилитарную направленность;</li>\r\n	<li>пропаганда русской народной и православной культуры, традиций и ремесел, как на территории РФ, так и за рубежом;</li>\r\n	<li>пропаганда русских народных и православных кулинарных и гастрономических традиций;</li>\r\n	<li>сотрудничество с российскими, иностранными и международными государственными, общественными, научными, коммерческими, некоммерческими и благотворительными организациями, учреждениями образования и культуры, иными учреждениями, организациями и объединениями, частными лицами в деле популяризации русской православной культуры, народных традиций и ремесел;</li>\r\n	<li>взаимодействие с Русской Православной Церковью и другими конфессиями в деле продвижения русских национальных традиций.</li>\r\n</ul>\r\n\r\n<p>В опоре на лучшие образцы русской народной и православной культуры, традиции, ремесла, народно-художественные промыслы, Фонд строит планомерную стратегию в области производства и распространения объектов традиционной культуры, использования современных каналов пропаганды и подачи информации.</p>',0,'o-fonde',NULL,NULL,1,0,'simple_page',NULL,NULL,1,1,'2017-11-08 15:53:29','2017-11-24 16:35:15',NULL),(3,1,NULL,'Новости',NULL,0,'novosti',NULL,NULL,1,0,'page_with_post',1,2,2,1,'2017-11-08 16:34:24','2017-11-24 16:49:42','2017-11-15 10:16:24'),(4,1,NULL,'Проекты',NULL,0,'proekty',NULL,NULL,1,0,'page_with_post',4,5,3,1,'2017-11-24 16:44:26',NULL,NULL),(5,1,NULL,'Документы',NULL,0,'dokumenty',NULL,NULL,1,0,'simple_page',NULL,NULL,4,1,'2017-11-24 16:46:18',NULL,NULL),(6,1,NULL,'Контакты',NULL,0,'kontakty',NULL,NULL,1,0,'simple_page',NULL,NULL,5,1,'2017-11-24 16:47:02',NULL,NULL);
/*!40000 ALTER TABLE `page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `removed` tinyint(1) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seo_keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seo_description` longtext COLLATE utf8_unicode_ci,
  `date_created` datetime NOT NULL,
  `date_updated` datetime DEFAULT NULL,
  `date_removed` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_5A8A6C8D2B36786B` (`title`),
  KEY `IDX_5A8A6C8DF675F31B` (`author_id`),
  KEY `IDX_5A8A6C8D12469DE2` (`category_id`),
  CONSTRAINT `FK_5A8A6C8D12469DE2` FOREIGN KEY (`category_id`) REFERENCES `post_category` (`id`),
  CONSTRAINT `FK_5A8A6C8DF675F31B` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,1,2,'Новость 1','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eleifend nibh ipsum, vel auctor ipsum molestie sit amet. Duis ultricies nulla id mauris dapibus, a porta lorem suscipit. Ut tincidunt vitae metus nec finibus. Vivamus auctor tempus mauris non dignissim. In non turpis semper, volutpat velit blandit, accumsan mauris. Curabitur id ex in turpis blandit elementum. Aliquam bibendum tortor a interdum commodo. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Ut vel felis vel dolor blandit cursus vel eget lorem.</p>\r\n\r\n<p>Integer vitae orci id magna hendrerit venenatis. Curabitur ex dui, aliquet eget lectus eget, placerat aliquet neque. Nam leo leo, feugiat nec leo ac, condimentum dapibus mauris. Cras suscipit, orci pulvinar fringilla venenatis, libero arcu egestas velit, eget sagittis nisi est iaculis elit. Pellentesque sagittis tortor enim, vel pharetra velit ullamcorper vel. Donec id neque vel nisi convallis gravida non sed felis. Aliquam eget ante rhoncus lectus tristique gravida. Duis malesuada diam sit amet condimentum ultricies. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi nec leo quis dui rhoncus eleifend id quis ipsum.</p>\r\n\r\n<p>Proin non dapibus magna. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin gravida, felis laoreet bibendum suscipit, nibh ante tristique diam, at porta nunc quam at leo. Curabitur eu sagittis eros. Vestibulum aliquam vehicula interdum. Morbi quis turpis sagittis, gravida ex nec, molestie velit. Sed placerat sed eros sed dapibus. In purus quam, varius vitae diam vel, ornare mattis augue. Praesent a odio et nibh sodales dignissim. Quisque sit amet suscipit ex. Vestibulum nec feugiat ligula. Ut sollicitudin arcu nec eros aliquam faucibus. Donec id neque sit amet metus tincidunt fermentum. Phasellus at tincidunt mauris. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Suspendisse facilisis nunc at facilisis fermentum.</p>\r\n\r\n<p>Aliquam erat volutpat. Praesent sodales cursus velit, quis placerat dui tincidunt sed. Sed ut augue at lacus fringilla semper nec nec magna. Cras sit amet libero felis. Aliquam accumsan vulputate vehicula. Nullam nibh sapien, pretium nec venenatis et, placerat in elit. Proin cursus quam purus, ut mollis nunc euismod at.</p>\r\n\r\n<p>Duis et mollis purus. Mauris et tellus efficitur, placerat felis eu, lobortis enim. Aliquam erat volutpat. Suspendisse mattis neque ac nisl mollis, sit amet sagittis ligula convallis. Aliquam erat volutpat. Sed vel ex erat. Phasellus lacus ligula, gravida nec fringilla eu, tristique a tortor. Suspendisse gravida neque quam, ut vestibulum ipsum aliquet sit amet. Curabitur fringilla facilisis dui ut ultrices. Sed velit ligula, ornare ut semper non, scelerisque eget felis. Nullam id ligula nec felis vulputate tempus quis ac odio. Vivamus lectus erat, luctus a augue luctus, laoreet sagittis massa. Suspendisse dictum, lacus semper sagittis convallis, nibh lorem tempus nulla, vel laoreet lectus ex non arcu. Pellentesque efficitur cursus sapien vitae sodales. Etiam consectetur accumsan mauris, bibendum auctor ipsum placerat sed. Fusce porttitor dictum justo sit amet pharetra.</p>',0,'novost-1',NULL,NULL,'2017-11-08 16:35:09','2017-11-24 16:12:56','2017-11-24 16:08:02'),(2,1,3,'Новость 2','<p>dfsdfxvxc</p>',0,'novost-2',NULL,NULL,'2017-11-08 16:40:01','2017-11-24 16:10:39','2017-11-24 16:07:37'),(3,1,2,'Новость 3','<p>впвпав</p>',0,'novost-3',NULL,NULL,'2017-11-08 16:59:47','2017-11-24 16:12:58','2017-11-24 16:07:34'),(4,1,3,'Новость 4','<p>аыаыаыв</p>',1,'novost-4',NULL,NULL,'2017-11-08 16:59:58','2017-11-24 16:07:32','2017-11-24 16:07:32'),(5,1,2,'Новость 7','<p>dggdgf</p>',1,'novost-7',NULL,NULL,'2017-11-08 17:00:55','2017-11-24 16:07:28','2017-11-24 16:07:28'),(6,1,1,'Новость кек','<p>вапвапва</p>',1,'novost-kek',NULL,NULL,'2017-11-24 16:06:53','2017-11-24 16:07:25','2017-11-24 16:07:25');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_category`
--

DROP TABLE IF EXISTS `post_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `removed` tinyint(1) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime DEFAULT NULL,
  `date_removed` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_B9A19060727ACA70` (`parent_id`),
  KEY `IDX_B9A19060F675F31B` (`author_id`),
  CONSTRAINT `FK_B9A19060727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `post_category` (`id`),
  CONSTRAINT `FK_B9A19060F675F31B` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_category`
--

LOCK TABLES `post_category` WRITE;
/*!40000 ALTER TABLE `post_category` DISABLE KEYS */;
INSERT INTO `post_category` VALUES (1,NULL,1,'Новости',0,'2017-11-08 16:34:38','2017-11-08 16:50:56',NULL),(2,1,1,'Новости фонда',0,'2017-11-08 16:51:06',NULL,NULL),(3,1,1,'Новости русской народной и православной культуры',0,'2017-11-08 16:51:16',NULL,NULL),(4,NULL,1,'Проекты',0,'2017-11-24 16:42:01',NULL,NULL);
/*!40000 ALTER TABLE `post_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `confirmation_token` varchar(180) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_1483A5E992FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_1483A5E9A0D96FBF` (`email_canonical`),
  UNIQUE KEY `UNIQ_1483A5E9C05FB297` (`confirmation_token`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin','admin@google.com','admin@google.com',1,NULL,'$2y$13$Ak1gIhBtikdQfR5TSnhyoeJwGBRsiMKKdBfLbX1MHrJvrxLSHxjky','2017-11-24 15:53:23',NULL,NULL,'a:1:{i:0;s:16:\"ROLE_SUPER_ADMIN\";}');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widget`
--

DROP TABLE IF EXISTS `widget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `author` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widget`
--

LOCK TABLES `widget` WRITE;
/*!40000 ALTER TABLE `widget` DISABLE KEYS */;
/*!40000 ALTER TABLE `widget` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-24 17:08:37
