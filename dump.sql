-- MySQL dump 10.13  Distrib 5.7.17-12, for Linux (x86_64)
--
-- Host: localhost    Database: project
-- ------------------------------------------------------
-- Server version	5.7.17-12-log

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
/*!50112 SELECT COUNT(*) INTO @is_rocksdb_supported FROM INFORMATION_SCHEMA.SESSION_VARIABLES WHERE VARIABLE_NAME='rocksdb_bulk_load' */;
/*!50112 SET @save_old_rocksdb_bulk_load = IF (@is_rocksdb_supported, 'SET @old_rocksdb_bulk_load = @@rocksdb_bulk_load', 'SET @dummy_old_rocksdb_bulk_load = 0') */;
/*!50112 PREPARE s FROM @save_old_rocksdb_bulk_load */;
/*!50112 EXECUTE s */;
/*!50112 SET @enable_bulk_load = IF (@is_rocksdb_supported, 'SET SESSION rocksdb_bulk_load = 1', 'SET @dummy_rocksdb_bulk_load = 0') */;
/*!50112 PREPARE s FROM @enable_bulk_load */;
/*!50112 EXECUTE s */;
/*!50112 DEALLOCATE PREPARE s */;

--
-- Position to start replication or point-in-time recovery from
--

-- CHANGE MASTER TO MASTER_LOG_FILE='binlog.000009', MASTER_LOG_POS=154;

--
-- Current Database: `project`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `project` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `project`;

--
-- Table structure for table `groupform`
--

DROP TABLE IF EXISTS `groupform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groupform` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groupform`
--

LOCK TABLES `groupform` WRITE;
/*!40000 ALTER TABLE `groupform` DISABLE KEYS */;
INSERT INTO `groupform` VALUES (1,'网络组');
/*!40000 ALTER TABLE `groupform` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `project_name` varchar(30) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `owner` tinyint(3) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `step_id` mediumint(8) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (1,'tech001',NULL,1,0,24);
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `project_schedule`
--

DROP TABLE IF EXISTS `project_schedule`;
/*!50001 DROP VIEW IF EXISTS `project_schedule`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `project_schedule` AS SELECT 
 1 AS `id`,
 1 AS `project_name`,
 1 AS `description`,
 1 AS `owner`,
 1 AS `status`,
 1 AS `step_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `step_name` varchar(30) NOT NULL,
  `from_time` mediumint(8) unsigned NOT NULL,
  `to_time` mediumint(8) unsigned NOT NULL,
  `project_id` tinyint(3) unsigned NOT NULL,
  `tab` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES (13,'001',1,5,1,0),(14,'002',5,6,1,0),(15,'003',6,8,1,0),(16,'004',7,10,1,0),(17,'005',7,11,1,0),(18,'0a1',1,3,2,0),(19,'0a2',2,3,2,0),(20,'0a3',2,4,2,0),(21,'0a4',4,9,2,0),(22,'0a4',7,9,2,0),(23,'006',10,19,1,0),(24,'007',15,19,1,0);
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger insert_schedule after insert on schedule for each row
begin
insert into schedule_act(id,step_name,from_time,project_id) values(new.id,new.step_name,new.from_time,new.project_id);
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger delete_schedule after delete on schedule for each row
begin 
delete from schedule_act where id=old.id;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `schedule_act`
--

DROP TABLE IF EXISTS `schedule_act`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule_act` (
  `id` mediumint(8) unsigned NOT NULL,
  `step_name` varchar(30) NOT NULL,
  `from_time` mediumint(8) unsigned DEFAULT NULL,
  `to_time` mediumint(8) unsigned DEFAULT NULL,
  `project_id` tinyint(3) unsigned NOT NULL,
  `tab` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule_act`
--

