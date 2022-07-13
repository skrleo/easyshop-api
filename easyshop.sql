-- MySQL dump 10.13  Distrib 5.6.50, for Linux (x86_64)
--
-- Host: localhost    Database: easyshop
-- ------------------------------------------------------
-- Server version	5.6.50-log

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
-- Table structure for table `base_config`
--

DROP TABLE IF EXISTS `base_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `base_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '类型：1、用户协议 2、视频',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '名称',
  `content` longtext NOT NULL COMMENT '内容',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态：0 、启用, 1、关闭',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='基本配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_config`
--

LOCK TABLES `base_config` WRITE;
/*!40000 ALTER TABLE `base_config` DISABLE KEYS */;
INSERT INTO `base_config` VALUES (1,1,'用户协议','<p>本应用尊重并保护所有使用服务用户的个人隐私权。为了给您提供更准确、更有个性化的服务，本应用会按照本隐私权政策的规定使用和披露您的个人信息。但本应用将以高度的勤勉、审慎义务对待这些信息。除本隐私权政策另有规定外，在未征得您事先许可的情况下，本应用不会将这些信息对外披露或向第三方提供。本应用会不时更新本隐私权政策。\r\n您在同意本应用服务使用协议之时，即视为您已经同意本隐私权政策全部内容。本隐私权政策属于本应用服务使用协议不可分割的一部分。</p>\r\n<ol>\r\n<li>适用范围\r\n(a) 在您注册本应用帐号时，您根据本应用要求提供的个人注册信息；\r\n(b)在您使用本应用网络服务，或访问本应用平台网页时，本应用自动接收并记录的您的浏览器和计算机上的信息，包括但不限于您的IP地址、浏览器的类型、使用的语言、访问日期和时间、软硬件特征信息及您需求的网页记录等数据；\r\n(c) 本应用通过合法途径从商业伙伴处取得的用户个人数据。\r\n您了解并同意，以下信息不适用本隐私权政策：\r\n(a) 您在使用本应用平台提供的搜索服务时输入的关键字信息；\r\n(b) 本应用收集到的您在本应用发布的有关信息数据，包括但不限于参与活动、成交信息及评价详情；\r\n(c) 违反法律规定或违反本应用规则行为及本应用已对您采取的措施。</li>\r\n<li>信息使用\r\n(a)本应用不会向任何无关第三方提供、出售、出租、分享或交易您的个人信息，除非事先得到您的许可，或该第三方和本应用（含本应用关联公司）单独或共同为您提供服务，且在该服务结束后，其将被禁止访问包括其以前能够访问的所有这些资料。\r\n(b) 本应用亦不允许任何第三方以任何手段收集、编辑、出售或者无偿传播您的个人信息。任何本应用平台用户如从事上述活动，一经发现，本应用有权立即终止与该用户的服务协议。\r\n(c) 为服务用户的目的，本应用可能通过使用您的个人信息，向您提供您感兴趣的信息，包括但不限于向您发出产品和服务信息，或者与本应用合作伙伴共享信息以便他们向您发送有关其产品和服务的信息（后者需要您的事先同意）。</li>\r\n<li>信息披露\r\n在如下情况下，本应用将依据您的个人意愿或法律的规定全部或部分的披露您的个人信息：\r\n(a) 经您事先同意，向第三方披露；\r\n(b)为提供您所要求的产品和服务，而必须和第三方分享您的个人信息；\r\n(c) 根据法律的有关规定，或者行政或司法机构的要求，向第三方或者行政、司法机构披露；\r\n(d) 如您出现违反中国有关法律、法规或者本应用服务协议或相关规则的情况，需要向第三方披露；\r\n(e) 如您是适格的知识产权投诉人并已提起投诉，应被投诉人要求，向被投诉人披露，以便双方处理可能的权利纠纷；\r\n(f) 在本应用平台上创建的某一交易中，如交易任何一方履行或部分履行了交易义务并提出信息披露请求的，本应用有权决定向该用户提供其交易对方的联络方式等必要信息，以促成交易的完成或纠纷的解决。\r\n(g) 其它本应用根据法律、法规或者网站政策认为合适的披露。</li>\r\n<li>信息存储和交换\r\n本应用收集的有关您的信息和资料将保存在本应用及（或）其关联公司的服务器上，这些信息和资料可能传送至您所在国家、地区或本应用收集信息和资料所在地的境外并在境外被访问、存储和展示。</li>\r\n<li>Cookie的使用\r\n(a) 在您未拒绝接受cookies的情况下，本应用会在您的计算机上设定或取用cookies，以便您能登录或使用依赖于cookies的本应用平台服务或功能。本应用使用cookies可为您提供更加周到的个性化服务，包括推广服务。\r\n(b) 您有权选择接受或拒绝接受cookies。您可以通过修改浏览器设置的方式拒绝接受cookies。但如果您选择拒绝接受cookies，则您可能无法登录或使用依赖于cookies的本应用网络服务或功能。\r\n(c) 通过本应用所设cookies所取得的有关信息，将适用本政策。</li>\r\n<li>信息安全\r\n(a)本应用帐号均有安全保护功能，请妥善保管您的用户名及密码信息。本应用将通过对用户密码进行加密等安全措施确保您的信息不丢失，不被滥用和变造。尽管有前述安全措施，但同时也请您注意在信息网络上不存在“完善的安全措施”。\r\n(b) 在使用本应用网络服务进行网上交易时，您不可避免的要向交易对方或潜在的交易对\r\n7.本隐私政策的更改\r\n(a)如果决定更改隐私政策，我们会在本政策中、本公司网站中以及我们认为适当的位置发布这些更改，以便您了解我们如何收集、使用您的个人信息，哪些人可以访问这些信息，以及在什么情况下我们会透露这些信息。\r\n(b)本公司保留随时修改本政策的权利，因此请经常查看。如对本政策作出重大更改，本公司会通过网站通知的形式告知。方披露自己的个人信息，如联络方式或者邮政地址。请您妥善保护自己的个人信息，仅在必要的情形下向他人提供。如您发现自己的个人信息泄密，尤其是本应用用户名及密码发生泄露，请您立即联络本应用客服，以便本应用采取相应措施。</li>\r\n</ol>\r\n<p>云淘趣（广州）网络科技有限公司版本所有</p>\r\n',0,NULL,'2021-02-22 21:19:27');
/*!40000 ALTER TABLE `base_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_activity`
--

DROP TABLE IF EXISTS `store_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '活动名称',
  `jump_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '跳转类型： 0、商品Id 1、链接',
  `thumb` text NOT NULL COMMENT '图片地址',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `app_id` varchar(150) NOT NULL COMMENT '小程序Id',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态：0 、启用, 1、关闭',
  `jump_url` text NOT NULL COMMENT '跳转地址',
  `remark` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='活动管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_activity`
--

