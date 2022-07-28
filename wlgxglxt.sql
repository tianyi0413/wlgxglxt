# Host: 127.0.0.1  (Version 5.5.15)
# Date: 2021-11-26 13:55:59
# Generator: MySQL-Front 6.0  (Build 2.20)


#
# Structure for table "admin"
#
create database wlgxglxt;
use wlgxglxt;
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(60) DEFAULT NULL,
  `upwd` varchar(60) DEFAULT NULL,
  `name` varchar(60) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `utype` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

#
# Data for table "admin"
#

INSERT INTO `admin` VALUES (1,'admin','123456','王敏','18988888938','管理员'),(3,'xs01','123456','李强','15578787787','销售'),(4,'cg01','123456','张东','18398988989','采购');

#
# Structure for table "catelog"
#

DROP TABLE IF EXISTS `catelog`;
CREATE TABLE `catelog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

#
# Data for table "catelog"
#

/*!40000 ALTER TABLE `catelog` DISABLE KEYS */;
INSERT INTO `catelog` VALUES (1,'农用化学品'),(2,'试剂'),(3,'着色剂');
/*!40000 ALTER TABLE `catelog` ENABLE KEYS */;

#
# Structure for table "company"
#

DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT '',
  `lianxiren` varchar(150) DEFAULT NULL,
  `tel` varchar(150) DEFAULT NULL,
  `address` varchar(200) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

#
# Data for table "company"
#

INSERT INTO `company` VALUES (1,'鹏发化工原料有限公司','张明','18448751554','北京市朝阳区紫光大厦'),(2,'天悦化工有限公司','刘志','18754815481','成都市');

#
# Structure for table "goods"
#

DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bianhao` varchar(150) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `companyid` int(11) DEFAULT NULL,
  `shoujia` varchar(60) DEFAULT NULL,
  `note` text,
  `type` varchar(150) DEFAULT NULL,
  `kcnum` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

#
# Data for table "goods"
#

INSERT INTO `goods` VALUES (1,'1001','二甲基亚砜',1,'50','二甲基亚砜','农用化学品',680),(2,'1002','对羟基苯甲酸丁酯',1,'100','对羟基苯甲酸丁酯','农用化学品',1000),(3,'1003','白桦脂醛',1,'630','白桦脂醛','试剂',9180),(4,'1004','刺甘草查尔酮',2,'750','刺甘草查尔酮','试剂',200),(5,'1005','结晶紫内酯',1,'200','结晶紫内酯','着色剂',300);

#
# Structure for table "jinhuo"
#

DROP TABLE IF EXISTS `jinhuo`;
CREATE TABLE `jinhuo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodsid` int(11) DEFAULT NULL,
  `companyid` int(11) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `danjia` int(11) DEFAULT NULL,
  `cdate` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

#
# Data for table "jinhuo"
#

INSERT INTO `jinhuo` VALUES (1,1,1,690,20,'2021-11-26'),(2,2,1,1000,20,'2021-11-25'),(3,3,1,9000,10,'2021-11-25'),(4,4,2,200,20,'2021-10-25'),(5,5,1,300,20,'2021-10-25'),(6,3,1,200,50,'2021-11-26');

#
# Structure for table "kucun"
#

DROP TABLE IF EXISTS `kucun`;
CREATE TABLE `kucun` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodsid` int(11) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

#
# Data for table "kucun"
#


#
# Structure for table "torder"
#

DROP TABLE IF EXISTS `torder`;
CREATE TABLE `torder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `bianhao` varchar(60) DEFAULT NULL,
  `goodsid` int(11) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `danjia` int(11) DEFAULT NULL,
  `cdate` varchar(60) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `tuihuodan` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

#
# Data for table "torder"
#

INSERT INTO `torder` VALUES (1,3,'20211126113447',1,5,50,'2021-10-25',1,'20211126113742'),(2,5,'20211126113610',1,10,50,'2021-10-25',1,NULL),(3,3,'20211126113742',1,5,50,'2021-11-26',0,NULL),(4,10,'20211126134829',3,20,630,'2021-11-26',1,NULL);

#
# Structure for table "user"
#

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `huiyuanhao` varchar(150) DEFAULT NULL,
  `name` varchar(60) DEFAULT NULL,
  `tel` varchar(60) DEFAULT NULL,
  `address` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

#
# Data for table "user"
#

INSERT INTO `user` VALUES (3,'HY202104010015211','刘明明','18702002000',''),(4,'HY20210401001522','李方南','15585858885',' 绿地大厦'),(5,'HY20210401001523','张红','15284578854',''),(9,'HY20210412170831','刘民建','18187168252',NULL),(10,'HY20210223213855','张大同','15524333343','101号');
