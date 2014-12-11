/*
SQLyog v10.2 
MySQL - 5.0.45-community-nt : Database - cmsdb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `TbcConTemp` */

DROP TABLE IF EXISTS `TbcConTemp`;

CREATE TABLE `TbcConTemp` (
  `id` char(20) collate utf8_unicode_ci NOT NULL default '',
  `type` varchar(50) collate utf8_unicode_ci default NULL,
  `title` varchar(200) collate utf8_unicode_ci default NULL,
  `text` text collate utf8_unicode_ci,
  `image` varchar(200) collate utf8_unicode_ci default NULL,
  `createTime` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '时间',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='采集内容';

/*Data for the table `TbcConTemp` */

insert  into `TbcConTemp`(`id`,`type`,`title`,`text`,`image`,`createTime`) values ('1305160927246077795','1','1111111111111111111','1','1','2013-08-01 10:39:52');

/*Table structure for table `TbcContent` */

DROP TABLE IF EXISTS `TbcContent`;

CREATE TABLE `TbcContent` (
  `id` char(20) collate utf8_unicode_ci NOT NULL COMMENT '主键',
  `menuId` char(20) collate utf8_unicode_ci default NULL COMMENT '关联导航',
  `title` varchar(200) collate utf8_unicode_ci default NULL COMMENT '标题',
  `tags` varchar(100) collate utf8_unicode_ci default NULL COMMENT '标签',
  `content` text collate utf8_unicode_ci COMMENT '内容',
  `status` int(1) default '0' COMMENT '状态',
  `orderByNumber` int(8) default '0' COMMENT '排序',
  `createTime` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='文章表';

/*Data for the table `TbcContent` */

insert  into `TbcContent`(`id`,`menuId`,`title`,`tags`,`content`,`status`,`orderByNumber`,`createTime`) values ('13080110400110813978','13080110400180278177','title5','tags','jeetemp',0,5,'2013-08-01 10:40:01'),('13080110400111171380','13080110400180278177','title3','tags','jeetemp',0,3,'2013-08-01 10:40:01'),('13080110400112679766','13080110400180278177','title15','tags','jeetemp',0,15,'2013-08-01 10:40:01'),('13080110400113106127','13080110400180278177','title9','tags','jeetemp',0,9,'2013-08-01 10:40:01'),('13080110400116052992','13080110400180278177','title16','tags','jeetemp',0,16,'2013-08-01 10:40:01'),('13080110400116675353','13080110400180278177','title24','tags','jeetemp',0,24,'2013-08-01 10:40:01'),('13080110400119172864','13080110400180278177','title17','tags','jeetemp',0,17,'2013-08-01 10:40:01'),('13080110400132899160','13080110400180278177','title4','tags','jeetemp',0,4,'2013-08-01 10:40:01'),('13080110400136399644','13080110400180278177','title21','tags','jeetemp',0,21,'2013-08-01 10:40:01'),('13080110400139141579','13080110400180278177','title12','tags','jeetemp',0,12,'2013-08-01 10:40:01'),('13080110400141987194','13080110400180278177','title10','tags','jeetemp',0,10,'2013-08-01 10:40:01'),('13080110400146074601','13080110400180278177','title26','tags','jeetemp',0,26,'2013-08-01 10:40:01'),('13080110400150062965','13080110400180278177','title23','tags','jeetemp',0,23,'2013-08-01 10:40:01'),('13080110400153919320','13080110400180278177','title14','tags','jeetemp',0,14,'2013-08-01 10:40:01'),('13080110400156183973','13080110400180278177','title8','tags','jeetemp',0,8,'2013-08-01 10:40:01'),('13080110400161192206','13080110400180278177','title2','tags','jeetemp',0,2,'2013-08-01 10:40:01'),('13080110400161964062','13080110400180278177','title13','tags','jeetemp',0,13,'2013-08-01 10:40:01'),('13080110400162070074','13080110400180278177','title1','tags','jeetemp',0,1,'2013-08-01 10:40:01'),('13080110400171129955','13080110400180278177','title0','tags','jeetemp',0,0,'2013-08-01 10:40:01'),('13080110400171566253','13080110400180278177','title18','tags','jeetemp',0,18,'2013-08-01 10:40:01'),('13080110400172257627','13080110400180278177','title19','tags','jeetemp',0,19,'2013-08-01 10:40:01'),('13080110400174239676','13080110400180278177','title27','tags','jeetemp',0,27,'2013-08-01 10:40:01'),('13080110400180676417','13080110400180278177','title22','tags','jeetemp',0,22,'2013-08-01 10:40:01'),('13080110400181194272','13080110400180278177','title20','tags','jeetemp',0,20,'2013-08-01 10:40:01'),('13080110400181702865','13080110400180278177','title6','tags','jeetemp',0,6,'2013-08-01 10:40:01'),('13080110400183862152','13080110400180278177','title11','tags','jeetemp',0,11,'2013-08-01 10:40:01'),('13080110400185573720','13080110400180278177','title28','tags','jeetemp',0,28,'2013-08-01 10:40:01'),('13080110400190063341','13080110400180278177','title25','tags','jeetemp',0,25,'2013-08-01 10:40:01'),('13080110400197117890','13080110400180278177','title7','tags','jeetemp',0,7,'2013-08-01 10:40:01'),('13080110400212860971','13080110400180278177','title39','tags','jeetemp',0,39,'2013-08-01 10:40:02'),('13080110400215658579','13080110400180278177','title52','tags','jeetemp',0,52,'2013-08-01 10:40:02'),('13080110400216112617','13080110400180278177','title55','tags','jeetemp',0,55,'2013-08-01 10:40:02'),('13080110400216846036','13080110400180278177','title54','tags','jeetemp',0,54,'2013-08-01 10:40:02'),('13080110400226973084','13080110400180278177','title29','tags','jeetemp',0,29,'2013-08-01 10:40:02'),('13080110400227304186','13080110400180278177','title62','tags','jeetemp',0,62,'2013-08-01 10:40:02'),('13080110400227366528','13080110400180278177','title31','tags','jeetemp',0,31,'2013-08-01 10:40:02'),('13080110400227873851','13080110400180278177','title46','tags','jeetemp',0,46,'2013-08-01 10:40:02'),('13080110400232548144','13080110400180278177','title44','tags','jeetemp',0,44,'2013-08-01 10:40:02'),('13080110400233977130','13080110400180278177','title65','tags','jeetemp',0,65,'2013-08-01 10:40:02'),('13080110400236976170','13080110400180278177','title35','tags','jeetemp',0,35,'2013-08-01 10:40:02'),('13080110400237880954','13080110400180278177','title43','tags','jeetemp',0,43,'2013-08-01 10:40:02'),('13080110400238161940','13080110400180278177','title36','tags','jeetemp',0,36,'2013-08-01 10:40:02'),('13080110400240318602','13080110400180278177','title61','tags','jeetemp',0,61,'2013-08-01 10:40:02'),('13080110400245395487','13080110400180278177','title37','tags','jeetemp',0,37,'2013-08-01 10:40:02'),('13080110400246908160','13080110400180278177','title56','tags','jeetemp',0,56,'2013-08-01 10:40:02'),('13080110400247241313','13080110400180278177','title47','tags','jeetemp',0,47,'2013-08-01 10:40:02'),('13080110400254274858','13080110400180278177','title69','tags','jeetemp',0,69,'2013-08-01 10:40:02'),('13080110400256895232','13080110400180278177','title32','tags','jeetemp',0,32,'2013-08-01 10:40:02'),('13080110400261021205','13080110400180278177','title51','tags','jeetemp',0,51,'2013-08-01 10:40:02'),('13080110400262723805','13080110400180278177','title45','tags','jeetemp',0,45,'2013-08-01 10:40:02'),('13080110400262755115','13080110400180278177','title50','tags','jeetemp',0,50,'2013-08-01 10:40:02'),('13080110400264586622','13080110400180278177','title64','tags','jeetemp',0,64,'2013-08-01 10:40:02'),('13080110400266667512','13080110400180278177','title59','tags','jeetemp',0,59,'2013-08-01 10:40:02'),('13080110400268492189','13080110400180278177','title34','tags','jeetemp',0,34,'2013-08-01 10:40:02'),('13080110400268611571','13080110400180278177','title42','tags','jeetemp',0,42,'2013-08-01 10:40:02'),('13080110400273801460','13080110400180278177','title68','tags','jeetemp',0,68,'2013-08-01 10:40:02'),('13080110400274692439','13080110400180278177','title38','tags','jeetemp',0,38,'2013-08-01 10:40:02'),('13080110400274731343','13080110400180278177','title49','tags','jeetemp',0,49,'2013-08-01 10:40:02'),('13080110400274756847','13080110400180278177','title40','tags','jeetemp',0,40,'2013-08-01 10:40:02'),('13080110400276653401','13080110400180278177','title63','tags','jeetemp',0,63,'2013-08-01 10:40:02'),('13080110400277260222','13080110400180278177','title30','tags','jeetemp',0,30,'2013-08-01 10:40:02'),('13080110400279094764','13080110400180278177','title66','tags','jeetemp',0,66,'2013-08-01 10:40:02'),('13080110400282922291','13080110400180278177','title53','tags','jeetemp',0,53,'2013-08-01 10:40:02'),('13080110400288143729','13080110400180278177','title41','tags','jeetemp',0,41,'2013-08-01 10:40:02'),('13080110400291770491','13080110400180278177','title48','tags','jeetemp',0,48,'2013-08-01 10:40:02'),('13080110400292266076','13080110400180278177','title57','tags','jeetemp',0,57,'2013-08-01 10:40:02'),('13080110400293114424','13080110400180278177','title58','tags','jeetemp',0,58,'2013-08-01 10:40:02'),('13080110400294181950','13080110400180278177','title67','tags','jeetemp',0,67,'2013-08-01 10:40:02'),('13080110400298682420','13080110400180278177','title60','tags','jeetemp',0,60,'2013-08-01 10:40:02'),('13080110400299281551','13080110400180278177','title33','tags','jeetemp',0,33,'2013-08-01 10:40:02'),('13080110400310024540','13080110400180278177','title94','tags','jeetemp',0,94,'2013-08-01 10:40:03'),('13080110400311583021','13080110400180278177','title84','tags','jeetemp',0,84,'2013-08-01 10:40:03'),('13080110400311955446','13080110400180278177','title98','tags','jeetemp',0,98,'2013-08-01 10:40:03'),('13080110400312477978','13080110400180278177','title83','tags','jeetemp',0,83,'2013-08-01 10:40:03'),('13080110400313049542','13080110400180278177','title92','tags','jeetemp',0,92,'2013-08-01 10:40:03'),('13080110400315547300','13080110400180278177','title74','tags','jeetemp',0,74,'2013-08-01 10:40:03'),('13080110400315673794','13080110400180278177','title90','tags','jeetemp',0,90,'2013-08-01 10:40:03'),('13080110400316427337','13080110400180278177','title99','tags','jeetemp',0,99,'2013-08-01 10:40:03'),('13080110400326595006','13080110400180278177','title81','tags','jeetemp',0,81,'2013-08-01 10:40:03'),('13080110400332431824','13080110400180278177','title86','tags','jeetemp',0,86,'2013-08-01 10:40:03'),('13080110400333395730','13080110400180278177','title72','tags','jeetemp',0,72,'2013-08-01 10:40:03'),('13080110400336291619','13080110400180278177','title97','tags','jeetemp',0,97,'2013-08-01 10:40:03'),('13080110400339731471','13080110400180278177','title76','tags','jeetemp',0,76,'2013-08-01 10:40:03'),('13080110400345122432','13080110400180278177','title87','tags','jeetemp',0,87,'2013-08-01 10:40:03'),('13080110400348993842','13080110400180278177','title70','tags','jeetemp',0,70,'2013-08-01 10:40:03'),('13080110400355043882','13080110400180278177','title96','tags','jeetemp',0,96,'2013-08-01 10:40:03'),('13080110400361572270','13080110400180278177','title91','tags','jeetemp',0,91,'2013-08-01 10:40:03'),('13080110400363779652','13080110400180278177','title88','tags','jeetemp',0,88,'2013-08-01 10:40:03'),('13080110400366894005','13080110400180278177','title77','tags','jeetemp',0,77,'2013-08-01 10:40:03'),('13080110400370939474','13080110400180278177','title75','tags','jeetemp',0,75,'2013-08-01 10:40:03'),('13080110400372081738','13080110400180278177','title85','tags','jeetemp',0,85,'2013-08-01 10:40:03'),('13080110400374031134','13080110400180278177','title73','tags','jeetemp',0,73,'2013-08-01 10:40:03'),('13080110400374180910','13080110400180278177','title95','tags','jeetemp',0,95,'2013-08-01 10:40:03'),('13080110400375271970','13080110400180278177','title82','tags','jeetemp',0,82,'2013-08-01 10:40:03'),('13080110400377602051','13080110400180278177','title89','tags','jeetemp',0,89,'2013-08-01 10:40:03'),('13080110400383124343','13080110400180278177','title78','tags','jeetemp',0,78,'2013-08-01 10:40:03'),('13080110400384902213','13080110400180278177','title71','tags','jeetemp',0,71,'2013-08-01 10:40:03'),('13080110400392612695','13080110400180278177','title79','tags','jeetemp',0,79,'2013-08-01 10:40:03'),('13080110400394829763','13080110400180278177','title80','tags','jeetemp',0,80,'2013-08-01 10:40:03'),('13080110400396784343','13080110400180278177','title93','tags','jeetemp',0,93,'2013-08-01 10:40:03');

/*Table structure for table `TbcListTemp` */

DROP TABLE IF EXISTS `TbcListTemp`;

CREATE TABLE `TbcListTemp` (
  `id` char(20) collate utf8_unicode_ci NOT NULL,
  `href` varchar(200) collate utf8_unicode_ci default NULL,
  `type` varchar(200) collate utf8_unicode_ci default NULL,
  `text` varchar(500) collate utf8_unicode_ci default NULL,
  `createTime` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '时间',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='采集列表';

/*Data for the table `TbcListTemp` */

/*Table structure for table `TbcMenu` */

DROP TABLE IF EXISTS `TbcMenu`;

CREATE TABLE `TbcMenu` (
  `id` char(20) collate utf8_unicode_ci NOT NULL COMMENT '唯一',
  `parentId` char(20) collate utf8_unicode_ci default NULL COMMENT '父节点',
  `name` varchar(50) collate utf8_unicode_ci default NULL COMMENT '名称',
  `isMenu` int(1) default '0' COMMENT '菜单类型',
  `type` int(1) default '0' COMMENT '系统类型',
  `sortNumber` int(9) default '0' COMMENT '排序',
  `url` varchar(200) collate utf8_unicode_ci default NULL COMMENT '地址',
  `button` varchar(500) collate utf8_unicode_ci default NULL COMMENT '按钮',
  `status` int(9) default '0' COMMENT '状态',
  `createTime` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '时间',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='主页导航';

/*Data for the table `TbcMenu` */

insert  into `TbcMenu`(`id`,`parentId`,`name`,`isMenu`,`type`,`sortNumber`,`url`,`button`,`status`,`createTime`) values ('13080110400112249549',NULL,'生成',1,2,2,'sc/','',0,'2013-08-01 10:40:01'),('13080110400123222695',NULL,'关于',1,5,5,'about/','',0,'2013-08-01 10:40:01'),('13080110400124881528',NULL,'下载',1,3,3,'download.html','',0,'2013-08-01 10:40:01'),('13080110400148662654',NULL,'演示',1,1,1,'admin/login.html','',0,'2013-08-01 10:40:01'),('13080110400148966680',NULL,'菜单',1,0,5,'about/','',0,'2013-08-01 10:40:01'),('13080110400161984019','13080110400148966680','菜单2',1,0,5,'about/','',0,'2013-08-01 10:40:01'),('13080110400175818670','13080110400148966680','菜单1',1,0,5,'about/','',0,'2013-08-01 10:40:01'),('13080110400178754832',NULL,'帮助',1,4,4,'help/','',0,'2013-08-01 10:40:01'),('13080110400180278177',NULL,'首页',1,0,0,'index.html','',0,'2013-08-01 10:40:01');

/*Table structure for table `TbcMenuHelp` */

DROP TABLE IF EXISTS `TbcMenuHelp`;

CREATE TABLE `TbcMenuHelp` (
  `id` char(20) collate utf8_unicode_ci NOT NULL COMMENT '唯一',
  `parentId` char(20) collate utf8_unicode_ci default NULL COMMENT '父节点',
  `name` varchar(50) collate utf8_unicode_ci default NULL COMMENT '名称',
  `title` varchar(200) collate utf8_unicode_ci default NULL COMMENT '标题',
  `tags` varchar(100) collate utf8_unicode_ci default NULL COMMENT '标签',
  `content` text collate utf8_unicode_ci COMMENT '内容',
  `isMenu` int(1) default '0' COMMENT '菜单类型',
  `type` int(1) default '0' COMMENT '系统类型',
  `sortNumber` int(9) default '0' COMMENT '排序',
  `url` varchar(200) collate utf8_unicode_ci default NULL COMMENT '地址',
  `button` varchar(500) collate utf8_unicode_ci default NULL COMMENT '按钮',
  `status` int(9) default '0' COMMENT '状态',
  `createTime` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '时间',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='帮助表';

/*Data for the table `TbcMenuHelp` */

insert  into `TbcMenuHelp`(`id`,`parentId`,`name`,`title`,`tags`,`content`,`isMenu`,`type`,`sortNumber`,`url`,`button`,`status`,`createTime`) values ('13080110395429123439',NULL,'数据表统计',NULL,NULL,NULL,0,0,6,NULL,NULL,0,'2013-08-01 10:39:55'),('13080110395452058362',NULL,'系统管理',NULL,NULL,NULL,0,0,1,NULL,NULL,0,'2013-08-01 10:39:55'),('13080110395464455251',NULL,'源码生成',NULL,NULL,NULL,0,0,4,NULL,NULL,0,'2013-08-01 10:39:55'),('13080110395465301959',NULL,'数据表管理',NULL,NULL,NULL,0,0,5,NULL,NULL,0,'2013-08-01 10:39:55'),('13080110395467025147',NULL,'监控管理',NULL,NULL,NULL,0,0,2,NULL,NULL,0,'2013-08-01 10:39:55'),('13080110395482377948',NULL,'采集管理',NULL,NULL,NULL,0,0,7,NULL,NULL,0,'2013-08-01 10:39:55'),('13080110395496481672',NULL,'功能管理',NULL,NULL,NULL,0,0,8,NULL,NULL,0,'2013-08-01 10:39:55'),('13080110395579544622',NULL,'源码编辑',NULL,NULL,NULL,0,1,3,'admin/asyJson.html',NULL,0,'2013-08-01 10:39:55'),('13080110395615659919','13080110395429123439','采集内容统计',NULL,NULL,NULL,0,0,0,'admin/TbcConTemp/charts.html',NULL,0,'2013-08-01 10:39:56'),('13080110395616926362','13080110395429123439','文章表统计',NULL,NULL,NULL,0,0,0,'admin/TbcContent/charts.html',NULL,0,'2013-08-01 10:39:56'),('13080110395659138846','13080110395465301959','文章表',NULL,NULL,NULL,0,0,0,'admin/TbcContent/index.html',NULL,0,'2013-08-01 10:39:56'),('13080110395673989411','13080110395429123439','采集列表统计',NULL,NULL,NULL,0,0,0,'admin/TbcListTemp/charts.html',NULL,0,'2013-08-01 10:39:56'),('13080110395691096836','13080110395465301959','采集内容',NULL,NULL,NULL,0,0,0,'admin/TbcConTemp/index.html',NULL,0,'2013-08-01 10:39:56'),('13080110395699905356','13080110395465301959','采集列表',NULL,NULL,NULL,0,0,0,'admin/TbcListTemp/index.html',NULL,0,'2013-08-01 10:39:56'),('13080110395718765617','13080110395429123439','主页导航统计',NULL,NULL,NULL,0,0,0,'admin/TbcMenu/charts.html',NULL,0,'2013-08-01 10:39:57'),('13080110395756943025','13080110395429123439','采集临时表统计',NULL,NULL,NULL,0,0,0,'admin/TbcTemp/charts.html',NULL,0,'2013-08-01 10:39:57'),('13080110395765137191','13080110395465301959','采集临时表',NULL,NULL,NULL,0,0,0,'admin/TbcTemp/index.html',NULL,0,'2013-08-01 10:39:57'),('13080110395784163693','13080110395429123439','InnoDB free: 9216 kB统计',NULL,NULL,NULL,0,0,0,'admin/TbsA/charts.html',NULL,0,'2013-08-01 10:39:57'),('13080110395785917970','13080110395465301959','帮助表',NULL,NULL,NULL,0,0,0,'admin/TbcMenuHelp/index.html',NULL,0,'2013-08-01 10:39:57'),('13080110395789442168','13080110395429123439','帮助表统计',NULL,NULL,NULL,0,0,0,'admin/TbcMenuHelp/charts.html',NULL,0,'2013-08-01 10:39:57'),('13080110395793005827','13080110395465301959','InnoDB free: 9216 kB',NULL,NULL,NULL,0,0,0,'admin/TbsA/index.html',NULL,0,'2013-08-01 10:39:57'),('13080110395796996649','13080110395465301959','主页导航',NULL,NULL,NULL,0,0,0,'admin/TbcMenu/index.html',NULL,0,'2013-08-01 10:39:57'),('13080110395810477441','13080110395429123439','InnoDB free: 9216 kB统计',NULL,NULL,NULL,0,0,0,'admin/TbsB/charts.html',NULL,0,'2013-08-01 10:39:58'),('13080110395812154875','13080110395482377948','数据采集',NULL,NULL,NULL,0,0,0,'admin/TbsHttpRequest/index.html',NULL,0,'2013-08-01 10:39:58'),('13080110395815677705','13080110395465301959','浏览器表',NULL,NULL,NULL,0,0,0,'admin/TbsBrowserName/index.html',NULL,0,'2013-08-01 10:39:58'),('13080110395824005580','13080110395429123439','InnoDB free: 9216 kB统计',NULL,NULL,NULL,0,0,0,'admin/TbsC/charts.html',NULL,0,'2013-08-01 10:39:58'),('13080110395838303908','13080110395429123439','数据采集统计',NULL,NULL,NULL,0,0,0,'admin/TbsHttpRequest/charts.html',NULL,0,'2013-08-01 10:39:58'),('13080110395868854493','13080110395465301959','InnoDB free: 9216 kB',NULL,NULL,NULL,0,0,0,'admin/TbsB/index.html',NULL,0,'2013-08-01 10:39:58'),('13080110395877178845','13080110395429123439','浏览器表统计',NULL,NULL,NULL,0,0,0,'admin/TbsBrowserName/charts.html',NULL,0,'2013-08-01 10:39:58'),('13080110395889145398','13080110395465301959','InnoDB free: 9216 kB',NULL,NULL,NULL,0,0,0,'admin/TbsC/index.html',NULL,0,'2013-08-01 10:39:58'),('13080110395916934046','13080110395467025147','登录日志',NULL,NULL,NULL,0,0,0,'admin/TbsLoginLog/index.html',NULL,0,'2013-08-01 10:39:59'),('13080110395941081847','13080110395429123439','角色与资源关联表统计',NULL,NULL,NULL,0,0,0,'admin/TbsRoleMenu/charts.html',NULL,0,'2013-08-01 10:39:59'),('13080110395946934620','13080110395465301959','角色与资源关联表',NULL,NULL,NULL,0,0,0,'admin/TbsRoleMenu/index.html',NULL,0,'2013-08-01 10:39:59'),('13080110395954374841','13080110395429123439','权限角色统计',NULL,NULL,NULL,0,0,0,'admin/TbsRole/charts.html',NULL,0,'2013-08-01 10:39:59'),('13080110395958402126','13080110395452058362','权限角色',NULL,NULL,NULL,0,0,0,'admin/TbsRole/index.html',NULL,0,'2013-08-01 10:39:59'),('13080110395960103563','13080110395452058362','菜单导航',NULL,NULL,NULL,0,0,0,'admin/TbsMenu/index.html',NULL,0,'2013-08-01 10:39:59'),('13080110395966836731','13080110395429123439','菜单导航统计',NULL,NULL,NULL,0,0,0,'admin/TbsMenu/charts.html',NULL,0,'2013-08-01 10:39:59'),('13080110395984670288','13080110395429123439','登录日志统计',NULL,NULL,NULL,0,0,0,'admin/TbsLoginLog/charts.html',NULL,0,'2013-08-01 10:39:59'),('13080110400016426986','13080110395465301959','用户与角色关联表',NULL,NULL,NULL,0,0,0,'admin/TbsRoleUser/index.html',NULL,0,'2013-08-01 10:40:00'),('13080110400027652083','13080110395429123439','系统用户统计',NULL,NULL,NULL,0,0,0,'admin/TbsUser/charts.html',NULL,0,'2013-08-01 10:40:00'),('13080110400070750625','13080110395452058362','系统用户',NULL,NULL,NULL,0,0,0,'admin/TbsUser/index.html',NULL,0,'2013-08-01 10:40:00'),('13080110400091067125','13080110395429123439','用户与角色关联表统计',NULL,NULL,NULL,0,0,0,'admin/TbsRoleUser/charts.html',NULL,0,'2013-08-01 10:40:00');

/*Table structure for table `TbcTemp` */

DROP TABLE IF EXISTS `TbcTemp`;

CREATE TABLE `TbcTemp` (
  `id` char(20) collate utf8_unicode_ci NOT NULL COMMENT '序列',
  `href` varchar(100) collate utf8_unicode_ci default NULL COMMENT '地址',
  `text` varchar(50) collate utf8_unicode_ci default NULL COMMENT '名称',
  `createTime` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '时间',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='采集临时表';

/*Data for the table `TbcTemp` */

/*Table structure for table `TbsA` */

DROP TABLE IF EXISTS `TbsA`;

CREATE TABLE `TbsA` (
  `id` char(20) collate utf8_unicode_ci NOT NULL COMMENT '主键',
  `name` varchar(50) collate utf8_unicode_ci default NULL COMMENT '名称',
  `createTime` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `TbsA` */

insert  into `TbsA`(`id`,`name`,`createTime`) values ('1','a1','2013-07-30 21:09:16'),('2','a2','2013-07-30 21:09:21'),('3','a3','2013-07-30 21:09:25'),('4','a4','2013-07-30 21:09:31');

/*Table structure for table `TbsB` */

DROP TABLE IF EXISTS `TbsB`;

CREATE TABLE `TbsB` (
  `id` char(20) collate utf8_unicode_ci NOT NULL COMMENT '主键',
  `createTime` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '创建时间',
  `name` varchar(200) collate utf8_unicode_ci default NULL COMMENT '名称',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `TbsB` */

insert  into `TbsB`(`id`,`createTime`,`name`) values ('1','2013-07-30 21:09:46','b1'),('2','2013-07-30 21:10:06','b2'),('3','2013-07-30 21:10:10','b3'),('4','2013-07-30 21:10:14','b4'),('5','2013-07-30 21:10:19','b5');

/*Table structure for table `TbsBrowserName` */

DROP TABLE IF EXISTS `TbsBrowserName`;

CREATE TABLE `TbsBrowserName` (
  `id` char(20) collate utf8_unicode_ci NOT NULL COMMENT '主键',
  `browser` varchar(50) collate utf8_unicode_ci default NULL COMMENT '搜索',
  `nickname` varchar(20) collate utf8_unicode_ci default NULL COMMENT '昵称',
  `type` int(1) default '0' COMMENT '类型',
  `createTime` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '时间',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='浏览器表';

/*Data for the table `TbsBrowserName` */

insert  into `TbsBrowserName`(`id`,`browser`,`nickname`,`type`,`createTime`) values ('13080110400012609002','MSIE 7','IE7',0,'2013-08-01 10:40:00'),('13080110400028012034','Chrome','谷歌',0,'2013-08-01 10:40:00'),('13080110400031115769','Firefox','火狐',0,'2013-08-01 10:40:00'),('13080110400047293421','MSIE 10','IE10',0,'2013-08-01 10:40:00'),('13080110400059763946','MSIE 9','IE9',0,'2013-08-01 10:40:00'),('13080110400092717422','MSIE 8','IE8',0,'2013-08-01 10:40:00'),('13080110400093489970','MSIE 6','IE6',0,'2013-08-01 10:40:00'),('13080110400144830730','Opera','Opera',0,'2013-08-01 10:40:01'),('13080110400145789811','Safari','苹果',0,'2013-08-01 10:40:01');

/*Table structure for table `TbsC` */

DROP TABLE IF EXISTS `TbsC`;

CREATE TABLE `TbsC` (
  `id` char(20) collate utf8_unicode_ci default NULL COMMENT '主键',
  `aId` char(20) collate utf8_unicode_ci default NULL COMMENT '关联A表',
  `bId` char(20) collate utf8_unicode_ci default NULL COMMENT '关联B表',
  `name` varchar(50) collate utf8_unicode_ci default NULL COMMENT '名称',
  `createTime` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `TbsC` */

insert  into `TbsC`(`id`,`aId`,`bId`,`name`,`createTime`) values ('1','a1','b1','c1','2013-07-30 21:10:47'),('2','a2','b2','c2','2013-07-30 21:10:57'),('3','a3','b3','c3','2013-07-30 21:11:05'),('4','a4','b4','c4','2013-07-30 21:11:17');

/*Table structure for table `TbsHttpRequest` */

DROP TABLE IF EXISTS `TbsHttpRequest`;

CREATE TABLE `TbsHttpRequest` (
  `id` char(20) collate utf8_unicode_ci NOT NULL COMMENT '序列号',
  `name` varchar(20) collate utf8_unicode_ci default NULL COMMENT '名称',
  `header` varchar(200) collate utf8_unicode_ci default NULL COMMENT '请求头信息(JSON格式)',
  `firstPage` varchar(60) collate utf8_unicode_ci default NULL COMMENT '所有分类地址',
  `encoding` varchar(10) collate utf8_unicode_ci default NULL COMMENT '编码',
  `listName` varchar(200) collate utf8_unicode_ci default NULL COMMENT '列表过滤',
  `regexs` varchar(500) collate utf8_unicode_ci default NULL COMMENT 'jquery表达式',
  `arrtSplit` varchar(100) collate utf8_unicode_ci default NULL COMMENT '属性',
  `inserts` varchar(300) collate utf8_unicode_ci default NULL COMMENT '入库语句',
  `listUrlRegex` varchar(20) collate utf8_unicode_ci default NULL COMMENT '请求属性',
  `listUrlTest` int(9) default '1' COMMENT '测试行数',
  `listPageId` int(9) default '1' COMMENT '开始页',
  `listSplitUrlChar` varchar(10) collate utf8_unicode_ci default '' COMMENT '横中线分割符',
  `listSplitUrl` varchar(100) collate utf8_unicode_ci default NULL COMMENT '分页表达式',
  `listRegexs` varchar(500) collate utf8_unicode_ci default NULL COMMENT 'jquery表达式',
  `listAttrSplit` varchar(100) collate utf8_unicode_ci default NULL COMMENT '属性',
  `listInserts` varchar(300) collate utf8_unicode_ci default NULL COMMENT '入库语句',
  `contUrlRegex` varchar(20) collate utf8_unicode_ci default NULL COMMENT 'URL表达式',
  `contUrlTest` int(9) default '1' COMMENT '测试Url',
  `contRegexs` varchar(500) collate utf8_unicode_ci default NULL COMMENT '选择器',
  `contAttrSplit` varchar(100) collate utf8_unicode_ci default NULL COMMENT '熟悉',
  `contInserts` varchar(300) collate utf8_unicode_ci default NULL COMMENT '入库表达式',
  `createTime` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '时间',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='数据采集';

/*Data for the table `TbsHttpRequest` */

insert  into `TbsHttpRequest`(`id`,`name`,`header`,`firstPage`,`encoding`,`listName`,`regexs`,`arrtSplit`,`inserts`,`listUrlRegex`,`listUrlTest`,`listPageId`,`listSplitUrlChar`,`listSplitUrl`,`listRegexs`,`listAttrSplit`,`listInserts`,`contUrlRegex`,`contUrlTest`,`contRegexs`,`contAttrSplit`,`contInserts`,`createTime`) values ('111111111111111111','采集咿呀网数据实例','{\"User-Agent\":\"Mozilla/5.0 (Windows NT 5.1; rv:7.0) Gecko/20100101 Firefox/7.0\",\"Content-Type\":\"application/x-www-form-urlencoded\"}','http://www.yy606.com/about/siteMap.shtml','UTF-8','*','html>body>div[class=container]>div[class=border]>div>ul>li:eq(0)>dl>dd>a|html>body>div[class=container]>div[class=border]>div>ul>li:eq(0)>dl>dd>a','href,text|target','INSERT INTO TbcTemp(id,href,text) VALUES([id],{0-0},{0-1});|INSERT INTO TbcTemp(id,href,text) VALUES([id],{0-0},{1-0});','{0-0}',0,1,'/','0+/+/+1+2+/+3+/+4+/+(*)','html>body>div[class=container]>div[class=index_left04 fl]>div[class=list_ulli border]>div[class=list_l_01]>div[class=list_l_04]>div[class=fl]>a|html>body>div[class=container]>div[class=index_left04 fl]>div[class=list_ulli border]>div[class=list_l_01]>div[class=list_l_04]>div[class=fl]>a>span','href,text|text','INSERT INTO TbcListTemp(id,href,type,text) VALUES([id],{0-0},{0-1},{1-0});','{0-0}',0,'html>body>div.container>div.index_left04>div.index_left07a>span.fl>a:eq(2)|html>body>div.container>div.index_left04>div.border>div.news_dt06>h2>strong|html>body>div.container>div.index_left04>div.border>div.news_dt06>p:eq(4)|html>body>div.container>div.index_left04>div.border>div.news_dt06>center>div>img','text|text|text|src','INSERT INTO TbcConTemp(id,TYPE,title,image,TEXT) VALUES([id],{0-0},{1-0},{2-0},{3-0})','2013-08-01 10:39:53');



/*Table structure for table `TbsMenu` */

DROP TABLE IF EXISTS `TbsMenu`;

CREATE TABLE `TbsMenu` (
  `id` char(20) collate utf8_unicode_ci NOT NULL COMMENT '唯一',
  `parentId` char(20) collate utf8_unicode_ci default NULL COMMENT '父节点',
  `name` varchar(50) collate utf8_unicode_ci default NULL COMMENT '名称',
  `isMenu` int(1) default '0' COMMENT '菜单类型',
  `type` int(1) default '0' COMMENT '加载方式',
  `sortNumber` int(9) default '0' COMMENT '排序',
  `url` varchar(200) collate utf8_unicode_ci default NULL COMMENT '地址',
  `button` varchar(500) collate utf8_unicode_ci default NULL COMMENT '按钮',
  `status` int(9) default '0' COMMENT '状态',
  `createTime` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '时间',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='菜单导航';

/*Data for the table `TbsMenu` */

insert  into `TbsMenu`(`id`,`parentId`,`name`,`isMenu`,`type`,`sortNumber`,`url`,`button`,`status`,`createTime`) values ('13080110395429123439',NULL,'数据表统计',0,0,6,NULL,NULL,0,'2013-08-01 10:39:55'),('13080110395452058362',NULL,'系统管理',0,0,1,NULL,NULL,0,'2013-08-01 10:39:54'),('13080110395464455251',NULL,'源码生成',0,0,4,NULL,NULL,0,'2013-08-01 10:39:54'),('13080110395465301959',NULL,'数据表管理',0,0,5,NULL,NULL,0,'2013-08-01 10:39:54'),('13080110395467025147',NULL,'监控管理',0,0,2,NULL,NULL,0,'2013-08-01 10:39:54'),('13080110395479594851',NULL,'源码编辑',0,1,3,'admin/asyJson.html',NULL,0,'2013-08-01 10:39:54'),('13080110395482377948',NULL,'采集管理',0,0,7,NULL,NULL,0,'2013-08-01 10:39:55'),('13080110395496481672',NULL,'功能管理',0,0,8,NULL,NULL,0,'2013-08-01 10:39:55'),('13080110395611120673','13080110395429123439','采集列表统计',0,0,0,'admin/TbcListTemp/charts.html',NULL,0,'2013-08-01 10:39:56'),('13080110395613569133','13080110395699905356','导入',1,0,6,'admin/TbcListTemp/importDlg.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbcListTempGridImport()\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-reload\'\">导入</a>',0,'2013-08-01 10:39:57'),('13080110395613725404','13080110395691096836','导出',1,0,5,'admin/TbcConTemp/export.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbcConTempGridExport()\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-reload\'\">导出</a>',0,'2013-08-01 10:39:56'),('13080110395615893072','13080110395691096836','刷新',1,0,4,NULL,'<a href=\"javascript:void(0)\" onclick=\"javascript:tbcConTempGridReload()\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-reload\'\">刷新</a>',0,'2013-08-01 10:39:56'),('13080110395621644708','13080110395699905356','导出',1,0,5,'admin/TbcListTemp/export.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbcListTempGridExport()\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-reload\'\">导出</a>',0,'2013-08-01 10:39:56'),('13080110395626382602','13080110395659138846','删除',1,0,3,'admin/TbcContent/del.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbcContentGridDel()\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-remove\'\">删除</a>',0,'2013-08-01 10:39:56'),('13080110395632914126','13080110395691096836','导入',1,0,6,'admin/TbcConTemp/importDlg.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbcConTempGridImport()\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-reload\'\">导入</a>',0,'2013-08-01 10:39:56'),('13080110395634857849','13080110395699905356','编辑',1,0,2,'admin/TbcListTemp/edit.html,admin/TbcListTemp/baseDlg.html,admin/TbcListTemp/save.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbcListTempGridAddAndEdit(\'修改\',\'admin/TbcListTemp/save.html\',1)\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-edit\'\">编辑 </a>',0,'2013-08-01 10:39:56'),('13080110395639232048','13080110395659138846','导出',1,0,5,'admin/TbcContent/export.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbcContentGridExport()\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-reload\'\">导出</a>',0,'2013-08-01 10:39:56'),('13080110395640047752','13080110395691096836','添加',1,0,1,'admin/TbcConTemp/add.html,admin/TbcConTemp/baseDlg.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbcConTempGridAddAndEdit(\'添加 \',\'admin/TbcConTemp/add.html\',0)\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-add\'\">添加</a>',0,'2013-08-01 10:39:56'),('13080110395645398888','13080110395691096836','查看',1,0,0,'admin/TbcConTemp/list.html,admin/TbcConTemp/listData.html,admin/TbcConTemp/TbcConTempSearchDlg.html',NULL,0,'2013-08-01 10:39:56'),('13080110395645678252','13080110395699905356','删除',1,0,3,'admin/TbcListTemp/del.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbcListTempGridDel()\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-remove\'\">删除</a>',0,'2013-08-01 10:39:56'),('13080110395651783806','13080110395699905356','添加',1,0,1,'admin/TbcListTemp/add.html,admin/TbcListTemp/baseDlg.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbcListTempGridAddAndEdit(\'添加 \',\'admin/TbcListTemp/add.html\',0)\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-add\'\">添加</a>',0,'2013-08-01 10:39:56'),('13080110395653269787','13080110395659138846','添加',1,0,1,'admin/TbcContent/add.html,admin/TbcContent/baseDlg.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbcContentGridAddAndEdit(\'添加 \',\'admin/TbcContent/add.html\',0)\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-add\'\">添加</a>',0,'2013-08-01 10:39:56'),('13080110395656621508','13080110395429123439','采集内容统计',0,0,0,'admin/TbcConTemp/charts.html',NULL,0,'2013-08-01 10:39:56'),('13080110395659138846','13080110395465301959','文章表',0,0,0,'admin/TbcContent/index.html',NULL,0,'2013-08-01 10:39:56'),('13080110395663930065','13080110395659138846','编辑',1,0,2,'admin/TbcContent/edit.html,admin/TbcContent/baseDlg.html,admin/TbcContent/save.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbcContentGridAddAndEdit(\'修改\',\'admin/TbcContent/save.html\',1)\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-edit\'\">编辑 </a>',0,'2013-08-01 10:39:56'),('13080110395666638261','13080110395699905356','刷新',1,0,4,NULL,'<a href=\"javascript:void(0)\" onclick=\"javascript:tbcListTempGridReload()\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-reload\'\">刷新</a>',0,'2013-08-01 10:39:56'),('13080110395673868821','13080110395659138846','刷新',1,0,4,NULL,'<a href=\"javascript:void(0)\" onclick=\"javascript:tbcContentGridReload()\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-reload\'\">刷新</a>',0,'2013-08-01 10:39:56'),('13080110395683217220','13080110395429123439','文章表统计',0,0,0,'admin/TbcContent/charts.html',NULL,0,'2013-08-01 10:39:56'),('13080110395688813751','13080110395659138846','导入',1,0,6,'admin/TbcContent/importDlg.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbcContentGridImport()\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-reload\'\">导入</a>',0,'2013-08-01 10:39:56'),('13080110395691096836','13080110395465301959','采集内容',0,0,0,'admin/TbcConTemp/index.html',NULL,0,'2013-08-01 10:39:56'),('13080110395694342873','13080110395699905356','查看',1,0,0,'admin/TbcListTemp/list.html,admin/TbcListTemp/listData.html,admin/TbcListTemp/TbcListTempSearchDlg.html',NULL,0,'2013-08-01 10:39:56'),('13080110395696163608','13080110395691096836','编辑',1,0,2,'admin/TbcConTemp/edit.html,admin/TbcConTemp/baseDlg.html,admin/TbcConTemp/save.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbcConTempGridAddAndEdit(\'修改\',\'admin/TbcConTemp/save.html\',1)\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-edit\'\">编辑 </a>',0,'2013-08-01 10:39:56'),('13080110395697316981','13080110395659138846','查看',1,0,0,'admin/TbcContent/list.html,admin/TbcContent/listData.html,admin/TbcContent/TbcContentSearchDlg.html',NULL,0,'2013-08-01 10:39:56'),('13080110395697742582','13080110395691096836','删除',1,0,3,'admin/TbcConTemp/del.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbcConTempGridDel()\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-remove\'\">删除</a>',0,'2013-08-01 10:39:56'),('13080110395699905356','13080110395465301959','采集列表',0,0,0,'admin/TbcListTemp/index.html',NULL,0,'2013-08-01 10:39:56'),('13080110395710516979','13080110395793005827','添加',1,0,1,'admin/TbsA/add.html,admin/TbsA/baseDlg.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbsAGridAddAndEdit(\'添加 \',\'admin/TbsA/add.html\',0)\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-add\'\">添加</a>',0,'2013-08-01 10:39:57'),('13080110395712145551','13080110395785917970','导出',1,0,5,'admin/TbcMenuHelp/export.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbcMenuHelpGridExport()\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-reload\'\">导出</a>',0,'2013-08-01 10:39:57'),('13080110395714241215','13080110395785917970','导入',1,0,6,'admin/TbcMenuHelp/importDlg.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbcMenuHelpGridImport()\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-reload\'\">导入</a>',0,'2013-08-01 10:39:57'),('13080110395714866969','13080110395793005827','导入',1,0,6,'admin/TbsA/importDlg.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbsAGridImport()\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-reload\'\">导入</a>',0,'2013-08-01 10:39:58'),('13080110395721460009','13080110395429123439','采集临时表统计',0,0,0,'admin/TbcTemp/charts.html',NULL,0,'2013-08-01 10:39:57'),('13080110395721483895','13080110395796996649','刷新',1,0,4,NULL,'<a href=\"javascript:void(0)\" onclick=\"javascript:tbcMenuGridReload()\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-reload\'\">刷新</a>',0,'2013-08-01 10:39:57'),('13080110395722705531','13080110395785917970','删除',1,0,3,'admin/TbcMenuHelp/del.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbcMenuHelpGridDel()\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-remove\'\">删除</a>',0,'2013-08-01 10:39:57'),('13080110395722894522','13080110395785917970','编辑',1,0,2,'admin/TbcMenuHelp/edit.html,admin/TbcMenuHelp/baseDlg.html,admin/TbcMenuHelp/save.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbcMenuHelpGridAddAndEdit(\'修改\',\'admin/TbcMenuHelp/save.html\',1)\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-edit\'\">编辑 </a>',0,'2013-08-01 10:39:57'),('13080110395723448796','13080110395765137191','编辑',1,0,2,'admin/TbcTemp/edit.html,admin/TbcTemp/baseDlg.html,admin/TbcTemp/save.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbcTempGridAddAndEdit(\'修改\',\'admin/TbcTemp/save.html\',1)\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-edit\'\">编辑 </a>',0,'2013-08-01 10:39:57'),('13080110395723467046','13080110395793005827','删除',1,0,3,'admin/TbsA/del.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbsAGridDel()\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-remove\'\">删除</a>',0,'2013-08-01 10:39:58'),('13080110395724533805','13080110395796996649','导入',1,0,6,'admin/TbcMenu/importDlg.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbcMenuGridImport()\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-reload\'\">导入</a>',0,'2013-08-01 10:39:57'),('13080110395729214448','13080110395785917970','查看',1,0,0,'admin/TbcMenuHelp/list.html,admin/TbcMenuHelp/listData.html,admin/TbcMenuHelp/TbcMenuHelpSearchDlg.html',NULL,0,'2013-08-01 10:39:57'),('13080110395733177558','13080110395765137191','导出',1,0,5,'admin/TbcTemp/export.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbcTempGridExport()\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-reload\'\">导出</a>',0,'2013-08-01 10:39:57'),('13080110395734008543','13080110395429123439','InnoDB free: 9216 kB统计',0,0,0,'admin/TbsA/charts.html',NULL,0,'2013-08-01 10:39:57'),('13080110395742798360','13080110395785917970','刷新',1,0,4,NULL,'<a href=\"javascript:void(0)\" onclick=\"javascript:tbcMenuHelpGridReload()\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-reload\'\">刷新</a>',0,'2013-08-01 10:39:57'),('13080110395742843578','13080110395765137191','查看',1,0,0,'admin/TbcTemp/list.html,admin/TbcTemp/listData.html,admin/TbcTemp/TbcTempSearchDlg.html',NULL,0,'2013-08-01 10:39:57'),('13080110395747899045','13080110395765137191','导入',1,0,6,'admin/TbcTemp/importDlg.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbcTempGridImport()\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-reload\'\">导入</a>',0,'2013-08-01 10:39:57'),('13080110395756011368','13080110395796996649','编辑',1,0,2,'admin/TbcMenu/edit.html,admin/TbcMenu/baseDlg.html,admin/TbcMenu/save.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbcMenuGridAddAndEdit(\'修改\',\'admin/TbcMenu/save.html\',1)\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-edit\'\">编辑 </a>',0,'2013-08-01 10:39:57'),('13080110395758885384','13080110395429123439','主页导航统计',0,0,0,'admin/TbcMenu/charts.html',NULL,0,'2013-08-01 10:39:57'),('13080110395758916352','13080110395796996649','查看',1,0,0,'admin/TbcMenu/list.html,admin/TbcMenu/listData.html,admin/TbcMenu/TbcMenuSearchDlg.html',NULL,0,'2013-08-01 10:39:57'),('13080110395765137191','13080110395465301959','采集临时表',0,0,0,'admin/TbcTemp/index.html',NULL,0,'2013-08-01 10:39:57'),('13080110395768944135','13080110395793005827','导出',1,0,5,'admin/TbsA/export.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbsAGridExport()\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-reload\'\">导出</a>',0,'2013-08-01 10:39:58'),('13080110395776033472','13080110395793005827','编辑',1,0,2,'admin/TbsA/edit.html,admin/TbsA/baseDlg.html,admin/TbsA/save.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbsAGridAddAndEdit(\'修改\',\'admin/TbsA/save.html\',1)\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-edit\'\">编辑 </a>',0,'2013-08-01 10:39:57'),('13080110395779760863','13080110395765137191','删除',1,0,3,'admin/TbcTemp/del.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbcTempGridDel()\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-remove\'\">删除</a>',0,'2013-08-01 10:39:57'),('13080110395780210488','13080110395429123439','帮助表统计',0,0,0,'admin/TbcMenuHelp/charts.html',NULL,0,'2013-08-01 10:39:57'),('13080110395785917970','13080110395465301959','帮助表',0,0,0,'admin/TbcMenuHelp/index.html',NULL,0,'2013-08-01 10:39:57'),('13080110395786984982','13080110395765137191','添加',1,0,1,'admin/TbcTemp/add.html,admin/TbcTemp/baseDlg.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbcTempGridAddAndEdit(\'添加 \',\'admin/TbcTemp/add.html\',0)\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-add\'\">添加</a>',0,'2013-08-01 10:39:57'),('13080110395788790340','13080110395785917970','添加',1,0,1,'admin/TbcMenuHelp/add.html,admin/TbcMenuHelp/baseDlg.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbcMenuHelpGridAddAndEdit(\'添加 \',\'admin/TbcMenuHelp/add.html\',0)\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-add\'\">添加</a>',0,'2013-08-01 10:39:57'),('13080110395791851275','13080110395793005827','刷新',1,0,4,NULL,'<a href=\"javascript:void(0)\" onclick=\"javascript:tbsAGridReload()\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-reload\'\">刷新</a>',0,'2013-08-01 10:39:58'),('13080110395792841516','13080110395793005827','查看',1,0,0,'admin/TbsA/list.html,admin/TbsA/listData.html,admin/TbsA/TbsASearchDlg.html',NULL,0,'2013-08-01 10:39:57'),('13080110395793005827','13080110395465301959','InnoDB free: 9216 kB',0,0,0,'admin/TbsA/index.html',NULL,0,'2013-08-01 10:39:57'),('13080110395794659491','13080110395765137191','刷新',1,0,4,NULL,'<a href=\"javascript:void(0)\" onclick=\"javascript:tbcTempGridReload()\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-reload\'\">刷新</a>',0,'2013-08-01 10:39:57'),('13080110395796996649','13080110395465301959','主页导航',0,0,0,'admin/TbcMenu/index.html',NULL,0,'2013-08-01 10:39:57'),('13080110395797242519','13080110395796996649','添加',1,0,1,'admin/TbcMenu/add.html,admin/TbcMenu/baseDlg.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbcMenuGridAddAndEdit(\'添加 \',\'admin/TbcMenu/add.html\',0)\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-add\'\">添加</a>',0,'2013-08-01 10:39:57'),('13080110395798754464','13080110395796996649','删除',1,0,3,'admin/TbcMenu/del.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbcMenuGridDel()\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-remove\'\">删除</a>',0,'2013-08-01 10:39:57'),('13080110395799989446','13080110395796996649','导出',1,0,5,'admin/TbcMenu/export.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbcMenuGridExport()\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-reload\'\">导出</a>',0,'2013-08-01 10:39:57'),('13080110395812154875','13080110395482377948','数据采集',0,0,0,'admin/TbsHttpRequest/index.html',NULL,0,'2013-08-01 10:39:58'),('13080110395815247034','13080110395868854493','编辑',1,0,2,'admin/TbsB/edit.html,admin/TbsB/baseDlg.html,admin/TbsB/save.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbsBGridAddAndEdit(\'修改\',\'admin/TbsB/save.html\',1)\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-edit\'\">编辑 </a>',0,'2013-08-01 10:39:58'),('13080110395815677705','13080110395465301959','浏览器表',0,0,0,'admin/TbsBrowserName/index.html',NULL,0,'2013-08-01 10:39:58'),('13080110395816467548','13080110395815677705','删除',1,0,3,'admin/TbsBrowserName/del.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbsBrowserNameGridDel()\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-remove\'\">删除</a>',0,'2013-08-01 10:39:58'),('13080110395822110553','13080110395812154875','刷新',1,0,4,NULL,'<a href=\"javascript:void(0)\" onclick=\"javascript:tbsHttpRequestGridReload()\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-reload\'\">刷新</a>',0,'2013-08-01 10:39:59'),('13080110395823271949','13080110395429123439','InnoDB free: 9216 kB统计',0,0,0,'admin/TbsB/charts.html',NULL,0,'2013-08-01 10:39:58'),('13080110395824454690','13080110395868854493','查看',1,0,0,'admin/TbsB/list.html,admin/TbsB/listData.html,admin/TbsB/TbsBSearchDlg.html',NULL,0,'2013-08-01 10:39:58'),('13080110395825454594','13080110395815677705','查看',1,0,0,'admin/TbsBrowserName/list.html,admin/TbsBrowserName/listData.html,admin/TbsBrowserName/TbsBrowserNameSearchDlg.html',NULL,0,'2013-08-01 10:39:58'),('13080110395826782648','13080110395815677705','编辑',1,0,2,'admin/TbsBrowserName/edit.html,admin/TbsBrowserName/baseDlg.html,admin/TbsBrowserName/save.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbsBrowserNameGridAddAndEdit(\'修改\',\'admin/TbsBrowserName/save.html\',1)\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-edit\'\">编辑 </a>',0,'2013-08-01 10:39:58'),('13080110395827744320','13080110395429123439','InnoDB free: 9216 kB统计',0,0,0,'admin/TbsC/charts.html',NULL,0,'2013-08-01 10:39:58'),('13080110395828132946','13080110395429123439','数据采集统计',0,0,0,'admin/TbsHttpRequest/charts.html',NULL,0,'2013-08-01 10:39:58'),('13080110395831253892','13080110395815677705','添加',1,0,1,'admin/TbsBrowserName/add.html,admin/TbsBrowserName/baseDlg.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbsBrowserNameGridAddAndEdit(\'添加 \',\'admin/TbsBrowserName/add.html\',0)\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-add\'\">添加</a>',0,'2013-08-01 10:39:58'),('13080110395832928454','13080110395868854493','导出',1,0,5,'admin/TbsB/export.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbsBGridExport()\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-reload\'\">导出</a>',0,'2013-08-01 10:39:58'),('13080110395833156088','13080110395889145398','导出',1,0,5,'admin/TbsC/export.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbsCGridExport()\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-reload\'\">导出</a>',0,'2013-08-01 10:39:58'),('13080110395844694988','13080110395815677705','导出',1,0,5,'admin/TbsBrowserName/export.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbsBrowserNameGridExport()\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-reload\'\">导出</a>',0,'2013-08-01 10:39:58'),('13080110395845090156','13080110395812154875','导出',1,0,5,'admin/TbsHttpRequest/export.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbsHttpRequestGridExport()\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-reload\'\">导出</a>',0,'2013-08-01 10:39:59'),('13080110395848861129','13080110395812154875','查看',1,0,0,'admin/TbsHttpRequest/list.html,admin/TbsHttpRequest/listData.html,admin/TbsHttpRequest/TbsHttpRequestSearchDlg.html',NULL,0,'2013-08-01 10:39:58'),('13080110395850021644','13080110395889145398','删除',1,0,3,'admin/TbsC/del.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbsCGridDel()\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-remove\'\">删除</a>',0,'2013-08-01 10:39:58'),('13080110395853291478','13080110395812154875','导入',1,0,6,'admin/TbsHttpRequest/importDlg.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbsHttpRequestGridImport()\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-reload\'\">导入</a>',0,'2013-08-01 10:39:59'),('13080110395857119890','13080110395889145398','添加',1,0,1,'admin/TbsC/add.html,admin/TbsC/baseDlg.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbsCGridAddAndEdit(\'添加 \',\'admin/TbsC/add.html\',0)\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-add\'\">添加</a>',0,'2013-08-01 10:39:58'),('13080110395861526370','13080110395812154875','编辑',1,0,2,'admin/TbsHttpRequest/edit.html,admin/TbsHttpRequest/baseDlg.html,admin/TbsHttpRequest/save.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbsHttpRequestGridAddAndEdit(\'修改\',\'admin/TbsHttpRequest/save.html\',1)\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-edit\'\">编辑 </a>',0,'2013-08-01 10:39:58'),('13080110395862386884','13080110395815677705','导入',1,0,6,'admin/TbsBrowserName/importDlg.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbsBrowserNameGridImport()\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-reload\'\">导入</a>',0,'2013-08-01 10:39:58'),('13080110395864985729','13080110395868854493','删除',1,0,3,'admin/TbsB/del.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbsBGridDel()\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-remove\'\">删除</a>',0,'2013-08-01 10:39:58'),('13080110395868854493','13080110395465301959','InnoDB free: 9216 kB',0,0,0,'admin/TbsB/index.html',NULL,0,'2013-08-01 10:39:58'),('13080110395869837489','13080110395889145398','刷新',1,0,4,NULL,'<a href=\"javascript:void(0)\" onclick=\"javascript:tbsCGridReload()\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-reload\'\">刷新</a>',0,'2013-08-01 10:39:58'),('13080110395870929930','13080110395812154875','添加',1,0,1,'admin/TbsHttpRequest/add.html,admin/TbsHttpRequest/baseDlg.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbsHttpRequestGridAddAndEdit(\'添加 \',\'admin/TbsHttpRequest/add.html\',0)\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-add\'\">添加</a>',0,'2013-08-01 10:39:58'),('13080110395871176406','13080110395812154875','删除',1,0,3,'admin/TbsHttpRequest/del.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbsHttpRequestGridDel()\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-remove\'\">删除</a>',0,'2013-08-01 10:39:58'),('13080110395877728504','13080110395429123439','浏览器表统计',0,0,0,'admin/TbsBrowserName/charts.html',NULL,0,'2013-08-01 10:39:58'),('13080110395882472273','13080110395889145398','导入',1,0,6,'admin/TbsC/importDlg.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbsCGridImport()\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-reload\'\">导入</a>',0,'2013-08-01 10:39:58'),('13080110395883030381','13080110395815677705','刷新',1,0,4,NULL,'<a href=\"javascript:void(0)\" onclick=\"javascript:tbsBrowserNameGridReload()\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-reload\'\">刷新</a>',0,'2013-08-01 10:39:58'),('13080110395889145398','13080110395465301959','InnoDB free: 9216 kB',0,0,0,'admin/TbsC/index.html',NULL,0,'2013-08-01 10:39:58'),('13080110395891898401','13080110395868854493','导入',1,0,6,'admin/TbsB/importDlg.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbsBGridImport()\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-reload\'\">导入</a>',0,'2013-08-01 10:39:58'),('13080110395895811833','13080110395889145398','查看',1,0,0,'admin/TbsC/list.html,admin/TbsC/listData.html,admin/TbsC/TbsCSearchDlg.html',NULL,0,'2013-08-01 10:39:58'),('13080110395896387394','13080110395868854493','添加',1,0,1,'admin/TbsB/add.html,admin/TbsB/baseDlg.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbsBGridAddAndEdit(\'添加 \',\'admin/TbsB/add.html\',0)\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-add\'\">添加</a>',0,'2013-08-01 10:39:58'),('13080110395898158656','13080110395889145398','编辑',1,0,2,'admin/TbsC/edit.html,admin/TbsC/baseDlg.html,admin/TbsC/save.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbsCGridAddAndEdit(\'修改\',\'admin/TbsC/save.html\',1)\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-edit\'\">编辑 </a>',0,'2013-08-01 10:39:58'),('13080110395899250652','13080110395868854493','刷新',1,0,4,NULL,'<a href=\"javascript:void(0)\" onclick=\"javascript:tbsBGridReload()\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-reload\'\">刷新</a>',0,'2013-08-01 10:39:58'),('13080110395910985606','13080110395946934620','刷新',1,0,4,NULL,'<a href=\"javascript:void(0)\" onclick=\"javascript:tbsRoleMenuGridReload()\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-reload\'\">刷新</a>',0,'2013-08-01 10:40:00'),('13080110395916454313','13080110395960103563','导入',1,0,6,'admin/TbsMenu/importDlg.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbsMenuGridImport()\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-reload\'\">导入</a>',0,'2013-08-01 10:39:59'),('13080110395916934046','13080110395467025147','登录日志',0,0,0,'admin/TbsLoginLog/index.html',NULL,0,'2013-08-01 10:39:59'),('13080110395918170272','13080110395958402126','导出',1,0,5,'admin/TbsRole/export.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbsRoleGridExport()\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-reload\'\">导出</a>',0,'2013-08-01 10:39:59'),('13080110395919007085','13080110395960103563','编辑',1,0,2,'admin/TbsMenu/edit.html,admin/TbsMenu/baseDlg.html,admin/TbsMenu/save.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbsMenuGridAddAndEdit(\'修改\',\'admin/TbsMenu/save.html\',1)\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-edit\'\">编辑 </a>',0,'2013-08-01 10:39:59'),('13080110395922269390','13080110395946934620','编辑',1,0,2,'admin/TbsRoleMenu/edit.html,admin/TbsRoleMenu/baseDlg.html,admin/TbsRoleMenu/save.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbsRoleMenuGridAddAndEdit(\'修改\',\'admin/TbsRoleMenu/save.html\',1)\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-edit\'\">编辑 </a>',0,'2013-08-01 10:39:59'),('13080110395923008330','13080110395960103563','导出',1,0,5,'admin/TbsMenu/export.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbsMenuGridExport()\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-reload\'\">导出</a>',0,'2013-08-01 10:39:59'),('13080110395927130751','13080110395916934046','导入',1,0,6,'admin/TbsLoginLog/importDlg.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbsLoginLogGridImport()\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-reload\'\">导入</a>',0,'2013-08-01 10:39:59'),('13080110395929738553','13080110395429123439','菜单导航统计',0,0,0,'admin/TbsMenu/charts.html',NULL,0,'2013-08-01 10:39:59'),('13080110395930060609','13080110395429123439','登录日志统计',0,0,0,'admin/TbsLoginLog/charts.html',NULL,0,'2013-08-01 10:39:59'),('13080110395935450214','13080110395958402126','导入',1,0,6,'admin/TbsRole/importDlg.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbsRoleGridImport()\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-reload\'\">导入</a>',0,'2013-08-01 10:39:59'),('13080110395935908567','13080110395960103563','添加',1,0,1,'admin/TbsMenu/add.html,admin/TbsMenu/baseDlg.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbsMenuGridAddAndEdit(\'添加 \',\'admin/TbsMenu/add.html\',0)\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-add\'\">添加</a>',0,'2013-08-01 10:39:59'),('13080110395936814186','13080110395960103563','删除',1,0,3,'admin/TbsMenu/del.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbsMenuGridDel()\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-remove\'\">删除</a>',0,'2013-08-01 10:39:59'),('13080110395936990086','13080110395958402126','查看',1,0,0,'admin/TbsRole/list.html,admin/TbsRole/listData.html,admin/TbsRole/TbsRoleSearchDlg.html',NULL,0,'2013-08-01 10:39:59'),('13080110395939391581','13080110395916934046','查看',1,0,0,'admin/TbsLoginLog/list.html,admin/TbsLoginLog/listData.html,admin/TbsLoginLog/TbsLoginLogSearchDlg.html',NULL,0,'2013-08-01 10:39:59'),('13080110395945354343','13080110395946934620','查看',1,0,0,'admin/TbsRoleMenu/list.html,admin/TbsRoleMenu/listData.html,admin/TbsRoleMenu/TbsRoleMenuSearchDlg.html',NULL,0,'2013-08-01 10:39:59'),('13080110395946404325','13080110395946934620','导出',1,0,5,'admin/TbsRoleMenu/export.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbsRoleMenuGridExport()\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-reload\'\">导出</a>',0,'2013-08-01 10:40:00'),('13080110395946483276','13080110395960103563','刷新',1,0,4,NULL,'<a href=\"javascript:void(0)\" onclick=\"javascript:tbsMenuGridReload()\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-reload\'\">刷新</a>',0,'2013-08-01 10:39:59'),('13080110395946934620','13080110395465301959','角色与资源关联表',0,0,0,'admin/TbsRoleMenu/index.html',NULL,0,'2013-08-01 10:39:59'),('13080110395958402126','13080110395452058362','权限角色',0,0,0,'admin/TbsRole/index.html',NULL,0,'2013-08-01 10:39:59'),('13080110395958696146','13080110395946934620','添加',1,0,1,'admin/TbsRoleMenu/add.html,admin/TbsRoleMenu/baseDlg.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbsRoleMenuGridAddAndEdit(\'添加 \',\'admin/TbsRoleMenu/add.html\',0)\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-add\'\">添加</a>',0,'2013-08-01 10:39:59'),('13080110395960103563','13080110395452058362','菜单导航',0,0,0,'admin/TbsMenu/index.html',NULL,0,'2013-08-01 10:39:59'),('13080110395961975197','13080110395916934046','刷新',1,0,4,NULL,'<a href=\"javascript:void(0)\" onclick=\"javascript:tbsLoginLogGridReload()\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-reload\'\">刷新</a>',0,'2013-08-01 10:39:59'),('13080110395964747837','13080110395429123439','角色与资源关联表统计',0,0,0,'admin/TbsRoleMenu/charts.html',NULL,0,'2013-08-01 10:39:59'),('13080110395973188397','13080110395958402126','添加',1,0,1,'admin/TbsRole/add.html,admin/TbsRole/baseDlg.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbsRoleGridAddAndEdit(\'添加 \',\'admin/TbsRole/add.html\',0)\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-add\'\">添加</a>',0,'2013-08-01 10:39:59'),('13080110395973773478','13080110395958402126','删除',1,0,3,'admin/TbsRole/del.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbsRoleGridDel()\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-remove\'\">删除</a>',0,'2013-08-01 10:39:59'),('13080110395975577763','13080110395916934046','删除',1,0,3,'admin/TbsLoginLog/del.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbsLoginLogGridDel()\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-remove\'\">删除</a>',0,'2013-08-01 10:39:59'),('13080110395977827237','13080110395946934620','删除',1,0,3,'admin/TbsRoleMenu/del.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbsRoleMenuGridDel()\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-remove\'\">删除</a>',0,'2013-08-01 10:39:59'),('13080110395979109069','13080110395958402126','刷新',1,0,4,NULL,'<a href=\"javascript:void(0)\" onclick=\"javascript:tbsRoleGridReload()\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-reload\'\">刷新</a>',0,'2013-08-01 10:39:59'),('13080110395984166293','13080110395916934046','添加',1,0,1,'admin/TbsLoginLog/add.html,admin/TbsLoginLog/baseDlg.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbsLoginLogGridAddAndEdit(\'添加 \',\'admin/TbsLoginLog/add.html\',0)\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-add\'\">添加</a>',0,'2013-08-01 10:39:59'),('13080110395984929619','13080110395916934046','导出',1,0,5,'admin/TbsLoginLog/export.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbsLoginLogGridExport()\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-reload\'\">导出</a>',0,'2013-08-01 10:39:59'),('13080110395986421094','13080110395960103563','查看',1,0,0,'admin/TbsMenu/list.html,admin/TbsMenu/listData.html,admin/TbsMenu/TbsMenuSearchDlg.html',NULL,0,'2013-08-01 10:39:59'),('13080110395994421245','13080110395429123439','权限角色统计',0,0,0,'admin/TbsRole/charts.html',NULL,0,'2013-08-01 10:39:59'),('13080110395996199968','13080110395946934620','导入',1,0,6,'admin/TbsRoleMenu/importDlg.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbsRoleMenuGridImport()\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-reload\'\">导入</a>',0,'2013-08-01 10:40:00'),('13080110395999633807','13080110395958402126','编辑',1,0,2,'admin/TbsRole/edit.html,admin/TbsRole/baseDlg.html,admin/TbsRole/save.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbsRoleGridAddAndEdit(\'修改\',\'admin/TbsRole/save.html\',1)\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-edit\'\">编辑 </a>',0,'2013-08-01 10:39:59'),('13080110395999791303','13080110395916934046','编辑',1,0,2,'admin/TbsLoginLog/edit.html,admin/TbsLoginLog/baseDlg.html,admin/TbsLoginLog/save.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbsLoginLogGridAddAndEdit(\'修改\',\'admin/TbsLoginLog/save.html\',1)\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-edit\'\">编辑 </a>',0,'2013-08-01 10:39:59'),('13080110400012965854','13080110400016426986','查看',1,0,0,'admin/TbsRoleUser/list.html,admin/TbsRoleUser/listData.html,admin/TbsRoleUser/TbsRoleUserSearchDlg.html',NULL,0,'2013-08-01 10:40:00'),('13080110400016426986','13080110395465301959','用户与角色关联表',0,0,0,'admin/TbsRoleUser/index.html',NULL,0,'2013-08-01 10:40:00'),('13080110400017465932','13080110395467025147','百度一下',0,2,0,'http://www.baidu.com',NULL,0,'2013-08-01 10:40:00'),('13080110400019244025','13080110400016426986','编辑',1,0,2,'admin/TbsRoleUser/edit.html,admin/TbsRoleUser/baseDlg.html,admin/TbsRoleUser/save.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbsRoleUserGridAddAndEdit(\'修改\',\'admin/TbsRoleUser/save.html\',1)\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-edit\'\">编辑 </a>',0,'2013-08-01 10:40:00'),('13080110400020255268','13080110395467025147','浏览器分析',0,0,0,'admin/browser.html',NULL,0,'2013-08-01 10:40:00'),('13080110400033422792','13080110395429123439','用户与角色关联表统计',0,0,0,'admin/TbsRoleUser/charts.html',NULL,0,'2013-08-01 10:40:00'),('13080110400034784966','13080110400016426986','添加',1,0,1,'admin/TbsRoleUser/add.html,admin/TbsRoleUser/baseDlg.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbsRoleUserGridAddAndEdit(\'添加 \',\'admin/TbsRoleUser/add.html\',0)\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-add\'\">添加</a>',0,'2013-08-01 10:40:00'),('13080110400035668401','13080110400070750625','查看',1,0,0,'admin/TbsUser/list.html,admin/TbsUser/listData.html,admin/TbsUser/TbsUserSearchDlg.html',NULL,0,'2013-08-01 10:40:00'),('13080110400038075911','13080110400070750625','删除',1,0,3,'admin/TbsUser/del.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbsUserGridDel()\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-remove\'\">删除</a>',0,'2013-08-01 10:40:00'),('13080110400042545731','13080110400016426986','删除',1,0,3,'admin/TbsRoleUser/del.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbsRoleUserGridDel()\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-remove\'\">删除</a>',0,'2013-08-01 10:40:00'),('13080110400045658187','13080110395429123439','系统用户统计',0,0,0,'admin/TbsUser/charts.html',NULL,0,'2013-08-01 10:40:00'),('13080110400052467384','13080110395467025147','数据库监控',0,2,0,'druid/index.html',NULL,0,'2013-08-01 10:40:00'),('13080110400054185314','13080110400070750625','编辑',1,0,2,'admin/TbsUser/edit.html,admin/TbsUser/baseDlg.html,admin/TbsUser/save.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbsUserGridAddAndEdit(\'修改\',\'admin/TbsUser/save.html\',1)\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-edit\'\">编辑 </a>',0,'2013-08-01 10:40:00'),('13080110400054568034','13080110395464455251','模板生成',0,0,0,'admin/template/index.html',NULL,0,'2013-08-01 10:40:00'),('13080110400060718192','13080110400070750625','添加',1,0,1,'admin/TbsUser/add.html,admin/TbsUser/baseDlg.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbsUserGridAddAndEdit(\'添加 \',\'admin/TbsUser/add.html\',0)\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-add\'\">添加</a>',0,'2013-08-01 10:40:00'),('13080110400060744922','13080110400016426986','导出',1,0,5,'admin/TbsRoleUser/export.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbsRoleUserGridExport()\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-reload\'\">导出</a>',0,'2013-08-01 10:40:00'),('13080110400065634533','13080110395467025147','服务器监控',0,0,0,'admin/SystemSigar/index.html',NULL,0,'2013-08-01 10:40:00'),('13080110400069532760','13080110395496481672','上传演示',0,0,0,'admin/uploadIndex.html',NULL,0,'2013-08-01 10:40:00'),('13080110400070136479','13080110400070750625','导出',1,0,5,'admin/TbsUser/export.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbsUserGridExport()\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-reload\'\">导出</a>',0,'2013-08-01 10:40:00'),('13080110400070750625','13080110395452058362','系统用户',0,0,0,'admin/TbsUser/index.html',NULL,0,'2013-08-01 10:40:00'),('13080110400087106465','13080110400070750625','导入',1,0,6,'admin/TbsUser/importDlg.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbsUserGridImport()\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-reload\'\">导入</a>',0,'2013-08-01 10:40:00'),('13080110400092078684','13080110400016426986','刷新',1,0,4,NULL,'<a href=\"javascript:void(0)\" onclick=\"javascript:tbsRoleUserGridReload()\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-reload\'\">刷新</a>',0,'2013-08-01 10:40:00'),('13080110400096561247','13080110400016426986','导入',1,0,6,'admin/TbsRoleUser/importDlg.html','<a href=\"javascript:void(0)\" onclick=\"javascript:tbsRoleUserGridImport()\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-reload\'\">导入</a>',0,'2013-08-01 10:40:00'),('13080110400097711969','13080110400070750625','刷新',1,0,4,NULL,'<a href=\"javascript:void(0)\" onclick=\"javascript:tbsUserGridReload()\" class=\"easyui-linkbutton\" data-options=\"plain:true,iconCls:\'icon-reload\'\">刷新</a>',0,'2013-08-01 10:40:00'),('13080110400099312317','13080110395496481672','项目下载',0,2,0,'download.html',NULL,0,'2013-08-01 10:40:00');

/*Table structure for table `TbsRole` */

DROP TABLE IF EXISTS `TbsRole`;

CREATE TABLE `TbsRole` (
  `id` char(20) collate utf8_unicode_ci NOT NULL COMMENT '主键',
  `name` varchar(20) collate utf8_unicode_ci default NULL COMMENT '角色',
  `text` varchar(500) collate utf8_unicode_ci default NULL COMMENT '所有权限',
  `createTime` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '时间',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='权限角色';

/*Data for the table `TbsRole` */

insert  into `TbsRole`(`id`,`name`,`text`,`createTime`) values ('13080110395541721609','源码生成权限','源码生成权限','2013-08-01 10:39:55'),('13080110395560027412','数据表管理权限','数据表管理权限','2013-08-01 10:39:55'),('13080110395562040599','监控管理权限','监控管理权限','2013-08-01 10:39:55'),('13080110395566101463','源码编辑权限','源码编辑权限','2013-08-01 10:39:55'),('13080110395572512871','功能管理权限','功能管理权限','2013-08-01 10:39:56'),('13080110395586994353','数据表统计权限','数据表统计权限','2013-08-01 10:39:55'),('13080110395587872009','系统管理权限','系统管理权限','2013-08-01 10:39:55'),('13080110395590730185','采集管理权限','采集管理权限','2013-08-01 10:39:55');

/*Table structure for table `TbsRoleMenu` */

DROP TABLE IF EXISTS `TbsRoleMenu`;

CREATE TABLE `TbsRoleMenu` (
  `id` char(20) collate utf8_unicode_ci NOT NULL COMMENT '主键',
  `roleId` char(20) collate utf8_unicode_ci default NULL COMMENT '角色主键',
  `menuIdFun` char(20) collate utf8_unicode_ci default NULL COMMENT '功能主键',
  `menuId` char(20) collate utf8_unicode_ci default NULL COMMENT '菜单主键',
  `createTime` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '时间',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='角色与资源关联表';

/*Data for the table `TbsRoleMenu` */

insert  into `TbsRoleMenu`(`id`,`roleId`,`menuIdFun`,`menuId`,`createTime`) values ('13080110443048570075','13080110395566101463','13080110400054568034','13080110400054568034','2013-08-01 10:44:30'),('13080110443068546600','13080110395566101463','13080110395464455251','13080110395464455251','2013-08-01 10:44:30');

/*Table structure for table `TbsRoleUser` */

DROP TABLE IF EXISTS `TbsRoleUser`;

CREATE TABLE `TbsRoleUser` (
  `id` char(20) collate utf8_unicode_ci NOT NULL COMMENT '主键',
  `userId` char(20) collate utf8_unicode_ci default NULL COMMENT '用户主键',
  `roleId` char(20) collate utf8_unicode_ci default NULL COMMENT '角色主键',
  `createTime` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '时间',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用户与角色关联表';

/*Data for the table `TbsRoleUser` */

INSERT INTO `TbsRoleUser` (`id`, `userId`, `roleId`, `createTime`) VALUES
	('13080110395521174386', '13080110395541498736', '13080110395572512871', '2013-08-01 10:39:56'),
	('13080110395524666783', '13080110395530275034', '13080110395590730185', '2013-08-01 10:39:55'),
	('13080110395559358925', '13080110395543386179', '13080110395587872009', '2013-08-01 10:39:55'),
	('14120512171643555904', '14120512155256553870', '13080110395586994353', '2014-12-05 12:17:16'),
	('14120512171655673756', '14120512155256553870', '13080110395572512871', '2014-12-05 12:17:16'),
	('14120512171657845900', '14120512155256553870', '13080110395590730185', '2014-12-05 12:17:16'),
	('14120512171686238771', '14120512155256553870', '13080110395587872009', '2014-12-05 12:17:16'),
	('14120512171696470734', '14120512155256553870', '13080110395541721609', '2014-12-05 12:17:16'),
	('14120512171699305468', '14120512155256553870', '13080110395566101463', '2014-12-05 12:17:16'),
	('14120620255116290229', '13080110395527650842', '13080110395572512871', '2014-12-06 20:25:51'),
	('14120620255116625067', '13080110395527650842', '13080110395541721609', '2014-12-06 20:25:51'),
	('14120620255147418921', '13080110395527650842', '13080110395566101463', '2014-12-06 20:25:51'),
	('14120620255179313919', '13080110395527650842', '13080110395586994353', '2014-12-06 20:25:51'),
	('14120620391763530843', '13080110395524874852', NULL, '2014-12-06 20:39:17'),
	('14120822355811815530', '14120822355816027711', '13080110395541721609', '2014-12-08 22:35:58'),
	('14120822355935283676', '14120822355816027711', '13080110395566101463', '2014-12-08 22:35:59'),
	('14120822370662106067', '14120822370670006505', '13080110395541721609', '2014-12-08 22:37:06'),
	('14120822370692910065', '14120822370670006505', '13080110395566101463', '2014-12-08 22:37:06'),
	('14120822432065183846', '13080110395552799616', '13080110395566101463', '2014-12-08 22:43:20'),
	('14120822441176041647', '14120822363416177039', '13080110395541721609', '2014-12-08 22:44:11'),
	('14120822441182218546', '14120822363416177039', '13080110395566101463', '2014-12-08 22:44:11'),
	('14120822442416765784', '14120822404043170049', '13080110395541721609', '2014-12-08 22:44:24');

DROP TABLE IF EXISTS `tbsdepartment`;
CREATE TABLE `tbsdepartment` (
	`id` VARCHAR(20) NOT NULL,
	`name` VARCHAR(255) NULL DEFAULT NULL,
	`pid` VARCHAR(20) NULL DEFAULT NULL,
	`code` VARCHAR(255) NULL DEFAULT NULL,
	`address` VARCHAR(255) NULL DEFAULT NULL,
	`des` VARCHAR(255) NULL DEFAULT NULL,
	PRIMARY KEY (`id`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB;

INSERT INTO `tbsdepartment` (`id`, `name`, `pid`, `code`, `address`, `des`) VALUES
	('1', '深圳总部', '', '0001', '深圳', '深圳本部11'),
	('14112917351792636649', '人事部门1', '2', '00011', '深圳', '人事部门'),
	('14112922324436304327', '人事部门', '3', '00012', '上海', '上海'),
	('14112922342435147155', '财务部', '3', '4', '上海', '上海'),
	('14113010421398086436', 'ddd', '3', 'dd', 'dd', 'ddd'),
	('14113021161327175446', 'jixiao', '14112917351792636649', NULL, NULL, NULL),
	('14120822472344218546', '21', '1', '12', '21', '21'),
	('14120822473044125766', '32', '1', '232', '32', '3232'),
	('14120822473586842411', '43', '1', '432', '43', '43'),
	('2', '人事部门', '1', '5555', '5', '55555'),
	('3', '上海分公司', '', '0002', '上海', NULL);

/*Table structure for table `TbsUser` */

DROP TABLE IF EXISTS `TbsUser`;

CREATE TABLE `tbsuser` (
	`id` CHAR(20) NOT NULL COMMENT '主键' COLLATE 'utf8_unicode_ci',
	`username` VARCHAR(50) NOT NULL COMMENT '用户名' COLLATE 'utf8_unicode_ci',
	`password` VARCHAR(50) NULL DEFAULT NULL COMMENT '密码' COLLATE 'utf8_unicode_ci',
	`createTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '时间',
	`ip` VARCHAR(20) NULL DEFAULT NULL COMMENT 'ip' COLLATE 'utf8_unicode_ci',
	`count` INT(9) NULL DEFAULT '0' COMMENT '次数',
	`isLock` INT(1) NULL DEFAULT '0' COMMENT '锁定',
	`lockTime` DATETIME NULL DEFAULT NULL COMMENT '锁定时间',
	`failCount` INT(1) NULL DEFAULT '0' COMMENT '失败次数',
	`isAdmin` INT(1) NULL DEFAULT '1' COMMENT '权限类型',
	`sex` CHAR(1) NULL DEFAULT '1' COMMENT '性别' COLLATE 'utf8_unicode_ci',
	`telephone` VARCHAR(32) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
	`address` VARCHAR(200) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
	`family_tel` VARCHAR(32) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
	`birth_place` VARCHAR(200) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
	`social_num` VARCHAR(32) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
	`account_num` VARCHAR(32) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
	`status` CHAR(1) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
	`dept_id` VARCHAR(20) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
	PRIMARY KEY (`id`),
	UNIQUE INDEX `unique_username` (`username`)
)
COMMENT='系统用户'
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB;
/*Data for the table `TbsUser` */

INSERT INTO `tbsuser` (`id`, `username`, `password`, `createTime`, `ip`, `count`, `isLock`, `lockTime`, `failCount`, `isAdmin`, `sex`, `telephone`, `address`, `family_tel`, `birth_place`, `social_num`, `account_num`, `status`, `dept_id`) VALUES
	('13080110395524874852', 'admin', 'adb72b256f38df9e', '2014-12-10 20:39:09', '127.0.0.1', 0, 0, NULL, 0, 0, '1', '', '222', '', '', '', '', '1', '2'),
	('13080110395527650842', 'ouyanlgi', 'adb72b256f38df9e', '2013-08-01 10:39:55', '127.0.0.1', 0, 0, NULL, 0, 0, '1', '434343', '江西九江湖口', '121', '3232', '34343', '4343', '1', '2'),
	('13080110395530275034', 'test7', 'adb72b256f38df9e', '2013-08-01 10:39:55', '127.0.0.1', 0, 0, NULL, 0, 1, '1', NULL, '222', NULL, NULL, NULL, NULL, NULL, '2'),
	('13080110395536197890', 'test5', 'adb72b256f38df9e', '2013-08-01 10:39:55', '127.0.0.1', 0, 0, NULL, 0, 1, '1', NULL, '222', NULL, NULL, NULL, NULL, NULL, '2'),
	('13080110395541498736', 'test8', 'adb72b256f38df9e', '2013-08-01 10:39:56', '127.0.0.1', 0, 0, NULL, 0, 1, '1', NULL, '222', NULL, NULL, NULL, NULL, NULL, '2'),
	('13080110395543386179', 'test1', 'adb72b256f38df9e', '2013-08-01 10:39:55', '127.0.0.1', 0, 0, NULL, 0, 1, '1', NULL, '333', NULL, NULL, NULL, NULL, NULL, '2'),
	('13080110395552799616', 'test3', 'adb72b256f38df9e', '2013-08-01 10:39:55', '127.0.0.1', 0, 0, NULL, 0, 1, '1', '', '444', '', '', '', '', '1', '2'),
	('13080110430783453749', 'ttt', '77bb70300fb93299', '2013-08-01 10:43:07', NULL, 0, 0, NULL, 0, 1, '1', NULL, '555', NULL, NULL, NULL, NULL, NULL, '2'),
	('13080110431199269046', 'tttt', '77bb70300fb93299', '2013-08-01 10:43:11', NULL, 0, 0, NULL, 0, 1, '1', NULL, '666', NULL, NULL, NULL, NULL, NULL, '2'),
	('13080110431529406390', 'ttttt', '77bb70300fb93299', '2013-08-01 10:43:15', NULL, 0, 0, NULL, 0, 1, '1', NULL, '777', NULL, NULL, NULL, NULL, NULL, '2'),
	('14112914242019192008', 'qqq', 'adb72b256f38df9e', '2014-11-01 14:23:43', '127.0.0.1', 0, 0, NULL, 0, 0, '2', '', '777777', '', '', '', '', '1', '2'),
	('14120216563447522362', 'tt', '497c86bbe3b981a6', '2014-12-02 16:56:15', NULL, 0, 0, NULL, 0, 0, '2', '12345678908', 'ttt', '', '', '', '', '1', '2'),
	('14120512155256553870', '123', 'adb72b256f38df9e', '2014-12-04 12:17:12', NULL, 0, 0, NULL, 0, 0, '1', '', '343223232', '', '', '', '', '1', '2'),
	('14120822363416177039', '7777', 'adb72b256f38df9e', '2014-12-08 22:36:34', NULL, 0, 0, NULL, 0, 1, '1', '', '', '', '', '', '', '1', '2'),
	('14120822370670006505', 'eee', '6b125258f35b1c48', '2014-12-09 22:36:54', NULL, 0, 0, NULL, 0, 0, '2', '', '', '', '', '', '', '2', '1'),
	('14120822404043170049', '111111111111', '5f7158ade4c8d299', '2014-12-16 22:39:58', NULL, 0, 0, NULL, 0, 1, '1', '1111', '1111', '111111', '1111', '111', '', '1', '2');
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