LOCK TABLES `store_activity` WRITE;
/*!40000 ALTER TABLE `store_activity` DISABLE KEYS */;
INSERT INTO `store_activity` VALUES (1,'商超生鲜34元红包天天领',2,'[{\"name\":\"20200808225359 - 512.png\",\"url\":\"https:\\/\\/s3plus.sankuai.com\\/v1\\/mss_5017c592a8a946d2a54eb62a76ba299c\\/nebulafile\\/2cc7fb2c51daa72501044f9da4170115.jpg\"}]',NULL,'wxde8ac0a21135c07d',0,NULL,0,'https://i.meituan.com/awp/hfe/block/c9ff59b58f6f5bf385b6/94455/index.html','','2021-01-17 13:57:23','2022-04-25 08:24:29'),(2,'美食外卖56元红包天天领',2,'[{\"name\":\"20200808225359 - 512.png\",\"url\":\"https:\\/\\/s3plus.sankuai.com\\/v1\\/mss_5017c592a8a946d2a54eb62a76ba299c\\/nebulafile\\/a89637f2c503ea874117429dc6768e4c.jpg\"}]',NULL,'wxde8ac0a21135c07d',2,NULL,0,'/index/pages/h5/h5?lch=cps:waimai:5:f77b5503ed712b020fe11264f170bbe5:221:2:73110&f_userId=1&weburl=https%3A%2F%2Fclick.meituan.com%2Ft%3Ft%3D1%26c%3D1%26p%3DOWMpZ-uzIFOVe6JyOONs3dXuqV0qcAf-r-KCvHdXiNcT1dE7G6xOXuPE8KYfUpvMp8a1DfmWmwQnUWyNtqM1oHgvrjuI0qy9z_OnsgaRo-rhLRuFaYQZXr2qS-V9b05PzCeEjgnt4-NGYD93ga0UP9SXND7dnVANuFoAxDQo69WJy2l5euIrtchzDWAEt_syKfYKV80cFZ3nkG7p_tJP7vOBapuwzyv6cFhg_5znpqcuuVu7JjcQt0GYleBUwW8Ty7LJSafNk0bxRXl4TCkDTd6o478EvckkNbE6YqU3kDSMKmR69rSkDoPy29pJY7sy7_iBDZoMHbCxbf8daiCj-t7Xpe6FTaGprWennNt1ddxIX2S6RmAb2Du15jt895IJ3AvucdJ7vAmMz1WMptki9QcxE52cDnU5J_UtPIra3VZ2v7c9R2iU5cEul8JrKNqrwG4J_TDZc35GYf1wq1ELkH2aC-556pZ5e_pNZXLByvSbFfhoBSeOMO1VIanmf9nVeB9CDl7XA7GL8neuW1tHJzL76NzVqV-hTXV0NL1RBDgnQJSl6LOg3dY3_kB9nEdvjxj8Be5zDCj0J0NZ0HGqcXeh2aGq4AZmum4gn2nTDYSCQPktpehXT6pEM6yXTGckDbfzq55eKhesDGcQCUNjGbpsMBnHj6TyIa4gU9tFbIk&f_token=1','','2021-01-17 13:57:29','2022-04-25 08:24:32'),(3,'每天最高20元无门槛红包',2,'[{\"name\":\"20200808225359 - 512.png\",\"url\":\"https:\\/\\/s3plus.sankuai.com\\/v1\\/mss_5017c592a8a946d2a54eb62a76ba299c\\/nebulafile\\/a89637f2c503ea874117429dc6768e4c.jpg\"}]',NULL,'wxece3a9a4c82f58c9',1,NULL,0,'taoke/pages/shopping-guide/index?scene=nD2pZru','','2021-01-31 15:16:58','2022-04-25 08:24:34');
/*!40000 ALTER TABLE `store_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_address`
--

DROP TABLE IF EXISTS `store_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_address` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `province` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '省',
  `city` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '市',
  `region` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '区',
  `contact` char(100) NOT NULL DEFAULT '' COMMENT '收货人',
  `moblie` char(11) NOT NULL DEFAULT '' COMMENT '手机号码',
  `address` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '收货地址',
  `is_default` int(11) NOT NULL DEFAULT '0' COMMENT '是否默认[0、否;1、是]',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户地址';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_address`
--

LOCK TABLES `store_address` WRITE;
/*!40000 ALTER TABLE `store_address` DISABLE KEYS */;
INSERT INTO `store_address` VALUES (5,13,'广东省','广州市','天河区','刘耀','17801003655','MSN轰轰轰',1,'2022-05-27 16:30:15','2022-05-27 16:30:20'),(6,2,'广东省','佛山市','南海区','谭琳','13800138000','xxxxcc',1,'2022-05-27 23:49:18','2022-05-27 23:49:18'),(9,1,'广东省','广州市','天河区','陈广惠','13035809409','黄村街道石桥头上三巷',0,'2022-05-30 23:38:23','2022-05-30 23:38:23'),(10,24,'广东省','深圳市','宝安区','李泽鸿','15919323347','新桥街道万丰社区穗丰苑',0,'2022-06-01 16:12:45','2022-06-01 16:12:45'),(11,24,'广东省','深圳市','宝安区','李泽鸿','15919323347','新桥街道万丰社区穗丰苑',0,'2022-06-01 16:12:55','2022-06-01 16:12:55'),(12,30,'北京市','北京市','海淀区','盖美美','13043340427','上地街道上地东里2区15号楼2单元501',1,'2022-06-13 11:56:53','2022-06-13 11:56:53'),(13,34,'广东省','广州市','天河区','陈先生','13000000000','黄村街道xxx号',1,'2022-06-18 01:16:36','2022-06-27 22:57:01'),(14,20,'广东省','广州市','天河区','陈广惠','13035809409','xxx',1,'2022-06-19 23:58:35','2022-06-20 00:13:45');
/*!40000 ALTER TABLE `store_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_advert`
--

DROP TABLE IF EXISTS `store_advert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_advert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL DEFAULT '' COMMENT '名称',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态：0 、启用, 1、关闭',
  `jump_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '跳转类型： 0、商品Id 1、链接',
  `thumb` text NOT NULL COMMENT '图片地址',
  `jump_url` varchar(255) NOT NULL DEFAULT '' COMMENT '跳转地址',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `bgcolor` varchar(25) NOT NULL DEFAULT '' COMMENT '背景颜色',
  `type` tinyint(1) DEFAULT '1' COMMENT '类型：1、无限期  2、 限制时间',
  `module` tinyint(1) DEFAULT '0' COMMENT '类型： 0、商品分类 1、轮播图 2、栏目 3、其他',
  `remark` varchar(255) NOT NULL COMMENT '描述',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='广告管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_advert`
--

LOCK TABLES `store_advert` WRITE;
/*!40000 ALTER TABLE `store_advert` DISABLE KEYS */;
INSERT INTO `store_advert` VALUES (1,'首页轮播图',NULL,NULL,1,0,'[{\"name\":\"banner_2.png\",\"url\":\"http:\\/\\/img.easyshop.org.cn\\/base\\/tmp\\/banner_2.png\",\"uid\":1651673600502,\"status\":\"success\"}]','/pages/index/activity',0,'',1,2,'123','2021-01-16 21:32:56','2022-05-22 17:16:34'),(2,'惊喜盲盒',NULL,NULL,1,1,'[{\"name\":\"20200808225359 - 512.png\",\"url\":\"https:\\/\\/cool-mall.oss-cn-shanghai.aliyuncs.com\\/app\\/8594558c-5dd7-4683-91a8-c956f2f93654.png\",\"uid\":1653239796502,\"status\":\"success\"}]','/pages/activity/lists',0,'#FFF9F9',1,3,'9块9等你来抢',NULL,'2022-06-17 17:55:58'),(3,'新品首发',NULL,NULL,1,1,'[{\"name\":\"20200808225359 - 512.png\",\"url\":\"https:\\/\\/cool-mall.oss-cn-shanghai.aliyuncs.com\\/app\\/20854efc-d608-4eca-8271-a23c953df1cb.png\",\"uid\":1653239807034,\"status\":\"success\"}]','/pages/goods/lists?channel=jd&goods_type=2',0,'#FBF9FF',1,3,'1元玩新货',NULL,'2022-05-22 17:16:54'),(4,'发现好货',NULL,NULL,1,1,'[{\"name\":\"evt_9.png\",\"url\":\"https:\\/\\/img.easyshop.org.cn\\/material\\/tmp\\/evt_9.png\"}]','/pages/goods/lists?channel=pdd&goods_type=3',0,'#F9FBFF',1,3,'发现美好新生活',NULL,'2022-06-20 15:17:15'),(5,'首页轮播图','2022-04-27 00:00:00','2025-05-24 00:00:00',1,1,'[{\"name\":\"\\u4fc3\\u9500\\u9177\\u70ab\\u53cc\\u5341\\u4e8c\\u901a\\u7528\\u6c1b\\u56f4\\u6d77\\u62a5banner.jpg\",\"url\":\"https:\\/\\/img.easyshop.org.cn\\/material\\/tmp\\/\\u4fc3\\u9500\\u9177\\u70ab\\u53cc\\u5341\\u4e8c\\u901a\\u7528\\u6c1b\\u56f4\\u6d77\\u62a5banner.jpg\"}]','/pages/goods/lists?channel=vip&goods_type=6',0,'',2,2,'',NULL,'2022-06-22 15:59:51'),(6,'首页轮播图',NULL,NULL,1,1,'[{\"name\":\"banner_2.png\",\"url\":\"http:\\/\\/img.easyshop.org.cn\\/base\\/tmp\\/banner_2.png\",\"uid\":1651673600502,\"status\":\"success\"}]','/pages/goods/lists?channel=jd&goods_type=2',0,'',1,2,'',NULL,'2022-05-22 17:17:38'),(11,'首页弹出窗','2022-06-01 00:00:00','2022-07-30 00:00:00',1,1,'[{\"name\":\"d51f00e7928b9d174f7179371a261b2c.png\",\"url\":\"https:\\/\\/img.easyshop.org.cn\\/base\\/tmp\\/d51f00e7928b9d174f7179371a261b2c.png\",\"uid\":1655398456703,\"status\":\"success\"}]','/pages/activity/lists',21,'',1,1,'','2022-06-01 00:30:14','2022-06-16 16:54:24');
/*!40000 ALTER TABLE `store_advert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_blind_box`
--

DROP TABLE IF EXISTS `store_blind_box`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_blind_box` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '盲盒标题',
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '盲盒价格',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态：0 、下架, 1、上架',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `buy_num` int(11) NOT NULL DEFAULT '0' COMMENT '购买人数',
  `thumb` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '盲盒封面',
  `gift_point` int(11) DEFAULT '0' COMMENT '赠送的积分',
  `gift_growth` int(11) DEFAULT '0' COMMENT '赠送的成长值',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '盲盒规则',
  `md_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '盲盒规则',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='商品盲盒';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_blind_box`
--

LOCK TABLES `store_blind_box` WRITE;
/*!40000 ALTER TABLE `store_blind_box` DISABLE KEYS */;
INSERT INTO `store_blind_box` VALUES (3,'苹果13Peo手机平板幸运盲盒（测试）',9.90,1,2,15643,'[{\"name\":\"20220624224714.png\",\"url\":\"https:\\/\\/img.easyshop.org.cn\\/material\\/tmp\\/20220624224714.png\"}]',0,0,'0','0','2022-06-27 22:48:59','2022-06-27 23:19:09'),(4,'苹果13Peo手机平板幸运盲盒（测试）',9.90,1,12,45862,'[{\"name\":\"e9db140ad26c48b59fda05e0a229b053.png\",\"url\":\"https:\\/\\/img.easyshop.org.cn\\/material\\/tmp\\/e9db140ad26c48b59fda05e0a229b053.png\"}]',0,0,'0','0','2022-06-27 22:49:53','2022-06-27 23:19:58'),(5,'苹果13Peo手机平板幸运盲盒（测试）',0.01,1,123,15673,'[{\"name\":\"7bafb95a9642e28ed8dbc53d9ccb1506.png\",\"url\":\"https:\\/\\/img.easyshop.org.cn\\/material\\/tmp\\/7bafb95a9642e28ed8dbc53d9ccb1506.png\"}]',0,0,'0','0','2022-06-27 22:50:26','2022-06-27 23:20:38'),(6,'苹果13Peo手机平板幸运盲盒（测试）',9.90,0,123,15678,'[{\"name\":\"7bafb95a9642e28ed8dbc53d9ccb1506.png\",\"url\":\"https:\\/\\/img.easyshop.org.cn\\/material\\/tmp\\/7bafb95a9642e28ed8dbc53d9ccb1506.png\"}]',0,0,'0','0','2022-06-27 22:50:49','2022-06-27 23:19:24');
/*!40000 ALTER TABLE `store_blind_box` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_blind_box_deal`
--

DROP TABLE IF EXISTS `store_blind_box_deal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_blind_box_deal` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '简称',
  `status` int(11) DEFAULT '0' COMMENT '状态[1、正常；2、关闭]',
  `color` char(23) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '颜色',
  `reality_rate` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '真实中奖概率',
  `virtual_rate` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '虚假中奖概率',
  `remark` varchar(120) DEFAULT NULL COMMENT '规则描述',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='盲盒配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_blind_box_deal`
--

LOCK TABLES `store_blind_box_deal` WRITE;
/*!40000 ALTER TABLE `store_blind_box_deal` DISABLE KEYS */;
INSERT INTO `store_blind_box_deal` VALUES (1,'N级',1,'red',80.00,80.00,NULL,'2022-06-13 15:30:11','2022-06-18 00:58:59'),(2,'R级',1,'red',15.00,15.00,NULL,'2022-06-13 15:30:29','2022-06-18 00:59:12'),(3,'SR级',1,'red',4.99,4.99,NULL,'2022-06-13 15:30:46','2022-06-18 00:59:18'),(4,'SSR级',1,'red',0.01,0.01,NULL,'2022-06-13 15:31:10','2022-06-18 00:59:25');
/*!40000 ALTER TABLE `store_blind_box_deal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_blind_box_order`
--

DROP TABLE IF EXISTS `store_blind_box_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_blind_box_order` (
  `order_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `order_no` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '订单号',
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品Id',
  `rule_type` int(11) DEFAULT NULL COMMENT '规则ID',
  `goods_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '商品名称',
  `goods_thumb` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '商品封面',
  `status` char(6) CHARACTER SET utf8 NOT NULL DEFAULT '1' COMMENT '订单状态[1、未付款，2、已付款，3、未发货，4、已发货，5、交易成功，6、交易关闭]',
  `amount` decimal(8,2) DEFAULT '0.00' COMMENT '实际支付金额',
  `sku` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '规格',
  `number` int(11) NOT NULL DEFAULT '0' COMMENT '购买数量',
  `goods_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '商品价格',
  `contact` char(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '收货人',
  `moblie` char(11) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '手机号码',
  `shipping_name` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '物流名称',
  `gift_growth` int(11) DEFAULT '0' COMMENT '赠送的成长值',
  `gift_point` int(11) DEFAULT '0' COMMENT '赠送的积分',
  `shipping_code` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '物流单号',
  `address` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '收货地址',
  `close_time` datetime DEFAULT NULL COMMENT '交易关闭时间',
  `end_time` datetime DEFAULT NULL COMMENT '交易完成时间',
  `payment_time` datetime DEFAULT NULL COMMENT '付款时间',
  `consign_time` datetime DEFAULT NULL COMMENT '发货时间',
  `create_time` datetime DEFAULT NULL COMMENT '订单创建时间',
  `post_fee` decimal(8,2) DEFAULT '0.00' COMMENT '邮费',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COMMENT='商品盲盒';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_blind_box_order`
--

LOCK TABLES `store_blind_box_order` WRITE;
/*!40000 ALTER TABLE `store_blind_box_order` DISABLE KEYS */;
INSERT INTO `store_blind_box_order` VALUES (1,34,'202206230015533587',1,4,'任天堂Switch保护壳游戏机保护套分布式收纳整理包','https://img.easyshop.org.cn/base/tmp/e9db140ad26c48b59fda05e0a229b053.png','1',0.01,'',1,39.90,'','',NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'2022-06-23 00:15:53',8.00,'2022-06-23 00:15:53','2022-06-23 00:15:53'),(2,34,'202206230021170398',1,4,'任天堂Switch保护壳游戏机保护套分布式收纳整理包','https://img.easyshop.org.cn/base/tmp/e9db140ad26c48b59fda05e0a229b053.png','1',0.01,'',1,39.90,'','',NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'2022-06-23 00:21:17',8.00,'2022-06-23 00:21:17','2022-06-23 00:21:17'),(3,20,'202206230106254370',2,1,'蓝牙音箱哈曼卡顿低音炮蓝牙小音箱Mini版无线蓝牙','https://img.easyshop.org.cn/base/tmp/7bafb95a9642e28ed8dbc53d9ccb1506.png','1',0.01,'',1,49.90,'','',NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'2022-06-23 01:06:25',8.00,'2022-06-23 01:06:25','2022-06-23 01:06:25'),(4,34,'202206230107499959',1,4,'任天堂Switch保护壳游戏机保护套分布式收纳整理包','https://img.easyshop.org.cn/base/tmp/e9db140ad26c48b59fda05e0a229b053.png','3',0.01,'',1,39.90,'陈广惠','13035809409',NULL,0,0,NULL,'广东省广州市天河区123',NULL,NULL,'2022-06-23 01:08:04',NULL,'2022-06-23 01:07:49',8.00,'2022-06-23 01:07:49','2022-06-23 01:22:53'),(5,34,'202206230124457217',1,4,'任天堂Switch保护壳游戏机保护套分布式收纳整理包','https://img.easyshop.org.cn/base/tmp/e9db140ad26c48b59fda05e0a229b053.png','3',0.01,'',1,39.90,'陈广惠','13035809409',NULL,0,0,NULL,'广东省广州市天河区123',NULL,NULL,'2022-06-23 01:24:53',NULL,'2022-06-23 01:24:45',8.00,'2022-06-23 01:24:45','2022-06-23 13:41:49'),(6,34,'202206230157310242',2,1,'蓝牙音箱哈曼卡顿低音炮蓝牙小音箱Mini版无线蓝牙','https://img.easyshop.org.cn/base/tmp/7bafb95a9642e28ed8dbc53d9ccb1506.png','3',0.01,'',1,49.90,'陈广惠','13035809409',NULL,0,0,NULL,'广东省广州市天河区123',NULL,NULL,'2022-06-23 01:57:38',NULL,'2022-06-23 01:57:31',8.00,'2022-06-23 01:57:31','2022-06-23 01:57:54'),(7,34,'202206241612071850',1,4,'任天堂Switch保护壳游戏机保护套分布式收纳整理包','https://img.easyshop.org.cn/base/tmp/e9db140ad26c48b59fda05e0a229b053.png','3',0.01,'',1,39.90,'陈广惠','13035809409',NULL,0,0,NULL,'广东省广州市天河区123',NULL,NULL,'2022-06-24 16:12:14',NULL,'2022-06-24 16:12:07',8.00,'2022-06-24 16:12:07','2022-06-24 16:12:40'),(8,34,'202206250004335261',3,2,'便携式移动灰缸随身携带户外开车旅行免弹','https://img.easyshop.org.cn/material/tmp/微信图片_20220620225506.jpg','1',19.90,'',1,68.90,'','',NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'2022-06-25 00:04:33',8.00,'2022-06-25 00:04:33','2022-06-25 00:04:33'),(9,34,'202206250004494218',3,2,'便携式移动灰缸随身携带户外开车旅行免弹','https://img.easyshop.org.cn/material/tmp/微信图片_20220620225506.jpg','1',19.90,'',1,68.90,'','',NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'2022-06-25 00:04:49',8.00,'2022-06-25 00:04:49','2022-06-25 00:04:49'),(10,2,'202206261808496513',4,4,'Apple/苹果[新品]2021款M1芯片iPad Pro 11英寸','https://img.easyshop.org.cn/material/tmp/微信图片_20220624224742.jpg','1',19.90,'',1,5899.00,'','',NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'2022-06-26 18:08:49',8.00,'2022-06-26 18:08:49','2022-06-26 18:08:49'),(11,2,'202206261808502935',2,3,'蓝牙音箱哈曼卡顿低音炮蓝牙小音箱Mini版无线蓝牙','https://img.easyshop.org.cn/base/tmp/微信图片_20220528102838.jpg','1',19.90,'',1,49.90,'','',NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'2022-06-26 18:08:50',8.00,'2022-06-26 18:08:50','2022-06-26 18:08:50'),(12,34,'202206262326255537',1,4,'任天堂Switch保护壳游戏机保护套分布式收纳整理包','https://img.easyshop.org.cn/base/tmp/e9db140ad26c48b59fda05e0a229b053.png','1',0.01,'',1,39.90,'','',NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'2022-06-26 23:26:25',8.00,'2022-06-26 23:26:25','2022-06-26 23:26:25'),(13,34,'202206262327493909',1,4,'任天堂Switch保护壳游戏机保护套分布式收纳整理包','https://img.easyshop.org.cn/base/tmp/e9db140ad26c48b59fda05e0a229b053.png','1',0.01,'',1,39.90,'','',NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'2022-06-26 23:27:49',8.00,'2022-06-26 23:27:49','2022-06-26 23:27:49'),(14,34,'202206270118597199',1,4,'任天堂Switch保护壳游戏机保护套分布式收纳整理包','https://img.easyshop.org.cn/base/tmp/e9db140ad26c48b59fda05e0a229b053.png','3',0.01,'',1,39.90,'陈广惠','13035809409',NULL,0,0,NULL,'广东省广州市天河区123',NULL,NULL,'2022-06-27 01:19:16',NULL,'2022-06-27 01:18:59',8.00,'2022-06-27 01:18:59','2022-06-27 01:20:01'),(15,34,'202206270121313306',2,1,'蓝牙音箱哈曼卡顿低音炮蓝牙小音箱Mini版无线蓝牙','https://img.easyshop.org.cn/base/tmp/7bafb95a9642e28ed8dbc53d9ccb1506.png','3',0.01,'',1,49.90,'陈广惠','13035809409',NULL,0,0,NULL,'广东省广州市天河区123',NULL,NULL,'2022-06-27 01:21:43',NULL,'2022-06-27 01:21:31',8.00,'2022-06-27 01:21:31','2022-06-27 01:22:17'),(16,34,'202206272319587549',2,2,'蓝牙音箱哈曼卡顿低音炮蓝牙小音箱Mini版无线蓝牙（测试）','https://img.easyshop.org.cn/material/tmp/7bafb95a9642e28ed8dbc53d9ccb1506.png','1',9.90,'',1,1.00,'','',NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'2022-06-27 23:19:58',8.00,'2022-06-27 23:19:58','2022-06-27 23:19:58'),(17,34,'202206272320381381',4,4,'Apple/苹果2021款M1芯片iPad Pro 11英寸（测试）','https://img.easyshop.org.cn/material/tmp/20220624224714.png','2',0.01,'',1,1.00,'','',NULL,0,0,NULL,NULL,NULL,NULL,'2022-06-27 23:20:45',NULL,'2022-06-27 23:20:38',8.00,'2022-06-27 23:20:38','2022-06-27 23:20:45');
/*!40000 ALTER TABLE `store_blind_box_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_blind_box_rule`
--

DROP TABLE IF EXISTS `store_blind_box_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_blind_box_rule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `blind_box_id` bigint(20) DEFAULT NULL COMMENT '盲盒Id',
  `goods_id` bigint(20) DEFAULT NULL COMMENT '关联商品id',
  `title` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '简称',
  `rule_type` int(11) DEFAULT NULL COMMENT '规则类型:1、隐藏款 2、稀有 3、史诗 4、传说',
  `goods_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '商品价格',
  `draw_num` int(11) NOT NULL DEFAULT '0' COMMENT '抽中人数',
  `gift_point` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '奖励积分',
  `gift_growth` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '奖励成长值',
  `goods_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '商品名称',
  `goods_thumb` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '商品主图无底色',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `inx_rule_type` (`rule_type`,`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COMMENT='商品盲盒规则表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_blind_box_rule`
--

LOCK TABLES `store_blind_box_rule` WRITE;
/*!40000 ALTER TABLE `store_blind_box_rule` DISABLE KEYS */;
INSERT INTO `store_blind_box_rule` VALUES (1,1,2,'蓝牙小音箱',1,49.90,0,0,0,'蓝牙音箱哈曼卡顿低音炮蓝牙小音箱Mini版无线蓝牙','https://img.easyshop.org.cn/base/tmp/7bafb95a9642e28ed8dbc53d9ccb1506.png','2022-06-14 01:01:40','2022-06-18 02:19:48'),(2,1,1,'Switch保护壳',4,39.90,0,0,0,'任天堂Switch保护壳游戏机保护套分布式收纳整理包','https://img.easyshop.org.cn/base/tmp/e9db140ad26c48b59fda05e0a229b053.png','2022-06-14 01:01:40','2022-06-18 02:19:38'),(3,2,4,'iPad Pro 1',4,5899.00,0,0,0,'Apple/苹果[新品]2021款M1芯片iPad Pro 11英寸','https://img.easyshop.org.cn/material/tmp/微信图片_20220624224742.jpg','2022-06-25 00:04:05','2022-06-25 00:04:05'),(4,2,3,'便携式移动灰缸',2,68.90,0,0,0,'便携式移动灰缸随身携带户外开车旅行免弹','https://img.easyshop.org.cn/material/tmp/微信图片_20220620225506.jpg','2022-06-25 00:04:05','2022-06-25 00:04:05'),(5,2,2,'低音炮蓝牙音箱',3,49.90,0,0,0,'蓝牙音箱哈曼卡顿低音炮蓝牙小音箱Mini版无线蓝牙','https://img.easyshop.org.cn/base/tmp/微信图片_20220528102838.jpg','2022-06-25 00:04:05','2022-06-25 00:04:05'),(6,2,1,'Switch保护壳',1,39.90,0,0,0,'任天堂Switch保护壳游戏机保护套分布式收纳整理包','https://img.easyshop.org.cn/base/tmp/微信图片_20220513233626.jpg','2022-06-25 00:04:05','2022-06-25 00:04:05'),(7,3,4,'iPad Pro',4,1.00,0,0,0,'Apple/苹果2021款M1芯片iPad Pro 11英寸（测试）','https://img.easyshop.org.cn/material/tmp/20220624224714.png','2022-06-27 22:48:59','2022-06-27 23:15:32'),(8,3,3,'便携式移动灰缸',4,1.00,0,0,0,'便携式移动灰缸随身携带户外开车旅行免弹（测试）','https://img.easyshop.org.cn/material/tmp/elper-removebg-preview.png','2022-06-27 22:48:59','2022-06-27 23:15:32'),(9,3,2,'蓝牙小音箱',3,1.00,0,0,0,'蓝牙音箱哈曼卡顿低音炮蓝牙小音箱Mini版无线蓝牙（测试）','https://img.easyshop.org.cn/material/tmp/7bafb95a9642e28ed8dbc53d9ccb1506.png','2022-06-27 22:48:59','2022-06-27 23:15:32'),(10,3,1,'Switch保护壳',1,1.00,0,0,0,'任天堂Switch保护壳游戏机保护套分布式收纳整理包（测试）','https://img.easyshop.org.cn/material/tmp/e9db140ad26c48b59fda05e0a229b053.png','2022-06-27 22:48:59','2022-06-27 23:15:32'),(11,4,4,'iPad Pro',4,1.00,0,0,0,'Apple/苹果2021款M1芯片iPad Pro 11英寸（测试）','https://img.easyshop.org.cn/material/tmp/20220624224714.png','2022-06-27 22:49:53','2022-06-27 23:16:15'),(12,4,3,'便携式移动灰缸',3,1.00,0,0,0,'便携式移动灰缸随身携带户外开车旅行免弹（测试）','https://img.easyshop.org.cn/material/tmp/elper-removebg-preview.png','2022-06-27 22:49:53','2022-06-27 23:16:15'),(13,4,2,'蓝牙小音箱',2,1.00,0,0,0,'蓝牙音箱哈曼卡顿低音炮蓝牙小音箱Mini版无线蓝牙（测试）','https://img.easyshop.org.cn/material/tmp/7bafb95a9642e28ed8dbc53d9ccb1506.png','2022-06-27 22:49:53','2022-06-27 23:16:15'),(14,4,1,'Switch保护壳',1,1.00,0,0,0,'任天堂Switch保护壳游戏机保护套分布式收纳整理包（测试）','https://img.easyshop.org.cn/material/tmp/e9db140ad26c48b59fda05e0a229b053.png','2022-06-27 22:49:53','2022-06-27 23:16:15'),(15,6,4,'iPad Pro',4,5899.00,0,0,0,'Apple/苹果[新品]2021款M1芯片iPad Pro 11英寸','https://img.easyshop.org.cn/material/tmp/微信图片_20220624224742.jpg','2022-06-27 22:50:49','2022-06-27 23:14:28'),(16,6,3,'便携式移动灰',3,68.90,0,0,0,'便携式移动灰缸随身携带户外开车旅行免弹','https://img.easyshop.org.cn/material/tmp/微信图片_20220620225506.jpg','2022-06-27 22:50:49','2022-06-27 23:14:28'),(17,6,2,'蓝牙小音箱',2,49.90,0,0,0,'蓝牙音箱哈曼卡顿低音炮蓝牙小音箱Mini版无线蓝牙','https://img.easyshop.org.cn/base/tmp/微信图片_20220528102838.jpg','2022-06-27 22:50:49','2022-06-27 23:14:28'),(18,6,1,'Switch保护壳',1,39.90,0,0,0,'任天堂Switch保护壳游戏机保护套分布式收纳整理包','https://img.easyshop.org.cn/base/tmp/微信图片_20220513233626.jpg','2022-06-27 22:50:49','2022-06-27 23:14:28'),(19,5,4,'iPad Pro',4,1.00,0,0,0,'Apple/苹果2021款M1芯片iPad Pro 11英寸（测试）','https://img.easyshop.org.cn/material/tmp/20220624224714.png','2022-06-27 22:51:18','2022-06-27 23:16:47'),(20,5,3,'便携式移动灰缸',3,1.00,0,0,0,'便携式移动灰缸随身携带户外开车旅行免弹（测试）','https://img.easyshop.org.cn/material/tmp/elper-removebg-preview.png','2022-06-27 22:51:18','2022-06-27 23:16:47'),(21,5,2,'蓝牙小音箱',2,1.00,0,0,0,'蓝牙音箱哈曼卡顿低音炮蓝牙小音箱Mini版无线蓝牙（测试）','https://img.easyshop.org.cn/material/tmp/7bafb95a9642e28ed8dbc53d9ccb1506.png','2022-06-27 22:51:18','2022-06-27 23:16:47'),(22,5,1,'Switch保护壳',1,1.00,0,0,0,'任天堂Switch保护壳游戏机保护套分布式收纳整理包（测试）','https://img.easyshop.org.cn/material/tmp/e9db140ad26c48b59fda05e0a229b053.png','2022-06-27 22:51:18','2022-06-27 23:16:47');
/*!40000 ALTER TABLE `store_blind_box_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_cart`
--

DROP TABLE IF EXISTS `store_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_cart` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `goods_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '商品名称',
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品id',
  `spec_sku_id` varchar(255) NOT NULL DEFAULT '0' COMMENT '商品sku记录索引 (由规格id组成)',
  `goods_no` varchar(100) NOT NULL DEFAULT '' COMMENT '商品编码',
  `goods_thumb` varchar(100) NOT NULL DEFAULT '' COMMENT '商品封面',
  `goods_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '商品价格',
  `line_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '商品划线价',
  `number` int(10) unsigned NOT NULL COMMENT '购买数量',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='购物车';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_cart`
--

LOCK TABLES `store_cart` WRITE;
/*!40000 ALTER TABLE `store_cart` DISABLE KEYS */;
INSERT INTO `store_cart` VALUES (27,2,'任天堂Switch保护壳游戏机保护套分布式收纳整理包',1,'1,3','123','https://img.easyshop.org.cn/base/tmp/微信图片_20220513233637.jpg',0.01,68.45,1,'2022-05-27 23:27:01','2022-05-27 23:27:01'),(48,16,'任天堂Switch保护壳游戏机保护套分布式收纳整理包',1,'4,3','123','https://img.easyshop.org.cn/base/tmp/微信图片_20220513233637.jpg',0.01,68.45,1,'2022-05-31 16:40:04','2022-05-31 16:40:04'),(49,18,'蓝牙音箱哈曼卡顿低音炮蓝牙小音箱Mini版无线蓝牙支持内存卡/USB',2,'6','231465','https://img.easyshop.org.cn/base/tmp/微信图片_20220528102946.jpg',32.80,48.60,1,'2022-05-31 18:50:13','2022-05-31 18:50:13'),(56,25,'任天堂Switch保护壳游戏机保护套分布式收纳整理包',1,'5,3','123','https://img.easyshop.org.cn/base/tmp/微信图片_20220513233626.jpg',0.01,68.45,2,'2022-06-01 23:20:20','2022-06-01 23:20:20'),(62,13,'任天堂Switch保护壳游戏机保护套分布式收纳整理包',1,'1,2','123','https://img.easyshop.org.cn/base/tmp/微信图片_20220513233626.jpg',0.01,68.45,1,'2022-06-11 01:28:41','2022-06-11 01:28:41'),(64,1,'任天堂Switch保护壳游戏机保护套分布式收纳整理包',1,'1,2','123','https://img.easyshop.org.cn/base/tmp/微信图片_20220513233626.jpg',0.01,68.45,1,'2022-06-15 18:32:21','2022-06-15 18:32:21'),(69,34,'便携式移动灰缸随身携带户外开车旅行免弹',3,'9','0','https://img.easyshop.org.cn/base/tmp/微信图片_20220620225430.jpg',68.90,88.90,1,'2022-06-27 01:20:26','2022-06-27 01:22:43'),(71,34,'Apple/苹果2021款M1芯片iPad Pro 11英寸（测试）',4,'10,11,12','0','https://img.easyshop.org.cn/base/tmp/微信图片_20220624224723.jpg',1.00,7899.00,1,'2022-06-27 22:55:50','2022-06-27 22:55:50');
/*!40000 ALTER TABLE `store_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_category`
--

DROP TABLE IF EXISTS `store_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '父级Id',
  `name` varchar(150) NOT NULL DEFAULT '' COMMENT '名称',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态：0 、启用, 1、关闭',
  `goods_ids` text,
  `thumb` text NOT NULL COMMENT '图片地址',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='分类管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_category`
--

LOCK TABLES `store_category` WRITE;
/*!40000 ALTER TABLE `store_category` DISABLE KEYS */;
INSERT INTO `store_category` VALUES (1,0,'美妆个护',1,NULL,'[{\"name\":\"37c63354ee2be2849b42b7338813806c.png\",\"url\":\"https:\\/\\/img.easyshop.org.cn\\/base\\/tmp\\/37c63354ee2be2849b42b7338813806c.png\"}]','2022-05-13 23:49:27','2022-05-13 15:49:27'),(2,0,'日用百货',1,NULL,'[{\"name\":\"37c63354ee2be2849b42b7338813806c.png\",\"url\":\"https:\\/\\/img.easyshop.org.cn\\/base\\/tmp\\/37c63354ee2be2849b42b7338813806c.png\"}]','2022-05-13 23:49:52','2022-05-13 15:49:52'),(3,0,'运动户外',1,NULL,'[{\"name\":\"37c63354ee2be2849b42b7338813806c.png\",\"url\":\"https:\\/\\/img.easyshop.org.cn\\/base\\/tmp\\/37c63354ee2be2849b42b7338813806c.png\"}]','2022-05-13 23:50:06','2022-05-13 15:50:06'),(4,0,'服饰鞋包',1,NULL,'[{\"name\":\"37c63354ee2be2849b42b7338813806c.png\",\"url\":\"https:\\/\\/img.easyshop.org.cn\\/base\\/tmp\\/37c63354ee2be2849b42b7338813806c.png\"}]','2022-05-13 23:50:20','2022-05-13 15:50:20'),(5,0,'数码家电',1,NULL,'[{\"name\":\"37c63354ee2be2849b42b7338813806c.png\",\"url\":\"https:\\/\\/img.easyshop.org.cn\\/base\\/tmp\\/37c63354ee2be2849b42b7338813806c.png\"}]','2022-05-13 23:50:33','2022-05-13 15:50:33'),(6,0,'母婴童装',1,NULL,'[{\"name\":\"37c63354ee2be2849b42b7338813806c.png\",\"url\":\"https:\\/\\/img.easyshop.org.cn\\/base\\/tmp\\/37c63354ee2be2849b42b7338813806c.png\"}]','2022-05-13 23:50:51','2022-05-13 15:50:51'),(7,0,'美食餐饮',0,NULL,'[{\"name\":\"37c63354ee2be2849b42b7338813806c.png\",\"url\":\"https:\\/\\/img.easyshop.org.cn\\/base\\/tmp\\/37c63354ee2be2849b42b7338813806c.png\",\"uid\":1654060595481,\"status\":\"success\"}]','2022-05-13 23:51:11','2022-06-01 05:16:37'),(8,0,'生活服务',1,NULL,'[{\"name\":\"37c63354ee2be2849b42b7338813806c.png\",\"url\":\"https:\\/\\/img.easyshop.org.cn\\/base\\/tmp\\/37c63354ee2be2849b42b7338813806c.png\"}]','2022-05-13 23:51:35','2022-05-13 15:51:35'),(9,0,'家居家装',1,NULL,'[{\"name\":\"37c63354ee2be2849b42b7338813806c.png\",\"url\":\"https:\\/\\/img.easyshop.org.cn\\/base\\/tmp\\/37c63354ee2be2849b42b7338813806c.png\"}]','2022-05-13 23:51:53','2022-05-13 15:51:53'),(10,1,'香水',1,NULL,'[{\"name\":\"8ca0cd5d2f427c4238653bce7244cedd (1).png\",\"url\":\"https:\\/\\/img.easyshop.org.cn\\/base\\/tmp\\/8ca0cd5d2f427c4238653bce7244cedd (1).png\",\"uid\":1653706083184,\"status\":\"success\"}]','2022-05-13 23:52:20','2022-05-28 02:48:05'),(11,1,'粉底/粉饼',1,NULL,'[{\"name\":\"de3814d091d698d72e44cf394c3d1c29.png\",\"url\":\"https:\\/\\/img.easyshop.org.cn\\/base\\/tmp\\/de3814d091d698d72e44cf394c3d1c29.png\",\"uid\":1653706152256,\"status\":\"success\"}]','2022-05-13 23:52:58','2022-05-28 02:49:14'),(12,1,'口红/唇膏',1,NULL,'[{\"name\":\"2cf1df8f64835b9380e683135ed6e5b1.png\",\"url\":\"https:\\/\\/img.easyshop.org.cn\\/base\\/tmp\\/2cf1df8f64835b9380e683135ed6e5b1.png\",\"uid\":1653708073181,\"status\":\"success\"}]','2022-05-13 23:53:27','2022-05-28 03:21:15'),(13,1,'腮红',1,',2,1','[{\"name\":\"f4589ca4475d9a150bbd536ada60e699.png\",\"url\":\"https:\\/\\/img.easyshop.org.cn\\/base\\/tmp\\/f4589ca4475d9a150bbd536ada60e699.png\",\"uid\":1653708218502,\"status\":\"success\"}]','2022-05-13 23:53:47','2022-05-28 03:23:41'),(14,1,'睫毛膏',1,NULL,'[{\"name\":\"32357957d0018d590490e75f4ce378dd (2).png\",\"url\":\"https:\\/\\/img.easyshop.org.cn\\/base\\/tmp\\/32357957d0018d590490e75f4ce378dd (2).png\",\"uid\":1653708269462,\"status\":\"success\"}]','2022-05-13 23:54:05','2022-05-28 03:24:31'),(15,2,'衣物清洁',1,NULL,'[{\"name\":\"5a2343251cf739b2a6cb8a903a8d73eb.png\",\"url\":\"https:\\/\\/img.easyshop.org.cn\\/base\\/tmp\\/5a2343251cf739b2a6cb8a903a8d73eb.png\",\"uid\":1653707299400,\"status\":\"success\"}]','2022-05-13 23:54:33','2022-05-28 03:08:21'),(16,3,'运动鞋',1,NULL,'[{\"name\":\"da654cf492b7483467bdafca9434b1f1.png\",\"url\":\"https:\\/\\/img.easyshop.org.cn\\/base\\/tmp\\/da654cf492b7483467bdafca9434b1f1.png\",\"uid\":1653707971430,\"status\":\"success\"}]','2022-05-13 23:56:33','2022-05-28 03:19:33'),(17,3,'运动服',1,NULL,'[{\"name\":\"c96fabcd6fe84d4cfdeb1a6f9257e956.png\",\"url\":\"https:\\/\\/img.easyshop.org.cn\\/base\\/tmp\\/c96fabcd6fe84d4cfdeb1a6f9257e956.png\",\"uid\":1653707905280,\"status\":\"success\"}]','2022-05-13 23:56:57','2022-05-28 03:18:26'),(18,3,'运动配件',1,NULL,'[{\"name\":\"e76a6835ca3289278e24c31a3c01c600.png\",\"url\":\"https:\\/\\/img.easyshop.org.cn\\/base\\/tmp\\/e76a6835ca3289278e24c31a3c01c600.png\",\"uid\":1653707937923,\"status\":\"success\"}]','2022-05-13 23:57:10','2022-05-28 03:18:59'),(19,3,'体育用品',1,NULL,'[{\"name\":\"e6e6552250742116e7f5a53fce6c8be0.png\",\"url\":\"https:\\/\\/img.easyshop.org.cn\\/base\\/tmp\\/e6e6552250742116e7f5a53fce6c8be0.png\",\"uid\":1653707953024,\"status\":\"success\"}]','2022-05-13 23:57:27','2022-05-28 03:19:15'),(20,3,'骑行装备',1,NULL,'[{\"name\":\"54c336cdb1e583fc7a4e9c3a6dbe2a73.png\",\"url\":\"https:\\/\\/img.easyshop.org.cn\\/base\\/tmp\\/54c336cdb1e583fc7a4e9c3a6dbe2a73.png\",\"uid\":1653707919743,\"status\":\"success\"}]','2022-05-13 23:57:42','2022-05-28 03:18:41'),(21,3,'男装',1,NULL,'[{\"name\":\"d8398d589731cf621a010323f4e4a492.png\",\"url\":\"https:\\/\\/img.easyshop.org.cn\\/base\\/tmp\\/d8398d589731cf621a010323f4e4a492.png\",\"uid\":1653707879073,\"status\":\"success\"}]','2022-05-13 23:58:00','2022-05-28 03:17:59'),(22,3,'女装',1,NULL,'[{\"name\":\"8a5277ec4005783ee5814d553779cc75.png\",\"url\":\"https:\\/\\/img.easyshop.org.cn\\/base\\/tmp\\/8a5277ec4005783ee5814d553779cc75.png\",\"uid\":1653707854147,\"status\":\"success\"}]','2022-05-13 23:58:12','2022-05-28 03:17:35'),(23,4,'内衣/配饰',0,NULL,'[{\"name\":\"37c63354ee2be2849b42b7338813806c.png\",\"url\":\"https:\\/\\/img.easyshop.org.cn\\/base\\/tmp\\/37c63354ee2be2849b42b7338813806c.png\",\"uid\":1653707028355,\"status\":\"success\"}]','2022-05-13 23:58:34','2022-05-28 03:03:50'),(24,4,'功能箱包',1,NULL,'[{\"name\":\"40d350fe499c52286d705cc7686edfcb.png\",\"url\":\"https:\\/\\/img.easyshop.org.cn\\/base\\/tmp\\/40d350fe499c52286d705cc7686edfcb.png\",\"uid\":1653707838438,\"status\":\"success\"}]','2022-05-13 23:58:53','2022-05-28 03:17:20'),(25,4,'厨卫电器',1,NULL,'[{\"name\":\"b48d69da0f7998040cba70b74754beff.png\",\"url\":\"https:\\/\\/img.easyshop.org.cn\\/base\\/tmp\\/b48d69da0f7998040cba70b74754beff.png\",\"uid\":1653707824314,\"status\":\"success\"}]','2022-05-13 23:59:16','2022-05-28 03:17:06'),(26,4,'生活电器',1,NULL,'[{\"name\":\"313382e87b3520fe052494d1f52cf907.png\",\"url\":\"https:\\/\\/img.easyshop.org.cn\\/base\\/tmp\\/313382e87b3520fe052494d1f52cf907.png\",\"uid\":1653707804810,\"status\":\"success\"}]','2022-05-13 23:59:27','2022-05-28 03:16:47'),(27,5,'手机配件',1,NULL,'[{\"name\":\"7e431b6c96b5e017090a0298c7e6392c.png\",\"url\":\"https:\\/\\/img.easyshop.org.cn\\/base\\/tmp\\/7e431b6c96b5e017090a0298c7e6392c.png\",\"uid\":1653707791527,\"status\":\"success\"}]','2022-05-13 23:59:41','2022-05-28 03:16:33'),(28,5,'影音娱乐',1,NULL,'[{\"name\":\"504f5dafee313ff4c9a2dacb72195a9a.png\",\"url\":\"https:\\/\\/img.easyshop.org.cn\\/base\\/tmp\\/504f5dafee313ff4c9a2dacb72195a9a.png\",\"uid\":1653707777820,\"status\":\"success\"}]','2022-05-14 00:00:21','2022-05-28 03:16:19'),(29,6,'玩具',1,NULL,'[{\"name\":\"852a961b5c8f7690b68892a23d6cbff7.png\",\"url\":\"https:\\/\\/img.easyshop.org.cn\\/base\\/tmp\\/852a961b5c8f7690b68892a23d6cbff7.png\",\"uid\":1653707765405,\"status\":\"success\"}]','2022-05-14 00:00:37','2022-05-28 03:16:05'),(30,6,'营养辅食',0,NULL,'[{\"name\":\"37c63354ee2be2849b42b7338813806c.png\",\"url\":\"https:\\/\\/img.easyshop.org.cn\\/base\\/tmp\\/37c63354ee2be2849b42b7338813806c.png\",\"uid\":1653706850285,\"status\":\"success\"}]','2022-05-14 00:00:57','2022-05-28 03:00:52'),(31,6,'洗护喂养',0,NULL,'[{\"name\":\"37c63354ee2be2849b42b7338813806c.png\",\"url\":\"https:\\/\\/img.easyshop.org.cn\\/base\\/tmp\\/37c63354ee2be2849b42b7338813806c.png\",\"uid\":1653706842926,\"status\":\"success\"}]','2022-05-14 00:01:18','2022-05-28 03:00:44'),(32,7,'奶粉',1,',2,1','[{\"name\":\"3ee8e93ba9057c70581f4acc5cb20103.png\",\"url\":\"https:\\/\\/img.easyshop.org.cn\\/base\\/tmp\\/3ee8e93ba9057c70581f4acc5cb20103.png\",\"uid\":1653707750691,\"status\":\"success\"}]','2022-05-14 00:01:34','2022-05-28 03:15:52');
/*!40000 ALTER TABLE `store_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_coupon`
--

DROP TABLE IF EXISTS `store_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_coupon` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL COMMENT '名称',
  `coupon_type` varchar(255) NOT NULL COMMENT '优惠券类型：1直减现金券2满减现金券',
  `coupon_amount` decimal(22,2) NOT NULL COMMENT '优惠金额',
  `full_amount` decimal(22,2) DEFAULT NULL COMMENT '满减金额',
  `grant_start_time` datetime NOT NULL COMMENT '发放开始时间',
  `grant_end_time` datetime NOT NULL COMMENT '发放结束时间',
  `ref_ids` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '关联id',
  `effective_start_time` datetime NOT NULL COMMENT '生效时间',
  `effective_end_time` datetime NOT NULL COMMENT '失效时间',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态:1、已提交;2、启用;3、发放中;4、暂停;5、结束;',
  `quantity` int(11) NOT NULL DEFAULT '0' COMMENT '发放数量',
  `remark` varchar(120) DEFAULT NULL COMMENT '优惠券描述',
  `repeat_quantity` varchar(255) NOT NULL DEFAULT '1' COMMENT '每人可重复领取数量',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `inx_coupon_type` (`coupon_type`(191)),
  KEY `inx_status` (`status`),
  KEY `inx_grant_end_time` (`grant_end_time`),
  KEY `inx_grant_start_time` (`grant_start_time`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='优惠券模板表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_coupon`
--

LOCK TABLES `store_coupon` WRITE;
/*!40000 ALTER TABLE `store_coupon` DISABLE KEYS */;
INSERT INTO `store_coupon` VALUES (1,'全品类优惠券','2',12.00,100.00,'2022-05-26 00:00:00','2022-06-27 00:00:00','2,1','2022-05-26 00:00:00','2022-06-27 23:59:59',0,10,'该平台下所有商品可用','1','2022-05-26 00:46:21','2022-06-25 22:17:04');
/*!40000 ALTER TABLE `store_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_coupon_rule`
--

DROP TABLE IF EXISTS `store_coupon_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_coupon_rule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rule_type` int(11) DEFAULT NULL COMMENT '规则类型:1针对商品2针对类目',
  `ref_id` bigint(20) DEFAULT NULL COMMENT '关联id',
  `ref_desc` varchar(255) DEFAULT NULL COMMENT '关联描述:如商品，类目',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `inx_rule_type` (`rule_type`,`ref_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='优惠券规则表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_coupon_rule`
--

LOCK TABLES `store_coupon_rule` WRITE;
/*!40000 ALTER TABLE `store_coupon_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `store_coupon_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_coupon_user`
--

DROP TABLE IF EXISTS `store_coupon_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_coupon_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(200) NOT NULL COMMENT '名称',
  `uid` int(11) DEFAULT NULL COMMENT '用户id',
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_type` int(11) DEFAULT NULL COMMENT '优惠类型',
  `code_no` varchar(10) DEFAULT NULL COMMENT '优惠券编码',
  `coupon_amount` decimal(22,2) DEFAULT '0.00' COMMENT '优惠金额',
  `full_amount` decimal(22,2) DEFAULT '0.00' COMMENT '满减金额',
  `effective_start_time` datetime DEFAULT NULL COMMENT '生效时间',
  `effective_end_time` datetime DEFAULT NULL COMMENT '失效时间',
  `status` int(11) DEFAULT '0' COMMENT '状态：-1已作废 0待使用 1已使用 2已过期',
  `use_time` datetime DEFAULT NULL COMMENT '使用时间',
  `remark` varchar(120) DEFAULT NULL COMMENT '优惠券描述',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `inx_user_id` (`uid`),
  KEY `inx_coupon_id` (`coupon_id`),
  KEY `inx_coupon_type` (`coupon_type`),
  KEY `inx_status` (`status`),
  KEY `inx_effective_end_time` (`effective_end_time`),
  KEY `inx_use_time` (`use_time`),
  KEY `inx_code` (`code_no`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='用户优惠券表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_coupon_user`
--

LOCK TABLES `store_coupon_user` WRITE;
/*!40000 ALTER TABLE `store_coupon_user` DISABLE KEYS */;
INSERT INTO `store_coupon_user` VALUES (1,'全品类优惠券',NULL,1,2,'EYaEiE18',12.00,100.00,'2022-05-26 00:00:00','2022-06-27 23:59:59',0,NULL,'该平台下所有商品可用','2022-06-01 01:14:51','2022-06-01 01:14:51'),(2,'全品类优惠券',1,1,2,'YVFBtezW',12.00,100.00,'2022-05-26 00:00:00','2022-06-27 23:59:59',0,NULL,'该平台下所有商品可用','2022-06-01 13:18:05','2022-06-01 13:18:05'),(3,'全品类优惠券',34,1,2,'LNiae8P9',12.00,100.00,'2022-05-26 00:00:00','2022-06-27 23:59:59',0,NULL,'该平台下所有商品可用','2022-06-20 00:55:06','2022-06-20 00:55:06');
/*!40000 ALTER TABLE `store_coupon_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_freight`
--

DROP TABLE IF EXISTS `store_freight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_freight` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(200) DEFAULT NULL COMMENT '模板名称',
  `ship_place` varchar(200) DEFAULT NULL COMMENT '发货地',
  `status` int(11) DEFAULT '0' COMMENT '状态[1、正常；2、关闭]',
  `postage_free` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '包邮地区',
  `delivery_area` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '配送区域',
  `not_delivery` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '不配送区域',
  `freight_type` int(11) DEFAULT '1' COMMENT '计费方式：1、按件数计费 2、按重量计费',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `index_name` (`name`(191)),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='快递模板';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_freight`
--

LOCK TABLES `store_freight` WRITE;
/*!40000 ALTER TABLE `store_freight` DISABLE KEYS */;
INSERT INTO `store_freight` VALUES (1,'全平台包邮','广东广州',0,'','吉林省,河北省,天津市,北京市,广东省','澳门特别行政区,香港特别行政区,台湾省',1,'2022-05-25 01:13:08','2022-06-06 23:35:47');
/*!40000 ALTER TABLE `store_freight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_freight_order`
--

DROP TABLE IF EXISTS `store_freight_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_freight_order` (
  `order_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `order_no` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '订单号',
  `related_id` int(10) unsigned NOT NULL COMMENT '关联订单id',
  `rule_type` int(11) DEFAULT NULL COMMENT '规则ID： 1、盲盒',
  `status` char(6) CHARACTER SET utf8 NOT NULL DEFAULT '1' COMMENT '订单状态[1、未付款，2、已付款]',
  `amount` decimal(8,2) DEFAULT '0.00' COMMENT '支付金额',
  `contact` char(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '收货人',
  `moblie` char(11) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '手机号码',
  `shipping_name` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '物流名称',
  `shipping_code` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '物流单号',
  `address` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '收货地址',
  `payment_time` datetime DEFAULT NULL COMMENT '付款时间',
  `create_time` datetime DEFAULT NULL COMMENT '订单创建时间',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COMMENT='邮费订单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_freight_order`
--

LOCK TABLES `store_freight_order` WRITE;
/*!40000 ALTER TABLE `store_freight_order` DISABLE KEYS */;
INSERT INTO `store_freight_order` VALUES (1,34,'YF202206230108176554',4,1,'2',0.01,'陈广惠','13035809409',NULL,NULL,'广东省广州市天河区123','2022-06-23 01:08:32','2022-06-23 01:08:17','2022-06-23 01:08:17','2022-06-23 01:08:32'),(2,34,'YF202206230121025919',4,1,'1',0.01,'陈广惠','13035809409',NULL,NULL,'广东省广州市天河区123',NULL,'2022-06-23 01:21:02','2022-06-23 01:21:02','2022-06-23 01:21:02'),(3,34,'YF202206230122453659',4,1,'2',0.01,'陈广惠','13035809409',NULL,NULL,'广东省广州市天河区123','2022-06-23 01:22:53','2022-06-23 01:22:45','2022-06-23 01:22:45','2022-06-23 01:22:53'),(4,34,'YF202206230157456364',6,1,'2',0.01,'陈广惠','13035809409',NULL,NULL,'广东省广州市天河区123','2022-06-23 01:57:54','2022-06-23 01:57:45','2022-06-23 01:57:45','2022-06-23 01:57:54'),(5,34,'YF202206231341403704',5,1,'2',0.01,'陈广惠','13035809409',NULL,NULL,'广东省广州市天河区123','2022-06-23 13:41:49','2022-06-23 13:41:40','2022-06-23 13:41:40','2022-06-23 13:41:49'),(6,34,'YF202206241612301895',7,1,'2',0.01,'陈广惠','13035809409',NULL,NULL,'广东省广州市天河区123','2022-06-24 16:12:40','2022-06-24 16:12:30','2022-06-24 16:12:30','2022-06-24 16:12:40'),(7,34,'YF202206270119464008',14,1,'2',0.01,'陈广惠','13035809409',NULL,NULL,'广东省广州市天河区123','2022-06-27 01:20:01','2022-06-27 01:19:46','2022-06-27 01:19:46','2022-06-27 01:20:01'),(8,34,'YF202206270122030646',15,1,'2',0.01,'陈广惠','13035809409',NULL,NULL,'广东省广州市天河区123','2022-06-27 01:22:17','2022-06-27 01:22:03','2022-06-27 01:22:03','2022-06-27 01:22:17');
/*!40000 ALTER TABLE `store_freight_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_freight_rule`
--

DROP TABLE IF EXISTS `store_freight_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_freight_rule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL COMMENT '地区名称',
  `freight_type` int(11) DEFAULT '1' COMMENT '计费方式：1、按件数计费 2、按重量计费',
  `freight_id` int(11) DEFAULT '0' COMMENT '关联id',
  `figure` int(11) DEFAULT NULL COMMENT '计算数量(件、重量)',
  `amount` decimal(22,2) DEFAULT '0.00' COMMENT '运费金额',
  `increase_figure` int(11) DEFAULT NULL COMMENT '增加计算数量(件、重量)',
  `increase_amount` decimal(22,2) DEFAULT '0.00' COMMENT '增加运费金额',
  `cond_figure` int(11) DEFAULT NULL COMMENT '条件（满多少包邮）',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_name` (`name`(191)),
  KEY `index_freight_id` (`freight_id`),
  KEY `index_freight_type` (`freight_type`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='地区快递模板';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_freight_rule`
--

LOCK TABLES `store_freight_rule` WRITE;
/*!40000 ALTER TABLE `store_freight_rule` DISABLE KEYS */;
INSERT INTO `store_freight_rule` VALUES (2,'吉林省',1,1,1,12.00,10,12.00,120,'2022-06-06 23:35:47','2022-06-06 23:35:47'),(3,'河北省',1,1,1,12.00,10,12.00,150,'2022-06-06 23:35:47','2022-06-06 23:35:47'),(4,'天津市',1,1,1,12.00,10,12.00,150,'2022-06-06 23:35:47','2022-06-06 23:35:47'),(5,'北京市',1,1,1,12.00,10,12.00,0,'2022-06-06 23:35:47','2022-06-06 23:35:47'),(6,'广东省',1,1,1,12.00,10,12.00,150,'2022-06-06 23:35:47','2022-06-06 23:35:47');
/*!40000 ALTER TABLE `store_freight_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_goods`
--

DROP TABLE IF EXISTS `store_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_goods` (
  `goods_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '商品名称',
  `title` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `freight_id` int(11) DEFAULT NULL COMMENT '运费模版id',
  `goods_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '商品价格',
  `line_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '商品划线价',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `status` int(11) DEFAULT '0' COMMENT '状态[0、待上架; 1、已上架; 2、下架]',
  `stock_num` int(11) DEFAULT NULL COMMENT '商品库存',
  `limit_num` int(11) DEFAULT '0' COMMENT '限购数量,0 则不限购',
  `goods_sales` int(11) DEFAULT '0' COMMENT '商品销量',
  `gift_growth` int(11) DEFAULT '0' COMMENT '赠送的成长值',
  `gift_point` int(11) DEFAULT '0' COMMENT '赠送的积分',
  `use_point_limit` int(11) DEFAULT '0' COMMENT '限制使用的积分数',
  `low_stock` int(11) DEFAULT '0' COMMENT '库存预警值',
  `service_ids` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '服务：1->无忧退货；2->快速退款；3->免费包邮',
  `promotion_start_time` datetime DEFAULT NULL COMMENT '促销开始时间',
  `promotion_end_time` datetime DEFAULT NULL COMMENT '促销结束时间',
  `promotion_per_limit` int(11) DEFAULT '0' COMMENT '活动限购数量',
  `goods_thumb` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '商品封面',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品内容',
  `md_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品内容',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `goods_cover` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '商品封面',
  `goods_no` char(18) DEFAULT NULL COMMENT '商品编号',
  `goods_type` int(11) NOT NULL DEFAULT '0' COMMENT '商品类型',
  `goods_video` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '商品视频封面',
  PRIMARY KEY (`goods_id`),
  KEY `index_goods_name` (`goods_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='商品';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_goods`
--

LOCK TABLES `store_goods` WRITE;
/*!40000 ALTER TABLE `store_goods` DISABLE KEYS */;
INSERT INTO `store_goods` VALUES (1,'任天堂Switch保护壳游戏机保护套分布式收纳整理包（测试）','',1,1.00,56.80,12,1,542,1,103,0,0,0,0,'快速退款,无忧退货,免费包邮',NULL,NULL,0,'[{\"name\":\"\\u5fae\\u4fe1\\u56fe\\u7247_20220513233626.jpg\",\"url\":\"https:\\/\\/img.easyshop.org.cn\\/base\\/tmp\\/\\u5fae\\u4fe1\\u56fe\\u7247_20220513233626.jpg\",\"uid\":1653412060990,\"status\":\"success\"},{\"name\":\"\\u5fae\\u4fe1\\u56fe\\u7247_20220513233637.jpg\",\"url\":\"https:\\/\\/img.easyshop.org.cn\\/base\\/tmp\\/\\u5fae\\u4fe1\\u56fe\\u7247_20220513233637.jpg\",\"uid\":1653412062983,\"status\":\"success\"},{\"name\":\"\\u5fae\\u4fe1\\u56fe\\u7247_20220513233641.jpg\",\"url\":\"https:\\/\\/img.easyshop.org.cn\\/base\\/tmp\\/\\u5fae\\u4fe1\\u56fe\\u7247_20220513233641.jpg\",\"uid\":1653412067212,\"status\":\"success\"},{\"name\":\"\\u5fae\\u4fe1\\u56fe\\u7247_20220513233644.jpg\",\"url\":\"https:\\/\\/img.easyshop.org.cn\\/base\\/tmp\\/\\u5fae\\u4fe1\\u56fe\\u7247_20220513233644.jpg\",\"uid\":1653412071718,\"status\":\"success\"},{\"name\":\"\\u5fae\\u4fe1\\u56fe\\u7247_20220513233647.jpg\",\"url\":\"https:\\/\\/img.easyshop.org.cn\\/base\\/tmp\\/\\u5fae\\u4fe1\\u56fe\\u7247_20220513233647.jpg\",\"uid\":1653412075001,\"status\":\"success\"},{\"name\":\"\\u5fae\\u4fe1\\u56fe\\u7247_20220513233649.jpg\",\"url\":\"https:\\/\\/img.easyshop.org.cn\\/base\\/tmp\\/\\u5fae\\u4fe1\\u56fe\\u7247_20220513233649.jpg\",\"uid\":1653412078384,\"status\":\"success\"},{\"name\":\"\\u5fae\\u4fe1\\u56fe\\u7247_20220513233652.jpg\",\"url\":\"https:\\/\\/img.easyshop.org.cn\\/base\\/tmp\\/\\u5fae\\u4fe1\\u56fe\\u7247_20220513233652.jpg\",\"uid\":1653412082856,\"status\":\"success\"},{\"name\":\"\\u5fae\\u4fe1\\u56fe\\u7247_20220513233655.jpg\",\"url\":\"https:\\/\\/img.easyshop.org.cn\\/base\\/tmp\\/\\u5fae\\u4fe1\\u56fe\\u7247_20220513233655.jpg\",\"uid\":1653412086471,\"status\":\"success\"},{\"name\":\"\\u5fae\\u4fe1\\u56fe\\u7247_20220513233658.jpg\",\"url\":\"https:\\/\\/img.easyshop.org.cn\\/base\\/tmp\\/\\u5fae\\u4fe1\\u56fe\\u7247_20220513233658.jpg\",\"uid\":1653412089551,\"status\":\"success\"}]','<p><img src=\"https://img.easyshop.org.cn/base/tmp/%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_20220513233703.jpg\" alt=\"微信图片_20220513233703.jpg\" /><img src=\"https://img.easyshop.org.cn/base/tmp/%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_20220513233700.jpg\" alt=\"微信图片_20220513233700.jpg\" /><img src=\"https://img.easyshop.org.cn/base/tmp/%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_20220513233709.jpg\" alt=\"微信图片_20220513233709.jpg\" /><img src=\"https://img.easyshop.org.cn/base/tmp/%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_20220513233713.jpg\" alt=\"微信图片_20220513233713.jpg\" /><img src=\"https://img.easyshop.org.cn/base/tmp/%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_20220513233724.jpg\" alt=\"微信图片_20220513233724.jpg\" /><img src=\"https://img.easyshop.org.cn/base/tmp/%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_20220513233729.jpg\" alt=\"微信图片_20220513233729.jpg\" /><img src=\"https://img.easyshop.org.cn/base/tmp/%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_20220513233721.jpg\" alt=\"微信图片_20220513233721.jpg\" /><img src=\"https://img.easyshop.org.cn/base/tmp/%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_20220513233732.jpg\" alt=\"微信图片_20220513233732.jpg\" /><img src=\"https://img.easyshop.org.cn/base/tmp/%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_20220513233715.jpg\" alt=\"微信图片_20220513233715.jpg\" /><img src=\"https://img.easyshop.org.cn/base/tmp/%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_20220513233718.jpg\" alt=\"微信图片_20220513233718.jpg\" /><img src=\"https://img.easyshop.org.cn/base/tmp/%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_20220513233726.jpg\" alt=\"微信图片_20220513233726.jpg\" /><img src=\"https://img.easyshop.org.cn/base/tmp/%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_20220513233734.jpg\" alt=\"微信图片_20220513233734.jpg\" /></p>','![微信图片_20220513233703.jpg](https://img.easyshop.org.cn/base/tmp/微信图片_20220513233703.jpg)![微信图片_20220513233700.jpg](https://img.easyshop.org.cn/base/tmp/微信图片_20220513233700.jpg)![微信图片_20220513233709.jpg](https://img.easyshop.org.cn/base/tmp/微信图片_20220513233709.jpg)![微信图片_20220513233713.jpg](https://img.easyshop.org.cn/base/tmp/微信图片_20220513233713.jpg)![微信图片_20220513233724.jpg](https://img.easyshop.org.cn/base/tmp/微信图片_20220513233724.jpg)![微信图片_20220513233729.jpg](https://img.easyshop.org.cn/base/tmp/微信图片_20220513233729.jpg)![微信图片_20220513233721.jpg](https://img.easyshop.org.cn/base/tmp/微信图片_20220513233721.jpg)![微信图片_20220513233732.jpg](https://img.easyshop.org.cn/base/tmp/微信图片_20220513233732.jpg)![微信图片_20220513233715.jpg](https://img.easyshop.org.cn/base/tmp/微信图片_20220513233715.jpg)![微信图片_20220513233718.jpg](https://img.easyshop.org.cn/base/tmp/微信图片_20220513233718.jpg)![微信图片_20220513233726.jpg](https://img.easyshop.org.cn/base/tmp/微信图片_20220513233726.jpg)![微信图片_20220513233734.jpg](https://img.easyshop.org.cn/base/tmp/微信图片_20220513233734.jpg)','2022-05-25 01:18:27','2022-06-27 22:53:32','[{\"name\":\"e9db140ad26c48b59fda05e0a229b053.png\",\"url\":\"https:\\/\\/img.easyshop.org.cn\\/material\\/tmp\\/e9db140ad26c48b59fda05e0a229b053.png\"}]','k-456245',2,'null'),(2,'蓝牙音箱哈曼卡顿低音炮蓝牙小音箱Mini版无线蓝牙（测试）','',1,1.00,145.50,1,1,293,1,8,36,14,36,0,'无忧退货,快速退款,免费包邮',NULL,NULL,0,'[{\"name\":\"\\u5fae\\u4fe1\\u56fe\\u7247_20220528102838.jpg\",\"url\":\"https:\\/\\/img.easyshop.org.cn\\/base\\/tmp\\/\\u5fae\\u4fe1\\u56fe\\u7247_20220528102838.jpg\",\"uid\":1653705109750,\"status\":\"success\",\"selected\":false},{\"name\":\"\\u5fae\\u4fe1\\u56fe\\u7247_20220528102907.jpg\",\"url\":\"https:\\/\\/img.easyshop.org.cn\\/base\\/tmp\\/\\u5fae\\u4fe1\\u56fe\\u7247_20220528102907.jpg\",\"uid\":1653705129226,\"status\":\"success\",\"selected\":false},{\"name\":\"\\u5fae\\u4fe1\\u56fe\\u7247_20220528102911.jpg\",\"url\":\"https:\\/\\/img.easyshop.org.cn\\/base\\/tmp\\/\\u5fae\\u4fe1\\u56fe\\u7247_20220528102911.jpg\",\"uid\":1653705136569,\"status\":\"success\",\"selected\":false}]','<p><img src=\"https://img.easyshop.org.cn/base/tmp/%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_20220528103324.jpg\" alt=\"微信图片_20220528103324.jpg\" /><img src=\"https://img.easyshop.org.cn/base/tmp/%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_20220528103441.jpg\" alt=\"微信图片_20220528103441.jpg\" /><img src=\"https://img.easyshop.org.cn/base/tmp/%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_20220528103445.jpg\" alt=\"微信图片_20220528103445.jpg\" /><img src=\"https://img.easyshop.org.cn/base/tmp/%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_20220528102915.jpg\" alt=\"微信图片_20220528102915.jpg\" /><img src=\"https://img.easyshop.org.cn/base/tmp/%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_20220528102925.jpg\" alt=\"微信图片_20220528102925.jpg\" /><img src=\"https://img.easyshop.org.cn/base/tmp/%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_20220528102928.jpg\" alt=\"微信图片_20220528102928.jpg\" /><img src=\"https://img.easyshop.org.cn/base/tmp/%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_20220528103041.jpg\" alt=\"微信图片_20220528103041.jpg\" /><img src=\"https://img.easyshop.org.cn/base/tmp/%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_20220528103012.jpg\" alt=\"微信图片_20220528103012.jpg\" /></p>','![微信图片_20220528103324.jpg](https://img.easyshop.org.cn/base/tmp/微信图片_20220528103324.jpg)![微信图片_20220528103441.jpg](https://img.easyshop.org.cn/base/tmp/微信图片_20220528103441.jpg)![微信图片_20220528103445.jpg](https://img.easyshop.org.cn/base/tmp/微信图片_20220528103445.jpg)![微信图片_20220528102915.jpg](https://img.easyshop.org.cn/base/tmp/微信图片_20220528102915.jpg)![微信图片_20220528102925.jpg](https://img.easyshop.org.cn/base/tmp/微信图片_20220528102925.jpg)![微信图片_20220528102928.jpg](https://img.easyshop.org.cn/base/tmp/微信图片_20220528102928.jpg)![微信图片_20220528103041.jpg](https://img.easyshop.org.cn/base/tmp/微信图片_20220528103041.jpg)![微信图片_20220528103012.jpg](https://img.easyshop.org.cn/base/tmp/微信图片_20220528103012.jpg)','2022-05-28 10:37:38','2022-06-27 22:53:24','[{\"name\":\"7bafb95a9642e28ed8dbc53d9ccb1506.png\",\"url\":\"https:\\/\\/img.easyshop.org.cn\\/material\\/tmp\\/7bafb95a9642e28ed8dbc53d9ccb1506.png\"}]','s-456817',2,'null'),(3,'便携式移动灰缸随身携带户外开车旅行免弹（测试）','便携式灰缸',1,1.00,88.90,12,1,97,0,6,13,12,0,0,'无忧退货,快速退款,免费包邮',NULL,NULL,0,'[{\"name\":\"\\u5fae\\u4fe1\\u56fe\\u7247_20220620225506.jpg\",\"url\":\"https:\\/\\/img.easyshop.org.cn\\/material\\/tmp\\/\\u5fae\\u4fe1\\u56fe\\u7247_20220620225506.jpg\"},{\"name\":\"\\u5fae\\u4fe1\\u56fe\\u7247_20220620225459.jpg\",\"url\":\"https:\\/\\/img.easyshop.org.cn\\/material\\/tmp\\/\\u5fae\\u4fe1\\u56fe\\u7247_20220620225459.jpg\",\"selected\":false},{\"name\":\"\\u5fae\\u4fe1\\u56fe\\u7247_20220620225453.jpg\",\"url\":\"https:\\/\\/img.easyshop.org.cn\\/material\\/tmp\\/\\u5fae\\u4fe1\\u56fe\\u7247_20220620225453.jpg\"},{\"name\":\"\\u5fae\\u4fe1\\u56fe\\u7247_20220620225446.jpg\",\"url\":\"https:\\/\\/img.easyshop.org.cn\\/material\\/tmp\\/\\u5fae\\u4fe1\\u56fe\\u7247_20220620225446.jpg\",\"selected\":false},{\"name\":\"\\u5fae\\u4fe1\\u56fe\\u7247_20220620225430.jpg\",\"url\":\"https:\\/\\/img.easyshop.org.cn\\/material\\/tmp\\/\\u5fae\\u4fe1\\u56fe\\u7247_20220620225430.jpg\",\"selected\":false}]','<p><img src=\"https://img.easyshop.org.cn/base/tmp/%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_20220620225517.jpg\" alt=\"微信图片_20220620225517.jpg\" /><img src=\"https://img.easyshop.org.cn/base/tmp/%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_20220620225511.jpg\" alt=\"微信图片_20220620225511.jpg\" /><img src=\"https://img.easyshop.org.cn/base/tmp/%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_20220620225517.jpg\" alt=\"微信图片_20220620225517.jpg\" /><img src=\"https://img.easyshop.org.cn/base/tmp/%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_20220620225523.jpg\" alt=\"微信图片_20220620225523.jpg\" /><img src=\"https://img.easyshop.org.cn/base/tmp/%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_20220620225528.jpg\" alt=\"微信图片_20220620225528.jpg\" /><img src=\"https://img.easyshop.org.cn/base/tmp/%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_20220620225533.jpg\" alt=\"微信图片_20220620225533.jpg\" /><img src=\"https://img.easyshop.org.cn/base/tmp/%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_20220620225539.jpg\" alt=\"微信图片_20220620225539.jpg\" /><img src=\"https://img.easyshop.org.cn/base/tmp/%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_20220620225523.jpg\" alt=\"微信图片_20220620225523.jpg\" /><img src=\"https://img.easyshop.org.cn/base/tmp/%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_20220620225533.jpg\" alt=\"微信图片_20220620225533.jpg\" /><img src=\"https://img.easyshop.org.cn/base/tmp/%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_20220620225607.jpg\" alt=\"微信图片_20220620225607.jpg\" /></p>','![微信图片_20220620225517.jpg](https://img.easyshop.org.cn/base/tmp/微信图片_20220620225517.jpg)![微信图片_20220620225511.jpg](https://img.easyshop.org.cn/base/tmp/微信图片_20220620225511.jpg)![微信图片_20220620225517.jpg](https://img.easyshop.org.cn/base/tmp/微信图片_20220620225517.jpg)![微信图片_20220620225523.jpg](https://img.easyshop.org.cn/base/tmp/微信图片_20220620225523.jpg)![微信图片_20220620225528.jpg](https://img.easyshop.org.cn/base/tmp/微信图片_20220620225528.jpg)![微信图片_20220620225533.jpg](https://img.easyshop.org.cn/base/tmp/微信图片_20220620225533.jpg)![微信图片_20220620225539.jpg](https://img.easyshop.org.cn/base/tmp/微信图片_20220620225539.jpg)![微信图片_20220620225523.jpg](https://img.easyshop.org.cn/base/tmp/微信图片_20220620225523.jpg)![微信图片_20220620225533.jpg](https://img.easyshop.org.cn/base/tmp/微信图片_20220620225533.jpg)![微信图片_20220620225607.jpg](https://img.easyshop.org.cn/base/tmp/微信图片_20220620225607.jpg)','2022-06-20 23:02:27','2022-06-27 22:53:12','[{\"name\":\"elper-removebg-preview.png\",\"url\":\"https:\\/\\/img.easyshop.org.cn\\/material\\/tmp\\/elper-removebg-preview.png\"}]','k-4312',2,'null'),(4,'Apple/苹果2021款M1芯片iPad Pro 11英寸（测试）','',NULL,1.00,6899.00,1,1,100,0,0,23,23,0,0,'无忧退货,快速退款,免费包邮',NULL,NULL,0,'[{\"name\":\"\\u5fae\\u4fe1\\u56fe\\u7247_20220624224742.jpg\",\"url\":\"https:\\/\\/img.easyshop.org.cn\\/material\\/tmp\\/\\u5fae\\u4fe1\\u56fe\\u7247_20220624224742.jpg\"},{\"name\":\"\\u5fae\\u4fe1\\u56fe\\u7247_20220624224729.jpg\",\"url\":\"https:\\/\\/img.easyshop.org.cn\\/material\\/tmp\\/\\u5fae\\u4fe1\\u56fe\\u7247_20220624224729.jpg\"},{\"name\":\"\\u5fae\\u4fe1\\u56fe\\u7247_20220624224735.jpg\",\"url\":\"https:\\/\\/img.easyshop.org.cn\\/material\\/tmp\\/\\u5fae\\u4fe1\\u56fe\\u7247_20220624224735.jpg\",\"selected\":false},{\"name\":\"\\u5fae\\u4fe1\\u56fe\\u7247_20220624224723.jpg\",\"url\":\"https:\\/\\/img.easyshop.org.cn\\/material\\/tmp\\/\\u5fae\\u4fe1\\u56fe\\u7247_20220624224723.jpg\",\"selected\":false},{\"name\":\"\\u5fae\\u4fe1\\u56fe\\u7247_20220624224714.jpg\",\"url\":\"https:\\/\\/img.easyshop.org.cn\\/material\\/tmp\\/\\u5fae\\u4fe1\\u56fe\\u7247_20220624224714.jpg\"}]','<p><img src=\"https://img.easyshop.org.cn/base/tmp/%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_20220624224752.jpg\" alt=\"微信图片_20220624224752.jpg\" /><img src=\"https://img.easyshop.org.cn/base/tmp/%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_20220624224757.jpg\" alt=\"微信图片_20220624224757.jpg\" /><img src=\"https://img.easyshop.org.cn/base/tmp/%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_20220624224801.jpg\" alt=\"微信图片_20220624224801.jpg\" /><img src=\"https://img.easyshop.org.cn/base/tmp/%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_20220624224805.jpg\" alt=\"微信图片_20220624224805.jpg\" /><img src=\"https://img.easyshop.org.cn/base/tmp/%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_20220624224809.jpg\" alt=\"微信图片_20220624224809.jpg\" /><img src=\"https://img.easyshop.org.cn/base/tmp/%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_20220624224813.jpg\" alt=\"微信图片_20220624224813.jpg\" /><img src=\"https://img.easyshop.org.cn/base/tmp/%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_20220624224817.jpg\" alt=\"微信图片_20220624224817.jpg\" /><img src=\"https://img.easyshop.org.cn/base/tmp/%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_20220624224823.jpg\" alt=\"微信图片_20220624224823.jpg\" /><img src=\"https://img.easyshop.org.cn/base/tmp/%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_20220624224827.jpg\" alt=\"微信图片_20220624224827.jpg\" /><img src=\"https://img.easyshop.org.cn/base/tmp/%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_20220624224836.jpg\" alt=\"微信图片_20220624224836.jpg\" /><img src=\"https://img.easyshop.org.cn/base/tmp/%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_20220624224840.jpg\" alt=\"微信图片_20220624224840.jpg\" /><img src=\"https://img.easyshop.org.cn/base/tmp/%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_20220624224902.jpg\" alt=\"微信图片_20220624224902.jpg\" /><img src=\"https://img.easyshop.org.cn/base/tmp/%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_20220624224902.jpg\" alt=\"微信图片_20220624224902.jpg\" /><img src=\"https://img.easyshop.org.cn/base/tmp/%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_20220624225016.jpg\" alt=\"微信图片_20220624225016.jpg\" /></p>','![微信图片_20220624224752.jpg](https://img.easyshop.org.cn/base/tmp/微信图片_20220624224752.jpg)![微信图片_20220624224757.jpg](https://img.easyshop.org.cn/base/tmp/微信图片_20220624224757.jpg)![微信图片_20220624224801.jpg](https://img.easyshop.org.cn/base/tmp/微信图片_20220624224801.jpg)![微信图片_20220624224805.jpg](https://img.easyshop.org.cn/base/tmp/微信图片_20220624224805.jpg)![微信图片_20220624224809.jpg](https://img.easyshop.org.cn/base/tmp/微信图片_20220624224809.jpg)![微信图片_20220624224813.jpg](https://img.easyshop.org.cn/base/tmp/微信图片_20220624224813.jpg)![微信图片_20220624224817.jpg](https://img.easyshop.org.cn/base/tmp/微信图片_20220624224817.jpg)![微信图片_20220624224823.jpg](https://img.easyshop.org.cn/base/tmp/微信图片_20220624224823.jpg)![微信图片_20220624224827.jpg](https://img.easyshop.org.cn/base/tmp/微信图片_20220624224827.jpg)![微信图片_20220624224836.jpg](https://img.easyshop.org.cn/base/tmp/微信图片_20220624224836.jpg)![微信图片_20220624224840.jpg](https://img.easyshop.org.cn/base/tmp/微信图片_20220624224840.jpg)![微信图片_20220624224902.jpg](https://img.easyshop.org.cn/base/tmp/微信图片_20220624224902.jpg)![微信图片_20220624224902.jpg](https://img.easyshop.org.cn/base/tmp/微信图片_20220624224902.jpg)![微信图片_20220624225016.jpg](https://img.easyshop.org.cn/base/tmp/微信图片_20220624225016.jpg)','2022-06-24 23:57:39','2022-06-27 22:53:06','[{\"name\":\"20220624224714.png\",\"url\":\"https:\\/\\/img.easyshop.org.cn\\/material\\/tmp\\/20220624224714.png\"}]','k-4561',2,'null');
/*!40000 ALTER TABLE `store_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_goods_comment`
--

DROP TABLE IF EXISTS `store_goods_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_goods_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL COMMENT '用户Uid',
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品Id',
  `order_goods_id` int(10) unsigned NOT NULL COMMENT '商品订单ID',
  `num` int(10) unsigned NOT NULL COMMENT '购买的数量',
  `order_no` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '订单编号',
  `goods_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '商品名称',
  `sku` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '规格',
  `status` int(11) DEFAULT '0' COMMENT '状态[0、审核中; 1、审核通过; 2、审核驳回]',
  `goods_thumb` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '商品封面',
  `picture` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '评论的图片',
  `member_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '会员昵称',
  `member_icon` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '评论用户头像',
  `comment_rank` int(11) DEFAULT NULL COMMENT '评价等级，1、表示非常差，2、表示差，3、表示一般，4、表示好，5、表示非常好',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `index_goods_id` (`goods_id`),
  KEY `index_status` (`status`),
  KEY `index_goods_name` (`goods_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品评论';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_goods_comment`
--

LOCK TABLES `store_goods_comment` WRITE;
/*!40000 ALTER TABLE `store_goods_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `store_goods_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_goods_sku`
--

DROP TABLE IF EXISTS `store_goods_sku`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_goods_sku` (
  `sku_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品规格id',
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品id',
  `spec_sku_id` varchar(255) NOT NULL DEFAULT '0' COMMENT '商品sku记录索引 (由规格id组成)',
  `goods_no` varchar(100) NOT NULL DEFAULT '' COMMENT '商品编码',
  `goods_thumb` varchar(100) NOT NULL DEFAULT '' COMMENT '商品封面',
  `goods_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '商品价格',
  `line_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '商品划线价',
  `stock_num` int(10) unsigned NOT NULL COMMENT '当前库存数量',
  `goods_sales` int(10) unsigned NOT NULL COMMENT '商品销量',
  `goods_weight` double unsigned NOT NULL COMMENT '商品重量(Kg)',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='商品规格表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_goods_sku`
--

LOCK TABLES `store_goods_sku` WRITE;
/*!40000 ALTER TABLE `store_goods_sku` DISABLE KEYS */;
INSERT INTO `store_goods_sku` VALUES (1,1,'1,2','0','https://img.easyshop.org.cn/base/tmp/微信图片_20220513233626.jpg',1.00,68.45,77,0,15,'2022-05-25 01:18:27','2022-06-27 22:53:32'),(2,1,'1,3','0','https://img.easyshop.org.cn/base/tmp/微信图片_20220513233637.jpg',1.00,68.45,81,0,15,'2022-05-25 01:18:27','2022-06-27 22:53:32'),(3,1,'4,2','0','https://img.easyshop.org.cn/base/tmp/微信图片_20220513233644.jpg',1.00,68.45,97,0,15,'2022-05-25 01:18:27','2022-06-27 22:53:32'),(4,1,'4,3','0','https://img.easyshop.org.cn/base/tmp/微信图片_20220513233637.jpg',1.00,68.45,95,0,15,'2022-05-25 01:18:27','2022-06-27 22:53:32'),(5,1,'5,2','0','https://img.easyshop.org.cn/base/tmp/微信图片_20220513233641.jpg',1.00,68.45,98,0,15,'2022-05-25 01:18:27','2022-06-27 22:53:32'),(6,1,'5,3','0','https://img.easyshop.org.cn/base/tmp/微信图片_20220513233626.jpg',1.00,68.45,94,0,15,'2022-05-25 01:18:27','2022-06-27 22:53:32'),(7,2,'6','0','https://img.easyshop.org.cn/base/tmp/微信图片_20220528102946.jpg',1.00,48.60,97,0,156,'2022-05-28 10:37:38','2022-06-27 22:53:24'),(8,2,'7','0','https://img.easyshop.org.cn/base/tmp/微信图片_20220528102937.jpg',1.00,48.60,98,0,156,'2022-05-28 10:37:38','2022-06-27 22:53:24'),(9,2,'8','0','https://img.easyshop.org.cn/base/tmp/微信图片_20220528102934.jpg',1.00,48.60,98,0,156,'2022-05-28 10:37:38','2022-06-27 22:53:24'),(10,3,'9','0','https://img.easyshop.org.cn/base/tmp/微信图片_20220620225430.jpg',1.00,88.90,97,0,12,'2022-06-20 23:02:27','2022-06-27 22:53:12'),(11,4,'10,11,12','0','https://img.easyshop.org.cn/base/tmp/微信图片_20220624224723.jpg',1.00,7899.00,100,0,123,'2022-06-24 23:57:39','2022-06-27 22:53:06');
/*!40000 ALTER TABLE `store_goods_sku` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_goods_spec`
--

DROP TABLE IF EXISTS `store_goods_spec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_goods_spec` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品id',
  `spec_id` int(10) unsigned NOT NULL COMMENT '规格组id',
  `spec_value_id` int(10) unsigned NOT NULL COMMENT '规格值id',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商品与规格值关系记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_goods_spec`
--

LOCK TABLES `store_goods_spec` WRITE;
/*!40000 ALTER TABLE `store_goods_spec` DISABLE KEYS */;
INSERT INTO `store_goods_spec` VALUES (1,1,1,1,'2022-05-25 01:18:27','2022-05-25 01:18:27'),(2,1,2,4,'2022-05-25 01:18:27','2022-05-25 01:18:27'),(3,1,2,5,'2022-05-25 01:18:27','2022-05-25 01:18:27'),(4,1,1,2,'2022-05-25 01:18:27','2022-05-25 01:18:27'),(5,1,1,3,'2022-05-25 01:18:27','2022-05-25 01:18:27'),(6,2,3,6,'2022-05-28 10:37:38','2022-05-28 10:37:38'),(7,2,3,7,'2022-05-28 10:37:38','2022-05-28 10:37:38'),(8,2,3,8,'2022-05-28 10:37:38','2022-05-28 10:37:38'),(9,3,4,9,'2022-06-20 23:02:27','2022-06-20 23:02:27'),(10,4,1,10,'2022-06-24 23:57:39','2022-06-24 23:57:39'),(11,4,5,11,'2022-06-24 23:57:39','2022-06-24 23:57:39'),(12,4,6,12,'2022-06-24 23:57:39','2022-06-24 23:57:39');
/*!40000 ALTER TABLE `store_goods_spec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_help`
--

DROP TABLE IF EXISTS `store_help`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_help` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL DEFAULT '' COMMENT '标题',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态：0 、启用, 1、关闭',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `description` varchar(255) NOT NULL COMMENT '描述',
  `is_show` tinyint(1) DEFAULT '0' COMMENT '是否需要展开： 0、否 1、是',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `parent_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='帮助中心';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_help`
--

LOCK TABLES `store_help` WRITE;
/*!40000 ALTER TABLE `store_help` DISABLE KEYS */;
INSERT INTO `store_help` VALUES (1,'收益什么时候结算？',0,0,'',1,'2021-03-21 06:49:07',NULL,0),(2,'',0,0,'每个月的22号系统会自动结算上个月已确认收货的订单，会自动结算到我的钱包，如果你的订单是在月中旬购买，这部分订单有可能在下个月结算，或者是未来在当月确认收货的也是在下个月才确认收货，未结算的佣金会顺延至下个月22号结算',0,'2021-03-21 06:52:17',NULL,1),(3,'提现需要手续费吗？',0,0,'',0,'2021-03-21 06:49:01',NULL,0),(4,'订单为什么会失效？',0,0,'',0,'2021-03-21 06:52:42',NULL,0),(5,'',0,0,'订单失效是指订单申请退款、售后，账号异常等状态导致无法订单失效无法结算佣金。',0,'2021-03-21 06:54:11',NULL,4),(6,'',0,0,'亲，收益钱包的余额大于可提现金额即可随时提现，提现需要扣除1%的手续费，提现在24小时到账，法定节假日则顺延至工作日到账，提现时请确保个人提现的准确性和安全性。',0,'2021-03-21 06:52:09',NULL,3);
/*!40000 ALTER TABLE `store_help` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_lexicon`
--

DROP TABLE IF EXISTS `store_lexicon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_lexicon` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '名称',
  `key` varchar(50) NOT NULL,
  `value` varchar(100) NOT NULL,
  `sort` smallint(5) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间',
  `created_at` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='词典';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_lexicon`
--

LOCK TABLES `store_lexicon` WRITE;
/*!40000 ALTER TABLE `store_lexicon` DISABLE KEYS */;
INSERT INTO `store_lexicon` VALUES (1,'搜索推荐','suggest','盲盒',1,1,'2022-05-30 00:18:11','2022-05-30 00:18:11');
/*!40000 ALTER TABLE `store_lexicon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_member_level`
--

DROP TABLE IF EXISTS `store_member_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_member_level` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '等级名称',
  `useful_ids` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '会员权益',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态[0、禁用 1、正常]',
  `reach_growth` int(11) NOT NULL DEFAULT '0' COMMENT '等级成长值',
  `remark` varchar(64) NOT NULL DEFAULT '' COMMENT '备注',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='会员等级';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_member_level`
--

LOCK TABLES `store_member_level` WRITE;
/*!40000 ALTER TABLE `store_member_level` DISABLE KEYS */;
INSERT INTO `store_member_level` VALUES (1,'注册会员','4,3,2,1',1,0,'注册会员','2022-06-03 21:11:04','2022-06-03 21:11:04'),(2,'铜牌会员','4,3,2,1',1,120,'铜牌会员','2022-06-03 21:11:23','2022-06-06 23:10:49'),(3,'银牌会员','4,3,2,1',1,350,'银牌会员','2022-06-03 21:11:46','2022-06-06 23:10:56'),(4,'金牌会员','3,1,2',1,680,'金牌会员','2022-06-03 21:12:06','2022-06-06 23:11:03'),(5,'钻石会员','4,2,3,1',1,1200,'钻石会员','2022-06-03 21:12:40','2022-06-06 23:11:11');
/*!40000 ALTER TABLE `store_member_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_member_useful`
--

DROP TABLE IF EXISTS `store_member_useful`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_member_useful` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '权益名称',
  `icon` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ICON',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态[0、禁用 1、正常]',
  `remark` varchar(64) NOT NULL DEFAULT '' COMMENT '备注',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='会员权益';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_member_useful`
--

LOCK TABLES `store_member_useful` WRITE;
/*!40000 ALTER TABLE `store_member_useful` DISABLE KEYS */;
INSERT INTO `store_member_useful` VALUES (1,'会员优惠券','[{\"name\":\"a98c5a589526627f9458bdf4ed640bd9.png\",\"url\":\"https:\\/\\/img.easyshop.org.cn\\/base\\/tmp\\/a98c5a589526627f9458bdf4ed640bd9.png\",\"uid\":1654528349811,\"status\":\"success\"}]',1,'会员优惠券','2022-06-03 21:09:41','2022-06-06 23:12:40'),(2,'全场免邮费','[{\"name\":\"001258dae3fb475ceecb294dfb0314fd.png\",\"url\":\"https:\\/\\/img.easyshop.org.cn\\/base\\/tmp\\/001258dae3fb475ceecb294dfb0314fd.png\",\"uid\":1654528335484,\"status\":\"success\"}]',1,'全场免邮费','2022-06-03 21:10:10','2022-06-06 23:12:25'),(3,'购物折扣','[{\"name\":\"35e522faf28bee80048703f4a9f97f99.png\",\"url\":\"https:\\/\\/img.easyshop.org.cn\\/base\\/tmp\\/35e522faf28bee80048703f4a9f97f99.png\",\"uid\":1654528322262,\"status\":\"success\"}]',1,'购物折扣','2022-06-03 21:10:27','2022-06-06 23:12:12'),(4,'专属客服','[{\"name\":\"b993e87092f20dbc7b32536d6a867ccb.png\",\"url\":\"https:\\/\\/img.easyshop.org.cn\\/base\\/tmp\\/b993e87092f20dbc7b32536d6a867ccb.png\",\"uid\":1654528306586,\"status\":\"success\"}]',1,'专属客服','2022-06-03 21:10:43','2022-06-06 23:11:57');
/*!40000 ALTER TABLE `store_member_useful` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_order`
--

DROP TABLE IF EXISTS `store_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_order` (
  `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `order_no` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '订单号',
  `status` char(6) NOT NULL DEFAULT '1' COMMENT '订单状态[1、未付款，2、已付款，3、未发货，4、已发货，5、交易成功，6、交易关闭]',
  `amount` decimal(8,2) DEFAULT '0.00' COMMENT '实际支付金额',
  `raw_amount` decimal(8,2) DEFAULT '0.00' COMMENT '订单原金额',
  `contact` char(100) NOT NULL DEFAULT '' COMMENT '收货人',
  `moblie` char(11) NOT NULL DEFAULT '' COMMENT '手机号码',
  `gift_growth` int(11) DEFAULT '0' COMMENT '赠送的成长值',
  `gift_point` int(11) DEFAULT '0' COMMENT '赠送的积分',
  `shipping_name` varchar(20) DEFAULT NULL COMMENT '物流名称',
  `shipping_code` varchar(20) DEFAULT NULL COMMENT '物流单号',
  `address` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '收货地址',
  `close_time` datetime DEFAULT NULL COMMENT '交易关闭时间',
  `end_time` datetime DEFAULT NULL COMMENT '交易完成时间',
  `payment_time` datetime DEFAULT NULL COMMENT '付款时间',
  `consign_time` datetime DEFAULT NULL COMMENT '发货时间',
  `create_time` datetime DEFAULT NULL COMMENT '订单创建时间',
  `post_fee` decimal(8,2) DEFAULT '0.00' COMMENT '邮费',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `order_type` int(11) DEFAULT '0' COMMENT '订单类型： 1、普通订单 2、盲盒订单',
  PRIMARY KEY (`order_id`),
  KEY `index_uid` (`uid`),
  KEY `index_status` (`status`),
  KEY `index_contact` (`contact`),
  KEY `index_order_no` (`order_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户订单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_order`
--

LOCK TABLES `store_order` WRITE;
/*!40000 ALTER TABLE `store_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `store_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_order_goods`
--

DROP TABLE IF EXISTS `store_order_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_order_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品Id',
  `goods_price` decimal(8,2) DEFAULT '0.00' COMMENT '价格',
  `line_price` decimal(8,2) DEFAULT '0.00' COMMENT '原价格',
  `goods_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '商品名称',
  `sku` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '规格',
  `number` int(11) NOT NULL DEFAULT '0' COMMENT '购买数量',
  `coupon_discount` decimal(8,2) DEFAULT '0.00' COMMENT '优惠券',
  `deductt_point` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '抵扣积分',
  `gift_point` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '奖励积分',
  `gift_growth` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '奖励成长值',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `goods_thumb` text,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='订单商品';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_order_goods`
--

LOCK TABLES `store_order_goods` WRITE;
/*!40000 ALTER TABLE `store_order_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `store_order_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_order_refund`
--

DROP TABLE IF EXISTS `store_order_refund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_order_refund` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL COMMENT '订单ID',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `order_no` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '订单号',
  `status` char(6) NOT NULL DEFAULT '1' COMMENT '订单状态[1、待处理，2、处理中，3、处理完成]',
  `contact` char(100) NOT NULL DEFAULT '' COMMENT '收货人',
  `moblie` char(11) NOT NULL DEFAULT '' COMMENT '手机号码',
  `shipping_name` varchar(20) DEFAULT NULL COMMENT '物流名称',
  `shipping_code` varchar(20) DEFAULT NULL COMMENT '物流单号',
  `post_fee` decimal(8,2) DEFAULT '0.00' COMMENT '邮费',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `index_uid` (`uid`),
  KEY `index_status` (`status`),
  KEY `index_contact` (`contact`),
  KEY `index_order_id` (`order_id`),
  KEY `index_order_no` (`order_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='退货订单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_order_refund`
--

LOCK TABLES `store_order_refund` WRITE;
/*!40000 ALTER TABLE `store_order_refund` DISABLE KEYS */;
/*!40000 ALTER TABLE `store_order_refund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_point_record`
--

DROP TABLE IF EXISTS `store_point_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_point_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `source_id` int(11) NOT NULL DEFAULT '0' COMMENT '来源id',
  `source_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1、任务 2、系统赠送 3、订单 4、签到 5、兑换奖品',
  `exprie_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否过期0 没过期 1 过期',
  `symbol` varchar(3) NOT NULL DEFAULT '' COMMENT 'in 收入 out 支出',
  `point` int(11) NOT NULL DEFAULT '0' COMMENT '积分值',
  `remark` varchar(120) DEFAULT NULL COMMENT '备注',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='积分流水';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_point_record`
--

LOCK TABLES `store_point_record` WRITE;
/*!40000 ALTER TABLE `store_point_record` DISABLE KEYS */;
INSERT INTO `store_point_record` VALUES (1,34,4,1,0,'in',0,'','2022-06-19 23:43:11','2022-06-19 23:43:11'),(2,34,6,1,0,'in',0,'','2022-06-20 00:44:26','2022-06-20 00:44:26'),(3,34,7,1,0,'in',0,'','2022-06-20 01:20:45','2022-06-20 01:20:45'),(4,34,12,1,0,'in',0,'','2022-06-22 11:20:22','2022-06-22 11:20:22'),(5,38,14,1,0,'in',0,'','2022-06-22 13:44:21','2022-06-22 13:44:21'),(6,34,4,1,0,'in',0,'','2022-06-23 01:08:04','2022-06-23 01:08:04'),(7,34,5,1,0,'in',0,'','2022-06-23 01:24:53','2022-06-23 01:24:53'),(8,34,6,1,0,'in',0,'','2022-06-23 01:57:38','2022-06-23 01:57:38'),(9,34,7,1,0,'in',0,'','2022-06-24 16:12:14','2022-06-24 16:12:14'),(10,34,14,1,0,'in',0,'','2022-06-27 01:19:16','2022-06-27 01:19:16'),(11,34,15,1,0,'in',0,'','2022-06-27 01:21:43','2022-06-27 01:21:43'),(12,34,17,1,0,'in',0,'','2022-06-27 23:20:45','2022-06-27 23:20:45');
/*!40000 ALTER TABLE `store_point_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_spec`
--

DROP TABLE IF EXISTS `store_spec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_spec` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '规格组id',
  `spec_name` varchar(255) NOT NULL DEFAULT '' COMMENT '规格组名称',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商品规格组记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_spec`
--

LOCK TABLES `store_spec` WRITE;
/*!40000 ALTER TABLE `store_spec` DISABLE KEYS */;
INSERT INTO `store_spec` VALUES (1,'颜色','2022-05-25 01:18:27','2022-05-25 01:18:27'),(2,'组合','2022-05-25 01:18:27','2022-05-25 01:18:27'),(3,'款式','2022-05-28 10:37:38','2022-05-28 10:37:38'),(4,'材质','2022-06-20 23:02:27','2022-06-20 23:02:27'),(5,'存储容量','2022-06-24 23:57:39','2022-06-24 23:57:39'),(6,'网络类型','2022-06-24 23:57:39','2022-06-24 23:57:39');
/*!40000 ALTER TABLE `store_spec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_spec_value`
--

DROP TABLE IF EXISTS `store_spec_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_spec_value` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '规格值id',
  `spec_value` varchar(255) NOT NULL COMMENT '规格值',
  `spec_id` int(11) NOT NULL COMMENT '规格组id',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商品规格值记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_spec_value`
--

LOCK TABLES `store_spec_value` WRITE;
/*!40000 ALTER TABLE `store_spec_value` DISABLE KEYS */;
INSERT INTO `store_spec_value` VALUES (1,'精灵球',1,'2022-05-25 01:18:27','2022-05-25 01:18:27'),(2,'美乐蒂',1,'2022-05-25 01:18:27','2022-05-25 01:18:27'),(3,'库里洛',1,'2022-05-25 01:18:27','2022-05-25 01:18:27'),(4,'无赠品',2,'2022-05-25 01:18:27','2022-05-25 01:18:27'),(5,'赠摇杆帽+钢化膜',2,'2022-05-25 01:18:27','2022-05-25 01:18:27'),(6,'天空蓝',3,'2022-05-28 10:37:38','2022-05-28 10:37:38'),(7,'炫酷黑',3,'2022-05-28 10:37:38','2022-05-28 10:37:38'),(8,'珍珠白',3,'2022-05-28 10:37:38','2022-05-28 10:37:38'),(9,'胡桃木材质（礼盒装）',4,'2022-06-20 23:02:27','2022-06-20 23:02:27'),(10,'深空灰',1,'2022-06-24 23:57:39','2022-06-24 23:57:39'),(11,'8GB+128G',5,'2022-06-24 23:57:39','2022-06-24 23:57:39'),(12,'WIFI版',6,'2022-06-24 23:57:39','2022-06-24 23:57:39');
/*!40000 ALTER TABLE `store_spec_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_user`
--

DROP TABLE IF EXISTS `store_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_user` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别:0、保密 1、男 2、女',
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `avatar_url` varchar(255) NOT NULL DEFAULT '' COMMENT '头像',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '账号状态[0、 正常;1、禁用]',
  `mobile` char(12) NOT NULL DEFAULT '' COMMENT '手机号码',
  `openid` varchar(255) DEFAULT NULL,
  `invite_code` char(8) DEFAULT NULL COMMENT '唯一码',
  `password` varchar(255) NOT NULL COMMENT '账户密码',
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `register_ip` varchar(16) NOT NULL DEFAULT '' COMMENT '注册IP',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '余额',
  `vip_lev` int(10) DEFAULT '0' COMMENT 'vip等级',
  `point` int(10) DEFAULT '0' COMMENT '积分',
  `growth` int(10) DEFAULT '0' COMMENT '成长值',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_user`
--

LOCK TABLES `store_user` WRITE;
/*!40000 ALTER TABLE `store_user` DISABLE KEYS */;
INSERT INTO `store_user` VALUES (2,0,'琳','https://thirdwx.qlogo.cn/mmopen/vi_32/sYTDIMJhSsyUicibucKhMJAqd4LMdhNtyHmgdV7uHhBapagdLoZmsFmzDf5yu4iaRqiapCVtM1ZnOibqGDlF6GUMUgQ/132','',0,'15673340000','oB5d-5Xx7AGg5mEM','9znOQE','$2y$10$rzM04kj6O30VIZe.Azl0/.rxay93Kj.W8//UICHhU6H9XupfO84c6',NULL,'',0.00,0,0,0,'2022-05-14 00:48:37','2022-06-27 23:58:18'),(3,0,'Slience','https://thirdwx.qlogo.cn/mmopen/vi_32/ah6TsnTicIecDpn6C5S030xXH2XnHu9tqJcFmWRR3qjW5LDWwpLZic5Gia9Fej2kwXMe6hicX8Rm7NeaZuSjh68hwA/132','',0,'15573010000','oB5d-5ct8aQLk57rbTaFU','ajL9z2','$2y$10$0iouOKeZJtOqTfFeXTOAReeIECjfK83EPzMqHv87SlsBfCZ4w8hYW',NULL,'',0.00,0,0,0,'2022-05-18 14:29:34','2022-06-27 23:54:44'),(4,0,'Echo404','https://thirdwx.qlogo.cn/mmopen/vi_32/NntgoI2WcUofkL0ibogcZaMNbTV2lDoHL7YIYM5Bbia1u7vBO9icJoDUFeiabuibZS8S06tAeRlQxibHhXQsHkTyPO1A/132','',0,'15286060000','oB5d-5bKdZl3IugIutbG8','NQ96VJ','$2y$10$9yh8CUTC07paHnta.q1meudKs9vtAmaLEpK2O/4RSlKgOopQN9kTK',NULL,'',0.00,0,0,0,'2022-05-18 20:54:23','2022-06-27 23:54:47'),(5,0,'熊小嘿吖','https://thirdwx.qlogo.cn/mmopen/vi_32/23PAbQndBH3jGUVFXMtDQLxp03F0LAibfOU49KwQz7tt32FtrwyLYmqknYZjCT58ouibiaKjwaqcls6bz0DPpTcCA/132','',0,'13203220000','oB5d-5TJDDLjRHZStYkO3M','XVepQ5','$2y$10$kdu/6csOUsGyMeOxA2CLY.WVX9wHjXMiDduYN9iESLDxfKu0yyGBK',NULL,'',0.00,0,0,0,'2022-05-18 21:09:25','2022-06-27 23:54:52'),(6,0,'TeaSun','https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI6oib4AuUOKiaKOWLsDpOlAgRkcXOTw0mjvicAqibyhsibLmGoKcBgXgtjQ7hadJvNNtUqicQrthxzsfbw/132','',0,'13667320000','oB5d-5aghQYdzXVkyh9uNyQ','5V4qjW','$2y$10$OeZt7Qc37YHNyjz9JVgxCeti/BvClNWZYQm7iZLim.jh.RI0PZz/a',NULL,'',0.00,0,0,0,'2022-05-19 09:07:26','2022-06-27 23:58:16'),(7,0,'A精彩依旧','https://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqpe47DFGNXE0NFVvTOqY1Lic7RJVKTTo90icKvOoeNfR6dVwz8d1maD5fics0iaU2obeyzSaW9vo1YjA/132','',0,'19931300000','oB5d-5XtKQBwWdWHurg','OVKaza','$2y$10$gQOiJIk5FzzMIFFe0kZx3OJkdxv7wuUOaHAn9GMsmV4M7G.992Cs2',NULL,'',0.00,0,0,0,'2022-05-23 05:48:41','2022-06-27 23:54:56'),(8,0,'呵呵虾','https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIRGicUz4zzqyiadPd70haH9icx0c6W7Hr3y3UqqpTGsK8cwK4cljfd9WjibTdSjZS2EtVHXTtleibUO7A/132','',0,'13141520000','oB5d-5YGgr3XY5spNDd_4','9V2nVB','$2y$10$Za6cMMaiHhRVBCvuqn.RleMY7KhY/NZxq6C0ESusiIO1GQsQWyaty',NULL,'',0.00,0,0,0,'2022-05-23 09:32:54','2022-06-27 23:58:09'),(9,0,'小陈','https://thirdwx.qlogo.cn/mmopen/vi_32/fhGmsXpxHMqLBOfkSibpR5FL7rb93YU2bQkv0FVpzibnkq6I5aXWlbB5zMNdHIj9KPwZYQL4Hslw8ibybYiafH4WdA/132','',0,'17607550000','oB5d-5ad7PcoNIOCSgcA9hIQ','azkpQJ','$2y$10$UUsiuZ2JuOVqtVoc7M4zdu66KSx/N6cKCQLWiUz3A9mUbguWPmtge',NULL,'',0.00,0,0,0,'2022-05-23 11:25:10','2022-06-27 23:58:06'),(10,0,'MR.Lee','https://thirdwx.qlogo.cn/mmopen/vi_32/ajNVdqHZLLAfEvyq6F28TDbS5nJ8yVR6eNcFr8U7BcG0fc2jkU2dn9PiaL9LJJyHIEdE7627t7FlIpWlvaPiaASg/132','',0,'18621550000','oB5d-5bC90Y7nfqmJrPC-8','9VPqj8','$2y$10$FgmrY.n5JgFQQorz/JXRtOwLzPaB5/LJso6nZVZ2lZLUzS/1Ov4dO',NULL,'',0.00,0,0,0,'2022-05-23 11:25:23','2022-06-27 23:58:03'),(11,0,'诚挚先生～Vincent','https://thirdwx.qlogo.cn/mmopen/vi_32/4sCgPAR7DDqYkczIygTl3PpPKIwJLq69y92S8I98LLC3Geox5mKKLFQxkaTL7BQh9eGEc2CAegCPfOAO9DoGbQ/132','',0,'13923090000','oB5d-5VWU-4Qn4Qf8qEYg7-0','9jXezB','$2y$10$CSnXsHCFOVbG9/CAS8TpAul6q4YN.uy1rc/OqOYtSKmnUg90Ndsaa',NULL,'',0.00,0,0,0,'2022-05-23 11:34:04','2022-06-27 23:58:01'),(12,0,'阿白','https://thirdwx.qlogo.cn/mmopen/vi_32/Q3auHgzwzM7Xax9QSfkvHficXdQT3frkg27gE8tGADEN1XPvbzMOCgD3r1tJuVTkDs69QB4pcNsdJTcfJ4icdyAQ/132','',0,'18581120000','oB5d-5yH_SL_-CHd4Pwk0U','pjWxzK','$2y$10$A06aq3q/5gkc8ZCO.nXWOOh/dX4dMQP3Zd8x3grqXY0Zb1molkIPu',NULL,'',0.00,0,0,0,'2022-05-24 16:04:54','2022-06-27 23:57:58'),(13,0,'@要自然','https://thirdwx.qlogo.cn/mmopen/vi_32/NPmZVpR0kKMyeHOJE8iarss9QtRTpoRQxTConOhv4wjC57MRnfK6RcDibvBWXTgudtvWAjAUgTiaTxE3EnDjpoYPg/132','',0,'17801000000','oB5d-5ZuCANA3HUc5K3F0o','MVM7z5','$2y$10$xh4NE/yEH.hoEWFVA3bFAe4UsuvhfY29zUfMqFyBnnyopxKVoxqi2',NULL,'',0.00,0,0,0,'2022-05-27 16:25:55','2022-06-27 23:57:56'),(14,0,'刚刚卡了','https://thirdwx.qlogo.cn/mmopen/vi_32/cbDlATDQicJdiaPW770dmOrHHhlbTzhVfB0DVKWauxAOO0uMVWbLSTaNGtpUSQ2xGkp1P2KypwcxeMlxibOkYttIA/132','',0,'19812000000','oB5d-5W_SBDd00mlt4','PjYKQg','$2y$10$btvCOWlOOEL2m2lkPtGzaOWQB3WMRpaY5huF3T8grJhIc2iRDVbii',NULL,'',0.00,0,0,0,'2022-05-30 11:44:24','2022-06-27 23:57:53'),(15,0,'直梦未醒','https://thirdwx.qlogo.cn/mmopen/vi_32/fF7icBE5ZFnvMSlwKKJc5wemdI8AxBict8kkSXKtPnFicZkJ16H9Xy7sdDF93xtf9oJIA7LicsAAW9ibZAPCo81A73g/132','',0,'18659210000','oB5d-5dFPFeulJlxc','yzmdjY','$2y$10$X3XynIQfTmhQZay/I.s9AeHHAWfYYDpVVhVDLqURLcaqt59SKLqCS',NULL,'',0.00,0,0,0,'2022-05-31 13:43:38','2022-06-27 23:57:50'),(16,0,'Y?','https://thirdwx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEIcy7X0mdfQWPbT8LPevoaNlznD88lt9Gz9cN2riaMkZX2nhHw3XRIuNjV8VX06gCzu53cqSibsltKQ/132','',0,'18681610000','oB5d-5Q9LBoAXIwLR6M','WQyJVp','$2y$10$p5yriNmEdJJG7pQIA.so2OXBzWxLLM9U15MaiPMjPDSbdJ4f/58fC',NULL,'',0.00,0,0,0,'2022-05-31 16:39:42','2022-06-27 23:57:47'),(17,0,'z','https://thirdwx.qlogo.cn/mmopen/vi_32/hh0DgEGDicEQw37gc3dbiagopn2PLXvNtgibspj7nE71ooN56BVO7icTLsQJibK4FicsAYhsYm1qEes8dkT6THJpW2IQ/132','',0,'17576050000','oB5d-5dpLs15dBTSdjTdQ','vQ8RjY','$2y$10$Hps0iLDXbOOa55iXBlIrXes8lQHsOwNKkMfTw3jmxreTgbFjtMXb6',NULL,'',0.00,0,0,0,'2022-05-31 17:36:36','2022-06-27 23:57:44'),(18,0,'Undefined','https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLUnaicnVnYoUG1jTaXb1XmHGlvgISD7nib6hRAL8lcic7z5k3f5Qo03YicAwvw7ze9S2muicP7JSicCicXw/132','',0,'18206820000','oB5d-5d-kfqBa-zfJXfL2l7fb3aQ','vzbLVL','$2y$10$9/Tn8.H.AeKTGAO5B5VbIOGnmlop2kZIXo7VyWYtUkFEj8iG.x0sa',NULL,'',0.00,0,0,0,'2022-05-31 18:50:10','2022-06-27 23:54:05'),(19,0,'Calm','https://thirdwx.qlogo.cn/mmopen/vi_32/3K0mwZ0ldkY2JkJDHxGjp0dVG9zrF2rGVhyia7wrGjsyia1Eia9Jtv6d9DTUvibaDxKSeMXPfxjXMQ4bxzIZXhibdFw/132','',0,'13079070000','oB5d-5T1XuVOYMfAc0','kVO3V5','$2y$10$.A3I94cPGAEHcXqLDCf5buU8HujaBQnwEjUhrmM/kwCxra.ZnITd2',NULL,'',0.00,0,0,0,'2022-05-31 19:27:29','2022-06-27 23:57:39'),(20,0,'哄哄','https://thirdwx.qlogo.cn/mmopen/vi_32/Q3auHgzwzM6tiaKlrLBGWyV7nyGSGFFeU7eR0zXtjshH5F5WViafgT1RVbkIj2kLBbeugU9P95hiakEnImEcU6iboQ/132','',0,'15637710000','oB5d-5XahbNHUHNA','WjwJVP','$2y$10$5PemoPWs6PoW3hfan.enjOSeTBhlo/N6NbIP3V6EMs5d4LMYMVZ/S',NULL,'',0.00,0,0,0,'2022-06-01 08:34:10','2022-06-27 23:57:36'),(21,0,'404','https://thirdwx.qlogo.cn/mmopen/vi_32/Tnw5gbRSiaelR92iawiaLibeYMWkdXrib2945ekOGicR4DxR4lgVnXQpNIo5Hb7AWZp6TdKkYrPYDSjVrOuDvNv85IiaA/132','',0,'17688160000','oB5d-5aMhMYnkmli8k','nV59VX','$2y$10$UxJ8PmDrk8JY7a/1oBlmue9em1yc7t3MX/1KKKZicsAQSAM6GYSai',NULL,'',0.00,0,0,0,'2022-06-01 09:45:14','2022-06-27 23:57:33'),(22,0,'halo','https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI0d83kur0XmAXcVdZGwW1NE2IlEZoJkb69Sic7eXNntC5ncfl7yeuVkib1iaeahWB2ZPIvf6jbv6YJA/132','',0,'13705320000','oB5d-5aA-LYObgJ1vK1aHmQszbQM','rjaAj3','$2y$10$cObApyNndkKQqgvUAa6s8eebfiM13JOrg16BLVqLGO1T5UXD6DkQ6',NULL,'',0.00,0,0,0,'2022-06-01 11:56:21','2022-06-27 23:53:34'),(23,0,'y','https://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqKPiajeSC8SoOMGCDzgqYd5hxxrBgsaLfvw7QCLyVDNaTYsiaDFDSdIXMFmdcOWia1kjS3bRuia9eWwQ/132','',0,'17714500000','oB5d-5XfD-8f5eJITMuSAompSyBE','PV3Xjp','$2y$10$jpvdxT09UGv5cLH94YbWqOIzYGBfTQM/Up46Ti2nMLrbnFgtWo04m',NULL,'',0.00,0,0,0,'2022-06-01 13:26:51','2022-06-27 23:53:28'),(24,0,'我不李志','https://thirdwx.qlogo.cn/mmopen/vi_32/jJ8dhDjVlD7FwMwOhmkapBAx8wn8pgyv8bWCkPLSzfKUHIdf0pgtyJMx4ChMV3haoNIlia6Ns55YI1rYsDeMAng/132','',0,'15919320000','oB5d-5cLTSqZS9AZU35-D','YQq6Vb','$2y$10$YrY.68Gx8AwEN2Al6gpLqO9GLfpvKPX3joV2lrxhdp3v4q7GwR3VO',NULL,'',0.00,0,0,0,'2022-06-01 16:11:46','2022-06-27 23:54:25'),(25,0,'- 　  未来与你゜','https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJiccPZRicw57BmUOibspM0m2xudnI7gfDon5xMo09oTM3mCgfXMINgibySsUXNOX15HUZaUwlvU4Xm5A/132','',0,'18861230000','oB5d-5Sy_yS3KDstbCGxmhp','bjrLQm','$2y$10$xMr3W1Nsjq1VfUwt6DZsqOVKqTB.mZEM9A.MJdZWgShmILAf6f3xi',NULL,'',0.00,0,0,0,'2022-06-01 23:19:43','2022-06-27 23:54:21'),(26,0,'Yolo.','https://thirdwx.qlogo.cn/mmopen/vi_32/g4wzd5sQZzBffeZ1JQh8UXzLhkoISib1Y6g9IibOFEf9GMoIqSaFyLcydysib22kvm1y4HFckHefQWYtJzJomRkBg/132','',0,'18194440000','oB5d-5StvAgPOi0F1MV7fX','Az6Ajb','$2y$10$fWkxE3qm3MRpY9X.yEG2mO4JxQBBLGbwxlC3jm72TMlch6NGrijjW',NULL,'',0.00,0,0,0,'2022-06-06 14:55:04','2022-06-27 23:54:18'),(27,0,'欢乐马','https://thirdwx.qlogo.cn/mmopen/vi_32/Q3auHgzwzM51DsK5dtqCwu87ZleHLSFCJpA9q4HFUJ0mxicg0tP4lctq7Eu7vHzjUTLuJMa9urwkMBCPhW0lVhA/132','',0,'18174500000','oB5d-5ebBixrlO7VM','YQBDjJ','$2y$10$dfXoFWaHEyIT8HmKatFHze1vztv.Lg.s5xEpuegbtJPLOyAGh3U1S',NULL,'',0.00,0,0,0,'2022-06-07 22:29:43','2022-06-27 23:57:19'),(28,0,'欢乐马','https://thirdwx.qlogo.cn/mmopen/vi_32/Q3auHgzwzM51DsK5dtqCwu87ZleHLSFCJpA9q4HFUJ0mxicg0tP4lctq7Eu7vHzjUTLuJMa9urwkMBCPhW0lVhA/132','',0,'16602120000','oB5d-5ebmNsBixrlO7VM','2VJeQY','$2y$10$8GnKhbALGtgq1NSoAiCkAu4EQKv6KKVs0McziAmLg2tqSUffdT1iW',NULL,'',0.00,0,0,0,'2022-06-07 22:29:47','2022-06-27 23:57:15'),(29,0,'欢乐马','https://thirdwx.qlogo.cn/mmopen/vi_32/Q3auHgzwzM51DsK5dtqCwu87ZleHLSFCJpA9q4HFUJ0mxicg0tP4lctq7Eu7vHzjUTLuJMa9urwkMBCPhW0lVhA/132','',0,'16602120000','oB5d-5ehwsBixrlO7VM','YQxNj5','$2y$10$QiUvbVZVFooy7fWfEhjq5uO1LTEXpvZPYjmZO0MC3DyEbB7AsOTEW',NULL,'',0.00,0,0,0,'2022-06-07 22:29:50','2022-06-27 23:57:13'),(30,0,'AD','https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLaJNJoXMxpELGYzrss5l60ctHEb30khgccdw5fribV7c6AbFUJbqQ1dxtFw8cMibVCzHhSwnMibmKMQ/132','',0,'13043340000','oB5d-5RUFDbDIzBoo4','OQGrz9','$2y$10$1Snzpj/oBF3.GfNL.KaRW.bOYQ9LgbKyOArz10bYE31JMb5mPGkxu',NULL,'222.128.6.83',0.00,0,0,0,'2022-06-13 11:31:54','2022-06-27 23:57:11'),(31,0,'岭','https://thirdwx.qlogo.cn/mmopen/vi_32/GxcRoicI6agu6aBiayqIH4g1dnIqo4xOUTyHSb1GjmiaDzjhm57XcN7UnvDKKMF7HU1aghwpFKrfvM9Aa4jxrRNXg/132','',0,'18211240000','oB5d-5cCUgaPAFRh9TJ34','DjpwVA','$2y$10$gMPJduoycHmvNrzUU71pfeia4P08UQnn7xb1n8sTnTClBus.Oc94u',NULL,'116.22.199.135',0.00,0,0,0,'2022-06-13 11:33:45','2022-06-27 23:57:09'),(34,0,'Hui','https://thirdwx.qlogo.cn/mmopen/vi_32/TM0xGW2HD8T2SQlx8IMUwMMRFScQ2GibftSbgoO2k1oAsej4HwWj0CcrSQ2GeTkP24fQZdaSNbgDjaiaBHxJ9KGQ/132','',0,'13035800000','oB5d-5dxewK_Uz0CjIfrY0','DjpwVA','$2y$10$XV2msVAfPGSjw265sRwkO.oMkrT2oRZgEt/wc8c0ZY3CFbKroQuxS',NULL,'112.96.198.152',0.00,0,0,0,'2022-06-17 09:44:43','2022-06-27 23:57:06'),(35,0,'超级大可爱','https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLAAd1icA7YkNeu7XtGBVWYsppMKiclekPm8ArBRFEuuSpgAAy1hNeeEoM2XGhia7XnOdC4fvbCMSiamA/132','',0,'13802940000','oB5d-5RBTUbFpS-OW_Q','6j75Qk','$2y$10$GZyDlyIOMX8iudDeX2mpCet9mGKe22VDhPYMM47zWnJ6bMoghOrJe',NULL,'81.68.168.235',0.00,0,0,0,'2022-06-17 09:55:43','2022-06-27 23:57:03'),(36,0,'3','https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJ2hiavQXlIMuekicWBFxZtQ35tZKJMXcgaHfhxIbrCEnHMaxBMOeZIvDkE15LR0vVLS6E3XuYlxANw/132','',0,'13382960000','oB5d-5e9VOG72nuEOtSo','5VEJjD','$2y$10$VshjKuQPOv1iniMR95uDG.CWNgUfaz.gvgsmkrE0YftWK5.dEfelu',NULL,'222.189.86.141',0.00,0,0,0,'2022-06-22 11:24:12','2022-06-27 23:57:01'),(37,0,'陈成成','https://thirdwx.qlogo.cn/mmopen/vi_32/ib7h6tMoxHq88ta0MKs60tPBIIiaz9ia49C7Boln2z3Wtx699nL9pGYooYiaLHDqOjibHDxF4ESG4YoXxZGKcicOIBxw/132','',0,'13590340000','oB5d-5VU2Rg9XV_SN-vQ','7VdAjx','$2y$10$ORZaAlrO.PCidrFPzHU7rOWpb1Fu0YUsE9Z5R4IaCatdldFUPnAYW',NULL,'113.71.41.234',0.00,0,0,0,'2022-06-22 11:52:37','2022-06-27 23:56:59'),(38,0,'缄默','https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJtSuT42LVNRsMHXGgQf4gaZjoSeic8mHyWRaQbCfLROPickyOCibofZm8URicMx63ibc3w1BxibomarWng/132','',0,'13240050000','oB5d-5Rhy4ZMObVBpc','XQZOVd','$2y$10$rbMaoFfjpzOCSmB6QahX8ucbDR8yNckVNsUYE7uSeiypmSq4nVlqe',NULL,'117.173.87.188',0.00,0,0,0,'2022-06-22 13:43:50','2022-06-27 23:56:56'),(39,0,'RHao','https://thirdwx.qlogo.cn/mmopen/vi_32/vbgqZ4LnD7RoCpKTTL3HErqovqluzoZUcCMrxXrkG6ngMWruLCDF9Q1ksnvLLmsahPe2acDX3ibYZQ4U4kLSCEw/132','',0,'13862660000','oB5d-5UdgzJpeptB_9PwB8','MQARVD','$2y$10$uTDB2MRgUBzXSzD0CgvBKe/0vB8NjLsv8Sx05tWtBbMfBmpQr.kNi',NULL,'117.82.78.118',0.00,0,0,0,'2022-06-22 13:48:46','2022-06-27 23:56:53'),(40,0,'学磊','https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLHA6lAeUaQNVPaXyISIrWHv6HWJROoib0Ieze3kSsCcqtfylw07KsLwvJwZXbgJLxwG3MXGpk0a6w/132','',0,'18768540000','oB5d-5eoCobeFM6jlK3GA','rzgRje','$2y$10$q5W6pVNrcb/Bj.A8uqmdEu.u2552rVYcPrfOOm58Pyb85T923/1e2',NULL,'115.197.238.27',0.00,0,0,0,'2022-06-22 13:50:39','2022-06-27 23:56:50'),(41,0,'锦鲤0229','https://thirdwx.qlogo.cn/mmopen/vi_32/mvxl1xzYcAdmS6XQXpzso7dtlsib4hFfsGYNwNDaT5PtQd7YRib6eI1Tzy3TXoLWib9KScmeREhZr4vF7TqeTEKJA/132','',0,'17753100000','oB5d-5Tvse4cL1DXW2J0A','nzN5jJ','$2y$10$NVmUezlUKhiLIlk.p4FcFO8G9pvQA/zao9tK6egaWdgdPpjQtwQ3S',NULL,'112.37.142.211',0.00,0,0,0,'2022-06-25 15:46:21','2022-06-27 23:56:45'),(42,0,'Trick','https://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83epJ2icQaK2G50LX353TRyDlbFG6R9ia9jVibA0xKd5anUoxia6qeZUuxoequ092uJTbXjKLTE4WeZ4OXQ/132','',0,'18861530000','oB5d-5Va0ECuVBo-6V1lU','2QvWVx','$2y$10$bpNULrIZTuIVwsjZH78nr.HwPz6c5qNITwBjY9.Uht3O4jzp2ss.6',NULL,'39.144.154.44',0.00,0,0,0,'2022-06-27 13:42:47','2022-06-27 23:56:41');
/*!40000 ALTER TABLE `store_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_wallet`
--

DROP TABLE IF EXISTS `user_wallet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_wallet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` char(32) NOT NULL COMMENT '用户uid',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态：0、正常 1、冻结',
  `wallet_income` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '钱包总收入额',
  `wallet_outcome` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '钱包总支出额',
  `balance_fee` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '钱包总可用余额',
  `check_sign` varchar(100) DEFAULT '' COMMENT '用于安全检查，检查不通过为异常。',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='用户钱包';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_wallet`
--

LOCK TABLES `user_wallet` WRITE;
/*!40000 ALTER TABLE `user_wallet` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_wallet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_wallet_log`
--

DROP TABLE IF EXISTS `user_wallet_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_wallet_log` (
  `id` int(10) unsigned NOT NULL,
  `uid` int(11) NOT NULL COMMENT '用户uid',
  `number` varchar(32) NOT NULL DEFAULT '' COMMENT '流水号',
  `target_type` smallint(5) unsigned DEFAULT NULL COMMENT '业务类型，1：充值，2：提现  3：结算',
  `balance_fee` decimal(10,2) DEFAULT '0.00' COMMENT '变动的金额',
  `result_uid` int(11) DEFAULT NULL COMMENT '经办人',
  `remark` varchar(150) NOT NULL DEFAULT '' COMMENT '处理结果',
  `status` smallint(5) unsigned DEFAULT NULL COMMENT '状态 0、待处理 1、处理完成 2、驳回',
  `operation_sql` mediumtext NOT NULL COMMENT '操作sql',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='用户钱包流水记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_wallet_log`
--

LOCK TABLES `user_wallet_log` WRITE;
/*!40000 ALTER TABLE `user_wallet_log` DISABLE KEYS */;
INSERT INTO `user_wallet_log` VALUES (1,1,'20210317011233smzb1Sia4ShSj8JQ',2,93.00,NULL,'',0,'','2021-03-17 01:12:33','2021-03-17 01:12:33'),(2,1,'20210317011252d9T83lt712vJISSS',2,6.00,NULL,'',0,'','2021-03-17 01:12:52','2021-03-17 01:12:52'),(3,1,'20210317011304xYMN9ULVdwKWjuVl',2,3.00,NULL,'',0,'','2021-03-17 01:13:04','2021-03-17 01:13:04'),(4,1,'20210318173131807g4pE4bFGF2iDP',2,47.76,NULL,'',0,'','2021-03-18 17:31:31','2021-03-18 17:31:31'),(5,1,'20210331143503KHWLF183BZwNiETS',2,18.00,NULL,'',0,'','2021-03-31 14:35:03','2021-03-31 14:35:03'),(6,1,'20210410021815ci3HwEvhBtf5tJjw',2,1.00,NULL,'',0,'update `user_wallet` set `check_sign` = \"B2168D247CF39923863C05B332A1EEE082400140A4B8882F9EF2689CFCFC026C\", `balance_fee` = \"3804.33\", `wallet_outcome` = \"1.00\", `user_wallet`.`updated_at` = \"2021-04-10 02:18:15\" where `uid` = \"1\"','2021-04-10 02:18:15','2021-04-10 02:18:15');
/*!40000 ALTER TABLE `user_wallet_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_withdraw_cash_list`
--

DROP TABLE IF EXISTS `user_withdraw_cash_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_withdraw_cash_list` (
  `id` int(10) unsigned NOT NULL COMMENT 'auto id',
  `uid` varchar(32) NOT NULL COMMENT '申请用户uid',
  `withdraw_way` tinyint(1) NOT NULL DEFAULT '1' COMMENT '提现（渠道）方式 1银行转账',
  `withdraw_status` smallint(5) unsigned DEFAULT NULL COMMENT '处理状态。 1发起申请（待审核理）前台显示处理中，2提现成功，3审核不通过',
  `number` char(32) DEFAULT '' COMMENT '提现单号',
  `receivable_account` varchar(32) DEFAULT '' COMMENT '收款账户',
  `name` varchar(30) DEFAULT '' COMMENT '收款人姓名',
  `address` varchar(100) DEFAULT '' COMMENT '开户行地址',
  `withdraw_fee` decimal(10,2) DEFAULT '0.00' COMMENT '提现金额',
  `content` varchar(500) DEFAULT '' COMMENT '审核不通过原因',
  `verify_user` varchar(32) DEFAULT '' COMMENT '审核人',
  `action_user` varchar(32) DEFAULT '' COMMENT '操作人',
  `action_at` datetime DEFAULT NULL COMMENT '审核时间',
  `sent_notice_at` datetime DEFAULT NULL COMMENT '发送通知时间',
  `create_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除：0未删除，1已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='提现记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_withdraw_cash_list`
--

LOCK TABLES `user_withdraw_cash_list` WRITE;
/*!40000 ALTER TABLE `user_withdraw_cash_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_withdraw_cash_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'easyshop'
--

--
-- Dumping routines for database 'easyshop'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-28 10:52:58
