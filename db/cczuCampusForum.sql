-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 39.106.205.37    Database: cczuCampusForum
-- ------------------------------------------------------
-- Server version	5.7.22

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
-- Table structure for table `cczu_forum_adminuser`
--

DROP TABLE IF EXISTS `cczu_forum_adminuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cczu_forum_adminuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员编号',
  `enable` int(11) NOT NULL COMMENT '账号是否禁用',
  `password` varchar(255) NOT NULL COMMENT '登录密码',
  `username` varchar(255) NOT NULL COMMENT '登录账号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_4erqa44qkwwkl539xouso7v4c` (`username`) COMMENT '账号唯一性约束'
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COMMENT='论坛管理员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cczu_forum_adminuser`
--

LOCK TABLES `cczu_forum_adminuser` WRITE;
/*!40000 ALTER TABLE `cczu_forum_adminuser` DISABLE KEYS */;
INSERT INTO `cczu_forum_adminuser` VALUES (1,1,'303462da9ea066693edbf99b06aa8023','zhuxuanyu'),(2,1,'47a6ea9b7a3f74b71f5971ac2eb62bfa','qumingzhu'),(3,1,'ad7d5ed3bec15afdc48229207d5591f7','chengben'),(4,1,'475e6c779aabcd70e6f01130260521b3','xieyikun'),(5,1,'9ada39d6a82dfee907daa832d0f0c736','zhangnanxu'),(6,0,'6d12e38815790837bc240629b6ded4fe','ceshi');
/*!40000 ALTER TABLE `cczu_forum_adminuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cczu_forum_adminuser_role`
--

DROP TABLE IF EXISTS `cczu_forum_adminuser_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cczu_forum_adminuser_role` (
  `adminuser_id` int(11) NOT NULL COMMENT '管理员编号',
  `role_id` int(11) NOT NULL COMMENT '角色编号',
  PRIMARY KEY (`adminuser_id`,`role_id`),
  KEY `FK26lllx1jn0c1k8f8oj2qt4io1` (`role_id`) COMMENT '普通索引：角色编号',
  CONSTRAINT `FK26lllx1jn0c1k8f8oj2qt4io1` FOREIGN KEY (`role_id`) REFERENCES `cczu_forum_role` (`id`),
  CONSTRAINT `FKatv5o94k3fooskwr53rvqfven` FOREIGN KEY (`adminuser_id`) REFERENCES `cczu_forum_adminuser` (`id`),
  CONSTRAINT `FKj4gxd3cf2jrxm3rc2a7wq4l1o` FOREIGN KEY (`role_id`) REFERENCES `cczu_forum_role` (`id`),
  CONSTRAINT `FKnpr70x6qtlmt0ltisj5e5j1k7` FOREIGN KEY (`adminuser_id`) REFERENCES `cczu_forum_adminuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员角色管理表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cczu_forum_adminuser_role`
--

LOCK TABLES `cczu_forum_adminuser_role` WRITE;
/*!40000 ALTER TABLE `cczu_forum_adminuser_role` DISABLE KEYS */;
INSERT INTO `cczu_forum_adminuser_role` VALUES (1,1),(2,6),(3,6),(4,6),(5,6);
/*!40000 ALTER TABLE `cczu_forum_adminuser_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cczu_forum_collect`
--

DROP TABLE IF EXISTS `cczu_forum_collect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cczu_forum_collect` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '收藏编号',
  `init_time` datetime DEFAULT NULL COMMENT '收藏时间',
  `posts_id` int(11) NOT NULL COMMENT '帖子编号',
  `user_id` int(11) NOT NULL COMMENT '收藏的用户编号',
  PRIMARY KEY (`id`),
  KEY `FK5a8rh83fve6ug3utggpy8wdvi` (`posts_id`) COMMENT '普通索引：帖子编号',
  KEY `FKg4gtyqabrsuwr5y35lxvjy515` (`user_id`) COMMENT '普通索引：用户编号',
  CONSTRAINT `FK5a8rh83fve6ug3utggpy8wdvi` FOREIGN KEY (`posts_id`) REFERENCES `cczu_forum_posts` (`id`),
  CONSTRAINT `FKdx99au8k6gwee63xsx3s7j41x` FOREIGN KEY (`posts_id`) REFERENCES `cczu_forum_posts` (`id`),
  CONSTRAINT `FKg4gtyqabrsuwr5y35lxvjy515` FOREIGN KEY (`user_id`) REFERENCES `cczu_forum_user` (`id`),
  CONSTRAINT `FKqn9gc7gknb4oowy18qxcjliop` FOREIGN KEY (`user_id`) REFERENCES `cczu_forum_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='帖子收藏记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cczu_forum_collect`
--

LOCK TABLES `cczu_forum_collect` WRITE;
/*!40000 ALTER TABLE `cczu_forum_collect` DISABLE KEYS */;
/*!40000 ALTER TABLE `cczu_forum_collect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cczu_forum_label`
--

DROP TABLE IF EXISTS `cczu_forum_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cczu_forum_label` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '标签编号',
  `details` varchar(255) DEFAULT NULL COMMENT '标签详情',
  `name` varchar(255) NOT NULL COMMENT '标签名称',
  `posts_count` int(11) DEFAULT NULL COMMENT '帖子统计',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_6vml4ba2itmaor84892v92b1f` (`name`) COMMENT '标签名称唯一性约束'
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='标签表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cczu_forum_label`
--

LOCK TABLES `cczu_forum_label` WRITE;
/*!40000 ALTER TABLE `cczu_forum_label` DISABLE KEYS */;
INSERT INTO `cczu_forum_label` VALUES (1,'专注日常灌水，消磨时光','闲聊',7),(2,'可尽情抒发同学情、友情、爱情、师生情、母校情','情感交流',4),(3,'学习使我快乐，请互相指教','学习专区',17),(4,'俊男靓女的美妆秘籍集散地','时尚',6),(5,'日常发布勤工俭学，周末及寒暑假兼职','兼职',7),(6,'二手书、二手代步工具、二手电子产品应有尽有','二手交易',6);
/*!40000 ALTER TABLE `cczu_forum_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cczu_forum_notification`
--

DROP TABLE IF EXISTS `cczu_forum_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cczu_forum_notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '通知编号',
  `is_read` bit(1) DEFAULT NULL COMMENT '是否已读',
  `fromuser_id` int(11) NOT NULL COMMENT '发起通知的用户',
  `posts_id` int(11) NOT NULL COMMENT '帖子编号',
  `touser_id` int(11) NOT NULL COMMENT '要通知的用户',
  `init_time` datetime NOT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`),
  KEY `FKac4wjs0b3992ohkf61jy4ilmj` (`fromuser_id`) COMMENT '普通索引：发起通知用户编号',
  KEY `FKilg05a7ki3vkv7lfjnn57pdw2` (`posts_id`) COMMENT '普通索引：帖子编号',
  KEY `FKquscxmtiqggsch7w833ywubux` (`touser_id`) COMMENT '普通索引：要通知的用户',
  CONSTRAINT `FK1ripp8dro8i84so1m7tknf2rx` FOREIGN KEY (`fromuser_id`) REFERENCES `cczu_forum_user` (`id`),
  CONSTRAINT `FKa9ku7evil79e7mxd3o5gxwb7l` FOREIGN KEY (`touser_id`) REFERENCES `cczu_forum_user` (`id`),
  CONSTRAINT `FKac4wjs0b3992ohkf61jy4ilmj` FOREIGN KEY (`fromuser_id`) REFERENCES `cczu_forum_user` (`id`),
  CONSTRAINT `FKhfe90l9o37q5bu1cngbw2hrcf` FOREIGN KEY (`posts_id`) REFERENCES `cczu_forum_posts` (`id`),
  CONSTRAINT `FKilg05a7ki3vkv7lfjnn57pdw2` FOREIGN KEY (`posts_id`) REFERENCES `cczu_forum_posts` (`id`),
  CONSTRAINT `FKquscxmtiqggsch7w833ywubux` FOREIGN KEY (`touser_id`) REFERENCES `cczu_forum_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='通知表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cczu_forum_notification`
--

LOCK TABLES `cczu_forum_notification` WRITE;
/*!40000 ALTER TABLE `cczu_forum_notification` DISABLE KEYS */;
INSERT INTO `cczu_forum_notification` VALUES (6,'\0',1,266,11,'2018-07-02 17:05:58');
/*!40000 ALTER TABLE `cczu_forum_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cczu_forum_permission`
--

DROP TABLE IF EXISTS `cczu_forum_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cczu_forum_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '权限编号',
  `name` varchar(255) DEFAULT NULL COMMENT '权限名字',
  `perurl` varchar(255) DEFAULT NULL COMMENT '资源路径',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `type` int(11) DEFAULT NULL COMMENT '资源类型',
  `parentid` int(11) NOT NULL COMMENT '父权限',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='基础权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cczu_forum_permission`
--

LOCK TABLES `cczu_forum_permission` WRITE;
/*!40000 ALTER TABLE `cczu_forum_permission` DISABLE KEYS */;
INSERT INTO `cczu_forum_permission` VALUES (1,'系统设置','/system',1,0,0),(2,'管理员管理','/adminsPage',2,1,1),(3,'角色管理','/rolesPage',3,1,1),(4,'权限管理','/permissionsPage',4,1,1),(5,'添加管理员','/admins/add',21,2,2),(6,'删除管理员','/admins/delete',22,2,2),(7,'添加角色','/roles/add',23,2,3),(8,'删除角色','/roles/delete',24,2,3),(9,'添加权限','/permissions/add',25,2,4),(10,'删除权限','/permissions/delete',26,2,4),(11,'分配角色','/admins/saveAdminRole',27,2,2),(12,'分配权限','/roles/saveRolePermission',28,2,3),(13,'启用/禁用管理员','/admins/saveAdminEnable',29,2,2),(16,'用户管理','/usersPage',5,1,1),(17,'启用/禁用用户','/users/saveUserEnable',31,2,16),(18,'帖子管理','/postsPage',6,1,1),(19,'帖子置顶','/posts/saveTop',32,2,18),(20,'帖子加精','/posts/saveGood',33,2,18),(21,'帖子删除','/posts/delete',34,2,18),(22,'回复管理','/replysPage',7,1,1),(24,'删除回复','/replys/delete',35,2,22),(25,'标签管理','/labelsPage',8,1,1),(26,'添加标签','/labels/add',36,2,25),(27,'删除标签','/labels/delete',37,2,25),(28,'修改标签','/labels/update',37,2,25);
/*!40000 ALTER TABLE `cczu_forum_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cczu_forum_posts`
--

DROP TABLE IF EXISTS `cczu_forum_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cczu_forum_posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '帖子编号',
  `content` text COMMENT '帖子内容',
  `good` bit(1) NOT NULL COMMENT '是否精华',
  `init_time` datetime NOT NULL COMMENT '发布时间',
  `label_id` int(11) DEFAULT NULL COMMENT '标签编号',
  `reply_count` int(11) DEFAULT NULL COMMENT '回复数量',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `top` bit(1) NOT NULL COMMENT '是否置顶',
  `user_id` int(11) NOT NULL COMMENT '楼主编号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_46eh0lt2x9ftqcv9tjs8meqj8` (`title`) COMMENT '帖子标题唯一性约束',
  KEY `FK41ebsa5jpn18egdtjo6uiaugn` (`user_id`) COMMENT '普通索引：楼主编号',
  KEY `FKnxd3qh1m3c0o6tc3ojfa8fm6o` (`label_id`) COMMENT '普通索引：标签编号',
  CONSTRAINT `FK41ebsa5jpn18egdtjo6uiaugn` FOREIGN KEY (`user_id`) REFERENCES `cczu_forum_user` (`id`),
  CONSTRAINT `FK6fy7gi6y0u1meggx9rfknc9pb` FOREIGN KEY (`user_id`) REFERENCES `cczu_forum_user` (`id`),
  CONSTRAINT `FKch4njibg4vu0ph9met15wysn0` FOREIGN KEY (`label_id`) REFERENCES `cczu_forum_label` (`id`),
  CONSTRAINT `FKnxd3qh1m3c0o6tc3ojfa8fm6o` FOREIGN KEY (`label_id`) REFERENCES `cczu_forum_label` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=269 DEFAULT CHARSET=utf8 COMMENT='帖子记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cczu_forum_posts`
--

LOCK TABLES `cczu_forum_posts` WRITE;
/*!40000 ALTER TABLE `cczu_forum_posts` DISABLE KEYS */;
INSERT INTO `cczu_forum_posts` VALUES (215,'<p><i>去年的夏天，因为空调漏水问题联系过楼管进行修理，之后好了一段时间。但是最近，空调再度出现了漏水现象。桌子在空调下方的那个同学的很多个人物品都没能幸免，其中也包括他个人非常珍惜的志愿工作证明。希望相关人员看到之后<img src=\"http://127.0.0.1/images/upload/2018-07-02/289ed5d5-0bcc-4e11-9c4b-72fe4bf82a7f.jpeg\" alt=\"null\">能够尽快进行彻底的修理。如图是同学一本被泡过的书</i></p>','\0','2018-07-02 14:24:40',1,1,'宿舍楼空调问题','',1),(216,'<p style=\"text-align: center; \"><b><i><u>版聚报名啦！</u></i></b></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;上次通知大家以后反响很好，感谢大家的支持！！！现在正式通知出炉啦～</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;关于地点问题，由于大家纷纷表示站点是长桌，不方便沟通交流，并且想吃江苏</p><p>style健康食物，于是靠谱的我重新搜罗到一家人气很旺的、好吃的、圆桌饭店。关于时</p><p>间，有一些师兄师姐要参加30号的公务员考试。但是由于要考到30号较晚时间，实在无法</p><p>两全。在此祝他们考出好成绩！其他的乡亲们都到碗里来！！！能相逢是多么有缘的事：</p><p>）</p><p><br></p><p>时间：11月29日晚&nbsp;6点</p><p>地点：金竹轩大酒楼，清华西门向北100米。（是的，你没有看错，就是去隔壁！不过真</p><p>的很近很方便很好吃！）</p><p>交通：从北大东南门的中关园站，乘&nbsp;697&nbsp;(西苑方向)&nbsp;或&nbsp;696&nbsp;699&nbsp;特18&nbsp;498&nbsp;601&nbsp;614&nbsp;5</p><p>79&nbsp;运通105&nbsp;681&nbsp;365&nbsp;特4&nbsp;特6&nbsp;到 西门，或者骑车。然后向北走100米。</p><p>人均：预计人均60.&nbsp;如果饭后要唱歌，参加的老乡们自行AA～</p>','','2018-07-02 14:33:41',1,0,'版聚报名啦！！！','\0',1),(217,'<p><b><font color=\"#c0c000\"><span>2&nbsp;乌拉圭&nbsp;</span></font><font color=\"#00c000\"><span>┓</span></font><font color=\"#c0c0c0\"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┏</span></font><font color=\"#c0c0c0\">&nbsp;西班牙&nbsp;</font><font color=\"#c0c000\"><span>1(3)</span></font><br></b></p><p><b>&nbsp;<font color=\"#00c000\"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┗&nbsp;</span></font><font color=\"#c0c0c0\"><span>乌拉圭&nbsp;┓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┏&nbsp;俄罗斯&nbsp;</span></font><font color=\"#00c000\"><span>┓</span></font><br></b></p><p><b>&nbsp;<font color=\"#c0c0c0\"><span>&nbsp;1&nbsp;</span></font><font color=\"#c0c0c0\">葡萄牙&nbsp;</font><font color=\"#c0c0c0\"><span>┛&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┃&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┃&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></font><font color=\"#00c000\"><span>┗&nbsp;</span></font><font color=\"#c0c000\"><span>俄罗斯&nbsp;1(4)</span></font><br></b></p><p><b>&nbsp;<font color=\"#c0c0c0\"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣━━━━┓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┏━━━━┫</span></font></b></p><p><b><font color=\"#c0c0c0\"><span>&nbsp;</span></font><font color=\"#c0c000\"><span>&nbsp;4&nbsp;&nbsp;法国&nbsp;&nbsp;</span></font><font color=\"#00c000\"><span>┓</span></font><font color=\"#c0c0c0\"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┃&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┃&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┃&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┃&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></font><font color=\"#00c000\"><span>┏</span></font><font color=\"#c0c000\"><span>克罗地亚1(3)</span></font><br></b></p><p><b>&nbsp;<font color=\"#00c000\"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┗&nbsp;&nbsp;</span></font><font color=\"#c0c0c0\"><span>法国&nbsp;&nbsp;┛&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣━━┓&nbsp;&nbsp;&nbsp;&nbsp;┃&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┗克罗地亚</span></font><font color=\"#00c000\"><span>┛</span></font><br></b></p><p><b>&nbsp;<font color=\"#c0c0c0\"><span>&nbsp;3&nbsp;</span></font><font color=\"#c0c0c0\">阿根廷&nbsp;</font><font color=\"#c0c0c0\"><span>┛&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┃&nbsp;&nbsp;&nbsp;&nbsp;┃&nbsp;&nbsp;&nbsp;&nbsp;┃&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┗</span></font><font color=\"#c0c0c0\">&nbsp;&nbsp;丹麦&nbsp;&nbsp;</font><font color=\"#c0c000\"><span>1(2)</span></font><br></b></p><p><b>&nbsp;<font color=\"#c0c0c0\"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┃&nbsp;&nbsp;&nbsp;&nbsp;┃&nbsp;&nbsp;&nbsp;&nbsp;┃</span></font><br></b></p><p><b>&nbsp;<font color=\"#c0c0c0\"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┃&nbsp;&nbsp;&nbsp;&nbsp;┃&nbsp;&nbsp;&nbsp;&nbsp;┃</span></font><br></b></p><p><b>&nbsp;<font color=\"#c0c0c0\"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┃&nbsp;&nbsp;&nbsp;&nbsp;┃&nbsp;&nbsp;&nbsp;&nbsp;┃</span></font><br></b></p><p><b>&nbsp;<font color=\"#c0c0c0\"><span>&nbsp;&nbsp;&nbsp;&nbsp;巴西&nbsp;&nbsp;┓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┃&nbsp;&nbsp;&nbsp;&nbsp;┃&nbsp;&nbsp;&nbsp;&nbsp;┃&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┏&nbsp;&nbsp;瑞典</span></font><br></b></p><p><b>&nbsp;<font color=\"#c0c0c0\"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣━━━━┓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┃&nbsp;&nbsp;&nbsp;&nbsp;┗━━┫&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┏━━━━┫</span></font><br></b></p><p><b>&nbsp;<font color=\"#c0c0c0\"><span>&nbsp;&nbsp;&nbsp;墨西哥&nbsp;┛&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┃&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┃&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┃&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┃&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┗&nbsp;&nbsp;瑞士</span></font><br></b></p><p><b>&nbsp;<font color=\"#c0c0c0\"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣━━━━┫&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣━━━━┫</span></font><br></b></p><p><b>&nbsp;<font color=\"#c0c0c0\"><span>&nbsp;&nbsp;&nbsp;比利时&nbsp;┓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┃&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┃&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┃&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┃&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┏哥伦比亚</span></font><br></b></p><p><b>&nbsp;<font color=\"#c0c0c0\"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣━━━━┛&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┃&nbsp;&nbsp;&nbsp;&nbsp;┃&nbsp;&nbsp;&nbsp;&nbsp;┃&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┗━━━━┫</span></font><br></b></p><p><b>&nbsp;<font color=\"#c0c0c0\"><span>&nbsp;&nbsp;&nbsp;&nbsp;日本&nbsp;&nbsp;┛&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┗━━┻━━┛&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┗&nbsp;英格兰</span></font></b><br></p>','\0','2018-07-02 14:35:25',1,0,'2018俄罗斯世界杯淘汰赛对阵图','',1),(218,'<table cellspacing=\"0\" cellpadding=\"0\" class=\"layui-table\"><tbody><tr><td class=\"t_f\" id=\"postmessage_351770\"><img src=\"http://localhost:8082/layui/images/face/0.gif\" alt=\"[微笑]\">推荐大家一个靠谱的论文检测平台。重复的部分有详细出处以及具体修改意见，能直接在文章上做修改，全部改完一键下载就搞定了。怕麻烦的话，还能用它自带的降重功能。哦对了，他们现在正在做毕业季活动， 赠送很多免费字数，可以说是十分划算了！地址是：paperpass</td></tr></tbody></table>','\0','2018-07-02 14:36:12',3,1,'论文查重去哪好','\0',20),(219,'<p>扬帆南下，寻祖先之足迹，此历史地理。</p><p><br></p><p>立于险关，想古时千军破阵，亦历史地理。</p><p><br></p><p>山河归于一统，胜景未有若斯之美者，皆历史地理也。</p><p><br></p><p><br></p><p><br></p><p>大家共同从二教迁到这里商议问题，期末的时候向回看这一经历，已然也是历史地理了~</p><p>~</p>','\0','2018-07-02 14:39:35',3,0,'诚愿大家共同商议历史地理问题~~','\0',1),(220,'<p><span>那应该会全力追求卡哇伊了，还是有点小期待的<img src=\"http://localhost:8082/layui/images/face/39.gif\" alt=\"[鼓掌]\"></span></p>','\0','2018-07-02 14:39:59',1,0,'哇，詹姆斯和湖人口头协议了','\0',20),(221,'<p>我又来吐槽苹果客服了。</p><p><br></p><p>起因是最近开始用XCode，然后发现我的Apple&nbsp;ID一直是输入的中文名，在整个XCode里显得尤其突出，于是强迫症发作就想把它改成拼音。然后我就去<a href=\"https://bbs.pku.edu.cn/v2/jump-to.php?url=https%3A%2F%2Fappleid.apple.com\" target=\"_blank\" data-no-pjax=\"\">https://appleid.apple.com</a>改了。之后<a href=\"https://bbs.pku.edu.cn/v2/jump-to.php?url=https%3A%2F%2Fdeveloper.apple.com\" target=\"_blank\" data-no-pjax=\"\">https://developer.apple.com</a>那个网站就一直没有更新。我以为有点延迟，于是五天过去了。今天以为应该好了，就登了一下XCode，发现还是中文，退出重登，还是中文。于是登录到开发者官网一看，还是中文显示，而且除了可以修改邮件选项以外就没地方可以改了。</p><p><br></p><p>遂试图联系苹果客服。一路走到Apple&nbsp;ID部分，居然没有我最喜欢的聊天选项（因为可以截图），只能打电话或者发邮件。想到发邮件可能发发发几天就过去了，那还是打个电话吧。打过去之后我先描述了一下我的情况，她就开始甩锅，说开发者有一个专门的客服，但是我没法给你直接转过去，我告诉你电话号码你给他们打一下吧。我说可是这个问题不确定是不是专门的开发者网站的问题诶，有可能你们很多其他网站都没更新我的新名字。她说总之你先联系开发者客服吧_(:з」∠)_&nbsp;</p><p><br></p><p>然后我就打了那个开发者客服的电话，这个电话说。。。不好意思，我们跑路了，请你访问<a href=\"https://bbs.pku.edu.cn/v2/jump-to.php?url=https%3A%2F%2Fdeveloper.apple.com%2Fcontact\" target=\"_blank\" data-no-pjax=\"\">https://developer.apple.com/contact</a>。。。。。。。。。。。。╭(╯^╰)╮什么鬼！！！也没有办法，于是我就又访问了这个网站。发现这个网站更神奇，也是只能打电话或者发邮件，但他们的电话服务还只限周中的工作时间。于是转了一圈，最后还是发了邮件。。。浪费了十分钟生命，目前为止此问题解决进度：0%&nbsp;_(:з」∠)_</p>','\0','2018-07-02 14:41:23',1,0,'苹果的客服系统真迷人 ','\0',1),(222,'<p>得意姐的问题勾起了我多年前的回忆，也在此咨询一下。</p><p><br></p><p>我小时候识字算早的，然而在小学里很快暴露出写不好作文的弱点。我逐渐意识到，自己写出来的东西缺乏“感情”。父母自然让我多读范文，学习别人的长处。</p><p><br></p><p>之后我就发现，我实在学不进去。因为在阅读抒情性的散文的时候，我经常会产生生理反应，包括脸红，心跳加速，以及全身上下仿佛有电流经过的感觉，后来才知道那就是“起鸡皮疙瘩”。文章的感情色彩越强烈，我的反应就越明显。特别是一些拟人用得比较多的文章，把动植物甚至一些自然景物与妈妈爷爷之类的人物概念联系起来。初中之后对于涉及爱情和深厚亲情的文章也是如此。</p><p><br></p><p>我尝试和别人描述这种感受，然而基本得不到理解。初中时候甚至看了几年《读者》杂志，可以说封面上的几乎每篇重点文章都能导致上述症状。初中基本不让写议论文，结果我甚至在(成绩对我没有意义但必须参加的)中考前经常yy作文题目来一个可以写说明文的(例如“水”)，因为记叙文我基本总是写得没啥感情色彩。</p><p><br></p><p>当然这个问题到高中就不明显了，因为可以写议论文了，也就不用再读那样的散文了。不过至今基本读不进去言情、武侠等题材的文学作品，不知道是否也有关系。</p><p><br></p><p>最后举几篇具体例子吧，随手查了一下课本目录</p><p><br></p><p>宗璞&lt;紫藤萝瀑布&gt;</p><p>&lt;植物妈妈有办法&gt;</p><p>梁衡的&lt;夏&gt;</p>','\0','2018-07-02 14:42:31',2,0,'为什么读散文和写作文时会起鸡皮疙瘩','\0',20),(223,'<p>各位资深球迷，新球迷，伪球迷，畅所欲言 ^^--</p>','\0','2018-07-02 14:42:48',1,0,'世界杯，谁会夺冠呢？','\0',3),(224,'<p><span>OPPO&nbsp;2019届校园招聘简章</span><br></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p><p><span>-趁年轻&nbsp;造未来</span><br></p><p><span>一、关于OPPO</span><br></p><p>OPPO&nbsp;是更多年轻人选择的拍照手机品牌。</p><p>十年来，OPPO&nbsp;专注于手机拍照领域的技术创新，开创了手机自拍美颜时代，先后首发了前置&nbsp;500&nbsp;万像素和&nbsp;1600&nbsp;万像素的拍照手机，创造性地推出了全球首个电动旋转摄像头和超清画质等拍照技术，为全球&nbsp;30&nbsp;多个市场的年轻人提供了出色的手机拍照体验。</p><p>据权威数据机构&nbsp;IDC&nbsp;统计，2017&nbsp;年全球手机市场出货量&nbsp;OPPO&nbsp;排名第四。如今，全球有超过&nbsp;2&nbsp;亿年轻人正在使用&nbsp;OPPO&nbsp;拍照手机。</p>','\0','2018-07-02 14:42:51',5,0,'OPPO 2019届校园招聘简章 -趁年轻 造未来','\0',1),(225,'<p>找工作的时机（针对本科生而言）</p><p><br></p><p>1.&nbsp;大二、大三寻找实习、兼职培养经验</p><p>2.&nbsp;大四秋季学期开学后招聘季就开始了。</p><p><br></p><p>北大未名站内渠道：</p><p><br></p><p><font color=\"#00c000\"><span>Job_Post</span></font>版面</p><p><font color=\"#00c000\"><span>Intern</span></font>版面</p><p><font color=\"#00c000\"><span>Job_IT</span></font>版面</p><p><font color=\"#00c000\"><span>PartimeJob</span></font>版面</p><p><font color=\"#00c000\"><span>Job_Servant</span></font>版面</p><p><br></p><p><br></p><p><br></p><p>外部招聘网站:</p><p><br></p><p>中华英才网校园频道</p><p><a href=\"https://bbs.pku.edu.cn/v2/jump-to.php?url=http%3A%2F%2Fcampus.chinahr.com%2F\" target=\"_blank\" data-no-pjax=\"\">http://campus.chinahr.com/</a></p><p>51job校园频道</p><p><a href=\"https://bbs.pku.edu.cn/v2/jump-to.php?url=http%3A%2F%2Fxy.51job.com%2F\" target=\"_blank\" data-no-pjax=\"\">http://xy.51job.com/</a></p><p>智联招聘校园频道</p><p><a href=\"https://bbs.pku.edu.cn/v2/jump-to.php?url=http%3A%2F%2Fstudent.zhaopin.com%2F\" target=\"_blank\" data-no-pjax=\"\">http://student.zhaopin.com/</a></p><p>大街网</p><p><a href=\"https://bbs.pku.edu.cn/v2/jump-to.php?url=http%3A%2F%2Fjob.dajie.com\" target=\"_blank\" data-no-pjax=\"\">http://job.dajie.com</a></p><p>过来人求职网</p><p><a href=\"https://bbs.pku.edu.cn/v2/jump-to.php?url=http%3A%2F%2Fwww.guolairen.com\" target=\"_blank\" data-no-pjax=\"\">http://www.guolairen.com</a>&nbsp;</p><p>中国高校毕业生就业服务信息网</p><p><a href=\"https://bbs.pku.edu.cn/v2/jump-to.php?url=http%3A%2F%2Fwww.myjob.edu.cn%2F\" target=\"_blank\" data-no-pjax=\"\">http://www.myjob.edu.cn/</a></p><p>中国人才热线校园频道</p><p><a href=\"https://bbs.pku.edu.cn/v2/jump-to.php?url=http%3A%2F%2Fwww.cjol.com%2Fmain%2Fschool%2Fdefault.asp\" target=\"_blank\" data-no-pjax=\"\">http://www.cjol.com/main/school/default.asp</a></p><p>HIALL求职社区</p><p><a href=\"https://bbs.pku.edu.cn/v2/jump-to.php?url=http%3A%2F%2Fwww.hiall.com.cn%2Fbbs%2F\" target=\"_blank\" data-no-pjax=\"\">http://www.hiall.com.cn/bbs/</a></p><p>应届生求职论坛</p><p><a href=\"https://bbs.pku.edu.cn/v2/jump-to.php?url=http%3A%2F%2Fwww.yingjiesheng.com\" target=\"_blank\" data-no-pjax=\"\">http://www.yingjiesheng.com</a></p><p>中国研究生人才网</p><p><a href=\"https://bbs.pku.edu.cn/v2/jump-to.php?url=http%3A%2F%2Fwww.91student.com%2F\" target=\"_blank\" data-no-pjax=\"\">http://www.91student.com/</a></p>','\0','2018-07-02 14:43:28',5,1,'找工作常用网站&常用渠道','\0',1),(226,'<p>指南请见附件&nbsp;pkuthss-bootstrap-0.1.6.pdf。</p><p>其源文件请见附件&nbsp;pkuthss-bootstrap-0.1.6.zip。</p><p>WinEdt&nbsp;破解方法请自行在&nbsp;MathTools&nbsp;版搜索标题含“WinEdt”的帖子。</p><p>本指南针对&nbsp;pkuthss&nbsp;v1.7.5+。</p><p><br></p><p>主要改动：</p><p>*&nbsp;去除&nbsp;ctex-xecjk-winfonts.def，因后者不再被&nbsp;ctex&nbsp;使用。</p><p><a target=\"_self\" href=\"https://bbs.pku.edu.cn/attach/c1/eb/c1eb73e116064c11/pkuthss-bootstrap-0.1.6.pdf\">https://bbs.pku.edu.cn/attach/c1/eb/c1eb73e116064c11/pkuthss-bootstrap-0.1.6.pdf</a></p><p><a target=\"_blank\" href=\"https://bbs.pku.edu.cn/attach/50/ad/50adde9f670bcf88/pkuthss-bootstrap-0.1.6.zip\">https://bbs.pku.edu.cn/attach/50/ad/50adde9f670bcf88/pkuthss-bootstrap-0.1.6.zip</a><br></p>','\0','2018-07-02 14:43:56',3,0,'TeX Live + pkuthss 安装使用傻瓜指南 v0.1.6','\0',20),(227,'<p><p><span>由常州学长学姐建立，无偿给考研学子提供相关信息咨询</span></p><span>群号:310727625</span><br><span>欢迎加入</span></p>','\0','2018-07-02 14:44:35',3,0,'19年常州大学考研交流群','\0',3),(228,'<p>书上有圈划，但是不影响阅读以及使用。</p><p>10元转，或者认识的直接拿走。</p><p>站内联系~</p><p><br></p><p>已转。</p>','\0','2018-07-02 14:44:36',6,0,'转逻导教材','\0',1),(229,'<p><span>先感谢下，有哪位大神指导，考博资料哪家书店有卖？</span></p>','\0','2018-07-02 14:45:19',3,1,'考博资料哪家书店有卖？','\0',3),(230,'<p><span>某些app获取拍照权限会升起摄像头，有效提醒用户权限狗的存在</span></p><p><span>据说telegram已露馅</span></p>','\0','2018-07-02 14:45:24',3,0,'nex和findx对市场的正面作用','\0',20),(231,'<p><span>师哥师姐们，我打算考16年油气储运专业的研究生，真心求购下列书籍：</span><br><br><span>1.《油气集输》历年考研真题</span><br><br><span>2.《天然气集输工程》校内习题集</span><br><br><span>3.《原油集输工程》校内习题集</span><br><br><span>如果你们有的话或者能得到的话一定要帮帮我呀～！*^_^*&nbsp;&nbsp;我的手机是：15764219277</span></p>','\0','2018-07-02 14:45:57',3,1,'师哥师姐，16考研小学弟求购学习资料啦～～～','\0',3),(232,'<p><span>400mm等降水线两侧人类活动方式这一题，需要写出游牧生活里面“逐水草而居”和“各有分地”的具体内涵吗</span></p>','\0','2018-07-02 14:46:28',3,1,'求问400mm等降水线两侧人类活动方式的评分标准','\0',1),(233,'<p><span>2019想报考川大外语学院的现当代英美文学专业，求学长学姐指点迷津，该准备什么资料书呢<img src=\"http://localhost:8082/layui/images/face/53.gif\" alt=\"[耶]\"></span></p>','\0','2018-07-02 14:48:33',3,0,'考研咨询','\0',3),(241,'<p><font face=\"Tahoma, Helvetica, SimSun, sans-serif\">希望妳最好也是沈阳的女孩，至少工作在沈阳，这样两个人未来的生活比较好规划。家庭父母感情和睦，学历在本科以上。感情经历简单，心地善良，热爱生活，懂得体谅别人和感恩，性格不急躁，其他的两个人要看感觉吧。</font><br><br><br><font face=\"Tahoma, Helvetica, SimSun, sans-serif\">&nbsp; &nbsp;介绍一下我，83年生，沈阳本地人，爱好广泛，性格开朗。身高181 体重75公斤。刚刚博士毕业在高校工作。认真交个以后可以向婚姻发展的女友，希望可以和同样真诚的妳相识。有意请给我发论坛消息或者留言吧，一定回复给你联系方式和照片的，多谢。</font><br><br><font face=\"Tahoma, Helvetica, SimSun, sans-serif\">最后祝大家都找到自己的美好姻缘。</font></p>','\0','2018-07-02 14:49:57',2,0,'希望有缘认识你，征个靠谱女友','\0',3),(242,'<p>【标题】区块链的信任、共识与金融功能</p><p>【时间】2018年6月29日&nbsp;14:00</p><p>【地点】北京大学光华管理学院1号楼（计算中心对面）216</p><p>【主讲人】邹传伟，比特大陆首席经济学家</p><p>【主办方】北大光华-ofo小黄车共享经济研究中心、光华区块链研究小组</p><p><br></p><p>一、比特大陆简介</p><p>比特大陆（Bitmain）是一家专注于高速、低功耗定制芯片设计研发的科技公司，拥有低功耗高性能的16nm工艺集成电路的量产经验，成功设计量产了多款ASIC定制芯片和集成系统。重点面向世界的中小型企业及个人用户，目前销售服务网络覆盖了全球100多个国家和地区。</p><p><br></p><p>二、主讲人简介</p><p>邹传伟，比特大陆首席经济学家</p><p>-&nbsp;北京大学统计学学士、经济学硕士，中国人民银行研究生部（现清华大学五道口金融学院）经济学博士，哈佛大学肯尼迪学院职业中期公共管理硕士（梅森学者项目），副研究员</p><p>-&nbsp;2006年-2015年供职于中央汇金公司和中国投资公司</p><p>-&nbsp;2015年-2018年为南湖金服合伙人</p><p>-&nbsp;曾获首届（2014年度）孙冶方金融创新奖和第五届（2015年度）第五届中国软科学奖（前沿探索奖）</p>','\0','2018-07-02 14:51:15',3,0,'区块链的信任、共识与金融功能','\0',1),(243,'<p><span>如题&nbsp;&nbsp;200元购买的8小时的学生羽毛球卡&nbsp;&nbsp;联系方式156五二六八1717</span></p>','\0','2018-07-02 14:51:21',6,0,'70元转让四小时羽毛球卡  订场不限时间','\0',20),(244,'<p><span>微信：17185525497&nbsp; &nbsp;添加请备注</span></p>','\0','2018-07-02 14:51:22',2,0,'交友','\0',3),(245,'<p><span>都是大家喜爱的大牌…</span></p>','\0','2018-07-02 14:51:59',6,0,'靠谱俄罗斯代购正品','\0',3),(246,'<p><span>因为搬家，找出一条朋友送的DW手表一款，女款；在韩国买的1290.包装齐全，现在不想要了，换一些钱，全新未佩戴，现在全套600元出，可以小刀，微信：184554712</span></p>','\0','2018-07-02 14:52:30',6,0,'转让出DW手表一款','\0',3),(247,'<p>本周四(2018-06-21)晚上，<span>银华基金管理有限公司副总经理周毅</span>将亲临北大双创中心，就理工科人在金融投资中的优势展开深入的讨论和交流，欢迎大家参与！</p><p><br></p><p><span>周毅</span><br></p><p>中组部国家“千人计划”特聘专家</p><p>银华基金管理有限公司副总经理</p><p>银华国际资本管理有限公司总经理</p><p><br></p><p>北京大学计算机软件本科、赴美留学先后毕业于南卡莱罗纳大学、约翰霍普金斯大学。</p><p><br></p><p>20年从业经验，回国加入银华基金前，任职于巴克莱亚太集团、巴克莱资本、美国普华永道金融服务部等知名国际金融机构，长期从事数量化投资相关工作。</p><p><br></p><p>2010年回国创立了银华基金量化投资部，前瞻性地将海外先进量化投资理念应用到A股投资实践中，部门现资产管理规模超过500亿元，在分级基金、量化MOM、量化多头管理、场外衍生品交易等领域持续领跑行业，是国内首屈一指的创新型量化团队。</p><p><br></p><p>本讲主题及信息</p><p><br></p><p>主题：理工科人在金融投资中的优势</p><p><br></p><p>内容：第一部分：量化投资ABC</p><p>第二部分：理工科的优势</p><p>第三部分：从全球经验到中国实践</p><p><br></p><p>时间：</p><p>6月21日（周四）晚上18:40</p><p><br></p><p>地点：</p><p>北大二教B1双创中心大讲堂</p>','\0','2018-07-02 14:52:52',3,0,'银华基金副总周毅——理工科人在金融投资中的优势','\0',1),(248,'<p><span>苹果手机分期购无需任何抵押，保证当然让你拿到手机。</span><br><span>高价回收手机，出售平板电脑，手机靓号，组装电脑，各类手机配件。</span><br><span>详询电话：18745046574欢迎打电话咨询</span></p>','\0','2018-07-02 14:53:00',6,0,'苹果手机分期购，让你拿到喜欢的手机。','\0',3),(249,'<p>【标题】北京大学佛学研究系列讲座21讲：如何是道？—&nbsp;“平常心是道”源流探析</p><p>【时间】2018年6月15日&nbsp;19:00-21:00</p><p>【地点】北京大学李兆基人文学苑2号楼哲学系B112教室</p><p>【主讲人】藤井淳，日本驹泽大学佛教学部副教授</p><p>【主办方】北京大学哲学系、北京大学佛教研究中心</p><p>【讲座语言】日本（中文翻译）</p><p>【内容简介】</p><p>本讲座将从“平常心是道”这句著名的禅语出发，探讨东亚古典文献语境下如何理解“道”。伊势神道的典籍《大元神一秘书》中已经出现了“大道者平常心”这样的句子，据认为来自唐人所撰《老子述义》的逸文。可见在马祖道一之前“平常心”已经与道联系在了一起。我们通过比对多种可以找到梵语和藏语对应文本的汉译佛典，考察对“道”的翻译，发现在梵语原典“道”的前后并没有“平坦”这样的修饰词，而是译者在汉译时添加的。这说明，在翻译即诠释的阶段，译者有意无意地将“平坦”与“道”联系在了一起。由此，我们通过对中国古典文献的溯源，确认了中国思想中原本就有大道平常（坦）的思维模式。我们进一步考察了其后的中国思想史，揭示了这句禅语所折射的中国思想对“道”的真理性和理想性的理解与追求。</p>','\0','2018-07-02 14:53:30',3,0,'如何是道？— “平常心是道”源流探析','\0',1),(250,'<p><span>最不缺的就是赚钱机会！如何利用下班的业余时间兼职赚钱</span><br><br><span>我是一个大学刚毕业不久的学生，因为找不到合适的工作还苦恼，天天在家里一无事事。</span><br><br><span>直到有一天无意中去朋友家里吃饭，吃完了以后我叫他出去玩，他说他不出去他要赚钱，我当时就想在家里不出去上班怎么能赚到</span><br><br><span>钱呢，他告诉我他每天都能赚个3-5百，多的时候还可以赚1-2千。我就问他你每天不出门你怎么能赚到钱呀。他告诉我他只从在威</span><br><br><span>信上认识了TXteams团队导师。</span><br><br><span>现在每天都不用出门赚的比别人都多，短短两个月时间已经赚了3W块钱了。之后在我的苦苦哀求下才把导师的威信号告诉我，我加</span><br><br><span>了以后导师很有耐心一步步教我怎么操作，没想到在短短2小时之内我就赚了200元。</span><br><br><span>现在我已经跟着导师赚了1W多元了。在这里我把TXteams团队导师的V X告诉你们是iii5218&nbsp;&nbsp;希望能帮助更多的朋友。</span></p>','\0','2018-07-02 14:53:56',5,0,'最不缺的就是赚钱机会！','\0',3),(251,'<p>【标题】所得税改消费税的福利效应</p><p>【时间】2018年6月20日（周三），下午4点</p><p>【地点】北京大学经济学院606会议室</p><p>【主讲人】Juan&nbsp;C.&nbsp;Conesa教授，石溪大学经济系主任</p><p>【主办方】北京大学经济学院</p><p>近年来，美国的很多州均推行了税制改革，降低所得税税率的同时增加消费税。这一税制改革被广泛视为有助于改善效率，但也会导致收入分配的恶化。在本次讲座中，Conesa教授将介绍他的一篇新论文，该文对上述税改的福利效果进行了定量分析。</p><p>In&nbsp;recent&nbsp;years,&nbsp;many&nbsp;U.S.&nbsp;states&nbsp;have&nbsp;reduced&nbsp;the&nbsp;state’s&nbsp;income&nbsp;tax&nbsp;rate&nbsp;while&nbsp;attempting&nbsp;to&nbsp;increase&nbsp;tax&nbsp;revenue&nbsp;from&nbsp;consumption&nbsp;taxes.&nbsp;The&nbsp;standard&nbsp;argument&nbsp;in&nbsp;favor&nbsp;of&nbsp;this&nbsp;tax&nbsp;reform&nbsp;is&nbsp;made&nbsp;on&nbsp;the&nbsp;grounds&nbsp;of&nbsp;efficiency&nbsp;considerations,&nbsp;though&nbsp;it&nbsp;is&nbsp;also&nbsp;perceived&nbsp;as&nbsp;a&nbsp;policy&nbsp;that&nbsp;increases&nbsp;inequality.&nbsp;In&nbsp;this&nbsp;lecture&nbsp;Prof.&nbsp;Conesa&nbsp;will&nbsp;present&nbsp;his&nbsp;recent&nbsp;paper&nbsp;that&nbsp;quantifies&nbsp;the&nbsp;welfare&nbsp;implications&nbsp;of&nbsp;a&nbsp;tax&nbsp;reform&nbsp;of&nbsp;such.</p><p><br></p><p>Conesa教授先后于1998年、1999年从巴塞罗那大学、明尼苏达大学获得经济学博士学位，现任石溪大学经济系主任。他的主要研究领域为宏观经济学和公共经济学，因其在税收、社会保障等问题上富有影响力的研究而获得卓著的学术声誉。他已在《美国经济评论》、《货币经济学杂志》、《国际经济评论》等一流学术期刊上发表多篇论文。</p><p>Prof.&nbsp;Conesa&nbsp;received&nbsp;his&nbsp;Ph.D.&nbsp;degrees&nbsp;in&nbsp;Economics&nbsp;from&nbsp;the&nbsp;Universitat&nbsp;de&nbsp;Barcelona&nbsp;in&nbsp;1998&nbsp;and&nbsp;the&nbsp;University&nbsp;of&nbsp;Minnesota&nbsp;in&nbsp;1999.&nbsp;He&nbsp;is&nbsp;currently&nbsp;the&nbsp;chair&nbsp;of&nbsp;the&nbsp;Department&nbsp;of&nbsp;Economics,&nbsp;Stony&nbsp;Brook&nbsp;University.&nbsp;He&nbsp;has&nbsp;gained&nbsp;a&nbsp;high&nbsp;academic&nbsp;reputation&nbsp;for&nbsp;his&nbsp;influential&nbsp;research&nbsp;on&nbsp;taxation,&nbsp;social&nbsp;security,&nbsp;etc.&nbsp;He&nbsp;has&nbsp;published&nbsp;several&nbsp;papers&nbsp;in&nbsp;top&nbsp;journals&nbsp;such&nbsp;as&nbsp;American&nbsp;Economic&nbsp;Review,&nbsp;Journal&nbsp;of&nbsp;Monetary&nbsp;Economics,&nbsp;International&nbsp;Economic&nbsp;Review&nbsp;and&nbsp;so&nbsp;on.</p>','\0','2018-07-02 14:54:21',3,0,'经济学院：Conesa所得税改消费税的福利效应','\0',1),(252,'<p><span>博宇创业科技有限公司成立于2014年，公司座落于美丽的羊城广州，CPA广告点击付费软件是由本公司独立研发的一款自带AP转换和自动点击脚本的APP,该APP自带IP转换和自动点击脚本连接联盟数据库接受任务自动完成赚取广告点击收益，一切操作皆由软件脚本全自动完成，无需人工。</span><br><span>本公司长期从事PNM点击，软件操作简单，提现简单，目前市面上除了百度，腾讯，360等广告平台，还有上千家有偿点击的广告联盟，他们需要大量的点击量，我们是跟近50家中大型广告联盟达成的广告点击协议，从而达到软件收益目的。而且我们公司还在和其他广告联盟的大力对接中，实现我们软件可以给客户带来长期收益的目标。如果你的工作,事业,收入达不到你想要的结果，那么就加入我们把，让你每天多一份稳定收入。了解咨询电话17387908692微信boyu0205</span></p>','\0','2018-07-02 14:54:28',5,0,'博宇创业科技有限公司招聘兼职','\0',3),(253,'<p>Subject:&nbsp;Total&nbsp;Positivity&nbsp;for&nbsp;nxn&nbsp;Matrices&nbsp;and&nbsp;Beyond</p><p>Speaker:&nbsp;Xuhua&nbsp;He&nbsp;(University&nbsp;of&nbsp;Maryland)</p><p>Time:&nbsp;10:00am&nbsp;-&nbsp;11:30am,&nbsp;June&nbsp;18th/20th/22th,&nbsp;2018&nbsp;</p><p>Venue:&nbsp;Room&nbsp;75201,&nbsp;Jingchunyuan&nbsp;78,&nbsp;BICMR</p><p><br></p><p>Abstract:&nbsp;</p><p>An&nbsp;invertible&nbsp;nxn&nbsp;matrix&nbsp;is&nbsp;totally&nbsp;positive&nbsp;(resp.&nbsp;totally&nbsp;nonnegative)&nbsp;if&nbsp;all&nbsp;the&nbsp;minors&nbsp;are&nbsp;positive&nbsp;(resp.&nbsp;nonnegative).&nbsp;This&nbsp;definition&nbsp;is&nbsp;introduced&nbsp;by&nbsp;Schoenberg&nbsp;in&nbsp;the&nbsp;30\'s.&nbsp;The&nbsp;systematic&nbsp;study&nbsp;of&nbsp;the&nbsp;total&nbsp;positivity&nbsp;is&nbsp;due&nbsp;to&nbsp;Lusztig&nbsp;in&nbsp;the&nbsp;90\'s.&nbsp;In&nbsp;this&nbsp;mini-course,&nbsp;we&nbsp;will&nbsp;give&nbsp;an&nbsp;overview&nbsp;of&nbsp;the&nbsp;total&nbsp;positivity&nbsp;for&nbsp;GL_n&nbsp;(the&nbsp;group&nbsp;of&nbsp;invertible&nbsp;nxn&nbsp;matrices)&nbsp;and&nbsp;its&nbsp;Grassmannian,&nbsp;and&nbsp;its&nbsp;flag&nbsp;varieties.&nbsp;If&nbsp;time&nbsp;allows,&nbsp;we&nbsp;will&nbsp;talk&nbsp;about&nbsp;a&nbsp;recent&nbsp;conjecture&nbsp;of&nbsp;Arkani-Hamed,&nbsp;Witten,&nbsp;et.&nbsp;al.&nbsp;on&nbsp;the&nbsp;total&nbsp;positivity&nbsp;of&nbsp;the&nbsp;Grassmannian&nbsp;of&nbsp;GL_n.</p><p><br></p><p>Xuhua&nbsp;He&nbsp;is&nbsp;a&nbsp;professor&nbsp;in&nbsp;the&nbsp;Mathematics&nbsp;department&nbsp;at&nbsp;University&nbsp;of&nbsp;Maryland,&nbsp;College&nbsp;Park.&nbsp;His&nbsp;research&nbsp;area&nbsp;is&nbsp;algebraic&nbsp;groups,&nbsp;representation&nbsp;theory&nbsp;and&nbsp;arithmetic&nbsp;geometry.&nbsp;Professor&nbsp;Xuhua&nbsp;He&nbsp;is&nbsp;particularly&nbsp;interested&nbsp;in&nbsp;questions&nbsp;related&nbsp;to&nbsp;(finite&nbsp;and&nbsp;affine)&nbsp;Weyl&nbsp;groups&nbsp;and&nbsp;flag&nbsp;varieties,&nbsp;and&nbsp;their&nbsp;applications&nbsp;to&nbsp;arithmetic&nbsp;geometry&nbsp;and&nbsp;representation&nbsp;theory.&nbsp;</p>','\0','2018-07-02 14:55:01',3,0,'数学中心短期课程：6月18日至22日','\0',1),(254,'<p><span>校园代理要求：</span><br><span>1、认可海天，对所加盟的项目有深刻的理解和认同。</span><br><span>2、接受和执行海天制定的统一管理制度和办法，接受海天的日常督察。</span><br><span>3、积极开拓市场，逐步拓宽培训范围，按海天提供的宣传资料，根据当地的情况开展相关市场公关和各种宣传活动，以扩大海天及其推广的项目在本区域内的影响。</span><br><span>4、全面负责本区域内关于海天所授权项目系列课程的组织培训工作。</span><br><span>5、为培训的顺利实施提供必要设备、场地，使用海天指定的培训教材及培训师。</span><br><span>6、对报名学员资格文件进行审核，并建立《学员档案》。</span><br><span>7、负责本地的市场调研工作，及时反馈与本项目相关的各项信息。</span><br><span>8、积极参与海天的有关活动，接待海天的各种培训课程或会议。</span><br><span>9、接受海天组织的年度审核。</span><br><span>10、承办海天临时交办的，与项目相关的其它任务。</span><br><span>联系方式：13022427220 杜老师</span></p>','\0','2018-07-02 14:55:02',5,0,'招聘校园代理或兼职','\0',3),(255,'<p>轻薄本很多人无脑推荐x1c</p><p>然而sp4用久了更习惯镜面屏和触屏（X1C上这两个配置就有点贵了）</p><p>相比之下tp的二合一会不会好一点？和surface比起来怎么样？</p><p>要不是surface不更新i8可能就无脑入了...</p>','\0','2018-07-02 14:55:39',6,1,'求问Thinkpad tablet evo怎么样','\0',20),(256,'<p><span>亲爱的同学：</span><br><br><span>我叫刘珊惠，我是一家网站的招聘专员，负责给各高校发布招聘信息。我们在中国知名度高，信誉好，附件里是最新高校人才招聘集，请投简历来应聘合适的岗位。</span><br><br><span>祝好！</span><br><br><span>刘珊惠</span><br><span>教师之家QQ群：794135031，欢迎加群分享最新各类高校招聘。</span><br></p>','\0','2018-07-02 14:55:45',5,0,'高校发布招聘信息','\0',3),(257,'<p><span>想做个有品位的有钱人？如果有大笔闲置资金可以考虑一下欧洲房地产，比如这套“老佛爷”卡尔拉格斐的旧别墅，位于德国汉堡附近，是他在1991年——1998年时的居所，这栋别墅是有名字的，人家叫 Villa Jako，是的，老佛爷的猫都有名字，怎么房子就不能有名字呢？<img src=\"http://127.0.0.1/images/upload/2018-07-02/dc93566c-bf33-4a99-b46c-f9b77546246f.jpeg\" alt=\"null\"></span></p>','\0','2018-07-02 14:56:44',4,0,'想做有品位的有钱人？ 老佛爷的别墅来一套！','\0',1),(258,'<p><span>夏至已至，暑假不远。</span><br><br><span>有人还记得儿时的自己，每年的暑假是怎样度过的吗？</span><br><br><span>70后的小伙伴也许是这样：蒲扇、冰棍、电视剧……</span><br><br><span>80后的小伙伴基本是这样：风扇、冰棍、电视剧……</span><br><br><span>90后的小伙伴大概是这样：空调、西瓜、电视剧……</span><br><br><span>仿佛，重庆的夏天总是伴着“消暑”神器，才能过活~</span><br><br><span>然而，每个年代，却总有一部“神剧”，让你期待暑假时光……</span><br><br><span>7月快到了，有没有既能消暑，又能回忆青春，还能体验“诗和远方”的耍事？</span><br><br><span>答案是肯定的！</span><br><br><p><span>有“重庆凉都”之称的酉阳，一直是重庆人避暑胜地，7月最高气温仅26.5℃。而酉阳桃花源景区内更是全部复原了《桃花源记》的描述，游客们可以身着袍衣褶裙，品桃花酿、桃花酒感受秦晋淳朴民风；看桃源耕田、挑水，体验秦晋田园欢歌；听木叶吹奏、酉阳山歌、民歌、感受酉阳地域文化、民族特色。</span></p><p><span><img src=\"http://127.0.0.1/images/upload/2018-07-02/18cc605a-908f-4be8-bf68-f28e8f8c37c2.jpeg\" alt=\"null\"><br></span></p></p>','\0','2018-07-02 14:57:38',4,0,'酉阳桃花源第五届影视音乐自驾狂欢节，带您清爽整个七月！','\0',3),(259,'<p><span>生活不止有眼前的苟且，还有诗和远方的田野”。你，听过这一金句吗？</span></p><p><span>两年前，清华才子“矮大紧老师”在自己的节目中口吐莲花，说出了这一经典名句，瞬间击中了很多人，尤其是那些生性奔放，渴望自由，却被现实禁锢在钢筋水泥写字楼里的文艺青年。<img src=\"http://127.0.0.1/images/upload/2018-07-02/0c79b990-efe5-4a56-9c82-f740963b1e6e.jpeg\" alt=\"null\"></span></p>','\0','2018-07-02 14:57:48',4,0,'想要逐梦“诗和远方”？ 你需要加持这几样神器','\0',1),(260,'<p><span>很多姑娘最羡慕超模的不是她们的收入，而是她们的身材，格调君帮你们深扒了去年收入Top 10超模的ins，偷窥到她们保持身材的秘诀，心里暗暗感慨，当模特除了老天爷赏饭吃，也真是不容易啊！<img src=\"http://127.0.0.1/images/upload/2018-07-02/f49ef89f-5055-4f41-bc25-e94b1b201aad.jpeg\" alt=\"null\"></span></p>','\0','2018-07-02 14:58:36',4,0,'羡慕超模的身材？深扒她们ins的瘦身秘籍！','\0',1),(261,'<p><span>每所大学都有一片美丽的景色，你知道吗？</span><br><span>正值春天，花草茂盛，秀出你们的“校花校草”给小U见识一下吧！</span><br><span>当然，小U更关心的还是运营商4G网络是不是锦上添花了呢！^_^！</span><br><span>【活动时间】2018-04-28 至 2018-05-28</span><br><span>【活动内容】</span><br><span>1．&nbsp; &nbsp; &nbsp; &nbsp; 拍摄校花校草照片</span><br><span>2．&nbsp; &nbsp; &nbsp; &nbsp; 徜徉在美丽的校园，体验4G网络，告诉我们最真实的感知</span><br><span>【活动流程】</span><br><span>传花草照片&nbsp;&nbsp;——&nbsp;&nbsp;填网络体验问卷&nbsp;&nbsp;——&nbsp;&nbsp;等待幸运开奖</span><br><span>【活动奖励】</span><br><span>&nbsp;&nbsp;一等奖&nbsp; &nbsp;50元话费&nbsp; &nbsp;8位</span><br><span>&nbsp;&nbsp;二等奖&nbsp; &nbsp;20元话费&nbsp; &nbsp;18位</span><br><span>&nbsp;<img src=\"http://127.0.0.1/images/upload/2018-07-02/93b51f55-d4fd-44db-bc48-d1aa093f72a1.jpeg\" alt=\"null\">&nbsp;三等奖&nbsp; &nbsp;10元话费&nbsp; &nbsp;188位&nbsp;</span></p>','\0','2018-07-02 14:59:05',4,2,'活动赢好礼——秀出你们的校花校草','\0',3),(262,'<div class=\"double_quotes\"><div>忘了从什么时候起开始流行Ins风，在大多数人的固有概念里好像只有网红才会玩这招，而咱们只有看看的份儿？当然不，只要你掌握好这几招也可以轻松玩转Ins风。</div></div><div class=\"textCon\"><p style=\"text-align: center;\"><strong>首先要明白什么是Ins风？<img src=\"http://127.0.0.1/images/upload/2018-07-02/cc9c51ec-3256-4bf3-8416-659b8f7c4efa.jpeg\" alt=\"null\"></strong></p></div>','\0','2018-07-02 15:00:36',4,0,'Ins风只是网红的标配？学会这几招你也能轻松搞定','\0',1),(263,'<p>急寻有小程序开发经验的技术开发，我们有一个项目要外包</p><p>时间比较紧&nbsp;地点灵活&nbsp;报酬面议</p><p>有兴趣加微信zs18810181552</p>','\0','2018-07-02 15:08:08',5,0,'有人想接小程序开发吗？','\0',20),(264,'tryr','\0','2018-07-02 15:20:07',2,0,'utyu','\0',1),(265,'<img src=\"http://127.0.0.1/images/upload/2018-07-02/ec66349f-cca2-4a98-b14f-fc205d6cef7f.jpeg\" alt=\"null\">','\0','2018-07-02 15:53:24',3,0,'stata面板显示里怎么去除数据运算结果夹带的e，如下图的情况','\0',11),(266,'<p>在常州大学城附近想找个同学合租房，最好是常州大学本校在校生，能有同样的作息时间。</p>','\0','2018-07-02 15:59:11',1,1,'在常州大学城附近想找个同学合租房，有人有意愿吗？','\0',11),(267,'1212','\0','2018-07-02 17:07:09',3,0,'1313','\0',1),(268,'请勿随意回复','\0','2018-07-03 16:17:08',3,2,'谢益坤的测试','\0',94);
/*!40000 ALTER TABLE `cczu_forum_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cczu_forum_reply`
--

DROP TABLE IF EXISTS `cczu_forum_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cczu_forum_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '回复编号',
  `content` text NOT NULL COMMENT '回复内容',
  `init_time` datetime DEFAULT NULL COMMENT '回复时间',
  `up` int(11) NOT NULL COMMENT '点赞个数',
  `posts_id` int(11) NOT NULL COMMENT '帖子编号',
  `user_id` int(11) NOT NULL COMMENT '用户编号',
  PRIMARY KEY (`id`),
  KEY `FKnr6a7xtk9rm31ptn6gchi9113` (`posts_id`) COMMENT '普通索引：帖子编号',
  KEY `FKnt12hb9oqfm5eamjpg27bkpvv` (`user_id`) COMMENT '普通索引：用户编号',
  CONSTRAINT `FKlxl5ld0nipberir8lm8js9yoh` FOREIGN KEY (`user_id`) REFERENCES `cczu_forum_user` (`id`),
  CONSTRAINT `FKmul672bfera1c2ahld74xq2vq` FOREIGN KEY (`posts_id`) REFERENCES `cczu_forum_posts` (`id`),
  CONSTRAINT `FKnr6a7xtk9rm31ptn6gchi9113` FOREIGN KEY (`posts_id`) REFERENCES `cczu_forum_posts` (`id`),
  CONSTRAINT `FKnt12hb9oqfm5eamjpg27bkpvv` FOREIGN KEY (`user_id`) REFERENCES `cczu_forum_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='回复表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cczu_forum_reply`
--

LOCK TABLES `cczu_forum_reply` WRITE;
/*!40000 ALTER TABLE `cczu_forum_reply` DISABLE KEYS */;
INSERT INTO `cczu_forum_reply` VALUES (1,'就在学校书店里哦<img src=\"http://localhost:8082/layui/images/face/0.gif\" alt=\"[微笑]\">','2018-07-02 14:46:14',0,229,20),(2,'<img src=\"http://localhost:8082/layui/images/face/1.gif\" alt=\"[嘻嘻]\"><img src=\"http://localhost:8082/layui/images/face/1.gif\" alt=\"[嘻嘻]\"><img src=\"http://localhost:8082/layui/images/face/1.gif\" alt=\"[嘻嘻]\">','2018-07-02 14:47:01',0,231,1),(3,'谢谢楼主分享<img src=\"http://localhost:8082/layui/images/face/39.gif\" alt=\"[鼓掌]\">','2018-07-02 14:47:46',0,225,20),(4,'<img src=\"http://localhost:8082/layui/images/face/51.gif\" alt=\"[兔子]\">','2018-07-02 14:50:01',0,232,1),(5,'啦啦啦！<img src=\"http://localhost:8082/layui/images/face/24.gif\" alt=\"[哈欠]\">','2018-07-02 15:01:51',0,255,3),(6,'<img src=\"http://localhost:8082/layui/images/face/0.gif\" alt=\"[微笑]\">','2018-07-02 15:05:36',0,261,1),(7,'不知道','2018-07-02 15:14:08',0,218,20),(8,'<img src=\"http://localhost:8082/layui/images/face/1.gif\" alt=\"[嘻嘻]\">','2018-07-02 16:25:37',0,261,3),(9,'<p>很好<img src=\"http://localhost:8082/layui/images/face/13.gif\" alt=\"[偷笑]\"></p>','2018-07-02 16:40:48',0,215,1),(10,'<p>asd</p>','2018-07-02 17:05:58',0,266,1),(11,'<br>','2018-07-03 16:18:10',0,268,95),(12,'回复测试','2018-07-03 16:18:23',0,268,95);
/*!40000 ALTER TABLE `cczu_forum_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cczu_forum_role`
--

DROP TABLE IF EXISTS `cczu_forum_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cczu_forum_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色编号',
  `description` varchar(255) DEFAULT NULL COMMENT '角色定义',
  `name` varchar(255) NOT NULL COMMENT '角色名',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ff572j64wr6y4taed1c27vfo6` (`name`) COMMENT '角色名唯一性约束'
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cczu_forum_role`
--

LOCK TABLES `cczu_forum_role` WRITE;
/*!40000 ALTER TABLE `cczu_forum_role` DISABLE KEYS */;
INSERT INTO `cczu_forum_role` VALUES (1,'超级权限','超级管理员'),(6,'管理用户','用户管理员');
/*!40000 ALTER TABLE `cczu_forum_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cczu_forum_role_permission`
--

DROP TABLE IF EXISTS `cczu_forum_role_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cczu_forum_role_permission` (
  `role_id` int(11) NOT NULL COMMENT '角色编号',
  `permissions_id` int(11) NOT NULL COMMENT '权限编号',
  PRIMARY KEY (`role_id`,`permissions_id`),
  KEY `FKlsdkf5vtsq5qvepw45r0y89jw` (`permissions_id`) COMMENT '普通约束：权限编号',
  CONSTRAINT `FK763ep4ix05naeoliv21sm6m81` FOREIGN KEY (`role_id`) REFERENCES `cczu_forum_role` (`id`),
  CONSTRAINT `FKfswr5fov77ax6xetw28kvcbqw` FOREIGN KEY (`role_id`) REFERENCES `cczu_forum_role` (`id`),
  CONSTRAINT `FKlsdkf5vtsq5qvepw45r0y89jw` FOREIGN KEY (`permissions_id`) REFERENCES `cczu_forum_permission` (`id`),
  CONSTRAINT `FKpijeynrl14g1cw6xemt8parl9` FOREIGN KEY (`permissions_id`) REFERENCES `cczu_forum_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色权限关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cczu_forum_role_permission`
--

LOCK TABLES `cczu_forum_role_permission` WRITE;
/*!40000 ALTER TABLE `cczu_forum_role_permission` DISABLE KEYS */;
INSERT INTO `cczu_forum_role_permission` VALUES (1,1),(6,1),(1,2),(6,2),(1,3),(6,3),(1,4),(1,5),(1,6),(6,6),(1,7),(1,8),(6,8),(1,9),(1,10),(1,11),(1,12),(1,13),(1,16),(6,16),(1,17),(6,17),(1,18),(1,19),(1,20),(1,21),(1,22),(1,24),(1,25),(1,26),(1,27),(1,28);
/*!40000 ALTER TABLE `cczu_forum_role_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cczu_forum_user`
--

DROP TABLE IF EXISTS `cczu_forum_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cczu_forum_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户编号',
  `icon` varchar(255) NOT NULL COMMENT '用户头像',
  `enable` int(11) NOT NULL COMMENT '是否被封禁',
  `init_time` datetime NOT NULL COMMENT '注册时间',
  `password` varchar(255) NOT NULL COMMENT '登录密码',
  `sex` int(11) DEFAULT NULL COMMENT '性别',
  `signature` varchar(255) DEFAULT NULL COMMENT '个人签名',
  `username` varchar(255) NOT NULL COMMENT '用户名',
  `email` varchar(255) NOT NULL COMMENT '注册邮箱',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_2uqfoo05i1p5qm4ntysj2ivbs` (`username`) COMMENT '用户名唯一性约束'
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8 COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cczu_forum_user`
--

LOCK TABLES `cczu_forum_user` WRITE;
/*!40000 ALTER TABLE `cczu_forum_user` DISABLE KEYS */;
INSERT INTO `cczu_forum_user` VALUES (1,'http://127.0.0.1/images/upload/2018-07-02/7daac2d4-1aa3-4930-aed3-409c53bfca85.jpeg',1,'2018-07-01 16:14:43','6775c0f33e6fb1541097436d77e48301',0,NULL,'Emma','emma@gmail.com'),(2,'http://127.0.0.1/images/upload/default.png',1,'2018-07-01 16:15:23','5a74fb2653af5de63af2700e4f8b3b6a',0,NULL,'Larissa','larissa@qq.com'),(3,'http://127.0.0.1/images/upload/2018-07-02/62c504c7-cf4e-4839-900c-b338af0e2603.jpeg',1,'2018-07-01 16:16:01','a297cb61e1266613ca549984adcc6e24',0,NULL,'Edith','edith@163.com'),(4,'http://127.0.0.1/images/upload/default.png',1,'2018-07-01 16:16:36','0905e5621a566425d60ce98661c03534',0,NULL,'Sophia','sophia@sina.com'),(5,'http://127.0.0.1/images/upload/default.png',1,'2018-07-01 16:17:25','5ee67d2d9f67e54d3c4d2247f9e62e3e',0,NULL,'Wilson','wilson@qq.com'),(6,'http://127.0.0.1/images/upload/default.png',1,'2018-07-01 16:17:57','e9192f0bd6a5e39d97b99b9cd6a4dfe8',0,NULL,'Carl','carl@sina.com'),(7,'http://127.0.0.1/images/upload/default.png',1,'2018-07-01 16:18:41','25b8789b26f6f29b5eeb46c91099e2a9',0,NULL,'Warren','warren@qq.com'),(8,'http://127.0.0.1/images/upload/default.png',1,'2018-07-01 16:19:16','7def9d3c2bc596b6a9d511a42c9f58c4',0,NULL,'Kevin','kevin@qq.com'),(9,'http://127.0.0.1/images/upload/default.png',1,'2018-07-01 16:20:00','ca219186fa3221ac7cd9db99965d70fa',0,NULL,'Kelly','kelly@qq.com'),(10,'http://127.0.0.1/images/upload/default.png',0,'2018-07-01 16:20:30','ecb965ebbd45df673ffd9df5a8294301',0,NULL,'Easter','easter@163.com'),(11,'http://127.0.0.1/images/upload/default.png',1,'2018-07-01 16:21:09','cdb2db9c8bd70c014be0ed36dc05a363',0,NULL,'Addison','addison@sina.com'),(12,'http://127.0.0.1/images/upload/default.png',1,'2018-07-01 16:21:43','4008a360bf5f78208782b494fedee39d',0,NULL,'Fred','fred@qq.com'),(13,'http://127.0.0.1/images/upload/default.png',1,'2018-07-01 16:22:49','306f91c2142b3ed4970816e7e82a42ea',0,NULL,'Buster','buster@qq.com'),(14,'http://127.0.0.1/images/upload/default.png',1,'2018-07-01 16:23:48','762fe56be054d72e050127331c711b80',0,NULL,'Isla','isla@qq.com'),(15,'http://127.0.0.1/images/upload/default.png',1,'2018-07-01 16:24:37','629cef58d01fb7df9b14c3dc1d1b67fa',0,NULL,'Isabella','isabella@qq.com'),(16,'http://127.0.0.1/images/upload/default.png',1,'2018-07-01 16:25:34','919eb28881465ed92a5614bbb24dcd1c',0,NULL,'Khaleesi','khaleesi@qq.com'),(17,'http://127.0.0.1/images/upload/default.png',1,'2018-07-01 16:26:11','73bdd634722613283617bcb6d303c03d',0,NULL,'Bryson','bryson@qq.com'),(18,'http://127.0.0.1/images/upload/default.png',1,'2018-07-01 16:28:19','ec4ad7d6fe5ed488332e96c46879914c',0,NULL,'Andy','andy@qq.com'),(19,'http://127.0.0.1/images/upload/default.png',1,'2018-07-01 16:30:32','9ebd84142dcf385633782a0a37ff74b8',0,NULL,'Solomon','solomon@sina.com'),(20,'http://127.0.0.1/images/upload/2018-07-02/7b773044-264b-4525-8d69-58ef5e98282d.jpeg',1,'2018-07-01 16:31:11','b5c9433bd693c6f191f4edab1167cb9c',0,'哥只是个传说','Hello','joyce@163.com'),(94,'http://127.0.0.1/images/upload/2018-07-03/fd52ca32-8130-4e5c-885a-a9391c19060b.png',1,'2018-07-03 15:55:00','e10adc3949ba59abbe56e057f20f883e',0,NULL,'xyk','xyk@163.com'),(95,'http://127.0.0.1/images/upload/default.png',1,'2018-07-03 16:17:46','c33367701511b4f6020ec61ded352059',0,NULL,'abc','abc@163.com');
/*!40000 ALTER TABLE `cczu_forum_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-04 10:06:26