LOCK TABLES `schedule_act` WRITE;
/*!40000 ALTER TABLE `schedule_act` DISABLE KEYS */;
INSERT INTO `schedule_act` VALUES (13,'001',1,2,1,1),(14,'002',2,4,1,1),(15,'003',6,8,1,1),(16,'004',7,8,1,1),(17,'005',7,10,1,1),(18,'0a1',1,NULL,2,1),(19,'0a2',2,NULL,2,1),(20,'0a3',2,NULL,2,1),(21,'0a4',4,NULL,2,1),(22,'0a4',7,NULL,2,1),(23,'006',10,11,1,1),(24,'007',11,13,1,1);
/*!40000 ALTER TABLE `schedule_act` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timing`
--

DROP TABLE IF EXISTS `timing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timing` (
  `id` tinyint(3) unsigned NOT NULL,
  `node` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(4) NOT NULL,
  `description` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timing`
--

LOCK TABLES `timing` WRITE;
/*!40000 ALTER TABLE `timing` DISABLE KEYS */;
INSERT INTO `timing` VALUES (1,'2017-03-14 16:00:00',1,'项目开始'),(1,'2017-03-15 16:00:00',1,'设备到货'),(1,'2017-03-19 16:00:00',1,'设备上架'),(1,'2017-03-29 16:00:00',1,'软件安装'),(1,'2017-04-02 16:00:00',1,'测试01'),(1,'2017-04-04 16:00:00',1,'测试02'),(1,'2017-04-09 16:00:00',1,'测试03'),(1,'2017-04-19 16:00:00',0,'测试04'),(1,'2017-04-30 16:00:00',0,'测试05'),(1,'2017-05-31 16:00:00',0,'测试06'),(1,'2017-04-10 16:00:00',0,'测试06');
/*!40000 ALTER TABLE `timing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `password` varchar(30) NOT NULL,
  `group_id` tinyint(3) unsigned NOT NULL,
  `grouper` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'stones','stones',1,0),(2,'gx','gx',1,1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'project'
--
/*!50003 DROP PROCEDURE IF EXISTS `GoToNextStep` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GoToNextStep`(pro_id tinyint unsigned,done_time mediumint unsigned)
begin
declare step_id_in_project mediumint unsigned;
declare done tinyint default 0;
declare got tinyint default 0;
declare step_id_in_schedule mediumint unsigned;
declare from_time_next_step mediumint unsigned;
declare fetch_schedule_step cursor for (select id from schedule where project_id = pro_id  order by from_time);
declare continue handler for sqlstate '02000' set done = 1;
start transaction;
select step_id into step_id_in_project from project where id = pro_id;
open fetch_schedule_step;
fetch fetch_schedule_step into step_id_in_schedule;
label01:loop
if done
then
update project set status=0 where id = pro_id;
leave label01;
else
if got
then
update project set step_id = step_id_in_schedule where id = pro_id;
select from_time into from_time_next_step from schedule where id=step_id_in_schedule;
if from_time_next_step >= done_time
then
update schedule_act set from_time = done_time where id = step_id_in_schedule;
end if;
leave label01;
else
if step_id_in_project = step_id_in_schedule
then 
set got = 1;
update schedule_act set to_time = done_time where id = step_id_in_project;
end if;
fetch fetch_schedule_step into step_id_in_schedule;
end if;
end if;
end loop label01;
close fetch_schedule_step;

commit;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Current Database: `project`
--

USE `project`;

--
-- Final view structure for view `project_schedule`
--

/*!50001 DROP VIEW IF EXISTS `project_schedule`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `project_schedule` AS select `p`.`id` AS `id`,`p`.`project_name` AS `project_name`,`p`.`description` AS `description`,`p`.`owner` AS `owner`,`p`.`status` AS `status`,`s`.`step_name` AS `step_name` from (`project` `p` join `schedule` `s` on((`p`.`step_id` = `s`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50112 SET @disable_bulk_load = IF (@is_rocksdb_supported, 'SET SESSION rocksdb_bulk_load = @old_rocksdb_bulk_load', 'SET @dummy_rocksdb_bulk_load = 0') */;
/*!50112 PREPARE s FROM @disable_bulk_load */;
/*!50112 EXECUTE s */;
/*!50112 DEALLOCATE PREPARE s */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-26 17:22:43
