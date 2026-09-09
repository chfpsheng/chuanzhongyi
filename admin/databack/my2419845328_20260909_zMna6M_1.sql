#MetInfo.cn Created version:8.1 
#http://www.chuanzhongyi.com/admin/
#met_
#mysql
# --------------------------------------------------------


DROP TABLE IF EXISTS met_admin_column;
CREATE TABLE `met_admin_column` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT '',
  `url` varchar(255) DEFAULT '',
  `bigclass` int(11) DEFAULT '0',
  `field` int(11) DEFAULT '0',
  `type` int(11) DEFAULT '0' COMMENT '0:系统功能 ，1:左侧菜单，2:顶部菜单',
  `list_order` int(11) DEFAULT '0',
  `icon` varchar(255) DEFAULT '',
  `info` text,
  `display` int(11) DEFAULT '1' COMMENT '0:不显示 1：显示',
  `menu_lang` varchar(255) DEFAULT NULL COMMENT '菜单名称语言变量、',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS met_admin_has_permissions;
CREATE TABLE `met_admin_has_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL COMMENT '角色id',
  `uid` int(11) DEFAULT NULL COMMENT '成员id',
  `aid` varchar(50) NOT NULL COMMENT '权限关联id或权限',
  `type` varchar(50) DEFAULT NULL COMMENT '权限类型  s:系统功能模块, f:系统功能 m:系统菜单 c:栏目 a:应用 l:语言',
  `access` varchar(255) DEFAULT NULL COMMENT '操作权限  0:无权限 1:查看 2:操作',
  `info` text COMMENT '说明',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=257 DEFAULT CHARSET=utf8;

INSERT INTO met_admin_has_permissions VALUES('1','2','0','1','l','1','');
INSERT INTO met_admin_has_permissions VALUES('2','2','0','2','l','1','');
INSERT INTO met_admin_has_permissions VALUES('3','2','0','8888','f','1','');
INSERT INTO met_admin_has_permissions VALUES('4','2','0','1301','s','1','');
INSERT INTO met_admin_has_permissions VALUES('5','2','0','1802','s','1','');
INSERT INTO met_admin_has_permissions VALUES('6','2','0','1803','s','1','');
INSERT INTO met_admin_has_permissions VALUES('7','2','0','1804','s','1','');
INSERT INTO met_admin_has_permissions VALUES('8','2','0','126','c','1','');
INSERT INTO met_admin_has_permissions VALUES('9','2','0','132','c','1','');
INSERT INTO met_admin_has_permissions VALUES('10','2','0','133','c','1','');
INSERT INTO met_admin_has_permissions VALUES('11','2','0','134','c','1','');
INSERT INTO met_admin_has_permissions VALUES('12','2','0','77','c','1','');
INSERT INTO met_admin_has_permissions VALUES('13','2','0','127','c','1','');
INSERT INTO met_admin_has_permissions VALUES('14','2','0','136','c','1','');
INSERT INTO met_admin_has_permissions VALUES('15','2','0','137','c','1','');
INSERT INTO met_admin_has_permissions VALUES('16','2','0','139','c','1','');
INSERT INTO met_admin_has_permissions VALUES('17','2','0','128','c','1','');
INSERT INTO met_admin_has_permissions VALUES('18','2','0','140','c','1','');
INSERT INTO met_admin_has_permissions VALUES('19','2','0','141','c','1','');
INSERT INTO met_admin_has_permissions VALUES('20','2','0','142','c','1','');
INSERT INTO met_admin_has_permissions VALUES('21','2','0','129','c','1','');
INSERT INTO met_admin_has_permissions VALUES('22','2','0','130','c','1','');
INSERT INTO met_admin_has_permissions VALUES('23','2','0','131','c','1','');
INSERT INTO met_admin_has_permissions VALUES('24','2','0','76','c','1','');
INSERT INTO met_admin_has_permissions VALUES('25','2','0','73','c','1','');
INSERT INTO met_admin_has_permissions VALUES('26','2','0','74','c','1','');
INSERT INTO met_admin_has_permissions VALUES('27','2','0','2','c','1','');
INSERT INTO met_admin_has_permissions VALUES('28','2','0','1','c','1','');
INSERT INTO met_admin_has_permissions VALUES('29','2','0','143','c','1','');
INSERT INTO met_admin_has_permissions VALUES('30','2','0','144','c','1','');
INSERT INTO met_admin_has_permissions VALUES('31','2','0','145','c','1','');
INSERT INTO met_admin_has_permissions VALUES('32','2','0','146','c','1','');
INSERT INTO met_admin_has_permissions VALUES('33','2','0','163','c','1','');
INSERT INTO met_admin_has_permissions VALUES('34','2','0','148','c','1','');
INSERT INTO met_admin_has_permissions VALUES('35','2','0','149','c','1','');
INSERT INTO met_admin_has_permissions VALUES('36','2','0','150','c','1','');
INSERT INTO met_admin_has_permissions VALUES('37','2','0','151','c','1','');
INSERT INTO met_admin_has_permissions VALUES('38','2','0','152','c','1','');
INSERT INTO met_admin_has_permissions VALUES('39','2','0','153','c','1','');
INSERT INTO met_admin_has_permissions VALUES('40','2','0','154','c','1','');
INSERT INTO met_admin_has_permissions VALUES('41','2','0','155','c','1','');
INSERT INTO met_admin_has_permissions VALUES('42','2','0','156','c','1','');
INSERT INTO met_admin_has_permissions VALUES('43','2','0','157','c','1','');
INSERT INTO met_admin_has_permissions VALUES('44','2','0','158','c','1','');
INSERT INTO met_admin_has_permissions VALUES('45','2','0','159','c','1','');
INSERT INTO met_admin_has_permissions VALUES('46','2','0','160','c','1','');
INSERT INTO met_admin_has_permissions VALUES('47','2','0','161','c','1','');
INSERT INTO met_admin_has_permissions VALUES('48','2','0','162','c','1','');
INSERT INTO met_admin_has_permissions VALUES('49','2','0','164','c','1','');
INSERT INTO met_admin_has_permissions VALUES('50','2','0','1201','s','1','');
INSERT INTO met_admin_has_permissions VALUES('51','2','0','9999','s','1','');
INSERT INTO met_admin_has_permissions VALUES('52','2','0','9888','s','1','');
INSERT INTO met_admin_has_permissions VALUES('53','2','0','9777','s','1','');
INSERT INTO met_admin_has_permissions VALUES('54','2','0','1202','s','1','');
INSERT INTO met_admin_has_permissions VALUES('55','2','0','1509','s','1','');
INSERT INTO met_admin_has_permissions VALUES('56','2','0','1510','s','1','');
INSERT INTO met_admin_has_permissions VALUES('57','2','0','1511','s','1','');
INSERT INTO met_admin_has_permissions VALUES('58','2','0','1106','s','1','');
INSERT INTO met_admin_has_permissions VALUES('59','2','0','1404','s','1','');
INSERT INTO met_admin_has_permissions VALUES('60','2','0','1405','s','1','');
INSERT INTO met_admin_has_permissions VALUES('61','2','0','1505','s','1','');
INSERT INTO met_admin_has_permissions VALUES('62','2','0','1800','s','1','');
INSERT INTO met_admin_has_permissions VALUES('63','2','0','1801','s','1','');
INSERT INTO met_admin_has_permissions VALUES('64','2','0','10070','a','1','');
INSERT INTO met_admin_has_permissions VALUES('65','2','0','50002','a','1','');
INSERT INTO met_admin_has_permissions VALUES('66','2','0','1506','s','1','');
INSERT INTO met_admin_has_permissions VALUES('67','2','0','1601','s','1','');
INSERT INTO met_admin_has_permissions VALUES('68','2','0','1603','s','1','');
INSERT INTO met_admin_has_permissions VALUES('69','2','0','1200','s','1','');
INSERT INTO met_admin_has_permissions VALUES('70','2','0','1004','s','1','');
INSERT INTO met_admin_has_permissions VALUES('71','2','0','1005','s','1','');
INSERT INTO met_admin_has_permissions VALUES('72','2','0','1002','s','1','');
INSERT INTO met_admin_has_permissions VALUES('73','2','0','0','s','1','');
INSERT INTO met_admin_has_permissions VALUES('74','2','0','1007','s','1','');
INSERT INTO met_admin_has_permissions VALUES('75','2','0','1003','s','1','');
INSERT INTO met_admin_has_permissions VALUES('76','2','0','1604','s','1','');
INSERT INTO met_admin_has_permissions VALUES('77','2','0','1605','s','1','');
INSERT INTO met_admin_has_permissions VALUES('78','2','0','1508','s','1','');
INSERT INTO met_admin_has_permissions VALUES('79','2','0','1','m','1','');
INSERT INTO met_admin_has_permissions VALUES('80','2','0','2','m','1','');
INSERT INTO met_admin_has_permissions VALUES('81','2','0','3','m','1','');
INSERT INTO met_admin_has_permissions VALUES('82','2','0','21','m','1','');
INSERT INTO met_admin_has_permissions VALUES('83','2','0','22','m','1','');
INSERT INTO met_admin_has_permissions VALUES('84','2','0','23','m','1','');
INSERT INTO met_admin_has_permissions VALUES('85','2','0','24','m','1','');
INSERT INTO met_admin_has_permissions VALUES('86','2','0','4','m','1','');
INSERT INTO met_admin_has_permissions VALUES('87','2','0','5','m','1','');
INSERT INTO met_admin_has_permissions VALUES('88','2','0','6','m','1','');
INSERT INTO met_admin_has_permissions VALUES('89','2','0','7','m','1','');
INSERT INTO met_admin_has_permissions VALUES('90','2','0','26','m','1','');
INSERT INTO met_admin_has_permissions VALUES('91','2','0','27','m','1','');
INSERT INTO met_admin_has_permissions VALUES('92','2','0','8','m','1','');
INSERT INTO met_admin_has_permissions VALUES('93','2','0','28','m','1','');
INSERT INTO met_admin_has_permissions VALUES('94','2','0','29','m','1','');
INSERT INTO met_admin_has_permissions VALUES('95','2','0','9','m','1','');
INSERT INTO met_admin_has_permissions VALUES('96','2','0','10','m','1','');
INSERT INTO met_admin_has_permissions VALUES('97','2','0','30','m','1','');
INSERT INTO met_admin_has_permissions VALUES('98','2','0','31','m','1','');
INSERT INTO met_admin_has_permissions VALUES('99','2','0','32','m','1','');
INSERT INTO met_admin_has_permissions VALUES('100','2','0','33','m','1','');
INSERT INTO met_admin_has_permissions VALUES('101','2','0','11','m','1','');
INSERT INTO met_admin_has_permissions VALUES('102','2','0','38','m','1','');
INSERT INTO met_admin_has_permissions VALUES('103','2','0','34','m','1','');
INSERT INTO met_admin_has_permissions VALUES('104','2','0','39','m','1','');
INSERT INTO met_admin_has_permissions VALUES('105','2','0','40','m','1','');
INSERT INTO met_admin_has_permissions VALUES('106','2','0','41','m','1','');
INSERT INTO met_admin_has_permissions VALUES('107','2','0','42','m','1','');
INSERT INTO met_admin_has_permissions VALUES('108','2','0','64','m','1','');
INSERT INTO met_admin_has_permissions VALUES('109','2','0','53','m','1','');
INSERT INTO met_admin_has_permissions VALUES('110','2','0','52','m','1','');
INSERT INTO met_admin_has_permissions VALUES('111','2','0','54','m','1','');
INSERT INTO met_admin_has_permissions VALUES('112','2','0','45','m','1','');
INSERT INTO met_admin_has_permissions VALUES('113','2','0','44','m','1','');
INSERT INTO met_admin_has_permissions VALUES('114','2','0','46','m','1','');
INSERT INTO met_admin_has_permissions VALUES('115','2','0','47','m','1','');
INSERT INTO met_admin_has_permissions VALUES('116','2','0','48','m','1','');
INSERT INTO met_admin_has_permissions VALUES('117','2','0','49','m','1','');
INSERT INTO met_admin_has_permissions VALUES('118','2','0','51','m','1','');
INSERT INTO met_admin_has_permissions VALUES('119','2','0','55','m','1','');
INSERT INTO met_admin_has_permissions VALUES('120','2','0','56','m','1','');
INSERT INTO met_admin_has_permissions VALUES('121','2','0','57','m','1','');
INSERT INTO met_admin_has_permissions VALUES('122','2','0','58','m','1','');
INSERT INTO met_admin_has_permissions VALUES('123','2','0','59','m','1','');
INSERT INTO met_admin_has_permissions VALUES('124','2','0','60','m','1','');
INSERT INTO met_admin_has_permissions VALUES('125','2','0','61','m','1','');
INSERT INTO met_admin_has_permissions VALUES('126','2','0','62','m','1','');
INSERT INTO met_admin_has_permissions VALUES('127','2','0','63','m','1','');
INSERT INTO met_admin_has_permissions VALUES('128','2','0','50','m','1','');
INSERT INTO met_admin_has_permissions VALUES('129','3','0','1','l','1','');
INSERT INTO met_admin_has_permissions VALUES('130','3','0','2','l','1','');
INSERT INTO met_admin_has_permissions VALUES('131','3','0','8888','f','1','');
INSERT INTO met_admin_has_permissions VALUES('132','3','0','1301','s','1','');
INSERT INTO met_admin_has_permissions VALUES('133','3','0','1802','s','1','');
INSERT INTO met_admin_has_permissions VALUES('134','3','0','1803','s','1','');
INSERT INTO met_admin_has_permissions VALUES('135','3','0','1804','s','1','');
INSERT INTO met_admin_has_permissions VALUES('136','3','0','126','c','1','');
INSERT INTO met_admin_has_permissions VALUES('137','3','0','132','c','1','');
INSERT INTO met_admin_has_permissions VALUES('138','3','0','133','c','1','');
INSERT INTO met_admin_has_permissions VALUES('139','3','0','134','c','1','');
INSERT INTO met_admin_has_permissions VALUES('140','3','0','77','c','1','');
INSERT INTO met_admin_has_permissions VALUES('141','3','0','127','c','1','');
INSERT INTO met_admin_has_permissions VALUES('142','3','0','136','c','1','');
INSERT INTO met_admin_has_permissions VALUES('143','3','0','137','c','1','');
INSERT INTO met_admin_has_permissions VALUES('144','3','0','139','c','1','');
INSERT INTO met_admin_has_permissions VALUES('145','3','0','128','c','1','');
INSERT INTO met_admin_has_permissions VALUES('146','3','0','140','c','1','');
INSERT INTO met_admin_has_permissions VALUES('147','3','0','141','c','1','');
INSERT INTO met_admin_has_permissions VALUES('148','3','0','142','c','1','');
INSERT INTO met_admin_has_permissions VALUES('149','3','0','129','c','1','');
INSERT INTO met_admin_has_permissions VALUES('150','3','0','130','c','1','');
INSERT INTO met_admin_has_permissions VALUES('151','3','0','131','c','1','');
INSERT INTO met_admin_has_permissions VALUES('152','3','0','76','c','1','');
INSERT INTO met_admin_has_permissions VALUES('153','3','0','73','c','1','');
INSERT INTO met_admin_has_permissions VALUES('154','3','0','74','c','1','');
INSERT INTO met_admin_has_permissions VALUES('155','3','0','2','c','1','');
INSERT INTO met_admin_has_permissions VALUES('156','3','0','1','c','1','');
INSERT INTO met_admin_has_permissions VALUES('157','3','0','143','c','1','');
INSERT INTO met_admin_has_permissions VALUES('158','3','0','144','c','1','');
INSERT INTO met_admin_has_permissions VALUES('159','3','0','145','c','1','');
INSERT INTO met_admin_has_permissions VALUES('160','3','0','146','c','1','');
INSERT INTO met_admin_has_permissions VALUES('161','3','0','163','c','1','');
INSERT INTO met_admin_has_permissions VALUES('162','3','0','148','c','1','');
INSERT INTO met_admin_has_permissions VALUES('163','3','0','149','c','1','');
INSERT INTO met_admin_has_permissions VALUES('164','3','0','150','c','1','');
INSERT INTO met_admin_has_permissions VALUES('165','3','0','151','c','1','');
INSERT INTO met_admin_has_permissions VALUES('166','3','0','152','c','1','');
INSERT INTO met_admin_has_permissions VALUES('167','3','0','153','c','1','');
INSERT INTO met_admin_has_permissions VALUES('168','3','0','154','c','1','');
INSERT INTO met_admin_has_permissions VALUES('169','3','0','155','c','1','');
INSERT INTO met_admin_has_permissions VALUES('170','3','0','156','c','1','');
INSERT INTO met_admin_has_permissions VALUES('171','3','0','157','c','1','');
INSERT INTO met_admin_has_permissions VALUES('172','3','0','158','c','1','');
INSERT INTO met_admin_has_permissions VALUES('173','3','0','159','c','1','');
INSERT INTO met_admin_has_permissions VALUES('174','3','0','160','c','1','');
INSERT INTO met_admin_has_permissions VALUES('175','3','0','161','c','1','');
INSERT INTO met_admin_has_permissions VALUES('176','3','0','162','c','1','');
INSERT INTO met_admin_has_permissions VALUES('177','3','0','164','c','1','');
INSERT INTO met_admin_has_permissions VALUES('178','3','0','1201','s','1','');
INSERT INTO met_admin_has_permissions VALUES('179','3','0','9999','s','1','');
INSERT INTO met_admin_has_permissions VALUES('180','3','0','9888','s','1','');
INSERT INTO met_admin_has_permissions VALUES('181','3','0','9777','s','1','');
INSERT INTO met_admin_has_permissions VALUES('182','3','0','1202','s','1','');
INSERT INTO met_admin_has_permissions VALUES('183','3','0','1509','s','1','');
INSERT INTO met_admin_has_permissions VALUES('184','3','0','1510','s','1','');
INSERT INTO met_admin_has_permissions VALUES('185','3','0','1511','s','1','');
INSERT INTO met_admin_has_permissions VALUES('186','3','0','1106','s','1','');
INSERT INTO met_admin_has_permissions VALUES('187','3','0','1404','s','1','');
INSERT INTO met_admin_has_permissions VALUES('188','3','0','1405','s','0','');
INSERT INTO met_admin_has_permissions VALUES('189','3','0','1505','s','0','');
INSERT INTO met_admin_has_permissions VALUES('190','3','0','1800','s','0','');
INSERT INTO met_admin_has_permissions VALUES('191','3','0','1801','s','0','');
INSERT INTO met_admin_has_permissions VALUES('192','3','0','10070','a','0','');
INSERT INTO met_admin_has_permissions VALUES('193','3','0','50002','a','0','');
INSERT INTO met_admin_has_permissions VALUES('194','3','0','1506','s','0','');
INSERT INTO met_admin_has_permissions VALUES('195','3','0','1601','s','0','');
INSERT INTO met_admin_has_permissions VALUES('196','3','0','1603','s','0','');
INSERT INTO met_admin_has_permissions VALUES('197','3','0','1200','s','0','');
INSERT INTO met_admin_has_permissions VALUES('198','3','0','1004','s','0','');
INSERT INTO met_admin_has_permissions VALUES('199','3','0','1005','s','0','');
INSERT INTO met_admin_has_permissions VALUES('200','3','0','1002','s','1','');
INSERT INTO met_admin_has_permissions VALUES('201','3','0','0','s','1','');
INSERT INTO met_admin_has_permissions VALUES('202','3','0','1007','s','1','');
INSERT INTO met_admin_has_permissions VALUES('203','3','0','1003','s','1','');
INSERT INTO met_admin_has_permissions VALUES('204','3','0','1604','s','1','');
INSERT INTO met_admin_has_permissions VALUES('205','3','0','1605','s','1','');
INSERT INTO met_admin_has_permissions VALUES('206','3','0','1508','s','1','');
INSERT INTO met_admin_has_permissions VALUES('207','3','0','1','m','1','');
INSERT INTO met_admin_has_permissions VALUES('208','3','0','2','m','1','');
INSERT INTO met_admin_has_permissions VALUES('209','3','0','3','m','1','');
INSERT INTO met_admin_has_permissions VALUES('210','3','0','21','m','1','');
INSERT INTO met_admin_has_permissions VALUES('211','3','0','22','m','1','');
INSERT INTO met_admin_has_permissions VALUES('212','3','0','23','m','1','');
INSERT INTO met_admin_has_permissions VALUES('213','3','0','24','m','1','');
INSERT INTO met_admin_has_permissions VALUES('214','3','0','4','m','1','');
INSERT INTO met_admin_has_permissions VALUES('215','3','0','5','m','0','');
INSERT INTO met_admin_has_permissions VALUES('216','3','0','6','m','0','');
INSERT INTO met_admin_has_permissions VALUES('217','3','0','7','m','0','');
INSERT INTO met_admin_has_permissions VALUES('218','3','0','26','m','0','');
INSERT INTO met_admin_has_permissions VALUES('219','3','0','27','m','0','');
INSERT INTO met_admin_has_permissions VALUES('220','3','0','8','m','0','');
INSERT INTO met_admin_has_permissions VALUES('221','3','0','28','m','0','');
INSERT INTO met_admin_has_permissions VALUES('222','3','0','29','m','0','');
INSERT INTO met_admin_has_permissions VALUES('223','3','0','9','m','1','');
INSERT INTO met_admin_has_permissions VALUES('224','3','0','10','m','1','');
INSERT INTO met_admin_has_permissions VALUES('225','3','0','30','m','1','');
INSERT INTO met_admin_has_permissions VALUES('226','3','0','31','m','1','');
INSERT INTO met_admin_has_permissions VALUES('227','3','0','32','m','1','');
INSERT INTO met_admin_has_permissions VALUES('228','3','0','33','m','1','');
INSERT INTO met_admin_has_permissions VALUES('229','3','0','11','m','1','');
INSERT INTO met_admin_has_permissions VALUES('230','3','0','38','m','1','');
INSERT INTO met_admin_has_permissions VALUES('231','3','0','34','m','0','');
INSERT INTO met_admin_has_permissions VALUES('232','3','0','39','m','0','');
INSERT INTO met_admin_has_permissions VALUES('233','3','0','40','m','0','');
INSERT INTO met_admin_has_permissions VALUES('234','3','0','41','m','1','');
INSERT INTO met_admin_has_permissions VALUES('235','3','0','42','m','1','');
INSERT INTO met_admin_has_permissions VALUES('236','3','0','64','m','1','');
INSERT INTO met_admin_has_permissions VALUES('237','3','0','53','m','1','');
INSERT INTO met_admin_has_permissions VALUES('238','3','0','52','m','1','');
INSERT INTO met_admin_has_permissions VALUES('239','3','0','54','m','1','');
INSERT INTO met_admin_has_permissions VALUES('240','3','0','45','m','1','');
INSERT INTO met_admin_has_permissions VALUES('241','3','0','44','m','1','');
INSERT INTO met_admin_has_permissions VALUES('242','3','0','46','m','1','');
INSERT INTO met_admin_has_permissions VALUES('243','3','0','47','m','1','');
INSERT INTO met_admin_has_permissions VALUES('244','3','0','48','m','0','');
INSERT INTO met_admin_has_permissions VALUES('245','3','0','49','m','1','');
INSERT INTO met_admin_has_permissions VALUES('246','3','0','51','m','1','');
INSERT INTO met_admin_has_permissions VALUES('247','3','0','55','m','1','');
INSERT INTO met_admin_has_permissions VALUES('248','3','0','56','m','0','');
INSERT INTO met_admin_has_permissions VALUES('249','3','0','57','m','0','');
INSERT INTO met_admin_has_permissions VALUES('250','3','0','58','m','0','');
INSERT INTO met_admin_has_permissions VALUES('251','3','0','59','m','0','');
INSERT INTO met_admin_has_permissions VALUES('252','3','0','60','m','0','');
INSERT INTO met_admin_has_permissions VALUES('253','3','0','61','m','0','');
INSERT INTO met_admin_has_permissions VALUES('254','3','0','62','m','0','');
INSERT INTO met_admin_has_permissions VALUES('255','3','0','63','m','0','');
INSERT INTO met_admin_has_permissions VALUES('256','3','0','50','m','0','');

DROP TABLE IF EXISTS met_admin_logs;
CREATE TABLE `met_admin_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT '',
  `name` varchar(255) DEFAULT '',
  `module` varchar(255) DEFAULT '',
  `current_url` varchar(255) DEFAULT '',
  `brower` varchar(255) DEFAULT '',
  `result` varchar(255) DEFAULT '',
  `ip` varchar(50) DEFAULT '',
  `client` varchar(50) DEFAULT '',
  `time` int(11) DEFAULT '0',
  `user_agent` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO met_admin_logs VALUES('1','laoyang','loginbypassword','adminuser','/admin/?n=login&c=login&a=dologin','Chrome 152.0.0.0','failed','81.31.232.46','PC','1788947009','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36');
INSERT INTO met_admin_logs VALUES('2','laoyang','loginbypassword','adminuser','/admin/?n=login&c=login&a=dologin','Chrome 152.0.0.0','failed','81.31.232.46','PC','1788947017','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36');
INSERT INTO met_admin_logs VALUES('3','laoyang','loginbypassword','adminuser','/admin/?n=login&c=login&a=dologin','Chrome 152.0.0.0','failed','81.31.232.46','PC','1788947024','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36');
INSERT INTO met_admin_logs VALUES('4','laoyang','loginbypassword','adminuser','/admin/?n=login&c=login&a=dologin','Chrome 152.0.0.0','success','81.31.232.46','PC','1788947752','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36');

DROP TABLE IF EXISTS met_admin_menus;
CREATE TABLE `met_admin_menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT '0' COMMENT 'pid',
  `name` varchar(100) DEFAULT '' COMMENT 'name',
  `url` varchar(255) DEFAULT '' COMMENT 'url',
  `aid` int(11) DEFAULT '0' COMMENT '权限id',
  `sid` int(11) DEFAULT '0' COMMENT '关联模块权限',
  `type` int(11) DEFAULT '0' COMMENT '1:左侧菜单，2:顶部菜单，3:可视化菜单',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `icon` varchar(255) DEFAULT '' COMMENT '图标',
  `info` text COMMENT '描述信息',
  `display` int(11) DEFAULT '1' COMMENT '0:不显示 1：显示',
  `menu_lang` varchar(255) DEFAULT NULL COMMENT '菜单名称语言变量、',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

INSERT INTO met_admin_menus VALUES('1','0','content_manage','manage','1','1301','1','0','manage','内容管理','1','lang_administration');
INSERT INTO met_admin_menus VALUES('2','0','column_manage','column','2','1201','1','1','column','栏目管理','1','lang_htmColumn');
INSERT INTO met_admin_menus VALUES('3','0','feedback_interaction','','3','1202','1','2','feedback-interaction','反馈互动','1','lang_feedback_interaction');
INSERT INTO met_admin_menus VALUES('4','0','seo_settings','seo','4','1404','1','3','seo','SEO设置','1','lang_seo_set_v6');
INSERT INTO met_admin_menus VALUES('5','0','site_template','app/met_template','5','1405','1','4','template','网站模板','1','lang_appearance');
INSERT INTO met_admin_menus VALUES('6','0','application','myapp','6','1505','1','5','application','应用插件','1','lang_myapp');
INSERT INTO met_admin_menus VALUES('7','0','user_manage','','7','1506','1','6','user','用户管理','1','lang_the_user');
INSERT INTO met_admin_menus VALUES('8','0','security_setting','','8','1200','1','7','safety','安全设置','1','lang_safety');
INSERT INTO met_admin_menus VALUES('9','0','multilingual','language','9','1002','1','8','multilingualism','多语言','1','lang_multilingual');
INSERT INTO met_admin_menus VALUES('10','0','basic_settings','','10','1100','1','9','setting','基本设置','1','lang_unitytxt_39');
INSERT INTO met_admin_menus VALUES('11','0','enterprise_market','partner','11','1508','1','10','partner','企业超市','1','lang_cooperation_platform');
INSERT INTO met_admin_menus VALUES('21','3','feedback_system','feed_feedback_8','21','1509','1','0','feedback','反馈系统','1','lang_mod8');
INSERT INTO met_admin_menus VALUES('22','3','message_system','feed_message_7','22','1510','1','1','message','留言系统','1','lang_mod7');
INSERT INTO met_admin_menus VALUES('23','3','recruitment_system','feed_job_6','23','1511','1','2','recruit','招聘系统','1','lang_mod6');
INSERT INTO met_admin_menus VALUES('24','3','online_settings','online','24','1106','1','3','online','客服设置','1','lang_customerService');
INSERT INTO met_admin_menus VALUES('26','7','members','user','26','1601','1','0','member','会员','1','lang_member');
INSERT INTO met_admin_menus VALUES('27','7','admins','permission','27','1603','1','1','administrator','管理员','1','lang_managertyp2');
INSERT INTO met_admin_menus VALUES('28','8','safety_efficiency','safe','28','1004','1','0','safe','安全与效率','1','lang_safety_efficiency');
INSERT INTO met_admin_menus VALUES('29','8','backup_Recovery','databack','29','1005','1','1','databack','备份与恢复','1','lang_data_processing');
INSERT INTO met_admin_menus VALUES('30','10','basic_info','webset','30','1007','1','0','information','基本信息','1','lang_upfiletips7');
INSERT INTO met_admin_menus VALUES('31','10','watermark','imgmanage','31','1003','1','1','picture','图片水印','1','lang_indexpic');
INSERT INTO met_admin_menus VALUES('32','10','banner_manage','banner','32','1604','1','2','banner','Banner管理','1','lang_banner_manage');
INSERT INTO met_admin_menus VALUES('33','10','mobile_menus','menu','33','1605','1','3','bottom-menu','手机菜单','1','lang_the_menu');
INSERT INTO met_admin_menus VALUES('34','0','updates','update','34','1104','2','2','update','检测更新','1','lang_checkupdate');
INSERT INTO met_admin_menus VALUES('37','8','file_manage','myfiles','37','1302','1','0','fa-file-o','文件管理','0','lang_myfiles');
INSERT INTO met_admin_menus VALUES('38','0','cache_clear','clear_cache','38','1901','2','1','clear_cache','清空缓存','1','lang_clearCache');
INSERT INTO met_admin_menus VALUES('39','0','func_collection','function_complete','39','1902','2','3','function_complete','功能大全','1','lang_funcCollection');
INSERT INTO met_admin_menus VALUES('40','0','env_detection','environmental_test','40','1903','2','4','environmental_test','环境检测','1','lang_environmental_test');
INSERT INTO met_admin_menus VALUES('41','0','style','','41','1900','3','0','','风格','1','lang_skinstyle');
INSERT INTO met_admin_menus VALUES('42','41','style_settings','style_settings','42','1905','3','0','style_settings','风格设置','1','lang_style_settings');
INSERT INTO met_admin_menus VALUES('44','0','content_manage','manage','44','1301','3','2','','内容','1','lang_content');
INSERT INTO met_admin_menus VALUES('45','0','column_manage','column','45','1201','3','1','','栏目','1','lang_banner_column_v6');
INSERT INTO met_admin_menus VALUES('46','0','seo_settings','seo','46','1404','3','3','','SEO设置','1','lang_seo_set_v6');
INSERT INTO met_admin_menus VALUES('47','0','multilingual','language','47','1002','3','4','','多语言','1','lang_multilingual');
INSERT INTO met_admin_menus VALUES('48','0','application','myapp','48','1505','3','5','','应用插件','1','lang_myapp');
INSERT INTO met_admin_menus VALUES('49','0','cache_clear','clear_cache','49','1901','3','6','','清空缓存','1','lang_clearCache');
INSERT INTO met_admin_menus VALUES('50','51','updates','update','50','1104','3','9','','检测更新','1','lang_checkupdate');
INSERT INTO met_admin_menus VALUES('51','0','more_func','more_func','51','1904','3','8','','更多','1','lang_columnmore');
INSERT INTO met_admin_menus VALUES('52','41','banner_manage','banner','52','1604','3','2','','Banner管理','1','lang_banner_manage');
INSERT INTO met_admin_menus VALUES('53','41','watermark','imgmanage','53','1003','3','1','','图片水印','1','lang_indexpic');
INSERT INTO met_admin_menus VALUES('54','41','mobile_menus','menu','54','1605','3','3','','手机菜单','1','lang_the_menu');
INSERT INTO met_admin_menus VALUES('55','51','basic_info','webset','55','1007','3','0','information','基本信息','1','lang_upfiletips7');
INSERT INTO met_admin_menus VALUES('56','51','online_settings','online','56','1106','3','1','online','客服设置','1','lang_customerService');
INSERT INTO met_admin_menus VALUES('57','51','safety_efficiency','safe','57','1004','3','2','safe','安全与效率','1','lang_safety_efficiency');
INSERT INTO met_admin_menus VALUES('58','51','backup_Recovery','databack','58','1005','3','3','databack','备份与恢复','1','lang_data_processing');
INSERT INTO met_admin_menus VALUES('59','51','members','user','59','1601','3','4','member','会员','1','lang_memberManage');
INSERT INTO met_admin_menus VALUES('60','51','admins','permission','60','1603','3','5','administrator','管理员','1','lang_indexadminname');
INSERT INTO met_admin_menus VALUES('61','51','func_collection','function_complete','61','1902','3','6','function_complete','功能大全','1','lang_funcCollection');
INSERT INTO met_admin_menus VALUES('62','51','enterprise_market','partner','62','1508','3','7','partner','企业超市','1','lang_cooperation_platform');
INSERT INTO met_admin_menus VALUES('63','51','env_detection','environmental_test','63','1903','3','8','environmental_test','环境检测','1','lang_environmental_test');
INSERT INTO met_admin_menus VALUES('64','41','site_template','app/met_template','64','1405','3','0','template','网站模板','1','lang_appearance');

DROP TABLE IF EXISTS met_admin_permissions;
CREATE TABLE `met_admin_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT '0' COMMENT '父级id',
  `code` varchar(100) DEFAULT '',
  `module` varchar(255) DEFAULT NULL COMMENT '模块',
  `aid` int(11) DEFAULT '0' COMMENT '权限ID',
  `type` varchar(50) DEFAULT '0' COMMENT 's系统功能模块, f系统功能',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `name` varchar(255) DEFAULT NULL,
  `display` int(11) DEFAULT '1' COMMENT '0:title 1：name',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

INSERT INTO met_admin_permissions VALUES('1','0','content_manage','manage','1301','s','0','内容管理','1');
INSERT INTO met_admin_permissions VALUES('2','0','column_manage','column','1201','s','1','栏目管理','1');
INSERT INTO met_admin_permissions VALUES('3','0','feedback_interaction','','1202','s','2','反馈互动','0');
INSERT INTO met_admin_permissions VALUES('4','0','seo_settings','seo','1404','s','3','SEO设置','1');
INSERT INTO met_admin_permissions VALUES('5','0','site_template','template','1405','s','4','网站模板','1');
INSERT INTO met_admin_permissions VALUES('6','0','application','myapp','1505','s','5','应用插件','1');
INSERT INTO met_admin_permissions VALUES('7','0','user_manage','','1506','s','6','用户管理','0');
INSERT INTO met_admin_permissions VALUES('8','0','security_setting','','1200','s','7','安全设置','0');
INSERT INTO met_admin_permissions VALUES('9','0','multilingual','language','1002','s','8','多语言','1');
INSERT INTO met_admin_permissions VALUES('10','0','basic_settings','','0','s','9','基本设置','0');
INSERT INTO met_admin_permissions VALUES('11','0','enterprise_market','partner','1508','s','10','企业超市','1');
INSERT INTO met_admin_permissions VALUES('12','3','feedback_system','feedback','1509','s','0','反馈系统','1');
INSERT INTO met_admin_permissions VALUES('13','3','message_system','message','1510','s','1','留言系统','1');
INSERT INTO met_admin_permissions VALUES('14','3','recruitment_system','job','1511','s','2','招聘系统','1');
INSERT INTO met_admin_permissions VALUES('15','3','online_settings','online','1106','s','3','客服设置','1');
INSERT INTO met_admin_permissions VALUES('16','7','members','user','1601','s','0','会员','1');
INSERT INTO met_admin_permissions VALUES('17','7','admins','permission','1603','s','1','管理员','1');
INSERT INTO met_admin_permissions VALUES('18','8','safety_efficiency','safe','1004','s','0','安全与效率','1');
INSERT INTO met_admin_permissions VALUES('19','8','backup_Recovery','databack','1005','s','1','备份与恢复','1');
INSERT INTO met_admin_permissions VALUES('20','10','basic_info','webset','1007','s','0','基本信息','1');
INSERT INTO met_admin_permissions VALUES('21','10','watermark','imgmanage','1003','s','1','图片水印','1');
INSERT INTO met_admin_permissions VALUES('22','10','banner_manage','banner','1604','s','2','Banner管理','1');
INSERT INTO met_admin_permissions VALUES('23','10','mobile_menus','menu','1605','s','3','手机菜单','1');
INSERT INTO met_admin_permissions VALUES('24','0','admin_pop','','8888','f','0','可视化','1');
INSERT INTO met_admin_permissions VALUES('25','6','app_install','','1800','s','0','安装应用','1');
INSERT INTO met_admin_permissions VALUES('26','6','app_uninstall','','1801','s','0','卸载应用','1');
INSERT INTO met_admin_permissions VALUES('27','1','add','','1802','s','0','添加内容','1');
INSERT INTO met_admin_permissions VALUES('28','1','edit','','1803','s','0','编辑内容','1');
INSERT INTO met_admin_permissions VALUES('29','1','delete','','1804','s','0','删除内容','1');
INSERT INTO met_admin_permissions VALUES('30','2','column_add','','9999','s','0','新增栏目','1');
INSERT INTO met_admin_permissions VALUES('31','2','column_edit','','9888','s','0','编辑栏目','1');
INSERT INTO met_admin_permissions VALUES('32','2','column_del','','9777','s','0','删除栏目','1');

DROP TABLE IF EXISTS met_admin_roles;
CREATE TABLE `met_admin_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `info` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO met_admin_roles VALUES('1','root','超级管理员','1','超级管理员');
INSERT INTO met_admin_roles VALUES('2','sys_admin_1','管理员','2','系统管理员');
INSERT INTO met_admin_roles VALUES('3','sys_admin_2','内容管理员','3','内容管理员');

DROP TABLE IF EXISTS met_admin_table;
CREATE TABLE `met_admin_table` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT '0',
  `role_id` int(11) DEFAULT '0',
  `admin_type` text,
  `admin_id` varchar(20) NOT NULL DEFAULT '',
  `admin_pass` varchar(64) NOT NULL DEFAULT '',
  `admin_name` varchar(30) NOT NULL DEFAULT '',
  `admin_mobile` varchar(20) DEFAULT '',
  `admin_email` varchar(150) DEFAULT '',
  `admin_introduction` text,
  `admin_login` int(11) DEFAULT '0',
  `admin_modify_ip` varchar(20) DEFAULT '',
  `admin_modify_date` datetime DEFAULT NULL,
  `admin_register_date` datetime DEFAULT NULL,
  `admin_approval_date` datetime DEFAULT NULL,
  `admin_ok` int(11) DEFAULT '0',
  `admin_op` varchar(30) DEFAULT 'metinfo',
  `admin_group` int(11) DEFAULT '0',
  `content_type` int(11) DEFAULT '0',
  `cookie` text,
  `lang` varchar(50) DEFAULT '',
  `langok` varchar(255) DEFAULT 'metinfo',
  `admin_login_lang` varchar(50) DEFAULT '' COMMENT '登录默认语言',
  `admin_issueok` int(11) DEFAULT '0',
  `admin_check` int(11) DEFAULT '0' COMMENT '发布信息需要审核才能正常显示',
  `openid` varchar(255) DEFAULT '',
  `access_token` varchar(255) DEFAULT '',
  `expires_in` int(11) DEFAULT '0',
  `other_login` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `admin_id` (`admin_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO met_admin_table VALUES('1','0','1','metinfo','laoyang','21232f297a57a5a743894a0e4a801fc3','','18026954495','yangchufa@gmail.com','创始人','1','81.31.232.46','2026-09-09 17:55:52','2026-09-09 09:42:51','2026-09-09 09:42:51','1','metinfo','10000','0','{\"time\":1788948077,\"metinfo_admin_name\":\"laoyang\",\"metinfo_admin_pass\":\"21232f297a57a5a743894a0e4a801fc3\",\"metinfo_admin_id\":\"1\",\"metinfo_admin_type\":null,\"metinfo_admin_time\":1788947752,\"metinfo_admin_lang\":\"metinfo\",\"languser\":\"cn\"}','','metinfo','','0','0','','','0','0');

DROP TABLE IF EXISTS met_app_config;
CREATE TABLE `met_app_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appno` int(20) DEFAULT '0',
  `name` varchar(255) DEFAULT '',
  `value` text,
  `lang` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS met_app_plugin;
CREATE TABLE `met_app_plugin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `no_order` int(11) DEFAULT '0',
  `no` int(11) DEFAULT '0',
  `m_name` varchar(255) DEFAULT '',
  `m_action` varchar(255) DEFAULT '',
  `effect` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS met_applist;
CREATE TABLE `met_applist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `no` int(11) DEFAULT '0',
  `ver` varchar(50) DEFAULT '',
  `m_name` varchar(50) DEFAULT '',
  `m_class` varchar(50) DEFAULT '',
  `m_action` varchar(50) DEFAULT '',
  `appname` varchar(50) DEFAULT '',
  `info` text,
  `addtime` int(11) DEFAULT '0',
  `updatetime` int(11) DEFAULT '0',
  `target` int(11) DEFAULT '0',
  `display` int(11) DEFAULT '1',
  `depend` varchar(100) DEFAULT NULL,
  `mlangok` int(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO met_applist VALUES('1','0','1.0','ueditor','index','doindex','百度编辑器','编辑器','0','0','0','0','','0');
INSERT INTO met_applist VALUES('2','10070','1.6','met_sms','index','doindex','短信功能','短信接口','0','0','0','1','','0');
INSERT INTO met_applist VALUES('3','50002','1.0','met_template','temtool','dotemlist','官方模板管理工具','官方商业模板请在此进行管理操作','0','0','0','1','','0');

DROP TABLE IF EXISTS met_column;
CREATE TABLE `met_column` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT '',
  `foldername` varchar(50) DEFAULT '',
  `filename` varchar(50) DEFAULT '',
  `bigclass` int(11) DEFAULT '0',
  `samefile` int(11) DEFAULT '0',
  `module` int(11) DEFAULT '0',
  `no_order` int(11) DEFAULT '0',
  `wap_ok` int(1) DEFAULT '0',
  `wap_nav_ok` int(11) DEFAULT '0',
  `if_in` int(1) DEFAULT '0',
  `nav` int(1) DEFAULT '0',
  `ctitle` varchar(200) DEFAULT '',
  `keywords` varchar(200) DEFAULT '',
  `content` longtext,
  `description` text,
  `other_info` text,
  `custom_info` text,
  `list_order` int(11) DEFAULT '0',
  `new_windows` varchar(50) DEFAULT '',
  `classtype` int(11) DEFAULT '1',
  `out_url` varchar(200) DEFAULT '',
  `index_num` int(11) DEFAULT '0',
  `access` text,
  `indeximg` varchar(255) DEFAULT '',
  `columnimg` varchar(255) DEFAULT '',
  `isshow` int(11) DEFAULT '1',
  `lang` varchar(50) DEFAULT '',
  `namemark` varchar(255) DEFAULT '',
  `releclass` int(11) DEFAULT '0',
  `display` int(11) DEFAULT '0',
  `icon` varchar(100) DEFAULT '',
  `nofollow` int(1) DEFAULT '0',
  `text_size` int(11) DEFAULT '0',
  `text_color` varchar(100) DEFAULT '',
  `thumb_list` varchar(50) DEFAULT '',
  `thumb_detail` varchar(50) DEFAULT '',
  `list_length` int(11) DEFAULT '0',
  `tab_num` int(11) DEFAULT '0',
  `tab_name` varchar(255) DEFAULT '',
  `style_type` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=165 DEFAULT CHARSET=utf8;

INSERT INTO met_column VALUES('1','会员中心','member','','0','0','10','99','0','0','0','0','','','','','','','1','0','1','','0','0','','','1','cn','','0','0','','0','0','','','','0','0','','');
INSERT INTO met_column VALUES('2','站内搜索','search','','76','0','11','99','0','0','0','0','','','','','','','1','0','2','','0','0','','','1','cn','','76','0','','0','0','','','','0','0','','');
INSERT INTO met_column VALUES('133','在线留言','message','','126','0','7','1','0','0','0','0','','','','','','','1','0','2','','0','0','','','1','cn','','126','0','','0','0','','','','0','0','','');
INSERT INTO met_column VALUES('134','在线反馈','feedback','','126','0','8','2','0','0','0','0','','','','','','','1','0','2','','0','0','','','1','cn','','126','0','','0','0','','','','0','0','','');
INSERT INTO met_column VALUES('136','智能音箱','product','','127','0','3','0','0','0','0','0','','','','','','','1','0','2','','0','0','','../upload/202109/1631525106.jpg','1','cn','','0','0','','0','0','','','','0','0','','');
INSERT INTO met_column VALUES('137','云摄像头','product','','127','0','3','1','0','0','0','0','','','','','','','1','0','2','','0','0','','../upload/202109/1631525954.jpg','1','cn','','0','0','','0','0','','','','0','0','','');
INSERT INTO met_column VALUES('139','智能路由器','product','','127','0','3','2','0','0','0','0','','','','','','','1','0','2','','0','0','','../upload/202109/1631525949.jpg','1','cn','','0','0','','0','0','','','','0','0','','');
INSERT INTO met_column VALUES('140','媒体报道','news','','128','0','2','0','0','0','0','0','','','','','','','1','0','2','','0','0','','','1','cn','','0','0','','0','0','','','','0','0','','');
INSERT INTO met_column VALUES('141','行业资讯','news','','128','0','2','1','0','0','0','0','','','','','','','1','0','2','','0','0','','','1','cn','','0','0','','0','0','','','','0','0','','');
INSERT INTO met_column VALUES('142','企业新闻','news','','128','0','2','2','0','0','0','0','','','','','','','1','0','2','','0','0','','','1','cn','','0','0','','0','0','','','','0','0','','');
INSERT INTO met_column VALUES('132','公司简介','about','','126','0','1','0','0','0','0','0','','','<p microsoft=\"\" segoe=\"\" helvetica=\"\" apple=\"\" color=\"\" ui=\"\" noto=\"\" white-space:=\"\" background-color:=\"\">长沙米拓信息技术有限公司成立于 2009 年 6 月，是一家专注于「为企事业单位提供信息化服务」的创新型软件企业。</p><p microsoft=\"\" segoe=\"\" helvetica=\"\" apple=\"\" color=\"\" ui=\"\" noto=\"\" white-space:=\"\" background-color:=\"\">公司一直围绕互联网相关软件进行自主开发和运营，聚焦于网络安全、知识产权合规与国产信创等，旗下主打产品平台有：<a href=\"https://www.mituo.cn/\" target=\"_blank\" title=\"米拓建站\" textvalue=\"米拓建站\">米拓建站</a>、<a href=\"https://dy.mituo.cn/\" target=\"_blank\" title=\"米拓单页\">米拓单页制作平台</a>、<a href=\"https://www.mituo.cn/\" target=\"_blank\" title=\"米拓流程\">米拓流程管理系统</a>。</p><p microsoft=\"\" segoe=\"\" helvetica=\"\" apple=\"\" color=\"\" ui=\"\" noto=\"\" white-space:=\"\" background-color:=\"\"><br style=\"box-sizing: border-box;\"/></p><p microsoft=\"\" segoe=\"\" helvetica=\"\" apple=\"\" color=\"\" ui=\"\" noto=\"\" white-space:=\"\" background-color:=\"\">米拓<a title=\"建站\" target=\"_blank\" href=\"https://www.mituo.cn/\">建站</a>：</p><p microsoft=\"\" segoe=\"\" helvetica=\"\" apple=\"\" color=\"\" ui=\"\" noto=\"\" white-space:=\"\" background-color:=\"\">与其他<a title=\"建站公司\" target=\"_blank\" href=\"https://www.mituo.cn/\">建站公司</a>不同的是，我们自创业之初就自主研发了一款免费开源的企业级 CMS ——米拓企业建站系统（MetInfo ），并且以 MetInfo 为核心产品一直不断更新研发至今，致力于打造中小企业优质的互联网信息化工具供应平台。</p><p microsoft=\"\" segoe=\"\" helvetica=\"\" apple=\"\" color=\"\" ui=\"\" noto=\"\" white-space:=\"\" background-color:=\"\">米拓企业建站系统的愿景是任何中小企业和个人能够轻松基于 MetInfo 搭建高品质的企业门户网站（不需要任何专业技能）；我们不夹杂当前网站建设行业乱象，提供「清澈透明实惠」的价格和优质的售后服务。</p><p microsoft=\"\" segoe=\"\" helvetica=\"\" apple=\"\" color=\"\" ui=\"\" noto=\"\" white-space:=\"\" background-color:=\"\"><br style=\"box-sizing: border-box;\"/></p><p microsoft=\"\" segoe=\"\" helvetica=\"\" apple=\"\" color=\"\" ui=\"\" noto=\"\" white-space:=\"\" background-color:=\"\">米拓单页：</p><p microsoft=\"\" segoe=\"\" helvetica=\"\" apple=\"\" color=\"\" ui=\"\" noto=\"\" white-space:=\"\" background-color:=\"\">米拓单页制作平台是专题页、落地页、米拓企业建站系统简洁版、H5、在线表单（如在线报名、投票、调查、考试等）的综合体。用户使用米拓单页，一套页面数据，就可解决所有宣传推广落地页，并可以自适应电脑、手机、微信、QQ、自媒体浏览，还可以可部署到你自己的服务器。</p><p microsoft=\"\" segoe=\"\" helvetica=\"\" apple=\"\" color=\"\" ui=\"\" noto=\"\" white-space:=\"\" background-color:=\"\"><br style=\"box-sizing: border-box;\"/></p><p microsoft=\"\" segoe=\"\" helvetica=\"\" apple=\"\" color=\"\" ui=\"\" noto=\"\" white-space:=\"\" background-color:=\"\">米拓流程：</p><p microsoft=\"\" segoe=\"\" helvetica=\"\" apple=\"\" color=\"\" ui=\"\" noto=\"\" white-space:=\"\" background-color:=\"\">米拓流程管理系统是在线审批系统、客服工单系统、OA系统、协同办公系统的综合体，用于解决企事业单位或团队的对外服务和内部管理及协同办公的流程自动化。</p><p microsoft=\"\" segoe=\"\" helvetica=\"\" apple=\"\" color=\"\" ui=\"\" noto=\"\" white-space:=\"\" background-color:=\"\" text-align:=\"\" style=\"text-align:center;\"><img src=\"../upload/202109/1631529783323522.jpg\" data-width=\"800\" width=\"800\" data-height=\"600\" height=\"600\" title=\"网站建设,网站制作,cms,企业建站,建站系统\" alt=\"模板建站\" style=\"box-sizing: border-box; vertical-align: top; border-style: none; object-fit: cover; max-width: 100%; height: auto !important; display: inline-block;\"/></p><p microsoft=\"\" segoe=\"\" helvetica=\"\" apple=\"\" color=\"\" ui=\"\" noto=\"\" white-space:=\"\" background-color:=\"\" text-align:=\"\" style=\"text-align:center;\"><br/></p><p microsoft=\"\" segoe=\"\" helvetica=\"\" apple=\"\" color=\"\" ui=\"\" noto=\"\" white-space:=\"\" background-color:=\"\">我们秉承“为合作伙伴创造价值”的核心价值观，并以“诚实、宽容、创新、服务”为企业精神，通过自主创新和真诚合作为电子商务及信息服务行业创造价值。</p><p microsoft=\"\" segoe=\"\" helvetica=\"\" apple=\"\" color=\"\" ui=\"\" noto=\"\" white-space:=\"\" background-color:=\"\"><br style=\"box-sizing: border-box;\"/></p><p microsoft=\"\" segoe=\"\" helvetica=\"\" apple=\"\" color=\"\" ui=\"\" noto=\"\" white-space:=\"\" background-color:=\"\">关于“为合作伙伴创造价值”</p><p microsoft=\"\" segoe=\"\" helvetica=\"\" apple=\"\" color=\"\" ui=\"\" noto=\"\" white-space:=\"\" background-color:=\"\">我们认为客户、供应商、公司股东、公司员工等一切和自身有合作关系的单位和个人都是自己的合作伙伴，并只有通过努力为合作伙伴创造价值，才能体现自身的价值并获得发展和成功。</p><p microsoft=\"\" segoe=\"\" helvetica=\"\" apple=\"\" color=\"\" ui=\"\" noto=\"\" white-space:=\"\" background-color:=\"\"><br style=\"box-sizing: border-box;\"/></p><p microsoft=\"\" segoe=\"\" helvetica=\"\" apple=\"\" color=\"\" ui=\"\" noto=\"\" white-space:=\"\" background-color:=\"\">关于“诚实、宽容、创新、服务”</p><p microsoft=\"\" segoe=\"\" helvetica=\"\" apple=\"\" color=\"\" ui=\"\" noto=\"\" white-space:=\"\" background-color:=\"\">我们认为诚信是一切合作的基础，宽容是解决问题的前提，创新是发展事业的利器，服务是创造价值的根本。</p>','长沙米拓信息技术有限公司成立于 2009 年 6 月，是一家专注于「为中小企业提供信息化服务」的软件企业。公司一直围绕互联网相关软件进行自主开发和运营，旗下主打产品平台有：米拓建站、米拓单页制作平台、米拓流程管理系统。米拓建站：与其他建站公司不同的是，我们自创业之初就自主研发了一款免费开源的企业级 CMS ——米拓企业建站系统（MetInfo ），并且以 MetInfo 为核心产','','','1','0','2','','0','0','','','1','cn','','0','0','','0','0','','','','0','0','','');
INSERT INTO met_column VALUES('73','网站地图','sitemap','','76','0','12','28','0','0','0','0','','','','','','','1','0','2','','0','0','','','1','cn','','76','0','','0','0','','','','0','0','','');
INSERT INTO met_column VALUES('74','聚合标签','tags','','76','0','13','29','0','0','0','0','','','','','','','1','0','2','','0','0','','','1','cn','','76','0','','0','0','','','','0','0','','');
INSERT INTO met_column VALUES('76','特色功能','about1','','0','0','1','11','0','0','0','2','','','','','','','1','0','1','','0','0','','','0','cn','','0','0','','0','0','','','','0','0','','');
INSERT INTO met_column VALUES('77','联系我们','about','lianxiwomenweb','126','0','1','3','0','0','0','0','','','<p><strong>长沙米拓信息技术有限公司</strong></p><p>地址：湖南.长沙.洋湖总部经济区洋湖公馆写字楼12层1219#</p><p>电话：0731-85514433</p><p>网址：<a href=\"https://www.mituo.cn\" target=\"_blank\" title=\"米拓建站\" textvalue=\"www.mituo.cn\">www.mituo.cn</a></p>','长沙米拓信息技术有限公司地址：湖南.长沙.洋湖总部经济区洋湖公馆写字楼12层1219#电话：0731-85514433 网址：www.mituo.cn','','','1','0','2','','0','0','','','1','cn','','0','0','','0','0','','','','0','0','','');
INSERT INTO met_column VALUES('126','关于我们','about','','0','0','1','1','0','0','0','3','','','','','','','1','0','1','','0','0','','','0','cn','','0','0','','0','0','','|','|','0','0','','');
INSERT INTO met_column VALUES('127','产品展示','product','','0','0','3','2','0','0','0','3','','','','','','','1','0','1','','0','0','','','1','cn','','0','0','','0','0','','700|650','350|325','6','0','','');
INSERT INTO met_column VALUES('128','新闻动态','news','','0','0','2','3','0','0','0','3','','','','','','','1','0','1','','0','0','','','1','cn','','0','0','','0','0','','','','0','0','','');
INSERT INTO met_column VALUES('129','资料下载','download','','0','0','4','4','0','0','0','1','','','','','','','1','0','1','','0','0','','','1','cn','','0','0','','0','0','','','','0','0','','');
INSERT INTO met_column VALUES('130','客户案例','img','','0','0','5','5','0','0','0','1','','','','','','','1','0','1','','0','0','','','1','cn','','0','0','','0','0','','','','0','0','','');
INSERT INTO met_column VALUES('131','加入我们','job','','0','0','6','6','0','0','0','1','','','','','','','1','0','1','','0','0','','','1','cn','','0','0','','0','0','','','','0','0','','');
INSERT INTO met_column VALUES('151','Intelligent router','product','','148','0','3','2','0','0','0','0','','','','','','','1','0','2','','0','0','','../upload/202109/1631525949.jpg','1','en','','0','0','','0','0','','','','0','0','','');
INSERT INTO met_column VALUES('152','news','news','','0','0','2','3','0','0','0','3','','','','','','','1','0','1','','0','0','','','1','en','','0','0','','0','0','','','','0','0','','');
INSERT INTO met_column VALUES('153','Media reports','news','','152','0','2','0','0','0','0','0','','','','','','','1','0','2','','0','0','','','1','en','','0','0','','0','0','','','','0','0','','');
INSERT INTO met_column VALUES('154','Industry information','news','','152','0','2','1','0','0','0','0','','','','','','','1','0','2','','0','0','','','1','en','','0','0','','0','0','','','','0','0','','');
INSERT INTO met_column VALUES('155','Corporate news','news','','152','0','2','2','0','0','0','0','','','','','','','1','0','2','','0','0','','','1','en','','0','0','','0','0','','','','0','0','','');
INSERT INTO met_column VALUES('156','Data download','download','','0','0','4','4','0','0','0','1','','','','','','','1','0','1','','0','0','','','1','en','','0','0','','0','0','','','','0','0','','');
INSERT INTO met_column VALUES('157','Customer case','img','','0','0','5','5','0','0','0','1','','','','','','','1','0','1','','0','0','','','1','en','','0','0','','0','0','','','','0','0','','');
INSERT INTO met_column VALUES('158','Join us','job','','0','0','6','6','0','0','0','1','','','','','','','1','0','1','','0','0','','','1','en','','0','0','','0','0','','','','0','0','','');
INSERT INTO met_column VALUES('159','Features','about1','','0','0','1','11','0','0','0','2','','','','','','','1','0','1','','0','0','','','0','en','','0','0','','0','0','','','','0','0','','');
INSERT INTO met_column VALUES('160','Site map','sitemap','','159','0','12','28','0','0','0','0','','','','','','','1','0','2','','0','0','','','1','en','','76','0','','0','0','','','','0','0','','');
INSERT INTO met_column VALUES('161','Tags','tags','','159','0','13','29','0','0','0','0','','','','','','','1','0','2','','0','0','','','1','en','','76','0','','0','0','','','','0','0','','');
INSERT INTO met_column VALUES('162','On-site search','search','','159','0','11','99','0','0','0','0','','','','','','','1','0','2','','0','0','','','1','en','','76','0','','0','0','','','','0','0','','');
INSERT INTO met_column VALUES('163','Contact us','about','','143','0','1','3','0','0','0','0','','','<p></p><p><span style=\"font-size: 20px;\"><strong>Changsha Mituo Information Technology Co., LTD</strong></span></p><p>Address: Changsha, Hunan. No. 1219, Floor 12, Yanghu Mansion office Building, Yanghu Headquarters Economic Zone</p><p>Telephone: 0731-85514433 </p><p>Web site:<a href=\"https://www.mituo.cn\" target=\"_blank\" title=\"米拓建站\" textvalue=\"www.mituo.cn\">www.mituo.cn</a></p>','长沙米拓信息技术有限公司地址：湖南.长沙.洋湖总部经济区洋湖公馆写字楼12层1219#电话：0731-85514433 网址：www.mituo.cn','','','1','0','2','','0','0','','','1','en','','0','0','','0','0','','','','0','0','','');
INSERT INTO met_column VALUES('164','Member center','member','','0','0','10','99','0','0','0','0','','','','','','','1','0','1','','0','0','','','1','en','','0','0','','0','0','','','','0','0','','');
INSERT INTO met_column VALUES('146','Online feedback','feedback','','143','0','8','2','0','0','0','0','','','','','','','1','0','2','','0','0','','','1','en','','126','0','','0','0','','','','0','0','','');
INSERT INTO met_column VALUES('145','Online message','message','','143','0','7','1','0','0','0','0','','','','','','','1','0','2','','0','0','','','1','en','','126','0','','0','0','','','','0','0','','');
INSERT INTO met_column VALUES('143','About us','about','','0','0','1','1','0','0','0','3','','','','','','','1','0','1','','0','0','','','0','en','','0','0','','0','0','','|','|','0','0','','');
INSERT INTO met_column VALUES('144','Company profile','about','','143','0','1','0','0','0','0','0','','','<p>Changsha Mituo Information Technology Co., LTD., founded in June 2009, is a high-tech enterprise and double-soft certification enterprise focusing on &quot;providing information services for small and medium-sized enterprises&quot;.</p><p>The company has been around the Internet related software independent development and operation, its main product platforms are: Mito build station, Mito single page production platform, Mito process management system.</p><p><br/></p><p>Mitow Station:</p><p>Different from other website building companies, we have independently developed a free and open source enterprise CMS -- MetInfo enterprise Website building System (MetInfo) since the beginning of entrepreneurship, and have been constantly updated and developed with MetInfo as the core product to build a high-quality Internet information tool supply platform for small and medium-sized enterprises.</p><p microsoft=\"\" segoe=\"\" helvetica=\"\" apple=\"\" color=\"\" ui=\"\" noto=\"\" white-space:=\"\" background-color:=\"\">米拓企业建站系统is that any small and medium enterprises and individuals can easily build high quality enterprise portals based on MetInfo (without any professional skills); We do not mix the current website construction industry chaos, to provide &quot;clear and affordable&quot; prices and quality after-sales service. By the end of August 2020, more than half a million websites had been installed using MetInfo, including website builders using MetInfo to build websites for their own clients.</p><p><br/></p><p>Meto single page:</p><p>Mitto single page production platform is a synthesis of thematic page, landing page, Simple version of Mitto enterprise website building system, H5, and online forms (such as online registration, voting, survey, examination, etc.). Users using Meto single page, a set of page data, can solve all the publicity and promotion landing page, and can adapt to the computer, mobile phone, wechat, QQ, we media browsing, can also be deployed to your own server.</p><p><br/></p><p>Meto process:</p><p>Mituo process management system is a complex of online approval system, customer service work order system, OA system and collaborative office system, which is used to solve the external service and internal management of enterprises and public institutions or teams and the process automation of collaborative office.</p><p microsoft=\"\" segoe=\"\" helvetica=\"\" apple=\"\" color=\"\" ui=\"\" noto=\"\" white-space:=\"\" background-color:=\"\" text-align:=\"\" style=\"text-align:center;\"><img src=\"../upload/202109/1631529783323522.jpg\" data-width=\"800\" width=\"800\" data-height=\"600\" height=\"600\" title=\"网站建设,网站制作,cms,企业建站,建站系统\" alt=\"模板建站\" style=\"box-sizing: border-box; vertical-align: top; border-style: none; object-fit: cover; max-width: 100%; height: auto !important; display: inline-block;\"/></p><p microsoft=\"\" segoe=\"\" helvetica=\"\" apple=\"\" color=\"\" ui=\"\" noto=\"\" white-space:=\"\" background-color:=\"\" text-align:=\"\" style=\"text-align:center;\"><br/></p><p>We uphold the core values of &quot;creating value for partners&quot;, and take &quot;honesty, tolerance, innovation, service&quot; as the spirit of enterprise, through independent innovation and sincere cooperation to create value for e-commerce and information service industry.</p><p><br/></p><p>About &quot;Creating Value for Partners&quot;</p><p>We believe that customers, suppliers, shareholders, employees and other units and individuals who have cooperative relations with us are our partners, and only through efforts to create value for partners can we reflect our own value and achieve development and success.</p><p><br/></p><p>About &quot;Honesty, Tolerance, Innovation, Service&quot;</p><p>We believe that integrity is the basis of all cooperation, tolerance is the premise of solving problems, innovation is the weapon of development, service is the fundamental to create value.</p>','长沙米拓信息技术有限公司成立于 2009 年 6 月，是一家专注于「为中小企业提供信息化服务」的软件企业。公司一直围绕互联网相关软件进行自主开发和运营，旗下主打产品平台有：米拓建站、米拓单页制作平台、米拓流程管理系统。米拓建站：与其他建站公司不同的是，我们自创业之初就自主研发了一款免费开源的企业级 CMS ——米拓企业建站系统（MetInfo ），并且以 MetInfo 为核心产','','','1','0','2','','0','0','','','1','en','','0','0','','0','0','','','','0','0','','');
INSERT INTO met_column VALUES('148','Product display','product','','0','0','3','2','0','0','0','3','','','','','','','1','0','1','','0','0','','','1','en','','0','0','','0','0','','700|650','350|325','6','0','details|parameter|packaging||','');
INSERT INTO met_column VALUES('149','Intelligent speakers','product','','148','0','3','0','0','0','0','0','','','','','','','1','0','2','','0','0','','../upload/202109/1631525106.jpg','1','en','','0','0','','0','0','','','','0','0','','');
INSERT INTO met_column VALUES('150','Cloud camera','product','','148','0','3','1','0','0','0','0','','','','','','','1','0','2','','0','0','','../upload/202109/1631525954.jpg','1','en','','0','0','','0','0','','','','0','0','','');

DROP TABLE IF EXISTS met_config;
CREATE TABLE `met_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT '',
  `value` text,
  `mobile_value` text,
  `columnid` int(11) DEFAULT '0',
  `flashid` int(11) DEFAULT '0',
  `lang` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=479 DEFAULT CHARSET=utf8;

INSERT INTO met_config VALUES('1','metcms_v','8.1','','0','0','metinfo');
INSERT INTO met_config VALUES('2','met_ch_lang','1','','0','0','metinfo');
INSERT INTO met_config VALUES('3','met_lang_mark','1','','0','0','metinfo');
INSERT INTO met_config VALUES('4','met_admin_type_ok','0','','0','0','metinfo');
INSERT INTO met_config VALUES('5','met_admin_type','cn','','0','0','metinfo');
INSERT INTO met_config VALUES('6','met_index_type','cn','','0','0','metinfo');
INSERT INTO met_config VALUES('7','met_host','api.metinfo.cn','','0','0','metinfo');
INSERT INTO met_config VALUES('8','met_host_new','app.metinfo.cn','','0','0','metinfo');
INSERT INTO met_config VALUES('9','met_api','https://u.mituo.cn/api/client','','0','0','metinfo');
INSERT INTO met_config VALUES('10','met_tablename','admin_column|admin_has_permissions|admin_logs|admin_menus|admin_permissions|admin_roles|admin_table|app_config|app_plugin|applist|column|config|cv|download|feedback|files|flash|flash_button|flist|history|history_plist|history_relation|ifcolumn|ifcolumn_addfile|ifmember_left|img|infoprompt|job|label|lang|lang_admin|language|link|menu|message|mlist|news|online|para|parameter|plist|product|relation|skin_table|tags|templates|ui_config|ui_list|user|user_group|user_group_pay|user_list|user_other|weixin_reply_log','','0','0','metinfo');
INSERT INTO met_config VALUES('11','met_safe_prompt','1','','0','0','metinfo');
INSERT INTO met_config VALUES('12','met_uiset_guide','0','','0','0','metinfo');
INSERT INTO met_config VALUES('13','met_301jump','','','0','0','metinfo');
INSERT INTO met_config VALUES('14','met_https','','','0','0','metinfo');
INSERT INTO met_config VALUES('15','disable_cssjs','0','','0','0','metinfo');
INSERT INTO met_config VALUES('16','met_secret_key','','','0','0','metinfo');
INSERT INTO met_config VALUES('17','met_member_force','jqubops','','0','0','metinfo');
INSERT INTO met_config VALUES('18','met_editor','ueditor','','0','0','metinfo');
INSERT INTO met_config VALUES('19','met_text_fonts','../public/third-party/fonts/Roboto/Roboto-Regular.ttf','','0','0','metinfo');
INSERT INTO met_config VALUES('20','met_smsprice','0.1','','0','0','metinfo');
INSERT INTO met_config VALUES('21','met_sms_token','','','0','0','metinfo');
INSERT INTO met_config VALUES('22','met_sms_url','https://u.mituo.cn/api/sms','','0','0','metinfo');
INSERT INTO met_config VALUES('23','met_sitemap_lang','1','','0','0','metinfo');
INSERT INTO met_config VALUES('24','met_sitemap_not2','1','','0','0','metinfo');
INSERT INTO met_config VALUES('25','met_sitemap_not1','0','','0','0','metinfo');
INSERT INTO met_config VALUES('26','met_sitemap_txt','0','','0','0','metinfo');
INSERT INTO met_config VALUES('27','met_sitemap_xml','1','','0','0','metinfo');
INSERT INTO met_config VALUES('28','met_agents_logo_login','../public/images/login-logo.png','','0','0','metinfo');
INSERT INTO met_config VALUES('29','met_agents_logo_index','../public/images/logo.png','','0','0','metinfo');
INSERT INTO met_config VALUES('30','met_agents_img','../public/images/metinfo.gif','','0','0','metinfo');
INSERT INTO met_config VALUES('31','met_agents_copyright_foot','Powered by <b><a href=https://www.metinfo.cn target=_blank title=CMS>MetInfo $metcms_v</a></b> &copy;2008-$m_now_year &nbsp;<a href=https://www.mituo.cn target=_blank title=米拓建站>mituo.cn</a>','','0','0','metinfo');
INSERT INTO met_config VALUES('32','met_agents_copyright_foot1','本站基于 <b><a href=https://www.metinfo.cn target=_blank title=米拓建站>米拓企业建站系统 $metcms_v</a></b> 搭建','','0','0','metinfo');
INSERT INTO met_config VALUES('33','met_agents_copyright_foot2','技术支持：<b><a href=https://www.mituo.cn target=_blank title=米拓建站>米拓建站 $metcms_v</a></b> ','','0','0','metinfo');
INSERT INTO met_config VALUES('34','met_copyright_nofollow','0','','0','0','metinfo');
INSERT INTO met_config VALUES('35','met_copyright_type','1','','0','0','metinfo');
INSERT INTO met_config VALUES('36','met_agents_type','1','','0','0','metinfo');
INSERT INTO met_config VALUES('37','met_agents_linkurl','https://www.mituo.cn','','0','0','metinfo');
INSERT INTO met_config VALUES('38','met_agents_pageset_logo','1','','0','0','metinfo');
INSERT INTO met_config VALUES('39','met_agents_update','1','','0','0','metinfo');
INSERT INTO met_config VALUES('40','met_agents_code','','','0','0','metinfo');
INSERT INTO met_config VALUES('41','met_agents_backup','metinfo','','0','0','metinfo');
INSERT INTO met_config VALUES('42','met_agents_sms','1','','0','0','metinfo');
INSERT INTO met_config VALUES('43','met_agents_app','1','','0','0','metinfo');
INSERT INTO met_config VALUES('44','met_agents_metmsg','1','','0','0','metinfo');
INSERT INTO met_config VALUES('45','met_agents_thanks','感谢使用 Metinfo','','0','0','cn-metinfo');
INSERT INTO met_config VALUES('46','met_agents_name','MetInfo|米拓企业建站系统','','0','0','cn-metinfo');
INSERT INTO met_config VALUES('47','met_agents_copyright','长沙米拓信息技术有限公司（MetInfo Inc.）','','0','0','cn-metinfo');
INSERT INTO met_config VALUES('48','met_agents_depict_login','MetInfo','','0','0','cn-metinfo');
INSERT INTO met_config VALUES('49','met_agents_thanks','thanks use Metinfo','','0','0','en-metinfo');
INSERT INTO met_config VALUES('50','met_agents_name','Metinfo CMS','','0','0','en-metinfo');
INSERT INTO met_config VALUES('51','met_agents_copyright','China Changsha MetInfo Information Co., Ltd.','','0','0','en-metinfo');
INSERT INTO met_config VALUES('52','met_agents_depict_login','Metinfo Build marketing value corporate website','','0','0','en-metinfo');
INSERT INTO met_config VALUES('53','debug','0','','0','0','cn');
INSERT INTO met_config VALUES('54','met_skin_user','m1156ui010','','0','0','cn');
INSERT INTO met_config VALUES('55','met_listtime','Y-m-d','','0','0','cn');
INSERT INTO met_config VALUES('56','met_contenttime','Y-m-d H:i:s','','0','0','cn');
INSERT INTO met_config VALUES('57','met_productTabok','3','','0','0','cn');
INSERT INTO met_config VALUES('58','met_hometitle','','','0','0','cn');
INSERT INTO met_config VALUES('59','met_title_type','2','','0','0','cn');
INSERT INTO met_config VALUES('60','met_alt','图片关键词','','0','0','cn');
INSERT INTO met_config VALUES('61','met_atitle','链接关键词','','0','0','cn');
INSERT INTO met_config VALUES('62','met_linkname','Mituo','','0','0','cn');
INSERT INTO met_config VALUES('63','met_seo_canonical','0','','0','0','cn');
INSERT INTO met_config VALUES('64','tag_show_range','0','','0','0','cn');
INSERT INTO met_config VALUES('65','tag_show_number','4','','0','0','cn');
INSERT INTO met_config VALUES('66','tag_search_type','module','','0','0','cn');
INSERT INTO met_config VALUES('67','met_404content','404错误，页面不见了。。。','','0','0','cn');
INSERT INTO met_config VALUES('68','met_data_null','没有找到数据','','0','0','cn');
INSERT INTO met_config VALUES('69','met_foottext','','','0','0','cn');
INSERT INTO met_config VALUES('70','met_seo','','','0','0','cn');
INSERT INTO met_config VALUES('71','met_webhtm','0','','0','0','cn');
INSERT INTO met_config VALUES('72','met_htmtype','html','','0','0','cn');
INSERT INTO met_config VALUES('73','met_htmpagename','2','','0','0','cn');
INSERT INTO met_config VALUES('74','met_listhtmltype','1','','0','0','cn');
INSERT INTO met_config VALUES('75','met_htmlistname','1','','0','0','cn');
INSERT INTO met_config VALUES('76','met_htmway','1','','0','0','cn');
INSERT INTO met_config VALUES('77','met_html_auto','2','','0','0','cn');
INSERT INTO met_config VALUES('78','met_htmlurl','0','','0','0','cn');
INSERT INTO met_config VALUES('79','met_pseudo','0','','0','0','cn');
INSERT INTO met_config VALUES('80','met_defult_lang','0','0','0','0','cn');
INSERT INTO met_config VALUES('81','met_sitemap_auto','1','','0','0','cn');
INSERT INTO met_config VALUES('82','met_online_skin','1','','0','0','cn');
INSERT INTO met_config VALUES('83','met_online_type','4','','0','0','cn');
INSERT INTO met_config VALUES('84','met_online_color','#1baadb','','0','0','cn');
INSERT INTO met_config VALUES('85','met_onlinetel','<p>服务热线：<br/>000-000-0000</p>','','0','0','cn');
INSERT INTO met_config VALUES('86','met_online_x','10','','0','0','cn');
INSERT INTO met_config VALUES('87','met_online_y','300','','0','0','cn');
INSERT INTO met_config VALUES('88','met_onlinenameok','0','','0','0','cn');
INSERT INTO met_config VALUES('89','met_qq_type','3','','0','0','cn');
INSERT INTO met_config VALUES('90','met_taobao_type','2','','0','0','cn');
INSERT INTO met_config VALUES('91','met_alibaba_type','10','','0','0','cn');
INSERT INTO met_config VALUES('92','met_webname','四川中医','','0','0','cn');
INSERT INTO met_config VALUES('93','met_logo','../upload/202109/1631583738.png','','0','0','cn');
INSERT INTO met_config VALUES('94','met_mobile_logo','../upload/202109/1631583738.png','','0','0','cn');
INSERT INTO met_config VALUES('95','met_logo_keyword','Logo关键词','','0','0','cn');
INSERT INTO met_config VALUES('96','met_keywords','成都好中医，四川好中医，经方好中医','','0','0','cn');
INSERT INTO met_config VALUES('97','met_description','网站描述，一般显示在搜索引擎搜索结果中的描述文字，用于介绍网站，吸引浏览者点击。','','0','0','cn');
INSERT INTO met_config VALUES('98','met_footright','我的网站 版权所有 2008-2021','','0','0','cn');
INSERT INTO met_config VALUES('99','met_footaddress','本页面内容为网站演示数据，前台页面内容都可以在后台修改。','','0','0','cn');
INSERT INTO met_config VALUES('100','met_foottel','','','0','0','cn');
INSERT INTO met_config VALUES('101','met_footother','','','0','0','cn');
INSERT INTO met_config VALUES('102','met_icp_info',' 湘ICP备8888888号','','0','0','cn');
INSERT INTO met_config VALUES('103','met_beian_info','','','0','0','cn');
INSERT INTO met_config VALUES('104','met_fd_fromname','米拓信息','','0','0','cn');
INSERT INTO met_config VALUES('105','met_fd_smtp','61.152.188.131','','0','0','cn');
INSERT INTO met_config VALUES('106','met_fd_usename','test@mail.metinfo.cn','','0','0','cn');
INSERT INTO met_config VALUES('107','met_fd_password','passwordhidden','','0','0','cn');
INSERT INTO met_config VALUES('108','met_fd_port','465','','0','0','cn');
INSERT INTO met_config VALUES('109','met_fd_way','ssl','','0','0','cn');
INSERT INTO met_config VALUES('110','met_fd_word','','','0','0','cn');
INSERT INTO met_config VALUES('111','met_footstat','<script>\r\nvar _hmt = _hmt || [];\r\n(function() {\r\n  var hm = document.createElement(\"script\");\r\n  hm.src = \"https://hm.baidu.com/hm.js?520556228c0113270c0c772027905838\";\r\n  var s = document.getElementsByTagName(\"script\")[0]; \r\n  s.parentNode.insertBefore(hm, s);\r\n})();\r\n</script>','','0','0','cn');
INSERT INTO met_config VALUES('112','met_headstat','','','0','0','cn');
INSERT INTO met_config VALUES('113','met_headstat_mobile','','','0','0','cn');
INSERT INTO met_config VALUES('114','met_footstat_mobile','<script>\r\nvar _hmt = _hmt || [];\r\n(function() {\r\n  var hm = document.createElement(\"script\");\r\n  hm.src = \"https://hm.baidu.com/hm.js?520556228c0113270c0c772027905838\";\r\n  var s = document.getElementsByTagName(\"script\")[0]; \r\n  s.parentNode.insertBefore(hm, s);\r\n})();\r\n</script>','','0','0','cn');
INSERT INTO met_config VALUES('115','met_big_wate','0','','0','0','cn');
INSERT INTO met_config VALUES('116','met_thumb_wate','0','','0','0','cn');
INSERT INTO met_config VALUES('117','met_wate_class','1','','0','0','cn');
INSERT INTO met_config VALUES('118','met_wate_img','','','0','0','cn');
INSERT INTO met_config VALUES('119','met_wate_bigimg','','','0','0','cn');
INSERT INTO met_config VALUES('120','met_wate_img_scale','0','','0','0','cn');
INSERT INTO met_config VALUES('121','met_wate_img_gif_hold','0','','0','0','cn');
INSERT INTO met_config VALUES('122','met_text_wate','MetInfo','','0','0','cn');
INSERT INTO met_config VALUES('123','met_text_size','10','','0','0','cn');
INSERT INTO met_config VALUES('124','met_text_bigsize','35','','0','0','cn');
INSERT INTO met_config VALUES('125','met_text_color','#000000','','0','0','cn');
INSERT INTO met_config VALUES('126','met_text_angle','0','','0','0','cn');
INSERT INTO met_config VALUES('127','met_watermark','0','','0','0','cn');
INSERT INTO met_config VALUES('128','met_autothumb_ok','0','','0','0','cn');
INSERT INTO met_config VALUES('129','met_thumb_kind','2','','0','0','cn');
INSERT INTO met_config VALUES('130','met_newsimg_x','800','','0','0','cn');
INSERT INTO met_config VALUES('131','met_newsimg_y','500','','0','0','cn');
INSERT INTO met_config VALUES('132','met_productimg_x','800','','0','0','cn');
INSERT INTO met_config VALUES('133','met_productimg_y','500','','0','0','cn');
INSERT INTO met_config VALUES('134','met_imgs_x','800','','0','0','cn');
INSERT INTO met_config VALUES('135','met_imgs_y','500','','0','0','cn');
INSERT INTO met_config VALUES('136','met_productdetail_x','800','','0','0','cn');
INSERT INTO met_config VALUES('137','met_productdetail_y','500','','0','0','cn');
INSERT INTO met_config VALUES('138','met_imgdetail_x','800','','0','0','cn');
INSERT INTO met_config VALUES('139','met_imgdetail_y','500','','0','0','cn');
INSERT INTO met_config VALUES('140','met_img_rename','1','','0','0','cn');
INSERT INTO met_config VALUES('141','access_type','1','','0','0','cn');
INSERT INTO met_config VALUES('142','met_logs','0','','0','0','cn');
INSERT INTO met_config VALUES('143','met_auto_play_pc','0','','0','0','cn');
INSERT INTO met_config VALUES('144','met_auto_play_mobile','0','','0','0','cn');
INSERT INTO met_config VALUES('145','met_memberlogin_code','1','','0','0','cn');
INSERT INTO met_config VALUES('146','met_login_code','0','','0','0','cn');
INSERT INTO met_config VALUES('147','met_file_maxsize','8','','0','0','cn');
INSERT INTO met_config VALUES('148','met_file_format','rar|zip|sql|doc|docx|pdf|jpg|xls|png|gif|mp3|mp4|jpeg|bmp|swf|flv|ico|csv','','0','0','cn');
INSERT INTO met_config VALUES('149','met_info_security_statement_open','0','','0','0','cn');
INSERT INTO met_config VALUES('150','met_info_security_statement_modal_title','个人信息安全声明','','0','0','cn');
INSERT INTO met_config VALUES('151','met_info_security_statement_title','个人信息安全声明','','0','0','cn');
INSERT INTO met_config VALUES('152','met_info_security_statement_content','个人信息安全声明','','0','0','cn');
INSERT INTO met_config VALUES('153','met_auto_close','0','','0','0','cn');
INSERT INTO met_config VALUES('154','met_auto_show','1','','0','0','cn');
INSERT INTO met_config VALUES('155','met_member_use','1','','0','0','cn');
INSERT INTO met_config VALUES('156','met_member_register','1','','0','0','cn');
INSERT INTO met_config VALUES('157','met_member_vecan','4','','0','0','cn');
INSERT INTO met_config VALUES('158','met_member_bgcolor','','','0','0','cn');
INSERT INTO met_config VALUES('159','met_member_bgimage','','','0','0','cn');
INSERT INTO met_config VALUES('160','met_member_agreement','0','','0','0','cn');
INSERT INTO met_config VALUES('161','met_member_agreement_content','','','0','0','cn');
INSERT INTO met_config VALUES('162','met_member_bg_range','1','','0','0','cn');
INSERT INTO met_config VALUES('163','met_login_box_position','1','','0','0','cn');
INSERT INTO met_config VALUES('164','met_new_registe_email_notice','1','','0','0','cn');
INSERT INTO met_config VALUES('165','met_to_admin_email','','','0','0','cn');
INSERT INTO met_config VALUES('166','met_new_registe_sms_notice','1','','0','0','cn');
INSERT INTO met_config VALUES('167','met_to_admin_sms','','','0','0','cn');
INSERT INTO met_config VALUES('168','met_member_email_reg_title','{webname} 会员中心 注册验证','','0','0','cn');
INSERT INTO met_config VALUES('169','met_member_email_reg_content','<div style=\"width:500px;margin:20px auto;\"><div class=\"header clearfix\" style=\"font-family: &#39;lucida Grande&#39;, Verdana, &#39;Microsoft YaHei&#39;; line-height: 23.7999992370605px; background-color: rgb(255, 255, 255);\"><a href=\"{weburl}\"><strong style=\"outline: none; cursor: pointer; color: rgb(30, 84, 148);\">{webname} 会员中心</strong></a></div><p>&nbsp;</p><div class=\"content\" style=\"font-family: &#39;lucida Grande&#39;, Verdana, &#39;Microsoft YaHei&#39;; line-height: 23.7999992370605px; border: 1px solid rgb(233, 233, 233); margin: 2px 0px 0px; padding: 30px; background: none 0px 0px repeat scroll rgb(255, 255, 255);\"><p style=\"line-height: 23.7999992370605px;\">您好：</p><p style=\"line-height: 23.7999992370605px;\">这是您在 {webname} 会员中心 上的重要邮件, 功能是进行&nbsp;会员中心 注册验证, 请点击下面的连接完成验证</p><p style=\"line-height: 23.7999992370605px; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); margin-top: 15px; margin-bottom: 25px; padding: 15px;\">请点击链接继续：{opurl}</p><p style=\"line-height: 23.7999992370605px;\">&nbsp;</p><p class=\"footer\" style=\"line-height: 23.7999992370605px; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); padding-top: 6px; margin-top: 25px; color: rgb(131, 131, 131);\">请勿回复本邮件, 此邮箱未受监控, 您不会得到任何回复。<br/><br/><a href=\"{weburl}\"><strong style=\"outline: none; cursor: pointer; color: rgb(30, 84, 148);\">{webname}会员中心</strong></a></p></div></div>','','0','0','cn');
INSERT INTO met_config VALUES('170','met_member_email_password_title','{webname} 会员中心 密码找回','','0','0','cn');
INSERT INTO met_config VALUES('171','met_member_email_password_content','<div style=\"width:500px;margin:20px auto;\"><div class=\"header clearfix\" style=\"font-family: &#39;lucida Grande&#39;, Verdana, &#39;Microsoft YaHei&#39;; line-height: 23.7999992370605px; background-color: rgb(255, 255, 255);\"><a href=\"{weburl}\"><strong style=\"outline: none; cursor: pointer; color: rgb(30, 84, 148);\">{webname} 会员中心</strong></a></div><p>&nbsp;</p><div class=\"content\" style=\"font-family: &#39;lucida Grande&#39;, Verdana, &#39;Microsoft YaHei&#39;; line-height: 23.7999992370605px; border: 1px solid rgb(233, 233, 233); margin: 2px 0px 0px; padding: 30px; background: none 0px 0px repeat scroll rgb(255, 255, 255);\"><p style=\"line-height: 23.7999992370605px;\">您好：</p><p style=\"line-height: 23.7999992370605px;\">这是您在 {webname} 会员中心 上的重要邮件, 功能是进行&nbsp;会员中心 密码找回, 请点击下面的连接完成验证</p><p style=\"line-height: 23.7999992370605px; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); margin-top: 15px; margin-bottom: 25px; padding: 15px;\">请点击链接继续：{opurl}</p><p style=\"line-height: 23.7999992370605px;\">&nbsp;</p><p class=\"footer\" style=\"line-height: 23.7999992370605px; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); padding-top: 6px; margin-top: 25px; color: rgb(131, 131, 131);\">请勿回复本邮件, 此邮箱未受监控, 您不会得到任何回复。<br/><br/><a href=\"{weburl}\"><strong style=\"outline: none; cursor: pointer; color: rgb(30, 84, 148);\">{webname}会员中心</strong></a></p></div></div>','','0','0','cn');
INSERT INTO met_config VALUES('172','met_member_email_safety_title','{webname} 会员中心 修改绑定邮箱','','0','0','cn');
INSERT INTO met_config VALUES('173','met_member_email_safety_content','<div style=\"width:500px;margin:20px auto;\"><div class=\"header clearfix\" style=\"font-family: &#39;lucida Grande&#39;, Verdana, &#39;Microsoft YaHei&#39;; line-height: 23.7999992370605px; background-color: rgb(255, 255, 255);\"><a href=\"{weburl}\"><strong style=\"outline: none; cursor: pointer; color: rgb(30, 84, 148);\">{webname} 会员中心</strong></a></div><p>&nbsp;</p><div class=\"content\" style=\"font-family: &#39;lucida Grande&#39;, Verdana, &#39;Microsoft YaHei&#39;; line-height: 23.7999992370605px; border: 1px solid rgb(233, 233, 233); margin: 2px 0px 0px; padding: 30px; background: none 0px 0px repeat scroll rgb(255, 255, 255);\"><p style=\"line-height: 23.7999992370605px;\">您好：</p><p style=\"line-height: 23.7999992370605px;\">这是您在 {webname} 会员中心 上的重要邮件, 功能是进行&nbsp;会员中心 绑定邮箱修改, 请点击下面的连接完成验证</p><p style=\"line-height: 23.7999992370605px; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); margin-top: 15px; margin-bottom: 25px; padding: 15px;\">请点击链接继续：{opurl}</p><p style=\"line-height: 23.7999992370605px;\">&nbsp;</p><p class=\"footer\" style=\"line-height: 23.7999992370605px; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); padding-top: 6px; margin-top: 25px; color: rgb(131, 131,131);\">请勿回复本邮件,此邮箱未受监控,您不会得到任何回复。<br/><br/><a href=\"{weburl}\"><strong style=\"outline: none; cursor: pointer; color: rgb(30, 84, 148);\">{webname}会员中心</strong></a></p></div></div>','','0','0','cn');
INSERT INTO met_config VALUES('174','met_auto_register','','','0','0','cn');
INSERT INTO met_config VALUES('175','met_weixin_appid','','','0','0','cn');
INSERT INTO met_config VALUES('176','met_weixin_appsecret','','','0','0','cn');
INSERT INTO met_config VALUES('177','met_weibo_appkey','','','0','0','cn');
INSERT INTO met_config VALUES('178','met_weibo_appsecret','','','0','0','cn');
INSERT INTO met_config VALUES('179','met_qq_appid','','','0','0','cn');
INSERT INTO met_config VALUES('180','met_qq_appsecret','','','0','0','cn');
INSERT INTO met_config VALUES('181','met_weixin_open','0','','0','0','cn');
INSERT INTO met_config VALUES('182','met_weibo_open','0','','0','0','cn');
INSERT INTO met_config VALUES('183','met_qq_open','0','','0','0','cn');
INSERT INTO met_config VALUES('184','met_weixin_gz_appid','','','0','0','cn');
INSERT INTO met_config VALUES('185','met_weixin_gz_appsecret','','','0','0','cn');
INSERT INTO met_config VALUES('186','met_weixin_gz_token','','','0','0','cn');
INSERT INTO met_config VALUES('187','met_google_open','','','0','0','cn');
INSERT INTO met_config VALUES('188','met_google_appid','','','0','0','cn');
INSERT INTO met_config VALUES('189','met_google_appsecret','','','0','0','cn');
INSERT INTO met_config VALUES('190','met_facebook_open','','','0','0','cn');
INSERT INTO met_config VALUES('191','met_facebook_appid','','','0','0','cn');
INSERT INTO met_config VALUES('192','met_facebook_appsecret','','','0','0','cn');
INSERT INTO met_config VALUES('193','met_member_idvalidate','0','','0','0','cn');
INSERT INTO met_config VALUES('194','met_idvalid_key','','','0','0','cn');
INSERT INTO met_config VALUES('195','met_pnorder','0','','0','0','cn');
INSERT INTO met_config VALUES('196','met_product_page','0','','0','0','cn');
INSERT INTO met_config VALUES('197','met_img_page','0','','0','0','cn');
INSERT INTO met_config VALUES('198','met_productTabname','详细信息','','0','0','cn');
INSERT INTO met_config VALUES('199','met_productTabname_1','规格参数','','0','0','cn');
INSERT INTO met_config VALUES('200','met_productTabname_2','包装','','0','0','cn');
INSERT INTO met_config VALUES('201','met_productTabname_3','选项卡四','','0','0','cn');
INSERT INTO met_config VALUES('202','met_productTabname_4','选项卡五','','0','0','cn');
INSERT INTO met_config VALUES('203','met_product_list','8','','0','0','cn');
INSERT INTO met_config VALUES('204','met_news_list','8','','0','0','cn');
INSERT INTO met_config VALUES('205','met_download_list','8','','0','0','cn');
INSERT INTO met_config VALUES('206','met_img_list','8','','0','0','cn');
INSERT INTO met_config VALUES('207','met_job_list','3','','0','0','cn');
INSERT INTO met_config VALUES('208','met_message_list','10','','0','0','cn');
INSERT INTO met_config VALUES('209','met_search_list','10','','0','0','cn');
INSERT INTO met_config VALUES('210','global_search_range','all','','0','0','cn');
INSERT INTO met_config VALUES('211','global_search_type','0','','0','0','cn');
INSERT INTO met_config VALUES('212','global_search_module','2','','0','0','cn');
INSERT INTO met_config VALUES('213','global_search_column','3','','0','0','cn');
INSERT INTO met_config VALUES('214','global_search_weight','1|2|3|4|5|6','','0','0','cn');
INSERT INTO met_config VALUES('215','column_search_range','parent','','0','0','cn');
INSERT INTO met_config VALUES('216','column_search_type','0','','0','0','cn');
INSERT INTO met_config VALUES('217','advanced_search_range','all','','0','0','cn');
INSERT INTO met_config VALUES('218','advanced_search_type','1','','0','0','cn');
INSERT INTO met_config VALUES('219','advanced_search_column','3','','0','0','cn');
INSERT INTO met_config VALUES('220','advanced_search_linkage','1','','0','0','cn');
INSERT INTO met_config VALUES('221','debug','0','','0','0','en');
INSERT INTO met_config VALUES('222','met_skin_user','metv75','','0','0','en');
INSERT INTO met_config VALUES('223','met_listtime','Y/m/d','','0','0','en');
INSERT INTO met_config VALUES('224','met_contenttime','Y-m-d H:i:s','','0','0','en');
INSERT INTO met_config VALUES('225','met_hometitle','','','0','0','en');
INSERT INTO met_config VALUES('226','met_title_type','2','','0','0','en');
INSERT INTO met_config VALUES('227','met_alt','MetInfo enterprise content manager system | MetInfo CMS','','0','0','en');
INSERT INTO met_config VALUES('228','met_atitle','MetInfo CMS','','0','0','en');
INSERT INTO met_config VALUES('229','met_linkname','MetInfo CMS','','0','0','en');
INSERT INTO met_config VALUES('230','met_seo_canonical','0','','0','0','en');
INSERT INTO met_config VALUES('231','tag_show_number','8','','0','0','en');
INSERT INTO met_config VALUES('232','tag_show_range','0','','0','0','en');
INSERT INTO met_config VALUES('233','tag_search_type','module','','0','0','en');
INSERT INTO met_config VALUES('234','met_404content','404 error, the page is gone. . .','','0','0','en');
INSERT INTO met_config VALUES('235','met_data_null','The page is gone','','0','0','en');
INSERT INTO met_config VALUES('236','met_foottext','','','0','0','en');
INSERT INTO met_config VALUES('237','met_seo','','','0','0','en');
INSERT INTO met_config VALUES('238','met_webhtm','0','','0','0','en');
INSERT INTO met_config VALUES('239','met_htmtype','html','','0','0','en');
INSERT INTO met_config VALUES('240','met_htmpagename','2','','0','0','en');
INSERT INTO met_config VALUES('241','met_listhtmltype','1','','0','0','en');
INSERT INTO met_config VALUES('242','met_htmlistname','1','','0','0','en');
INSERT INTO met_config VALUES('243','met_htmway','1','','0','0','en');
INSERT INTO met_config VALUES('244','met_html_auto','2','','0','0','en');
INSERT INTO met_config VALUES('245','met_htmlurl','0','','0','0','en');
INSERT INTO met_config VALUES('246','met_pseudo','0','','0','0','en');
INSERT INTO met_config VALUES('247','met_defult_lang','0','0','0','0','en');
INSERT INTO met_config VALUES('248','met_sitemap_auto','1','','0','0','en');
INSERT INTO met_config VALUES('249','met_online_skin','2','','0','0','en');
INSERT INTO met_config VALUES('250','met_online_type','2','','0','0','en');
INSERT INTO met_config VALUES('251','met_online_color','#1baadb','','0','0','en');
INSERT INTO met_config VALUES('252','met_onlinetel','<p>Hotline：</p><p>100-000-0000</p>','','0','0','en');
INSERT INTO met_config VALUES('253','met_online_x','10','','0','0','en');
INSERT INTO met_config VALUES('254','met_online_y','300','','0','0','en');
INSERT INTO met_config VALUES('255','met_onlinenameok','0','','0','0','en');
INSERT INTO met_config VALUES('256','met_qq_type','4','','0','0','en');
INSERT INTO met_config VALUES('257','met_taobao_type','2','','0','0','en');
INSERT INTO met_config VALUES('258','met_alibaba_type','10','','0','0','en');
INSERT INTO met_config VALUES('259','met_webname','Website Name','','0','0','en');
INSERT INTO met_config VALUES('260','met_logo','../upload/202109/1631583738.png','','0','0','en');
INSERT INTO met_config VALUES('261','met_mobile_logo','../upload/202109/1631583738.png','','0','0','en');
INSERT INTO met_config VALUES('262','met_logo_keyword','Logo Keywords','','0','0','en');
INSERT INTO met_config VALUES('263','met_keywords','Website Keywords','','0','0','en');
INSERT INTO met_config VALUES('264','met_description','MetInfo enterprise content manager system','','0','0','en');
INSERT INTO met_config VALUES('265','met_footright','MSN:0000@000.com Email:sales@metinfo.cn','','0','0','en');
INSERT INTO met_config VALUES('266','met_footaddress','','','0','0','en');
INSERT INTO met_config VALUES('267','met_foottel','','','0','0','en');
INSERT INTO met_config VALUES('268','met_footother','','','0','0','en');
INSERT INTO met_config VALUES('269','met_icp_info','','','0','0','en');
INSERT INTO met_config VALUES('270','met_beian_info','','','0','0','en');
INSERT INTO met_config VALUES('271','met_fd_fromname','MetInfo Co.,Ltd','','0','0','en');
INSERT INTO met_config VALUES('272','met_fd_smtp','61.152.188.131','','0','0','en');
INSERT INTO met_config VALUES('273','met_fd_usename','test@mail.metinfo.cn','','0','0','en');
INSERT INTO met_config VALUES('274','met_fd_password','123456','','0','0','en');
INSERT INTO met_config VALUES('275','met_fd_port','465','','0','0','en');
INSERT INTO met_config VALUES('276','met_fd_way','ssl','','0','0','en');
INSERT INTO met_config VALUES('277','met_fd_word','','','0','0','en');
INSERT INTO met_config VALUES('278','met_headstat','','','0','0','en');
INSERT INTO met_config VALUES('279','met_footstat','<script>\r\nvar _hmt = _hmt || [];\r\n(function() {\r\n  var hm = document.createElement(\"script\");\r\n  hm.src = \"https://hm.baidu.com/hm.js?520556228c0113270c0c772027905838\";\r\n  var s = document.getElementsByTagName(\"script\")[0]; \r\n  s.parentNode.insertBefore(hm, s);\r\n})();\r\n</script>','','0','0','en');
INSERT INTO met_config VALUES('280','met_headstat_mobile','','','0','0','en');
INSERT INTO met_config VALUES('281','met_footstat_mobile','<script>\r\nvar _hmt = _hmt || [];\r\n(function() {\r\n  var hm = document.createElement(\"script\");\r\n  hm.src = \"https://hm.baidu.com/hm.js?520556228c0113270c0c772027905838\";\r\n  var s = document.getElementsByTagName(\"script\")[0]; \r\n  s.parentNode.insertBefore(hm, s);\r\n})();\r\n</script>','','0','0','en');
INSERT INTO met_config VALUES('282','met_big_wate','0','','0','0','en');
INSERT INTO met_config VALUES('283','met_thumb_wate','0','','0','0','en');
INSERT INTO met_config VALUES('284','met_wate_class','1','','0','0','en');
INSERT INTO met_config VALUES('285','met_wate_img','','','0','0','en');
INSERT INTO met_config VALUES('286','met_wate_bigimg','','','0','0','en');
INSERT INTO met_config VALUES('287','met_wate_img_scale','0','','0','0','en');
INSERT INTO met_config VALUES('288','met_wate_img_gif_hold','0','','0','0','en');
INSERT INTO met_config VALUES('289','met_text_wate','MetInfo','','0','0','en');
INSERT INTO met_config VALUES('290','met_text_size','10','','0','0','en');
INSERT INTO met_config VALUES('291','met_text_bigsize','15','','0','0','en');
INSERT INTO met_config VALUES('292','met_text_color','#808080','','0','0','en');
INSERT INTO met_config VALUES('293','met_text_angle','0','','0','0','en');
INSERT INTO met_config VALUES('294','met_watermark','0','','0','0','en');
INSERT INTO met_config VALUES('295','met_autothumb_ok','0','','0','0','en');
INSERT INTO met_config VALUES('296','met_thumb_kind','2','','0','0','en');
INSERT INTO met_config VALUES('297','met_newsimg_x','800','','0','0','en');
INSERT INTO met_config VALUES('298','met_newsimg_y','500','','0','0','en');
INSERT INTO met_config VALUES('299','met_productimg_x','800','','0','0','en');
INSERT INTO met_config VALUES('300','met_productimg_y','500','','0','0','en');
INSERT INTO met_config VALUES('301','met_imgs_x','800','','0','0','en');
INSERT INTO met_config VALUES('302','met_imgs_y','500','','0','0','en');
INSERT INTO met_config VALUES('303','met_productdetail_x','800','','0','0','en');
INSERT INTO met_config VALUES('304','met_productdetail_y','500','','0','0','en');
INSERT INTO met_config VALUES('305','met_imgdetail_x','800','','0','0','en');
INSERT INTO met_config VALUES('306','met_imgdetail_y','500','','0','0','en');
INSERT INTO met_config VALUES('307','met_img_rename','1','','0','0','en');
INSERT INTO met_config VALUES('308','access_type','1','','0','0','en');
INSERT INTO met_config VALUES('309','met_logs','0','','0','0','en');
INSERT INTO met_config VALUES('310','met_auto_play_pc','0','','0','0','en');
INSERT INTO met_config VALUES('311','met_auto_play_mobile','0','','0','0','en');
INSERT INTO met_config VALUES('312','met_memberlogin_code','1','','0','0','en');
INSERT INTO met_config VALUES('313','met_login_code','0','','0','0','en');
INSERT INTO met_config VALUES('314','met_file_maxsize','5','','0','0','en');
INSERT INTO met_config VALUES('315','met_file_format','rar|zip|sql|doc|docx|pdf|jpg|xls|png|gif|mp3|mp4|jpeg|bmp|swf|flv|ico|csv','','0','0','en');
INSERT INTO met_config VALUES('316','met_info_security_statement_open','0','','0','0','en');
INSERT INTO met_config VALUES('317','met_info_security_statement_modal_title','Information Security Statement','','0','0','en');
INSERT INTO met_config VALUES('318','met_info_security_statement_title','Information Security Statement','','0','0','en');
INSERT INTO met_config VALUES('319','met_info_security_statement_content','Information Security Statement','','0','0','en');
INSERT INTO met_config VALUES('320','met_auto_close','0','','0','0','en');
INSERT INTO met_config VALUES('321','met_auto_show','1','','0','0','en');
INSERT INTO met_config VALUES('322','met_member_use','1','','0','0','en');
INSERT INTO met_config VALUES('323','met_member_register','1','','0','0','en');
INSERT INTO met_config VALUES('324','met_member_vecan','4','','0','0','en');
INSERT INTO met_config VALUES('325','met_member_bgcolor','','','0','0','en');
INSERT INTO met_config VALUES('326','met_member_bgimage','','','0','0','en');
INSERT INTO met_config VALUES('327','met_member_agreement','0','','0','0','en');
INSERT INTO met_config VALUES('328','met_member_agreement_content','','','0','0','en');
INSERT INTO met_config VALUES('329','met_member_bg_range','1','','0','0','en');
INSERT INTO met_config VALUES('330','met_login_box_position','1','','0','0','en');
INSERT INTO met_config VALUES('331','met_new_registe_email_notice','1','','0','0','en');
INSERT INTO met_config VALUES('332','met_to_admin_email','','','0','0','en');
INSERT INTO met_config VALUES('333','met_new_registe_sms_notice','1','','0','0','en');
INSERT INTO met_config VALUES('334','met_to_admin_sms','','','0','0','en');
INSERT INTO met_config VALUES('335','met_member_email_reg_title','{webname} Member center registration verification','','0','0','en');
INSERT INTO met_config VALUES('336','met_member_email_reg_content','<div style=\"width:500px;margin:20px auto;\"><div class=\"header clearfix\" style=\"font-family: &#39;lucida Grande&#39;, Verdana, &#39;Microsoft YaHei&#39;; line-height: 23.7999992370605px; background-color: rgb(255, 255, 255);\"><a href=\"{weburl}\"><strong style=\"outline: none; cursor: pointer; color: rgb(30, 84, 148);\">{webname} Member center</strong></a></div><p>&nbsp;</p><div class=\"content\" style=\"font-family: &#39;lucida Grande&#39;, Verdana, &#39;Microsoft YaHei&#39;; line-height: 23.7999992370605px; border: 1px solid rgb(233, 233, 233); margin: 2px 0px 0px; padding: 30px; background: none 0px 0px repeat scroll rgb(255, 255, 255);\"><p style=\"line-height: 23.7999992370605px;\">hello:</p><p style=\"line-height: 23.7999992370605px;\">This is your key message on the {webname} member center, Function is to carry out&nbsp;Member center registration verification, please click on the link below to complete the verification</p><p style=\"line-height: 23.7999992370605px; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); margin-top: 15px; margin-bottom: 25px; padding: 15px;\">Please click on the link to continue:{opurl}</p><p style=\"line-height: 23.7999992370605px;\">&nbsp;</p><p class=\"footer\" style=\"line-height: 23.7999992370605px; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); padding-top: 6px; margin-top: 25px; color: rgb(131, 131, 131);\">Please do not reply to this message, this mailbox is not monitored, you will not get any reply.<br/><br/><a href=\"{weburl}\"><strong style=\"outline: none; cursor: pointer; color: rgb(30, 84, 148);\">{webname}Member Center</strong></a></p></div></div>','','0','0','en');
INSERT INTO met_config VALUES('337','met_member_email_password_title','{webname} Member center password back','','0','0','en');
INSERT INTO met_config VALUES('338','met_member_email_password_content','<div style=\"width:500px;margin:20px auto;\"><div class=\"header clearfix\" style=\"font-family: &#39;lucida Grande&#39;, Verdana, &#39;Microsoft YaHei&#39;; line-height: 23.7999992370605px; background-color: rgb(255, 255, 255);\"><a href=\"{weburl}\"><strong style=\"outline: none; cursor: pointer; color: rgb(30, 84, 148);\">{webname} Member Center</strong></a></div><p>&nbsp;</p><div class=\"content\" style=\"font-family: &#39;lucida Grande&#39;, Verdana, &#39;Microsoft YaHei&#39;; line-height: 23.7999992370605px; border: 1px solid rgb(233, 233, 233); margin: 2px 0px 0px; padding: 30px; background: none 0px 0px repeat scroll rgb(255, 255, 255);\"><p style=\"line-height: 23.7999992370605px;\">hello:</p><p style=\"line-height: 23.7999992370605px;\">This is your key message on the {webname} Important message on the member center, Function is to carry out&nbsp;Member center password back, please click on the link below to complete the verification</p><p style=\"line-height: 23.7999992370605px; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); margin-top: 15px; margin-bottom: 25px; padding: 15px;\">Please click on the link to continue:{opurl}</p><p style=\"line-height: 23.7999992370605px;\">&nbsp;</p><p class=\"footer\" style=\"line-height: 23.7999992370605px; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); padding-top: 6px; margin-top: 25px; color: rgb(131, 131, 131);\">Please do not reply to this message, this mailbox is not monitored, you will not get any reply.<br/><br/><a href=\"{weburl}\"><strong style=\"outline: none; cursor: pointer; color: rgb(30, 84, 148);\">{webname}Member Center</strong></a></p></div></div>','','0','0','en');
INSERT INTO met_config VALUES('339','met_member_email_safety_title','{webname} Member center to modify the binding mailbox','','0','0','en');
INSERT INTO met_config VALUES('340','met_member_email_safety_content','<div style=\"width:500px;margin:20px auto;\"><div class=\"header clearfix\" style=\"font-family: &#39;lucida Grande&#39;, Verdana, &#39;Microsoft YaHei&#39;; line-height: 23.7999992370605px; background-color: rgb(255, 255, 255);\"><a href=\"{weburl}\"><strong style=\"outline: none; cursor: pointer; color: rgb(30, 84, 148);\">{webname} Member Center</strong></a></div><p>&nbsp;</p><div class=\"content\" style=\"font-family: &#39;lucida Grande&#39;, Verdana, &#39;Microsoft YaHei&#39;; line-height: 23.7999992370605px; border: 1px solid rgb(233, 233, 233); margin: 2px 0px 0px; padding: 30px; background: none 0px 0px repeat scroll rgb(255, 255, 255);\"><p style=\"line-height: 23.7999992370605px;\">hello:</p><p style=\"line-height: 23.7999992370605px;\">This is your key message on the {webname} Important message on the member center, Function is to carry out&nbsp;Member center bound mailbox modification, please click on the link below to complete the verification</p><p style=\"line-height: 23.7999992370605px; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); margin-top: 15px; margin-bottom: 25px; padding: 15px;\">Please click on the link to continue:{opurl}</p><p style=\"line-height: 23.7999992370605px;\">&nbsp;</p><p class=\"footer\" style=\"line-height: 23.7999992370605px; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); padding-top: 6px; margin-top: 25px; color: rgb(131, 131,131);\">Please do not reply to this message, this mailbox is not monitored, you will not get any reply.<br/><br/><a href=\"{weburl}\"><strong style=\"outline: none; cursor: pointer; color: rgb(30, 84, 148);\">{webname}Member Center</strong></a></p></div></div>','','0','0','en');
INSERT INTO met_config VALUES('341','met_auto_register','','','0','0','en');
INSERT INTO met_config VALUES('342','met_weixin_appid','','','0','0','en');
INSERT INTO met_config VALUES('343','met_weixin_appsecret','','','0','0','en');
INSERT INTO met_config VALUES('344','met_weibo_appkey','','','0','0','en');
INSERT INTO met_config VALUES('345','met_weibo_appsecret','','','0','0','en');
INSERT INTO met_config VALUES('346','met_qq_appid','','','0','0','en');
INSERT INTO met_config VALUES('347','met_qq_appsecret','','','0','0','en');
INSERT INTO met_config VALUES('348','met_weixin_open','0','','0','0','en');
INSERT INTO met_config VALUES('349','met_weibo_open','0','','0','0','en');
INSERT INTO met_config VALUES('350','met_qq_open','0','','0','0','en');
INSERT INTO met_config VALUES('351','met_weixin_gz_appid','','','0','0','en');
INSERT INTO met_config VALUES('352','met_weixin_gz_appsecret','','','0','0','en');
INSERT INTO met_config VALUES('353','met_weixin_gz_token','','','0','0','en');
INSERT INTO met_config VALUES('354','met_google_open','','','0','0','en');
INSERT INTO met_config VALUES('355','met_google_appid','','','0','0','en');
INSERT INTO met_config VALUES('356','met_google_appsecret','','','0','0','en');
INSERT INTO met_config VALUES('357','met_facebook_open','','','0','0','en');
INSERT INTO met_config VALUES('358','met_facebook_appid','','','0','0','en');
INSERT INTO met_config VALUES('359','met_facebook_appsecret','','','0','0','en');
INSERT INTO met_config VALUES('360','met_member_idvalidate','0','','0','0','en');
INSERT INTO met_config VALUES('361','met_idvalid_key','','','0','0','en');
INSERT INTO met_config VALUES('362','met_pnorder','0','','0','0','en');
INSERT INTO met_config VALUES('363','met_product_page','0','','0','0','en');
INSERT INTO met_config VALUES('364','met_img_page','0','','0','0','en');
INSERT INTO met_config VALUES('365','met_productTabname','Detailed information','','0','0','en');
INSERT INTO met_config VALUES('366','met_productTabname_1','Specification','','0','0','en');
INSERT INTO met_config VALUES('367','met_productTabname_2','Packing','','0','0','en');
INSERT INTO met_config VALUES('368','met_productTabname_3','Tab four','','0','0','en');
INSERT INTO met_config VALUES('369','met_productTabname_4','Tab five','','0','0','en');
INSERT INTO met_config VALUES('370','met_productTabok','3','','0','0','en');
INSERT INTO met_config VALUES('371','met_product_list','8','','0','0','en');
INSERT INTO met_config VALUES('372','met_news_list','8','','0','0','en');
INSERT INTO met_config VALUES('373','met_download_list','10','','0','0','en');
INSERT INTO met_config VALUES('374','met_img_list','12','','0','0','en');
INSERT INTO met_config VALUES('375','met_job_list','2','','0','0','en');
INSERT INTO met_config VALUES('376','met_message_list','10','','0','0','en');
INSERT INTO met_config VALUES('377','met_search_list','10','','0','0','en');
INSERT INTO met_config VALUES('378','global_search_range','all','','0','0','en');
INSERT INTO met_config VALUES('379','global_search_type','0','','0','0','en');
INSERT INTO met_config VALUES('380','global_search_module','2','','0','0','en');
INSERT INTO met_config VALUES('381','global_search_column','3','','0','0','en');
INSERT INTO met_config VALUES('382','global_search_weight','1|2|3|4|5|6','','0','0','en');
INSERT INTO met_config VALUES('383','column_search_range','parent','','0','0','en');
INSERT INTO met_config VALUES('384','column_search_type','0','','0','0','en');
INSERT INTO met_config VALUES('385','advanced_search_range','all','','0','0','en');
INSERT INTO met_config VALUES('386','advanced_search_type','1','','0','0','en');
INSERT INTO met_config VALUES('387','advanced_search_column','3','','0','0','en');
INSERT INTO met_config VALUES('388','advanced_search_linkage','1','','0','0','en');
INSERT INTO met_config VALUES('389','met_msg_ok','1','','133','0','cn');
INSERT INTO met_config VALUES('390','met_msg_time','120','','133','0','cn');
INSERT INTO met_config VALUES('391','met_msg_name_field','137','','133','0','cn');
INSERT INTO met_config VALUES('392','met_msg_content_field','140','','133','0','cn');
INSERT INTO met_config VALUES('393','met_msg_show_type','1','','133','0','cn');
INSERT INTO met_config VALUES('394','met_msg_type','1','','133','0','cn');
INSERT INTO met_config VALUES('395','met_msg_sms_content','','','133','0','cn');
INSERT INTO met_config VALUES('396','met_msg_sms_field','','','133','0','cn');
INSERT INTO met_config VALUES('397','met_msg_sms_back','1','','133','0','cn');
INSERT INTO met_config VALUES('398','met_msg_content','','','133','0','cn');
INSERT INTO met_config VALUES('399','met_msg_title','','','133','0','cn');
INSERT INTO met_config VALUES('400','met_msg_email_field','','','133','0','cn');
INSERT INTO met_config VALUES('401','met_msg_back','1','','133','0','cn');
INSERT INTO met_config VALUES('402','met_msg_admin_tel','','','133','0','cn');
INSERT INTO met_config VALUES('403','met_msg_to','Emial@email.mt','','133','0','cn');
INSERT INTO met_config VALUES('404','met_cv_sms_content','','','131','0','cn');
INSERT INTO met_config VALUES('405','met_cv_sms_tell','','','131','0','cn');
INSERT INTO met_config VALUES('406','met_cv_sms_back','1','','131','0','cn');
INSERT INTO met_config VALUES('407','met_cv_content','','','131','0','cn');
INSERT INTO met_config VALUES('408','met_cv_title','','','131','0','cn');
INSERT INTO met_config VALUES('409','met_cv_email','','','131','0','cn');
INSERT INTO met_config VALUES('410','met_cv_back','1','','131','0','cn');
INSERT INTO met_config VALUES('411','met_cv_job_tel','','','131','0','cn');
INSERT INTO met_config VALUES('412','met_cv_to','','','131','0','cn');
INSERT INTO met_config VALUES('413','met_cv_type','','','131','0','cn');
INSERT INTO met_config VALUES('414','met_cv_emtype','1','','131','0','cn');
INSERT INTO met_config VALUES('415','met_cv_showcol','163|164|165|166|167|168|169|170|171|172|173|174|175','','131','0','cn');
INSERT INTO met_config VALUES('416','met_cv_image','','','131','0','cn');
INSERT INTO met_config VALUES('417','met_cv_time','120','','131','0','cn');
INSERT INTO met_config VALUES('418','met_fd_type','','','134','0','cn');
INSERT INTO met_config VALUES('419','met_fd_to','','','134','0','cn');
INSERT INTO met_config VALUES('420','met_fd_admin_tel','','','134','0','cn');
INSERT INTO met_config VALUES('421','met_fd_back','','','134','0','cn');
INSERT INTO met_config VALUES('422','met_fd_email','','','134','0','cn');
INSERT INTO met_config VALUES('423','met_fd_title','','','134','0','cn');
INSERT INTO met_config VALUES('424','met_fd_content','','','134','0','cn');
INSERT INTO met_config VALUES('425','met_fd_inquiry','','','134','0','cn');
INSERT INTO met_config VALUES('426','met_fd_sms_content','','','134','0','cn');
INSERT INTO met_config VALUES('427','met_fd_sms_tell','','','134','0','cn');
INSERT INTO met_config VALUES('428','met_fd_sms_back','','','134','0','cn');
INSERT INTO met_config VALUES('429','met_fd_showcol','','','134','0','cn');
INSERT INTO met_config VALUES('430','met_fd_related','','','134','0','cn');
INSERT INTO met_config VALUES('431','met_fd_time','120','','134','0','cn');
INSERT INTO met_config VALUES('432','met_fdtable','在线反馈','','134','0','cn');
INSERT INTO met_config VALUES('433','met_fd_ok','','','134','0','cn');
INSERT INTO met_config VALUES('434','met_msg_sms_field','','','145','0','en');
INSERT INTO met_config VALUES('435','met_msg_sms_back','1','','145','0','en');
INSERT INTO met_config VALUES('436','met_msg_type','1','','145','0','en');
INSERT INTO met_config VALUES('437','met_msg_show_type','1','','145','0','en');
INSERT INTO met_config VALUES('438','met_msg_content','','','145','0','en');
INSERT INTO met_config VALUES('439','met_msg_sms_content','','','145','0','en');
INSERT INTO met_config VALUES('440','met_msg_content_field','230','','145','0','en');
INSERT INTO met_config VALUES('441','met_msg_name_field','226','','145','0','en');
INSERT INTO met_config VALUES('442','met_msg_time','120','','145','0','en');
INSERT INTO met_config VALUES('443','met_msg_ok','1','','145','0','en');
INSERT INTO met_config VALUES('444','met_msg_title','','','145','0','en');
INSERT INTO met_config VALUES('445','met_msg_email_field','','','145','0','en');
INSERT INTO met_config VALUES('446','met_msg_back','1','','145','0','en');
INSERT INTO met_config VALUES('447','met_msg_admin_tel','','','145','0','en');
INSERT INTO met_config VALUES('448','met_msg_to','Emial@email.mt','','145','0','en');
INSERT INTO met_config VALUES('449','met_cv_sms_content','','','158','0','en');
INSERT INTO met_config VALUES('450','met_cv_sms_tell','','','158','0','en');
INSERT INTO met_config VALUES('451','met_cv_sms_back','1','','158','0','en');
INSERT INTO met_config VALUES('452','met_cv_content','','','158','0','en');
INSERT INTO met_config VALUES('453','met_cv_title','','','158','0','en');
INSERT INTO met_config VALUES('454','met_cv_email','','','158','0','en');
INSERT INTO met_config VALUES('455','met_cv_back','1','','158','0','en');
INSERT INTO met_config VALUES('456','met_cv_job_tel','','','158','0','en');
INSERT INTO met_config VALUES('457','met_cv_to','','','158','0','en');
INSERT INTO met_config VALUES('458','met_cv_type','','','158','0','en');
INSERT INTO met_config VALUES('459','met_cv_emtype','1','','158','0','en');
INSERT INTO met_config VALUES('460','met_cv_showcol','213|214|215|216|217|218|219|220|221|222|223|224|225','','158','0','en');
INSERT INTO met_config VALUES('461','met_cv_image','','','158','0','en');
INSERT INTO met_config VALUES('462','met_cv_time','120','','158','0','en');
INSERT INTO met_config VALUES('463','met_fd_type','1','','146','0','en');
INSERT INTO met_config VALUES('464','met_fd_to','Email@email.mt','','146','0','en');
INSERT INTO met_config VALUES('465','met_fd_admin_tel','','','146','0','en');
INSERT INTO met_config VALUES('466','met_fd_back','1','','146','0','en');
INSERT INTO met_config VALUES('467','met_fd_email','','','146','0','en');
INSERT INTO met_config VALUES('468','met_fd_title','','','146','0','en');
INSERT INTO met_config VALUES('469','met_fd_content','','','146','0','en');
INSERT INTO met_config VALUES('470','met_fd_inquiry','','','146','0','en');
INSERT INTO met_config VALUES('471','met_fd_sms_content','','','146','0','en');
INSERT INTO met_config VALUES('472','met_fd_sms_tell','','','146','0','en');
INSERT INTO met_config VALUES('473','met_fd_sms_back','1','','146','0','en');
INSERT INTO met_config VALUES('474','met_fd_showcol','207|210|211|212|208|209','','146','0','en');
INSERT INTO met_config VALUES('475','met_fd_related','','','146','0','en');
INSERT INTO met_config VALUES('476','met_fd_time','120','','146','0','en');
INSERT INTO met_config VALUES('477','met_fdtable','在线反馈','','146','0','en');
INSERT INTO met_config VALUES('478','met_fd_ok','1','','146','0','en');

DROP TABLE IF EXISTS met_cv;
CREATE TABLE `met_cv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addtime` datetime DEFAULT NULL,
  `readok` int(11) DEFAULT '0',
  `customerid` varchar(50) DEFAULT '0',
  `jobid` int(11) NOT NULL DEFAULT '0',
  `lang` varchar(50) DEFAULT '',
  `ip` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS met_download;
CREATE TABLE `met_download` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT '',
  `ctitle` varchar(200) DEFAULT '',
  `keywords` varchar(200) DEFAULT '',
  `description` text,
  `content` longtext,
  `class1` int(11) DEFAULT '0',
  `class2` int(11) DEFAULT '0',
  `class3` int(11) DEFAULT '0',
  `no_order` int(11) DEFAULT '0',
  `new_ok` int(1) DEFAULT '0',
  `wap_ok` int(1) DEFAULT '0',
  `imgurl` varchar(255) DEFAULT '',
  `downloadurl` varchar(255) DEFAULT '',
  `filesize` varchar(100) DEFAULT '',
  `com_ok` int(1) DEFAULT '0',
  `hits` int(11) DEFAULT '0',
  `updatetime` datetime DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `issue` varchar(100) DEFAULT '',
  `access` text,
  `top_ok` int(1) DEFAULT '0',
  `downloadaccess` text,
  `filename` varchar(255) DEFAULT '',
  `lang` varchar(50) DEFAULT '',
  `recycle` int(11) NOT NULL DEFAULT '0',
  `displaytype` int(11) NOT NULL DEFAULT '1',
  `tag` text,
  `links` varchar(200) DEFAULT '',
  `text_size` int(11) DEFAULT '0',
  `text_color` varchar(100) DEFAULT '',
  `other_info` text,
  `custom_info` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

INSERT INTO met_download VALUES('24','产品使用说明书','','','目 录一、软件使用说明 二、软件安装过程： 三、巡更设备与电脑连接 四、操作步骤：五、软件操作流程 六、注意事项与系统维护七、常见故障处理 八、包装、运输及贮存 九、客户服务和技术支持承诺 十、产品保修卡、保修款','<p><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p>','129','0','0','0','0','0','','https://www.metinfo.cn/download/','2MB','0','5','2021-09-14 17:26:27','2021-09-13 17:57:09','admin','0','0','0','','cn','0','1','','','0','','','');

DROP TABLE IF EXISTS met_feedback;
CREATE TABLE `met_feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class1` int(11) DEFAULT '0',
  `fdtitle` varchar(255) DEFAULT '',
  `fromurl` varchar(255) DEFAULT '',
  `ip` varchar(255) DEFAULT '',
  `addtime` datetime DEFAULT NULL,
  `readok` int(11) DEFAULT '0',
  `useinfo` text,
  `customerid` varchar(30) DEFAULT '0',
  `lang` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS met_files;
CREATE TABLE `met_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(511) NOT NULL COMMENT '文件路径',
  `md5` varchar(50) NOT NULL COMMENT '文件md5',
  `size` int(11) NOT NULL COMMENT '文件大小 KB',
  `extension` varchar(50) NOT NULL COMMENT '扩展名',
  `type` varchar(50) NOT NULL COMMENT '类型 img|video',
  `folder` varchar(255) NOT NULL COMMENT '文件夹',
  `publisher` varchar(50) NOT NULL COMMENT '发布者',
  `create_at` datetime NOT NULL COMMENT '创建日期',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS met_flash;
CREATE TABLE `met_flash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module` text,
  `img_title` varchar(255) DEFAULT '',
  `img_path` varchar(255) DEFAULT '',
  `img_link` varchar(255) DEFAULT '',
  `flash_path` varchar(255) DEFAULT '',
  `flash_back` varchar(255) DEFAULT '',
  `no_order` int(11) DEFAULT '0',
  `width` int(11) DEFAULT '0',
  `height` int(11) DEFAULT '0',
  `wap_ok` int(11) DEFAULT '0',
  `img_title_color` varchar(100) DEFAULT '',
  `img_des` varchar(255) DEFAULT '',
  `img_des_color` varchar(100) DEFAULT '',
  `img_text_position` varchar(100) DEFAULT '4',
  `img_title_fontsize` int(11) DEFAULT '0',
  `img_des_fontsize` int(11) DEFAULT '0',
  `height_m` int(11) DEFAULT '0',
  `height_t` int(11) DEFAULT '0',
  `mobile_img_path` varchar(255) DEFAULT '',
  `img_title_mobile` varchar(255) DEFAULT '',
  `img_title_color_mobile` varchar(100) DEFAULT '',
  `img_text_position_mobile` varchar(100) DEFAULT '4',
  `img_title_fontsize_mobile` int(11) DEFAULT '0',
  `img_des_mobile` varchar(255) DEFAULT '',
  `img_des_color_mobile` varchar(100) DEFAULT '',
  `img_des_fontsize_mobile` int(11) DEFAULT '0',
  `lang` varchar(50) DEFAULT '',
  `target` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

INSERT INTO met_flash VALUES('7',',10001,','<strong>网站合规，就选米拓</strong>','../upload/202109/1631599526.jpg','','','','0','0','0','0','#ffffff','依据《网络安全法》《著作权法》《广告法》等的合规建站解决方案','#ffffff','0','35','16','0','0','../upload/202109/1631603332.jpg','','','4','0','','','0','cn','1');
INSERT INTO met_flash VALUES('8',',10001,','<strong>合规建站，就用米拓</strong>','../upload/202109/1631603134.jpg','','','','0','0','0','0','#ffffff','12年专注于米拓企业建站系统的研发，为你提供合规、安全、专业的官网解决方案！','#ffffff','0','35','16','0','0','../upload/202109/1631602888.jpg','','','4','0','','','0','cn','1');
INSERT INTO met_flash VALUES('10',',10001,','<strong>Compliant station construction, use Mituo</strong>','../upload/202109/1631599087.jpg','','','','0','0','0','0','#ffffff','For 12 years, we focus on the r & D of mituo enterprise station building system, providing you with compliance, safety and professional official website solutions!','#ffffff','0','32','18','0','0','../upload/202109/1631529339.jpg','<strong>Compliant station construction, use Mituo</strong>','','4','0','----','','0','en','1');
INSERT INTO met_flash VALUES('9',',10001,','<strong>Website compliance, choose Mituo</strong>','../upload/202109/1631599505.jpg','','','','0','0','0','0','#ffffff','According to the \"network security Law\" \"Copyright law\" \"advertising law\" and other compliance station solutions','#ffffff','0','32','18','0','0','../upload/202109/1631529840.jpg','<strong>Website compliance, choose Mituo</strong>','','4','0','----','','0','en','1');

DROP TABLE IF EXISTS met_flash_button;
CREATE TABLE `met_flash_button` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flash_id` int(11) NOT NULL DEFAULT '0',
  `but_text` varchar(255) DEFAULT '',
  `but_url` varchar(255) DEFAULT '',
  `but_text_size` int(11) DEFAULT '0',
  `but_text_color` varchar(100) DEFAULT '',
  `but_text_hover_color` varchar(100) DEFAULT '',
  `but_color` varchar(100) DEFAULT '',
  `but_hover_color` varchar(100) DEFAULT '',
  `but_size` varchar(100) DEFAULT '',
  `is_mobile` int(11) DEFAULT '0',
  `no_order` int(11) DEFAULT '0',
  `target` int(11) DEFAULT '0',
  `lang` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

INSERT INTO met_flash_button VALUES('5','8','了解详情 →','https://www.mituo.cn/','14','#ffffff','#ffffff','#ff8a00','#ff6a00','180x35','1','0','1','cn');
INSERT INTO met_flash_button VALUES('6','7','了解详情 →','https://www.mituo.cn/','14','#ffffff','#ffffff','#ff8a00','#ff6a00','180x35','1','0','1','cn');

DROP TABLE IF EXISTS met_flist;
CREATE TABLE `met_flist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `listid` int(11) DEFAULT '0',
  `paraid` int(11) DEFAULT '0',
  `info` text,
  `lang` varchar(50) DEFAULT '',
  `imgname` varchar(255) DEFAULT '',
  `module` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS met_history;
CREATE TABLE `met_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aid` varchar(511) NOT NULL COMMENT '内容id',
  `module` int(11) NOT NULL COMMENT '模块编号',
  `title` varchar(200) DEFAULT '',
  `ctitle` varchar(200) DEFAULT '',
  `keywords` varchar(200) DEFAULT '',
  `description` text,
  `content` longtext,
  `content1` mediumtext,
  `content2` mediumtext,
  `content3` mediumtext,
  `content4` mediumtext,
  `contentinfo` varchar(255) DEFAULT '',
  `contentinfo1` varchar(255) DEFAULT '',
  `contentinfo2` varchar(255) DEFAULT '',
  `contentinfo3` varchar(255) DEFAULT '',
  `contentinfo4` varchar(255) DEFAULT '',
  `class1` int(11) DEFAULT '0',
  `class2` int(11) DEFAULT '0',
  `class3` int(11) DEFAULT '0',
  `no_order` int(11) DEFAULT '0',
  `wap_ok` int(1) DEFAULT '0',
  `img_ok` int(1) DEFAULT '0',
  `imgurl` varchar(255) DEFAULT '',
  `imgurls` varchar(255) DEFAULT '',
  `displayimg` text,
  `video` text,
  `com_ok` int(1) DEFAULT '0',
  `issue` varchar(100) DEFAULT '',
  `hits` int(11) DEFAULT '0',
  `updatetime` datetime DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `access` text,
  `top_ok` int(1) DEFAULT '0',
  `filename` varchar(255) DEFAULT '',
  `lang` varchar(50) DEFAULT '',
  `recycle` int(11) DEFAULT '0',
  `displaytype` int(11) DEFAULT '0',
  `tag` text,
  `links` varchar(200) DEFAULT '',
  `publisher` varchar(50) DEFAULT '',
  `text_size` int(11) DEFAULT '0',
  `text_color` varchar(255) DEFAULT '',
  `other_info` text,
  `custom_info` text,
  `imgsize` varchar(255) DEFAULT '',
  `downloadurl` varchar(255) DEFAULT '',
  `filesize` varchar(100) DEFAULT '',
  `position` varchar(200) DEFAULT '',
  `count` int(11) DEFAULT '0',
  `place` varchar(200) DEFAULT '',
  `deal` varchar(200) DEFAULT '',
  `useful_life` int(11) DEFAULT '0',
  `email` varchar(255) DEFAULT '',
  `record_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS met_history_plist;
CREATE TABLE `met_history_plist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hid` int(11) DEFAULT '0',
  `listid` int(11) DEFAULT '0',
  `paraid` int(11) DEFAULT '0',
  `info` text,
  `lang` varchar(50) DEFAULT '',
  `imgname` varchar(255) DEFAULT '',
  `module` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS met_history_relation;
CREATE TABLE `met_history_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hid` int(11) DEFAULT '0',
  `aid` int(11) DEFAULT NULL COMMENT '内容id',
  `module` int(11) DEFAULT NULL,
  `relation_id` int(11) DEFAULT NULL COMMENT '关联内容id',
  `relation_module` int(11) DEFAULT NULL,
  `lang` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS met_ifcolumn;
CREATE TABLE `met_ifcolumn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `no` int(11) DEFAULT '0',
  `name` varchar(50) DEFAULT '',
  `appname` varchar(50) DEFAULT '' COMMENT '应用名称',
  `addfile` tinyint(1) DEFAULT '1',
  `memberleft` tinyint(1) DEFAULT '0',
  `uniqueness` tinyint(1) DEFAULT '0',
  `fixed_name` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS met_ifcolumn_addfile;
CREATE TABLE `met_ifcolumn_addfile` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `no` int(11) DEFAULT '0',
  `filename` varchar(255) DEFAULT '',
  `m_name` varchar(255) DEFAULT '',
  `m_module` varchar(255) DEFAULT '',
  `m_class` varchar(255) DEFAULT '',
  `m_action` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS met_ifmember_left;
CREATE TABLE `met_ifmember_left` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `no` int(11) DEFAULT '0',
  `columnid` int(11) DEFAULT '0',
  `title` varchar(50) DEFAULT '',
  `foldername` varchar(255) DEFAULT '',
  `filename` varchar(255) DEFAULT '',
  `target` int(11) DEFAULT '0',
  `own_order` varchar(11) DEFAULT '',
  `effect` int(1) DEFAULT '0',
  `lang` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS met_img;
CREATE TABLE `met_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT '',
  `ctitle` varchar(200) DEFAULT '',
  `keywords` varchar(200) DEFAULT '',
  `description` text,
  `content` longtext,
  `class1` int(11) DEFAULT '0',
  `class2` int(11) DEFAULT '0',
  `class3` int(11) DEFAULT '0',
  `no_order` int(11) DEFAULT '0',
  `wap_ok` int(1) DEFAULT '0',
  `new_ok` int(1) DEFAULT '0',
  `imgurl` varchar(255) DEFAULT '',
  `imgurls` varchar(255) DEFAULT '',
  `displayimg` text,
  `com_ok` int(1) DEFAULT '0',
  `hits` int(11) DEFAULT '0',
  `updatetime` datetime DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `issue` varchar(100) DEFAULT '',
  `access` text,
  `top_ok` int(1) DEFAULT '0',
  `filename` varchar(255) DEFAULT '',
  `lang` varchar(50) DEFAULT '',
  `content1` text,
  `content2` text,
  `content3` text,
  `content4` text,
  `contentinfo` varchar(255) DEFAULT '',
  `contentinfo1` varchar(255) DEFAULT '',
  `contentinfo2` varchar(255) DEFAULT '',
  `contentinfo3` varchar(255) DEFAULT '',
  `contentinfo4` varchar(255) DEFAULT '',
  `recycle` int(11) DEFAULT '0',
  `displaytype` int(11) DEFAULT '1',
  `tag` text,
  `links` varchar(200) DEFAULT '',
  `imgsize` varchar(200) DEFAULT '',
  `text_size` int(11) DEFAULT '0',
  `text_color` varchar(100) DEFAULT '',
  `other_info` text,
  `custom_info` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;

INSERT INTO met_img VALUES('69','智能路由器案例','','','演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据','<p style=\"text-indent: 2em;\"><span style=\"font-size: 14px;\"> 演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p>','130','0','0','0','0','0','../upload/202109/1631527237.jpg','','智能路由器案例*../upload/202109/1631527253.jpg*800x500','0','0','2021-09-13 17:53:35','2021-09-13 15:47:14','admin','0','0','','cn','','','','','','','','','','0','1','','','800x500','0','','','');
INSERT INTO met_img VALUES('73','智能音箱案例','','','演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演','<p style=\"text-indent: 2em;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p>','130','0','0','4','0','0','../upload/202109/1631527660.jpg','','智能音箱案例*../upload/202109/1631527403.jpg*800x500','0','5','2021-09-13 17:56:05','2021-09-13 15:49:47','admin','0','0','','cn','','','','','','','','','','0','1','','','800x500','0','','','');
INSERT INTO met_img VALUES('72','智能音箱案例','','','演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演','<p style=\"text-indent: 2em;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p>','130','0','0','0','0','0','../upload/202109/1631527598.jpg','','智能音箱案例*../upload/202109/1631526980.jpg*800x500','0','0','2021-09-13 17:54:18','2021-09-13 15:49:23','admin','0','0','','cn','','','','','','','','','','0','1','','','800x500','0','','','');
INSERT INTO met_img VALUES('77','智能音箱案例','','','演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演','<p style=\"text-indent: 2em;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p>','130','0','0','0','0','0','../upload/202109/1631527365.jpg','','智能音箱案例*../upload/202109/1631527883.jpg*800x500','0','0','2021-09-13 17:54:45','2021-09-13 16:29:01','admin','0','0','','cn','','','','','','','','','','0','1','','','800x500','0','','','');
INSERT INTO met_img VALUES('71','云摄像头案例','','','演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演','<p style=\"text-indent: 2em;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p>','130','0','0','0','0','0','../upload/202109/1631527670.jpg','','云摄像头案例*../upload/202109/1631527447.jpg*800x500','0','0','2021-09-13 17:54:58','2021-09-13 15:49:04','admin','0','0','','cn','','','','','','','','','','0','1','','','800x500','0','','','');
INSERT INTO met_img VALUES('74','云摄像头案例','','','演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演','<p style=\"text-indent: 2em;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p>','130','0','0','3','0','0','../upload/202109/1631527750.jpg','','云摄像头案例*../upload/202109/1631527264.jpg*800x500','0','3','2021-09-13 17:55:59','2021-09-13 15:49:47','admin','0','0','','cn','','','','','','','','','','0','1','','','800x500','0','','','');
INSERT INTO met_img VALUES('76','智能路由器案例','','','演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据','<p style=\"text-indent: 2em;\"><span style=\"font-size: 14px;\"> 演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p>','130','0','0','1','0','0','../upload/202109/1631527884.jpg','','智能路由器案例*../upload/202109/1631527494.jpg*800x500','0','2','2021-09-13 17:55:49','2021-09-13 15:49:47','admin','0','0','','cn','','','','','','','','','','0','1','','','800x500','0','','','');
INSERT INTO met_img VALUES('78','智能云摄像头案例','','','演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据','<p style=\"text-indent: 2em;\"><span style=\"font-size: 14px;\"> 演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p>','130','0','0','0','0','0','../upload/202109/1631527466.jpg','','智能云摄像头案例*../upload/202109/1631527599.jpg*800x500','0','0','2021-09-13 17:55:30','2021-09-13 16:29:01','admin','0','0','','cn','','','','','','','','','','0','1','','','800x500','0','','','');
INSERT INTO met_img VALUES('79','Smart Router Case study','','','演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据','<p style=\"text-indent: 2em;\"><span style=\"font-size: 14px;\"> 演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p>','157','0','0','0','0','0','../upload/202109/1631527237.jpg','','Smart Router Case study*../upload/202109/1631527253.jpg*800x500','0','0','2021-09-14 11:43:02','2021-09-14 10:39:57','admin','0','0','','en','','','','','','','','','','0','1','','','800x500','0','','','');
INSERT INTO met_img VALUES('80','Smart speaker case','','','演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演','<p style=\"text-indent: 2em;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p>','157','0','0','4','0','0','../upload/202109/1631527660.jpg','','Smart speaker case*../upload/202109/1631527403.jpg*800x500','0','4','2021-09-14 11:44:23','2021-09-14 10:39:57','admin','0','0','','en','','','','','','','','','','0','1','','','800x500','0','','','');
INSERT INTO met_img VALUES('81','Smart speaker case','','','演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演','<p style=\"text-indent: 2em;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p>','157','0','0','0','0','0','../upload/202109/1631527598.jpg','','Smart speaker case*../upload/202109/1631526980.jpg*800x500','0','0','2021-09-14 11:43:16','2021-09-14 10:39:57','admin','0','0','','en','','','','','','','','','','0','1','','','800x500','0','','','');
INSERT INTO met_img VALUES('82','Smart speaker case','','','演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演','<p style=\"text-indent: 2em;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p>','157','0','0','0','0','0','../upload/202109/1631527365.jpg','','Smart speaker case*../upload/202109/1631527883.jpg*800x500','0','0','2021-09-14 11:43:25','2021-09-14 10:39:57','admin','0','0','','en','','','','','','','','','','0','1','','','800x500','0','','','');
INSERT INTO met_img VALUES('83','Cloud Camera Case','','','演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演','<p style=\"text-indent: 2em;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p>','157','0','0','0','0','0','../upload/202109/1631527670.jpg','','Cloud Camera Case*../upload/202109/1631527447.jpg*800x500','0','0','2021-09-14 11:43:36','2021-09-14 10:39:57','admin','0','0','','en','','','','','','','','','','0','1','','','800x500','0','','','');
INSERT INTO met_img VALUES('84','Cloud Camera Case','','','演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演','<p style=\"text-indent: 2em;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p>','157','0','0','3','0','0','../upload/202109/1631527750.jpg','','Cloud Camera Case*../upload/202109/1631527264.jpg*800x500','0','3','2021-09-14 11:44:13','2021-09-14 10:39:57','admin','0','0','','en','','','','','','','','','','0','1','','','800x500','0','','','');
INSERT INTO met_img VALUES('85','Smart Router Case study','','','演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据','<p style=\"text-indent: 2em;\"><span style=\"font-size: 14px;\"> 演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p>','157','0','0','1','0','0','../upload/202109/1631527884.jpg','','Smart Router Case study*../upload/202109/1631527494.jpg*800x500','0','2','2021-09-14 11:44:04','2021-09-14 10:39:57','admin','0','0','','en','','','','','','','','','','0','1','','','800x500','0','','','');
INSERT INTO met_img VALUES('86','Smart cloud camera case','','','演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据','<p style=\"text-indent: 2em;\"><span style=\"font-size: 14px;\"> 演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p>','157','0','0','0','0','0','../upload/202109/1631527466.jpg','','Smart cloud camera case*../upload/202109/1631527599.jpg*800x500','0','0','2021-09-14 11:43:49','2021-09-14 10:39:57','admin','0','0','','en','','','','','','','','','','0','1','','','800x500','0','','','');

DROP TABLE IF EXISTS met_infoprompt;
CREATE TABLE `met_infoprompt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `news_id` int(11) DEFAULT '0',
  `newstitle` varchar(120) DEFAULT '',
  `content` text,
  `url` varchar(200) DEFAULT '',
  `member` varchar(50) DEFAULT '',
  `type` varchar(35) DEFAULT '',
  `time` int(11) DEFAULT '0',
  `see_ok` int(11) DEFAULT '0',
  `lang` varchar(10) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

INSERT INTO met_infoprompt VALUES('1','0','关于网站风险脚本紧急清理处置公告','','https://www.metinfo.cn/news/2876.html','','metinfo','1781677420','0','metinfo');
INSERT INTO met_infoprompt VALUES('2','0','关于发布MetInfo V8.1安全补丁的通知','','https://www.metinfo.cn/news/2875.html','','metinfo','1775553828','0','metinfo');
INSERT INTO met_infoprompt VALUES('3','0','MetInfo V8.1正式发布！','','https://www.metinfo.cn/news/2872.html','','metinfo','1757322256','0','metinfo');
INSERT INTO met_infoprompt VALUES('4','0','性价比超高！米拓建站推出299元省心套餐!','','https://www.metinfo.cn/news/2870.html','','metinfo','1730447975','0','metinfo');
INSERT INTO met_infoprompt VALUES('5','0','MetInfo V8.0正式发布！','','https://www.metinfo.cn/news/2840.html','','metinfo','1727532774','0','metinfo');
INSERT INTO met_infoprompt VALUES('6','0','15周年，MetInfo V7.9 正式发布！','','https://www.metinfo.cn/news/2835.html','','metinfo','1711620219','0','metinfo');
INSERT INTO met_infoprompt VALUES('7','0','产品参数对比插件已上线！','','https://www.metinfo.cn/news/2834.html','','metinfo','1703755997','0','metinfo');
INSERT INTO met_infoprompt VALUES('8','0','14周年，MetInfo V7.8 正式发布！','','https://www.metinfo.cn/news/2831.html','','metinfo','1679991569','0','metinfo');
INSERT INTO met_infoprompt VALUES('9','0','MetInfo 7.7正式发布，着重提升安全性能，请尽快升级','','https://www.metinfo.cn/news/2822.html','','metinfo','1664355171','0','metinfo');
INSERT INTO met_infoprompt VALUES('10','0','双因子登录插件已上线','','https://www.metinfo.cn/news/2823.html','','metinfo','1664345289','0','metinfo');

DROP TABLE IF EXISTS met_job;
CREATE TABLE `met_job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position` varchar(200) DEFAULT '',
  `count` int(11) DEFAULT '0',
  `place` varchar(200) DEFAULT '',
  `deal` varchar(200) DEFAULT '',
  `addtime` date DEFAULT NULL,
  `updatetime` date DEFAULT NULL,
  `useful_life` int(11) DEFAULT '0',
  `content` longtext,
  `access` text,
  `class1` int(11) DEFAULT '0',
  `class2` int(11) DEFAULT '0',
  `class3` int(11) DEFAULT '0',
  `no_order` int(11) DEFAULT '0',
  `wap_ok` int(1) DEFAULT '0',
  `top_ok` int(1) DEFAULT '0',
  `email` varchar(255) DEFAULT '',
  `filename` varchar(255) DEFAULT '',
  `lang` varchar(50) DEFAULT '',
  `displaytype` int(11) DEFAULT '1',
  `text_size` int(11) DEFAULT '0',
  `text_color` varchar(100) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

INSERT INTO met_job VALUES('7','招商经理','1','长沙','8-20K','2021-09-13','2021-09-13','0','<p style=\"white-space: normal;\"><strong><span style=\"font-size: 14px;\">演示数据：</span></strong></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">1、演示数据演示数据演示数据演示数，演示数据演；</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">2、演示数据演示数据演示数据演示数据演示数, 演示数据演示数据演示数据演； </span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">3、演示数据演示数据，演示数据演示数据演；</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">4、演示数据演示数据演示数，演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><strong><span style=\"font-size: 14px;\">演示数据：</span></strong><span style=\"font-size: 14px;\"></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">1、演示数据，演示数据演，演示数据演示数；</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">2、演示数据演示数据演示数；演示数据；</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">3、演示数据演示数据演示数据演示数据演；</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">4、演示数据，演示数据，演示数据演示数据演示数据演示；</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">5、演示数据演示数据演，演示数据演示数、演示数据演示数据演示数。</span></p>','0','131','0','0','0','0','0','Email@email.mt','','cn','1','0','');
INSERT INTO met_job VALUES('8','市场推广','1','长沙','8-15K','2021-09-13','2021-09-13','0','<p style=\"white-space: normal;\"><strong><span style=\"font-size: 14px;\">演示数据：</span></strong></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">1、演示数据演示数据演示数据演示数，演示数据演；</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">2、演示数据演示数据演示数据演示数据演示数, 演示数据演示数据演示数据演； </span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">3、演示数据演示数据，演示数据演示数据演；</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">4、演示数据演示数据演示数，演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><strong><span style=\"font-size: 14px;\">演示数据：</span></strong><span style=\"font-size: 14px;\"></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">1、演示数据，演示数据演，演示数据演示数；</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">2、演示数据演示数据演示数；演示数据；</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">3、演示数据演示数据演示数据演示数据演；</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">4、演示数据，演示数据，演示数据演示数据演示数据演示；</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">5、演示数据演示数据演，演示数据演示数、演示数据演示数据演示数。</span></p>','0','131','0','0','0','0','0','Email@email.mt','','cn','1','0','');
INSERT INTO met_job VALUES('5','销售工程师','2','长沙','5-15k','2021-09-13','2021-09-13','0','<p><strong><span style=\"font-size: 14px;\">演示数据：</span></strong></p><p><span style=\"font-size: 14px;\">1、演示数据演示数据演示数据演示数，演示数据演； </span></p><p><span style=\"font-size: 14px;\">2、演示数据演示数据演示数据演示数据演示数, 演示数据演示数据演示数据演；&nbsp; </span></p><p><span style=\"font-size: 14px;\">3、演示数据演示数据，演示数据演示数据演； </span></p><p><span style=\"font-size: 14px;\">4、演示数据演示数据演示数，演示数据演示数据演示数。</span></p><p><strong><span style=\"font-size: 14px;\">演示数据：</span></strong><span style=\"font-size: 14px;\"> </span></p><p><span style=\"font-size: 14px;\">1、演示数据，演示数据演，演示数据演示数； </span></p><p><span style=\"font-size: 14px;\">2、演示数据演示数据演示数；演示数据； </span></p><p><span style=\"font-size: 14px;\">3、演示数据演示数据演示数据演示数据演；</span></p><p><span style=\"font-size: 14px;\">4、演示数据，演示数据，演示数据演示数据演示数据演示；</span></p><p><span style=\"font-size: 14px;\">5、演示数据演示数据演，演示数据演示数、演示数据演示数据演示数。</span></p>','0','131','0','0','0','0','0','Email@email.mt','','cn','1','0','');
INSERT INTO met_job VALUES('6','web前端','1','长沙','8-15K','2021-09-13','2021-09-13','0','<p style=\"white-space: normal;\"><strong><span style=\"font-size: 14px;\">演示数据：</span></strong></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">1、演示数据演示数据演示数据演示数，演示数据演；</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">2、演示数据演示数据演示数据演示数据演示数, 演示数据演示数据演示数据演； </span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">3、演示数据演示数据，演示数据演示数据演；</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">4、演示数据演示数据演示数，演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><strong><span style=\"font-size: 14px;\">演示数据：</span></strong><span style=\"font-size: 14px;\"></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">1、演示数据，演示数据演，演示数据演示数；</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">2、演示数据演示数据演示数；演示数据；</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">3、演示数据演示数据演示数据演示数据演；</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">4、演示数据，演示数据，演示数据演示数据演示数据演示；</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">5、演示数据演示数据演，演示数据演示数、演示数据演示数据演示数。</span></p>','0','131','0','0','0','0','0','Email@email.mt','','cn','1','0','');
INSERT INTO met_job VALUES('11','Salesman','2','Changsha','5-15k','2021-09-13','2021-09-13','0','<p><strong><span style=\"font-size: 14px;\">演示数据：</span></strong></p><p><span style=\"font-size: 14px;\">1、演示数据演示数据演示数据演示数，演示数据演； </span></p><p><span style=\"font-size: 14px;\">2、演示数据演示数据演示数据演示数据演示数, 演示数据演示数据演示数据演；&nbsp; </span></p><p><span style=\"font-size: 14px;\">3、演示数据演示数据，演示数据演示数据演； </span></p><p><span style=\"font-size: 14px;\">4、演示数据演示数据演示数，演示数据演示数据演示数。</span></p><p><strong><span style=\"font-size: 14px;\">演示数据：</span></strong><span style=\"font-size: 14px;\"> </span></p><p><span style=\"font-size: 14px;\">1、演示数据，演示数据演，演示数据演示数； </span></p><p><span style=\"font-size: 14px;\">2、演示数据演示数据演示数；演示数据； </span></p><p><span style=\"font-size: 14px;\">3、演示数据演示数据演示数据演示数据演；</span></p><p><span style=\"font-size: 14px;\">4、演示数据，演示数据，演示数据演示数据演示数据演示；</span></p><p><span style=\"font-size: 14px;\">5、演示数据演示数据演，演示数据演示数、演示数据演示数据演示数。</span></p>','0','158','0','0','0','0','0','Email@email.mt','','en','1','0','');
INSERT INTO met_job VALUES('9','Investment promotion manager','1','Changsha','8-20K','2021-09-13','2021-09-13','0','<p style=\"white-space: normal;\"><strong><span style=\"font-size: 14px;\">演示数据：</span></strong></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">1、演示数据演示数据演示数据演示数，演示数据演；</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">2、演示数据演示数据演示数据演示数据演示数, 演示数据演示数据演示数据演； </span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">3、演示数据演示数据，演示数据演示数据演；</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">4、演示数据演示数据演示数，演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><strong><span style=\"font-size: 14px;\">演示数据：</span></strong><span style=\"font-size: 14px;\"></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">1、演示数据，演示数据演，演示数据演示数；</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">2、演示数据演示数据演示数；演示数据；</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">3、演示数据演示数据演示数据演示数据演；</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">4、演示数据，演示数据，演示数据演示数据演示数据演示；</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">5、演示数据演示数据演，演示数据演示数、演示数据演示数据演示数。</span></p>','0','158','0','0','0','0','0','Email@email.mt','','en','1','0','');
INSERT INTO met_job VALUES('10','Marketing','1','Changsha','8-15K','2021-09-13','2021-09-13','0','<p style=\"white-space: normal;\"><strong><span style=\"font-size: 14px;\">演示数据：</span></strong></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">1、演示数据演示数据演示数据演示数，演示数据演；</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">2、演示数据演示数据演示数据演示数据演示数, 演示数据演示数据演示数据演； </span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">3、演示数据演示数据，演示数据演示数据演；</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">4、演示数据演示数据演示数，演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><strong><span style=\"font-size: 14px;\">演示数据：</span></strong><span style=\"font-size: 14px;\"></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">1、演示数据，演示数据演，演示数据演示数；</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">2、演示数据演示数据演示数；演示数据；</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">3、演示数据演示数据演示数据演示数据演；</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">4、演示数据，演示数据，演示数据演示数据演示数据演示；</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">5、演示数据演示数据演，演示数据演示数、演示数据演示数据演示数。</span></p>','0','158','0','0','0','0','0','Email@email.mt','','en','1','0','');
INSERT INTO met_job VALUES('12','Front-end Engineer','1','Changsha','8-15K','2021-09-13','2021-09-13','0','<p style=\"white-space: normal;\"><strong><span style=\"font-size: 14px;\">演示数据：</span></strong></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">1、演示数据演示数据演示数据演示数，演示数据演；</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">2、演示数据演示数据演示数据演示数据演示数, 演示数据演示数据演示数据演； </span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">3、演示数据演示数据，演示数据演示数据演；</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">4、演示数据演示数据演示数，演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><strong><span style=\"font-size: 14px;\">演示数据：</span></strong><span style=\"font-size: 14px;\"></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">1、演示数据，演示数据演，演示数据演示数；</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">2、演示数据演示数据演示数；演示数据；</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">3、演示数据演示数据演示数据演示数据演；</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">4、演示数据，演示数据，演示数据演示数据演示数据演示；</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px;\">5、演示数据演示数据演，演示数据演示数、演示数据演示数据演示数。</span></p>','0','158','0','0','0','0','0','Email@email.mt','','en','1','0','');

DROP TABLE IF EXISTS met_label;
CREATE TABLE `met_label` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oldwords` varchar(255) DEFAULT '',
  `newwords` varchar(255) DEFAULT '',
  `newtitle` varchar(255) DEFAULT '',
  `url` varchar(255) DEFAULT '',
  `num` int(11) DEFAULT '99',
  `lang` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO met_label VALUES('1','产品','产品','产品','https://www.mituo.cn/','2','cn');

DROP TABLE IF EXISTS met_lang;
CREATE TABLE `met_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT '',
  `useok` int(1) DEFAULT '0',
  `no_order` int(11) DEFAULT '0',
  `mark` varchar(50) DEFAULT '',
  `synchronous` varchar(50) DEFAULT '',
  `flag` varchar(100) DEFAULT '',
  `link` varchar(255) DEFAULT '',
  `newwindows` int(1) DEFAULT '0',
  `met_webhtm` int(1) DEFAULT '0',
  `met_htmtype` varchar(50) DEFAULT '',
  `met_weburl` varchar(255) DEFAULT '',
  `lang` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO met_lang VALUES('1','简体中文','1','1','cn','cn','cn.gif','','0','0','html','','cn');
INSERT INTO met_lang VALUES('2','English','1','2','en','en','en.gif','','0','0','html','','en');

DROP TABLE IF EXISTS met_lang_admin;
CREATE TABLE `met_lang_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT '' COMMENT '语言名称',
  `useok` int(1) DEFAULT '1' COMMENT '语言是否开启，1开启，0不开启',
  `no_order` int(11) DEFAULT '0' COMMENT '排序',
  `mark` varchar(50) DEFAULT '' COMMENT '语言标识（唯一）',
  `synchronous` varchar(50) DEFAULT '' COMMENT '同步官方语言标识',
  `link` varchar(255) DEFAULT '' COMMENT '语言外部链接',
  `lang` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO met_lang_admin VALUES('1','简体中文','1','1','cn','cn','','cn');
INSERT INTO met_lang_admin VALUES('2','English','1','2','en','en','','en');

DROP TABLE IF EXISTS met_language;
CREATE TABLE `met_language` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT '',
  `value` text,
  `site` tinyint(1) DEFAULT '0',
  `no_order` int(11) DEFAULT '0',
  `array` int(11) DEFAULT '0',
  `app` int(11) DEFAULT '0',
  `lang` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3958 DEFAULT CHARSET=utf8;

INSERT INTO met_language VALUES('1','system','系统参数','0','1','0','0','cn');
INSERT INTO met_language VALUES('2','search','搜索','0','16','1','0','cn');
INSERT INTO met_language VALUES('3','home','网站首页','0','17','1','0','cn');
INSERT INTO met_language VALUES('4','success','操作成功!','0','19','1','0','cn');
INSERT INTO met_language VALUES('5','Title','标题','0','24','1','0','cn');
INSERT INTO met_language VALUES('6','Content','内容','0','25','1','0','cn');
INSERT INTO met_language VALUES('7','Online','在线交流','0','30','1','0','cn');
INSERT INTO met_language VALUES('8','Noinfo','没有了','0','32','1','0','cn');
INSERT INTO met_language VALUES('9','displayimg','展示图片','0','40','1','0','cn');
INSERT INTO met_language VALUES('10','default','默认','0','41','1','0','cn');
INSERT INTO met_language VALUES('11','membercode','验证码错误！','0','1','2','0','cn');
INSERT INTO met_language VALUES('12','memberpassno','密码错误！','0','3','2','0','cn');
INSERT INTO met_language VALUES('13','access','您没有阅读该信息的权限！','0','4','2','0','cn');
INSERT INTO met_language VALUES('14','login','登录','0','5','2','0','cn');
INSERT INTO met_language VALUES('15','register','注册','0','6','2','0','cn');
INSERT INTO met_language VALUES('16','Page','页','0','2','3','0','cn');
INSERT INTO met_language VALUES('17','PagePre','上一页','0','6','3','0','cn');
INSERT INTO met_language VALUES('18','PageNext','下一页','0','7','3','0','cn');
INSERT INTO met_language VALUES('19','PageGo','转至第','0','8','3','0','cn');
INSERT INTO met_language VALUES('20','memberLogin','会员登录','0','2','4','0','cn');
INSERT INTO met_language VALUES('21','memberPassword','请输入密码','0','4','4','0','cn');
INSERT INTO met_language VALUES('22','memberName','会员名','0','6','4','0','cn');
INSERT INTO met_language VALUES('23','memberImgCode','验证码','0','8','4','0','cn');
INSERT INTO met_language VALUES('24','memberTip1','看不清？点击更换验证码','0','9','4','0','cn');
INSERT INTO met_language VALUES('25','memberGo','登录','0','11','4','0','cn');
INSERT INTO met_language VALUES('26','memberRegister','立即注册','0','12','4','0','cn');
INSERT INTO met_language VALUES('27','memberForget','忘记密码？','0','14','4','0','cn');
INSERT INTO met_language VALUES('28','memberIndex3','会员中心','0','17','4','0','cn');
INSERT INTO met_language VALUES('29','memberIndex9','个人信息','0','23','4','0','cn');
INSERT INTO met_language VALUES('30','memberIndex10','退出登录','0','24','4','0','cn');
INSERT INTO met_language VALUES('31','memberbasicUserName','用户名','0','32','4','0','cn');
INSERT INTO met_language VALUES('32','memberbasicCell','手机','0','38','4','0','cn');
INSERT INTO met_language VALUES('33','memberbasicLoginNum','登录次数','0','40','4','0','cn');
INSERT INTO met_language VALUES('34','memberbasicLastIP','最后登录IP','0','42','4','0','cn');
INSERT INTO met_language VALUES('35','memberbasicType','会员类型','0','50','4','0','cn');
INSERT INTO met_language VALUES('36','memberReg','会员注册','0','58','4','0','cn');
INSERT INTO met_language VALUES('37','memberDetail','查看','0','60','4','0','cn');
INSERT INTO met_language VALUES('38','messageeditorReply','管理员回复留言','0','74','4','0','cn');
INSERT INTO met_language VALUES('39','getNotice','会员找回密码','0','83','4','0','cn');
INSERT INTO met_language VALUES('40','NoidJS','没有此用户','0','87','4','0','cn');
INSERT INTO met_language VALUES('41','getTip1','您的密码重置请求已经得到验证。请点击以下链接输入您的新密码：','0','89','4','0','cn');
INSERT INTO met_language VALUES('42','getTip2','取回密码的方法已经通过 Email 发送到您的信箱中。请在 3 天之内到网站修改您的密码。','0','90','4','0','cn');
INSERT INTO met_language VALUES('43','getTip3','您提交的找回密码邮件发送失败！请联系网站管理员！。','0','91','4','0','cn');
INSERT INTO met_language VALUES('44','getTip5','密码找回','0','93','4','0','cn');
INSERT INTO met_language VALUES('45','getOK','发送成功','0','97','4','0','cn');
INSERT INTO met_language VALUES('46','getFail','发送失败','0','98','4','0','cn');
INSERT INTO met_language VALUES('47','membernodo','该用户尚未激活，请即时与管理员联系!','0','99','4','0','cn');
INSERT INTO met_language VALUES('48','hello','您好！','0','100','4','0','cn');
INSERT INTO met_language VALUES('49','fileOK','文件上传成功','0','1','5','0','cn');
INSERT INTO met_language VALUES('50','js1','操作失败！','0','1','6','0','cn');
INSERT INTO met_language VALUES('51','js2','管理员身份登录！','0','2','6','0','cn');
INSERT INTO met_language VALUES('52','js4','无法激活此用户,请与管理员联系！','0','4','6','0','cn');
INSERT INTO met_language VALUES('53','js5','已成功激活,请登录！','0','5','6','0','cn');
INSERT INTO met_language VALUES('54','js6','用户名输入有误!','0','6','6','0','cn');
INSERT INTO met_language VALUES('55','js7','用户名不能小于3位','0','7','6','0','cn');
INSERT INTO met_language VALUES('56','js10','两次密码输入不一致','0','10','6','0','cn');
INSERT INTO met_language VALUES('57','js14','请输入验证码！','0','14','6','0','cn');
INSERT INTO met_language VALUES('58','js15','此用户名已经被使用','0','15','6','0','cn');
INSERT INTO met_language VALUES('59','js16','会员激活','0','16','6','0','cn');
INSERT INTO met_language VALUES('60','js18','请您点击','0','18','6','0','cn');
INSERT INTO met_language VALUES('61','js23','文件格式不允许上传。','0','23','6','0','cn');
INSERT INTO met_language VALUES('62','js25','注册成功！','0','25','6','0','cn');
INSERT INTO met_language VALUES('63','Download','点击下载','0','8','7','0','cn');
INSERT INTO met_language VALUES('64','Submit','提交信息','0','16','7','0','cn');
INSERT INTO met_language VALUES('65','TextLink','文字链接','0','34','7','0','cn');
INSERT INTO met_language VALUES('66','PictureLink','图片链接','0','35','7','0','cn');
INSERT INTO met_language VALUES('67','Contact','联系方式','0','36','7','0','cn');
INSERT INTO met_language VALUES('68','ApplyLink','申请友情链接','0','37','7','0','cn');
INSERT INTO met_language VALUES('69','SubmitInfo','提交留言','0','39','7','0','cn');
INSERT INTO met_language VALUES('70','Reply','管理员回复','0','42','7','0','cn');
INSERT INTO met_language VALUES('71','Feedback1','请不要在','0','49','7','0','cn');
INSERT INTO met_language VALUES('72','Feedback2','秒内重复提交信息，谢谢合作！','0','50','7','0','cn');
INSERT INTO met_language VALUES('73','Feedback3','提交信息中不能包含','0','51','7','0','cn');
INSERT INTO met_language VALUES('74','Feedback5','反馈已经被关闭','0','52','7','0','cn');
INSERT INTO met_language VALUES('75','AddTime','提交时间','0','55','7','0','cn');
INSERT INTO met_language VALUES('76','SourcePage','来源页面','0','56','7','0','cn');
INSERT INTO met_language VALUES('77','Feedback4','反馈信息已成功提交，谢谢！','0','57','7','0','cn');
INSERT INTO met_language VALUES('78','Choice','请选择','0','58','1','0','cn');
INSERT INTO met_language VALUES('79','Empty','不能为空','0','59','7','0','cn');
INSERT INTO met_language VALUES('80','MessageInfo1','在线留言','0','63','7','0','cn');
INSERT INTO met_language VALUES('81','MessageInfo2','您的留言已成功提交，谢谢！','0','64','7','0','cn');
INSERT INTO met_language VALUES('82','MessageInfo5','该留言功能已经被关闭','0','67','7','0','cn');
INSERT INTO met_language VALUES('83','SearchInfo1','请输入搜索关键词！','0','71','7','0','cn');
INSERT INTO met_language VALUES('84','SearchInfo2','全站搜索','0','72','7','0','cn');
INSERT INTO met_language VALUES('85','SearchInfo3','没有含有','0','73','7','0','cn');
INSERT INTO met_language VALUES('86','SearchInfo4','的信息内容','0','74','7','0','cn');
INSERT INTO met_language VALUES('87','Job1','不限','0','75','7','0','cn');
INSERT INTO met_language VALUES('88','cvtitle','在线应聘','0','78','7','0','cn');
INSERT INTO met_language VALUES('89','cv','查看简历','0','79','7','0','cn');
INSERT INTO met_language VALUES('90','wap','手机版','0','87','7','0','cn');
INSERT INTO met_language VALUES('91','fliptext1','查看更多','0','48','1','0','cn');
INSERT INTO met_language VALUES('92','fliptext2','加载中...','0','49','1','0','cn');
INSERT INTO met_language VALUES('93','downloadtext1','下载','0','50','1','0','cn');
INSERT INTO met_language VALUES('94','tagweb','标签','0','66','1','0','cn');
INSERT INTO met_language VALUES('95','formerror1','请填写此字段。','0','0','1','0','cn');
INSERT INTO met_language VALUES('96','formerror2','请从这些选项中选择一个。','0','0','1','0','cn');
INSERT INTO met_language VALUES('97','formerror3','请输入正确的手机号码。','0','0','1','0','cn');
INSERT INTO met_language VALUES('98','formerror4','请输入正确的Email地址。','0','0','1','0','cn');
INSERT INTO met_language VALUES('99','formerror5','两次输入的密码不一致，请重新输入。','0','0','1','0','cn');
INSERT INTO met_language VALUES('100','formerror6','请输入至少&metinfo&个字符。','0','0','1','0','cn');
INSERT INTO met_language VALUES('101','formerror7','输入不能超过&metinfo&个字符。','0','0','1','0','cn');
INSERT INTO met_language VALUES('102','formerror8','输入的字符数必须在&metinfo&之间。','0','0','1','0','cn');
INSERT INTO met_language VALUES('103','read','阅读','0','0','1','0','cn');
INSERT INTO met_language VALUES('104','js46','不能重复','0','0','1','0','cn');
INSERT INTO met_language VALUES('105','emailchecktips1','感谢您的注册！激活链接已经发送到您的邮箱','0','103','4','0','cn');
INSERT INTO met_language VALUES('106','emailchecktips2','点击邮件里的链接即可激活账户','0','104','4','0','cn');
INSERT INTO met_language VALUES('107','emailchecktips3','还没收到确认邮件？','0','105','4','0','cn');
INSERT INTO met_language VALUES('108','emailchecktips4','尝试到广告邮件、垃圾邮件目录里找找看','0','106','4','0','cn');
INSERT INTO met_language VALUES('109','emailchecktips5','再次发送确认邮件','0','107','4','0','cn');
INSERT INTO met_language VALUES('110','accsafe','账号安全','0','108','4','0','cn');
INSERT INTO met_language VALUES('111','resend','重发','0','109','4','0','cn');
INSERT INTO met_language VALUES('112','getmemberImgCode','获取验证码','0','110','4','0','cn');
INSERT INTO met_language VALUES('113','password','密码','0','113','4','0','cn');
INSERT INTO met_language VALUES('114','userhave','用户名已存在','0','114','4','0','cn');
INSERT INTO met_language VALUES('115','emailhave','邮箱已被注册','0','115','4','0','cn');
INSERT INTO met_language VALUES('116','memberemail','邮箱','0','116','4','0','cn');
INSERT INTO met_language VALUES('117','memberMoreInfo','更多资料','0','117','4','0','cn');
INSERT INTO met_language VALUES('118','select','选择','0','118','4','0','cn');
INSERT INTO met_language VALUES('119','acchave','已有账号？','0','119','4','0','cn');
INSERT INTO met_language VALUES('120','accpassword','帐号密码','0','120','4','0','cn');
INSERT INTO met_language VALUES('121','accsaftips1','用于保护帐号信息和登录安全','0','121','4','0','cn');
INSERT INTO met_language VALUES('122','modify','修改','0','122','4','0','cn');
INSERT INTO met_language VALUES('123','accemail','邮箱绑定','0','123','4','0','cn');
INSERT INTO met_language VALUES('124','accsaftips2','邮箱绑定可以用于登录帐号，重置密码或其他安全验证','0','124','4','0','cn');
INSERT INTO met_language VALUES('125','acctel','手机绑定','0','125','4','0','cn');
INSERT INTO met_language VALUES('126','accsaftips3','手机绑定可以用于登录帐号，重置密码或其他安全验证','0','126','4','0','cn');
INSERT INTO met_language VALUES('127','modifypassword','密码修改','0','127','4','0','cn');
INSERT INTO met_language VALUES('128','oldpassword','原密码','0','128','4','0','cn');
INSERT INTO met_language VALUES('129','newpassword','新密码','0','129','4','0','cn');
INSERT INTO met_language VALUES('130','confirm','确定','0','130','1','1','cn');
INSERT INTO met_language VALUES('131','cancel','取消','0','131','1','1','cn');
INSERT INTO met_language VALUES('132','emailaddress','邮箱地址','0','132','4','0','cn');
INSERT INTO met_language VALUES('133','telnum','手机号码','0','134','4','0','cn');
INSERT INTO met_language VALUES('134','teluse','手机号码已被绑定','0','135','4','0','cn');
INSERT INTO met_language VALUES('135','telok','请输入正确的手机号码','0','136','4','0','cn');
INSERT INTO met_language VALUES('136','modifyacctel','修改手机绑定','0','137','4','0','cn');
INSERT INTO met_language VALUES('137','modifyinfo','保存资料','0','138','4','0','cn');
INSERT INTO met_language VALUES('138','emailnow','当前邮箱：','0','139','4','0','cn');
INSERT INTO met_language VALUES('139','newemail','新邮箱','0','140','4','0','cn');
INSERT INTO met_language VALUES('140','modifyaccemail','修改绑定邮箱','0','142','4','0','cn');
INSERT INTO met_language VALUES('141','renewpassword','重复密码','0','144','4','0','cn');
INSERT INTO met_language VALUES('142','inputcode','请输入验证码','0','145','4','0','cn');
INSERT INTO met_language VALUES('143','next','下一步','0','146','4','0','cn');
INSERT INTO met_language VALUES('144','logintips','用户名/邮箱/手机','0','147','4','0','cn');
INSERT INTO met_language VALUES('145','otherlogin','其它方式登录','0','148','4','0','cn');
INSERT INTO met_language VALUES('146','logintips1','没有账号？现在去注册','0','149','4','0','cn');
INSERT INTO met_language VALUES('147','rememberImgCode','重发验证码','0','150','4','0','cn');
INSERT INTO met_language VALUES('148','relogin','返回登录','0','151','4','0','cn');
INSERT INTO met_language VALUES('149','getpasswordtips','邮箱/手机','0','152','4','0','cn');
INSERT INTO met_language VALUES('150','regclose','注册功能已关闭','0','153','4','0','cn');
INSERT INTO met_language VALUES('151','regfail','注册失败','0','154','4','0','cn');
INSERT INTO met_language VALUES('152','codetimeout','验证码已超时','0','155','4','0','cn');
INSERT INTO met_language VALUES('153','telcheckfail','手机号码与短信验证号码不一致','0','156','4','0','cn');
INSERT INTO met_language VALUES('154','regsuc','注册成功！','0','157','4','0','cn');
INSERT INTO met_language VALUES('155','activesuc','激活成功，请登录！','0','158','4','0','cn');
INSERT INTO met_language VALUES('156','emailvildtips1','验证信息错误','0','159','4','0','cn');
INSERT INTO met_language VALUES('157','emailvildtips2','验证信息错误或已超时','0','160','4','0','cn');
INSERT INTO met_language VALUES('158','telreg','手机号已被注册','0','161','4','0','cn');
INSERT INTO met_language VALUES('159','Sendfrequent','发送过于频繁，请稍后再试','0','162','4','0','cn');
INSERT INTO met_language VALUES('160','emailsuc','邮件发送成功！','0','163','4','0','cn');
INSERT INTO met_language VALUES('161','emailfail','邮件发送失败，请确认邮箱是否正确或联系网站管理人员解决。','0','164','4','0','cn');
INSERT INTO met_language VALUES('162','modifysuc','修改成功','0','165','4','0','cn');
INSERT INTO met_language VALUES('163','binding','绑定','0','166','4','0','cn');
INSERT INTO met_language VALUES('164','notbound','未绑定','0','167','4','0','cn');
INSERT INTO met_language VALUES('165','accnotmodify','帐号无法修改','0','168','4','0','cn');
INSERT INTO met_language VALUES('166','emailsuclink','邮件发送成功！请点击邮件里的验证链接完成操作！','0','169','4','0','cn');
INSERT INTO met_language VALUES('167','bindingok','绑定成功','0','170','4','0','cn');
INSERT INTO met_language VALUES('168','opfail','操作失败','0','171','4','0','cn');
INSERT INTO met_language VALUES('169','modifypasswordsuc','密码修改成功！','0','172','4','0','cn');
INSERT INTO met_language VALUES('170','lodpasswordfail','原密码错误','0','173','4','0','cn');
INSERT INTO met_language VALUES('171','membererror1','用户名或密码错误','0','174','4','0','cn');
INSERT INTO met_language VALUES('172','membererror2','请开启session！','0','175','4','0','cn');
INSERT INTO met_language VALUES('173','membererror3','授权失败','0','176','4','0','cn');
INSERT INTO met_language VALUES('174','membererror4','未知错误','0','177','4','0','cn');
INSERT INTO met_language VALUES('175','membererror6','账号未激活，请联系管理员','0','174','4','0','cn');
INSERT INTO met_language VALUES('176','emailsucpass','密码找回邮件已经发送至您的邮箱，点击邮件里的链接即可重设密码。','0','178','4','0','cn');
INSERT INTO met_language VALUES('177','emailvildtips3','请输入正确的邮箱或手机号码','0','179','4','0','cn');
INSERT INTO met_language VALUES('178','membererror5','发送失败！错误码：','0','180','4','0','cn');
INSERT INTO met_language VALUES('179','noempty','此项不能为空','0','181','4','0','cn');
INSERT INTO met_language VALUES('180','usernamecheck','用户名必须在2-30个字符之间','0','182','4','0','cn');
INSERT INTO met_language VALUES('181','passwordcheck','密码必须在6-30个字符之间','0','183','4','0','cn');
INSERT INTO met_language VALUES('182','passwordsame','两次密码输入不一致','0','184','4','0','cn');
INSERT INTO met_language VALUES('183','emailcheck','请输入正确的Email地址','0','184','4','0','cn');
INSERT INTO met_language VALUES('184','Previous_news','上一篇','0','9','3','0','cn');
INSERT INTO met_language VALUES('185','Next_news','下一篇','0','10','3','0','cn');
INSERT INTO met_language VALUES('186','close','关闭','0','0','0','0','cn');
INSERT INTO met_language VALUES('187','browserupdatetips','你正在使用一个过时的浏览器。请升级你的浏览器，以提高您的体验。','0','0','0','0','cn');
INSERT INTO met_language VALUES('188','newFeedback','收到了新的反馈','0','0','0','0','cn');
INSERT INTO met_language VALUES('189','opfailed','操作失败','0','0','1','0','cn');
INSERT INTO met_language VALUES('190','jobPrompt','收到了新的简历','0','0','0','0','cn');
INSERT INTO met_language VALUES('191','reMessage1','您的网站','0','0','0','0','cn');
INSERT INTO met_language VALUES('192','reMessage2','，请尽快登录网站后台查看','0','0','0','0','cn');
INSERT INTO met_language VALUES('193','messagePrompt','收到了新的留言','0','0','0','0','cn');
INSERT INTO met_language VALUES('194','formaterror','格式错误','0','0','0','0','cn');
INSERT INTO met_language VALUES('195','listcom','推荐','0','0','0','0','cn');
INSERT INTO met_language VALUES('196','listnew','最新','0','0','0','0','cn');
INSERT INTO met_language VALUES('197','listhot','热门','0','0','0','0','cn');
INSERT INTO met_language VALUES('198','weball','全部','0','0','0','0','cn');
INSERT INTO met_language VALUES('199','columnall','全部栏目','0','0','0','0','cn');
INSERT INTO met_language VALUES('200','accsaftips4','绑定用户证实身份信息','0','9','2','0','cn');
INSERT INTO met_language VALUES('201','rnvalidate','实名认证','0','9','2','0','cn');
INSERT INTO met_language VALUES('202','notauthen','未认证','0','9','2','0','cn');
INSERT INTO met_language VALUES('203','authen','已认证','0','9','1','0','cn');
INSERT INTO met_language VALUES('204','realname','真实姓名','0','9','2','0','cn');
INSERT INTO met_language VALUES('205','idcode','身份证号码','0','9','2','0','cn');
INSERT INTO met_language VALUES('206','idvalidok','实名认证成功','0','9','2','0','cn');
INSERT INTO met_language VALUES('207','idvalidfailed','实名认证失败','0','9','2','0','cn');
INSERT INTO met_language VALUES('208','systips1','您没有权限访问这个内容！请登录后访问！','0','0','0','0','cn');
INSERT INTO met_language VALUES('209','systips2','您所在用户组没有权限访问这个内容！','0','0','0','0','cn');
INSERT INTO met_language VALUES('210','usercheckok','验证成功！','0','0','1','0','cn');
INSERT INTO met_language VALUES('211','usereadinfo','阅读权限值必需大于0','0','0','0','0','cn');
INSERT INTO met_language VALUES('212','userselectname','选项卡','0','0','0','0','cn');
INSERT INTO met_language VALUES('213','userwenxinclose','微信登录功能已关闭','0','0','0','0','cn');
INSERT INTO met_language VALUES('214','userwenboclose','微博登录功能已关闭','0','0','0','0','cn');
INSERT INTO met_language VALUES('215','userqqclose','QQ登录功能已关闭','0','0','0','0','cn');
INSERT INTO met_language VALUES('216','userbuy','购买','0','0','0','0','cn');
INSERT INTO met_language VALUES('217','userbuylist','订单','0','0','0','0','cn');
INSERT INTO met_language VALUES('218','usesendcode','验证码为','0','0','0','0','cn');
INSERT INTO met_language VALUES('219','usesendcodeinfo','请及时输入验证','0','0','0','0','cn');
INSERT INTO met_language VALUES('220','feedbackinquiry','在线询价','0','0','0','0','cn');
INSERT INTO met_language VALUES('221','templatesusererror','当前语言模板未配置或模板文件不存在','0','0','0','0','cn');
INSERT INTO met_language VALUES('222','phonecode','获取手机验证码','0','0','0','0','cn');
INSERT INTO met_language VALUES('223','phonecodeerror','手机验证码错误','0','0','0','0','cn');
INSERT INTO met_language VALUES('224','memberbuytitle','付费升级会员组','0','0','0','0','cn');
INSERT INTO met_language VALUES('225','img_px_tips','图片尺寸超出系统限制(图片宽高不超过2600px)','0','0','1','0','cn');
INSERT INTO met_language VALUES('226','member_cv','简历','0','0','1','0','cn');
INSERT INTO met_language VALUES('227','please_login','请先登录！','0','0','0','0','cn');
INSERT INTO met_language VALUES('228','user_agreement','用户协议','0','0','0','0','cn');
INSERT INTO met_language VALUES('229','user_agreement_tips1','我已认真阅读','0','0','0','0','cn');
INSERT INTO met_language VALUES('230','user_agreement_tips2','并同意注册','0','0','0','0','cn');
INSERT INTO met_language VALUES('231','user_agreement_tips3','请阅读并勾选同意','0','0','0','0','cn');
INSERT INTO met_language VALUES('232','avatar','头像','0','0','0','0','cn');
INSERT INTO met_language VALUES('233','tag','TAG标签','0','0','0','0','cn');
INSERT INTO met_language VALUES('234','columnSearchInfo','请输入你感兴趣的关键词','0','0','0','0','cn');
INSERT INTO met_language VALUES('235','advancedSearchInfo','请输入你感兴趣的关键词','0','0','0','0','cn');
INSERT INTO met_language VALUES('236','notemptips','当前语言没有设置网站模板，请到“风格-网站模板”中选择1套模板','0','0','0','0','cn');
INSERT INTO met_language VALUES('237','AddDate','发布时间','0','0','0','0','cn');
INSERT INTO met_language VALUES('238','listsales','销量','0','0','0','0','cn');
INSERT INTO met_language VALUES('239','jsok','操作成功','0','0','1','0','cn');
INSERT INTO met_language VALUES('240','jslang3','没有选中的记录','0','0','1','0','cn');
INSERT INTO met_language VALUES('241','delete_information','您确定要删除该信息吗？删除之后无法再恢复。','0','0','1','0','cn');
INSERT INTO met_language VALUES('242','js49','撤销。','0','0','1','0','cn');
INSERT INTO met_language VALUES('243','weixinunbind','你确定是否要解绑微信？','0','0','1','0','cn');
INSERT INTO met_language VALUES('244','bindweixin','微信绑定','0','0','1','0','cn');
INSERT INTO met_language VALUES('245','accsaftips5','微信绑定可以用于登录帐号，消息通知等功能','0','0','1','0','cn');
INSERT INTO met_language VALUES('246','bound','已绑定','0','0','1','0','cn');
INSERT INTO met_language VALUES('247','unbind','解绑','0','0','1','0','cn');
INSERT INTO met_language VALUES('248','weixin_login_error','当前语言不可使用微信登录','0','0','1','0','cn');
INSERT INTO met_language VALUES('249','login_ok','登录成功','0','0','1','0','cn');
INSERT INTO met_language VALUES('250','new_registe_email_content','你的网站 {webname} 收到新用户：{username} 的注册请求，请登录网站后台查看。','0','0','0','0','cn');
INSERT INTO met_language VALUES('251','new_registe_sms_content','你的网站 {webname} 收到新用户：{username} 的注册请求，请登录网站后台查看。','0','0','0','0','cn');
INSERT INTO met_language VALUES('252','new_regist_notice','网站新增会员通知','0','0','0','0','cn');
INSERT INTO met_language VALUES('253','page_num_title','第{page_num}页','0','0','0','0','cn');
INSERT INTO met_language VALUES('254','select_file','选择文件','0','0','0','0','cn');
INSERT INTO met_language VALUES('255','drag_the_file_here','拖拽文件到这里…','0','0','0','0','cn');
INSERT INTO met_language VALUES('256','username_tips1','仅支持大小写字母、数字、下划线 ,长度大于3小于30','0','0','0','0','cn');
INSERT INTO met_language VALUES('257','no_spaces','不能有空格','0','0','0','0','cn');
INSERT INTO met_language VALUES('258','system','System parameters','0','1','0','0','en');
INSERT INTO met_language VALUES('259','search','search for','0','16','1','0','en');
INSERT INTO met_language VALUES('260','home','Home page','0','17','1','0','en');
INSERT INTO met_language VALUES('261','success','Successful operation!','0','19','1','0','en');
INSERT INTO met_language VALUES('262','Title','title','0','24','1','0','en');
INSERT INTO met_language VALUES('263','Content','content','0','25','1','0','en');
INSERT INTO met_language VALUES('264','Online','online chating','0','30','1','0','en');
INSERT INTO met_language VALUES('265','Noinfo','No more','0','32','1','0','en');
INSERT INTO met_language VALUES('266','displayimg','Show pictures','0','40','1','0','en');
INSERT INTO met_language VALUES('267','default','default','0','41','1','0','en');
INSERT INTO met_language VALUES('268','membercode','Verification code error!','0','1','2','0','en');
INSERT INTO met_language VALUES('269','memberpassno','wrong password!','0','3','2','0','en');
INSERT INTO met_language VALUES('270','access','You do not have permission to read this information!','0','4','2','0','en');
INSERT INTO met_language VALUES('271','login','log in','0','5','2','0','en');
INSERT INTO met_language VALUES('272','register','registered','0','6','2','0','en');
INSERT INTO met_language VALUES('273','Page','page','0','2','3','0','en');
INSERT INTO met_language VALUES('274','PagePre','Previous page','0','6','3','0','en');
INSERT INTO met_language VALUES('275','PageNext','Next page','0','7','3','0','en');
INSERT INTO met_language VALUES('276','PageGo','Go to No.','0','8','3','0','en');
INSERT INTO met_language VALUES('277','memberLogin','Member Login','0','2','4','0','en');
INSERT INTO met_language VALUES('278','memberPassword','Please enter the password','0','4','4','0','en');
INSERT INTO met_language VALUES('279','memberName','Member name','0','6','4','0','en');
INSERT INTO met_language VALUES('280','memberImgCode','Verification code','0','8','4','0','en');
INSERT INTO met_language VALUES('281','memberTip1','Can not see? Click to change verification code','0','9','4','0','en');
INSERT INTO met_language VALUES('282','memberGo','log in','0','11','4','0','en');
INSERT INTO met_language VALUES('283','memberRegister','Sign up now','0','12','4','0','en');
INSERT INTO met_language VALUES('284','memberForget','forget password?','0','14','4','0','en');
INSERT INTO met_language VALUES('285','memberIndex3','Member Centre','0','17','4','0','en');
INSERT INTO met_language VALUES('286','memberIndex9','Personal information','0','23','4','0','en');
INSERT INTO met_language VALUES('287','memberIndex10','Logout','0','23','4','0','en');
INSERT INTO met_language VALUES('288','memberbasicUserName','username','0','32','4','0','en');
INSERT INTO met_language VALUES('289','memberbasicCell','Phone','0','38','4','0','en');
INSERT INTO met_language VALUES('290','memberbasicLoginNum','Login times','0','40','4','0','en');
INSERT INTO met_language VALUES('291','memberbasicLastIP','Finally login IP','0','42','4','0','en');
INSERT INTO met_language VALUES('292','memberbasicType','Type of membership','0','50','4','0','en');
INSERT INTO met_language VALUES('293','memberReg','Sign Up','0','58','4','0','en');
INSERT INTO met_language VALUES('294','memberDetail','View','0','60','4','0','en');
INSERT INTO met_language VALUES('295','messageeditorReply','Administrator reply message','0','74','4','0','en');
INSERT INTO met_language VALUES('296','getNotice','Member retrieve password','0','83','4','0','en');
INSERT INTO met_language VALUES('297','NoidJS','Without this user','0','87','4','0','en');
INSERT INTO met_language VALUES('298','getTip1','Your password reset request has been verified. Please click the following link to enter your new password:','0','89','4','0','en');
INSERT INTO met_language VALUES('299','getTip2','The method of retrieving the password has been sent to your mailbox by email. Please change your password to the website within 3 days.','0','90','4','0','en');
INSERT INTO met_language VALUES('300','getTip3','Your submitted password recovery email failed to send! Please contact the webmaster! .','0','91','4','0','en');
INSERT INTO met_language VALUES('301','getTip5','recover password','0','93','4','0','en');
INSERT INTO met_language VALUES('302','getOK','Sent successfully','0','97','4','0','en');
INSERT INTO met_language VALUES('303','getFail','Failed to send','0','98','4','0','en');
INSERT INTO met_language VALUES('304','membernodo','The user has not activated yet, please contact the administrator immediately!','0','99','4','0','en');
INSERT INTO met_language VALUES('305','hello','Hello!','0','100','4','0','en');
INSERT INTO met_language VALUES('306','fileOK','File upload is successful','0','1','5','0','en');
INSERT INTO met_language VALUES('307','js1','operation failed!','0','1','6','0','en');
INSERT INTO met_language VALUES('308','js2','Administrator login!','0','2','6','0','en');
INSERT INTO met_language VALUES('309','js4','Can not activate this user, please contact the administrator!','0','4','6','0','en');
INSERT INTO met_language VALUES('310','js5','Has been activated, please login!','0','5','6','0','en');
INSERT INTO met_language VALUES('311','js6','user name input error!','0','6','6','0','en');
INSERT INTO met_language VALUES('312','js7','User name can not be less than 3 digits','0','7','6','0','en');
INSERT INTO met_language VALUES('313','js10','The password input is inconsistent twice','0','10','6','0','en');
INSERT INTO met_language VALUES('314','js14','please enter verification code!','0','14','6','0','en');
INSERT INTO met_language VALUES('315','js15','This username has been used','0','15','6','0','en');
INSERT INTO met_language VALUES('316','js16','Member activation','0','16','6','0','en');
INSERT INTO met_language VALUES('317','js18','Please click','0','18','6','0','en');
INSERT INTO met_language VALUES('318','js23','File format does not allow uploading.','0','23','6','0','en');
INSERT INTO met_language VALUES('319','js25','Registration is successful, please click the verification link in the mailbox to activate the account!!','0','25','6','0','en');
INSERT INTO met_language VALUES('320','Download','click to download','0','8','7','0','en');
INSERT INTO met_language VALUES('321','Submit','Submit Information','0','16','7','0','en');
INSERT INTO met_language VALUES('322','TextLink','Text link','0','34','7','0','en');
INSERT INTO met_language VALUES('323','PictureLink','image link','0','35','7','0','en');
INSERT INTO met_language VALUES('324','Contact','Contact information','0','36','7','0','en');
INSERT INTO met_language VALUES('325','ApplyLink','Apply for a friendship link','0','37','7','0','en');
INSERT INTO met_language VALUES('326','SubmitInfo','Submit Message','0','39','7','0','en');
INSERT INTO met_language VALUES('327','Reply','Administrator reply','0','42','7','0','en');
INSERT INTO met_language VALUES('328','Feedback1','Please do not be there','0','49','7','0','en');
INSERT INTO met_language VALUES('329','Feedback2','Seconds to submit information, thank you for your cooperation!','0','50','7','0','en');
INSERT INTO met_language VALUES('330','Feedback3','Feedback can not be included','0','51','7','0','en');
INSERT INTO met_language VALUES('331','Feedback5','Feedback has been closed','0','52','7','0','en');
INSERT INTO met_language VALUES('332','AddTime','Submit time','0','55','7','0','en');
INSERT INTO met_language VALUES('333','SourcePage','Source page','0','56','7','0','en');
INSERT INTO met_language VALUES('334','Feedback4','Feedback has been submitted, thank you!','0','57','7','0','en');
INSERT INTO met_language VALUES('335','Choice','please choose','0','58','1','0','en');
INSERT INTO met_language VALUES('336','Empty','Can not be empty','0','59','7','0','en');
INSERT INTO met_language VALUES('337','MessageInfo1','Online message','0','63','7','0','en');
INSERT INTO met_language VALUES('338','MessageInfo2','Your message has been successfully submitted, thank you!','0','64','7','0','en');
INSERT INTO met_language VALUES('339','MessageInfo5','Message has been closed','0','67','7','0','en');
INSERT INTO met_language VALUES('340','SearchInfo1','Enter search keywords!','0','71','7','0','en');
INSERT INTO met_language VALUES('341','SearchInfo2','Site Search','0','72','7','0','en');
INSERT INTO met_language VALUES('342','SearchInfo3','Not included','0','73','7','0','en');
INSERT INTO met_language VALUES('343','SearchInfo4','Information content','0','74','7','0','en');
INSERT INTO met_language VALUES('344','Job1','Not limited to','0','75','7','0','en');
INSERT INTO met_language VALUES('345','cvtitle','apply online','0','78','7','0','en');
INSERT INTO met_language VALUES('346','cv','View your resume','0','79','7','0','en');
INSERT INTO met_language VALUES('347','wap','Mobile version','0','87','7','0','en');
INSERT INTO met_language VALUES('348','fliptext1','see more','0','48','1','0','en');
INSERT INTO met_language VALUES('349','fliptext2','Loading...','0','49','1','0','en');
INSERT INTO met_language VALUES('350','downloadtext1','download','0','50','1','0','en');
INSERT INTO met_language VALUES('351','tagweb','label','0','66','1','0','en');
INSERT INTO met_language VALUES('352','formerror1','Please fill in this field.','0','0','1','0','en');
INSERT INTO met_language VALUES('353','formerror2','Please choose one of these options.','0','0','1','0','en');
INSERT INTO met_language VALUES('354','formerror3','Please enter the correct phone number.','0','0','1','0','en');
INSERT INTO met_language VALUES('355','formerror4','Please enter the correct email address.','0','0','1','0','en');
INSERT INTO met_language VALUES('356','formerror5','The password entered twice is different. Please re-enter it.','0','0','1','0','en');
INSERT INTO met_language VALUES('357','formerror6','Please enter at least & metinfo & characters.','0','0','1','0','en');
INSERT INTO met_language VALUES('358','formerror7','Input can not exceed & metinfo & characters.','0','0','1','0','en');
INSERT INTO met_language VALUES('359','formerror8','The number of characters entered must be between & metinfo &.','0','0','1','0','en');
INSERT INTO met_language VALUES('360','read','read','0','0','1','0','en');
INSERT INTO met_language VALUES('361','js46','Can not repeat','0','0','1','0','en');
INSERT INTO met_language VALUES('362','emailchecktips1','Thank you for your registration! The activation link has been sent to your email','0','103','4','0','en');
INSERT INTO met_language VALUES('363','emailchecktips2','Click the link in the email to activate the account','0','104','4','0','en');
INSERT INTO met_language VALUES('364','emailchecktips3','Have not received confirmation email?','0','105','4','0','en');
INSERT INTO met_language VALUES('365','emailchecktips4','Try to find the advertising mail, spam directory look','0','106','4','0','en');
INSERT INTO met_language VALUES('366','emailchecktips5','Send a confirmation email again','0','107','4','0','en');
INSERT INTO met_language VALUES('367','accsafe','Account safe','0','108','4','0','en');
INSERT INTO met_language VALUES('368','resend','Resend','0','109','4','0','en');
INSERT INTO met_language VALUES('369','getmemberImgCode','get verification code','0','110','4','0','en');
INSERT INTO met_language VALUES('370','password','password','0','113','4','0','en');
INSERT INTO met_language VALUES('371','userhave','Username already exists','0','114','4','0','en');
INSERT INTO met_language VALUES('372','emailhave','E-mail has been registered','0','115','4','0','en');
INSERT INTO met_language VALUES('373','memberemail','mailbox','0','116','4','0','en');
INSERT INTO met_language VALUES('374','memberMoreInfo','more info','0','117','4','0','en');
INSERT INTO met_language VALUES('375','select','select','0','118','4','0','en');
INSERT INTO met_language VALUES('376','acchave','Already have an account?','0','119','4','0','en');
INSERT INTO met_language VALUES('377','accpassword','account password','0','120','4','0','en');
INSERT INTO met_language VALUES('378','accsaftips1','Used to protect account information and login security','0','121','4','0','en');
INSERT INTO met_language VALUES('379','modify','modify','0','122','4','0','en');
INSERT INTO met_language VALUES('380','accemail','Mailbox binding','0','123','4','0','en');
INSERT INTO met_language VALUES('381','accsaftips2','Mailbox bindings can be used to log in to an account, reset password, or other security verification','0','124','4','0','en');
INSERT INTO met_language VALUES('382','acctel','Phone binding','0','125','4','0','en');
INSERT INTO met_language VALUES('383','accsaftips3','Phone bindings can be used to log in to an account, reset password, or other security verification','0','126','4','0','en');
INSERT INTO met_language VALUES('384','modifypassword','change Password','0','127','4','0','en');
INSERT INTO met_language VALUES('385','oldpassword','old password','0','128','4','0','en');
INSERT INTO met_language VALUES('386','newpassword','new password','0','129','4','0','en');
INSERT INTO met_language VALUES('387','confirm','determine','0','130','1','1','en');
INSERT INTO met_language VALUES('388','cancel','cancel','0','131','1','1','en');
INSERT INTO met_language VALUES('389','emailaddress','email address','0','132','4','0','en');
INSERT INTO met_language VALUES('390','telnum','cellphone number','0','134','4','0','en');
INSERT INTO met_language VALUES('391','teluse','Phone number is bound','0','135','4','0','en');
INSERT INTO met_language VALUES('392','telok','Please enter the correct phone number','0','136','4','0','en');
INSERT INTO met_language VALUES('393','modifyacctel','Modify phone binding','0','137','4','0','en');
INSERT INTO met_language VALUES('394','modifyinfo','Save the data','0','138','4','0','en');
INSERT INTO met_language VALUES('395','emailnow','Current email:','0','139','4','0','en');
INSERT INTO met_language VALUES('396','newemail','new mail box','0','140','4','0','en');
INSERT INTO met_language VALUES('397','modifyaccemail','Modify the binding mailbox','0','142','4','0','en');
INSERT INTO met_language VALUES('398','renewpassword','Repeat password','0','144','4','0','en');
INSERT INTO met_language VALUES('399','inputcode','please enter verification code','0','145','4','0','en');
INSERT INTO met_language VALUES('400','next','Next step','0','146','4','0','en');
INSERT INTO met_language VALUES('401','logintips','Username / email / phone','0','147','4','0','en');
INSERT INTO met_language VALUES('402','otherlogin','Other ways to log in','0','148','4','0','en');
INSERT INTO met_language VALUES('403','logintips1','No account? Register now','0','149','4','0','en');
INSERT INTO met_language VALUES('404','rememberImgCode','Resend the verification code','0','150','4','0','en');
INSERT INTO met_language VALUES('405','relogin','Back to login','0','151','4','0','en');
INSERT INTO met_language VALUES('406','getpasswordtips','email / phone number','0','152','4','0','en');
INSERT INTO met_language VALUES('407','regclose','Registration is turned off','0','153','4','0','en');
INSERT INTO met_language VALUES('408','regfail','registration failed','0','154','4','0','en');
INSERT INTO met_language VALUES('409','codetimeout','Verification code has timed out','0','155','4','0','en');
INSERT INTO met_language VALUES('410','telcheckfail','Phone number and SMS verification number is inconsistent','0','156','4','0','en');
INSERT INTO met_language VALUES('411','regsuc','registration success!','0','157','4','0','en');
INSERT INTO met_language VALUES('412','activesuc','Activation successful，please login now','0','158','4','0','en');
INSERT INTO met_language VALUES('413','emailvildtips1','The verification information is wrong','0','159','4','0','en');
INSERT INTO met_language VALUES('414','emailvildtips2','Verification information is incorrect or timed out','0','160','4','0','en');
INSERT INTO met_language VALUES('415','telreg','Phone number has been registered','0','161','4','0','en');
INSERT INTO met_language VALUES('416','Sendfrequent','Sent too often, please try again later','0','162','4','0','en');
INSERT INTO met_language VALUES('417','emailsuc','Mail sent successfully!','0','163','4','0','en');
INSERT INTO met_language VALUES('418','emailfail','E-mail sent failed, please confirm that the mailbox is correct or contact Webmaster to solve.','0','164','4','0','en');
INSERT INTO met_language VALUES('419','modifysuc','Successfully modified','0','165','4','0','en');
INSERT INTO met_language VALUES('420','binding','Bind','0','166','4','0','en');
INSERT INTO met_language VALUES('421','notbound','Not bound','0','167','4','0','en');
INSERT INTO met_language VALUES('422','accnotmodify','Account can not be modified','0','168','4','0','en');
INSERT INTO met_language VALUES('423','emailsuclink','Mail sent successfully! Please click the verification link in the email to complete the operation!','0','169','4','0','en');
INSERT INTO met_language VALUES('424','bindingok','Bind success','0','170','4','0','en');
INSERT INTO met_language VALUES('425','opfail','operation failed','0','171','4','0','en');
INSERT INTO met_language VALUES('426','modifypasswordsuc','Password reset complete!','0','172','4','0','en');
INSERT INTO met_language VALUES('427','lodpasswordfail','The original password is wrong','0','173','4','0','en');
INSERT INTO met_language VALUES('428','membererror1','wrong user name or password','0','174','4','0','en');
INSERT INTO met_language VALUES('429','membererror2','Please open the session!','0','175','4','0','en');
INSERT INTO met_language VALUES('430','membererror3','Authorization failed','0','176','4','0','en');
INSERT INTO met_language VALUES('431','membererror4','unknown mistake','0','177','4','0','en');
INSERT INTO met_language VALUES('432','membererror6','The account is not activated. Please contact the administrator','0','174','4','0','en');
INSERT INTO met_language VALUES('433','emailsucpass','Password recovery email has been sent to your email address, click the link in the email to reset your password.','0','178','4','0','en');
INSERT INTO met_language VALUES('434','emailvildtips3','Please enter the correct email or phone number','0','179','4','0','en');
INSERT INTO met_language VALUES('435','membererror5','Failed to send! error code:','0','180','4','0','en');
INSERT INTO met_language VALUES('436','noempty','This item can not be empty','0','181','4','0','en');
INSERT INTO met_language VALUES('437','usernamecheck','Username must be between 2-30 characters','0','182','4','0','en');
INSERT INTO met_language VALUES('438','passwordcheck','The password must be between 6 and 30 characters','0','183','4','0','en');
INSERT INTO met_language VALUES('439','passwordsame','The password input is inconsistent twice','0','184','4','0','en');
INSERT INTO met_language VALUES('440','emailcheck','Please enter the correct email address','0','184','4','0','en');
INSERT INTO met_language VALUES('441','Previous_news','Previous','0','9','3','0','en');
INSERT INTO met_language VALUES('442','Next_news','Next','0','10','3','0','en');
INSERT INTO met_language VALUES('443','close','shut down','0','0','0','0','en');
INSERT INTO met_language VALUES('444','browserupdatetips','You are using a obsolete browser. Please upgrade your browser  to enhance your experience.','0','0','0','0','en');
INSERT INTO met_language VALUES('445','newFeedback','You received new feedback','0','0','0','0','en');
INSERT INTO met_language VALUES('446','opfailed','operation failed','0','0','1','0','en');
INSERT INTO met_language VALUES('447','jobPrompt','Received a new resume','0','0','0','0','en');
INSERT INTO met_language VALUES('448','reMessage1','Your website','0','0','0','0','en');
INSERT INTO met_language VALUES('449','reMessage2',', Please log in as soon as possible to view the website background','0','0','0','0','en');
INSERT INTO met_language VALUES('450','messagePrompt','Received a new message','0','0','0','0','en');
INSERT INTO met_language VALUES('451','formaterror','wrong format','0','0','0','0','en');
INSERT INTO met_language VALUES('452','listcom','recommend','0','0','0','0','en');
INSERT INTO met_language VALUES('453','listnew','update','0','0','0','0','en');
INSERT INTO met_language VALUES('454','listhot','Popular','0','0','0','0','en');
INSERT INTO met_language VALUES('455','weball','All','0','0','0','0','en');
INSERT INTO met_language VALUES('456','columnall','All columns','0','0','0','0','en');
INSERT INTO met_language VALUES('457','accsaftips4','Binding user confirmation of identity information','0','9','2','0','en');
INSERT INTO met_language VALUES('458','rnvalidate','Real name authentication','0','9','2','0','en');
INSERT INTO met_language VALUES('459','notauthen','Uncertified','0','9','2','0','en');
INSERT INTO met_language VALUES('460','authen','Certified','0','9','1','0','en');
INSERT INTO met_language VALUES('461','realname','Real name','0','9','2','0','en');
INSERT INTO met_language VALUES('462','idcode','ID card No.','0','9','2','0','en');
INSERT INTO met_language VALUES('463','idvalidok','Success of real name authentication','0','9','2','0','en');
INSERT INTO met_language VALUES('464','idvalidfailed','Real name authentication failure','0','9','2','0','en');
INSERT INTO met_language VALUES('465','systips1','You do not have permission to access this content! Please login to visit!','0','0','0','0','en');
INSERT INTO met_language VALUES('466','systips2','Your user group does not have permission to access this content!','0','0','0','0','en');
INSERT INTO met_language VALUES('467','usercheckok','Verification success!','0','0','1','0','en');
INSERT INTO met_language VALUES('468','usereadinfo','Reading permission value must be greater than 0','0','0','0','0','en');
INSERT INTO met_language VALUES('469','userselectname','Tab','0','0','0','0','en');
INSERT INTO met_language VALUES('470','userwenxinclose','Wechat login is off','0','0','0','0','en');
INSERT INTO met_language VALUES('471','userwenboclose','Weibo login is turned off','0','0','0','0','en');
INSERT INTO met_language VALUES('472','userqqclose','QQ login function is closed','0','0','0','0','en');
INSERT INTO met_language VALUES('473','userbuy','buy','0','0','0','0','en');
INSERT INTO met_language VALUES('474','userbuylist','Order','0','0','0','0','en');
INSERT INTO met_language VALUES('475','usesendcode','The verification code is','0','0','0','0','en');
INSERT INTO met_language VALUES('476','usesendcodeinfo','Please enter the verification in time','0','0','0','0','en');
INSERT INTO met_language VALUES('477','feedbackinquiry','Online Inquiry','0','0','0','0','en');
INSERT INTO met_language VALUES('478','templatesusererror','The current language template is not configured or the template file does not exist','0','0','0','0','en');
INSERT INTO met_language VALUES('479','phonecode','Get phone verification code','0','0','0','0','en');
INSERT INTO met_language VALUES('480','phonecodeerror','Mobile phone verification code error','0','0','0','0','en');
INSERT INTO met_language VALUES('481','memberbuytitle','Paid upgrade member group','0','0','0','0','en');
INSERT INTO met_language VALUES('482','img_px_tips','Picture size exceeds system limit (picture width not exceeding 2600px)','0','0','1','0','en');
INSERT INTO met_language VALUES('483','member_cv','curriculum vitae','0','0','1','0','en');
INSERT INTO met_language VALUES('484','please_login','Log in first, please!','0','0','0','0','en');
INSERT INTO met_language VALUES('485','user_agreement','User Agreement','0','0','0','0','en');
INSERT INTO met_language VALUES('486','user_agreement_tips1','I have read it carefully','0','0','0','0','en');
INSERT INTO met_language VALUES('487','user_agreement_tips2','And agree to register','0','0','0','0','en');
INSERT INTO met_language VALUES('488','user_agreement_tips3','Please read and tick agree','0','0','0','0','en');
INSERT INTO met_language VALUES('489','avatar','Avatar','0','0','0','0','en');
INSERT INTO met_language VALUES('490','tag','Tag','0','0','0','0','en');
INSERT INTO met_language VALUES('491','columnSearchInfo','Please enter the keywords you are interested in.','0','0','0','0','en');
INSERT INTO met_language VALUES('492','advancedSearchInfo','Please enter the keywords you are interested in.','0','0','0','0','en');
INSERT INTO met_language VALUES('493','notemptips','There is no website template in the current language. Please go to Style-Website Template and select a set of templates.','0','0','0','0','en');
INSERT INTO met_language VALUES('494','AddDate','Publish time','0','0','0','0','en');
INSERT INTO met_language VALUES('495','listsales','sales','0','0','0','0','en');
INSERT INTO met_language VALUES('496','jsok','Success','0','0','1','0','en');
INSERT INTO met_language VALUES('497','jslang3','No records selected','0','0','1','0','en');
INSERT INTO met_language VALUES('498','delete_information','Are you sure you want to delete this information? Can not be restored after deleted.','0','0','1','0','en');
INSERT INTO met_language VALUES('499','js49','Undo','0','0','1','0','en');
INSERT INTO met_language VALUES('500','weixinunbind','Are you sure you want to unbind wechat','0','0','1','0','en');
INSERT INTO met_language VALUES('501','bindweixin','Wechat binding','0','0','1','0','en');
INSERT INTO met_language VALUES('502','accsaftips5','Wechat binding can be used for login account, message notification and other functions','0','0','1','0','en');
INSERT INTO met_language VALUES('503','bound','Bound','0','0','1','0','en');
INSERT INTO met_language VALUES('504','unbind','Unbind','0','0','1','0','en');
INSERT INTO met_language VALUES('505','weixin_login_error','Wechat login is not allowed in the current language','0','0','1','0','en');
INSERT INTO met_language VALUES('506','login_ok','Login successful','0','0','1','0','en');
INSERT INTO met_language VALUES('507','new_registe_email_content','Your website {webname} has received a registration request from a new user: {username}. Please log in to the website background to check.','0','0','0','0','en');
INSERT INTO met_language VALUES('508','new_registe_sms_content','Your website {webname} has received a registration request from a new user: {username}. Please log in to the website background to check.','0','0','0','0','en');
INSERT INTO met_language VALUES('509','new_regist_notice','New member notice','0','0','0','0','en');
INSERT INTO met_language VALUES('510','page_num_title','page{page_num}','0','0','0','0','en');
INSERT INTO met_language VALUES('511','select_file','Select file','0','0','0','0','en');
INSERT INTO met_language VALUES('512','drag_the_file_here','Drag the file here','0','0','0','0','en');
INSERT INTO met_language VALUES('513','username_tips1','Only uppercase and lowercase letters, numbers and underscores are supported, and the length is greater than 3 and less than 30','0','0','0','0','en');
INSERT INTO met_language VALUES('514','no_spaces','no spaces','0','0','0','0','en');
INSERT INTO met_language VALUES('515','cooperation_platform','企业超市','1','436','0','0','cn');
INSERT INTO met_language VALUES('516','feedback_interaction','反馈互动','1','437','0','0','cn');
INSERT INTO met_language VALUES('517','banner_manage','Banner管理','1','437','0','0','cn');
INSERT INTO met_language VALUES('518','unitytxt_71','二维码','1','435','0','0','cn');
INSERT INTO met_language VALUES('519','unitytxt_69','安装文件删除','1','433','8','0','cn');
INSERT INTO met_language VALUES('520','unitytxt_70','上传文件','1','434','8','0','cn');
INSERT INTO met_language VALUES('521','unitytxt_39','基本设置','1','403','1','0','cn');
INSERT INTO met_language VALUES('522','unitytxt_42','列表页每页显示条数','1','406','0','0','cn');
INSERT INTO met_language VALUES('523','unitytxt_38','代码会放在 &lt;/body&gt; 标签以上','1','402','39','0','cn');
INSERT INTO met_language VALUES('524','unitytxt_37','代码会放在 &lt;/head&gt; 标签以上','1','401','39','0','cn');
INSERT INTO met_language VALUES('525','unitytxt_33','权限设置','1','397','39','0','cn');
INSERT INTO met_language VALUES('526','unitytxt_34','资料文档上传','1','398','40','0','cn');
INSERT INTO met_language VALUES('527','unitytxt_36','PC端第三方代码（一般用于放置百度商桥代码、站长统计代码、谷歌翻译代码等）','1','400','39','0','cn');
INSERT INTO met_language VALUES('528','unitytxt_25','关键词设置','1','389','32','0','cn');
INSERT INTO met_language VALUES('529','unitytxt_26','优化文字设置（可用于增加关键词密度，需要网站模板支持）','1','390','32','0','cn');
INSERT INTO met_language VALUES('530','unitytxt_15','其它设置','1','379','0','0','cn');
INSERT INTO met_language VALUES('531','unitytxt_13','底部信息设置（显示在网站前台底部）','1','377','39','0','cn');
INSERT INTO met_language VALUES('532','unitytxt_14','样式设置','1','378','23','0','cn');
INSERT INTO met_language VALUES('533','unitytxt_10','仅适用用于中文前台语言（语言标识为cn或zh时生效），浏览者可以在简繁体之间切换。','1','374','16','0','cn');
INSERT INTO met_language VALUES('534','unitytxt_9','同步官方参数','1','373','16','0','cn');
INSERT INTO met_language VALUES('535','unitytxt_8','该语言设置了独立域名，需要修改网站网址请在<font class=\"red\">语言设置</font>中修改。','1','372','39','0','cn');
INSERT INTO met_language VALUES('536','unitytxt_7','备份包下载后建议及时删除备份文件，以免影响空间大小（如果你的虚拟主机限定流量，你可以通过FTP下载节省流量）','1','371','0','0','cn');
INSERT INTO met_language VALUES('537','unitytxt_6','版本不一致','1','370','0','0','cn');
INSERT INTO met_language VALUES('538','unitytxt_2','勾选则采用默认设置','1','366','0','0','cn');
INSERT INTO met_language VALUES('539','ssl','SSL服务方式','1','362','39','0','cn');
INSERT INTO met_language VALUES('540','tls','TLS服务方式','1','363','39','0','cn');
INSERT INTO met_language VALUES('541','loginFail','操作失败!','1','359','8','0','cn');
INSERT INTO met_language VALUES('542','NoidJS','没有此用户','1','349','38','0','cn');
INSERT INTO met_language VALUES('543','jsx32','登录超时，请重新登录！','1','344','0','0','cn');
INSERT INTO met_language VALUES('544','jsx27','静态页面名已存在','1','339','0','0','cn');
INSERT INTO met_language VALUES('545','jsx20','正在检测...','1','332','0','0','cn');
INSERT INTO met_language VALUES('546','jsx17','上传成功！','1','329','0','0','cn');
INSERT INTO met_language VALUES('547','jsx15','上传','1','327','1','0','cn');
INSERT INTO met_language VALUES('548','jsx10','错误','1','322','0','0','cn');
INSERT INTO met_language VALUES('549','jsx2','请至少选一种语言！','1','314','0','0','cn');
INSERT INTO met_language VALUES('550','jsx3','请先选择需要复制的表单','1','315','0','0','cn');
INSERT INTO met_language VALUES('551','jsx1','载入中...','1','313','0','0','cn');
INSERT INTO met_language VALUES('552','js67','请至少选择一个所属栏目','1','309','0','0','cn');
INSERT INTO met_language VALUES('553','js55','返回','1','297','1','0','cn');
INSERT INTO met_language VALUES('554','js56','移动为一级栏目必须设置一个新的目录名称(目录名只能是数字或字母)','1','298','0','0','cn');
INSERT INTO met_language VALUES('555','js46','不能重复','1','288','0','0','cn');
INSERT INTO met_language VALUES('556','js49','撤销','1','291','0','0','cn');
INSERT INTO met_language VALUES('557','js41','不能为空！','1','283','0','0','cn');
INSERT INTO met_language VALUES('558','js36','请选择语言','1','278','0','0','cn');
INSERT INTO met_language VALUES('559','js35','上传临时文件夹（upload_tmp_dir）不可写或者域名/后台文件夹/include/uploadify.php没有访问权限。','1','277','0','0','cn');
INSERT INTO met_language VALUES('560','js25','图片地址不能为空！','1','267','0','0','cn');
INSERT INTO met_language VALUES('561','js23','没有选中的记录!','1','265','0','0','cn');
INSERT INTO met_language VALUES('562','js18','原文字不能为空','1','260','0','0','cn');
INSERT INTO met_language VALUES('563','js15','请选择上传文件','1','257','0','0','cn');
INSERT INTO met_language VALUES('564','js16','下载地址不能为空','1','258','0','0','cn');
INSERT INTO met_language VALUES('565','js14','请选择二级及三级栏目','1','256','0','0','cn');
INSERT INTO met_language VALUES('566','js10','您的修改内容还没有保存，您确定离开吗？','1','252','0','0','cn');
INSERT INTO met_language VALUES('567','js6','两次输入的密码不一样','1','248','0','0','cn');
INSERT INTO met_language VALUES('568','js7','确定要删除选中的信息吗？一旦删除将不能恢复！','1','249','1','0','cn');
INSERT INTO met_language VALUES('569','js5','email不能为空','1','247','0','0','cn');
INSERT INTO met_language VALUES('570','js4','登录密码不能为空','1','246','0','0','cn');
INSERT INTO met_language VALUES('571','js2','数据出错了','1','244','0','0','cn');
INSERT INTO met_language VALUES('572','js1','请稍等,系统检测中....','1','243','0','0','cn');
INSERT INTO met_language VALUES('573','dataerror','数据错误','1','242','0','0','cn');
INSERT INTO met_language VALUES('574','jsok','操作成功','1','241','1','0','cn');
INSERT INTO met_language VALUES('575','marks','：','1','238','0','0','cn');
INSERT INTO met_language VALUES('576','displayimg','展示图片','1','235','0','0','cn');
INSERT INTO met_language VALUES('577','Operating','操作系统','1','233','37','0','cn');
INSERT INTO met_language VALUES('578','noorderinfo','数值越小越靠前','1','234','0','0','cn');
INSERT INTO met_language VALUES('579','contentdetail','详细内容','1','227','0','0','cn');
INSERT INTO met_language VALUES('580','content','内容','1','226','1','0','cn');
INSERT INTO met_language VALUES('581','webaccess','访问权限','1','225','0','0','cn');
INSERT INTO met_language VALUES('582','keywordsinfo','多个关键词请用\",\"隔开','1','223','0','0','cn');
INSERT INTO met_language VALUES('583','keywords','关键词','1','222','0','0','cn');
INSERT INTO met_language VALUES('584','hits','点击次数','1','221','0','0','cn');
INSERT INTO met_language VALUES('585','addtime','发布时间','1','220','0','0','cn');
INSERT INTO met_language VALUES('586','updatetime','更新时间','1','219','0','0','cn');
INSERT INTO met_language VALUES('587','access3','管理员','1','218','0','0','cn');
INSERT INTO met_language VALUES('588','access2','代理商','1','217','0','0','cn');
INSERT INTO met_language VALUES('589','access1','普通会员','1','216','0','0','cn');
INSERT INTO met_language VALUES('590','access0','不限','1','215','0','0','cn');
INSERT INTO met_language VALUES('591','access','权限','1','214','0','0','cn');
INSERT INTO met_language VALUES('592','read','已读','1','210','0','0','cn');
INSERT INTO met_language VALUES('593','parameter','参数','1','208','0','0','cn');
INSERT INTO met_language VALUES('594','search','搜索','1','206','0','0','cn');
INSERT INTO met_language VALUES('595','manager','内容管理','1','205','19','0','cn');
INSERT INTO met_language VALUES('596','top','置顶','1','202','0','0','cn');
INSERT INTO met_language VALUES('597','wap','wap','1','201','0','0','cn');
INSERT INTO met_language VALUES('598','recom','推荐','1','200','0','0','cn');
INSERT INTO met_language VALUES('599','image','图片','1','198','0','0','cn');
INSERT INTO met_language VALUES('600','title','标题','1','197','0','0','cn');
INSERT INTO met_language VALUES('601','description','简短描述','1','196','0','0','cn');
INSERT INTO met_language VALUES('602','selected','选择','1','192','0','0','cn');
INSERT INTO met_language VALUES('603','metinfo','MetInfo|米拓企业建站系统','1','189','0','0','cn');
INSERT INTO met_language VALUES('604','no','否','1','188','0','0','cn');
INSERT INTO met_language VALUES('605','yes','是','1','187','0','0','cn');
INSERT INTO met_language VALUES('606','sort','排序','1','186','0','0','cn');
INSERT INTO met_language VALUES('607','type','类型','1','185','0','0','cn');
INSERT INTO met_language VALUES('608','close','关闭','1','184','0','0','cn');
INSERT INTO met_language VALUES('609','open','开启','1','183','0','0','cn');
INSERT INTO met_language VALUES('610','operate','操作','1','182','0','0','cn');
INSERT INTO met_language VALUES('611','preview','预览','1','181','0','0','cn');
INSERT INTO met_language VALUES('612','delete','删除','1','180','0','0','cn');
INSERT INTO met_language VALUES('613','modify','修改','1','179','0','0','cn');
INSERT INTO met_language VALUES('614','View','查看','1','178','0','0','cn');
INSERT INTO met_language VALUES('615','editor','编辑','1','177','0','0','cn');
INSERT INTO met_language VALUES('616','add','添加','1','176','0','0','cn');
INSERT INTO met_language VALUES('617','addsubcolumn','添加子栏目','1','176','0','0','cn');
INSERT INTO met_language VALUES('618','Submit','保存','1','171','0','0','cn');
INSERT INTO met_language VALUES('619','Submitall','提交','1','172','26','0','cn');
INSERT INTO met_language VALUES('620','Copy','复制','1','174','0','0','cn');
INSERT INTO met_language VALUES('621','langadderr4','无法同步官网语言包。','1','166','16','0','cn');
INSERT INTO met_language VALUES('622','langadderr5','您删除的是默认语言！请先设置一个其它语言为默认语言再操作！','1','167','16','0','cn');
INSERT INTO met_language VALUES('623','basictips7','邮箱设置正确！','1','162','39','0','cn');
INSERT INTO met_language VALUES('624','basictips6','<b>解决办法：</b>请检查帐号密码和smtp是否有误或查看邮箱是否开启smtp服务。','1','161','39','0','cn');
INSERT INTO met_language VALUES('625','basictips5','<b>错误提示：</b>测试发送邮件失败！','1','160','39','0','cn');
INSERT INTO met_language VALUES('626','basictips3','邮件发送测试','1','158','39','0','cn');
INSERT INTO met_language VALUES('627','basictips4','收到邮件说明您网站的系统邮箱设置正确。','1','159','39','0','cn');
INSERT INTO met_language VALUES('628','upfileFail10','不支持imagejpeg函数','1','125','8','0','cn');
INSERT INTO met_language VALUES('629','upfileFail11','不支持imagepng函数','1','126','8','0','cn');
INSERT INTO met_language VALUES('630','upfileFail9','不支持imagegif函数','1','124','8','0','cn');
INSERT INTO met_language VALUES('631','upfileFail8','文件损坏,缩略图生成失败','1','123','8','0','cn');
INSERT INTO met_language VALUES('632','upfileFail7','不支持当前文件格式生成缩略图，请上传JPG,GIF,PNG图片','1','122','8','0','cn');
INSERT INTO met_language VALUES('633','upfileFail6','空间不支持GD库，无法生成缩略图','1','121','8','0','cn');
INSERT INTO met_language VALUES('634','upfileFail5','bmp的格式无法自动生成缩图','1','120','8','0','cn');
INSERT INTO met_language VALUES('635','upfileFail4','创建目录失败','1','119','8','0','cn');
INSERT INTO met_language VALUES('636','upfileOver4','upload文件夹没有写权限,请联系空间商修改。','1','116','8','0','cn');
INSERT INTO met_language VALUES('637','upfileOver5','上传临时文件夹(upload_tmp_dir)没有写权限,请联系空间商修改。','1','117','8','0','cn');
INSERT INTO met_language VALUES('638','upfileOver3','没有文件被上传。','1','115','8','0','cn');
INSERT INTO met_language VALUES('639','upfileOver2','文件只有部分被上传。','1','114','8','0','cn');
INSERT INTO met_language VALUES('640','upfileOver','上传的文件超过了 php.ini 中 upload_max_filesize 选项限制的值。','1','112','8','0','cn');
INSERT INTO met_language VALUES('641','upfileOver1','上传文件的大小超过了 HTML 表单中 MAX_FILE_SIZE 选项指定的值。','1','113','8','0','cn');
INSERT INTO met_language VALUES('642','upfileTip3','文件格式不允许上传。','1','110','8','0','cn');
INSERT INTO met_language VALUES('643','upfileTip1','，不能上传。','1','108','8','0','cn');
INSERT INTO met_language VALUES('644','upfileFail2','创建图片目录失败','1','103','8','0','cn');
INSERT INTO met_language VALUES('645','upfileMax','大小超出系统限定值','1','106','8','0','cn');
INSERT INTO met_language VALUES('646','upfileFile','上传文件','1','105','8','0','cn');
INSERT INTO met_language VALUES('647','funNav4','都显示','1','94','5','0','cn');
INSERT INTO met_language VALUES('648','indexfeedbackm','反馈信息管理','1','79','8','0','cn');
INSERT INTO met_language VALUES('649','indexlink','友情链接','1','78','8','0','cn');
INSERT INTO met_language VALUES('650','indexhtm','静态页面生成','1','74','8','0','cn');
INSERT INTO met_language VALUES('651','indexhtmset','静态页面','1','73','8','0','cn');
INSERT INTO met_language VALUES('652','indexcv','招聘系统配置','1','70','8','0','cn');
INSERT INTO met_language VALUES('653','indexflash','Banner 管理','1','67','4','0','cn');
INSERT INTO met_language VALUES('654','indexbbs','关于','1','63','8','0','cn');
INSERT INTO met_language VALUES('655','indexcode','商业授权','1','61','8','0','cn');
INSERT INTO met_language VALUES('656','indexlang','语言设置','1','54','8','0','cn');
INSERT INTO met_language VALUES('657','indexloginout','退出','1','51','8','0','cn');
INSERT INTO met_language VALUES('658','indexuser','用户管理','1','47','8','0','cn');
INSERT INTO met_language VALUES('659','indexadmin','常用功能','1','50','8','0','cn');
INSERT INTO met_language VALUES('660','indexadminname','管理员管理','1','80','8','0','cn');
INSERT INTO met_language VALUES('661','indexcontent','内容管理','1','44','8','0','cn');
INSERT INTO met_language VALUES('662','loginall','你没有添加、修改、删除信息的权限，请联系管理员开通','1','39','8','0','cn');
INSERT INTO met_language VALUES('663','loginedit','你没有修改信息的权限，请联系管理员开通','1','38','0','0','cn');
INSERT INTO met_language VALUES('664','loginadd','你没有添加信息的权限，请联系管理员开通','1','37','8','0','cn');
INSERT INTO met_language VALUES('665','logindelete','你没有删除信息的权限，请联系管理员开通','1','36','8','0','cn');
INSERT INTO met_language VALUES('666','loginpass','用户名或密码错误','1','35','8','0','cn');
INSERT INTO met_language VALUES('667','loginname','用户名或密码错误','1','34','18','0','cn');
INSERT INTO met_language VALUES('668','logincodeerror','验证码错误','1','33','18','0','cn');
INSERT INTO met_language VALUES('669','loginconfirm','登录','1','32','18','0','cn');
INSERT INTO met_language VALUES('670','loginforget','忘记密码?','1','31','18','0','cn');
INSERT INTO met_language VALUES('671','loginusename','用户名','1','27','8','0','cn');
INSERT INTO met_language VALUES('672','loginpassword','密码','1','28','8','0','cn');
INSERT INTO met_language VALUES('673','logincode','验证码','1','29','8','0','cn');
INSERT INTO met_language VALUES('674','loginlanguage','后台语言','1','26','18','0','cn');
INSERT INTO met_language VALUES('675','loginmetinfo','MetInfo','1','25','8','0','cn');
INSERT INTO met_language VALUES('676','loginadmin','管理员登录','1','24','18','0','cn');
INSERT INTO met_language VALUES('677','logintitle','后台登录','1','21','18','0','cn');
INSERT INTO met_language VALUES('678','myapp','应用插件','1','20','36','0','cn');
INSERT INTO met_language VALUES('679','myapps','我的插件','1','20','36','0','cn');
INSERT INTO met_language VALUES('680','recycle','内容回收站','1','17','29','0','cn');
INSERT INTO met_language VALUES('681','managertyp5','自定义','1','9','2','0','cn');
INSERT INTO met_language VALUES('682','managertyp4','内容管理员','1','9','2','0','cn');
INSERT INTO met_language VALUES('683','managertyp2','管理员','1','7','2','0','cn');
INSERT INTO met_language VALUES('684','managertyp3','优化推广员','1','8','2','0','cn');
INSERT INTO met_language VALUES('685','managertyp1','创始人','1','6','2','0','cn');
INSERT INTO met_language VALUES('686','uplaoderr1','上传失败！','1','3','8','0','cn');
INSERT INTO met_language VALUES('687','clickview','点击查看','1','1','8','0','cn');
INSERT INTO met_language VALUES('688','membertips1','注册时间','1','105','38','0','cn');
INSERT INTO met_language VALUES('689','memberjstxt2','请输入登录密码！','1','95','7','0','cn');
INSERT INTO met_language VALUES('690','memberCheck','是否激活','1','92','38','0','cn');
INSERT INTO met_language VALUES('691','memberMan','先生','1','81','36','0','cn');
INSERT INTO met_language VALUES('692','memberCell','手机','1','84','7','0','cn');
INSERT INTO met_language VALUES('693','memberTip','不修改请留空','1','78','7','0','cn');
INSERT INTO met_language VALUES('694','memberTip1','看不清？点击更换验证码','1','78','7','0','cn');
INSERT INTO met_language VALUES('695','memberName','姓名','1','76','7','0','cn');
INSERT INTO met_language VALUES('696','memberCV','简历','1','74','15','0','cn');
INSERT INTO met_language VALUES('697','memberEmail','邮箱地址','1','67','7','0','cn');
INSERT INTO met_language VALUES('698','memberAdd','添加会员','1','62','2','0','cn');
INSERT INTO met_language VALUES('699','memberChecked','已激活','1','60','38','0','cn');
INSERT INTO met_language VALUES('700','memberUnChecked','未激活','1','61','38','0','cn');
INSERT INTO met_language VALUES('701','memberManage','会员管理','1','58','2','0','cn');
INSERT INTO met_language VALUES('702','memberlogin','会员注册','1','51','38','0','cn');
INSERT INTO met_language VALUES('703','hello','您好！','1','47','7','0','cn');
INSERT INTO met_language VALUES('704','getTip5','找回密码','1','45','7','0','cn');
INSERT INTO met_language VALUES('705','getTip3','创建新密码链接的电子邮件已经发送到您的邮箱，请尽快修改您的密码。','1','43','10','0','cn');
INSERT INTO met_language VALUES('706','getTip2','感谢您对MetInfo的支持与厚爱，希望MetInfo能为您的网站创造价值！','1','42','10','0','cn');
INSERT INTO met_language VALUES('707','getTip1','您的密码重置请求已经得到验证。请点击以下链接输入您的新密码：','1','41','10','0','cn');
INSERT INTO met_language VALUES('708','getNotice','管理员密码找回','1','40','10','0','cn');
INSERT INTO met_language VALUES('709','adminpassTitle','修改个人信息','1','39','2','0','cn');
INSERT INTO met_language VALUES('710','adminSelectAll','全部选择','1','37','2','0','cn');
INSERT INTO met_language VALUES('711','adminOperate4','删除信息','1','35','2','0','cn');
INSERT INTO met_language VALUES('712','adminOperate3','修改信息','1','34','2','0','cn');
INSERT INTO met_language VALUES('713','adminOperate1','完全控制','1','32','2','0','cn');
INSERT INTO met_language VALUES('714','adminOperate2','添加信息','1','33','2','0','cn');
INSERT INTO met_language VALUES('715','adminPower','信息权限','1','29','2','0','cn');
INSERT INTO met_language VALUES('716','adminTip2','只允许查看自己发表的信息','1','30','2','0','cn');
INSERT INTO met_language VALUES('717','adminTip3','发布信息需要审核才能正常显示','1','30','2','0','cn');
INSERT INTO met_language VALUES('718','adminOperate','操作权限','1','31','2','0','cn');
INSERT INTO met_language VALUES('719','adminpassword1','密码确认','1','21','2','0','cn');
INSERT INTO met_language VALUES('720','adminpassword','登录密码','1','20','7','0','cn');
INSERT INTO met_language VALUES('721','adminLastLogin','最后登录时间','1','18','0','0','cn');
INSERT INTO met_language VALUES('722','adminLastIP','最后登录IP','1','19','0','0','cn');
INSERT INTO met_language VALUES('723','metadmin','管理员','1','12','0','0','cn');
INSERT INTO met_language VALUES('724','adminusername','用户名','1','13','0','0','cn');
INSERT INTO met_language VALUES('725','adminname','姓名','1','14','0','0','cn');
INSERT INTO met_language VALUES('726','admin_email','管理员邮箱','1','14','0','0','cn');
INSERT INTO met_language VALUES('727','admin_email_error','管理员邮箱已被占用','1','14','0','0','cn');
INSERT INTO met_language VALUES('728','admin_mobile_error','管理员手机号已被占用','1','14','0','0','cn');
INSERT INTO met_language VALUES('729','adminLoginNum','登录次数','1','17','38','0','cn');
INSERT INTO met_language VALUES('730','admintips7','管理员权限设置','1','11','2','0','cn');
INSERT INTO met_language VALUES('731','adminjurisd','语言权限','1','5','2','0','cn');
INSERT INTO met_language VALUES('732','admintips1','所有语言','1','6','0','0','cn');
INSERT INTO met_language VALUES('733','admintips2','至少选择一个','1','7','2','0','cn');
INSERT INTO met_language VALUES('734','admintips5','用户组','1','10','0','0','cn');
INSERT INTO met_language VALUES('735','admintips4','新增栏目权限','1','9','2','0','cn');
INSERT INTO met_language VALUES('736','webcompre','整站压缩包','1','3','8','0','cn');
INSERT INTO met_language VALUES('737','admininfo','管理员基本信息','1','4','0','0','cn');
INSERT INTO met_language VALUES('738','uploadfile','上传文件夹','1','2','8','0','cn');
INSERT INTO met_language VALUES('739','database','数据库','1','1','8','0','cn');
INSERT INTO met_language VALUES('740','dlapptips6','卸载','1','294','6','0','cn');
INSERT INTO met_language VALUES('741','dlapptips5','打开','1','293','6','0','cn');
INSERT INTO met_language VALUES('742','mobiletips3','添加内容','1','284','0','0','cn');
INSERT INTO met_language VALUES('743','smstips64','全部状态','1','245','6','0','cn');
INSERT INTO met_language VALUES('744','smstips24','操作时间','1','206','6','0','cn');
INSERT INTO met_language VALUES('745','smstips22','账户余额','1','204','6','0','cn');
INSERT INTO met_language VALUES('746','smstips18','操作类型','1','200','6','0','cn');
INSERT INTO met_language VALUES('747','smstips19','充值','1','201','6','0','cn');
INSERT INTO met_language VALUES('748','smstips17','序列','1','199','6','0','cn');
INSERT INTO met_language VALUES('749','smstips9','元','1','191','6','0','cn');
INSERT INTO met_language VALUES('750','smstips6','当前余额','1','188','6','0','cn');
INSERT INTO met_language VALUES('751','smstips7','付款方式','1','189','6','0','cn');
INSERT INTO met_language VALUES('752','smstips1','批量发送','1','183','6','0','cn');
INSERT INTO met_language VALUES('753','smstips2','发送记录','1','184','6','0','cn');
INSERT INTO met_language VALUES('754','statip','IP','1','132','6','0','cn');
INSERT INTO met_language VALUES('755','smsrecharge','充值','1','113','6','0','cn');
INSERT INTO met_language VALUES('756','physicalfunction4','文件夹','1','103','1','0','cn');
INSERT INTO met_language VALUES('757','physicaldelok','删除成功','1','47','6','0','cn');
INSERT INTO met_language VALUES('758','physicalgenok','生成成功','1','49','6','0','cn');
INSERT INTO met_language VALUES('759','usertype3','普通商业授权','1','35','0','0','cn');
INSERT INTO met_language VALUES('760','usertype4','高级商业授权','1','36','0','0','cn');
INSERT INTO met_language VALUES('761','appinstall','安装','1','38','1','0','cn');
INSERT INTO met_language VALUES('762','appupgrade','升级','1','40','3','0','cn');
INSERT INTO met_language VALUES('763','usertype1','免费','1','33','3','0','cn');
INSERT INTO met_language VALUES('764','csvnodata','没有数据','1','26','16','0','cn');
INSERT INTO met_language VALUES('765','wapdimensionalsize','尺寸','1','20','6','0','cn');
INSERT INTO met_language VALUES('766','dltips7','下载超时','1','195','0','0','cn');
INSERT INTO met_language VALUES('767','columnarrangement2','切换为','1','197','19','0','cn');
INSERT INTO met_language VALUES('768','columnarrangement3','按模块分类','1','198','19','0','cn');
INSERT INTO met_language VALUES('769','columnarrangement4','按栏目分类','1','199','19','0','cn');
INSERT INTO met_language VALUES('770','dltips6','远程服务器请求错误','1','194','0','0','cn');
INSERT INTO met_language VALUES('771','dltips5','您所请求的文件不存在','1','193','0','0','cn');
INSERT INTO met_language VALUES('772','dltips4','请升级程序','1','192','0','0','cn');
INSERT INTO met_language VALUES('773','dltips3','您没有权限下载此文件','1','191','0','0','cn');
INSERT INTO met_language VALUES('774','dltips2','文件下载失败，请检查本地目录权限和空间大小','1','190','0','0','cn');
INSERT INTO met_language VALUES('775','dltips1','无法连接上远程服务器，请检查网络','1','189','0','0','cn');
INSERT INTO met_language VALUES('776','seotips18','过滤外部模块','1','182','5','0','cn');
INSERT INTO met_language VALUES('777','seotips19','网站语言范围','1','183','32','0','cn');
INSERT INTO met_language VALUES('778','seotips20','当前语言','1','184','32','0','cn');
INSERT INTO met_language VALUES('779','seotips15_3','适合雅虎，','1','179','32','0','cn');
INSERT INTO met_language VALUES('780','seotips16','过滤栏目及内容','1','180','32','0','cn');
INSERT INTO met_language VALUES('781','seotips15_2','适合谷歌和百度，','1','178','32','0','cn');
INSERT INTO met_language VALUES('782','seotips15','地图网址','1','176','32','0','cn');
INSERT INTO met_language VALUES('783','seotips6','首页','1','166','0','0','cn');
INSERT INTO met_language VALUES('784','seotips9','内容页','1','169','32','0','cn');
INSERT INTO met_language VALUES('785','seotips14_1','怎样提交给搜索引擎？','1','175','32','0','cn');
INSERT INTO met_language VALUES('786','seotips14','网站地图（Sitemap）有助于加快网站被搜索引擎收录','1','174','32','0','cn');
INSERT INTO met_language VALUES('787','seotips12','是否立即生成所有静态页面？','1','172','11','0','cn');
INSERT INTO met_language VALUES('788','seotips11','是否删除所有已生成的静态页面？','1','171','11','0','cn');
INSERT INTO met_language VALUES('789','uiset_descript_v6','勾选的应用将出现在导航栏【常用功能】下拉列表中','1','0','0','0','cn');
INSERT INTO met_language VALUES('790','seotips1','多个关键词请用英文状态下的逗号 \",\" 隔开，建议3到4个关键词。','1','161','32','0','cn');
INSERT INTO met_language VALUES('791','statips27','时间','1','124','0','0','cn');
INSERT INTO met_language VALUES('792','statips2','统计设置','1','101','0','0','cn');
INSERT INTO met_language VALUES('793','linkRecommend','推荐站点','1','91','17','0','cn');
INSERT INTO met_language VALUES('794','linkPass','审核通过','1','90','17','0','cn');
INSERT INTO met_language VALUES('795','linkLOGO','网站LOGO','1','87','17','0','cn');
INSERT INTO met_language VALUES('796','linkcontact','联系方式','1','88','0','0','cn');
INSERT INTO met_language VALUES('797','linktip1','相同状态的站点，数字越大排序越靠前','1','89','17','0','cn');
INSERT INTO met_language VALUES('798','linktip2','审核通过的才能在前台显示，推荐站点排序靠前显示','1','89','17','0','cn');
INSERT INTO met_language VALUES('799','linkUrl','网站地址','1','86','17','0','cn');
INSERT INTO met_language VALUES('800','linkKeys','网站关键词','1','83','17','0','cn');
INSERT INTO met_language VALUES('801','linkCheck','审核','1','84','17','0','cn');
INSERT INTO met_language VALUES('802','linkName','网站标题','1','82','17','0','cn');
INSERT INTO met_language VALUES('803','linkType4','文字链接','1','80','17','0','cn');
INSERT INTO met_language VALUES('804','linkType5','LOGO链接','1','81','17','0','cn');
INSERT INTO met_language VALUES('805','linkType1','未审核链接','1','77','17','0','cn');
INSERT INTO met_language VALUES('806','linkType2','推荐链接','1','78','17','0','cn');
INSERT INTO met_language VALUES('807','linkType','链接类型','1','75','17','0','cn');
INSERT INTO met_language VALUES('808','htmCreateAll','生成所有页面','1','63','11','0','cn');
INSERT INTO met_language VALUES('809','htmsitemap','网站地图','1','61','0','0','cn');
INSERT INTO met_language VALUES('810','htmAll','所有页面','1','59','11','0','cn');
INSERT INTO met_language VALUES('811','htmTip1','生成内容页面','1','57','11','0','cn');
INSERT INTO met_language VALUES('812','htmTip2','生成列表页面','1','58','11','0','cn');
INSERT INTO met_language VALUES('813','htmColumn','栏目管理','1','56','0','0','cn');
INSERT INTO met_language VALUES('814','htmHome','网站首页','1','54','4','0','cn');
INSERT INTO met_language VALUES('815','sethtmsitemap4','xml网站地图','1','53','32','0','cn');
INSERT INTO met_language VALUES('816','sethtmlist','列表页面名称','1','47','11','0','cn');
INSERT INTO met_language VALUES('817','sethtmlist1','默认文件名+class+页码（如product_1_1)','1','48','11','0','cn');
INSERT INTO met_language VALUES('818','sethtmlist2','所在文件夹名称+class+页码（如software_1_1)','1','49','11','0','cn');
INSERT INTO met_language VALUES('819','sethtmpage4','<span style=float:right;>不建议频繁更换，以确保SEO效果（修改后请重新生成所有静态页面）</span>静态页面名称规则','1','50','11','0','cn');
INSERT INTO met_language VALUES('820','sethtmpage3','所在文件夹名称+ID（如product10)','1','43','11','0','cn');
INSERT INTO met_language VALUES('821','setlisthtmltype','列表页面类型','1','44','11','0','cn');
INSERT INTO met_language VALUES('822','setlisthtmltype1','显示所有栏目id（如product_1_2_3）','1','45','11','0','cn');
INSERT INTO met_language VALUES('823','setlisthtmltype2','只显示本栏目id（如product_1）','1','46','11','0','cn');
INSERT INTO met_language VALUES('824','sethtmpage2','年月日+ID（如2009081510)','1','42','11','0','cn');
INSERT INTO met_language VALUES('825','sethtmpage1','默认文件名+ID（如showproduct10)','1','41','11','0','cn');
INSERT INTO met_language VALUES('826','sethtmpage','内容页面名称','1','40','11','0','cn');
INSERT INTO met_language VALUES('827','sethtmtype','静态页面类型','1','39','11','0','cn');
INSERT INTO met_language VALUES('828','sethtmway3','不建议开启自动生成功能，非常消耗资源，且仅内容管理相关操作能自动生成，其它后台设置修改后如前台无改变需要手动生成。','1','38','11','0','cn');
INSERT INTO met_language VALUES('829','sethtmway2','手动生成','1','37','11','0','cn');
INSERT INTO met_language VALUES('830','sethtmway','生成方式','1','35','11','0','cn');
INSERT INTO met_language VALUES('831','sethtmway1','内容信息变动时自动生成','1','36','11','0','cn');
INSERT INTO met_language VALUES('832','setbasicTip4','建议企业站使用伪静态功能，纯静态消耗资源且不方便管理；首次开启请点击“静态页面生成”生成全部页面','1','34','11','0','cn');
INSERT INTO met_language VALUES('833','sethtmok','静态页面开启','1','31','11','0','cn');
INSERT INTO met_language VALUES('834','sethtmall','全站静态化','1','32','11','0','cn');
INSERT INTO met_language VALUES('835','setbasicTip3','首页、内容页面静态化','1','33','11','0','cn');
INSERT INTO met_language VALUES('836','sethtmlmix','混合模式（首页、栏目首页、和内容页生成静态文件，栏目列表页使用伪静态）','1','33','11','0','cn');
INSERT INTO met_language VALUES('837','sethtm_auto','静态页自动更新','1','35','11','0','cn');
INSERT INTO met_language VALUES('838','sethtm_auto_daily','每天更新','1','35','11','0','cn');
INSERT INTO met_language VALUES('839','sethtm_auto_weekly','每周更新','1','35','11','0','cn');
INSERT INTO met_language VALUES('840','sethtm_auto_monthly','每月更新','1','35','11','0','cn');
INSERT INTO met_language VALUES('841','sethtm_auto_tips','自动更新时段为 00:00 ~ 04:00','1','35','11','0','cn');
INSERT INTO met_language VALUES('842','sethtm_auto_tips1','范例：选择“手动生成”和“每周更新”，则系统将在每周固定时间自动生成静态页面。','1','35','11','0','cn');
INSERT INTO met_language VALUES('843','labelUrl','链接地址','1','27','32','0','cn');
INSERT INTO met_language VALUES('844','htm','静态页面已成功生成','1','30','11','0','cn');
INSERT INTO met_language VALUES('845','labelnum','替换次数','1','23','32','0','cn');
INSERT INTO met_language VALUES('846','labelOld','原文字','1','24','32','0','cn');
INSERT INTO met_language VALUES('847','labelNew','替换为','1','25','32','0','cn');
INSERT INTO met_language VALUES('848','setseoTip14','内页的标题(title)构成方式，您也可以在编辑/添加内容时自定义对应页面的标题(title)。','1','21','32','0','cn');
INSERT INTO met_language VALUES('849','setseotitletype','内页标题（title）','1','16','32','0','cn');
INSERT INTO met_language VALUES('850','setseotitletype1','内容标题','1','17','32','0','cn');
INSERT INTO met_language VALUES('851','setseotitletype2','内容标题+网站名称','1','18','32','0','cn');
INSERT INTO met_language VALUES('852','setseotitletype3','内容标题+网站关键词','1','19','32','0','cn');
INSERT INTO met_language VALUES('853','setseotitletype4','内容标题+网站关键词+网站名称','1','20','32','0','cn');
INSERT INTO met_language VALUES('854','setseotitletype5','内容标题+所属栏目名称+网站名称','1','20','32','0','cn');
INSERT INTO met_language VALUES('855','setseodopen','当前窗口打开','1','14','35','0','cn');
INSERT INTO met_language VALUES('856','setseonewopen','新窗口打开','1','15','35','0','cn');
INSERT INTO met_language VALUES('857','setseoFoot','网站底部优化字','1','11','32','0','cn');
INSERT INTO met_language VALUES('858','setseoTip9','鼠标移至超链接显示的文字','1','9','32','0','cn');
INSERT INTO met_language VALUES('859','setseoTip8','超链接默认Title','1','8','32','0','cn');
INSERT INTO met_language VALUES('860','setseoTip7','鼠标移至图片显示的文字','1','7','32','0','cn');
INSERT INTO met_language VALUES('861','setseoTip6','图片默认ALT','1','6','32','0','cn');
INSERT INTO met_language VALUES('862','setseoTip4','头部优化文字','1','5','32','0','cn');
INSERT INTO met_language VALUES('863','setseoTip10','留空则采用网站名称-网站关键词的构成方式','1','4','32','0','cn');
INSERT INTO met_language VALUES('864','setseoKey','网站关键词','1','2','32','0','cn');
INSERT INTO met_language VALUES('865','setseohomeKey','首页标题（title）','1','3','32','0','cn');
INSERT INTO met_language VALUES('866','setseoTip1','多个关键词请用“,”隔开。','1','1','0','0','cn');
INSERT INTO met_language VALUES('867','setheadstat','顶部代码','1','176','39','0','cn');
INSERT INTO met_language VALUES('868','recycledietime','删除时间','1','121','29','0','cn');
INSERT INTO met_language VALUES('869','recyclere','还原','1','122','29','0','cn');
INSERT INTO met_language VALUES('870','messageeditor','编辑留言','1','113','20','0','cn');
INSERT INTO met_language VALUES('871','messagesubmit','留言提交开启关闭','1','112','20','0','cn');
INSERT INTO met_language VALUES('872','messageeditorReply','回复留言','1','109','20','0','cn');
INSERT INTO met_language VALUES('873','messageeditorCheck','回复审核','1','110','20','0','cn');
INSERT INTO met_language VALUES('874','messageeditorShow','审核通过并在前台显示','1','111','20','0','cn');
INSERT INTO met_language VALUES('875','messageTime','提交时间','1','106','20','0','cn');
INSERT INTO met_language VALUES('876','messageID','留言者身份','1','105','20','0','cn');
INSERT INTO met_language VALUES('877','messageTel','电话','1','103','20','0','cn');
INSERT INTO met_language VALUES('878','messageTitle','留言信息管理','1','96','0','0','cn');
INSERT INTO met_language VALUES('879','messageVoice','留言表单设置','1','443','0','0','cn');
INSERT INTO met_language VALUES('880','messageincTip3','客户留言后需要在后台回复审核才显示','1','93','20','0','cn');
INSERT INTO met_language VALUES('881','messageincShow','显示方式','1','92','20','0','cn');
INSERT INTO met_language VALUES('882','feedbackauto','邮件回复设置','1','90','0','0','cn');
INSERT INTO met_language VALUES('883','messageincTitle','留言系统设置','1','91','0','0','cn');
INSERT INTO met_language VALUES('884','feedbackexplain1','页面title名称，默认为该栏目名称','1','89','9','0','cn');
INSERT INTO met_language VALUES('885','feedbacksubmit','反馈提交开启关闭','1','88','9','0','cn');
INSERT INTO met_language VALUES('886','fdeditorFrom','来源页面地址','1','85','9','0','cn');
INSERT INTO met_language VALUES('887','fdeditorRecord','编辑记录','1','86','9','0','cn');
INSERT INTO met_language VALUES('888','fdeditorInterest','感兴趣产品','1','83','9','0','cn');
INSERT INTO met_language VALUES('889','fdeditorTime','反馈提交时间','1','84','9','0','cn');
INSERT INTO met_language VALUES('890','feedbackAccess0','游客','1','82','0','0','cn');
INSERT INTO met_language VALUES('891','feedbackTip4','导出全部','1','80','9','0','cn');
INSERT INTO met_language VALUES('892','feedbackTip2','导出EXCEL表','1','79','9','0','cn');
INSERT INTO met_language VALUES('893','feedbackTime','提交时间','1','78','9','0','cn');
INSERT INTO met_language VALUES('894','feedbackID','反馈者身份','1','77','9','0','cn');
INSERT INTO met_language VALUES('895','feedbackClass2','未阅读信息','1','74','0','0','cn');
INSERT INTO met_language VALUES('896','feedbackClass3','已阅读信息','1','75','0','0','cn');
INSERT INTO met_language VALUES('897','feedbackClass','信息状态','1','71','0','0','cn');
INSERT INTO met_language VALUES('898','fdincFeedbackTitle','回复邮件标题','1','68','0','0','cn');
INSERT INTO met_language VALUES('899','fdincAutoFbTitle','自动回复邮件的标题','1','69','4','0','cn');
INSERT INTO met_language VALUES('900','fdincAutoContent','回复邮件内容','1','70','0','0','cn');
INSERT INTO met_language VALUES('901','fdincEmailName','Email字段名','1','66','0','0','cn');
INSERT INTO met_language VALUES('902','fdincTip11','用于获取用户的邮箱地址，以便回复邮件。字段类型必须为“邮箱”','1','67','0','0','cn');
INSERT INTO met_language VALUES('903','fdincTip10','勾选后将自动向提交表单的用户回复邮件','1','65','0','0','cn');
INSERT INTO met_language VALUES('904','fdincAuto','邮件回复','1','64','0','0','cn');
INSERT INTO met_language VALUES('905','fdincTip9','多个邮箱请用|隔开','1','63','0','0','cn');
INSERT INTO met_language VALUES('906','fdincAcceptMail','反馈邮件接收邮箱','1','62','9','0','cn');
INSERT INTO met_language VALUES('907','fdincTip7','短信通知','1','60','0','0','cn');
INSERT INTO met_language VALUES('908','fdincTip14','短信通知号码','1','61','0','0','cn');
INSERT INTO met_language VALUES('909','fdincAccept','邮件接收','1','59','0','0','cn');
INSERT INTO met_language VALUES('910','fdincTip6','用于获取用户反馈的类型，字段类型为“下拉”或“单选”，设置为关联产品时，下拉菜单为对应栏目下的全部产品。','1','57','9','0','cn');
INSERT INTO met_language VALUES('911','fdincAcceptType','信息接收方式','1','58','9','0','cn');
INSERT INTO met_language VALUES('912','fdincClassName','信息分类字段名','1','56','9','0','cn');
INSERT INTO met_language VALUES('913','fdincSlash','敏感字符过滤','1','54','0','0','cn');
INSERT INTO met_language VALUES('914','fdincTip4','秒，同一IP2次提交的最小间隔时间','1','53','0','0','cn');
INSERT INTO met_language VALUES('915','fdincName','反馈表单名称','1','51','9','0','cn');
INSERT INTO met_language VALUES('916','fdincTime','防刷新时间','1','52','0','0','cn');
INSERT INTO met_language VALUES('917','fdincTitle','反馈系统设置','1','50','25','0','cn');
INSERT INTO met_language VALUES('918','phoneNumCheck','验证手机号码','1','50','25','0','cn');
INSERT INTO met_language VALUES('919','phoneNumCheckTips','通过短信验证码验证手机号码真实性','1','50','25','0','cn');
INSERT INTO met_language VALUES('920','smsApiSetTips','配置短信接口','1','50','25','0','cn');
INSERT INTO met_language VALUES('921','mailboxSetTips','配置邮件信息','1','50','25','0','cn');
INSERT INTO met_language VALUES('922','jobmanagement','招聘职位管理','1','48','0','0','cn');
INSERT INTO met_language VALUES('923','jobtip9','简历照片，以便在邮件中能看到应聘者上传的照片。','1','47','0','0','cn');
INSERT INTO met_language VALUES('924','jobtip8','图片字段名','1','46','0','0','cn');
INSERT INTO met_language VALUES('925','jobtip5','投递简历后系统会自动发送一封邮件到接收邮箱','1','45','15','0','cn');
INSERT INTO met_language VALUES('926','cvset','简历表单设置','1','44','0','0','cn');
INSERT INTO met_language VALUES('927','cvmanagement','简历信息管理','1','43','0','0','cn');
INSERT INTO met_language VALUES('928','cvemail','简历接收邮箱','1','42','15','0','cn');
INSERT INTO met_language VALUES('929','cvall','全部','1','39','3','0','cn');
INSERT INTO met_language VALUES('930','cvincAcceptType','简历接收方式','1','37','0','0','cn');
INSERT INTO met_language VALUES('931','cvincAcceptMail','简历接收邮箱','1','36','0','0','cn');
INSERT INTO met_language VALUES('932','cvincTip4','单独职位','1','34','0','0','cn');
INSERT INTO met_language VALUES('933','cvincTip3','统一设置','1','33','0','0','cn');
INSERT INTO met_language VALUES('934','cvincTip2','邮件接收方式','1','32','0','0','cn');
INSERT INTO met_language VALUES('935','josAlways','不限','1','31','0','0','cn');
INSERT INTO met_language VALUES('936','cvAddtime','提交时间','1','28','0','0','cn');
INSERT INTO met_language VALUES('937','cvPosition','应聘职位','1','26','4','0','cn');
INSERT INTO met_language VALUES('938','jobtip3','天 （留空为不限）','1','25','15','0','cn');
INSERT INTO met_language VALUES('939','jobnow','今天是','1','23','15','0','cn');
INSERT INTO met_language VALUES('940','jobtip2','注意不要改变格式。','1','24','15','0','cn');
INSERT INTO met_language VALUES('941','jobdeal','工资待遇','1','22','15','0','cn');
INSERT INTO met_language VALUES('942','jobtip1','人 （留空为不限）','1','21','15','0','cn');
INSERT INTO met_language VALUES('943','jobpublish','发布日期','1','19','15','0','cn');
INSERT INTO met_language VALUES('944','joblife','有效时间','1','18','15','0','cn');
INSERT INTO met_language VALUES('945','jobnum','招聘人数','1','16','15','0','cn');
INSERT INTO met_language VALUES('946','jobaddress','工作地点','1','17','15','0','cn');
INSERT INTO met_language VALUES('947','jobposition','招聘职位','1','15','15','0','cn');
INSERT INTO met_language VALUES('948','setfootstat','底部代码','1','11','39','0','cn');
INSERT INTO met_language VALUES('949','setfootOther','其他信息','1','10','39','0','cn');
INSERT INTO met_language VALUES('950','setfootAddressCode','地址邮编','1','8','39','0','cn');
INSERT INTO met_language VALUES('951','setfootVersion','版权信息','1','7','39','0','cn');
INSERT INTO met_language VALUES('952','seticpinfo','ICP备案信息','1','10','39','0','cn');
INSERT INTO met_language VALUES('953','article6','参数设置','1','6','0','0','cn');
INSERT INTO met_language VALUES('954','article4','排序数值越大越靠前，可上下拖拽排序','1','4','0','0','cn');
INSERT INTO met_language VALUES('955','article1','可选属性','1','1','0','0','cn');
INSERT INTO met_language VALUES('956','copyotherlang6','请选择复制到的语言','1','138','5','0','cn');
INSERT INTO met_language VALUES('957','copyotherlang5','二级，三级栏目不能单独复制，请连同一级栏目一起复制，或提升为一级栏目','1','139','5','0','cn');
INSERT INTO met_language VALUES('958','copyotherlang4','栏目在复制语言中已经存在，请直接复制内容','1','138','5','0','cn');
INSERT INTO met_language VALUES('959','copyotherlang2','复制内容','1','136','5','0','cn');
INSERT INTO met_language VALUES('960','ctitleinfo','为空则使用SEO参数设置中设置的title构成方式','1','134','0','0','cn');
INSERT INTO met_language VALUES('961','copyotherlang1','复制到其他语言','1','135','5','0','cn');
INSERT INTO met_language VALUES('962','listproductre','关联产品','1','132','9','0','cn');
INSERT INTO met_language VALUES('963','listproductreok','不关联','1','133','9','0','cn');
INSERT INTO met_language VALUES('964','parameter3','文本','1','123','25','0','cn');
INSERT INTO met_language VALUES('965','parameter4','多选','1','124','25','0','cn');
INSERT INTO met_language VALUES('966','parameter5','附件','1','125','25','0','cn');
INSERT INTO met_language VALUES('967','parameter6','单选','1','126','25','0','cn');
INSERT INTO met_language VALUES('968','parameter8','电话','1','9','2','0','cn');
INSERT INTO met_language VALUES('969','parameter9','邮箱','1','9','2','0','cn');
INSERT INTO met_language VALUES('970','allcategory','所有栏目','1','127','0','0','cn');
INSERT INTO met_language VALUES('971','listTitle','设置选项','1','130','0','0','cn');
INSERT INTO met_language VALUES('972','parameter1','简短','1','121','25','0','cn');
INSERT INTO met_language VALUES('973','parameter2','下拉','1','122','25','0','cn');
INSERT INTO met_language VALUES('974','parametertype','字段类型','1','119','0','0','cn');
INSERT INTO met_language VALUES('975','columnmtitle','页面Title','1','118','0','0','cn');
INSERT INTO met_language VALUES('976','columnmappend','附加内容','1','116','0','0','cn');
INSERT INTO met_language VALUES('977','columnmore','更多','1','117','3','0','cn');
INSERT INTO met_language VALUES('978','columnmfeedback','反馈表单设置','1','108','0','0','cn');
INSERT INTO met_language VALUES('979','columnmnotallow','不允许','1','105','0','0','cn');
INSERT INTO met_language VALUES('980','columnmeditor','编辑栏目','1','103','19','0','cn');
INSERT INTO met_language VALUES('981','columnmallow','允许','1','104','0','0','cn');
INSERT INTO met_language VALUES('982','columnmove','移动栏目','1','97','0','0','cn');
INSERT INTO met_language VALUES('983','columnmove1','移动','1','98','0','0','cn');
INSERT INTO met_language VALUES('984','columnexplain7','此功能用于老版本兼容（作用于该栏目在前台对应位置的显示）','1','95','0','0','cn');
INSERT INTO met_language VALUES('985','columnerr7','升为一级栏目','1','87','5','0','cn');
INSERT INTO met_language VALUES('986','columnerr4','目录名称已存在，可能已被使用','1','84','30','0','cn');
INSERT INTO met_language VALUES('987','columntip14','为空则使用静态页面设置中设置的URL构成方式，不要加html后缀，仅支持中文、大小写字母、数字、下划线','1','80','0','0','cn');
INSERT INTO met_language VALUES('988','columnImg2','栏目图片','1','74','0','0','cn');
INSERT INTO met_language VALUES('989','columnshow','添加内容','1','75','0','0','cn');
INSERT INTO met_language VALUES('990','columnhref','链接地址','1','71','5','0','cn');
INSERT INTO met_language VALUES('991','columntip7','链接到外部网站需要加http或https,如：https://www.metinfo.cn/','1','72','0','0','cn');
INSERT INTO met_language VALUES('992','columnImg1','标识图片','1','73','0','0','cn');
INSERT INTO met_language VALUES('993','columnSEO','搜索引擎优化设置(seo)','1','70','0','0','cn');
INSERT INTO met_language VALUES('994','columnhtmlname','静态页面名称','1','69','0','0','cn');
INSERT INTO met_language VALUES('995','columnaddOrder','顺序','1','68','0','0','cn');
INSERT INTO met_language VALUES('996','columnReverseSort','倒序','1','67','0','0','cn');
INSERT INTO met_language VALUES('997','columncontentorder','列表页排序方式','1','66','0','0','cn');
INSERT INTO met_language VALUES('998','columnnav4','都显示','1','63','0','0','cn');
INSERT INTO met_language VALUES('999','columnnewwindow','新窗口打开','1','64','0','0','cn');
INSERT INTO met_language VALUES('1000','columnnav3','尾部导航栏','1','62','0','0','cn');
INSERT INTO met_language VALUES('1001','columnnav2','头部主导航栏','1','61','0','0','cn');
INSERT INTO met_language VALUES('1002','columntip1','请参考','1','59','0','0','cn');
INSERT INTO met_language VALUES('1003','columnnav1','不显示','1','60','0','0','cn');
INSERT INTO met_language VALUES('1004','columnctitle','栏目标题(title)','1','53','0','0','cn');
INSERT INTO met_language VALUES('1005','columnstyle','栏目风格','1','56','0','0','cn');
INSERT INTO met_language VALUES('1006','columnmark','栏目标识','1','56','0','0','cn');
INSERT INTO met_language VALUES('1007','columndocument','目录名称','1','51','32','0','cn');
INSERT INTO met_language VALUES('1008','columnmodule','所属模块','1','50','5','0','cn');
INSERT INTO met_language VALUES('1009','columnnav','导航栏显示','1','49','0','0','cn');
INSERT INTO met_language VALUES('1010','columnnamemarkinfo','其它设置（根据模板配置说明设置）','1','48','0','0','cn');
INSERT INTO met_language VALUES('1011','columnnamemark','栏目修饰名称','1','47','3','0','cn');
INSERT INTO met_language VALUES('1012','columnname','栏目名称','1','46','0','0','cn');
INSERT INTO met_language VALUES('1013','addinfo','添加内容','1','38','0','0','cn');
INSERT INTO met_language VALUES('1014','downloadurl','下载地址','1','36','40','0','cn');
INSERT INTO met_language VALUES('1015','modpublish','发布人','1','29','0','0','cn');
INSERT INTO met_language VALUES('1016','modimgurls','缩略图','1','28','13','0','cn');
INSERT INTO met_language VALUES('1017','modimgurl','图片地址','1','26','13','0','cn');
INSERT INTO met_language VALUES('1018','modClass3','三级栏目','1','21','5','0','cn');
INSERT INTO met_language VALUES('1019','modClass2','二级栏目','1','20','5','0','cn');
INSERT INTO met_language VALUES('1020','mod101','图片列表','1','15','0','0','cn');
INSERT INTO met_language VALUES('1021','mod7','留言系统','1','8','0','0','cn');
INSERT INTO met_language VALUES('1022','mod8','反馈系统','1','9','0','0','cn');
INSERT INTO met_language VALUES('1023','mod9','友情链接','1','10','0','0','cn');
INSERT INTO met_language VALUES('1024','mod10','会员中心','1','11','0','0','cn');
INSERT INTO met_language VALUES('1025','mod11','全站搜索','1','12','0','0','cn');
INSERT INTO met_language VALUES('1026','mod12','网站地图','1','13','0','0','cn');
INSERT INTO met_language VALUES('1027','mod100','产品列表','1','14','0','0','cn');
INSERT INTO met_language VALUES('1028','unitytxt_77','更新内容时候自动更新网站地图','1','441','32','0','cn');
INSERT INTO met_language VALUES('1029','mod6','招聘系统','1','7','0','0','cn');
INSERT INTO met_language VALUES('1030','mod3','产品模块','1','4','0','0','cn');
INSERT INTO met_language VALUES('1031','mod4','下载模块','1','5','0','0','cn');
INSERT INTO met_language VALUES('1032','mod5','图片模块','1','6','0','0','cn');
INSERT INTO met_language VALUES('1033','mod2','文章模块','1','3','0','0','cn');
INSERT INTO met_language VALUES('1034','mod1','简介模块','1','2','0','0','cn');
INSERT INTO met_language VALUES('1035','modout','外部模块','1','1','0','0','cn');
INSERT INTO met_language VALUES('1036','please_choose','请选择','1','127','0','0','cn');
INSERT INTO met_language VALUES('1037','onlinetel','电话或其他说明','1','116','23','0','cn');
INSERT INTO met_language VALUES('1038','onlineskin','风格','1','114','23','0','cn');
INSERT INTO met_language VALUES('1039','onlineimg','图标','1','115','3','0','cn');
INSERT INTO met_language VALUES('1040','onlineskintype','颜色风格','1','113','23','0','cn');
INSERT INTO met_language VALUES('1041','setskinOnline9','固定于页面右边','1','102','23','0','cn');
INSERT INTO met_language VALUES('1042','setskinOnline5','距离浏览器侧边','1','98','23','0','cn');
INSERT INTO met_language VALUES('1043','setskinOnline6','距离浏览器顶部','1','99','23','0','cn');
INSERT INTO met_language VALUES('1044','setskinOnline3','居右随屏幕滚动','1','96','23','0','cn');
INSERT INTO met_language VALUES('1045','setskinOnline10','前台定位','1','96','23','0','cn');
INSERT INTO met_language VALUES('1046','indexflashaddflash','添加Banner','1','92','4','0','cn');
INSERT INTO met_language VALUES('1047','setskinOnline','在线交流方式','1','93','23','0','cn');
INSERT INTO met_language VALUES('1048','setskinOnline1','固定于页面左边','1','94','23','0','cn');
INSERT INTO met_language VALUES('1049','setskinOnline2','居左随屏幕滚动','1','95','23','0','cn');
INSERT INTO met_language VALUES('1050','indexflashexplain9','链接地址需加http://或https://，添加按钮并设置按钮链接后，此处必须为空','1','90','4','0','cn');
INSERT INTO met_language VALUES('1051','indexflashexplain4','多张图片建议保持图片大小一致','1','86','4','0','cn');
INSERT INTO met_language VALUES('1052','flashHome','网站首页','1','79','4','0','cn');
INSERT INTO met_language VALUES('1053','setflashImgHref','链接地址','1','68','4','0','cn');
INSERT INTO met_language VALUES('1054','setflashImgUrl','图片地址','1','67','4','0','cn');
INSERT INTO met_language VALUES('1055','setflashPixel','像素','1','65','0','0','cn');
INSERT INTO met_language VALUES('1056','setflashSize','Banner尺寸','1','63','4','0','cn');
INSERT INTO met_language VALUES('1057','setflashName','图片标题','1','61','0','0','cn');
INSERT INTO met_language VALUES('1058','indexsetFriendly','友情链接','1','55','0','0','cn');
INSERT INTO met_language VALUES('1059','skinstyle','风格','1','43','36','0','cn');
INSERT INTO met_language VALUES('1060','skinusenow','启用','1','40','0','0','cn');
INSERT INTO met_language VALUES('1061','skininfo','信息','1','42','3','0','cn');
INSERT INTO met_language VALUES('1062','skinuse','立即启用','1','39','0','0','cn');
INSERT INTO met_language VALUES('1063','settopcolumns','一级栏目','1','21','0','0','cn');
INSERT INTO met_language VALUES('1064','setskinproduct2','显示当前栏目下级栏目列表','1','17','0','0','cn');
INSERT INTO met_language VALUES('1065','setskinproduct1','显示栏目下所有信息列表','1','16','0','0','cn');
INSERT INTO met_language VALUES('1066','setskindatecontent','时间显示格式','1','14','0','0','cn');
INSERT INTO met_language VALUES('1067','setskinListPage','列表页','1','2','0','0','cn');
INSERT INTO met_language VALUES('1068','setbasicTip13','默认邮箱服务方式为TLS（可咨询邮箱服务商获得）<br />如果使用TLS方式25端口无法发送邮件，请尝试使用SSL方式465端口发件','1','422','39','0','cn');
INSERT INTO met_language VALUES('1069','setbasicSMTPWay','发送方式','1','420','39','0','cn');
INSERT INTO met_language VALUES('1070','setbasicTip12','用于邮件发送端口（咨询邮箱服务商获得，TLS一般为25，SSL一般为465）','1','421','39','0','cn');
INSERT INTO met_language VALUES('1071','setbasicSMTPPort','发送端口','1','419','39','0','cn');
INSERT INTO met_language VALUES('1072','password31','验证码已发送至指定号码','1','413','10','0','cn');
INSERT INTO met_language VALUES('1073','password30','邮箱找回密码功能不可用，请确保后台邮箱服务器设置正确','1','413','10','0','cn');
INSERT INTO met_language VALUES('1074','password29','用电子邮箱找回','1','412','10','0','cn');
INSERT INTO met_language VALUES('1075','password27','用手机号码找回','1','410','10','0','cn');
INSERT INTO met_language VALUES('1076','password25','新密码：','1','408','10','0','cn');
INSERT INTO met_language VALUES('1077','password26','再输入：','1','409','10','0','cn');
INSERT INTO met_language VALUES('1078','password20','下一步','1','403','0','0','cn');
INSERT INTO met_language VALUES('1079','password21','返回登录','1','404','10','0','cn');
INSERT INTO met_language VALUES('1080','password24','用户名：','1','407','10','0','cn');
INSERT INTO met_language VALUES('1081','password16','验证成功！请设置您新的密码。','1','399','10','0','cn');
INSERT INTO met_language VALUES('1082','password14','没有找到该用户的邮箱地址，请通过其它方式找回密码','1','397','10','0','cn');
INSERT INTO met_language VALUES('1083','password13','无法使用短信找回密码功能','1','396','10','0','cn');
INSERT INTO met_language VALUES('1084','password12','经过网关时，网络通讯异常可能会造成短信丢失，或者您会延时收到短信，请您耐心等待一下或稍后再试一下。','1','395','10','0','cn');
INSERT INTO met_language VALUES('1085','password11','请输入您手机接受到的短信校验码，然后点下一步。','1','394','10','0','cn');
INSERT INTO met_language VALUES('1086','password10','序号','1','393','10','0','cn');
INSERT INTO met_language VALUES('1087','password8','没有找到对应该手机的用户，请通过其它方式找回密码','1','391','10','0','cn');
INSERT INTO met_language VALUES('1088','password9','您请求重新设置密码，验证码','1','392','10','0','cn');
INSERT INTO met_language VALUES('1089','password7','没有找到该用户','1','390','10','0','cn');
INSERT INTO met_language VALUES('1090','password6','没有找到该用户的手机号码，请通过其它方式找回密码','1','389','10','0','cn');
INSERT INTO met_language VALUES('1091','password5','请输入管理员的电子邮箱地址：','1','388','10','0','cn');
INSERT INTO met_language VALUES('1092','password4','请输入管理员的电子邮箱地址。您会收到一封包含创建新密码链接的电子邮件。','1','387','10','0','cn');
INSERT INTO met_language VALUES('1093','password3','请输入管理员手机号码：','1','386','10','0','cn');
INSERT INTO met_language VALUES('1094','password2','请输入管理员手机号码，然后点下一步，您会收到一个短信校验码。','1','385','10','0','cn');
INSERT INTO met_language VALUES('1095','password1','请选择找回密码的方式：','1','384','10','0','cn');
INSERT INTO met_language VALUES('1096','loginid','用户名不能为空','1','22','18','0','cn');
INSERT INTO met_language VALUES('1097','lang64','中文(简体)','1','383','16','0','cn');
INSERT INTO met_language VALUES('1098','lang62','越南语','1','381','16','0','cn');
INSERT INTO met_language VALUES('1099','lang63','中文(繁体)','1','382','16','0','cn');
INSERT INTO met_language VALUES('1100','lang61','英语','1','380','16','0','cn');
INSERT INTO met_language VALUES('1101','lang60','印尼语','1','379','16','0','cn');
INSERT INTO met_language VALUES('1102','lang59','乌尔都语','1','378','16','0','cn');
INSERT INTO met_language VALUES('1103','lang54','意第绪语','1','373','16','0','cn');
INSERT INTO met_language VALUES('1104','lang53','意大利语','1','372','16','0','cn');
INSERT INTO met_language VALUES('1105','lang48','希腊语','1','367','16','0','cn');
INSERT INTO met_language VALUES('1106','lang49','西班牙的巴斯克语','1','368','16','0','cn');
INSERT INTO met_language VALUES('1107','lang50','西班牙语','1','369','16','0','cn');
INSERT INTO met_language VALUES('1108','lang51','匈牙利语','1','370','16','0','cn');
INSERT INTO met_language VALUES('1109','lang47','希伯来语','1','366','16','0','cn');
INSERT INTO met_language VALUES('1110','lang46','乌克兰语','1','365','16','0','cn');
INSERT INTO met_language VALUES('1111','lang45','威尔士语','1','364','16','0','cn');
INSERT INTO met_language VALUES('1112','lang43','泰语','1','362','16','0','cn');
INSERT INTO met_language VALUES('1113','lang44','土耳其语','1','363','16','0','cn');
INSERT INTO met_language VALUES('1114','lang42','斯瓦希里语','1','361','16','0','cn');
INSERT INTO met_language VALUES('1115','lang37','日语','1','356','16','0','cn');
INSERT INTO met_language VALUES('1116','lang38','瑞典语','1','357','16','0','cn');
INSERT INTO met_language VALUES('1117','lang39','塞尔维亚语','1','358','16','0','cn');
INSERT INTO met_language VALUES('1118','lang40','斯洛伐克语','1','359','16','0','cn');
INSERT INTO met_language VALUES('1119','lang41','斯洛文尼亚语','1','360','16','0','cn');
INSERT INTO met_language VALUES('1120','lang36','葡萄牙语','1','355','16','0','cn');
INSERT INTO met_language VALUES('1121','lang35','挪威语','1','354','16','0','cn');
INSERT INTO met_language VALUES('1122','lang33','马其顿语','1','352','16','0','cn');
INSERT INTO met_language VALUES('1123','lang32','马来语','1','351','16','0','cn');
INSERT INTO met_language VALUES('1124','lang31','马耳他语','1','350','16','0','cn');
INSERT INTO met_language VALUES('1125','lang30','罗马尼亚语','1','349','16','0','cn');
INSERT INTO met_language VALUES('1126','lang29','立陶宛语','1','348','16','0','cn');
INSERT INTO met_language VALUES('1127','lang28','拉脱维亚语','1','347','16','0','cn');
INSERT INTO met_language VALUES('1128','lang27','拉丁语','1','346','16','0','cn');
INSERT INTO met_language VALUES('1129','lang26','克罗地亚语','1','345','16','0','cn');
INSERT INTO met_language VALUES('1130','lang25','捷克语','1','344','16','0','cn');
INSERT INTO met_language VALUES('1131','lang24','加泰罗尼亚语','1','343','16','0','cn');
INSERT INTO met_language VALUES('1132','lang23','加利西亚语','1','342','16','0','cn');
INSERT INTO met_language VALUES('1133','lang22','荷兰语','1','341','16','0','cn');
INSERT INTO met_language VALUES('1134','lang21','韩语','1','340','16','0','cn');
INSERT INTO met_language VALUES('1135','lang20','海地克里奥尔语','1','339','16','0','cn');
INSERT INTO met_language VALUES('1136','lang17','芬兰语','1','336','16','0','cn');
INSERT INTO met_language VALUES('1137','lang16','菲律宾语','1','335','16','0','cn');
INSERT INTO met_language VALUES('1138','lang14','俄语','1','333','16','0','cn');
INSERT INTO met_language VALUES('1139','lang11','布尔语(南非荷兰语)','1','330','16','0','cn');
INSERT INTO met_language VALUES('1140','lang15','法语','1','334','16','0','cn');
INSERT INTO met_language VALUES('1141','lang12','丹麦语','1','331','16','0','cn');
INSERT INTO met_language VALUES('1142','lang13','德语','1','332','16','0','cn');
INSERT INTO met_language VALUES('1143','lang3','阿塞拜疆语','1','322','16','0','cn');
INSERT INTO met_language VALUES('1144','lang4','爱尔兰语','1','323','16','0','cn');
INSERT INTO met_language VALUES('1145','lang5','爱沙尼亚语','1','324','16','0','cn');
INSERT INTO met_language VALUES('1146','lang6','白俄罗斯语','1','325','16','0','cn');
INSERT INTO met_language VALUES('1147','lang7','保加利亚语','1','326','16','0','cn');
INSERT INTO met_language VALUES('1148','lang8','冰岛语','1','327','16','0','cn');
INSERT INTO met_language VALUES('1149','lang9','波兰语','1','328','16','0','cn');
INSERT INTO met_language VALUES('1150','lang10','波斯语','1','329','16','0','cn');
INSERT INTO met_language VALUES('1151','lang2','阿拉伯语','1','321','16','0','cn');
INSERT INTO met_language VALUES('1152','lang1','阿尔巴尼亚语','1','320','16','0','cn');
INSERT INTO met_language VALUES('1153','langselect','选择语言','1','318','0','0','cn');
INSERT INTO met_language VALUES('1154','langselect1','请选择语言','1','319','16','0','cn');
INSERT INTO met_language VALUES('1155','langwebmanage','网站语言','1','316','16','0','cn');
INSERT INTO met_language VALUES('1156','langexplain6','复制本地语言包','1','307','16','0','cn');
INSERT INTO met_language VALUES('1157','langexplain5','在线下载','1','308','1','0','cn');
INSERT INTO met_language VALUES('1158','langexplain4','复制已经有语言的基础语言包，譬如复制英文，则新语言的前台部分文字会是英文。','1','305','16','0','cn');
INSERT INTO met_language VALUES('1159','langexplain2','语言标识','1','303','16','0','cn');
INSERT INTO met_language VALUES('1160','langexplain1','对应前台网站页面部分文字，注意不要加特殊符号，点击底部保存按钮后生效。(参数名：值)','1','302','16','0','cn');
INSERT INTO met_language VALUES('1161','langexplain_admin','对应后台网站页面部分文字，注意不要加特殊符号，点击底部保存按钮后生效。(参数名：值)','1','302','16','0','cn');
INSERT INTO met_language VALUES('1162','upfiletips35','商业授权','1','293','2','0','cn');
INSERT INTO met_language VALUES('1163','upfiletips37','新闻','1','295','14','0','cn');
INSERT INTO met_language VALUES('1164','upfiletips38','服务器信息','1','296','37','0','cn');
INSERT INTO met_language VALUES('1165','upfiletips25','回收站','1','283','19','0','cn');
INSERT INTO met_language VALUES('1166','upfiletips24','前台的反馈、留言和简历提交','1','282','30','0','cn');
INSERT INTO met_language VALUES('1167','upfiletips20','拉伸','1','278','13','0','cn');
INSERT INTO met_language VALUES('1168','upfiletips21','留白','1','279','13','0','cn');
INSERT INTO met_language VALUES('1169','upfiletips22','裁剪','1','280','13','0','cn');
INSERT INTO met_language VALUES('1170','upfiletips23','生成方式','1','281','13','0','cn');
INSERT INTO met_language VALUES('1171','upfiletips19','水印','1','277','13','0','cn');
INSERT INTO met_language VALUES('1172','upfiletips16','发送测试','1','274','39','0','cn');
INSERT INTO met_language VALUES('1173','upfiletips15','100字以内','1','273','39','0','cn');
INSERT INTO met_language VALUES('1174','upfiletips14','网站描述','1','272','39','0','cn');
INSERT INTO met_language VALUES('1175','upfiletips13','多个关键词请用英文状态下的逗号 \",\" 隔开，建议3到4个关键词。','1','271','39','0','cn');
INSERT INTO met_language VALUES('1176','upfiletips10','6.0.0以上版本无需手动设置，当前登录的网址是：','1','268','39','0','cn');
INSERT INTO met_language VALUES('1177','upfiletips6','录入','1','264','0','0','cn');
INSERT INTO met_language VALUES('1178','upfiletips7','基本信息','1','265','0','0','cn');
INSERT INTO met_language VALUES('1179','upfiletips2','文件管理器','1','260','0','0','cn');
INSERT INTO met_language VALUES('1180','upfiletips1','查看文件列表','1','259','0','0','cn');
INSERT INTO met_language VALUES('1181','dataexplain10','数据库备份','1','256','8','0','cn');
INSERT INTO met_language VALUES('1182','dataexplain7','<span style=float:right;>一般在搬家时用，占用较大空间</span>备份数据和文件（数据库、用户文件、程序文件）','1','253','8','0','cn');
INSERT INTO met_language VALUES('1183','dataexplain6','<span style=float:right;>一般不用备份，占用较大空间</span>备份上传的文件（图片、文档等）','1','252','8','0','cn');
INSERT INTO met_language VALUES('1184','dataexplain5','<span style=float:right;>建议每月备份，占用少量空间</span>备份数据（不含上传的文件）','1','251','8','0','cn');
INSERT INTO met_language VALUES('1185','dataexplain2','可以上传数据库备份文件，支持sql或zip','1','248','8','0','cn');
INSERT INTO met_language VALUES('1186','dataexplain1','目前没有数据','1','247','8','0','cn');
INSERT INTO met_language VALUES('1187','databackup8','压缩整站','1','245','8','0','cn');
INSERT INTO met_language VALUES('1188','databackup6','上传文件夹备份','1','243','8','0','cn');
INSERT INTO met_language VALUES('1189','databackup2','恢复','1','239','8','0','cn');
INSERT INTO met_language VALUES('1190','databackup3','下载','1','240','8','0','cn');
INSERT INTO met_language VALUES('1191','databackup4','备份','1','241','8','0','cn');
INSERT INTO met_language VALUES('1192','setimgTopMid','顶中','1','233','13','0','cn');
INSERT INTO met_language VALUES('1193','setimgLowMid','底中','1','235','13','0','cn');
INSERT INTO met_language VALUES('1194','setimgRightMid','右中','1','234','13','0','cn');
INSERT INTO met_language VALUES('1195','setimgLeftLow','左下','1','232','13','0','cn');
INSERT INTO met_language VALUES('1196','setimgRightLow','右下','1','231','13','0','cn');
INSERT INTO met_language VALUES('1197','setimgRightTop','右上','1','230','13','0','cn');
INSERT INTO met_language VALUES('1198','setimgLeftTop','左上','1','229','13','0','cn');
INSERT INTO met_language VALUES('1199','setimgMid','中间','1','228','13','0','cn');
INSERT INTO met_language VALUES('1200','setimgPosition','水印位置','1','227','13','0','cn');
INSERT INTO met_language VALUES('1201','setimgWordAngle','水印文字角度','1','199','0','0','cn');
INSERT INTO met_language VALUES('1202','setimgTip5','水平为0','1','200','0','0','cn');
INSERT INTO met_language VALUES('1203','setimgWordColor','水印文字颜色','1','201','0','0','cn');
INSERT INTO met_language VALUES('1204','setimgTip4','请上传.ttf格式的字体文件','1','198','13','0','cn');
INSERT INTO met_language VALUES('1205','setimgWordFont','水印文字字体','1','197','13','0','cn');
INSERT INTO met_language VALUES('1206','setimgWordSize2','大图水印文字大小','1','196','13','0','cn');
INSERT INTO met_language VALUES('1207','setimgWord','水印文字','1','193','13','0','cn');
INSERT INTO met_language VALUES('1208','setimgTip3','不支持中文（中文水印需要下载中文字体才能支持）','1','194','13','0','cn');
INSERT INTO met_language VALUES('1209','setimgWordSize','缩略图水印文字大小','1','195','13','0','cn');
INSERT INTO met_language VALUES('1210','setimgImgWatermark','图片水印','1','189','13','0','cn');
INSERT INTO met_language VALUES('1211','setimgImg','缩略图水印图片','1','190','13','0','cn');
INSERT INTO met_language VALUES('1212','setimgImg2','大图水印图片','1','191','13','0','cn');
INSERT INTO met_language VALUES('1213','setimgTip2','仅支持.jpg|.png格式','1','192','13','0','cn');
INSERT INTO met_language VALUES('1214','setimgWatermarkType','水印类型','1','187','13','0','cn');
INSERT INTO met_language VALUES('1215','setimgWordWatermark','文字水印','1','188','13','0','cn');
INSERT INTO met_language VALUES('1216','setimgThumb','缩略图添加水印','1','186','13','0','cn');
INSERT INTO met_language VALUES('1217','setimgWatermark','添加范围','1','184','13','0','cn');
INSERT INTO met_language VALUES('1218','setimgBigImg','详细大图添加水印','1','185','13','0','cn');
INSERT INTO met_language VALUES('1219','setimgrename2','重命名文件名称有利于减少异常','1','183','30','0','cn');
INSERT INTO met_language VALUES('1220','setimgrename','自动重命名','1','181','30','0','cn');
INSERT INTO met_language VALUES('1221','setimgrename1','对上传的文件名自动进行重命名','1','182','30','0','cn');
INSERT INTO met_language VALUES('1222','setimgWater','自动生成','1','179','0','0','cn');
INSERT INTO met_language VALUES('1223','setimgHeight','高','1','176','0','0','cn');
INSERT INTO met_language VALUES('1224','setimgPixel','像素','1','175','0','0','cn');
INSERT INTO met_language VALUES('1225','setimgWidth','宽','1','174','0','0','cn');
INSERT INTO met_language VALUES('1226','authTip2','您所输入的商业注册码与域名不匹配！','1','160','0','0','cn');
INSERT INTO met_language VALUES('1227','authKey','密钥','1','158','0','0','cn');
INSERT INTO met_language VALUES('1228','authAuthorizedCode','授权码','1','159','0','0','cn');
INSERT INTO met_language VALUES('1229','setfilesize','文件大小','1','134','0','0','cn');
INSERT INTO met_language VALUES('1230','setsafemember','前台提交验证码','1','127','30','0','cn');
INSERT INTO met_language VALUES('1231','setsafeadmin','后台登录验证码','1','126','30','0','cn');
INSERT INTO met_language VALUES('1232','info_security_statement','信息安全声明','1','126','30','0','cn');
INSERT INTO met_language VALUES('1233','info_security_statement_switch','开启信息安全声明','1','126','30','0','cn');
INSERT INTO met_language VALUES('1234','info_security_statement_modal_title','安全声明弹框标题','1','126','30','0','cn');
INSERT INTO met_language VALUES('1235','info_security_statement_title','安全声明标题','1','126','30','0','cn');
INSERT INTO met_language VALUES('1236','info_security_statement_content','安全声明内容','1','126','30','0','cn');
INSERT INTO met_language VALUES('1237','info_security_statement_tips1','当收集用户信息时提示用户阅读信息安全声明','1','126','30','0','cn');
INSERT INTO met_language VALUES('1238','setsafeupdate','删除升级文件','1','124','30','0','cn');
INSERT INTO met_language VALUES('1239','setsafeupdate1','删除后可以增强网站的安全性能','1','125','30','0','cn');
INSERT INTO met_language VALUES('1240','setsafeinstall','删除安装文件','1','123','30','0','cn');
INSERT INTO met_language VALUES('1241','setsafeadminname1c','仅创始人可修改，不支持中文，部分空间修改文件名称后需要通过FTP手动修改文件夹名称，当前后台网址：','1','122','30','0','cn');
INSERT INTO met_language VALUES('1242','setsafeadminname','后台文件夹名称','1','118','30','0','cn');
INSERT INTO met_language VALUES('1243','setsafeadminname1','安全建议:','1','119','30','0','cn');
INSERT INTO met_language VALUES('1244','setdbNotExist','文件不存在','1','114','30','0','cn');
INSERT INTO met_language VALUES('1245','setdbArchiveOK','压缩成功','1','115','8','0','cn');
INSERT INTO met_language VALUES('1246','setdbImportOK','导入成功','1','111','8','0','cn');
INSERT INTO met_language VALUES('1247','setdbBackupOK','数据库备份完毕!','1','109','8','0','cn');
INSERT INTO met_language VALUES('1248','setBackuoNo','备份失败','1','109','8','0','cn');
INSERT INTO met_language VALUES('1249','setBackuoDiskFull','磁盘空间不足','1','109','8','0','cn');
INSERT INTO met_language VALUES('1250','setdbTip2','数据无法备份到服务器!请检查','1','104','8','0','cn');
INSERT INTO met_language VALUES('1251','setdbTip3','目录是否可写。','1','105','8','0','cn');
INSERT INTO met_language VALUES('1252','setdbImportData','导入','1','101','8','0','cn');
INSERT INTO met_language VALUES('1253','setdbLack','缺少分卷','1','100','8','0','cn');
INSERT INTO met_language VALUES('1254','setdbFilesize','文件大小','1','97','8','0','cn');
INSERT INTO met_language VALUES('1255','setdbTime','备份时间','1','98','8','0','cn');
INSERT INTO met_language VALUES('1256','setdbNumber','分卷数','1','99','8','0','cn');
INSERT INTO met_language VALUES('1257','setdbsysver','系统版本','1','96','8','0','cn');
INSERT INTO met_language VALUES('1258','setdbFilename','文件名','1','95','8','0','cn');
INSERT INTO met_language VALUES('1259','setdbImport','导入备份数据','1','88','8','0','cn');
INSERT INTO met_language VALUES('1260','langshuom','说明','1','86','3','0','cn');
INSERT INTO met_language VALUES('1261','langtype','语言状态','1','85','0','0','cn');
INSERT INTO met_language VALUES('1262','langnameorder','不可以与其他语言排序重复','1','80','16','0','cn');
INSERT INTO met_language VALUES('1263','langnamerepeat','语言标识不能重复','1','81','16','0','cn');
INSERT INTO met_language VALUES('1264','langone','系统只有一种语言，不能被删除！','1','82','16','0','cn');
INSERT INTO met_language VALUES('1265','langnamenull','语言名称不能为空','1','77','16','0','cn');
INSERT INTO met_language VALUES('1266','langouturlinfo','务必包含http://或https://，访问该域名程序将自动跳转到此语言（需先做好域名解析绑定），或者做外部链接用。','1','74','16','0','cn');
INSERT INTO met_language VALUES('1267','langnewwindows','新窗口打开','1','75','16','0','cn');
INSERT INTO met_language VALUES('1268','langmarkinfo','请用英文字母，如 cn ，不可以与其他语言标识重复','1','71','16','0','cn');
INSERT INTO met_language VALUES('1269','langurlinfo','网站被访问时默认展示的网站语言','1','69','16','0','cn');
INSERT INTO met_language VALUES('1270','langurlinfo1','网站后台被访问时默认展示的网站语言','1','69','16','0','cn');
INSERT INTO met_language VALUES('1271','langorderinfo','不可以重复','1','70','16','0','cn');
INSERT INTO met_language VALUES('1272','langadminyes','管理员在登录前可以选择后台语言','1','66','16','0','cn');
INSERT INTO met_language VALUES('1273','langsw','语言切换','1','68','16','0','cn');
INSERT INTO met_language VALUES('1274','langhome','默认语言','1','63','16','0','cn');
INSERT INTO met_language VALUES('1275','langchok','一般以链接形式显示在前台右上角，开启后请到可视化界面的头部区块设置中开启语言按钮显示开关','1','62','16','0','cn');
INSERT INTO met_language VALUES('1276','langch','简繁体自动切换','1','60','16','0','cn');
INSERT INTO met_language VALUES('1277','langwebeditor','编辑参数','1','58','16','0','cn');
INSERT INTO met_language VALUES('1278','langmark','语言标识','1','54','0','0','cn');
INSERT INTO met_language VALUES('1279','langouturl','独立域名','1','55','16','0','cn');
INSERT INTO met_language VALUES('1280','langpara','插件语言','1','57','16','0','cn');
INSERT INTO met_language VALUES('1281','langflag','国旗标志','1','53','16','0','cn');
INSERT INTO met_language VALUES('1282','langname','语言名称','1','52','16','0','cn');
INSERT INTO met_language VALUES('1283','langadd','添加新语言','1','50','16','0','cn');
INSERT INTO met_language VALUES('1284','langweb','网站语言','1','49','0','0','cn');
INSERT INTO met_language VALUES('1285','langadmin','后台语言','1','49','0','0','cn');
INSERT INTO met_language VALUES('1286','setbasicTip11','用于发送邮件的邮箱密码','1','47','39','0','cn');
INSERT INTO met_language VALUES('1287','setbasicTip10','如QQ邮箱为smtp.qq.com','1','45','39','0','cn');
INSERT INTO met_language VALUES('1288','setbasicSMTPPassword','邮箱密码','1','46','39','0','cn');
INSERT INTO met_language VALUES('1289','setbasicSMTPServer','SMTP','1','44','39','0','cn');
INSERT INTO met_language VALUES('1290','setbasicTip8','用于发送邮件的邮箱账号','1','43','39','0','cn');
INSERT INTO met_language VALUES('1291','setbasicEmailAccount','邮箱账号','1','42','39','0','cn');
INSERT INTO met_language VALUES('1292','setbasicTip7','所显示的发件人姓名','1','41','39','0','cn');
INSERT INTO met_language VALUES('1293','setbasicTip5','多个请用“|”隔开','1','33','30','0','cn');
INSERT INTO met_language VALUES('1294','setbasicTip6','发件箱设置（站内所有邮件均由此邮箱发送，如会员密码找回邮件等）','1','34','39','0','cn');
INSERT INTO met_language VALUES('1295','setbasicFromName','发件人','1','35','39','0','cn');
INSERT INTO met_language VALUES('1296','setbasicEnableFormat','允许上传的文件格式','1','32','30','0','cn');
INSERT INTO met_language VALUES('1297','setbasicUploadMax','文件上传最大值','1','31','30','0','cn');
INSERT INTO met_language VALUES('1298','setbasicWebName','网站名称','1','29','39','0','cn');
INSERT INTO met_language VALUES('1299','setbasicWebInfoSet','网站基本信息设置','1','28','0','0','cn');
INSERT INTO met_language VALUES('1300','reserved','版权所有','1','24','37','0','cn');
INSERT INTO met_language VALUES('1301','copyright','长沙米拓信息技术有限公司（MetInfo Inc.）','1','25','0','0','cn');
INSERT INTO met_language VALUES('1302','setbasicTip14','gmail邮箱需要空间支持SSL，请开启SSL，或换成其他邮箱！！！','1','429','39','0','cn');
INSERT INTO met_language VALUES('1303','setbasicTip15','空间不支持SSL方式发送邮件，请开启SSL，或换成TLS方式！！！','1','430','39','0','cn');
INSERT INTO met_language VALUES('1304','feedbackautosms','短信回复设置','1','177','0','0','cn');
INSERT INTO met_language VALUES('1305','fdincAutosms','短信回复','1','178','0','0','cn');
INSERT INTO met_language VALUES('1306','fdincAutoContentsms','回复短信内容','1','179','0','0','cn');
INSERT INTO met_language VALUES('1307','fdincTipsms','勾选后将自动向用户回复短信','1','180','0','0','cn');
INSERT INTO met_language VALUES('1308','fdinctellsms','联系电话字段名','1','181','0','0','cn');
INSERT INTO met_language VALUES('1309','fdinctells','用于获取用户的联系电话，以便回复短信。字段类型必须为“电话”','1','182','0','0','cn');
INSERT INTO met_language VALUES('1310','hotsearches','热门搜索','1','431','16','0','cn');
INSERT INTO met_language VALUES('1311','updatenow','立即升级','1','437','0','0','cn');
INSERT INTO met_language VALUES('1312','updatelater','稍后升级','1','438','0','0','cn');
INSERT INTO met_language VALUES('1313','tag','TAG标签','1','434','0','0','cn');
INSERT INTO met_language VALUES('1314','displaytype','前台显示','1','183','0','0','cn');
INSERT INTO met_language VALUES('1315','checkupdate','检测更新','1','439','0','0','cn');
INSERT INTO met_language VALUES('1316','checkupdatetips','对不起！您的权限不够，无法操作在线升级。','1','440','0','0','cn');
INSERT INTO met_language VALUES('1317','paraname','名称','1','187','0','0','cn');
INSERT INTO met_language VALUES('1318','message_name','姓名字段名','1','240','20','0','cn');
INSERT INTO met_language VALUES('1319','message_name1','用于获取用户的姓名，字段类型必须为“简短”','1','241','20','0','cn');
INSERT INTO met_language VALUES('1320','message_content','留言内容字段名','1','242','20','0','cn');
INSERT INTO met_language VALUES('1321','message_content1','用于获取用户的留言内容，字段类型必须为“文本”','1','243','20','0','cn');
INSERT INTO met_language VALUES('1322','message_AcceptMail','留言邮件接收邮箱','1','244','20','0','cn');
INSERT INTO met_language VALUES('1323','column_searchname','请输入栏目名称','1','246','0','0','cn');
INSERT INTO met_language VALUES('1324','jsx38','您没有完全控制权限，请联系管理员开通','1','446','0','0','cn');
INSERT INTO met_language VALUES('1325','formerror1','请填写此字段。','1','0','0','0','cn');
INSERT INTO met_language VALUES('1326','formerror2','请从这些选项中选择一个。','1','0','0','0','cn');
INSERT INTO met_language VALUES('1327','formerror3','请输入正确的手机号码。','1','0','0','0','cn');
INSERT INTO met_language VALUES('1328','formerror4','请输入正确的Email地址。','1','0','0','0','cn');
INSERT INTO met_language VALUES('1329','formerror5','两次输入的密码不一致，请重新输入。','1','0','0','0','cn');
INSERT INTO met_language VALUES('1330','formerror6','请输入至少&metinfo&个字符。','1','0','0','0','cn');
INSERT INTO met_language VALUES('1331','formerror7','输入不能超过&metinfo&个字符。','1','0','0','0','cn');
INSERT INTO met_language VALUES('1332','formerror8','输入的字符数必须在&metinfo&之间。','1','0','0','0','cn');
INSERT INTO met_language VALUES('1333','style_settings','风格设置','1','0','0','0','cn');
INSERT INTO met_language VALUES('1334','All_empty_message','清空全部消息','1','0','0','0','cn');
INSERT INTO met_language VALUES('1335','manually_static_rules','部分空间需要手动设置伪静态规则文件','1','0','32','0','cn');
INSERT INTO met_language VALUES('1336','pseudo_static','查看伪静态规则','1','0','32','0','cn');
INSERT INTO met_language VALUES('1337','sys_static','伪静态化','1','0','32','0','cn');
INSERT INTO met_language VALUES('1338','anchor_textadd','添加锚文本','1','0','11','0','cn');
INSERT INTO met_language VALUES('1339','applies_paper','仅作用于前台页面中的内容文字，比如文章详情页内容文字。','1','0','32','0','cn');
INSERT INTO met_language VALUES('1340','configuration_section','配置栏目','1','0','0','0','cn');
INSERT INTO met_language VALUES('1341','template_code1','请输入模板编号','1','0','3','0','cn');
INSERT INTO met_language VALUES('1342','industry_segments','行业细分','1','0','3','0','cn');
INSERT INTO met_language VALUES('1343','color_filter','颜色筛选','1','0','3','0','cn');
INSERT INTO met_language VALUES('1344','industry_screening','行业筛选','1','0','3','0','cn');
INSERT INTO met_language VALUES('1345','set_password','第三步：设置支付密码','1','0','3','0','cn');
INSERT INTO met_language VALUES('1346','login_password','位。付费购买应用时需要输入支付密码，请不要与登录密码一致。','1','0','3','0','cn');
INSERT INTO met_language VALUES('1347','services_future','可用于找回密码以及获取应用市场未来提供的更多服务','1','0','3','0','cn');
INSERT INTO met_language VALUES('1348','personal_information','第二步：设置个人信息','1','0','3','0','cn');
INSERT INTO met_language VALUES('1349','sys_password','登录密码','1','0','3','0','cn');
INSERT INTO met_language VALUES('1350','create_account','第一步：创建账户','1','0','3','0','cn');
INSERT INTO met_language VALUES('1351','buy_time','购买时间','1','0','3','0','cn');
INSERT INTO met_language VALUES('1352','please_click','支付成功，请点击！！','1','0','3','0','cn');
INSERT INTO met_language VALUES('1353','payment_method','请选择支付方式','1','0','3','0','cn');
INSERT INTO met_language VALUES('1354','sys_unionpay','银联','1','0','3','0','cn');
INSERT INTO met_language VALUES('1355','enter_amount','请输入充值金额','1','0','3','0','cn');
INSERT INTO met_language VALUES('1356','payment_amount','支付金额','1','0','3','0','cn');
INSERT INTO met_language VALUES('1357','account_Settings','用户中心','1','0','3','0','cn');
INSERT INTO met_language VALUES('1358','consumption_record','消费记录','1','0','3','0','cn');
INSERT INTO met_language VALUES('1359','website_manually','登录成功后您的网站将永久自动登录此帐号，除非手动退出。','1','0','3','0','cn');
INSERT INTO met_language VALUES('1360','application_market','登录米拓用户中心','1','0','3','0','cn');
INSERT INTO met_language VALUES('1361','installations','安装量','1','0','0','0','cn');
INSERT INTO met_language VALUES('1362','goods_comment','购买商品后才能评论','1','0','3','0','cn');
INSERT INTO met_language VALUES('1363','product_commented','同一个产品最多评论3次','1','0','3','0','cn');
INSERT INTO met_language VALUES('1364','password_mistake','支付密码错误','1','0','3','0','cn');
INSERT INTO met_language VALUES('1365','please_again','请先登录应用商店；应用商店可使用米拓官网用户账号登录，无需重复注册！','1','0','3','0','cn');
INSERT INTO met_language VALUES('1366','have_bought','已购买','1','0','3','0','cn');
INSERT INTO met_language VALUES('1367','download_application','当前系统无法下载此应用，请升级系统','1','0','3','0','cn');
INSERT INTO met_language VALUES('1368','sys_evaluation','评价成功！感谢您的评价！','1','0','3','0','cn');
INSERT INTO met_language VALUES('1369','downloads','开始下载','1','0','3','0','cn');
INSERT INTO met_language VALUES('1370','click_rating','请点击星形评分！','1','0','3','0','cn');
INSERT INTO met_language VALUES('1371','payment_password','新支付密码','1','0','3','0','cn');
INSERT INTO met_language VALUES('1372','original_password1','请输入原支付密码','1','0','3','0','cn');
INSERT INTO met_language VALUES('1373','original_password','原支付密码','1','0','3','0','cn');
INSERT INTO met_language VALUES('1374','password_length','密码长度','1','0','3','0','cn');
INSERT INTO met_language VALUES('1375','please_enter','请输入新密码','1','0','3','0','cn');
INSERT INTO met_language VALUES('1376','login_password_new','新登录密码','1','0','3','0','cn');
INSERT INTO met_language VALUES('1377','original_passwords1','请输入原密码','1','0','3','0','cn');
INSERT INTO met_language VALUES('1378','original_passwords','原登录密码','1','0','3','0','cn');
INSERT INTO met_language VALUES('1379','account_password','请填写应用市场账户登录密码，而不是网站登录密码。','1','0','3','0','cn');
INSERT INTO met_language VALUES('1380','please_password','请输入登录密码','1','0','3','0','cn');
INSERT INTO met_language VALUES('1381','login_password1','您必须填写登录密码才能修改资料','1','0','3','0','cn');
INSERT INTO met_language VALUES('1382','popular_template','热门模板','1','0','3','0','cn');
INSERT INTO met_language VALUES('1383','popular_application','热门应用','1','0','3','0','cn');
INSERT INTO met_language VALUES('1384','number_installation','安装次数','1','0','3','0','cn');
INSERT INTO met_language VALUES('1385','application_name','应用名称','1','0','3','0','cn');
INSERT INTO met_language VALUES('1386','introduction_developers','开发者简介','1','0','3','0','cn');
INSERT INTO met_language VALUES('1387','sys_head','头像','1','0','3','0','cn');
INSERT INTO met_language VALUES('1388','name_developers','开发者名称','1','0','3','0','cn');
INSERT INTO met_language VALUES('1389','dont_fill','可不填','1','0','3','0','cn');
INSERT INTO met_language VALUES('1390','mouse_click_rating','鼠标放到星形上点击评分','1','0','3','0','cn');
INSERT INTO met_language VALUES('1391','score','评分','1','0','3','0','cn');
INSERT INTO met_language VALUES('1392','want_comment','我要评论','1','0','3','0','cn');
INSERT INTO met_language VALUES('1393','back','上页','1','0','1','0','cn');
INSERT INTO met_language VALUES('1394','running_environment','运行环境','1','0','3','0','cn');
INSERT INTO met_language VALUES('1395','updated_date','更新日期','1','0','3','0','cn');
INSERT INTO met_language VALUES('1396','online_presentation','在线演示','1','0','3','0','cn');
INSERT INTO met_language VALUES('1397','screenshots','截图','1','0','3','0','cn');
INSERT INTO met_language VALUES('1398','is_introduced','介绍','1','0','3','0','cn');
INSERT INTO met_language VALUES('1399','comments','评论','1','0','3','0','cn');
INSERT INTO met_language VALUES('1400','evaluation','人评价）','1','0','3','0','cn');
INSERT INTO met_language VALUES('1401','total_of','（共','1','0','3','0','cn');
INSERT INTO met_language VALUES('1402','pay_password','支付密码','1','0','3','0','cn');
INSERT INTO met_language VALUES('1403','temporary_access1','请输入临时访问域名，必须是三级域名。','1','0','3','0','cn');
INSERT INTO met_language VALUES('1404','temporary_access','临时访问域名','1','0','3','0','cn');
INSERT INTO met_language VALUES('1405','top_domain_names','顶级域名','1','0','3','0','cn');
INSERT INTO met_language VALUES('1406','buy_template_must','购买后程序将自动获取当前网站域名并进行绑定，以后此模板只能用于绑定域名下使用。','1','0','3','0','cn');
INSERT INTO met_language VALUES('1407','amount_of','金额','1','0','3','0','cn');
INSERT INTO met_language VALUES('1408','purchase_program','购买项目','1','0','3','0','cn');
INSERT INTO met_language VALUES('1409','success_payment','支付成功后，请点击此链接跳转！！','1','0','3','0','cn');
INSERT INTO met_language VALUES('1410','latest_version','已是最新版','1','0','1','0','cn');
INSERT INTO met_language VALUES('1411','pay_success','支付成功','1','0','3','0','cn');
INSERT INTO met_language VALUES('1412','be_updated','可更新至','1','0','1','0','cn');
INSERT INTO met_language VALUES('1413','update_log','关于系统','1','0','37','0','cn');
INSERT INTO met_language VALUES('1414','current_version','当前版本','1','0','37','0','cn');
INSERT INTO met_language VALUES('1415','program_information','程序信息','1','0','37','0','cn');
INSERT INTO met_language VALUES('1416','system_maintenance','系统维护中','1','0','0','0','cn');
INSERT INTO met_language VALUES('1417','permission_download','没有权限下载','1','0','3','0','cn');
INSERT INTO met_language VALUES('1418','link_remote','链接不上远程服务器','1','0','0','0','cn');
INSERT INTO met_language VALUES('1419','try_again','重试','1','0','0','0','cn');
INSERT INTO met_language VALUES('1420','give_installation','放弃安装','1','0','0','0','cn');
INSERT INTO met_language VALUES('1421','configuratio_template','配置模板','1','0','0','0','cn');
INSERT INTO met_language VALUES('1422','seconds_background','秒好后刷新后台','1','0','0','0','cn');
INSERT INTO met_language VALUES('1423','installation_complete','安装完成','1','0','0','0','cn');
INSERT INTO met_language VALUES('1424','installation','安装中','1','0','0','0','cn');
INSERT INTO met_language VALUES('1425','possible_reasons','可能原因','1','0','0','0','cn');
INSERT INTO met_language VALUES('1426','download_interrupt','文件下载中断','1','0','0','0','cn');
INSERT INTO met_language VALUES('1427','write_permission','文件没有写权限或其新建的子文件夹没有写权限','1','0','0','0','cn');
INSERT INTO met_language VALUES('1428','download','下载中','1','0','0','0','cn');
INSERT INTO met_language VALUES('1429','following_documents','下列文件没有修改权限，无法进行升级操作！','1','0','0','0','cn');
INSERT INTO met_language VALUES('1430','document_upgrade','系统升级文档','1','0','0','0','cn');
INSERT INTO met_language VALUES('1431','file_permissions','文件权限检测中','1','0','0','0','cn');
INSERT INTO met_language VALUES('1432','anchor_text','站内锚文本','1','0','11','0','cn');
INSERT INTO met_language VALUES('1433','please_select','请选择栏目','1','0','0','0','cn');
INSERT INTO met_language VALUES('1434','log_successfully','登录成功','1','0','0','0','cn');
INSERT INTO met_language VALUES('1435','out_of_success','退出成功','1','0','3','0','cn');
INSERT INTO met_language VALUES('1436','password_changing','支付密码修改','1','0','3','0','cn');
INSERT INTO met_language VALUES('1437','login_password_changing','登录密码修改','1','0','3','0','cn');
INSERT INTO met_language VALUES('1438','account_information','账户信息设置','1','0','3','0','cn');
INSERT INTO met_language VALUES('1439','my_bill','充值记录','1','0','0','0','cn');
INSERT INTO met_language VALUES('1440','keep_sorting','保存排序','1','0','0','0','cn');
INSERT INTO met_language VALUES('1441','structure_mode','构成方式','1','0','32','0','cn');
INSERT INTO met_language VALUES('1442','title_cannot_empty!','标题不能为空！','1','0','0','0','cn');
INSERT INTO met_language VALUES('1443','adaptive','自适应','1','0','4','0','cn');
INSERT INTO met_language VALUES('1444','upload_local_v6','本地上传','1','0','1','0','cn');
INSERT INTO met_language VALUES('1445','upload_addoutimg_v6','外部图片','1','0','1','0','cn');
INSERT INTO met_language VALUES('1446','upload_progress_v6','上传中','1','0','1','0','cn');
INSERT INTO met_language VALUES('1447','upload_selectimg_v6','选择图片','1','0','1','0','cn');
INSERT INTO met_language VALUES('1448','upload_pselectimg_v6','请选择图片','1','0','1','0','cn');
INSERT INTO met_language VALUES('1449','upload_libraryimg_v6','本站图库','1','0','1','0','cn');
INSERT INTO met_language VALUES('1450','upload_extraimglink_v6','外部图片链接','1','0','1','0','cn');
INSERT INTO met_language VALUES('1451','compliance_materials','合规素材','1','0','1','0','cn');
INSERT INTO met_language VALUES('1452','delete_information','您确定要删除该信息吗？删除之后无法再恢复。','1','0','1','0','cn');
INSERT INTO met_language VALUES('1453','page_for_details','详情页','1','0','36','0','cn');
INSERT INTO met_language VALUES('1454','default_values','默认值','1','0','0','0','cn');
INSERT INTO met_language VALUES('1455','label','标签','1','0','0','0','cn');
INSERT INTO met_language VALUES('1456','for','为','1','0','0','0','cn');
INSERT INTO met_language VALUES('1457','verify_password','请重复输入密码','1','0','3','0','cn');
INSERT INTO met_language VALUES('1458','Repeat_password','重复密码','1','0','3','0','cn');
INSERT INTO met_language VALUES('1459','for_details','应用详情','1','0','3','0','cn');
INSERT INTO met_language VALUES('1460','template','模板','1','0','3','0','cn');
INSERT INTO met_language VALUES('1461','application','增值服务','1','0','3','0','cn');
INSERT INTO met_language VALUES('1462','Prompt_password','请输入密码','1','0','3','0','cn');
INSERT INTO met_language VALUES('1463','alipay','支付宝','1','0','0','0','cn');
INSERT INTO met_language VALUES('1464','account','账号','1','0','0','0','cn');
INSERT INTO met_language VALUES('1465','Prompt_email','请输入邮箱地址','1','0','3','0','cn');
INSERT INTO met_language VALUES('1466','mailbox','邮箱','1','0','0','0','cn');
INSERT INTO met_language VALUES('1467','Prompt_mobile','请输入手机号码','1','0','3','0','cn');
INSERT INTO met_language VALUES('1468','Prompt_user','请输入您的用户名','1','0','3','0','cn');
INSERT INTO met_language VALUES('1469','balance','余额','1','0','3','0','cn');
INSERT INTO met_language VALUES('1470','buy_records','购买记录','1','0','3','0','cn');
INSERT INTO met_language VALUES('1471','registration','注册','1','0','0','0','cn');
INSERT INTO met_language VALUES('1472','landing','登录','1','0','0','0','cn');
INSERT INTO met_language VALUES('1473','page_range','上一条下一条翻页范围','1','0','0','0','cn');
INSERT INTO met_language VALUES('1474','sys_navigation','导航：栏目设置中可以调整是否新窗口打开。','1','0','35','0','cn');
INSERT INTO met_language VALUES('1475','sys_navigation2','显示栏目列表时，图片需要在栏目设置中上传（栏目图片）。','1','0','35','0','cn');
INSERT INTO met_language VALUES('1476','suggested_size','建议尺寸','1','0','35','0','cn');
INSERT INTO met_language VALUES('1477','website_information','网站信息','1','0','39','0','cn');
INSERT INTO met_language VALUES('1478','email_Settings','发件邮箱配置','1','0','39','0','cn');
INSERT INTO met_language VALUES('1479','third_party_code','第三方代码','1','0','0','0','cn');
INSERT INTO met_language VALUES('1480','please_login','请先登录！','1','0','0','0','cn');
INSERT INTO met_language VALUES('1481','next_page','下页','1','0','1','0','cn');
INSERT INTO met_language VALUES('1482','background_page','后台首页','1','0','0','0','cn');
INSERT INTO met_language VALUES('1483','modify_information','修改个人资料','1','0','0','0','cn');
INSERT INTO met_language VALUES('1484','sys_select','精  选','1','0','3','0','cn');
INSERT INTO met_language VALUES('1485','should_used','应  用','1','0','3','0','cn');
INSERT INTO met_language VALUES('1486','sys_template','模  板','1','0','3','0','cn');
INSERT INTO met_language VALUES('1487','sys_purchase','购买','1','0','3','0','cn');
INSERT INTO met_language VALUES('1488','sys_payment','支付','1','0','3','0','cn');
INSERT INTO met_language VALUES('1489','extension_school','米拓学堂','1','0','0','0','cn');
INSERT INTO met_language VALUES('1490','the_bit','位','1','0','0','0','cn');
INSERT INTO met_language VALUES('1491','the_server','服务器','1','0','0','0','cn');
INSERT INTO met_language VALUES('1492','the_version','版本','1','0','0','0','cn');
INSERT INTO met_language VALUES('1493','safety_efficiency','安全与效率','1','0','36','0','cn');
INSERT INTO met_language VALUES('1494','data_processing','备份与恢复','1','0','36','0','cn');
INSERT INTO met_language VALUES('1495','appearance','网站模板','1','0','0','0','cn');
INSERT INTO met_language VALUES('1496','the_user','用户管理','1','0','8','0','cn');
INSERT INTO met_language VALUES('1497','safety','安全设置','1','0','8','0','cn');
INSERT INTO met_language VALUES('1498','attention','关注','1','0','0','0','cn');
INSERT INTO met_language VALUES('1499','author','作者','1','0','0','0','cn');
INSERT INTO met_language VALUES('1500','sys_authorization1','录入商业授权','1','0','0','0','cn');
INSERT INTO met_language VALUES('1501','sys_authorization2','了解商业授权','1','0','0','0','cn');
INSERT INTO met_language VALUES('1502','detection','检测中','1','0','0','0','cn');
INSERT INTO met_language VALUES('1503','entry_authorization','重新录入授权','1','0','0','0','cn');
INSERT INTO met_language VALUES('1504','display_number','选项卡显示数','1','0','36','0','cn');
INSERT INTO met_language VALUES('1505','corresponding_products','每个栏目可单独设置，如不单独设置，则调用上级栏目的配置','1','0','36','0','cn');
INSERT INTO met_language VALUES('1506','tab_title1','选项卡一标题','1','0','36','0','cn');
INSERT INTO met_language VALUES('1507','tab_title2','选项卡二标题','1','0','36','0','cn');
INSERT INTO met_language VALUES('1508','tab_title3','选项卡三标题','1','0','36','0','cn');
INSERT INTO met_language VALUES('1509','tab_title4','选项卡四标题','1','0','36','0','cn');
INSERT INTO met_language VALUES('1510','tab_title5','选项卡五标题','1','0','36','0','cn');
INSERT INTO met_language VALUES('1511','download_prompt','正在进行下载，请不要操作页面！','1','0','0','0','cn');
INSERT INTO met_language VALUES('1512','purchase_application','购买的应用只能作用于当前的网站','1','0','0','0','cn');
INSERT INTO met_language VALUES('1513','text_color','文字颜色','1','0','41','0','cn');
INSERT INTO met_language VALUES('1514','the_menu','手机菜单','1','0','41','0','cn');
INSERT INTO met_language VALUES('1515','background_color','背景颜色','1','0','41','0','cn');
INSERT INTO met_language VALUES('1516','external_links','外部链接','1','0','0','0','cn');
INSERT INTO met_language VALUES('1517','appmarket_jurisdiction','您没有查看应用市场的权限，请联系管理员开通。','1','0','0','0','cn');
INSERT INTO met_language VALUES('1518','setup_permissions','您没有设置权限，请联系管理员开通。','1','0','0','0','cn');
INSERT INTO met_language VALUES('1519','release','添加内容','1','0','0','0','cn');
INSERT INTO met_language VALUES('1520','administration','内容管理','1','0','0','0','cn');
INSERT INTO met_language VALUES('1521','customers','在线客服','1','0','0','0','cn');
INSERT INTO met_language VALUES('1522','seo','SEO','1','0','32','0','cn');
INSERT INTO met_language VALUES('1523','member','会员','1','0','38','0','cn');
INSERT INTO met_language VALUES('1524','language','语言设置','1','0','0','0','cn');
INSERT INTO met_language VALUES('1525','htmltopseudo','静态页面伪静态化','1','0','11','0','cn');
INSERT INTO met_language VALUES('1526','htmltopseudotips','使用伪静态方式实现静态页面URL，当前静态页面URL不变。对SEO效果不会产生影响。需要空间支持伪静态，并且会删除静态页面文件。','1','0','11','0','cn');
INSERT INTO met_language VALUES('1527','timedrelease','定时发布','1','0','0','0','cn');
INSERT INTO met_language VALUES('1528','mod_rewrite_column','开启伪静态化需空间环境配置开启mod_rewrite模块，如没有开启则联系空间商解决。','1','0','32','0','cn');
INSERT INTO met_language VALUES('1529','displaytype2','前台隐藏','1','0','0','0','cn');
INSERT INTO met_language VALUES('1530','js73','静态页面名称已被使用','1','0','0','0','cn');
INSERT INTO met_language VALUES('1531','js74','仅支持中文、大小写字母、数字、下划线、横线 ，不能设置为纯数字','1','0','0','0','cn');
INSERT INTO met_language VALUES('1532','js75','名称可用','1','0','0','0','cn');
INSERT INTO met_language VALUES('1533','js76','请先添加栏目再在此页面设置页面内容','1','0','0','0','cn');
INSERT INTO met_language VALUES('1534','unrecom','取消推荐','1','0','0','0','cn');
INSERT INTO met_language VALUES('1535','untop','取消置顶','1','0','0','0','cn');
INSERT INTO met_language VALUES('1536','modistauts','状态修改','1','0','0','0','cn');
INSERT INTO met_language VALUES('1537','goods','商品','1','0','0','0','cn');
INSERT INTO met_language VALUES('1538','js77','后台文件夹名称仅支持大小写字母、数字、下划线','1','0','0','0','cn');
INSERT INTO met_language VALUES('1539','js78','管理员名称不能重复','1','0','0','0','cn');
INSERT INTO met_language VALUES('1540','banner_pcheight_v6','电脑端高度','1','0','4','0','cn');
INSERT INTO met_language VALUES('1541','banner_setmobileImgUrl_v6','手机端图片地址','1','0','4','0','cn');
INSERT INTO met_language VALUES('1542','banner_setalert_v6','填数值，（如300，代表300px）建议自适应高度','1','0','4','0','cn');
INSERT INTO met_language VALUES('1543','banner_pidheight_v6','平板电脑端高度','1','0','4','0','cn');
INSERT INTO met_language VALUES('1544','banner_phoneheight_v6','手机端高度','1','0','4','0','cn');
INSERT INTO met_language VALUES('1545','banner_imgtitlecolor_v6','图片标题颜色','1','0','4','0','cn');
INSERT INTO met_language VALUES('1546','banner_needtempsupport_v6','一般不需要设置，部分特殊模板支持前台才显示生效','1','0','4','0','cn');
INSERT INTO met_language VALUES('1547','banner_imgdesc_v6','图片描述','1','0','4','0','cn');
INSERT INTO met_language VALUES('1548','banner_imgdesccolor_v6','图片描述颜色','1','0','4','0','cn');
INSERT INTO met_language VALUES('1549','banner_imgwordpos_v6','图片文字位置','1','0','4','0','cn');
INSERT INTO met_language VALUES('1550','posleft','左','1','0','4','0','cn');
INSERT INTO met_language VALUES('1551','posright','右','1','0','4','0','cn');
INSERT INTO met_language VALUES('1552','posup','上','1','0','4','0','cn');
INSERT INTO met_language VALUES('1553','poslower','下','1','0','4','0','cn');
INSERT INTO met_language VALUES('1554','poscenter','居中','1','0','4','0','cn');
INSERT INTO met_language VALUES('1555','batch_wm_v6','批量水印','1','0','5','0','cn');
INSERT INTO met_language VALUES('1556','batch_rmwm_v6','去除水印','1','0','5','0','cn');
INSERT INTO met_language VALUES('1557','batch_addwm_v6','添加水印','1','0','5','0','cn');
INSERT INTO met_language VALUES('1558','admin_movetocolumn_v6','移动到指定栏目','1','0','0','0','cn');
INSERT INTO met_language VALUES('1559','admin_copytocolumn_v6','复制到指定栏目','1','0','0','0','cn');
INSERT INTO met_language VALUES('1560','admin_colunmmanage_v6','栏目管理','1','0','0','0','cn');
INSERT INTO met_language VALUES('1561','relation_set','设置关联内容','1','0','0','0','cn');
INSERT INTO met_language VALUES('1562','parmanage','参数管理','1','0','0','0','cn');
INSERT INTO met_language VALUES('1563','refresh','刷新','1','0','0','0','cn');
INSERT INTO met_language VALUES('1564','desctext','描述文字','1','0','0','0','cn');
INSERT INTO met_language VALUES('1565','linkto','链接至','1','0','0','0','cn');
INSERT INTO met_language VALUES('1566','releasenow','立即发布','1','0','0','0','cn');
INSERT INTO met_language VALUES('1567','js79','访问量','1','0','0','0','cn');
INSERT INTO met_language VALUES('1568','added','新增','1','0','0','0','cn');
INSERT INTO met_language VALUES('1569','column_littleicon_v6','小图标icon','1','0','5','0','cn');
INSERT INTO met_language VALUES('1570','column_choosicon_v6','选择图标','1','0','5','0','cn');
INSERT INTO met_language VALUES('1571','column_inputcolumnfolder_v6','输入栏目文件夹名称','1','0','5','0','cn');
INSERT INTO met_language VALUES('1572','browserupdatetips','你正在使用一个过时的浏览器。请升级您的浏览器，以提高您的体验。','1','0','0','0','cn');
INSERT INTO met_language VALUES('1573','column_selecticonlib_v6','图标库选择','1','0','5','0','cn');
INSERT INTO met_language VALUES('1574','column_viewicon_v6','浏览图标','1','0','5','0','cn');
INSERT INTO met_language VALUES('1575','tips2_v6','显示在详情页底部，用于聚合内容','1','0','0','0','cn');
INSERT INTO met_language VALUES('1576','tips3_v6','多个关键词请用\"|\"隔开，如“建站|企业建站”','1','0','0','0','cn');
INSERT INTO met_language VALUES('1577','tips4_v6','请输入网址（需要包含http或https），设置后访问该条信息将直接跳转到设置的网址','1','0','0','0','cn');
INSERT INTO met_language VALUES('1578','tips5_v6','定时发布不支持静态页面，请关闭静态页面。（可以使用伪静态）','1','0','0','0','cn');
INSERT INTO met_language VALUES('1579','tips6_v6','为空则按系统规则自动构成，可以到SEO设置中修改规则。','1','0','0','0','cn');
INSERT INTO met_language VALUES('1580','tips7_v6','当没有手动上传图片时候，会自动提取详细信息第一张图片作为封面（此功能需要模板支持）','1','0','0','0','cn');
INSERT INTO met_language VALUES('1581','coverimg','封面图片','1','0','0','0','cn');
INSERT INTO met_language VALUES('1582','articletitle','文章标题','1','0','0','0','cn');
INSERT INTO met_language VALUES('1583','htmTip3','生成首页','1','0','11','0','cn');
INSERT INTO met_language VALUES('1584','js81','您没有此操作权限请联系管理员','1','0','0','0','cn');
INSERT INTO met_language VALUES('1585','help2','友情提示','1','0','0','0','cn');
INSERT INTO met_language VALUES('1586','tips8_v6','你的网站后台管理文件夹名称存在严重风险，建议你尽快修改','1','0','0','0','cn');
INSERT INTO met_language VALUES('1587','nohint','不再提示','1','0','0','0','cn');
INSERT INTO met_language VALUES('1588','tochange','前往修改','1','0','0','0','cn');
INSERT INTO met_language VALUES('1589','homepage','首页','1','0','0','0','cn');
INSERT INTO met_language VALUES('1590','backstage','后台','1','0','0','0','cn');
INSERT INTO met_language VALUES('1591','visualization','可视化','1','0','0','0','cn');
INSERT INTO met_language VALUES('1592','opfailed','操作失败','1','0','1','0','cn');
INSERT INTO met_language VALUES('1593','opsuccess','操作成功','1','0','1','0','cn');
INSERT INTO met_language VALUES('1594','unread','未阅读','1','0','0','0','cn');
INSERT INTO met_language VALUES('1595','language_outputlang_v6','导出语言包','1','0','16','0','cn');
INSERT INTO met_language VALUES('1596','language_batchreplace_v6','批量替换语言','1','0','16','0','cn');
INSERT INTO met_language VALUES('1597','language_copysetting_v6','复制基本设置','1','0','16','0','cn');
INSERT INTO met_language VALUES('1598','notcopy','不复制','1','0','16','0','cn');
INSERT INTO met_language VALUES('1599','language_tips1_v6','基于选中的语言复制除栏目内容外的全部参数配置','1','0','16','0','cn');
INSERT INTO met_language VALUES('1600','language_tips2_v6','基于选中的语言复制栏目及内容信息（共用选中语言的图片、附件等）','1','0','16','0','cn');
INSERT INTO met_language VALUES('1601','template_style_tips','基于选中的语言复制模板设置参数','1','0','16','0','cn');
INSERT INTO met_language VALUES('1602','websitetheme','网站主题风格','1','0','16','0','cn');
INSERT INTO met_language VALUES('1603','language_backlangchange_v6','后台语言切换','1','0','16','0','cn');
INSERT INTO met_language VALUES('1604','language_updatelang_v6','更新语言包数据<br>请严格按照导出格式粘贴于此','1','0','16','0','cn');
INSERT INTO met_language VALUES('1605','message_mailtext_v6','_提交了留言','1','0','20','0','cn');
INSERT INTO met_language VALUES('1606','nopicture','暂无图片','1','0','20','0','cn');
INSERT INTO met_language VALUES('1607','message_tips1_v6','提示文字，为空时显示，输入文字后消失','1','0','20','0','cn');
INSERT INTO met_language VALUES('1608','message_tips2_v6','提示文字','1','119','0','0','cn');
INSERT INTO met_language VALUES('1609','message_tips3_v6','用于设置前台表单输入框提示文字或选项名称；不填会显示参数名称','1','119','0','0','cn');
INSERT INTO met_language VALUES('1610','onlone_onlinelist_v6','客服列表','1','0','23','0','cn');
INSERT INTO met_language VALUES('1611','onlone_online_v6','客服设置','1','0','23','0','cn');
INSERT INTO met_language VALUES('1612','online_csname_v6','客服名称','1','0','23','0','cn');
INSERT INTO met_language VALUES('1613','online_taobaocs_v6','淘宝旺旺','1','0','23','0','cn');
INSERT INTO met_language VALUES('1614','online_alics_v6','阿里旺旺','1','0','23','0','cn');
INSERT INTO met_language VALUES('1615','online_tips1_v6','添加的QQ需要到【shang.qq.com】登录后在【推广工具—设置】安全级别选择完全公开，否则将显示“未启用” <br>添加的QQ号码，需要到个人QQ设置-权限设置里面，开启临时会话功能，否则点击QQ，将提示添加好友才能对话','1','0','23','0','cn');
INSERT INTO met_language VALUES('1616','confirm','确定','1','0','1','0','cn');
INSERT INTO met_language VALUES('1617','frontshow','前台显示','1','0','0','0','cn');
INSERT INTO met_language VALUES('1618','fronthidden','前台隐藏','1','0','0','0','cn');
INSERT INTO met_language VALUES('1619','state','状态','1','0','0','0','cn');
INSERT INTO met_language VALUES('1620','visitcount','访问量','1','0','0','0','cn');
INSERT INTO met_language VALUES('1621','selectcolumn','请选择所属栏目','1','0','0','0','cn');
INSERT INTO met_language VALUES('1622','tips11_v6','可以拖拽图片调整图片顺序。','1','0','28','0','cn');
INSERT INTO met_language VALUES('1623','tips12_v6','按下电脑键盘“ctrl”键，可以同时选择多个栏目','1','0','28','0','cn');
INSERT INTO met_language VALUES('1624','columumanage','栏目管理','1','0','0','0','cn');
INSERT INTO met_language VALUES('1625','titletips','标题（名称）','1','0','28','0','cn');
INSERT INTO met_language VALUES('1626','seotipssitemap1','过滤不显示在导航的一级栏目','1','0','32','0','cn');
INSERT INTO met_language VALUES('1627','seotips2','网站地图生成的栏目仅限一级栏目和显示在导航栏上栏目。<br / >不显示内容与栏目，都不会在网站地图中生成。','1','0','32','0','cn');
INSERT INTO met_language VALUES('1628','seotips3','相比于纯静态功能，伪静态更适合企业网站，既能满足SEO优化，又能方便的管理。','1','0','32','0','cn');
INSERT INTO met_language VALUES('1629','defaultlangtag','默认语言标识','1','0','32','0','cn');
INSERT INTO met_language VALUES('1630','seotips4','默认语言标示开启后，默认语言伪静态文件会在最后添加一个“-语言标示”，比如“-cn”','1','0','32','0','cn');
INSERT INTO met_language VALUES('1631','uisetTips3','当前页面没有可设置参数，请点击页面中相应区块的“设置”和“内容”按钮进行设置','1','0','36','0','cn');
INSERT INTO met_language VALUES('1632','addbaricon','地址栏图标','1','0','39','0','cn');
INSERT INTO met_language VALUES('1633','webset_tips1_v6','如果无法正常显示新上传图标，清空浏览器缓存后访问。','1','0','39','0','cn');
INSERT INTO met_language VALUES('1634','webset_tips2_v6','点击制作ICO','1','0','39','0','cn');
INSERT INTO met_language VALUES('1635','icontips','的.ico文件。','1','0','39','0','cn');
INSERT INTO met_language VALUES('1636','PC','电脑端','1','0','0','0','cn');
INSERT INTO met_language VALUES('1637','memberist','会员列表','1','0','38','0','cn');
INSERT INTO met_language VALUES('1638','membergroup','会员组','1','0','38','0','cn');
INSERT INTO met_language VALUES('1639','memberattribute','会员属性','1','0','38','0','cn');
INSERT INTO met_language VALUES('1640','memberfunc','会员功能设置','1','0','38','0','cn');
INSERT INTO met_language VALUES('1641','thirdlogin','社会化登录','1','0','38','0','cn');
INSERT INTO met_language VALUES('1642','mailcontentsetting','邮件内容设置','1','0','38','0','cn');
INSERT INTO met_language VALUES('1643','user_tips1_v6','可以注册','1','0','38','0','cn');
INSERT INTO met_language VALUES('1644','user_tips2_v6','含有非法字符','1','0','38','0','cn');
INSERT INTO met_language VALUES('1645','user_tips3_v6','用户名已存在','1','0','38','0','cn');
INSERT INTO met_language VALUES('1646','user_tips5_v6','可用参数，下列参数在邮件内容中会被转意为可变参数。','1','0','38','0','cn');
INSERT INTO met_language VALUES('1647','user_Registeredmail_v6','注册邮件','1','0','38','0','cn');
INSERT INTO met_language VALUES('1648','user_tips6_v6','邮件下一操作的URL地址，必填项。比如找回密码邮件，这个地址就是找回密码的链接。','1','0','38','0','cn');
INSERT INTO met_language VALUES('1649','user_tips7_v6','密码找回邮件','1','0','38','0','cn');
INSERT INTO met_language VALUES('1650','user_tips8_v6','需要到','1','0','38','0','cn');
INSERT INTO met_language VALUES('1651','user_global_set','全局设置','1','0','38','0','cn');
INSERT INTO met_language VALUES('1652','user_auto_register','自动注册系统会员','1','0','38','0','cn');
INSERT INTO met_language VALUES('1653','user_auto_register_tips','开启该配置，用户使用社会化账号首次登录，网站会员账号由系统自动生成并绑定社会化账号信息。','1','0','38','0','cn');
INSERT INTO met_language VALUES('1654','user_QQinterconnect_v6','QQ互联','1','0','38','0','cn');
INSERT INTO met_language VALUES('1655','user_tips9_v6','申请 （管理中心-登录-创建应用-网站）','1','0','38','0','cn');
INSERT INTO met_language VALUES('1656','user_backurl_v6','授权回调地址','1','0','38','0','cn');
INSERT INTO met_language VALUES('1657','user_tips10_v6','微信开放平台','1','0','38','0','cn');
INSERT INTO met_language VALUES('1658','user_Apply_v6','申请','1','0','38','0','cn');
INSERT INTO met_language VALUES('1659','user_tips11_v6','用于PC端会员登录','1','0','38','0','cn');
INSERT INTO met_language VALUES('1660','user_Openplatform_v6','开放平台','1','0','38','0','cn');
INSERT INTO met_language VALUES('1661','user_publicplatform_v6','微信公众平台','1','0','38','0','cn');
INSERT INTO met_language VALUES('1662','user_tips13_v6','需要获取网页授权功能，并设置授权域名为您的网站域名。','1','0','38','0','cn');
INSERT INTO met_language VALUES('1663','user_tips14_v6','并且将此微信公众号添加至开放平台账号下。','1','0','38','0','cn');
INSERT INTO met_language VALUES('1664','user_tips15_v6','新浪微博','1','0','38','0','cn');
INSERT INTO met_language VALUES('1665','user_tips16_v6','微博开放平台','1','0','38','0','cn');
INSERT INTO met_language VALUES('1666','user_tips17_v6','（注意：请申请网站不要申请应用）','1','0','38','0','cn');
INSERT INTO met_language VALUES('1667','user_accsafe_v6','账号安全','1','0','38','0','cn');
INSERT INTO met_language VALUES('1668','user_PasswordReset_v6','密码重置','1','0','38','0','cn');
INSERT INTO met_language VALUES('1669','user_tips18_v6','6 - 30 位字符 留空则不修改','1','0','38','0','cn');
INSERT INTO met_language VALUES('1670','user_emailuse_v6','邮箱已被绑定','1','0','38','0','cn');
INSERT INTO met_language VALUES('1671','user_Accountstatus_v6','账号状态','1','0','38','0','cn');
INSERT INTO met_language VALUES('1672','user_must_v6','必填','1','0','38','0','cn');
INSERT INTO met_language VALUES('1673','user_tips21_v6','值越大阅读权限越高','1','0','38','0','cn');
INSERT INTO met_language VALUES('1674','user_Exportmember_v6','下载CSV文件','1','0','38','0','cn');
INSERT INTO met_language VALUES('1675','user_Registratset_v6','注册设置','1','0','38','0','cn');
INSERT INTO met_language VALUES('1676','user_Regverificat_v6','注册验证','1','0','38','0','cn');
INSERT INTO met_language VALUES('1677','user_tips23_v6','邮箱为用户名','1','0','38','0','cn');
INSERT INTO met_language VALUES('1678','user_Mailvalidat_v6','邮件验证','1','0','38','0','cn');
INSERT INTO met_language VALUES('1679','user_tips24_v6','（需设置系统发件箱（设置-基本信息-发件邮箱配置）','1','0','38','0','cn');
INSERT INTO met_language VALUES('1680','user_tips25_v6','后台审核','1','0','38','0','cn');
INSERT INTO met_language VALUES('1681','user_tips26_v6','手机号码为用户名','1','0','38','0','cn');
INSERT INTO met_language VALUES('1682','user_tips27_v6','手机短信验证','1','0','38','0','cn');
INSERT INTO met_language VALUES('1683','user_tips28_v6','需开通短信服务（我的应用-短信功能）','1','0','38','0','cn');
INSERT INTO met_language VALUES('1684','user_Notverifying_v6','不验证','1','0','38','0','cn');
INSERT INTO met_language VALUES('1685','user_Backgroundpicture_v6','背景图片','1','0','38','0','cn');
INSERT INTO met_language VALUES('1686','user_tips30_v6','登录界面中间横屏背景（建议尺寸 1920 * 800 宽 * 高 ）','1','0','38','0','cn');
INSERT INTO met_language VALUES('1687','user_login_box_position','登录框位置','1','0','0','0','cn');
INSERT INTO met_language VALUES('1688','user_login_box_tips','手机端位置统一居中','1','0','0','0','cn');
INSERT INTO met_language VALUES('1689','user_login_bg_range_set','背景生效页面','1','0','0','0','cn');
INSERT INTO met_language VALUES('1690','user_login_bg_range_all_page','会员中心所有页面','1','0','0','0','cn');
INSERT INTO met_language VALUES('1691','user_login_bg_range_login_page','仅登录页','1','0','0','0','cn');
INSERT INTO met_language VALUES('1692','member_agreement','用户协议功能','1','0','0','0','cn');
INSERT INTO met_language VALUES('1693','new_regist_admin_notice','管理员通知','1','0','0','0','cn');
INSERT INTO met_language VALUES('1694','new_regist_mail_open','邮件通知','1','0','0','0','cn');
INSERT INTO met_language VALUES('1695','new_regist_mail','管理员邮箱','1','0','0','0','cn');
INSERT INTO met_language VALUES('1696','new_regist_sms_open','短信通知','1','0','0','0','cn');
INSERT INTO met_language VALUES('1697','new_regist_sms','短信通知号码','1','0','0','0','cn');
INSERT INTO met_language VALUES('1698','user_tips4_v6','请输入6-30位的密码','1','0','38','0','cn');
INSERT INTO met_language VALUES('1699','weixinlogin','微信登录','1','0','38','0','cn');
INSERT INTO met_language VALUES('1700','sinalogin','微博登录','1','0','38','0','cn');
INSERT INTO met_language VALUES('1701','qqlogin','QQ登录','1','0','38','0','cn');
INSERT INTO met_language VALUES('1702','register','注册','1','0','38','0','cn');
INSERT INTO met_language VALUES('1703','lastactive','最后活跃','1','0','38','0','cn');
INSERT INTO met_language VALUES('1704','source','来源','1','0','38','0','cn');
INSERT INTO met_language VALUES('1705','bindingmail','绑定邮箱','1','0','38','0','cn');
INSERT INTO met_language VALUES('1706','bindingmobile','绑定手机','1','0','38','0','cn');
INSERT INTO met_language VALUES('1707','systips1','您没有权限访问这个内容！请登录后访问！','1','0','0','0','cn');
INSERT INTO met_language VALUES('1708','systips2','您所在用户组没有权限访问这个内容！','1','0','0','0','cn');
INSERT INTO met_language VALUES('1709','unrestricted','不限制','1','0','40','0','cn');
INSERT INTO met_language VALUES('1710','dowloadauthority','下载权限','1','0','40','0','cn');
INSERT INTO met_language VALUES('1711','save','保存','1','0','0','0','cn');
INSERT INTO met_language VALUES('1712','baceinfo','基本信息','1','0','0','0','cn');
INSERT INTO met_language VALUES('1713','staticpage','静态页面设置','1','162','0','0','cn');
INSERT INTO met_language VALUES('1714','pseudostatic','伪静态','1','164','0','0','cn');
INSERT INTO met_language VALUES('1715','setequivalentcolumns','当前栏目','1','22','0','0','cn');
INSERT INTO met_language VALUES('1716','veditor','可视化编辑','1','0','2','0','cn');
INSERT INTO met_language VALUES('1717','veditortips1','开启','1','0','2','0','cn');
INSERT INTO met_language VALUES('1718','funcCollection','功能大全','1','0','0','0','cn');
INSERT INTO met_language VALUES('1719','websiteSet','网站配置与管理','1','0','0','0','cn');
INSERT INTO met_language VALUES('1720','systemModule','系统模块','1','0','0','0','cn');
INSERT INTO met_language VALUES('1721','appearanceSetting','外观设置','1','0','0','0','cn');
INSERT INTO met_language VALUES('1722','basicInfoSet','基本信息配置','1','0','0','0','cn');
INSERT INTO met_language VALUES('1723','multilingual','多语言','1','0','0','0','cn');
INSERT INTO met_language VALUES('1724','mailSetting','发件邮箱配置','1','0','0','0','cn');
INSERT INTO met_language VALUES('1725','thirdCode','第三方代码添加','1','0','0','0','cn');
INSERT INTO met_language VALUES('1726','watermarkThumbnail','水印/缩略图','1','0','0','0','cn');
INSERT INTO met_language VALUES('1727','customerService','客服设置','1','0','0','0','cn');
INSERT INTO met_language VALUES('1728','recycleBin','回收站','1','0','0','0','cn');
INSERT INTO met_language VALUES('1729','securityTools','系统安全与工具','1','0','0','0','cn');
INSERT INTO met_language VALUES('1730','searchEngineOptimization','SEO搜索引擎优化','1','0','0','0','cn');
INSERT INTO met_language VALUES('1731','seoSetting','SEO参数设置','1','0','0','0','cn');
INSERT INTO met_language VALUES('1732','thirdPartyLogin','社会化登录设置','1','0','0','0','cn');
INSERT INTO met_language VALUES('1733','appAndPlugin','应用插件','1','0','0','0','cn');
INSERT INTO met_language VALUES('1734','metShop','官方商城','1','0','0','0','cn');
INSERT INTO met_language VALUES('1735','purchase_notice','购买须知','1','0','0','0','cn');
INSERT INTO met_language VALUES('1736','commercialAuthorizationCode','商业授权代码','1','0','0','0','cn');
INSERT INTO met_language VALUES('1737','systips13','老版本模板兼容（非响应式模板）','1','0','0','0','cn');
INSERT INTO met_language VALUES('1738','mobileSetting','手机版设置','1','0','0','0','cn');
INSERT INTO met_language VALUES('1739','mobileVersion','手机版外观','1','0','0','0','cn');
INSERT INTO met_language VALUES('1740','uisetTips4','当前页面预览','1','0','36','0','cn');
INSERT INTO met_language VALUES('1741','uisetTips5','当前页面系统参数设置','1','0','36','0','cn');
INSERT INTO met_language VALUES('1742','uisetTips6','当前页设置','1','0','36','0','cn');
INSERT INTO met_language VALUES('1743','moreSettings','更多设置','1','0','36','0','cn');
INSERT INTO met_language VALUES('1744','sysMailboxConfig','发件邮箱配置','1','0','36','0','cn');
INSERT INTO met_language VALUES('1745','navSetting','导航菜单设置','1','0','36','0','cn');
INSERT INTO met_language VALUES('1746','oldBackstage','传统后台','1','0','36','0','cn');
INSERT INTO met_language VALUES('1747','sysMessage','系统消息','1','0','36','0','cn');
INSERT INTO met_language VALUES('1748','replaceImg','替换图片','1','0','36','0','cn');
INSERT INTO met_language VALUES('1749','uisetTips8','隐藏该元素<br>（隐藏后方便修改被遮挡的元素，<br>刷新页面可再次显示）','1','0','36','0','cn');
INSERT INTO met_language VALUES('1750','putIntoRecycle','放入回收站','1','0','1','0','cn');
INSERT INTO met_language VALUES('1751','thoroughlyDeleting','彻底删除','1','0','1','0','cn');
INSERT INTO met_language VALUES('1752','cancel','取消','1','0','1','0','cn');
INSERT INTO met_language VALUES('1753','websiteContent','网站基本内容','1','0','16','0','cn');
INSERT INTO met_language VALUES('1754','jslang0','放入回收站','1','0','1','0','cn');
INSERT INTO met_language VALUES('1755','jslang1','彻底删除','1','0','1','0','cn');
INSERT INTO met_language VALUES('1756','jslang2','取消','1','0','1','0','cn');
INSERT INTO met_language VALUES('1757','seotips26','开启后能够简化前台网页URL（网址），并且以html结尾（静态页面功能关闭状态下方能生效）。','1','0','32','0','cn');
INSERT INTO met_language VALUES('1758','systips14','（开启前请确保伪静态功能已关闭）','1','0','11','0','cn');
INSERT INTO met_language VALUES('1759','systips15','MB（如网站后台设置值超过服务器限制的上传文件最大值，则以服务器限制的数值为准）','1','0','30','0','cn');
INSERT INTO met_language VALUES('1760','third_code_mobile','移动端第三方代码','1','0','39','0','cn');
INSERT INTO met_language VALUES('1761','clearCache','清空缓存','1','0','1','0','cn');
INSERT INTO met_language VALUES('1762','jsx39','（删除栏目时将删除栏目下的所有内容）','1','0','5','0','cn');
INSERT INTO met_language VALUES('1763','jslang3','没有选中的记录','1','0','1','0','cn');
INSERT INTO met_language VALUES('1764','jslang4','请选择所属栏目','1','0','1','0','cn');
INSERT INTO met_language VALUES('1765','category','所属栏目','1','40','3','0','cn');
INSERT INTO met_language VALUES('1766','jslang5','我知道了','1','0','1','0','cn');
INSERT INTO met_language VALUES('1767','jslang6','展开更多设置','1','0','1','0','cn');
INSERT INTO met_language VALUES('1768','jslang7','隐藏设置','1','0','1','0','cn');
INSERT INTO met_language VALUES('1769','newFeedback','收到了新的反馈','1','0','9','0','cn');
INSERT INTO met_language VALUES('1770','wap_descript5_v6','名称不能为空！','1','450','41','0','cn');
INSERT INTO met_language VALUES('1771','allapp_v6','全部应用','1','469','21','0','cn');
INSERT INTO met_language VALUES('1772','freeapp_v6','免费应用','1','470','21','0','cn');
INSERT INTO met_language VALUES('1773','Business_membersapp_v6','商业应用','1','471','21','0','cn');
INSERT INTO met_language VALUES('1774','payapp','收费应用','1','472','21','0','cn');
INSERT INTO met_language VALUES('1775','servicename_v6','服务名称','1','473','21','0','cn');
INSERT INTO met_language VALUES('1776','appstore_descript1_v6','技术支持 服务开通/续费','1','474','21','0','cn');
INSERT INTO met_language VALUES('1777','appstore_Servicescope_v6','服务范围','1','475','21','0','cn');
INSERT INTO met_language VALUES('1778','appstore_descript2_v6','MetInfo产品服务（安装、升级、搬家、故障排查与处理、服务器调试','1','476','21','0','cn');
INSERT INTO met_language VALUES('1779','appstore_descript3_v6','直接帮忙操作。','1','477','21','0','cn');
INSERT INTO met_language VALUES('1780','appstore_descript4_v6','服务器调试：首次搭建服务器环境以及与MetInfo故障有关的服务器环境问题处理。','1','478','21','0','cn');
INSERT INTO met_language VALUES('1781','appstore_descript5_v6','专业解答（产品使用/技巧、SEO优化、网络营销）','1','479','21','0','cn');
INSERT INTO met_language VALUES('1782','appstore_descript6_v6','帮助分析，提供解决方案和指导，不提供操作服务。','1','480','21','0','cn');
INSERT INTO met_language VALUES('1783','appstore_descript7_v6','服务范围谨遵上述内容，如未标明则说明不提供相应服务。','1','481','21','0','cn');
INSERT INTO met_language VALUES('1784','appstore_descript8_v6','以下情况无法提供服务','1','482','21','0','cn');
INSERT INTO met_language VALUES('1785','appstore_descript9_v6','自行修改或使用非原始 MetInfo 程序代码产生的问题','1','483','21','0','cn');
INSERT INTO met_language VALUES('1786','appstore_descript10_v6','非官方开发的应用插件、制作的模板造成的问题（应用商店上架的第三方应用/模板属于服务范围）','1','484','21','0','cn');
INSERT INTO met_language VALUES('1787','appstore_descript11_v6','服务器、虚拟主机原因造成的系统故障','1','485','21','0','cn');
INSERT INTO met_language VALUES('1788','appstore_descript12_v6','未购买商业授权非法去除版权信息','1','486','21','0','cn');
INSERT INTO met_language VALUES('1789','appstore_descript13_v6','不含网站内容维护、图片处理、源码修改。','1','487','21','0','cn');
INSERT INTO met_language VALUES('1790','appstore_servicemode_v6','服务方式','1','488','21','0','cn');
INSERT INTO met_language VALUES('1791','appstore_descript14_v6','提交工单：故障处理、问题咨询（每天）','1','489','21','0','cn');
INSERT INTO met_language VALUES('1792','appstore_descript15_v6','在线咨询：问题咨询（仅工作日在线，在线时间：08:30 - 17:30）','1','490','21','0','cn');
INSERT INTO met_language VALUES('1793','appstore_descript16_v6','应用商店账号登录MetInfo官网也可以获得工单、在线咨询服务（无法访问网站后台的情况下推荐使用）。','1','491','21','0','cn');
INSERT INTO met_language VALUES('1794','appstore_descript17_v6','选择服务时长','1','492','21','0','cn');
INSERT INTO met_language VALUES('1795','appstore_descript18_v6','一个月 (300元)','1','493','21','0','cn');
INSERT INTO met_language VALUES('1796','appstore_descript19_v6','三个月 (500元)','1','494','21','0','cn');
INSERT INTO met_language VALUES('1797','appstore_descript20_v6','一年 (1000元)','1','495','21','0','cn');
INSERT INTO met_language VALUES('1798','appstore_QQsalesconsulting_v6','QQ销售咨询','1','496','21','0','cn');
INSERT INTO met_language VALUES('1799','appstore_descript21_v6','可咨询QQ了解服务详情','1','497','21','0','cn');
INSERT INTO met_language VALUES('1800','appstore_descript22_v6','单次服务价格：网站搬家200元/次，网站安装100元/次，网站升级100元起，故障处理100元起','1','498','21','0','cn');
INSERT INTO met_language VALUES('1801','appstore_descript23_v6','应用商店账号的登录密码','1','499','21','0','cn');
INSERT INTO met_language VALUES('1802','appstore_descript24_v6','清楚且遵守上述服务范围与服务方式','1','500','21','0','cn');
INSERT INTO met_language VALUES('1803','appstore_descript25_v6','立即开通/续费','1','501','21','0','cn');
INSERT INTO met_language VALUES('1804','appstore_descript26_v6','模板制作/修改服务商','1','502','21','0','cn');
INSERT INTO met_language VALUES('1805','appstore_sign_v6','标志','1','503','21','0','cn');
INSERT INTO met_language VALUES('1806','appstore_name_v6','名称','1','504','21','0','cn');
INSERT INTO met_language VALUES('1807','appstore_type_v6','类型','1','505','21','0','cn');
INSERT INTO met_language VALUES('1808','appstore_place_v6','地区','1','506','21','0','cn');
INSERT INTO met_language VALUES('1809','appstore_Abilityvalue_v6','能力值','1','507','21','0','cn');
INSERT INTO met_language VALUES('1810','appstore_descript27_v6','商家如何入驻？','1','508','21','0','cn');
INSERT INTO met_language VALUES('1811','appstore_descript28_v6','商家入驻说明','1','509','21','0','cn');
INSERT INTO met_language VALUES('1812','appstore_Admissionrequirements_v6','入驻要求','1','510','21','0','cn');
INSERT INTO met_language VALUES('1813','appstore_descript29_v6','商家入驻说明获得“官方认证模板设计师”称号。','1','511','21','0','cn');
INSERT INTO met_language VALUES('1814','appstore_descript30_v6','完成官方模板制作培训并顺利结业','1','512','21','0','cn');
INSERT INTO met_language VALUES('1815','appstore_descript31_v6','点此报名培训','1','513','21','0','cn');
INSERT INTO met_language VALUES('1816','appstore_descript32_v6','上线一套收费模板至应用商店。','1','514','21','0','cn');
INSERT INTO met_language VALUES('1817','appstore_Admissionprocess_v6','入驻流程','1','515','21','0','cn');
INSERT INTO met_language VALUES('1818','appstore_descript33_v6','1、联系官方商家合作专员：','1','516','21','0','cn');
INSERT INTO met_language VALUES('1819','appstore_descript34_v6','QQ招商加盟','1','517','21','0','cn');
INSERT INTO met_language VALUES('1820','appstore_descript35_v6','QQ招商加盟2、报名参加官方模板制作培训并获得“官方认证模板设计师”称号。','1','518','21','0','cn');
INSERT INTO met_language VALUES('1821','appstore_descript36_v6','3、通过官网审核并顺利上线一套收费模板至应用商店。','1','519','21','0','cn');
INSERT INTO met_language VALUES('1822','appstore_descript37_v6','4、提供商家入驻所需资料，官方进行核实。','1','520','21','0','cn');
INSERT INTO met_language VALUES('1823','appstore_descript38_v6','5、正式入驻。','1','521','21','0','cn');
INSERT INTO met_language VALUES('1824','appstore_descript39_v6','上线一套作品至应用商店其标准和审核将会非常严格，因为我们需要确保最终用户能够得到足够专业的技术服务。','1','522','21','0','cn');
INSERT INTO met_language VALUES('1825','appstore_service_v6','服务','1','523','21','0','cn');
INSERT INTO met_language VALUES('1826','appstore_Spacedomain_name_v6','空间域名','1','524','21','0','cn');
INSERT INTO met_language VALUES('1827','appstore_Worryfree_service_v6','无忧服务','1','525','21','0','cn');
INSERT INTO met_language VALUES('1828','appstore_buildweb_v6','建站套餐','1','526','21','0','cn');
INSERT INTO met_language VALUES('1829','appstore_Thirdcooperation_v6','第三方合作','1','527','21','0','cn');
INSERT INTO met_language VALUES('1830','appstore_downshowdata_v6','下载演示数据','1','528','21','0','cn');
INSERT INTO met_language VALUES('1831','banner_column_v6','栏目','1','533','4','0','cn');
INSERT INTO met_language VALUES('1832','batch_watermarking_v6','批量水印操作','1','538','5','0','cn');
INSERT INTO met_language VALUES('1833','open_allchildcolumn_v6','展开所有子栏目','1','541','7','0','cn');
INSERT INTO met_language VALUES('1834','column_descript1_v6','目录名称只能为小写字母或者数字，且不能和其他栏目重名！','1','542','7','0','cn');
INSERT INTO met_language VALUES('1835','add_to_v6','添加至','1','543','7','0','cn');
INSERT INTO met_language VALUES('1836','seo_set_v6','SEO设置','1','544','7','0','cn');
INSERT INTO met_language VALUES('1837','content_name_v6','名称','1','553','7','0','cn');
INSERT INTO met_language VALUES('1838','html_createend_v6','生成完毕','1','559','1','0','cn');
INSERT INTO met_language VALUES('1839','html_createfail_v6','生成失败','1','560','11','0','cn');
INSERT INTO met_language VALUES('1840','online_addkefu_v6','添加客服','1','561','23','0','cn');
INSERT INTO met_language VALUES('1841','indexpic','图片水印','1','64','13','0','cn');
INSERT INTO met_language VALUES('1842','databackup7','全部备份','1','244','8','0','cn');
INSERT INTO met_language VALUES('1843','adminmobile','手机','1','16','2','0','cn');
INSERT INTO met_language VALUES('1844','pay_WeChat_v6','微信','1','628','26','0','cn');
INSERT INTO met_language VALUES('1845','notauthen','未认证','1','9','2','0','cn');
INSERT INTO met_language VALUES('1846','rnvalidate','实名认证','1','9','2','0','cn');
INSERT INTO met_language VALUES('1847','mobile_logo','手机站LOGO','1','9','2','0','cn');
INSERT INTO met_language VALUES('1848','mobile_banner_tips1','(不上传手机图片时，手机访问的banner图和电脑端保持一致，手机图片不支持全站静态。)','1','9','2','0','cn');
INSERT INTO met_language VALUES('1849','langexisted','语言已存在','1','9','2','0','cn');
INSERT INTO met_language VALUES('1850','fdincTip12','后台显示列表项','1','49','0','0','cn');
INSERT INTO met_language VALUES('1851','fdincTip13','只能选择下拉、单选、多选反馈字段，此处设置保存后，请到“反馈表单设置”中设置需要关联的产品栏目。','1','559','1','0','cn');
INSERT INTO met_language VALUES('1852','unitytxt_1','功能设置','1','0','1','0','cn');
INSERT INTO met_language VALUES('1853','enter_folder','双击文件夹图标，进入文件夹选择文件','1','0','1','0','cn');
INSERT INTO met_language VALUES('1854','fliptext2','加载中','1','0','1','0','cn');
INSERT INTO met_language VALUES('1855','memberarayname','会员组名称','1','0','11','0','cn');
INSERT INTO met_language VALUES('1856','thumbs_tips1_v6','修改保存后请到可视化界面导航点击【常用功能】-【清除缩略图】，以使本次保存生效。','1','0','0','0','cn');
INSERT INTO met_language VALUES('1857','recahrge_tips','充值后如需退款须扣除 2% 的手续费，充值后 60 天内可以在“用户中心-财务中心-发票申请”提交发票申请。','1','0','0','0','cn');
INSERT INTO met_language VALUES('1858','sys_lang_operate','系统语言操作','1','0','0','0','cn');
INSERT INTO met_language VALUES('1859','edit_app_lang','编辑插件语言','1','0','0','0','cn');
INSERT INTO met_language VALUES('1860','product_para_tips','链接字段类型需要前台模板支持，如模板不支持则可用附件类型进行功能替代','1','0','0','0','cn');
INSERT INTO met_language VALUES('1861','metinfoapp3','官方声明','1','0','0','0','cn');
INSERT INTO met_language VALUES('1862','metinfoapptext3','第三方商家涵盖MetInfo应用及模板开发、中小企业信息化服务领域等，但MetInfo官方均未参与其相关产品和服务的营运及分成，请广大用户自行选择辨认并承担由此产生的一切后果，如发现商家存在违法或不诚信行为，欢迎向MetInfo官方举报，我们将对其进行下架处理。','1','0','0','0','cn');
INSERT INTO met_language VALUES('1863','metinfoappinstallinfo','应用首次安装将自动绑定域名','1','0','0','0','cn');
INSERT INTO met_language VALUES('1864','metinfoappinstallinfo4','安装提示','1','0','1','0','cn');
INSERT INTO met_language VALUES('1865','columnselect1','选择栏目','1','0','0','0','cn');
INSERT INTO met_language VALUES('1866','columnnofollow','nofollow属性','1','0','0','0','cn');
INSERT INTO met_language VALUES('1867','columnnofollowinfo','勾选后网站不向链接网址传递权重','1','0','0','0','cn');
INSERT INTO met_language VALUES('1868','feedbackinquiry','在线询价','1','0','0','0','cn');
INSERT INTO met_language VALUES('1869','feedbackinquiryinfo','只可在一个反馈栏目中开启此选项。','1','0','0','0','cn');
INSERT INTO met_language VALUES('1870','feedbackinquiryinfo1','开启在线询价后，产品详情页将自动显示询价按钮。','1','0','0','0','cn');
INSERT INTO met_language VALUES('1871','webupate1','网站备份','1','0','0','0','cn');
INSERT INTO met_language VALUES('1872','webupate3','解压成功','1','0','0','0','cn');
INSERT INTO met_language VALUES('1873','webupate4','解压失败','1','0','0','0','cn');
INSERT INTO met_language VALUES('1874','webupate5','压缩包不存在','1','0','0','0','cn');
INSERT INTO met_language VALUES('1875','webupate6','文件类型','1','0','0','0','cn');
INSERT INTO met_language VALUES('1876','webupate7','解压','1','0','0','0','cn');
INSERT INTO met_language VALUES('1877','webupate9','使用备份管理员账号','1','0','0','0','cn');
INSERT INTO met_language VALUES('1878','webupate10','不覆盖管理员账号','1','0','0','0','cn');
INSERT INTO met_language VALUES('1879','seohtaccess1','是否显示根目录下文件列表','1','0','1','0','cn');
INSERT INTO met_language VALUES('1880','updatenofile','安装包不存在','1','0','0','0','cn');
INSERT INTO met_language VALUES('1881','updateupzipfileno','解压数据失败','1','0','0','0','cn');
INSERT INTO met_language VALUES('1882','updateinstallnow','安装中...','1','0','1','0','cn');
INSERT INTO met_language VALUES('1883','useinfopay','此功能需要先安装支付接口管理应用才能开启。','1','0','0','0','cn');
INSERT INTO met_language VALUES('1884','usegroupauto1','充值满金额自动升级','1','0','0','0','cn');
INSERT INTO met_language VALUES('1885','usegroupbuy','付费购买会员组','1','0','0','0','cn');
INSERT INTO met_language VALUES('1886','usereadinfo','阅读权限值必需大于0','1','0','0','0','cn');
INSERT INTO met_language VALUES('1887','userselectname','选项卡','1','0','0','0','cn');
INSERT INTO met_language VALUES('1888','msmnoifno','短信功能未开通','1','0','0','0','cn');
INSERT INTO met_language VALUES('1889','templateseditfalse','修改失败','1','0','0','0','cn');
INSERT INTO met_language VALUES('1890','templatefilewritno','目录不可写','1','0','0','0','cn');
INSERT INTO met_language VALUES('1891','times1','秒前','1','0','0','0','cn');
INSERT INTO met_language VALUES('1892','times2','分钟前','1','0','0','0','cn');
INSERT INTO met_language VALUES('1893','times3','小时前','1','0','0','0','cn');
INSERT INTO met_language VALUES('1894','times4','天前','1','0','0','0','cn');
INSERT INTO met_language VALUES('1895','uploadfilenop','无权限上传','1','0','0','0','cn');
INSERT INTO met_language VALUES('1896','rurlerror','请求地址出错','1','0','0','0','cn');
INSERT INTO met_language VALUES('1897','paranouse','参数不合法','1','0','0','0','cn');
INSERT INTO met_language VALUES('1898','linkmetinfoerror','您的服务器链接不上Met用户中心，请联系官网客服人员对服务器进行检测！！！','1','0','0','0','cn');
INSERT INTO met_language VALUES('1899','appusererror','后台登录账号密码错误，请在Met用户中心重新设置账号密码！！！','1','0','0','0','cn');
INSERT INTO met_language VALUES('1900','parameter10','链接','1','0','0','0','cn');
INSERT INTO met_language VALUES('1901','parametervalueinfo','值','1','0','0','0','cn');
INSERT INTO met_language VALUES('1902','indexmobilelogoinfo','模板有手机LOGO设置时，此处设置失效，开启静态页面时设置无效，留空手机端使用默认LOGO','1','0','0','0','cn');
INSERT INTO met_language VALUES('1903','columndeffflor','你使用的栏目文件名称和系统默认模块文件夹名称冲突，请重新命名','1','0','0','0','cn');
INSERT INTO met_language VALUES('1904','idcode','身份证号码','1','0','0','0','cn');
INSERT INTO met_language VALUES('1905','recoveryisntallinfo','导入的数据库版本和系统当前版本不一致，导入后可能会存在部分参数及配置数据丢失的情况，请谨慎导入！','1','0','0','0','cn');
INSERT INTO met_language VALUES('1906','met_template_nofile','模板文件夹不存在','1','0','0','50002','cn');
INSERT INTO met_language VALUES('1907','met_template_fileexist','模板已经存在','1','0','0','50002','cn');
INSERT INTO met_language VALUES('1908','met_template_noconfigfile','模板配置文件不存在','1','0','0','50002','cn');
INSERT INTO met_language VALUES('1909','met_template_falsedelui','删除UI失败','1','0','0','50002','cn');
INSERT INTO met_language VALUES('1910','met_template_falsedeluiconfig','删除UI配置失败','1','0','0','50002','cn');
INSERT INTO met_language VALUES('1911','met_template_falsedelconfig','删除全局配置失败','1','0','0','50002','cn');
INSERT INTO met_language VALUES('1912','met_template_downloadfalse','下载失败','1','0','0','50002','cn');
INSERT INTO met_language VALUES('1913','met_template_downloadok','下载成功','1','0','0','50002','cn');
INSERT INTO met_language VALUES('1914','met_template_temnoexist','模板不存在','1','0','0','50002','cn');
INSERT INTO met_language VALUES('1915','met_template_demonoexist','演示数据不存在','1','0','0','50002','cn');
INSERT INTO met_language VALUES('1916','met_template_upzipdemofalse','解压演示数据失败','1','0','0','50002','cn');
INSERT INTO met_language VALUES('1917','met_template_upzipok','解压成功','1','0','0','50002','cn');
INSERT INTO met_language VALUES('1918','met_template_installok','安装成功','1','0','0','50002','cn');
INSERT INTO met_language VALUES('1919','met_template_templates','UI商业模板','1','0','0','50002','cn');
INSERT INTO met_language VALUES('1920','met_template_othertemplates','其他模板','1','0','0','50002','cn');
INSERT INTO met_language VALUES('1921','met_template_installdemo','安装演示数据','1','0','0','50002','cn');
INSERT INTO met_language VALUES('1922','met_template_deletteminfo','您确定要删除该模板吗？删除之后无法再恢复。','1','0','0','50002','cn');
INSERT INTO met_language VALUES('1923','met_template_nodelet','系统应用不允许删除','1','0','0','50002','cn');
INSERT INTO met_language VALUES('1924','met_template_filesavef','文件保存失败','1','0','0','50002','cn');
INSERT INTO met_language VALUES('1925','met_template_installuierr','导入UI时出错','1','0','0','50002','cn');
INSERT INTO met_language VALUES('1926','met_template_installuiparaerr','导入UI参数时出错','1','0','0','50002','cn');
INSERT INTO met_language VALUES('1927','met_template_updateok','升级成功','1','0','0','50002','cn');
INSERT INTO met_language VALUES('1928','met_template_updatefalse','更新失败','1','0','0','50002','cn');
INSERT INTO met_language VALUES('1929','met_template_updatedatafalse','数据更新失败','1','0','0','50002','cn');
INSERT INTO met_language VALUES('1930','met_template_donotinfo','不需要操作或没有权限','1','0','0','50002','cn');
INSERT INTO met_language VALUES('1931','met_template_langinfotext','开启多语言时，必须先切换到对应语言的可视化管理或传统后台，然后在此启用一套模板；不同的语言可以启用不同的模板。','1','0','0','50002','cn');
INSERT INTO met_language VALUES('1932','met_template_metinfouserinfo','米拓官网用户中心账号可同步安装已购买且绑定域名为本站的商业模板，购买后60天内可以在米拓用户中心绑定域名','1','0','0','50002','cn');
INSERT INTO met_language VALUES('1933','met_template_buytemplates','购买新模板','1','0','0','50002','cn');
INSERT INTO met_language VALUES('1934','met_template_delettemplatesinfo','列表中删除模板并不会删除 网站根目录/templates/ 下的模板文件夹','1','0','0','50002','cn');
INSERT INTO met_language VALUES('1935','met_template_demoinstalltitle','演示数据安装提示！！！','1','0','0','50002','cn');
INSERT INTO met_language VALUES('1936','met_template_demoinstallsel','请选择合适你的安装方式','1','0','0','50002','cn');
INSERT INTO met_language VALUES('1937','met_template_demoinstallt1','恢复出厂设置：系统将清空网站所有已有数据，将网站恢复至模板演示数据状态；','1','0','0','50002','cn');
INSERT INTO met_language VALUES('1938','met_template_demoinstallt2','备份已有数据并安装：系统将先自动备份网站现有数据库及图片，然后将网站恢复至模板演示数据状态，日后可以通过恢复备份数据将网站还原至演示数据安装前的状态；','1','0','0','50002','cn');
INSERT INTO met_language VALUES('1939','met_template_demoinstallt3','取消：如果你的网站已经添加了内容，我们建议你不要安装演示数据，安装模板后直接在可视化中设置相关区块内容即可。','1','0','0','50002','cn');
INSERT INTO met_language VALUES('1940','met_template_saveinstall','备份已有数据并安装','1','0','0','50002','cn');
INSERT INTO met_language VALUES('1941','met_template_installnewmetinfo','恢复出厂设置','1','0','0','50002','cn');
INSERT INTO met_language VALUES('1942','met_template_downloadtemjs','正在下载模板...','1','0','1','50002','cn');
INSERT INTO met_language VALUES('1943','met_template_downloadtemokjs','下载模板成功','1','0','1','50002','cn');
INSERT INTO met_language VALUES('1944','met_template_downloaduijs','正在下载UI','1','0','1','50002','cn');
INSERT INTO met_language VALUES('1945','met_template_setmarktext','点击展开高级设置','1','0','0','50002','cn');
INSERT INTO met_language VALUES('1946','met_template_setmarktexth','隐藏高级设置','1','0','0','50002','cn');
INSERT INTO met_language VALUES('1947','setpnorder','上一条下一条调用设置','1','0','0','50002','cn');
INSERT INTO met_language VALUES('1948','disableCssJs','关闭系统css和js','1','1','0','0','cn');
INSERT INTO met_language VALUES('1949','disableCssJsTips','禁止系统加载默认的css和js（仅供开发者制作模板使用，普通用户切勿关闭）','1','1','0','0','cn');
INSERT INTO met_language VALUES('1950','301jump','301跳转','1','1','0','0','cn');
INSERT INTO met_language VALUES('1951','setseoLogoKeyword','Logo关键词','1','1','0','0','cn');
INSERT INTO met_language VALUES('1952','301jumpDescription','开启后网站域名将自动跳转带www的网站域名。例：*****.cn 跳转 www.*****.cn','1','1','0','0','cn');
INSERT INTO met_language VALUES('1953','gotohttps','http跳转https','1','1','0','0','cn');
INSERT INTO met_language VALUES('1954','gotohttps_tips','此功能需要服务器安装SSL证书并支持https协议才能开启。','1','1','0','0','cn');
INSERT INTO met_language VALUES('1955','admin_login_lang','登录后台默认语言','1','0','0','0','cn');
INSERT INTO met_language VALUES('1956','admin_del_error','禁止删除创始人','1','0','0','0','cn');
INSERT INTO met_language VALUES('1957','sethttps','开启后系统自动替换本站所有http路径并清除模板缓存','1','0','0','0','cn');
INSERT INTO met_language VALUES('1958','404page','404 页面内容','1','0','0','0','cn');
INSERT INTO met_language VALUES('1959','data_null','无内容提示文字','1','0','0','0','cn');
INSERT INTO met_language VALUES('1960','column_other_info','栏目其他信息','1','0','0','0','cn');
INSERT INTO met_language VALUES('1961','column_custom_info','自定义栏目信息','1','0','0','0','cn');
INSERT INTO met_language VALUES('1962','seting','设置','1','0','0','0','cn');
INSERT INTO met_language VALUES('1963','special_che_deny','请勿使用特殊字符','1','0','0','0','cn');
INSERT INTO met_language VALUES('1964','clearThumb','清除缩略图','1','0','0','0','cn');
INSERT INTO met_language VALUES('1965','operation_log','操作日志','1','0','0','0','cn');
INSERT INTO met_language VALUES('1966','request_address','请求地址','1','0','0','0','cn');
INSERT INTO met_language VALUES('1967','request_result','请求结果','1','0','0','0','cn');
INSERT INTO met_language VALUES('1968','admin_log','开启后台操作日志','1','0','0','0','cn');
INSERT INTO met_language VALUES('1969','associated_columns','关联栏目','1','0','0','0','cn');
INSERT INTO met_language VALUES('1970','pass_empty','不输入不会更改密码','1','0','0','0','cn');
INSERT INTO met_language VALUES('1971','unzip_tips','解压会覆盖upload文件夹中相同命名的文件','1','0','0','0','cn');
INSERT INTO met_language VALUES('1972','adminFunOperate','功能模块操作权限','1','0','0','0','cn');
INSERT INTO met_language VALUES('1973','tags_title','标签页面Title','1','0','0','0','cn');
INSERT INTO met_language VALUES('1974','tags_title_tips','Tgas页面标题','1','0','0','0','cn');
INSERT INTO met_language VALUES('1975','text_size','字体大小','1','0','0','0','cn');
INSERT INTO met_language VALUES('1976','desc_size','描述字体大小','1','0','0','0','cn');
INSERT INTO met_language VALUES('1977','desc_color','描述字体大小','1','0','0','0','cn');
INSERT INTO met_language VALUES('1978','column_style_tips','该设置需要模板支持','1','0','0','0','cn');
INSERT INTO met_language VALUES('1979','content_style_tips','该设置一般只在信息列表中有效','1','0','0','0','cn');
INSERT INTO met_language VALUES('1980','modifyaccemail','绑定邮箱修改邮件','1','0','0','0','cn');
INSERT INTO met_language VALUES('1981','temSupport','此功能需要模板支持','1','0','0','0','cn');
INSERT INTO met_language VALUES('1982','update','更新','1','0','0','0','cn');
INSERT INTO met_language VALUES('1983','onlyInStyle3','仅在风格3中生效','1','0','0','0','cn');
INSERT INTO met_language VALUES('1984','thumb_tips','(宽 X 高)(像素)模块默认缩略图尺寸，可视化编辑中可独立设置每个栏目的缩略图尺寸。','1','0','0','0','cn');
INSERT INTO met_language VALUES('1985','freeapp','免费插件','1','0','0','0','cn');
INSERT INTO met_language VALUES('1986','businessapp','商业插件','1','0','0','0','cn');
INSERT INTO met_language VALUES('1987','chargeapp','收费插件','1','0','0','0','cn');
INSERT INTO met_language VALUES('1988','userCondition','注册米拓用户中心可免费下载使用','1','0','0','0','cn');
INSERT INTO met_language VALUES('1989','installCondition','购买米拓企业建站系统商业版可在绑定域名站点下安装使用','1','0','0','0','cn');
INSERT INTO met_language VALUES('1990','buyCondition','单独购买后可在一个绑定域名站点下安装使用','1','0','0','0','cn');
INSERT INTO met_language VALUES('1991','thumb_size_list','列表页缩略图尺寸','1','0','0','0','cn');
INSERT INTO met_language VALUES('1992','thumb_size_showpage','详情页缩略图尺寸','1','0','0','0','cn');
INSERT INTO met_language VALUES('1993','thumb_seting_tips','详情页缩略图尺寸、选项卡请在对应栏目的可视化编辑“当前页设置”中设置','1','0','0','0','cn');
INSERT INTO met_language VALUES('1994','top_menu','顶部菜单','1','0','0','0','cn');
INSERT INTO met_language VALUES('1995','admin_name_repeat','管理员姓名不能重复','1','0','0','0','cn');
INSERT INTO met_language VALUES('1996','ing','中','1','0','0','0','cn');
INSERT INTO met_language VALUES('1997','static_page_success','静态页面生成完成','1','0','0','0','cn');
INSERT INTO met_language VALUES('1998','successful_conversion','转换成功！','1','0','0','0','cn');
INSERT INTO met_language VALUES('1999','full_site','全站','1','0','0','0','cn');
INSERT INTO met_language VALUES('2000','settings_tab','设置选项卡','1','0','0','0','cn');
INSERT INTO met_language VALUES('2001','custom_info','自定义信息','1','0','0','0','cn');
INSERT INTO met_language VALUES('2002','admin_content_list1','点击表格每行空白部分上下拖曳后保存即可改变排序','1','0','0','0','cn');
INSERT INTO met_language VALUES('2003','module_reply1','多个号码请用|隔开','1','0','0','0','cn');
INSERT INTO met_language VALUES('2004','module_reply2','回复短信内容需要在短信功能提供平台提交内容模板审核，审核通过后才能发送成功。','1','0','0','0','cn');
INSERT INTO met_language VALUES('2005','online_list1','号码/链接/图片','1','0','0','0','cn');
INSERT INTO met_language VALUES('2006','choice_style','风格选择','1','0','0','0','cn');
INSERT INTO met_language VALUES('2007','reading_authority','阅读权限','1','0','0','0','cn');
INSERT INTO met_language VALUES('2008','empty_not_modified','为空则不修改','1','0','0','0','cn');
INSERT INTO met_language VALUES('2009','button','按钮','1','0','0','0','cn');
INSERT INTO met_language VALUES('2010','fliptext1','查看更多','1','0','0','0','cn');
INSERT INTO met_language VALUES('2011','being_imported','正在导入中，请不要操作。','1','0','0','0','cn');
INSERT INTO met_language VALUES('2012','least_one_item','请选择至少一项。','1','0','0','0','cn');
INSERT INTO met_language VALUES('2013','feedfback','反馈','1','0','0','0','cn');
INSERT INTO met_language VALUES('2014','message','留言','1','0','0','0','cn');
INSERT INTO met_language VALUES('2015','job','招聘','1','0','0','0','cn');
INSERT INTO met_language VALUES('2016','product','产品','1','0','0','0','cn');
INSERT INTO met_language VALUES('2017','saving','保存中，请等待...','1','0','0','0','cn');
INSERT INTO met_language VALUES('2018','no_data','暂无数据','1','0','0','0','cn');
INSERT INTO met_language VALUES('2019','numbering','编号','1','0','0','0','cn');
INSERT INTO met_language VALUES('2020','successful_syn','同步成功','1','0','0','0','cn');
INSERT INTO met_language VALUES('2021','failed_syn','同步失败','1','0','0','0','cn');
INSERT INTO met_language VALUES('2022','being_synced','正在同步中，请耐心等待。','1','0','0','0','cn');
INSERT INTO met_language VALUES('2023','national_flag','国旗','1','0','0','0','cn');
INSERT INTO met_language VALUES('2024','national_flag_tips1','自定义国旗gif图片可放置在网站public/images/flag/文件夹下','1','0','0','0','cn');
INSERT INTO met_language VALUES('2025','manage_tips1','点击收起/展开栏目列表','1','0','0','0','cn');
INSERT INTO met_language VALUES('2026','set_default_section','设置默认栏目','1','0','0','0','cn');
INSERT INTO met_language VALUES('2027','enter_user_name','请输入用户名','1','0','0','0','cn');
INSERT INTO met_language VALUES('2028','system_plugin_uninstall','系统插件，无法卸载','1','0','0','0','cn');
INSERT INTO met_language VALUES('2029','install_first','请先安装！','1','0','0','0','cn');
INSERT INTO met_language VALUES('2030','upgrade','升级中，请稍后...','1','0','0','0','cn');
INSERT INTO met_language VALUES('2031','file_download_failed','文件下载失败','1','0','0','0','cn');
INSERT INTO met_language VALUES('2032','column_search','栏目搜索','1','0','0','0','cn');
INSERT INTO met_language VALUES('2033','advanced_search','高级搜索','1','0','0','0','cn');
INSERT INTO met_language VALUES('2034','replacement_text','替换文字不能为空','1','0','0','0','cn');
INSERT INTO met_language VALUES('2035','default','默认','1','0','0','0','cn');
INSERT INTO met_language VALUES('2036','valid_phone_number','请输入有效电话号码','1','0','0','0','cn');
INSERT INTO met_language VALUES('2037','valid_email_address','请输入有效邮箱地址','1','0','0','0','cn');
INSERT INTO met_language VALUES('2038','button_text','按钮文字','1','0','0','0','cn');
INSERT INTO met_language VALUES('2039','open_mode','打开方式','1','0','0','0','cn');
INSERT INTO met_language VALUES('2040','button_size','按钮大小','1','0','0','0','cn');
INSERT INTO met_language VALUES('2041','button_color','按钮颜色','1','0','0','0','cn');
INSERT INTO met_language VALUES('2042','mouse_over_button_color','鼠标经过按钮颜色','1','0','0','0','cn');
INSERT INTO met_language VALUES('2043','mouse_over_text_color','鼠标经过文字颜色','1','0','0','0','cn');
INSERT INTO met_language VALUES('2044','font_size','文字大小','1','0','0','0','cn');
INSERT INTO met_language VALUES('2045','display_client','显示客户端','1','0','0','0','cn');
INSERT INTO met_language VALUES('2046','original_window','原窗口','1','0','0','0','cn');
INSERT INTO met_language VALUES('2047','new_window','新窗口','1','0','0','0','cn');
INSERT INTO met_language VALUES('2048','mobile_terminal','手机端','1','0','0','0','cn');
INSERT INTO met_language VALUES('2049','image_title_font_size','图片标题字体大小','1','0','0','0','cn');
INSERT INTO met_language VALUES('2050','image_description_font_size','图片描述字体大小','1','0','0','0','cn');
INSERT INTO met_language VALUES('2051','mobile_terminal_settings','手机端设置','1','0','0','0','cn');
INSERT INTO met_language VALUES('2052','mobile_phone_picture_title','手机端图片标题','1','0','0','0','cn');
INSERT INTO met_language VALUES('2053','banner_edit1','如不填写设置，则保持和电脑端一致','1','0','0','0','cn');
INSERT INTO met_language VALUES('2054','banner_edit2','手机端图片标题颜色：','1','0','0','0','cn');
INSERT INTO met_language VALUES('2055','banner_edit3','手机端图片标题字体大小','1','0','0','0','cn');
INSERT INTO met_language VALUES('2056','banner_edit5','手机端图片描述','1','0','0','0','cn');
INSERT INTO met_language VALUES('2057','banner_edit6','手机端图片描述颜色','1','0','0','0','cn');
INSERT INTO met_language VALUES('2058','banner_edit7','手机端图片描述字体大小','1','0','0','0','cn');
INSERT INTO met_language VALUES('2059','banner_edit8','手机端图片文字位置','1','0','0','0','cn');
INSERT INTO met_language VALUES('2060','feedbackTip5','导出当前选中信息','1','0','0','0','cn');
INSERT INTO met_language VALUES('2061','setimgLeftMid','左中','1','0','0','0','cn');
INSERT INTO met_language VALUES('2062','function_ency1','此处仅列出传统后台功能，更多设置功能，请在可视化编辑后台按栏目和页面编辑。','1','0','0','0','cn');
INSERT INTO met_language VALUES('2063','environmental_test','环境检测','1','0','0','0','cn');
INSERT INTO met_language VALUES('2064','function_ency2','请在“栏目管理”中添加对应模块栏目后再在相应功能菜单中进行管理。','1','0','0','0','cn');
INSERT INTO met_language VALUES('2065','sms_function','短信功能','1','0','0','0','cn');
INSERT INTO met_language VALUES('2066','website_overview','网站概况','1','0','0','0','cn');
INSERT INTO met_language VALUES('2067','system_cache','系统缓存','1','0','0','0','cn');
INSERT INTO met_language VALUES('2068','help_manual','帮助手册','1','0','0','0','cn');
INSERT INTO met_language VALUES('2069','online_quiz','在线问答','1','0','0','0','cn');
INSERT INTO met_language VALUES('2070','online_work_order','在线工单','1','0','0','0','cn');
INSERT INTO met_language VALUES('2071','admin_job1','需要到招聘职位管理的职位中添加简历接收邮箱','1','0','0','0','cn');
INSERT INTO met_language VALUES('2072','admin_manage1','点击左侧栏目列表管理内容','1','0','0','0','cn');
INSERT INTO met_language VALUES('2073','admin_menu1','此功能需要模板支持，部分模板底部自带了手机菜单，请在可视化界面设置。','1','0','0','0','cn');
INSERT INTO met_language VALUES('2074','search_range','搜索范围','1','0','0','0','cn');
INSERT INTO met_language VALUES('2075','search_weight','模块排序','1','0','0','0','cn');
INSERT INTO met_language VALUES('2076','search_weight_tips','左右拖动调整模块排序。全局搜索结果将根据模块排序依次展示','1','0','0','0','cn');
INSERT INTO met_language VALUES('2077','admin_search1','指定一级栏目','1','0','0','0','cn');
INSERT INTO met_language VALUES('2078','admin_search2','是否开启搜索方式','1','0','0','0','cn');
INSERT INTO met_language VALUES('2079','admin_search3','是否联动','1','0','0','0','cn');
INSERT INTO met_language VALUES('2080','admin_search4','搜索框默认内容','1','0','0','0','cn');
INSERT INTO met_language VALUES('2081','admin_search5','当前所属一级栏目','1','0','0','0','cn');
INSERT INTO met_language VALUES('2082','admin_search6','搜索方式','1','0','0','0','cn');
INSERT INTO met_language VALUES('2083','admin_search7','标题和内容','1','0','0','0','cn');
INSERT INTO met_language VALUES('2084','by_module','按模块','1','0','0','0','cn');
INSERT INTO met_language VALUES('2085','by_column','按栏目','1','0','0','0','cn');
INSERT INTO met_language VALUES('2086','admin_seo1','index-语言标识.html(如：index-cn.html)','1','0','0','0','cn');
INSERT INTO met_language VALUES('2087','admin_seo2','目录名称/list-静态页面名称或ID-语言标识.html(如：product/list-1-cn.html)','1','0','0','0','cn');
INSERT INTO met_language VALUES('2088','admin_seo3','目录名称/静态页面名称或ID-语言标识.html(如：product/100-cn.html)','1','0','0','0','cn');
INSERT INTO met_language VALUES('2089','admin_tag_setting1','TAG标签设置','1','0','0','0','cn');
INSERT INTO met_language VALUES('2090','admin_tag_setting2','TAG标签生成规则','1','0','0','0','cn');
INSERT INTO met_language VALUES('2091','admin_tag_setting3','按一级栏目','1','0','0','0','cn');
INSERT INTO met_language VALUES('2092','admin_tag_setting4','TAG标签聚合规则','1','0','0','0','cn');
INSERT INTO met_language VALUES('2093','admin_tag_setting5','设置了相同TAG标签的内容','1','0','0','0','cn');
INSERT INTO met_language VALUES('2094','admin_tag_setting6','内容详情页聚合条数','1','0','0','0','cn');
INSERT INTO met_language VALUES('2095','add_tag','添加标签','1','0','0','0','cn');
INSERT INTO met_language VALUES('2096','admin_tag_setting8','请先在栏目管理”中添加设置\"TAG标签”模块的栏目，前台访问地址为','1','0','0','0','cn');
INSERT INTO met_language VALUES('2097','tag_name','标签名称','1','0','0','0','cn');
INSERT INTO met_language VALUES('2098','add_manully','手动添加','1','0','0','0','cn');
INSERT INTO met_language VALUES('2099','aggregation_range','聚合范围','1','0','0','0','cn');
INSERT INTO met_language VALUES('2100','admin_tag_setting7','不填写则使用系统默认值','1','0','0','0','cn');
INSERT INTO met_language VALUES('2101','admin_tag_setting9','标签名称格式不正确','1','0','0','0','cn');
INSERT INTO met_language VALUES('2102','admin_tag_setting10','静态页面名称格式不正确','1','0','0','0','cn');
INSERT INTO met_language VALUES('2103','system_check1','检查你的服务器是否支持系统所有功能。','1','0','0','0','cn');
INSERT INTO met_language VALUES('2104','system_check2','环境/函数检测结果','1','0','0','0','cn');
INSERT INTO met_language VALUES('2105','system_check3','文件和目录权限','1','0','0','0','cn');
INSERT INTO met_language VALUES('2106','system_check4','要能正常使用系统的缓存、伪静态、上传文件功能，需要将以下文件/目录设置为 \"可写\"。下面是需要设置为\"可写\" 的目录清单，以及建议的 CHMOD 设置。','1','0','0','0','cn');
INSERT INTO met_language VALUES('2107','system_check5','某些主机不允许你设置 CHMOD 777，要用666。先试最高的值，不行的话，再逐步降低该值。','1','0','0','0','cn');
INSERT INTO met_language VALUES('2108','visualization1','长按需要修改的地方即可触发修改功能','1','0','0','0','cn');
INSERT INTO met_language VALUES('2109','stand_by','支持','1','0','0','0','cn');
INSERT INTO met_language VALUES('2110','close_this_time','本次关闭','1','0','0','0','cn');
INSERT INTO met_language VALUES('2111','rename_admin_dir','当前系统环境不支持修改后台文件夹名称，请手动进行修改。','1','0','0','0','cn');
INSERT INTO met_language VALUES('2112','notemptips','当前语言没有设置网站模板，请到“风格-网站模板”中选择1套模板','1','0','0','0','cn');
INSERT INTO met_language VALUES('2113','short_message','短信','1','0','0','0','cn');
INSERT INTO met_language VALUES('2114','common_qq','普通QQ','1','0','0','0','cn');
INSERT INTO met_language VALUES('2115','enterprise_qq','企业QQ','1','0','0','0','cn');
INSERT INTO met_language VALUES('2116','back_folder_list','返回文件夹列表','1','0','0','0','cn');
INSERT INTO met_language VALUES('2117','back_icon_iibrary_list','返回图标库列表','1','0','0','0','cn');
INSERT INTO met_language VALUES('2118','choose_icon_tips','点击选中图标并保存','1','0','0','0','cn');
INSERT INTO met_language VALUES('2119','jump_to_no','跳转到第','1','0','0','0','cn');
INSERT INTO met_language VALUES('2120','page','页','1','0','0','0','cn');
INSERT INTO met_language VALUES('2121','goto','跳转','1','0','0','0','cn');
INSERT INTO met_language VALUES('2122','save_image_to_website','保存图片到本地','1','0','0','0','cn');
INSERT INTO met_language VALUES('2123','save_allimages_to_website','保存全部图片到本地','1','0','0','0','cn');
INSERT INTO met_language VALUES('2124','block_style','区块风格','1','0','0','0','cn');
INSERT INTO met_language VALUES('2125','change','切换','1','0','0','0','cn');
INSERT INTO met_language VALUES('2126','change_blockstyle_tips','选择好风格后请点击【切换】按钮','1','0','0','0','cn');
INSERT INTO met_language VALUES('2127','installing','安装中，请不要操作。','1','0','0','0','cn');
INSERT INTO met_language VALUES('2128','databacking','备份中，请不要操作。','1','0','0','0','cn');
INSERT INTO met_language VALUES('2129','already_update_package','存在手动升级包','1','0','0','0','cn');
INSERT INTO met_language VALUES('2130','edit_authority','前台编辑权限','1','0','0','0','cn');
INSERT INTO met_language VALUES('2131','editable','可编辑','1','0','0','0','cn');
INSERT INTO met_language VALUES('2132','non_editable','不可编辑','1','0','0','0','cn');
INSERT INTO met_language VALUES('2133','cv_export','导出简历','1','0','0','0','cn');
INSERT INTO met_language VALUES('2134','access_type','阅读权限展示方式','1','0','0','0','cn');
INSERT INTO met_language VALUES('2135','access_type1','前台显示无权限信息，点击阅读后判断权限','1','0','0','0','cn');
INSERT INTO met_language VALUES('2136','access_type2','前台不显示无权限信息','1','0','0','0','cn');
INSERT INTO met_language VALUES('2137','database_switch','数据库切换','1','0','0','0','cn');
INSERT INTO met_language VALUES('2138','database_switch_tips','网站使用过程中请不要频繁切换数据库类型，部分应用不支持sqlite数据库，建议使用更为稳定高效的mysql数据库','1','0','0','0','cn');
INSERT INTO met_language VALUES('2139','database_switch_tips1','请配置MySQL数据库参数，数据库信息可联系你的服务器提供商获取','1','0','0','0','cn');
INSERT INTO met_language VALUES('2140','database_switch_tips2','例如：met_ 请不要留空，且使用“_”结尾','1','0','0','0','cn');
INSERT INTO met_language VALUES('2141','database_switch_tips3','一般不需要更改，参考主机或服务器MYSQL控制面板','1','0','0','0','cn');
INSERT INTO met_language VALUES('2142','database_switch_tips4','例如\"met\"或\"my_met\",请确保用字母开头','1','0','0','0','cn');
INSERT INTO met_language VALUES('2143','database_type','数据库类型','1','0','0','0','cn');
INSERT INTO met_language VALUES('2144','table_prefix','数据表前缀','1','0','0','0','cn');
INSERT INTO met_language VALUES('2145','database_address','数据库连接地址','1','0','0','0','cn');
INSERT INTO met_language VALUES('2146','database_name','数据库名','1','0','0','0','cn');
INSERT INTO met_language VALUES('2147','database_user','数据库用户名','1','0','0','0','cn');
INSERT INTO met_language VALUES('2148','database_password','数据库密码','1','0','0','0','cn');
INSERT INTO met_language VALUES('2149','read_protocol','请仔细阅读以下协议','1','0','0','0','cn');
INSERT INTO met_language VALUES('2150','disagree','不同意','1','0','0','0','cn');
INSERT INTO met_language VALUES('2151','agree','同意','1','0','0','0','cn');
INSERT INTO met_language VALUES('2152','copyright_nofollow','前台版权链接nofollow属性','1','0','0','0','cn');
INSERT INTO met_language VALUES('2153','copyright_nofollow_description','开启后前台底部版权链接会添加nofollow属性','1','0','0','0','cn');
INSERT INTO met_language VALUES('2154','close_allchildcolumn_v6','隐藏所有子栏目','1','0','0','0','cn');
INSERT INTO met_language VALUES('2155','emailhave','邮箱已被注册','1','0','0','0','cn');
INSERT INTO met_language VALUES('2156','telhave','手机号已被注册','1','0','0','0','cn');
INSERT INTO met_language VALUES('2157','noupdate','没有可用更新','1','0','0','0','cn');
INSERT INTO met_language VALUES('2158','delete_all_saveimgbtn','删除全部保存图片按钮','1','0','0','0','cn');
INSERT INTO met_language VALUES('2159','fdinc_msg_content','前台留言列表的默认回复内容会调用该设置','1','0','0','0','cn');
INSERT INTO met_language VALUES('2160','third_party_error','非默认语言不可开启社会化登陆功能','1','0','0','0','cn');
INSERT INTO met_language VALUES('2161','show_video','展示视频','1','0','0','0','cn');
INSERT INTO met_language VALUES('2162','show_video_tips','仅限添加一个视频，请不要在此添加图文。添加视频后前台会像淘宝一样显示一个播放按钮在展示图片上，点击按钮即可播放视频','1','0','0','0','cn');
INSERT INTO met_language VALUES('2163','copyright_type','系统版权文字风格','1','0','0','0','cn');
INSERT INTO met_language VALUES('2164','copyright_type_tips1','请务必遵守','1','0','0','0','cn');
INSERT INTO met_language VALUES('2165','copyright_type_tips2','米拓企业建站系统最终用户授权许可协议','1','0','0','0','cn');
INSERT INTO met_language VALUES('2166','copyright_type_tips3','如需修改或去除官方版权标识，请购买','1','0','0','0','cn');
INSERT INTO met_language VALUES('2167','copyright_type_tips4','版权标识修改许可','1','0','0','0','cn');
INSERT INTO met_language VALUES('2168','video_switch','产品模块视频播放控制','1','0','0','0','cn');
INSERT INTO met_language VALUES('2169','auto_play_tips','通过外链添加视频网站的视频不支持自动播放（根据浏览器规则，自动播放默认静音）','1','0','0','0','cn');
INSERT INTO met_language VALUES('2170','auto_play_pc','电脑端自动播放','1','0','0','0','cn');
INSERT INTO met_language VALUES('2171','auto_play_mobile','移动端自动播放','1','0','0','0','cn');
INSERT INTO met_language VALUES('2172','auto_play_tips1','如关闭则自动播放设置无效','1','0','0','0','cn');
INSERT INTO met_language VALUES('2173','relation_data','关联内容','1','0','0','0','cn');
INSERT INTO met_language VALUES('2174','relation_data_add','添加关联内容','1','0','0','0','cn');
INSERT INTO met_language VALUES('2175','relation_add','添加关联','1','0','0','0','cn');
INSERT INTO met_language VALUES('2176','relation_cancel','取消关联','1','0','0','0','cn');
INSERT INTO met_language VALUES('2177','relation_checked','已关联','1','0','0','0','cn');
INSERT INTO met_language VALUES('2178','relation_tips','显示该内容需要模板支持','1','0','0','0','cn');
INSERT INTO met_language VALUES('2179','auto_close','播放完毕后自动关闭','1','0','0','0','cn');
INSERT INTO met_language VALUES('2180','auto_show','默认显示视频','1','0','0','0','cn');
INSERT INTO met_language VALUES('2181','open_wechat','添加微信好友','1','0','0','0','cn');
INSERT INTO met_language VALUES('2182','info_security_statement_tips2','文字默认以高亮颜色显示，如果文字中有书名号“《》“，则仅有书名号及其包含文字以高亮颜色显示','1','0','0','0','cn');
INSERT INTO met_language VALUES('2183','myfiles','文件管理','1','0','0','0','cn');
INSERT INTO met_language VALUES('2184','permission_member','member','1','0','0','0','cn');
INSERT INTO met_language VALUES('2185','permission_new_member','New member','1','0','0','0','cn');
INSERT INTO met_language VALUES('2186','permission_role','role','1','0','0','0','cn');
INSERT INTO met_language VALUES('2187','permission_new_role','New role','1','0','0','0','cn');
INSERT INTO met_language VALUES('2188','permission_role_name','name','1','0','0','0','cn');
INSERT INTO met_language VALUES('2189','permission_role_desc','description','1','0','0','0','cn');
INSERT INTO met_language VALUES('2190','permission_role_access','Access','1','0','0','0','cn');
INSERT INTO met_language VALUES('2191','permission_left_menus','Left Bar Menu','1','0','0','0','cn');
INSERT INTO met_language VALUES('2192','permission_top_menus','Top bar menu','1','0','0','0','cn');
INSERT INTO met_language VALUES('2193','permission_ui_set_menus','Visual top bar menu','1','0','0','0','cn');
INSERT INTO met_language VALUES('2194','permission_apps','Apps','1','0','0','0','cn');
INSERT INTO met_language VALUES('2195','permission_columns','Columns','1','0','0','0','cn');
INSERT INTO met_language VALUES('2196','permission_actions','Actions','1','0','0','0','cn');
INSERT INTO met_language VALUES('2197','permission_menus','Menus','1','0','0','0','cn');
INSERT INTO met_language VALUES('2198','permission_sys','System funcs','1','0','0','0','cn');
INSERT INTO met_language VALUES('2199','permission_web_lang','Sites','1','0','0','0','cn');
INSERT INTO met_language VALUES('2200','permissions_lang_content_manage','Content','1','0','0','0','cn');
INSERT INTO met_language VALUES('2201','permissions_lang_column_manage','Column','1','0','0','0','cn');
INSERT INTO met_language VALUES('2202','permissions_lang_feedback_interaction','Feedback','1','0','0','0','cn');
INSERT INTO met_language VALUES('2203','permissions_lang_seo_settings','SEO settings','1','0','0','0','cn');
INSERT INTO met_language VALUES('2204','permissions_lang_site_template','Templates','1','0','0','0','cn');
INSERT INTO met_language VALUES('2205','permissions_lang_application','Apps','1','0','0','0','cn');
INSERT INTO met_language VALUES('2206','permissions_lang_user_manage','Users','1','0','0','0','cn');
INSERT INTO met_language VALUES('2207','permissions_lang_security_setting','Security setting','1','0','0','0','cn');
INSERT INTO met_language VALUES('2208','permissions_lang_multilingual','Multilingual','1','0','0','0','cn');
INSERT INTO met_language VALUES('2209','permissions_lang_basic_settings','Basic Settings','1','0','0','0','cn');
INSERT INTO met_language VALUES('2210','permissions_lang_enterprise_market','Platforms','1','0','0','0','cn');
INSERT INTO met_language VALUES('2211','permissions_lang_feedback_system','Feedback system','1','0','0','0','cn');
INSERT INTO met_language VALUES('2212','permissions_lang_message_system','Message system','1','0','0','0','cn');
INSERT INTO met_language VALUES('2213','permissions_lang_recruitment_system','Recruitment system','1','0','0','0','cn');
INSERT INTO met_language VALUES('2214','permissions_lang_online_settings','Customer service settings','1','0','0','0','cn');
INSERT INTO met_language VALUES('2215','permissions_lang_members','Members','1','0','0','0','cn');
INSERT INTO met_language VALUES('2216','permissions_lang_admins','Administrators','1','0','0','0','cn');
INSERT INTO met_language VALUES('2217','permissions_lang_safety_efficiency','Safety and efficiency','1','0','0','0','cn');
INSERT INTO met_language VALUES('2218','permissions_lang_backup_Recovery','Backup and Recovery','1','0','0','0','cn');
INSERT INTO met_language VALUES('2219','permissions_lang_basic_info','Basic info','1','0','0','0','cn');
INSERT INTO met_language VALUES('2220','permissions_lang_watermark','Watermark settings','1','0','0','0','cn');
INSERT INTO met_language VALUES('2221','permissions_lang_banner_manage','Banners','1','0','0','0','cn');
INSERT INTO met_language VALUES('2222','permissions_lang_mobile_menus','H5 Menus','1','0','0','0','cn');
INSERT INTO met_language VALUES('2223','permissions_lang_app_install','Install apps','1','0','0','0','cn');
INSERT INTO met_language VALUES('2224','permissions_lang_app_uninstall','Uninstall apps','1','0','0','0','cn');
INSERT INTO met_language VALUES('2225','permissions_lang_add','Add Content','1','0','0','0','cn');
INSERT INTO met_language VALUES('2226','permissions_lang_edit','Edit Content','1','0','0','0','cn');
INSERT INTO met_language VALUES('2227','permissions_lang_delete','Delete Content','1','0','0','0','cn');
INSERT INTO met_language VALUES('2228','permissions_lang_column_add','Add columns','1','0','0','0','cn');
INSERT INTO met_language VALUES('2229','permissions_lang_column_edit','Edit column','1','0','0','0','cn');
INSERT INTO met_language VALUES('2230','permissions_lang_column_del','Delete columns','1','0','0','0','cn');
INSERT INTO met_language VALUES('2231','permissions_lang_admin_pop','Visual','1','0','0','0','cn');
INSERT INTO met_language VALUES('2232','databackup7','Full backup','1','244','8','0','en');
INSERT INTO met_language VALUES('2233','indexpic','Watermark','1','64','13','0','en');
INSERT INTO met_language VALUES('2234','adminmobile','Phone','1','16','2','0','en');
INSERT INTO met_language VALUES('2235','cooperation_platform','Platforms','1','436','0','0','en');
INSERT INTO met_language VALUES('2236','feedback_interaction','Interaction','1','437','0','0','en');
INSERT INTO met_language VALUES('2237','banner_manage','Banner Manage','1','438','0','0','en');
INSERT INTO met_language VALUES('2238','unitytxt_71','QR code','1','435','0','0','en');
INSERT INTO met_language VALUES('2239','unitytxt_69','Installation file deletion','1','433','8','0','en');
INSERT INTO met_language VALUES('2240','unitytxt_70','upload files','1','434','8','0','en');
INSERT INTO met_language VALUES('2241','unitytxt_39','Settings','1','403','1','0','en');
INSERT INTO met_language VALUES('2242','unitytxt_42','List page shows the number of each page','1','406','0','0','en');
INSERT INTO met_language VALUES('2243','unitytxt_38','The code will be placed above the & lt; / body & gt; tag','1','402','39','0','en');
INSERT INTO met_language VALUES('2244','unitytxt_37','The code will be placed above the & lt; / head & gt; tag','1','401','39','0','en');
INSERT INTO met_language VALUES('2245','unitytxt_33','Permission settings','1','397','39','0','en');
INSERT INTO met_language VALUES('2246','unitytxt_34','Data file upload','1','398','40','0','en');
INSERT INTO met_language VALUES('2247','unitytxt_36','PC-side third-party code (generally used to place Baidu Bridge code, webmaster code, Google translation code, etc.)','1','400','39','0','en');
INSERT INTO met_language VALUES('2248','unitytxt_25','Keyword setting','1','389','32','0','en');
INSERT INTO met_language VALUES('2249','unitytxt_26','Optimize text settings (can be used to increase keyword density)','1','390','32','0','en');
INSERT INTO met_language VALUES('2250','unitytxt_15','Other settings','1','379','0','0','en');
INSERT INTO met_language VALUES('2251','unitytxt_13','Bottom information settings (displayed at the bottom of the site front desk)','1','377','39','0','en');
INSERT INTO met_language VALUES('2252','unitytxt_14','Style set','1','378','23','0','en');
INSERT INTO met_language VALUES('2253','unitytxt_10','Only applicable to the Chinese front language (language logo cn or zh effective); visitors can switch between simplified and traditional.','1','374','16','0','en');
INSERT INTO met_language VALUES('2254','unitytxt_9','Synchronize the official parameters','1','373','16','0','en');
INSERT INTO met_language VALUES('2255','unitytxt_8','The language is set up an independent domain name, you need to modify the website URL in the <font class = \"red\"> language settings </ font> to modify.','1','372','39','0','en');
INSERT INTO met_language VALUES('2256','unitytxt_7','After the backup package is downloaded, it is recommended to delete the backup file in time to avoid affecting the size of the space (you can save the traffic through FTP if your web host limited the traffic)','1','371','0','0','en');
INSERT INTO met_language VALUES('2257','unitytxt_6','Inconsistent version','1','370','0','0','en');
INSERT INTO met_language VALUES('2258','unitytxt_2','Check to use the default settings','1','366','0','0','en');
INSERT INTO met_language VALUES('2259','ssl','SSL service method','1','362','39','0','en');
INSERT INTO met_language VALUES('2260','tls','TLS service','1','363','39','0','en');
INSERT INTO met_language VALUES('2261','loginFail','operation failed!','1','359','8','0','en');
INSERT INTO met_language VALUES('2262','NoidJS','Without this user','1','349','38','0','en');
INSERT INTO met_language VALUES('2263','jsx32','Login timeout, please log in again!','1','344','0','0','en');
INSERT INTO met_language VALUES('2264','jsx27','Static page name already exists','1','339','0','0','en');
INSERT INTO met_language VALUES('2265','jsx20','Detecting ...','1','332','0','0','en');
INSERT INTO met_language VALUES('2266','jsx17','Upload success!','1','329','0','0','en');
INSERT INTO met_language VALUES('2267','jsx15','Upload','1','327','1','0','en');
INSERT INTO met_language VALUES('2268','jsx10','error','1','322','0','0','en');
INSERT INTO met_language VALUES('2269','jsx2','Please choose at least one language!','1','314','0','0','en');
INSERT INTO met_language VALUES('2270','jsx3','Please select the form you want to copy first','1','315','0','0','en');
INSERT INTO met_language VALUES('2271','jsx1','loading...','1','313','0','0','en');
INSERT INTO met_language VALUES('2272','js67','Please select at least one of the columns','1','309','0','0','en');
INSERT INTO met_language VALUES('2273','js55','return','1','297','1','0','en');
INSERT INTO met_language VALUES('2274','js56','To move a column must set a new directory name (directory name can only be numbers or letters)','1','298','0','0','en');
INSERT INTO met_language VALUES('2275','js46','Can not repeat','1','288','0','0','en');
INSERT INTO met_language VALUES('2276','js49','Undo','1','291','0','0','en');
INSERT INTO met_language VALUES('2277','js41','Can not be empty!','1','283','0','0','en');
INSERT INTO met_language VALUES('2278','js36','Please select a language','1','278','0','0','en');
INSERT INTO met_language VALUES('2279','js35','Uploading a temporary folder (upload_tmp_dir) is not writable or the domain / background folder / include / upload.php does not have access.','1','277','0','0','en');
INSERT INTO met_language VALUES('2280','js25','Image address can not be empty!','1','267','0','0','en');
INSERT INTO met_language VALUES('2281','js23','No records selected!','1','265','0','0','en');
INSERT INTO met_language VALUES('2282','js18','The original text can not be empty','1','260','0','0','en');
INSERT INTO met_language VALUES('2283','js15','Please choose to upload the file','1','257','0','0','en');
INSERT INTO met_language VALUES('2284','js16','Download address can not be empty','1','258','0','0','en');
INSERT INTO met_language VALUES('2285','js14','Please select two and three columns','1','256','0','0','en');
INSERT INTO met_language VALUES('2286','js10','Your changes have not been saved, are you sure you want to leave?','1','252','0','0','en');
INSERT INTO met_language VALUES('2287','js6','The password entered twice is not the same','1','248','0','0','en');
INSERT INTO met_language VALUES('2288','js7','Are you sure you want to delete the selected message? Once deleted will not be able to recover!','1','249','1','0','en');
INSERT INTO met_language VALUES('2289','js5','email can not be empty','1','247','0','0','en');
INSERT INTO met_language VALUES('2290','js4','Login password can not be blank','1','246','0','0','en');
INSERT INTO met_language VALUES('2291','js2','The data is wrong','1','244','0','0','en');
INSERT INTO met_language VALUES('2292','js1','Please wait, the system test ....','1','243','0','0','en');
INSERT INTO met_language VALUES('2293','dataerror','data error','1','242','0','0','en');
INSERT INTO met_language VALUES('2294','jsok','Success','1','241','1','0','en');
INSERT INTO met_language VALUES('2295','marks',':','1','238','0','0','en');
INSERT INTO met_language VALUES('2296','displayimg','Show pictures','1','235','0','0','en');
INSERT INTO met_language VALUES('2297','Operating','operating system','1','233','37','0','en');
INSERT INTO met_language VALUES('2298','noorderinfo','The smaller the value the more forward','1','234','0','0','en');
INSERT INTO met_language VALUES('2299','contentdetail','details','1','227','0','0','en');
INSERT INTO met_language VALUES('2300','content','content','1','226','1','0','en');
INSERT INTO met_language VALUES('2301','webaccess','access permission','1','225','0','0','en');
INSERT INTO met_language VALUES('2302','keywordsinfo','Please use multiple keywords, \",\" separated','1','223','0','0','en');
INSERT INTO met_language VALUES('2303','keywords','Key words','1','222','0','0','en');
INSERT INTO met_language VALUES('2304','hits','The number of clicks','1','221','0','0','en');
INSERT INTO met_language VALUES('2305','addtime','release time','1','220','0','0','en');
INSERT INTO met_language VALUES('2306','updatetime','Update time','1','219','0','0','en');
INSERT INTO met_language VALUES('2307','access3','administrator','1','218','0','0','en');
INSERT INTO met_language VALUES('2308','access2','Agents','1','217','0','0','en');
INSERT INTO met_language VALUES('2309','access1','Ordinary member','1','216','0','0','en');
INSERT INTO met_language VALUES('2310','access0','Not limited to','1','215','0','0','en');
INSERT INTO met_language VALUES('2311','access','Permissions','1','214','0','0','en');
INSERT INTO met_language VALUES('2312','read','Have read','1','210','0','0','en');
INSERT INTO met_language VALUES('2313','parameter','parameter','1','208','0','0','en');
INSERT INTO met_language VALUES('2314','search','search for','1','206','0','0','en');
INSERT INTO met_language VALUES('2315','manager','Content manage','1','205','19','0','en');
INSERT INTO met_language VALUES('2316','top','Stick to the top','1','202','0','0','en');
INSERT INTO met_language VALUES('2317','wap','wap','1','201','0','0','en');
INSERT INTO met_language VALUES('2318','recom','recommend','1','200','0','0','en');
INSERT INTO met_language VALUES('2319','image','image','1','198','0','0','en');
INSERT INTO met_language VALUES('2320','title','title','1','197','0','0','en');
INSERT INTO met_language VALUES('2321','description','Short description','1','196','0','0','en');
INSERT INTO met_language VALUES('2322','selected','select','1','192','0','0','en');
INSERT INTO met_language VALUES('2323','metinfo','MetInfo enterprise website management system','1','189','0','0','en');
INSERT INTO met_language VALUES('2324','no','no','1','188','0','0','en');
INSERT INTO met_language VALUES('2325','yes','Yes','1','187','0','0','en');
INSERT INTO met_language VALUES('2326','sort','Sort','1','186','0','0','en');
INSERT INTO met_language VALUES('2327','type','Types of','1','185','0','0','en');
INSERT INTO met_language VALUES('2328','close','shut down','1','184','0','0','en');
INSERT INTO met_language VALUES('2329','open','Open','1','183','0','0','en');
INSERT INTO met_language VALUES('2330','operate','operating','1','182','0','0','en');
INSERT INTO met_language VALUES('2331','preview','Preview','1','181','0','0','en');
INSERT INTO met_language VALUES('2332','delete','delete','1','180','0','0','en');
INSERT INTO met_language VALUES('2333','modify','modify','1','179','0','0','en');
INSERT INTO met_language VALUES('2334','View','View','1','178','0','0','en');
INSERT INTO met_language VALUES('2335','editor','edit','1','177','0','0','en');
INSERT INTO met_language VALUES('2336','add','Add to','1','176','0','0','en');
INSERT INTO met_language VALUES('2337','addsubcolumn','Add sub column','1','176','0','0','en');
INSERT INTO met_language VALUES('2338','Submitall','submit','1','172','26','0','en');
INSERT INTO met_language VALUES('2339','Copy','copy','1','174','0','0','en');
INSERT INTO met_language VALUES('2340','langadderr4','Unable to sync official language packs.','1','166','16','0','en');
INSERT INTO met_language VALUES('2341','langadderr5','You deleted the default language! Please set another language as the default language and then operate!','1','167','16','0','en');
INSERT INTO met_language VALUES('2342','basictips7','E-mail set up correctly!','1','162','39','0','en');
INSERT INTO met_language VALUES('2343','basictips6','<b> Workaround: </ b> Check your account password and smtp for errors or check if your mailbox has smtp service enabled.','1','161','39','0','en');
INSERT INTO met_language VALUES('2344','basictips5','<b> Error tip: </ b> failed to test email!','1','160','39','0','en');
INSERT INTO met_language VALUES('2345','basictips3','Mail sending test','1','158','39','0','en');
INSERT INTO met_language VALUES('2346','basictips4','E-mail received indicates that your site\'s system mailbox settings are correct.','1','159','39','0','en');
INSERT INTO met_language VALUES('2347','upfileFail10','Imagejpeg function is not supported','1','125','8','0','en');
INSERT INTO met_language VALUES('2348','upfileFail11','Imagepng function is not supported','1','126','8','0','en');
INSERT INTO met_language VALUES('2349','upfileFail9','The imagegif function is not supported','1','124','8','0','en');
INSERT INTO met_language VALUES('2350','upfileFail8','File corruption, thumbnail generation failed','1','123','8','0','en');
INSERT INTO met_language VALUES('2351','upfileFail7','Does not support the current file format to generate thumbnails, please upload JPG, GIF, PNG pictures','1','122','8','0','en');
INSERT INTO met_language VALUES('2352','upfileFail6','Space does not support GD library, can not generate thumbnails','1','121','8','0','en');
INSERT INTO met_language VALUES('2353','upfileFail5','The bmp format does not automatically generate thumbnails','1','120','8','0','en');
INSERT INTO met_language VALUES('2354','upfileFail4','Failed to create directory','1','119','8','0','en');
INSERT INTO met_language VALUES('2355','upfileOver4','upload folder does not write permission, please contact space to modify.','1','116','8','0','en');
INSERT INTO met_language VALUES('2356','upfileOver5','Upload temporary folder (upload_tmp_dir) no write permission, please contact the space to modify.','1','117','8','0','en');
INSERT INTO met_language VALUES('2357','upfileOver3','No files have been uploaded','1','115','8','0','en');
INSERT INTO met_language VALUES('2358','upfileOver2','Only part of the file is uploaded.','1','114','8','0','en');
INSERT INTO met_language VALUES('2359','upfileOver','The uploaded file exceeded the limit of upload_max_filesize option in php.ini.','1','112','8','0','en');
INSERT INTO met_language VALUES('2360','upfileOver1','The size of the uploaded file exceeds the value specified by the MAX_FILE_SIZE option in the HTML form.','1','113','8','0','en');
INSERT INTO met_language VALUES('2361','upfileTip3','File format does not allow uploading.','1','110','8','0','en');
INSERT INTO met_language VALUES('2362','upfileTip1',', Can not upload.','1','108','8','0','en');
INSERT INTO met_language VALUES('2363','upfileFail2','Failed to create picture directory','1','103','8','0','en');
INSERT INTO met_language VALUES('2364','upfileMax','Size exceeds system limit','1','106','8','0','en');
INSERT INTO met_language VALUES('2365','upfileFile','upload files','1','105','8','0','en');
INSERT INTO met_language VALUES('2366','funNav4','Show','1','94','5','0','en');
INSERT INTO met_language VALUES('2367','indexfeedbackm','Feedback management','1','79','8','0','en');
INSERT INTO met_language VALUES('2368','indexlink','Links','1','78','8','0','en');
INSERT INTO met_language VALUES('2369','indexhtm','Static page generation','1','74','8','0','en');
INSERT INTO met_language VALUES('2370','indexhtmset','Static pages','1','73','8','0','en');
INSERT INTO met_language VALUES('2371','indexcv','Resume parameter configuration','1','70','8','0','en');
INSERT INTO met_language VALUES('2372','indexflash','Banner management','1','67','4','0','en');
INSERT INTO met_language VALUES('2373','indexbbs','About','1','63','8','0','en');
INSERT INTO met_language VALUES('2374','indexcode','Commercial authorization','1','61','8','0','en');
INSERT INTO met_language VALUES('2375','indexlang','language settings','1','54','8','0','en');
INSERT INTO met_language VALUES('2376','indexloginout','drop out','1','51','8','0','en');
INSERT INTO met_language VALUES('2377','indexuser','User Management','1','47','8','0','en');
INSERT INTO met_language VALUES('2378','indexcontent','Content management','1','44','8','0','en');
INSERT INTO met_language VALUES('2379','indexadmin','Functions','1','50','8','0','en');
INSERT INTO met_language VALUES('2380','indexadminname','Administrator management','1','80','8','0','en');
INSERT INTO met_language VALUES('2381','loginall','You do not have to add, modify, delete the permissions of the information, please contact the administrator to open','1','39','8','0','en');
INSERT INTO met_language VALUES('2382','loginedit','You do not have permission to modify the information, please contact the administrator to open','1','38','0','0','en');
INSERT INTO met_language VALUES('2383','loginadd','You do not have permission to add information, please contact the administrator to open','1','37','8','0','en');
INSERT INTO met_language VALUES('2384','logindelete','You do not have permission to delete information, please contact the administrator to open','1','36','8','0','en');
INSERT INTO met_language VALUES('2385','loginpass','wrong user name or password','1','35','8','0','en');
INSERT INTO met_language VALUES('2386','loginname','wrong user name or password','1','34','18','0','en');
INSERT INTO met_language VALUES('2387','logincodeerror','Verification code error','1','33','18','0','en');
INSERT INTO met_language VALUES('2388','loginconfirm','log in','1','32','18','0','en');
INSERT INTO met_language VALUES('2389','loginforget','forget password?','1','31','18','0','en');
INSERT INTO met_language VALUES('2390','loginusename','username','1','27','8','0','en');
INSERT INTO met_language VALUES('2391','loginpassword','password','1','28','8','0','en');
INSERT INTO met_language VALUES('2392','logincode','Verification code','1','29','8','0','en');
INSERT INTO met_language VALUES('2393','loginlanguage','Language Settings','1','26','18','0','en');
INSERT INTO met_language VALUES('2394','loginmetinfo','MetInfo','1','25','8','0','en');
INSERT INTO met_language VALUES('2395','loginadmin','Administrator login','1','24','18','0','en');
INSERT INTO met_language VALUES('2396','logintitle','Background login','1','21','18','0','en');
INSERT INTO met_language VALUES('2397','loginid','Username can not be empty','1','22','18','0','en');
INSERT INTO met_language VALUES('2398','myapps','Applications','1','20','36','0','en');
INSERT INTO met_language VALUES('2399','myapp','Apps','1','20','36','0','en');
INSERT INTO met_language VALUES('2400','recycle','Content Recycle Bin','1','17','29','0','en');
INSERT INTO met_language VALUES('2401','managertyp5','Custom','1','9','2','0','en');
INSERT INTO met_language VALUES('2402','managertyp4','Content Manager','1','9','2','0','en');
INSERT INTO met_language VALUES('2403','managertyp2','administrator','1','7','2','0','en');
INSERT INTO met_language VALUES('2404','managertyp3','Optimize promotion','1','8','2','0','en');
INSERT INTO met_language VALUES('2405','managertyp1','Founder','1','6','2','0','en');
INSERT INTO met_language VALUES('2406','uplaoderr1','upload failed!','1','3','8','0','en');
INSERT INTO met_language VALUES('2407','clickview','Click to view','1','1','8','0','en');
INSERT INTO met_language VALUES('2408','membertips1','Registration time','1','105','38','0','en');
INSERT INTO met_language VALUES('2409','memberjstxt2','Please enter your password!','1','95','7','0','en');
INSERT INTO met_language VALUES('2410','memberCheck','Activate now','1','92','38','0','en');
INSERT INTO met_language VALUES('2411','memberMan','Mr','1','81','36','0','en');
INSERT INTO met_language VALUES('2412','memberCell','Phone','1','84','7','0','en');
INSERT INTO met_language VALUES('2413','memberTip','Please leave blank without modification','1','78','7','0','en');
INSERT INTO met_language VALUES('2414','memberTip1','Can not see? Click to change verification code','1','78','7','0','en');
INSERT INTO met_language VALUES('2415','memberName','Name','1','76','7','0','en');
INSERT INTO met_language VALUES('2416','memberCV','resume','1','74','15','0','en');
INSERT INTO met_language VALUES('2417','memberEmail','email address','1','67','7','0','en');
INSERT INTO met_language VALUES('2418','memberAdd','Add member','1','62','2','0','en');
INSERT INTO met_language VALUES('2419','memberChecked','activated','1','60','38','0','en');
INSERT INTO met_language VALUES('2420','memberUnChecked','inactivated','1','61','38','0','en');
INSERT INTO met_language VALUES('2421','memberManage','Member management','1','58','2','0','en');
INSERT INTO met_language VALUES('2422','memberlogin','Sign Up','1','51','38','0','en');
INSERT INTO met_language VALUES('2423','hello','Hello!','1','47','7','0','en');
INSERT INTO met_language VALUES('2424','getTip5','Retrieve the password','1','45','7','0','en');
INSERT INTO met_language VALUES('2425','getTip3','Email to create a new password link has been sent to your email address. Please change your password as soon as possible.','1','43','10','0','en');
INSERT INTO met_language VALUES('2426','getTip2','Thank you for your support and love for MetInfo and hope MetInfo will create value for your website!','1','42','10','0','en');
INSERT INTO met_language VALUES('2427','getTip1','Your password reset request has been verified. Please click the following link to enter your new password:','1','41','10','0','en');
INSERT INTO met_language VALUES('2428','getNotice','Administrator password retrieve','1','40','10','0','en');
INSERT INTO met_language VALUES('2429','adminpassTitle','Modify Personal Information','1','39','2','0','en');
INSERT INTO met_language VALUES('2430','adminSelectAll','All Selection','1','37','2','0','en');
INSERT INTO met_language VALUES('2431','adminOperate4','delete message','1','35','2','0','en');
INSERT INTO met_language VALUES('2432','adminOperate3','Modify information','1','34','2','0','en');
INSERT INTO met_language VALUES('2433','adminOperate1','fully control','1','32','2','0','en');
INSERT INTO met_language VALUES('2434','adminOperate2','add information','1','33','2','0','en');
INSERT INTO met_language VALUES('2435','adminPower','Information rights','1','29','2','0','en');
INSERT INTO met_language VALUES('2436','adminTip2','Only allow to view your published information','1','30','2','0','en');
INSERT INTO met_language VALUES('2437','adminTip3','Posting information needs to be reviewed in order to display properly','1','30','2','0','en');
INSERT INTO met_language VALUES('2438','adminOperate','Operating authority','1','31','2','0','en');
INSERT INTO met_language VALUES('2439','adminpassword1','Password Confirmation','1','21','2','0','en');
INSERT INTO met_language VALUES('2440','adminpassword','login password','1','20','7','0','en');
INSERT INTO met_language VALUES('2441','adminLastLogin','last login time','1','18','0','0','en');
INSERT INTO met_language VALUES('2442','adminLastIP','Finally login IP','1','19','0','0','en');
INSERT INTO met_language VALUES('2443','metadmin','administrator','1','12','0','0','en');
INSERT INTO met_language VALUES('2444','adminusername','username','1','13','0','0','en');
INSERT INTO met_language VALUES('2445','adminname','Name','1','14','0','0','en');
INSERT INTO met_language VALUES('2446','admin_email','Administrator mailbox','1','14','0','0','en');
INSERT INTO met_language VALUES('2447','admin_email_error','Administrator\'s mailbox has been occupied','1','14','0','0','en');
INSERT INTO met_language VALUES('2448','admin_mobile_error','The administrator\'s phone number has been occupied','1','14','0','0','en');
INSERT INTO met_language VALUES('2449','adminLoginNum','Login times','1','17','38','0','en');
INSERT INTO met_language VALUES('2450','admintips7','Administrator permission settings','1','11','2','0','en');
INSERT INTO met_language VALUES('2451','adminjurisd','Language permissions','1','5','2','0','en');
INSERT INTO met_language VALUES('2452','admintips1','All languages','1','6','0','0','en');
INSERT INTO met_language VALUES('2453','admintips2','Choose at least one','1','7','2','0','en');
INSERT INTO met_language VALUES('2454','admintips5','user group','1','10','0','0','en');
INSERT INTO met_language VALUES('2455','admintips4','New column permissions','1','9','2','0','en');
INSERT INTO met_language VALUES('2456','webcompre','The whole station compression package','1','3','8','0','en');
INSERT INTO met_language VALUES('2457','admininfo','Administrator basic information','1','4','0','0','en');
INSERT INTO met_language VALUES('2458','uploadfile','Upload folder','1','2','8','0','en');
INSERT INTO met_language VALUES('2459','database','database','1','1','8','0','en');
INSERT INTO met_language VALUES('2460','dlapptips6','Uninstall','1','294','6','0','en');
INSERT INTO met_language VALUES('2461','dlapptips5','turn on','1','293','6','0','en');
INSERT INTO met_language VALUES('2462','mobiletips3','Add content','1','284','0','0','en');
INSERT INTO met_language VALUES('2463','smstips64','Status all','1','245','6','0','en');
INSERT INTO met_language VALUES('2464','smstips24','Operating time','1','206','6','0','en');
INSERT INTO met_language VALUES('2465','smstips22','Account Balance','1','204','6','0','en');
INSERT INTO met_language VALUES('2466','smstips18','Type of operation','1','200','6','0','en');
INSERT INTO met_language VALUES('2467','smstips19','Recharge','1','201','6','0','en');
INSERT INTO met_language VALUES('2468','smstips17','sequence','1','199','6','0','en');
INSERT INTO met_language VALUES('2469','smstips9','yuan','1','191','6','0','en');
INSERT INTO met_language VALUES('2470','smstips6','current balance','1','188','6','0','en');
INSERT INTO met_language VALUES('2471','smstips7','payment method','1','189','6','0','en');
INSERT INTO met_language VALUES('2472','smstips1','Send in bulk','1','183','6','0','en');
INSERT INTO met_language VALUES('2473','smstips2','send record','1','184','6','0','en');
INSERT INTO met_language VALUES('2474','statip','IP','1','132','6','0','en');
INSERT INTO met_language VALUES('2475','smsrecharge','Recharge','1','113','6','0','en');
INSERT INTO met_language VALUES('2476','physicalfunction4','folder','1','103','1','0','en');
INSERT INTO met_language VALUES('2477','physicaldelok','successfully deleted','1','47','6','0','en');
INSERT INTO met_language VALUES('2478','physicalgenok','Generated successfully','1','49','6','0','en');
INSERT INTO met_language VALUES('2479','usertype3','Ordinary commercial authority','1','35','0','0','en');
INSERT INTO met_language VALUES('2480','usertype4','Advanced Business Licensing','1','36','0','0','en');
INSERT INTO met_language VALUES('2481','user_tips30_v6','Middle cross screen background of login interface (recommended size 1920 * 800 width * high)','1','0','38','0','en');
INSERT INTO met_language VALUES('2482','user_tips5_v6','The parameters are available, and the following parameters are referred to as variable parameters in the content of the mail.','1','0','38','0','en');
INSERT INTO met_language VALUES('2483','user_tips6_v6','Mail address URL the next operation, required. For example, retrieve the password mail, this address is the link to retrieve the password.','1','0','38','0','en');
INSERT INTO met_language VALUES('2484','user_Registeredmail_v6','Registered mail','1','0','38','0','en');
INSERT INTO met_language VALUES('2485','user_tips7_v6','Password retrieving mail','1','0','38','0','en');
INSERT INTO met_language VALUES('2486','user_tips8_v6','Need to be','1','0','38','0','en');
INSERT INTO met_language VALUES('2487','user_global_set','Global settings','1','0','38','0','en');
INSERT INTO met_language VALUES('2488','user_auto_register','Automatic registration system member','1','0','38','0','en');
INSERT INTO met_language VALUES('2489','user_auto_register_tips','With this configuration enabled, users log in for the first time with social account, and the website member account is automatically generated and bound with social account information by the system.','1','0','38','0','en');
INSERT INTO met_language VALUES('2490','user_QQinterconnect_v6','QQ interconnection','1','0','38','0','en');
INSERT INTO met_language VALUES('2491','user_tips9_v6','Application (Management Center - login - create application - Web site)','1','0','38','0','en');
INSERT INTO met_language VALUES('2492','user_backurl_v6','Authorization callback address','1','0','38','0','en');
INSERT INTO met_language VALUES('2493','user_tips10_v6','WeChat open platform','1','0','38','0','en');
INSERT INTO met_language VALUES('2494','user_Apply_v6','Apply','1','0','38','0','en');
INSERT INTO met_language VALUES('2495','user_tips11_v6','Member logon for PC side','1','0','38','0','en');
INSERT INTO met_language VALUES('2496','user_Openplatform_v6','Open platform','1','0','38','0','en');
INSERT INTO met_language VALUES('2497','user_publicplatform_v6','WeChat public platform','1','0','38','0','en');
INSERT INTO met_language VALUES('2498','user_tips13_v6','You need to get the web authorization function and set up the authorized domain name for your website domain name.','1','0','38','0','en');
INSERT INTO met_language VALUES('2499','user_tips14_v6','And add this WeChat public number to the open platform account.','1','0','38','0','en');
INSERT INTO met_language VALUES('2500','user_tips15_v6','Sina micro-blog','1','0','38','0','en');
INSERT INTO met_language VALUES('2501','user_tips16_v6','Micro-blog open platform','1','0','38','0','en');
INSERT INTO met_language VALUES('2502','user_tips17_v6','(Note: please apply for a web site not to apply for application)','1','0','38','0','en');
INSERT INTO met_language VALUES('2503','user_accsafe_v6','Account security','1','0','38','0','en');
INSERT INTO met_language VALUES('2504','user_PasswordReset_v6','Password Reset','1','0','38','0','en');
INSERT INTO met_language VALUES('2505','user_tips18_v6','6-30 character spacing is not modified','1','0','38','0','en');
INSERT INTO met_language VALUES('2506','user_emailuse_v6','Mailbox has been bound','1','0','38','0','en');
INSERT INTO met_language VALUES('2507','user_Accountstatus_v6','Account status','1','0','38','0','en');
INSERT INTO met_language VALUES('2508','user_must_v6','Required','1','0','38','0','en');
INSERT INTO met_language VALUES('2509','user_tips21_v6','The higher the value, the higher the reading authority','1','0','38','0','en');
INSERT INTO met_language VALUES('2510','member_agreement','User protocol function','1','0','0','0','en');
INSERT INTO met_language VALUES('2511','new_regist_admin_notice','Administrator notification','1','0','0','0','en');
INSERT INTO met_language VALUES('2512','new_regist_mail_open','Email notification','1','0','0','0','en');
INSERT INTO met_language VALUES('2513','new_regist_mail','Administrator mailbox','1','0','0','0','en');
INSERT INTO met_language VALUES('2514','new_regist_sms_open','SMS notification','1','0','0','0','en');
INSERT INTO met_language VALUES('2515','new_regist_sms','SMS notification number','1','0','0','0','en');
INSERT INTO met_language VALUES('2516','user_login_box_position','Login box location','1','0','0','0','en');
INSERT INTO met_language VALUES('2517','user_login_box_tips','The position of mobile phone is in the center','1','0','0','0','en');
INSERT INTO met_language VALUES('2518','user_login_bg_range_set','Background validation page','1','0','0','0','en');
INSERT INTO met_language VALUES('2519','user_login_bg_range_all_page','All pages of Member Center','1','0','0','0','en');
INSERT INTO met_language VALUES('2520','user_login_bg_range_login_page','Login page only','1','0','0','0','en');
INSERT INTO met_language VALUES('2521','user_Exportmember_v6','Export membership','1','0','38','0','en');
INSERT INTO met_language VALUES('2522','user_Registratset_v6','Registration settings','1','0','38','0','en');
INSERT INTO met_language VALUES('2523','user_Regverificat_v6','Registration verification','1','0','38','0','en');
INSERT INTO met_language VALUES('2524','user_tips23_v6','Mailbox is a username','1','0','38','0','en');
INSERT INTO met_language VALUES('2525','user_Mailvalidat_v6','Mail validation','1','0','38','0','en');
INSERT INTO met_language VALUES('2526','user_tips24_v6','(set up the system server box (settings - basic information - Send mailbox configuration)','1','0','38','0','en');
INSERT INTO met_language VALUES('2527','user_tips25_v6','Backstage review','1','0','38','0','en');
INSERT INTO met_language VALUES('2528','user_tips26_v6','Mobile phone number is username','1','0','38','0','en');
INSERT INTO met_language VALUES('2529','user_tips27_v6','Mobile phone short message verification','1','0','38','0','en');
INSERT INTO met_language VALUES('2530','user_tips28_v6','Short message service (my application - SMS)','1','0','38','0','en');
INSERT INTO met_language VALUES('2531','user_Notverifying_v6','Not verifying','1','0','38','0','en');
INSERT INTO met_language VALUES('2532','user_Backgroundpicture_v6','Background picture','1','0','38','0','en');
INSERT INTO met_language VALUES('2533','appinstall','installation','1','38','1','0','en');
INSERT INTO met_language VALUES('2534','appupgrade','upgrade','1','40','3','0','en');
INSERT INTO met_language VALUES('2535','usertype1','FREE','1','33','3','0','en');
INSERT INTO met_language VALUES('2536','csvnodata','no data','1','26','16','0','en');
INSERT INTO met_language VALUES('2537','wapdimensionalsize','size','1','20','6','0','en');
INSERT INTO met_language VALUES('2538','dltips7','Download timed out','1','195','0','0','en');
INSERT INTO met_language VALUES('2539','columnarrangement2','Switch to','1','197','19','0','en');
INSERT INTO met_language VALUES('2540','columnarrangement3','Classified by modlue','1','198','19','0','en');
INSERT INTO met_language VALUES('2541','columnarrangement4','Classified by column','1','199','19','0','en');
INSERT INTO met_language VALUES('2542','dltips6','Remote server request error','1','194','0','0','en');
INSERT INTO met_language VALUES('2543','dltips5','The file you requested does not exist','1','193','0','0','en');
INSERT INTO met_language VALUES('2544','dltips4','Please upgrade the program','1','192','0','0','en');
INSERT INTO met_language VALUES('2545','dltips3','You do not have permission to download this file','1','191','0','0','en');
INSERT INTO met_language VALUES('2546','dltips2','File download failed, please check the local directory permissions and space size','1','190','0','0','en');
INSERT INTO met_language VALUES('2547','dltips1','Can not connect to the remote server, please check the network','1','189','0','0','en');
INSERT INTO met_language VALUES('2548','seotips18','Filter external modules','1','182','5','0','en');
INSERT INTO met_language VALUES('2549','seotips19','Website language range','1','183','32','0','en');
INSERT INTO met_language VALUES('2550','seotips20','Current language','1','184','32','0','en');
INSERT INTO met_language VALUES('2551','seotips15_3','Suitable for Yahoo,','1','179','32','0','en');
INSERT INTO met_language VALUES('2552','seotips16','Filter columns and content','1','180','32','0','en');
INSERT INTO met_language VALUES('2553','seotips15_2','Suitable for Google and Baidu','1','178','32','0','en');
INSERT INTO met_language VALUES('2554','seotips15','Map URL','1','176','32','0','en');
INSERT INTO met_language VALUES('2555','seotips6','Home','1','166','0','0','en');
INSERT INTO met_language VALUES('2556','seotips9','Content page','1','169','32','0','en');
INSERT INTO met_language VALUES('2557','seotips14_1','How to submit to search engine?','1','175','32','0','en');
INSERT INTO met_language VALUES('2558','seotips14','Sitemaps help speed up your site\'s search engine listings','1','174','32','0','en');
INSERT INTO met_language VALUES('2559','seotips12','Will all static pages be generated immediately?','1','172','11','0','en');
INSERT INTO met_language VALUES('2560','seotips11','Delete all generated static pages?','1','171','11','0','en');
INSERT INTO met_language VALUES('2561','seotips1','Multiple keywords separated by vertical comma \",\" , recommended 3-4 keywords.','1','161','32','0','en');
INSERT INTO met_language VALUES('2562','statips27','time','1','124','0','0','en');
INSERT INTO met_language VALUES('2563','statips2','Statistics settings','1','101','0','0','en');
INSERT INTO met_language VALUES('2564','linkRecommend','Recommended site','1','91','17','0','en');
INSERT INTO met_language VALUES('2565','linkPass','examination passed','1','90','17','0','en');
INSERT INTO met_language VALUES('2566','linkLOGO','Website LOGO','1','87','17','0','en');
INSERT INTO met_language VALUES('2567','linkcontact','Contact information','1','88','0','0','en');
INSERT INTO met_language VALUES('2568','linktip1','Sites in the same state, the bigger the number, the higher the ranking','1','89','17','0','en');
INSERT INTO met_language VALUES('2569','linktip2','The ability to pass the review is displayed in the foreground, and the recommended site is displayed in the front.','1','89','17','0','en');
INSERT INTO met_language VALUES('2570','linkUrl','Website address','1','86','17','0','en');
INSERT INTO met_language VALUES('2571','linkKeys','Website keywords','1','83','17','0','en');
INSERT INTO met_language VALUES('2572','linkCheck','Audit','1','84','17','0','en');
INSERT INTO met_language VALUES('2573','linkName','Website title','1','82','17','0','en');
INSERT INTO met_language VALUES('2574','linkType4','Text link','1','80','17','0','en');
INSERT INTO met_language VALUES('2575','linkType5','LOGO link','1','81','17','0','en');
INSERT INTO met_language VALUES('2576','linkType1','Unaudited link','1','77','17','0','en');
INSERT INTO met_language VALUES('2577','linkType2','Recommended links','1','78','17','0','en');
INSERT INTO met_language VALUES('2578','linkType','Link type','1','75','17','0','en');
INSERT INTO met_language VALUES('2579','htmCreateAll','Generate all pages','1','63','11','0','en');
INSERT INTO met_language VALUES('2580','htmsitemap','Sitemap','1','61','0','0','en');
INSERT INTO met_language VALUES('2581','htmAll','All pages','1','59','11','0','en');
INSERT INTO met_language VALUES('2582','htmTip1','Generate content page','1','57','11','0','en');
INSERT INTO met_language VALUES('2583','htmTip2','Generate the list page','1','58','11','0','en');
INSERT INTO met_language VALUES('2584','htmColumn','Columns','1','56','0','0','en');
INSERT INTO met_language VALUES('2585','htmHome','Home page','1','54','4','0','en');
INSERT INTO met_language VALUES('2586','sethtmsitemap4','xml sitemap','1','53','32','0','en');
INSERT INTO met_language VALUES('2587','sethtmlist','List page name','1','47','11','0','en');
INSERT INTO met_language VALUES('2588','sethtmlist1','Default file name + class + page number (eg product_1_1)','1','48','11','0','en');
INSERT INTO met_language VALUES('2589','sethtmlist2','Where the folder name + class + page number (such as software_1_1)','1','49','11','0','en');
INSERT INTO met_language VALUES('2590','sethtmpage4','<span style = \"float: right;\"> Do not recommend frequent replacement, to ensure the SEO effect (please modify all static pages) </ span> Static page name rules','1','50','11','0','en');
INSERT INTO met_language VALUES('2591','sethtmpage3','Where the folder name + ID (such as product10)','1','43','11','0','en');
INSERT INTO met_language VALUES('2592','setlisthtmltype','List page type','1','44','11','0','en');
INSERT INTO met_language VALUES('2593','setlisthtmltype1','Show all section id (eg product_1_2_3)','1','45','11','0','en');
INSERT INTO met_language VALUES('2594','setlisthtmltype2','Only show this column id (such as product_1)','1','46','11','0','en');
INSERT INTO met_language VALUES('2595','sethtmpage2','Year, month, day + ID (such as 2009081510)','1','42','11','0','en');
INSERT INTO met_language VALUES('2596','sethtmpage1','The default file name + ID (such as showproduct10)','1','41','11','0','en');
INSERT INTO met_language VALUES('2597','sethtmpage','Content page name','1','40','11','0','en');
INSERT INTO met_language VALUES('2598','sethtmtype','Static page type','1','39','11','0','en');
INSERT INTO met_language VALUES('2599','sethtmway3','It is not recommended to enable the automatic generation function, which consumes a lot of resources. Only content management-related operations can be automatically generated. If other background settings are changed, no foreground creation needs to be manually generated.','1','38','11','0','en');
INSERT INTO met_language VALUES('2600','sethtmway2','Manually generated','1','37','11','0','en');
INSERT INTO met_language VALUES('2601','sethtmway','Generation method','1','35','11','0','en');
INSERT INTO met_language VALUES('2602','sethtmway1','Automatically generated when content information changes','1','36','11','0','en');
INSERT INTO met_language VALUES('2603','setbasicTip4','It is suggested that the enterprise station use the pseudo-static function, purely static consumption of resources and inconvenient management; the first time you open, click \"static page generation\" to generate all the pages','1','34','11','0','en');
INSERT INTO met_language VALUES('2604','sethtmok','Static pages open','1','31','11','0','en');
INSERT INTO met_language VALUES('2605','sethtmall','Station static','1','32','11','0','en');
INSERT INTO met_language VALUES('2606','setbasicTip3','Home page, content page static','1','33','11','0','en');
INSERT INTO met_language VALUES('2607','sethtmlmix','Mixed mode (static files are generated on the home page, column home page, and content page, and pseudo-static for column list pages)','1','33','11','0','en');
INSERT INTO met_language VALUES('2608','sethtm_auto','Static pages are automatically updated','1','35','11','0','en');
INSERT INTO met_language VALUES('2609','sethtm_auto_daily','Updated daily','1','35','11','0','en');
INSERT INTO met_language VALUES('2610','sethtm_auto_weekly','Updated weekly','1','35','11','0','en');
INSERT INTO met_language VALUES('2611','sethtm_auto_monthly','Updated monthly','1','35','11','0','en');
INSERT INTO met_language VALUES('2612','sethtm_auto_tips','The automatic update period is 00:00 ~ 04:00','1','35','11','0','en');
INSERT INTO met_language VALUES('2613','sethtm_auto_tips1','Example: if you select \"generate manually\" and \"update every week\", the system will automatically generate static pages at a fixed time every week','1','35','11','0','en');
INSERT INTO met_language VALUES('2614','labelUrl','link address','1','27','32','0','en');
INSERT INTO met_language VALUES('2615','htm','Static page has been successfully generated','1','30','11','0','en');
INSERT INTO met_language VALUES('2616','labelnum','Replacement times','1','23','32','0','en');
INSERT INTO met_language VALUES('2617','labelOld','Original text','1','24','32','0','en');
INSERT INTO met_language VALUES('2618','labelNew','Replace with','1','25','32','0','en');
INSERT INTO met_language VALUES('2619','setseoTip14','The title of the inner page is constructed so that you can also customize the title of the corresponding page when editing / adding content.','1','21','32','0','en');
INSERT INTO met_language VALUES('2620','setseotitletype','Inside page title (title)','1','16','32','0','en');
INSERT INTO met_language VALUES('2621','setseotitletype1','Content title','1','17','32','0','en');
INSERT INTO met_language VALUES('2622','setseotitletype2','Content title + website name','1','18','32','0','en');
INSERT INTO met_language VALUES('2623','setseotitletype3','Content title + website keyword','1','19','32','0','en');
INSERT INTO met_language VALUES('2624','setseotitletype4','Content title + website keyword + website name','1','20','32','0','en');
INSERT INTO met_language VALUES('2625','setseotitletype5','Content title + Column name + website name','1','20','32','0','en');
INSERT INTO met_language VALUES('2626','setseodopen','The current window opens','1','14','35','0','en');
INSERT INTO met_language VALUES('2627','setseonewopen','open in a new window','1','15','35','0','en');
INSERT INTO met_language VALUES('2628','setseoFoot','Website optimization at the bottom','1','11','32','0','en');
INSERT INTO met_language VALUES('2629','setseoTip9','Move the mouse to the text displayed on the hyperlink','1','9','32','0','en');
INSERT INTO met_language VALUES('2630','setseoTip8','Hyperlink default Title','1','8','32','0','en');
INSERT INTO met_language VALUES('2631','setseoTip7','Move the mouse to the text shown in the picture','1','7','32','0','en');
INSERT INTO met_language VALUES('2632','setseoTip6','Image default ALT','1','6','32','0','en');
INSERT INTO met_language VALUES('2633','setseoTip4','Head optimization text','1','5','32','0','en');
INSERT INTO met_language VALUES('2634','setseoTip10','Leave blank to use the website name - the way the website keywords are structured','1','4','32','0','en');
INSERT INTO met_language VALUES('2635','setseoKey','Website keywords','1','2','32','0','en');
INSERT INTO met_language VALUES('2636','setseohomeKey','Home title (title)','1','3','32','0','en');
INSERT INTO met_language VALUES('2637','setseoTip1','Multiple keywords should be separated by \",\".','1','1','0','0','en');
INSERT INTO met_language VALUES('2638','setheadstat','Top code','1','176','39','0','en');
INSERT INTO met_language VALUES('2639','recycledietime','Delete the time','1','121','29','0','en');
INSERT INTO met_language VALUES('2640','recyclere','reduction','1','122','29','0','en');
INSERT INTO met_language VALUES('2641','messageeditor','Edit message','1','113','20','0','en');
INSERT INTO met_language VALUES('2642','messagesubmit','Message submitted to open and close','1','112','20','0','en');
INSERT INTO met_language VALUES('2643','messageeditorReply','Respond to voicemail','1','109','20','0','en');
INSERT INTO met_language VALUES('2644','messageeditorCheck','Reply to the audit','1','110','20','0','en');
INSERT INTO met_language VALUES('2645','messageeditorShow','Approved and shown in the foreground','1','111','20','0','en');
INSERT INTO met_language VALUES('2646','messageTime','Submit time','1','106','20','0','en');
INSERT INTO met_language VALUES('2647','messageID','Message status','1','105','20','0','en');
INSERT INTO met_language VALUES('2648','messageTel','phone','1','103','20','0','en');
INSERT INTO met_language VALUES('2649','messageTitle','Message management','1','96','0','0','en');
INSERT INTO met_language VALUES('2650','messageVoice','Message form settings','1','443','0','0','en');
INSERT INTO met_language VALUES('2651','messageincTip3','Customer message needs to be back in the background audit before the show','1','93','20','0','en');
INSERT INTO met_language VALUES('2652','messageincShow','Display method','1','92','20','0','en');
INSERT INTO met_language VALUES('2653','feedbackauto','Mail reply settings','1','90','0','0','en');
INSERT INTO met_language VALUES('2654','messageincTitle','Message system settings','1','91','0','0','en');
INSERT INTO met_language VALUES('2655','feedbackexplain1','Page title name, the default is the name of the section','1','89','9','0','en');
INSERT INTO met_language VALUES('2656','feedbacksubmit','Feedback submitted to open and close','1','88','9','0','en');
INSERT INTO met_language VALUES('2657','fdeditorFrom','Source page address','1','85','9','0','en');
INSERT INTO met_language VALUES('2658','fdeditorRecord','Edit records','1','86','9','0','en');
INSERT INTO met_language VALUES('2659','fdeditorInterest','Product of interest','1','83','9','0','en');
INSERT INTO met_language VALUES('2660','fdeditorTime','Feedback submission time','1','84','9','0','en');
INSERT INTO met_language VALUES('2661','feedbackAccess0','Tourists','1','82','0','0','en');
INSERT INTO met_language VALUES('2662','feedbackTip4','Export all','1','80','9','0','en');
INSERT INTO met_language VALUES('2663','feedbackTip2','Export EXCEL table','1','79','9','0','en');
INSERT INTO met_language VALUES('2664','feedbackTime','Submit time','1','78','9','0','en');
INSERT INTO met_language VALUES('2665','feedbackID','Feedback status','1','77','9','0','en');
INSERT INTO met_language VALUES('2666','feedbackClass2','Unread message','1','74','0','0','en');
INSERT INTO met_language VALUES('2667','feedbackClass3','Read the information','1','75','0','0','en');
INSERT INTO met_language VALUES('2668','feedbackClass','Information status','1','71','0','0','en');
INSERT INTO met_language VALUES('2669','fdincFeedbackTitle','Reply mail title','1','68','0','0','en');
INSERT INTO met_language VALUES('2670','fdincAutoFbTitle','Auto reply email title','1','69','4','0','en');
INSERT INTO met_language VALUES('2671','fdincAutoContent','Reply mail content','1','70','0','0','en');
INSERT INTO met_language VALUES('2672','fdincEmailName','Email field name','1','66','0','0','en');
INSERT INTO met_language VALUES('2673','fdincTip11','Used to retrieve the user\'s email address, in order to reply to the mail. Field type must be \"email\"','1','67','0','0','en');
INSERT INTO met_language VALUES('2674','fdincTip10','Check to automatically reply to the user submitting the form','1','65','0','0','en');
INSERT INTO met_language VALUES('2675','fdincAuto','Mail reply','1','64','0','0','en');
INSERT INTO met_language VALUES('2676','fdincTip9','Multiple emails should be separated by |','1','63','0','0','en');
INSERT INTO met_language VALUES('2677','fdincAcceptMail','Feedback mail receiving mailbox','1','62','9','0','en');
INSERT INTO met_language VALUES('2678','fdincTip7','Mail received','1','60','0','0','en');
INSERT INTO met_language VALUES('2679','fdincTip14','SMS Notification Number','1','61','0','0','en');
INSERT INTO met_language VALUES('2680','fdincAccept','Mail received','1','59','0','0','en');
INSERT INTO met_language VALUES('2681','fdincTip6','It is used to get the type of user feedback. The type of the field must be \"pull-down\" \"Radio\" \"short\". When set as the associated product, the pull-down menu is all the products under the corresponding column.','1','57','9','0','en');
INSERT INTO met_language VALUES('2682','fdincAcceptType','Information reception method','1','58','9','0','en');
INSERT INTO met_language VALUES('2683','fdincClassName','Information Category field name','1','56','9','0','en');
INSERT INTO met_language VALUES('2684','fdincSlash','Sensitive character filtering','1','54','0','0','en');
INSERT INTO met_language VALUES('2685','fdincTip4','Second, the same IP2 times to submit the minimum interval','1','53','0','0','en');
INSERT INTO met_language VALUES('2686','fdincName','Feedback form name','1','51','9','0','en');
INSERT INTO met_language VALUES('2687','fdincTime','Anti-refresh time','1','52','0','0','en');
INSERT INTO met_language VALUES('2688','fdincTitle','Feedback system settings','1','50','25','0','en');
INSERT INTO met_language VALUES('2689','phoneNumCheck','Verify mobile phone number','1','50','25','0','en');
INSERT INTO met_language VALUES('2690','phoneNumCheckTips','Verify the authenticity of mobile phone number through SMS verification code','1','50','25','0','en');
INSERT INTO met_language VALUES('2691','smsApiSetTips','Set SMS Api','1','50','25','0','en');
INSERT INTO met_language VALUES('2692','mailboxSetTips','Set mailbox','1','50','25','0','en');
INSERT INTO met_language VALUES('2693','jobmanagement','Recruitment management','1','48','0','0','en');
INSERT INTO met_language VALUES('2694','jobtip9','Resume photo, so that you can see in the mail candidates upload photos.','1','47','0','0','en');
INSERT INTO met_language VALUES('2695','jobtip8','Image field name','1','46','0','0','en');
INSERT INTO met_language VALUES('2696','jobtip5','After the delivery resume, the system will automatically send an e-mail to receive mail','1','45','15','0','en');
INSERT INTO met_language VALUES('2697','cvset','Resume form settings','1','44','0','0','en');
INSERT INTO met_language VALUES('2698','cvmanagement','Resume information management','1','43','0','0','en');
INSERT INTO met_language VALUES('2699','cvemail','Resume to accept the mailbox','1','42','15','0','en');
INSERT INTO met_language VALUES('2700','cvall','All','1','39','3','0','en');
INSERT INTO met_language VALUES('2701','cvincAcceptType','Resume reception method','1','37','0','0','en');
INSERT INTO met_language VALUES('2702','cvincAcceptMail','Resume to receive mail','1','36','0','0','en');
INSERT INTO met_language VALUES('2703','cvincTip4','Individual position','1','34','0','0','en');
INSERT INTO met_language VALUES('2704','cvincTip3','Uniform setting','1','33','0','0','en');
INSERT INTO met_language VALUES('2705','cvincTip2','Mail reception method','1','32','0','0','en');
INSERT INTO met_language VALUES('2706','josAlways','Not limited to','1','31','0','0','en');
INSERT INTO met_language VALUES('2707','cvAddtime','Submit time','1','28','0','0','en');
INSERT INTO met_language VALUES('2708','cvPosition','apply for job','1','26','4','0','en');
INSERT INTO met_language VALUES('2709','jobtip3','Day (not limited to)','1','25','15','0','en');
INSERT INTO met_language VALUES('2710','jobnow','Today is','1','23','15','0','en');
INSERT INTO met_language VALUES('2711','jobtip2','Be careful not to change the format.','1','24','15','0','en');
INSERT INTO met_language VALUES('2712','jobdeal','Wages','1','22','15','0','en');
INSERT INTO met_language VALUES('2713','jobtip1','Person (not limited to)','1','21','15','0','en');
INSERT INTO met_language VALUES('2714','jobpublish','Release date','1','19','15','0','en');
INSERT INTO met_language VALUES('2715','joblife','Effective time','1','18','15','0','en');
INSERT INTO met_language VALUES('2716','jobnum','Number of recruits','1','16','15','0','en');
INSERT INTO met_language VALUES('2717','jobaddress','work place','1','17','15','0','en');
INSERT INTO met_language VALUES('2718','jobposition','Jobs','1','15','15','0','en');
INSERT INTO met_language VALUES('2719','setfootstat','Bottom code','1','11','39','0','en');
INSERT INTO met_language VALUES('2720','setfootOther','other information','1','10','39','0','en');
INSERT INTO met_language VALUES('2721','setfootAddressCode','Address Postcode','1','8','39','0','en');
INSERT INTO met_language VALUES('2722','setfootVersion','Copyright Information','1','7','39','0','en');
INSERT INTO met_language VALUES('2723','seticpinfo','ICP Info','1','7','39','0','en');
INSERT INTO met_language VALUES('2724','seticpinfo','','1','10','39','0','en');
INSERT INTO met_language VALUES('2725','article6','parameter settings','1','6','0','0','en');
INSERT INTO met_language VALUES('2726','article4','Sort the larger the value of the more front. You can drag it up and down to sort','1','4','0','0','en');
INSERT INTO met_language VALUES('2727','article1','Optional attributes','1','1','0','0','en');
INSERT INTO met_language VALUES('2728','copyotherlang6','Please select the language to copy to','1','139','5','0','en');
INSERT INTO met_language VALUES('2729','copyotherlang5','Level 2 and Level 3 can not be copied separately, please copy together with a level or upgrade to a level','1','139','5','0','en');
INSERT INTO met_language VALUES('2730','copyotherlang4','The column already exists in the copy language, please copy the content directly','1','138','5','0','en');
INSERT INTO met_language VALUES('2731','copyotherlang2','Copy content','1','136','5','0','en');
INSERT INTO met_language VALUES('2732','ctitleinfo','Is used to set the SEO parameters set in the title structure','1','134','0','0','en');
INSERT INTO met_language VALUES('2733','copyotherlang1','Copy to other languages','1','135','5','0','en');
INSERT INTO met_language VALUES('2734','listproductre','related products','1','132','9','0','en');
INSERT INTO met_language VALUES('2735','listproductreok','Not related','1','133','9','0','en');
INSERT INTO met_language VALUES('2736','parameter3','text','1','123','25','0','en');
INSERT INTO met_language VALUES('2737','parameter4','Multiple choice','1','124','25','0','en');
INSERT INTO met_language VALUES('2738','parameter5','annex','1','125','25','0','en');
INSERT INTO met_language VALUES('2739','parameter6','Radio','1','126','25','0','en');
INSERT INTO met_language VALUES('2740','parameter8','tel','1','9','2','0','en');
INSERT INTO met_language VALUES('2741','parameter9','email','1','9','2','0','en');
INSERT INTO met_language VALUES('2742','allcategory','All sections','1','127','0','0','en');
INSERT INTO met_language VALUES('2743','category','belongs to part','1','40','3','0','en');
INSERT INTO met_language VALUES('2744','listTitle','Setting Options','1','130','0','0','en');
INSERT INTO met_language VALUES('2745','parameter1','short','1','121','25','0','en');
INSERT INTO met_language VALUES('2746','parameter2','drop down','1','122','25','0','en');
INSERT INTO met_language VALUES('2747','parametertype','Field Type','1','119','0','0','en');
INSERT INTO met_language VALUES('2748','columnmtitle','Page Title','1','118','0','0','en');
INSERT INTO met_language VALUES('2749','columnmappend','Additional content','1','116','0','0','en');
INSERT INTO met_language VALUES('2750','columnmore','More','1','117','3','0','en');
INSERT INTO met_language VALUES('2751','columnmfeedback','Feedback form settings','1','108','0','0','en');
INSERT INTO met_language VALUES('2752','columnmnotallow','Not allowed','1','105','0','0','en');
INSERT INTO met_language VALUES('2753','columnmeditor','Edit section','1','103','19','0','en');
INSERT INTO met_language VALUES('2754','columnmallow','allow','1','104','0','0','en');
INSERT INTO met_language VALUES('2755','columnmove','Move column','1','97','0','0','en');
INSERT INTO met_language VALUES('2756','columnmove1','mobile','1','98','0','0','en');
INSERT INTO met_language VALUES('2757','columnexplain7','This feature is compatible with the old version (the role of the column in the foreground corresponding display)','1','95','0','0','en');
INSERT INTO met_language VALUES('2758','columnerr7','Promoted to a column','1','87','5','0','en');
INSERT INTO met_language VALUES('2759','columnerr4','The directory name already exists and may already be used','1','84','30','0','en');
INSERT INTO met_language VALUES('2760','columntip14','Is the use of static pages set to set the URL of the way, do not add html suffix, does not support special characters','1','80','0','0','en');
INSERT INTO met_language VALUES('2761','columnImg2','Column picture','1','74','0','0','en');
INSERT INTO met_language VALUES('2762','columnshow','Add content','1','75','0','0','en');
INSERT INTO met_language VALUES('2763','columnhref','link address','1','71','5','0','en');
INSERT INTO met_language VALUES('2764','columntip7','Links to external websites need to add http or https, such as: https://www.metinfo.cn/','1','72','0','0','en');
INSERT INTO met_language VALUES('2765','columnImg1','Logo picture','1','73','0','0','en');
INSERT INTO met_language VALUES('2766','columnSEO','Search engine optimization settings (seo)','1','70','0','0','en');
INSERT INTO met_language VALUES('2767','columnhtmlname','Static page name','1','69','0','0','en');
INSERT INTO met_language VALUES('2768','columnaddOrder','order','1','68','0','0','en');
INSERT INTO met_language VALUES('2769','columnReverseSort','Reverse order','1','67','0','0','en');
INSERT INTO met_language VALUES('2770','columncontentorder','List page Sort by','1','66','0','0','en');
INSERT INTO met_language VALUES('2771','columnnav4','Show','1','63','0','0','en');
INSERT INTO met_language VALUES('2772','columnnewwindow','open in a new window','1','64','0','0','en');
INSERT INTO met_language VALUES('2773','columnnav3','Tail navigation bar','1','62','0','0','en');
INSERT INTO met_language VALUES('2774','columnnav2','Head main navigation bar','1','61','0','0','en');
INSERT INTO met_language VALUES('2775','columntip1','Please refer to','1','59','0','0','en');
INSERT INTO met_language VALUES('2776','columnnav1','Do not show','1','60','0','0','en');
INSERT INTO met_language VALUES('2777','columnctitle','Column title (title)','1','53','0','0','en');
INSERT INTO met_language VALUES('2778','columnstyle','Column style','1','56','0','0','en');
INSERT INTO met_language VALUES('2779','columnmark','Column mark','1','56','0','0','en');
INSERT INTO met_language VALUES('2780','columndocument','Directory name','1','51','32','0','en');
INSERT INTO met_language VALUES('2781','columnmodule','Own module','1','50','5','0','en');
INSERT INTO met_language VALUES('2782','columnnav','Navigation bar is displayed','1','49','0','0','en');
INSERT INTO met_language VALUES('2783','columnnamemarkinfo','Other settings (set according to the template configuration instructions)','1','48','0','0','en');
INSERT INTO met_language VALUES('2784','columnnamemark','Column modification name','1','47','3','0','en');
INSERT INTO met_language VALUES('2785','columnname','program name','1','46','0','0','en');
INSERT INTO met_language VALUES('2786','addinfo','Add content','1','38','0','0','en');
INSERT INTO met_language VALUES('2787','downloadurl','download link','1','36','40','0','en');
INSERT INTO met_language VALUES('2788','modpublish','publisher','1','29','0','0','en');
INSERT INTO met_language VALUES('2789','modimgurls','Thumbnail','1','28','13','0','en');
INSERT INTO met_language VALUES('2790','modimgurl','The map\'s address','1','26','13','0','en');
INSERT INTO met_language VALUES('2791','modClass3','Three columns','1','21','5','0','en');
INSERT INTO met_language VALUES('2792','modClass2','Second column','1','20','5','0','en');
INSERT INTO met_language VALUES('2793','mod101','Picture list','1','15','0','0','en');
INSERT INTO met_language VALUES('2794','mod7','Message system','1','8','0','0','en');
INSERT INTO met_language VALUES('2795','mod8','Feedback system','1','9','0','0','en');
INSERT INTO met_language VALUES('2796','mod9','Links','1','10','0','0','en');
INSERT INTO met_language VALUES('2797','mod10','Member Centre','1','11','0','0','en');
INSERT INTO met_language VALUES('2798','mod11','Site Search','1','12','0','0','en');
INSERT INTO met_language VALUES('2799','mod12','Sitemap','1','13','0','0','en');
INSERT INTO met_language VALUES('2800','mod100','Product List','1','14','0','0','en');
INSERT INTO met_language VALUES('2801','unitytxt_77','Update content automatically update the site map','1','441','32','0','en');
INSERT INTO met_language VALUES('2802','mod6','Recruitment system','1','7','0','0','en');
INSERT INTO met_language VALUES('2803','mod3','Product module','1','4','0','0','en');
INSERT INTO met_language VALUES('2804','mod4','Download module','1','5','0','0','en');
INSERT INTO met_language VALUES('2805','mod5','Picture module','1','6','0','0','en');
INSERT INTO met_language VALUES('2806','mod2','Article module','1','3','0','0','en');
INSERT INTO met_language VALUES('2807','mod1','Profile module','1','2','0','0','en');
INSERT INTO met_language VALUES('2808','modout','External module','1','1','0','0','en');
INSERT INTO met_language VALUES('2809','please_choose','please choose','1','127','0','0','en');
INSERT INTO met_language VALUES('2810','onlinetel','Phone or other instructions','1','116','23','0','en');
INSERT INTO met_language VALUES('2811','onlineskin','style','1','114','23','0','en');
INSERT INTO met_language VALUES('2812','onlineimg','icon','1','115','3','0','en');
INSERT INTO met_language VALUES('2813','onlineskintype','Color style','1','113','23','0','en');
INSERT INTO met_language VALUES('2814','setskinOnline9','Fixed to the right of the page','1','102','23','0','en');
INSERT INTO met_language VALUES('2815','setskinOnline5','Distance from browser side','1','98','23','0','en');
INSERT INTO met_language VALUES('2816','setskinOnline6','From the top of the browser','1','99','23','0','en');
INSERT INTO met_language VALUES('2817','setskinOnline3','Right with the screen scroll','1','96','23','0','en');
INSERT INTO met_language VALUES('2818','setskinOnline10','Location','1','96','23','0','en');
INSERT INTO met_language VALUES('2819','indexflashaddflash','Add Banner','1','92','4','0','en');
INSERT INTO met_language VALUES('2820','setskinOnline','Online communication','1','93','23','0','en');
INSERT INTO met_language VALUES('2821','setskinOnline1','Pinned to the left of the page','1','94','23','0','en');
INSERT INTO met_language VALUES('2822','setskinOnline2','Home left scroll with the screen','1','95','23','0','en');
INSERT INTO met_language VALUES('2823','indexflashexplain9','The link address needs to be http://or https://. After adding buttons and setting button links, it must be empty here.','1','90','4','0','en');
INSERT INTO met_language VALUES('2824','indexflashexplain4','Multiple pictures suggest keeping the size of the picture consistent','1','86','4','0','en');
INSERT INTO met_language VALUES('2825','flashHome','Home page','1','79','4','0','en');
INSERT INTO met_language VALUES('2826','setflashImgHref','link address','1','68','4','0','en');
INSERT INTO met_language VALUES('2827','setflashImgUrl','The map\'s address','1','67','4','0','en');
INSERT INTO met_language VALUES('2828','setflashPixel','Pixel','1','65','0','0','en');
INSERT INTO met_language VALUES('2829','setflashSize','Banner size','1','63','4','0','en');
INSERT INTO met_language VALUES('2830','setflashName','Picture title','1','61','0','0','en');
INSERT INTO met_language VALUES('2831','indexsetFriendly','Links','1','55','0','0','en');
INSERT INTO met_language VALUES('2832','skinstyle','style','1','43','36','0','en');
INSERT INTO met_language VALUES('2833','skinusenow','Enabled','1','40','0','0','en');
INSERT INTO met_language VALUES('2834','skininfo','information','1','42','3','0','en');
INSERT INTO met_language VALUES('2835','skinuse','Enable now','1','39','0','0','en');
INSERT INTO met_language VALUES('2836','settopcolumns','A column','1','21','0','0','en');
INSERT INTO met_language VALUES('2837','setskinproduct2','The current column shows the lower column list','1','17','0','0','en');
INSERT INTO met_language VALUES('2838','setskinproduct1','Show a list of all the information under the list','1','16','0','0','en');
INSERT INTO met_language VALUES('2839','setskindatecontent','Time display format','1','14','0','0','en');
INSERT INTO met_language VALUES('2840','setskinListPage','List','1','2','0','0','en');
INSERT INTO met_language VALUES('2841','setbasicTip13','The default email service mode is TLS (available from email service provider) <br /> If you use TLS mode 25 port can not send mail, try using SSL 465-port send','1','422','39','0','en');
INSERT INTO met_language VALUES('2842','setbasicSMTPWay','sending method','1','420','39','0','en');
INSERT INTO met_language VALUES('2843','setbasicTip12','For mail sending port (consulting E-mail service providers, TLS is generally 25, SSL is generally 465)','1','421','39','0','en');
INSERT INTO met_language VALUES('2844','setbasicSMTPPort','Send port','1','419','39','0','en');
INSERT INTO met_language VALUES('2845','password31','Verification code has been sent to the specified number','1','413','10','0','en');
INSERT INTO met_language VALUES('2846','password30','The password retrieving function is not available. Make sure the background mailbox server is set correctly.','1','413','10','0','en');
INSERT INTO met_language VALUES('2847','password29','E-mail to retrieve','1','412','10','0','en');
INSERT INTO met_language VALUES('2848','password27','Retrieve with phone number','1','410','10','0','en');
INSERT INTO met_language VALUES('2849','password25','new password:','1','408','10','0','en');
INSERT INTO met_language VALUES('2850','password26','Enter:','1','409','10','0','en');
INSERT INTO met_language VALUES('2851','password20','Next step','1','403','0','0','en');
INSERT INTO met_language VALUES('2852','password21','Back to login','1','404','10','0','en');
INSERT INTO met_language VALUES('2853','password24','username:','1','407','10','0','en');
INSERT INTO met_language VALUES('2854','password16','Verify success! Please set your new password.','1','399','10','0','en');
INSERT INTO met_language VALUES('2855','password14','Did not find the user\'s email address, please retrieve the password by other means','1','397','10','0','en');
INSERT INTO met_language VALUES('2856','password13','Unable to use SMS to retrieve password function','1','396','10','0','en');
INSERT INTO met_language VALUES('2857','password12','If you have an Internet connection, you may receive an SMS message after receiving an SMS message. Please wait for a moment or try again later.','1','395','10','0','en');
INSERT INTO met_language VALUES('2858','password11','Please enter the SMS verification code received by your mobile phone, and then click Next.','1','394','10','0','en');
INSERT INTO met_language VALUES('2859','password10','Serial number','1','393','10','0','en');
INSERT INTO met_language VALUES('2860','password8','Did not find the phone corresponding to the user, please retrieve the password by other means','1','391','10','0','en');
INSERT INTO met_language VALUES('2861','password9','You request to reset the password, validation code','1','392','10','0','en');
INSERT INTO met_language VALUES('2862','password7','Did not find this user','1','390','10','0','en');
INSERT INTO met_language VALUES('2863','password6','The user\'s mobile phone number was not found. Please find the password by other means.','1','389','10','0','en');
INSERT INTO met_language VALUES('2864','password5','Please enter the administrator\'s e-mail address:','1','388','10','0','en');
INSERT INTO met_language VALUES('2865','password4','Please enter the administrator\'s e-mail address. You will receive an e-mail containing a link to create a new password.','1','387','10','0','en');
INSERT INTO met_language VALUES('2866','password3','Please enter the administrator\'s mobile phone number:','1','386','10','0','en');
INSERT INTO met_language VALUES('2867','password2','Please enter the Administrator\'s mobile phone number, and then click Next, you will receive a SMS check code.','1','385','10','0','en');
INSERT INTO met_language VALUES('2868','password1','Please choose how to retrieve your password:','1','384','10','0','en');
INSERT INTO met_language VALUES('2869','lang64','Chinese (simplified)','1','383','16','0','en');
INSERT INTO met_language VALUES('2870','lang62','Vietnamese','1','381','16','0','en');
INSERT INTO met_language VALUES('2871','lang63','traditional Chinese)','1','382','16','0','en');
INSERT INTO met_language VALUES('2872','lang61','English','1','380','16','0','en');
INSERT INTO met_language VALUES('2873','lang60','Indonesian','1','379','16','0','en');
INSERT INTO met_language VALUES('2874','lang59','Urdu','1','378','16','0','en');
INSERT INTO met_language VALUES('2875','lang54','Yiddish','1','373','16','0','en');
INSERT INTO met_language VALUES('2876','lang53','Italian','1','372','16','0','en');
INSERT INTO met_language VALUES('2877','lang48','Greek','1','367','16','0','en');
INSERT INTO met_language VALUES('2878','lang49','Spanish Basque','1','368','16','0','en');
INSERT INTO met_language VALUES('2879','lang50','Spanish','1','369','16','0','en');
INSERT INTO met_language VALUES('2880','lang51','Hungarian','1','370','16','0','en');
INSERT INTO met_language VALUES('2881','lang47','Hebrew','1','366','16','0','en');
INSERT INTO met_language VALUES('2882','lang46','Ukrainian','1','365','16','0','en');
INSERT INTO met_language VALUES('2883','lang45','Welsh','1','364','16','0','en');
INSERT INTO met_language VALUES('2884','lang43','Thai','1','362','16','0','en');
INSERT INTO met_language VALUES('2885','lang44','Turkish','1','363','16','0','en');
INSERT INTO met_language VALUES('2886','lang42','Swahili','1','361','16','0','en');
INSERT INTO met_language VALUES('2887','lang37','Japanese','1','356','16','0','en');
INSERT INTO met_language VALUES('2888','lang38','Swedish','1','357','16','0','en');
INSERT INTO met_language VALUES('2889','lang39','Serbian','1','358','16','0','en');
INSERT INTO met_language VALUES('2890','lang40','Slovak','1','359','16','0','en');
INSERT INTO met_language VALUES('2891','lang41','Slovenian','1','360','16','0','en');
INSERT INTO met_language VALUES('2892','lang36','Portuguese','1','355','16','0','en');
INSERT INTO met_language VALUES('2893','lang35','Norwegian','1','354','16','0','en');
INSERT INTO met_language VALUES('2894','lang33','Macedonian','1','352','16','0','en');
INSERT INTO met_language VALUES('2895','lang32','Malay','1','351','16','0','en');
INSERT INTO met_language VALUES('2896','lang31','Maltese','1','350','16','0','en');
INSERT INTO met_language VALUES('2897','lang30','Romanian','1','349','16','0','en');
INSERT INTO met_language VALUES('2898','lang29','Lithuanian','1','348','16','0','en');
INSERT INTO met_language VALUES('2899','lang28','Latvian','1','347','16','0','en');
INSERT INTO met_language VALUES('2900','lang27','Latin','1','346','16','0','en');
INSERT INTO met_language VALUES('2901','lang26','Croatian','1','345','16','0','en');
INSERT INTO met_language VALUES('2902','lang25','Czech','1','344','16','0','en');
INSERT INTO met_language VALUES('2903','lang24','Catalan','1','343','16','0','en');
INSERT INTO met_language VALUES('2904','lang23','Galician','1','342','16','0','en');
INSERT INTO met_language VALUES('2905','lang22','Dutch','1','341','16','0','en');
INSERT INTO met_language VALUES('2906','lang21','Korean','1','340','16','0','en');
INSERT INTO met_language VALUES('2907','lang20','Haitian Creole','1','339','16','0','en');
INSERT INTO met_language VALUES('2908','lang17','Finnish','1','336','16','0','en');
INSERT INTO met_language VALUES('2909','lang16','Filipino','1','335','16','0','en');
INSERT INTO met_language VALUES('2910','lang14','Russian','1','333','16','0','en');
INSERT INTO met_language VALUES('2911','lang11','Boolean (Afrikaans)','1','330','16','0','en');
INSERT INTO met_language VALUES('2912','lang15','French','1','334','16','0','en');
INSERT INTO met_language VALUES('2913','lang12','Danish','1','331','16','0','en');
INSERT INTO met_language VALUES('2914','lang13','German','1','332','16','0','en');
INSERT INTO met_language VALUES('2915','lang3','Azerbaijani','1','322','16','0','en');
INSERT INTO met_language VALUES('2916','lang4','Irish','1','323','16','0','en');
INSERT INTO met_language VALUES('2917','lang5','Estonian','1','324','16','0','en');
INSERT INTO met_language VALUES('2918','lang6','Belarusian','1','325','16','0','en');
INSERT INTO met_language VALUES('2919','lang7','Bulgarian','1','326','16','0','en');
INSERT INTO met_language VALUES('2920','lang8','Icelandic','1','327','16','0','en');
INSERT INTO met_language VALUES('2921','lang9','Polish','1','328','16','0','en');
INSERT INTO met_language VALUES('2922','lang10','Persian','1','329','16','0','en');
INSERT INTO met_language VALUES('2923','lang2','Arabic','1','321','16','0','en');
INSERT INTO met_language VALUES('2924','lang1','Albanian','1','320','16','0','en');
INSERT INTO met_language VALUES('2925','langselect','Choose a language','1','318','0','0','en');
INSERT INTO met_language VALUES('2926','langselect1','Please choose the language','1','319','16','0','en');
INSERT INTO met_language VALUES('2927','langwebmanage','Website language','1','316','16','0','en');
INSERT INTO met_language VALUES('2928','langexplain6','Copy local language pack','1','307','16','0','en');
INSERT INTO met_language VALUES('2929','langexplain5','Online Download','1','306','1','0','en');
INSERT INTO met_language VALUES('2930','langexplain4','Copy the language has been the basic language package, such as copying English, the new language will be part of the front of the text will be in English.','1','305','16','0','en');
INSERT INTO met_language VALUES('2931','langexplain2','Language logo','1','303','16','0','en');
INSERT INTO met_language VALUES('2932','langexplain1','Corresponds to the front page of the site part of the text, be careful not to add special symbols, click the bottom of the save button to take effect. (Parameter name: value)','1','302','16','0','en');
INSERT INTO met_language VALUES('2933','langexplain_admin','Corresponding to the text of the back page of the website, please be careful not to add special symbols. Click the save button at the bottom to take effect. (parameter name: value)','1','302','16','0','en');
INSERT INTO met_language VALUES('2934','upfiletips35','Commercial authorization','1','293','2','0','en');
INSERT INTO met_language VALUES('2935','upfiletips37','news','1','295','14','0','en');
INSERT INTO met_language VALUES('2936','upfiletips38','server information','1','296','37','0','en');
INSERT INTO met_language VALUES('2937','upfiletips25','Recycle Bin','1','283','19','0','en');
INSERT INTO met_language VALUES('2938','upfiletips24','Feedback, message and resume submission','1','282','30','0','en');
INSERT INTO met_language VALUES('2939','upfiletips20','Stretch','1','278','13','0','en');
INSERT INTO met_language VALUES('2940','upfiletips21','Leave blank','1','279','13','0','en');
INSERT INTO met_language VALUES('2941','upfiletips22','Cut','1','280','13','0','en');
INSERT INTO met_language VALUES('2942','upfiletips23','Generation method','1','281','13','0','en');
INSERT INTO met_language VALUES('2943','upfiletips19','Watermark','1','277','13','0','en');
INSERT INTO met_language VALUES('2944','upfiletips16','Send the test','1','274','39','0','en');
INSERT INTO met_language VALUES('2945','upfiletips15','100 words or less','1','273','39','0','en');
INSERT INTO met_language VALUES('2946','upfiletips14','Website Description','1','272','39','0','en');
INSERT INTO met_language VALUES('2947','upfiletips13','Multiple keywords separated by vertical comma \",\" , recommended 3-4 keywords.','1','271','39','0','en');
INSERT INTO met_language VALUES('2948','upfiletips10','6.0.0 above version without manual settings, the current login URL is:','1','268','39','0','en');
INSERT INTO met_language VALUES('2949','upfiletips6','Enter','1','264','0','0','en');
INSERT INTO met_language VALUES('2950','upfiletips7','Basic Information','1','265','0','0','en');
INSERT INTO met_language VALUES('2951','upfiletips2','File Manager','1','260','0','0','en');
INSERT INTO met_language VALUES('2952','upfiletips1','Check the list of files','1','259','0','0','en');
INSERT INTO met_language VALUES('2953','dataexplain10','database backup','1','256','8','0','en');
INSERT INTO met_language VALUES('2954','dataexplain7','<span style = \"float: right;\"> Usually used when moving, take up more space </ span> Back up data and files (database, user files, program files)','1','253','8','0','en');
INSERT INTO met_language VALUES('2955','dataexplain6','<span style = \"float: right;\"> Generally do not backup, take up more space </ span> Backup uploaded files (pictures, documents, etc.)','1','252','8','0','en');
INSERT INTO met_language VALUES('2956','dataexplain5','<span style = \"float: right;\"> Recommended monthly backup, take up a little space </ span> Back up your data (without uploaded files)','1','251','8','0','en');
INSERT INTO met_language VALUES('2957','dataexplain2','You can upload database backup files, support sql or zip','1','248','8','0','en');
INSERT INTO met_language VALUES('2958','dataexplain1','There is currently no data','1','247','8','0','en');
INSERT INTO met_language VALUES('2959','databackup8','Compress the whole station','1','245','8','0','en');
INSERT INTO met_language VALUES('2960','databackup6','Upload folder backup','1','243','8','0','en');
INSERT INTO met_language VALUES('2961','databackup2','restore','1','239','8','0','en');
INSERT INTO met_language VALUES('2962','databackup3','download','1','240','8','0','en');
INSERT INTO met_language VALUES('2963','databackup4','Backup','1','241','8','0','en');
INSERT INTO met_language VALUES('2964','setimgTopMid','Top','1','233','13','0','en');
INSERT INTO met_language VALUES('2965','setimgLowMid','The bottom','1','235','13','0','en');
INSERT INTO met_language VALUES('2966','setimgRightMid','Right middle','1','234','13','0','en');
INSERT INTO met_language VALUES('2967','setimgLeftLow','Lower left','1','232','13','0','en');
INSERT INTO met_language VALUES('2968','setimgRightLow','Bottom right','1','231','13','0','en');
INSERT INTO met_language VALUES('2969','setimgRightTop','Top right','1','230','13','0','en');
INSERT INTO met_language VALUES('2970','setimgLeftTop','Top left','1','229','13','0','en');
INSERT INTO met_language VALUES('2971','setimgMid','intermediate','1','228','13','0','en');
INSERT INTO met_language VALUES('2972','setimgPosition','Watermark location','1','227','13','0','en');
INSERT INTO met_language VALUES('2973','setimgWordAngle','Watermark text angle','1','199','0','0','en');
INSERT INTO met_language VALUES('2974','setimgTip5','Level is 0','1','200','0','0','en');
INSERT INTO met_language VALUES('2975','setimgWordColor','Watermark text color','1','201','0','0','en');
INSERT INTO met_language VALUES('2976','setimgTip4','Please upload font file in. TTF format','1','198','13','0','en');
INSERT INTO met_language VALUES('2977','setimgWordFont','Watermark text font','1','197','13','0','en');
INSERT INTO met_language VALUES('2978','setimgWordSize2','Big picture watermark text size','1','196','13','0','en');
INSERT INTO met_language VALUES('2979','setimgWord','Watermark text','1','193','13','0','en');
INSERT INTO met_language VALUES('2980','setimgTip3','Does not support Chinese (Chinese watermark needs to download Chinese fonts to support)','1','194','13','0','en');
INSERT INTO met_language VALUES('2981','setimgWordSize','Thumbnail watermark text size','1','195','13','0','en');
INSERT INTO met_language VALUES('2982','setimgImgWatermark','Image watermark','1','189','13','0','en');
INSERT INTO met_language VALUES('2983','setimgImg','Thumbnail watermark image','1','190','13','0','en');
INSERT INTO met_language VALUES('2984','setimgImg2','Big picture watermark picture','1','191','13','0','en');
INSERT INTO met_language VALUES('2985','setimgTip2','Only .jpg | .png formats are supported','1','192','13','0','en');
INSERT INTO met_language VALUES('2986','setimgWatermarkType','Watermark type','1','187','13','0','en');
INSERT INTO met_language VALUES('2987','setimgWordWatermark','Text watermark','1','188','13','0','en');
INSERT INTO met_language VALUES('2988','setimgThumb','Thumbnail add watermark','1','186','13','0','en');
INSERT INTO met_language VALUES('2989','setimgWatermark','Set effective range','1','184','13','0','en');
INSERT INTO met_language VALUES('2990','setimgBigImg','Add watermark to detailed large image','1','185','13','0','en');
INSERT INTO met_language VALUES('2991','setimgrename2','Renaming a file name helps to reduce the anomaly','1','183','30','0','en');
INSERT INTO met_language VALUES('2992','setimgrename','Automatic rename','1','181','30','0','en');
INSERT INTO met_language VALUES('2993','setimgrename1','Rename the uploaded file name automatically','1','182','30','0','en');
INSERT INTO met_language VALUES('2994','setimgWater','Automatic generated','1','179','0','0','en');
INSERT INTO met_language VALUES('2995','setimgHeight','high','1','176','0','0','en');
INSERT INTO met_language VALUES('2996','setimgPixel','Pixel','1','175','0','0','en');
INSERT INTO met_language VALUES('2997','setimgWidth','width','1','174','0','0','en');
INSERT INTO met_language VALUES('2998','authTip2','The business registration code you entered does not match the domain name!','1','160','0','0','en');
INSERT INTO met_language VALUES('2999','authKey','Key','1','158','0','0','en');
INSERT INTO met_language VALUES('3000','authAuthorizedCode','Authorization code','1','159','0','0','en');
INSERT INTO met_language VALUES('3001','setfilesize','File size','1','134','0','0','en');
INSERT INTO met_language VALUES('3002','setsafemember','Submit a verification code at the front desk','1','127','30','0','en');
INSERT INTO met_language VALUES('3003','setsafeadmin','Background login verification code','1','126','30','0','en');
INSERT INTO met_language VALUES('3004','info_security_statement','Information security statement','1','126','30','0','en');
INSERT INTO met_language VALUES('3005','info_security_statement_switch','Information security statement switch ','1','126','30','0','en');
INSERT INTO met_language VALUES('3006','info_security_statement_modal_title','Security Statement Pop-up Title','1','126','30','0','en');
INSERT INTO met_language VALUES('3007','info_security_statement_title','Information security statement title','1','126','30','0','en');
INSERT INTO met_language VALUES('3008','info_security_statement_content','Information security statement content','1','126','30','0','en');
INSERT INTO met_language VALUES('3009','info_security_statement_tips1','Prompt users to read the information security statement when user information is collected','1','126','30','0','en');
INSERT INTO met_language VALUES('3010','setsafeupdate','Delete the upgrade file','1','124','30','0','en');
INSERT INTO met_language VALUES('3011','setsafeupdate1','After deletion, you can enhance the website\'s security performance','1','125','30','0','en');
INSERT INTO met_language VALUES('3012','setsafeinstall','Delete the installation file','1','123','30','0','en');
INSERT INTO met_language VALUES('3013','setsafeadminname1c','Only the founder can be modified, does not support Chinese, after some space to modify the file name need to manually modify the folder name via FTP, the current background URL:','1','122','30','0','en');
INSERT INTO met_language VALUES('3014','setsafeadminname','Background folder name','1','118','30','0','en');
INSERT INTO met_language VALUES('3015','setsafeadminname1','Safety advice:','1','119','30','0','en');
INSERT INTO met_language VALUES('3016','setdbNotExist','file does not exist','1','114','30','0','en');
INSERT INTO met_language VALUES('3017','setdbArchiveOK','Compression successful','1','115','8','0','en');
INSERT INTO met_language VALUES('3018','setdbImportOK','Import successful','1','111','8','0','en');
INSERT INTO met_language VALUES('3019','setdbBackupOK','Database backup is completed!','1','109','8','0','en');
INSERT INTO met_language VALUES('3020','setBackuoNo','Database error','1','109','8','0','en');
INSERT INTO met_language VALUES('3021','setBackuoDiskFull','Disk full','1','109','8','0','en');
INSERT INTO met_language VALUES('3022','setdbTip2','Data can not be backed up to the server! Please check','1','104','8','0','en');
INSERT INTO met_language VALUES('3023','setdbTip3','Whether the directory is writable','1','105','8','0','en');
INSERT INTO met_language VALUES('3024','setdbImportData','Import','1','101','8','0','en');
INSERT INTO met_language VALUES('3025','setdbLack','Missing sub-volumes','1','100','8','0','en');
INSERT INTO met_language VALUES('3026','setdbFilesize','File size','1','97','8','0','en');
INSERT INTO met_language VALUES('3027','setdbTime','Backup time','1','98','8','0','en');
INSERT INTO met_language VALUES('3028','setdbNumber','Sub-volume','1','99','8','0','en');
INSERT INTO met_language VALUES('3029','setdbsysver','system version','1','96','8','0','en');
INSERT INTO met_language VALUES('3030','setdbFilename','file name','1','95','8','0','en');
INSERT INTO met_language VALUES('3031','setdbImport','Import backup data','1','88','8','0','en');
INSERT INTO met_language VALUES('3032','langshuom','Description','1','86','3','0','en');
INSERT INTO met_language VALUES('3033','langtype','Language status','1','85','0','0','en');
INSERT INTO met_language VALUES('3034','langnameorder','Do not repeat with other languages','1','80','16','0','en');
INSERT INTO met_language VALUES('3035','langnamerepeat','Language ID can not be repeated','1','81','16','0','en');
INSERT INTO met_language VALUES('3036','langone','The system has only one language, can not be deleted!','1','82','16','0','en');
INSERT INTO met_language VALUES('3037','langnamenull','Language name can not be empty','1','77','16','0','en');
INSERT INTO met_language VALUES('3038','langouturlinfo','Be sure to include http: // or https: //. The program that accesses this domain automatically jumps to this language (you need to do a good name binding) or do an external link.','1','74','16','0','en');
INSERT INTO met_language VALUES('3039','langnewwindows','open in a new window','1','75','16','0','en');
INSERT INTO met_language VALUES('3040','langmarkinfo','Please use English letters, such as cn, can not be repeated with other language logo','1','71','16','0','en');
INSERT INTO met_language VALUES('3041','langurlinfo','The site language that is displayed by default when the site is visited','1','69','16','0','en');
INSERT INTO met_language VALUES('3042','langurlinfo1','Web language displayed by default when the website background is visited','1','69','16','0','en');
INSERT INTO met_language VALUES('3043','langorderinfo','Can not repeat','1','70','16','0','en');
INSERT INTO met_language VALUES('3044','langadminyes','The administrator can choose the background language before logging in','1','66','16','0','en');
INSERT INTO met_language VALUES('3045','langsw','Language switching','1','68','16','0','en');
INSERT INTO met_language VALUES('3046','langhome','default language','1','63','16','0','en');
INSERT INTO met_language VALUES('3047','langchok','Generally displayed in the upper right corner of the front-end in the form of a link, after enabling it, please go to the header block settings of the visualization interface to enable the language button display switch','1','62','16','0','en');
INSERT INTO met_language VALUES('3048','langch','Simplified and Traditional automatic switching','1','60','16','0','en');
INSERT INTO met_language VALUES('3049','langwebeditor','Edit parameters','1','58','16','0','en');
INSERT INTO met_language VALUES('3050','langmark','Language logo','1','54','0','0','en');
INSERT INTO met_language VALUES('3051','langouturl','Independent domain name','1','55','16','0','en');
INSERT INTO met_language VALUES('3052','langpara','Plugin language','1','57','16','0','en');
INSERT INTO met_language VALUES('3053','langflag','Flag sign','1','53','16','0','en');
INSERT INTO met_language VALUES('3054','langname','Language name','1','52','16','0','en');
INSERT INTO met_language VALUES('3055','langadd','Add a new language','1','50','16','0','en');
INSERT INTO met_language VALUES('3056','langweb','Website language','1','49','0','0','en');
INSERT INTO met_language VALUES('3057','langadmin','Adminsite language','1','49','0','0','en');
INSERT INTO met_language VALUES('3058','setbasicTip11','E-mail password used to send mail','1','47','39','0','en');
INSERT INTO met_language VALUES('3059','setbasicTip10','Such as QQ mailbox smtp.qq.com','1','45','39','0','en');
INSERT INTO met_language VALUES('3060','setbasicSMTPPassword','email Password','1','46','39','0','en');
INSERT INTO met_language VALUES('3061','setbasicSMTPServer','SMTP','1','44','39','0','en');
INSERT INTO met_language VALUES('3062','setbasicTip8','E-mail account used to send mail','1','43','39','0','en');
INSERT INTO met_language VALUES('3063','setbasicEmailAccount','email address','1','42','39','0','en');
INSERT INTO met_language VALUES('3064','setbasicTip7','The sender\'s name is displayed','1','41','39','0','en');
INSERT INTO met_language VALUES('3065','setbasicTip5','Multiple please use | separated','1','33','30','0','en');
INSERT INTO met_language VALUES('3066','setbasicTip6','Outbox settings (all mail within the station are sent by this email, such as member password retrieve mail, etc.)','1','34','39','0','en');
INSERT INTO met_language VALUES('3067','setbasicFromName','Sender','1','35','39','0','en');
INSERT INTO met_language VALUES('3068','setbasicEnableFormat','File formats allowed to be uploaded','1','32','30','0','en');
INSERT INTO met_language VALUES('3069','setbasicUploadMax','File upload maximum','1','31','30','0','en');
INSERT INTO met_language VALUES('3070','setbasicWebName','Website name','1','29','39','0','en');
INSERT INTO met_language VALUES('3071','setbasicWebInfoSet','Website basic information settings','1','28','0','0','en');
INSERT INTO met_language VALUES('3072','reserved','all rights reserved','1','24','37','0','en');
INSERT INTO met_language VALUES('3073','copyright','Changsha Mituo Information Technology Co., Ltd. (MetInfo Inc.)','1','25','0','0','en');
INSERT INTO met_language VALUES('3074','setbasicTip14','gmail mailbox need space to support SSL, please open SSL, or replaced by other mail! ! !','1','429','39','0','en');
INSERT INTO met_language VALUES('3075','setbasicTip15','Space does not support SSL send mail, please open SSL, or replaced by TLS! ! !','1','430','39','0','en');
INSERT INTO met_language VALUES('3076','feedbackautosms','SMS reply settings','1','177','0','0','en');
INSERT INTO met_language VALUES('3077','fdincAutosms','SMS reply','1','178','0','0','en');
INSERT INTO met_language VALUES('3078','fdincAutoContentsms','Reply SMS content','1','179','0','0','en');
INSERT INTO met_language VALUES('3079','fdincTipsms','Check the box will automatically reply to the user text messages','1','180','0','0','en');
INSERT INTO met_language VALUES('3080','fdinctellsms','Contact phone field name','1','181','0','0','en');
INSERT INTO met_language VALUES('3081','fdinctells','Used to retrieve the user\'s contact number in order to reply to a text message. Field type must be \"tel\"','1','182','0','0','en');
INSERT INTO met_language VALUES('3082','hotsearches','popular searches','1','431','16','0','en');
INSERT INTO met_language VALUES('3083','updatenow','upgrade immediately','1','437','0','0','en');
INSERT INTO met_language VALUES('3084','updatelater','Upgrade later','1','438','0','0','en');
INSERT INTO met_language VALUES('3085','tag','TAG label','1','434','0','0','en');
INSERT INTO met_language VALUES('3086','displaytype','Front display','1','183','0','0','en');
INSERT INTO met_language VALUES('3087','checkupdate','Check for updates','1','439','0','0','en');
INSERT INTO met_language VALUES('3088','checkupdatetips','I am sorry! You do not have enough privileges to upgrade online.','1','440','0','0','en');
INSERT INTO met_language VALUES('3089','paraname','name','1','187','0','0','en');
INSERT INTO met_language VALUES('3090','message_name','Name field name','1','240','20','0','en');
INSERT INTO met_language VALUES('3091','message_name1','Used to get the user\'s name, field type must be \"short\"','1','241','20','0','en');
INSERT INTO met_language VALUES('3092','message_content','Message content field name','1','242','20','0','en');
INSERT INTO met_language VALUES('3093','message_content1','Used to obtain the user\'s message content, field type must be \"text\"','1','243','20','0','en');
INSERT INTO met_language VALUES('3094','message_AcceptMail','Message mail receiving mailbox','1','244','20','0','en');
INSERT INTO met_language VALUES('3095','column_searchname','Please enter the column name','1','246','0','0','en');
INSERT INTO met_language VALUES('3096','jsx38','You do not have full control, please contact the administrator to open','1','446','0','0','en');
INSERT INTO met_language VALUES('3097','formerror1','Please fill in this field.','1','0','0','0','en');
INSERT INTO met_language VALUES('3098','formerror2','Please choose one of these options.','1','0','0','0','en');
INSERT INTO met_language VALUES('3099','formerror3','Please enter the correct phone number.','1','0','0','0','en');
INSERT INTO met_language VALUES('3100','formerror4','Please enter the correct email address.','1','0','0','0','en');
INSERT INTO met_language VALUES('3101','formerror5','The password entered twice is different. Please re-enter it.','1','0','0','0','en');
INSERT INTO met_language VALUES('3102','formerror6','Please enter at least & metinfo & characters.','1','0','0','0','en');
INSERT INTO met_language VALUES('3103','formerror7','Input can not exceed & metinfo & characters.','1','0','0','0','en');
INSERT INTO met_language VALUES('3104','formerror8','The number of characters entered must be between & metinfo &.','1','0','0','0','en');
INSERT INTO met_language VALUES('3105','style_Settings','Style set','1','0','0','0','en');
INSERT INTO met_language VALUES('3106','All_empty_message','Clear all the news','1','0','0','0','en');
INSERT INTO met_language VALUES('3107','manually_static_rules','Part of the space need to manually set the pseudo-static rules file','1','0','32','0','en');
INSERT INTO met_language VALUES('3108','pseudo_static','See pseudo-static rules','1','0','32','0','en');
INSERT INTO met_language VALUES('3109','sys_static','Pseudo-static','1','0','32','0','en');
INSERT INTO met_language VALUES('3110','anchor_textadd','Add anchor text','1','0','11','0','en');
INSERT INTO met_language VALUES('3111','applies_paper','Only in front of the page content text, such as article details page content text.','1','0','32','0','en');
INSERT INTO met_language VALUES('3112','configuration_section','Configure the column','1','0','0','0','en');
INSERT INTO met_language VALUES('3113','template_code1','Please enter the template number','1','0','3','0','en');
INSERT INTO met_language VALUES('3114','industry_segments','Industry breakdown','1','0','3','0','en');
INSERT INTO met_language VALUES('3115','color_filter','Color screening','1','0','3','0','en');
INSERT INTO met_language VALUES('3116','industry_screening','Industry screening','1','0','3','0','en');
INSERT INTO met_language VALUES('3117','set_password','The third step: set the payment password','1','0','3','0','en');
INSERT INTO met_language VALUES('3118','login_password','Bit. Pay for the application need to enter the payment password, please do not be consistent with the login password.','1','0','3','0','en');
INSERT INTO met_language VALUES('3119','services_future','Can be used to retrieve the password and get more services in the future of the application market','1','0','3','0','en');
INSERT INTO met_language VALUES('3120','personal_information','Step two: set up personal information','1','0','3','0','en');
INSERT INTO met_language VALUES('3121','sys_password','login password','1','0','3','0','en');
INSERT INTO met_language VALUES('3122','create_account','The first step: create an account','1','0','3','0','en');
INSERT INTO met_language VALUES('3123','buy_time','Purchase time','1','0','3','0','en');
INSERT INTO met_language VALUES('3124','please_click','Payment is successful, please click! !','1','0','3','0','en');
INSERT INTO met_language VALUES('3125','payment_method','Please select mode of payment','1','0','3','0','en');
INSERT INTO met_language VALUES('3126','sys_unionpay','UnionPay','1','0','3','0','en');
INSERT INTO met_language VALUES('3127','enter_amount','Please enter the recharge amount','1','0','3','0','en');
INSERT INTO met_language VALUES('3128','payment_amount','Payment amount','1','0','3','0','en');
INSERT INTO met_language VALUES('3129','account_Settings','User Center','1','0','3','0','en');
INSERT INTO met_language VALUES('3130','consumption_record','Expenses record','1','0','3','0','en');
INSERT INTO met_language VALUES('3131','website_manually','After successful login your website will automatically log in to this account, unless you manually exit.','1','0','3','0','en');
INSERT INTO met_language VALUES('3132','application_market','Log in to the MetInfo User Center','1','0','3','0','en');
INSERT INTO met_language VALUES('3133','installations','Installation volume','1','0','0','0','en');
INSERT INTO met_language VALUES('3134','permission_download','No permission to download','1','0','3','0','en');
INSERT INTO met_language VALUES('3135','goods_comment','Buy a product before commenting','1','0','3','0','en');
INSERT INTO met_language VALUES('3136','product_commented','The same product up to comment 3 times','1','0','3','0','en');
INSERT INTO met_language VALUES('3137','password_mistake','Pay the wrong password','1','0','3','0','en');
INSERT INTO met_language VALUES('3138','please_again','Please log in to the App Store. The App Store uses an independent account system. If you do not have an account, please register first!','1','0','3','0','en');
INSERT INTO met_language VALUES('3139','have_bought','bought','1','0','3','0','en');
INSERT INTO met_language VALUES('3140','download_application','The current system can not download this application, please upgrade the system','1','0','3','0','en');
INSERT INTO met_language VALUES('3141','sys_evaluation','Evaluation of success! Thank you for your comment!','1','0','3','0','en');
INSERT INTO met_language VALUES('3142','downloads','start download','1','0','3','0','en');
INSERT INTO met_language VALUES('3143','click_rating','Please click star rating!','1','0','3','0','en');
INSERT INTO met_language VALUES('3144','payment_password','New payment password','1','0','3','0','en');
INSERT INTO met_language VALUES('3145','original_password1','Please enter the original payment password','1','0','3','0','en');
INSERT INTO met_language VALUES('3146','original_password','The original payment password','1','0','3','0','en');
INSERT INTO met_language VALUES('3147','password_length','Password length','1','0','3','0','en');
INSERT INTO met_language VALUES('3148','please_enter','Please enter a new password','1','0','3','0','en');
INSERT INTO met_language VALUES('3149','login_password_new','New login password','1','0','3','0','en');
INSERT INTO met_language VALUES('3150','original_passwords1','Please enter the original password','1','0','3','0','en');
INSERT INTO met_language VALUES('3151','original_passwords','The original login password','1','0','3','0','en');
INSERT INTO met_language VALUES('3152','account_password','Please fill in the application market account login password, rather than website login password.','1','0','3','0','en');
INSERT INTO met_language VALUES('3153','please_password','Please enter your password','1','0','3','0','en');
INSERT INTO met_language VALUES('3154','login_password1','You must fill in the login password to modify the data','1','0','3','0','en');
INSERT INTO met_language VALUES('3155','popular_template','Hot template','1','0','3','0','en');
INSERT INTO met_language VALUES('3156','popular_application','Popular applications','1','0','3','0','en');
INSERT INTO met_language VALUES('3157','number_installation','Installation times','1','0','3','0','en');
INSERT INTO met_language VALUES('3158','application_name','Application Name','1','0','3','0','en');
INSERT INTO met_language VALUES('3159','introduction_developers','Developer Profile','1','0','3','0','en');
INSERT INTO met_language VALUES('3160','sys_head','Avatar','1','0','3','0','en');
INSERT INTO met_language VALUES('3161','name_developers','Developer name','1','0','3','0','en');
INSERT INTO met_language VALUES('3162','dont_fill','Not fill','1','0','3','0','en');
INSERT INTO met_language VALUES('3163','mouse_click_rating','Mouse over the star to click on the score','1','0','3','0','en');
INSERT INTO met_language VALUES('3164','score','score','1','0','3','0','en');
INSERT INTO met_language VALUES('3165','want_comment','I want to comment','1','0','3','0','en');
INSERT INTO met_language VALUES('3166','back','Previous page','1','0','1','0','en');
INSERT INTO met_language VALUES('3167','running_environment','Operating environment','1','0','3','0','en');
INSERT INTO met_language VALUES('3168','updated_date','Updated','1','0','3','0','en');
INSERT INTO met_language VALUES('3169','online_presentation','Online demo','1','0','3','0','en');
INSERT INTO met_language VALUES('3170','screenshots','Screenshots','1','0','3','0','en');
INSERT INTO met_language VALUES('3171','is_introduced','Introduction','1','0','3','0','en');
INSERT INTO met_language VALUES('3172','comments','comment','1','0','3','0','en');
INSERT INTO met_language VALUES('3173','evaluation','Person evaluation)','1','0','3','0','en');
INSERT INTO met_language VALUES('3174','total_of','(Total','1','0','3','0','en');
INSERT INTO met_language VALUES('3175','pay_password','Pay the password','1','0','3','0','en');
INSERT INTO met_language VALUES('3176','temporary_access1','Please enter the temporary access domain name, it must be a third-level domain name.','1','0','3','0','en');
INSERT INTO met_language VALUES('3177','temporary_access','Temporary access to the domain name','1','0','3','0','en');
INSERT INTO met_language VALUES('3178','top_domain_names','Top level domain','1','0','3','0','en');
INSERT INTO met_language VALUES('3179','buy_template_must','After the purchase process will automatically get the current site domain name and binding, after this template can only be used under the binding domain name.','1','0','3','0','en');
INSERT INTO met_language VALUES('3180','amount_of','Amount','1','0','3','0','en');
INSERT INTO met_language VALUES('3181','purchase_program','Purchase item','1','0','3','0','en');
INSERT INTO met_language VALUES('3182','success_payment','After payment is successful, please click this link to jump! !','1','0','3','0','en');
INSERT INTO met_language VALUES('3183','latest_version','It is the latest version','1','0','3','0','en');
INSERT INTO met_language VALUES('3184','pay_success','payment successful','1','0','3','0','en');
INSERT INTO met_language VALUES('3185','be_updated','Can be updated to','1','0','1','0','en');
INSERT INTO met_language VALUES('3186','update_log','About','1','0','1','0','en');
INSERT INTO met_language VALUES('3187','current_version','current version','1','0','1','0','en');
INSERT INTO met_language VALUES('3188','program_information','Program information','1','0','1','0','en');
INSERT INTO met_language VALUES('3189','system_maintenance','System maintenance','1','0','0','0','en');
INSERT INTO met_language VALUES('3190','link_remote','Link is not on the remote server','1','0','0','0','en');
INSERT INTO met_language VALUES('3191','try_again','Retry','1','0','0','0','en');
INSERT INTO met_language VALUES('3192','give_installation','Abandon the installation','1','0','0','0','en');
INSERT INTO met_language VALUES('3193','configuratio_template','Configure the template','1','0','0','0','en');
INSERT INTO met_language VALUES('3194','seconds_background','After a second refresh the background','1','0','0','0','en');
INSERT INTO met_language VALUES('3195','installation_complete','The installation is complete','1','0','0','0','en');
INSERT INTO met_language VALUES('3196','installation','installing','1','0','0','0','en');
INSERT INTO met_language VALUES('3197','possible_reasons','Possible Causes','1','0','0','0','en');
INSERT INTO met_language VALUES('3198','download_interrupt','File download interrupted','1','0','0','0','en');
INSERT INTO met_language VALUES('3199','write_permission','The file does not have write permission or the newly created subfolder does not have write permission','1','0','0','0','en');
INSERT INTO met_language VALUES('3200','download','downloading','1','0','0','0','en');
INSERT INTO met_language VALUES('3201','following_documents','The following documents did not modify permissions, can not be upgraded!','1','0','0','0','en');
INSERT INTO met_language VALUES('3202','document_upgrade','System upgrade documentation','1','0','0','0','en');
INSERT INTO met_language VALUES('3203','file_permissions','File permissions detection','1','0','0','0','en');
INSERT INTO met_language VALUES('3204','anchor_text','Station anchor text','1','0','11','0','en');
INSERT INTO met_language VALUES('3205','please_select','Please select a section','1','0','0','0','en');
INSERT INTO met_language VALUES('3206','log_successfully','Landed successfully','1','0','0','0','en');
INSERT INTO met_language VALUES('3207','out_of_success','exit successfully','1','0','3','0','en');
INSERT INTO met_language VALUES('3208','password_changing','Pay the password change','1','0','3','0','en');
INSERT INTO met_language VALUES('3209','login_password_changing','Login password change','1','0','3','0','en');
INSERT INTO met_language VALUES('3210','account_information','Account information settings','1','0','3','0','en');
INSERT INTO met_language VALUES('3211','my_bill','Recharge record','1','0','0','0','en');
INSERT INTO met_language VALUES('3212','keep_sorting','Save the order','1','0','0','0','en');
INSERT INTO met_language VALUES('3213','structure_mode','Composition way','1','0','32','0','en');
INSERT INTO met_language VALUES('3214','title_cannot_empty!','The title can not be blank!','1','0','0','0','en');
INSERT INTO met_language VALUES('3215','adaptive','Adaptive','1','0','4','0','en');
INSERT INTO met_language VALUES('3216','delete_information','Are you sure you want to delete this information? Can not be restored after deleted.','1','0','1','0','en');
INSERT INTO met_language VALUES('3217','page_for_details','Details page','1','0','36','0','en');
INSERT INTO met_language VALUES('3218','default_values','Defaults','1','0','0','0','en');
INSERT INTO met_language VALUES('3219','label','label','1','0','0','0','en');
INSERT INTO met_language VALUES('3220','for','for','1','0','0','0','en');
INSERT INTO met_language VALUES('3221','verify_password','Please enter the password again','1','0','3','0','en');
INSERT INTO met_language VALUES('3222','Repeat_password','Repeat password','1','0','3','0','en');
INSERT INTO met_language VALUES('3223','for_details','Application Details','1','0','3','0','en');
INSERT INTO met_language VALUES('3224','template','template','1','0','3','0','en');
INSERT INTO met_language VALUES('3225','application','Services','1','0','3','0','en');
INSERT INTO met_language VALUES('3226','Prompt_password','Please enter the password','1','0','3','0','en');
INSERT INTO met_language VALUES('3227','alipay','Alipay','1','0','0','0','en');
INSERT INTO met_language VALUES('3228','account','account number','1','0','0','0','en');
INSERT INTO met_language VALUES('3229','Prompt_email','Please input the email address','1','0','3','0','en');
INSERT INTO met_language VALUES('3230','mailbox','mailbox','1','0','0','0','en');
INSERT INTO met_language VALUES('3231','Prompt_mobile','Please enter the phone number','1','0','3','0','en');
INSERT INTO met_language VALUES('3232','Prompt_user','Please enter your username','1','0','3','0','en');
INSERT INTO met_language VALUES('3233','balance','Balance','1','0','3','0','en');
INSERT INTO met_language VALUES('3234','buy_records','Purchase History','1','0','3','0','en');
INSERT INTO met_language VALUES('3235','registration','registered','1','0','0','0','en');
INSERT INTO met_language VALUES('3236','landing','Login','1','0','0','0','en');
INSERT INTO met_language VALUES('3237','page_range','Page range','1','0','0','0','en');
INSERT INTO met_language VALUES('3238','sys_navigation','Navigation: column settings can be adjusted whether the new window opens.','1','0','35','0','en');
INSERT INTO met_language VALUES('3239','sys_navigation2','When displaying the column list, the pictures need to be uploaded in the column settings (column pictures).','1','0','35','0','en');
INSERT INTO met_language VALUES('3240','suggested_size','Recommended size','1','0','35','0','en');
INSERT INTO met_language VALUES('3241','website_information','Website information','1','0','39','0','en');
INSERT INTO met_language VALUES('3242','email_Settings','Send mailbox configuration','1','0','39','0','en');
INSERT INTO met_language VALUES('3243','third_party_code','Third-party code','1','0','0','0','en');
INSERT INTO met_language VALUES('3244','please_login','please log in first!','1','0','0','0','en');
INSERT INTO met_language VALUES('3245','next_page','next page','1','0','1','0','en');
INSERT INTO met_language VALUES('3246','background_page','Background Home','1','0','0','0','en');
INSERT INTO met_language VALUES('3247','modify_information','modify personal information','1','0','0','0','en');
INSERT INTO met_language VALUES('3248','sys_select','Featured','1','0','3','0','en');
INSERT INTO met_language VALUES('3249','should_used','Application','1','0','3','0','en');
INSERT INTO met_language VALUES('3250','sys_template','Template','1','0','3','0','en');
INSERT INTO met_language VALUES('3251','sys_purchase','buy','1','0','3','0','en');
INSERT INTO met_language VALUES('3252','sys_payment','Pay','1','0','3','0','en');
INSERT INTO met_language VALUES('3253','extension_school','Rice Extension College','1','0','0','0','en');
INSERT INTO met_language VALUES('3254','the_bit','Bit','1','0','0','0','en');
INSERT INTO met_language VALUES('3255','the_server','server','1','0','0','0','en');
INSERT INTO met_language VALUES('3256','the_version','version','1','0','0','0','en');
INSERT INTO met_language VALUES('3257','safety_efficiency','Safety and efficiency','1','0','36','0','en');
INSERT INTO met_language VALUES('3258','data_processing','Backup and recovery','1','0','36','0','en');
INSERT INTO met_language VALUES('3259','appearance','Templates','1','0','0','0','en');
INSERT INTO met_language VALUES('3260','the_user','Users','1','0','8','0','en');
INSERT INTO met_language VALUES('3261','safety','Security','1','0','8','0','en');
INSERT INTO met_language VALUES('3262','attention','attention','1','0','0','0','en');
INSERT INTO met_language VALUES('3263','author','Author','1','0','0','0','en');
INSERT INTO met_language VALUES('3264','sys_authorization1','Enter the business license','1','0','0','0','en');
INSERT INTO met_language VALUES('3265','sys_authorization2','Understand commercial licensing','1','0','0','0','en');
INSERT INTO met_language VALUES('3266','detection','checking','1','0','0','0','en');
INSERT INTO met_language VALUES('3267','entry_authorization','Re-enter the authorization','1','0','0','0','en');
INSERT INTO met_language VALUES('3268','display_number','Number of tabs displayed','1','0','36','0','en');
INSERT INTO met_language VALUES('3269','corresponding_products','Each column can be set separately. If it is not set separately, the configuration of the upper column can be invoked.','1','0','36','0','en');
INSERT INTO met_language VALUES('3270','tab_title1','Tab a title','1','0','36','0','en');
INSERT INTO met_language VALUES('3271','tab_title2','Tab two titles','1','0','36','0','en');
INSERT INTO met_language VALUES('3272','tab_title3','Tab three titles','1','0','36','0','en');
INSERT INTO met_language VALUES('3273','tab_title4','Tab four titles','1','0','36','0','en');
INSERT INTO met_language VALUES('3274','tab_title5','Tab Five Title','1','0','36','0','en');
INSERT INTO met_language VALUES('3275','download_prompt','Ongoing download, please do not operate the page!','1','0','0','0','en');
INSERT INTO met_language VALUES('3276','purchase_application','The purchase of the application can only act on the current website','1','0','0','0','en');
INSERT INTO met_language VALUES('3277','text_color','Text color','1','0','41','0','en');
INSERT INTO met_language VALUES('3278','the_menu','Mobile menu','1','0','41','0','en');
INSERT INTO met_language VALUES('3279','background_color','background color','1','0','41','0','en');
INSERT INTO met_language VALUES('3280','external_links','external link','1','0','0','0','en');
INSERT INTO met_language VALUES('3281','appmarket_jurisdiction','You do not have permission to view the app market, please contact the administrator to open.','1','0','0','0','en');
INSERT INTO met_language VALUES('3282','setup_permissions','You do not have set permissions, please contact the administrator to open.','1','0','0','0','en');
INSERT INTO met_language VALUES('3283','release','Add to','1','0','0','0','en');
INSERT INTO met_language VALUES('3284','administration','Contents','1','0','0','0','en');
INSERT INTO met_language VALUES('3285','customers','Online Service','1','0','0','0','en');
INSERT INTO met_language VALUES('3286','seo','SEO','1','0','32','0','en');
INSERT INTO met_language VALUES('3287','member','member','1','0','38','0','en');
INSERT INTO met_language VALUES('3288','language','Language','1','0','0','0','en');
INSERT INTO met_language VALUES('3289','htmltopseudo','Static page pseudo-static','1','0','11','0','en');
INSERT INTO met_language VALUES('3290','htmltopseudotips','Use pseudo-static way to achieve static page URL, the current static page URL unchanged. SEO effect will not be affected. Need space to support pseudo-static, and will delete the static page file.','1','0','11','0','en');
INSERT INTO met_language VALUES('3291','timedrelease','Regular release','1','0','0','0','en');
INSERT INTO met_language VALUES('3292','mod_rewrite_column','Open pseudo-static space environment configuration required to open the mod_rewrite module, if not open the contact space solution.','1','0','32','0','en');
INSERT INTO met_language VALUES('3293','displaytype2','Front desk hidden','1','0','0','0','en');
INSERT INTO met_language VALUES('3294','js73','Static page name has been used','1','0','0','0','en');
INSERT INTO met_language VALUES('3295','js74','Only supports Chinese, uppercase and lowercase letters, numbers, underline, horizontal line','1','0','0','0','en');
INSERT INTO met_language VALUES('3296','js75','Name available','1','0','0','0','en');
INSERT INTO met_language VALUES('3297','js76','Please add columns and then set the page content on this page','1','0','0','0','en');
INSERT INTO met_language VALUES('3298','unrecom','Cancel recommended','1','0','0','0','en');
INSERT INTO met_language VALUES('3299','untop','Unpin','1','0','0','0','en');
INSERT INTO met_language VALUES('3300','modistauts','Status changes','1','0','0','0','en');
INSERT INTO met_language VALUES('3301','goods','commodity','1','0','0','0','en');
INSERT INTO met_language VALUES('3302','js77','The name of the background folder supports only uppercase and lowercase letters, numbers, and underscores','1','0','0','0','en');
INSERT INTO met_language VALUES('3303','js78','Administrator name can not be repeated','1','0','0','0','en');
INSERT INTO met_language VALUES('3304','banner_pcheight_v6','Computer-side height','1','0','4','0','en');
INSERT INTO met_language VALUES('3305','banner_setalert_v6','Fill the value, (eg 300, representing 300px) suggested adaptive height','1','0','4','0','en');
INSERT INTO met_language VALUES('3306','banner_pidheight_v6','Tablet-side height','1','0','4','0','en');
INSERT INTO met_language VALUES('3307','banner_phoneheight_v6','Phone side height','1','0','4','0','en');
INSERT INTO met_language VALUES('3308','banner_imgtitlecolor_v6','Picture title color','1','0','4','0','en');
INSERT INTO met_language VALUES('3309','banner_needtempsupport_v6','Normally, no settings are required. Some special templates support the front desk before they are displayed.','1','0','4','0','en');
INSERT INTO met_language VALUES('3310','banner_imgdesc_v6','image description','1','0','4','0','en');
INSERT INTO met_language VALUES('3311','banner_imgdesccolor_v6','Picture description color','1','0','4','0','en');
INSERT INTO met_language VALUES('3312','banner_imgwordpos_v6','Image text location','1','0','4','0','en');
INSERT INTO met_language VALUES('3313','posleft','left','1','0','4','0','en');
INSERT INTO met_language VALUES('3314','posright','right','1','0','4','0','en');
INSERT INTO met_language VALUES('3315','posup','on','1','0','4','0','en');
INSERT INTO met_language VALUES('3316','poslower','under','1','0','4','0','en');
INSERT INTO met_language VALUES('3317','poscenter','Center','1','0','4','0','en');
INSERT INTO met_language VALUES('3318','batch_wm_v6','Batch watermarking','1','0','5','0','en');
INSERT INTO met_language VALUES('3319','batch_rmwm_v6','Remove the watermark','1','0','5','0','en');
INSERT INTO met_language VALUES('3320','batch_addwm_v6','Add watermark','1','0','5','0','en');
INSERT INTO met_language VALUES('3321','admin_movetocolumn_v6','Move to the specified column','1','0','0','0','en');
INSERT INTO met_language VALUES('3322','admin_copytocolumn_v6','Copy to the specified column','1','0','0','0','en');
INSERT INTO met_language VALUES('3323','admin_colunmmanage_v6','Column','1','0','0','0','en');
INSERT INTO met_language VALUES('3324','relation_set','Relation Set','1','0','0','0','en');
INSERT INTO met_language VALUES('3325','parmanage','Parameter management','1','0','0','0','en');
INSERT INTO met_language VALUES('3326','refresh','Refresh','1','0','0','0','en');
INSERT INTO met_language VALUES('3327','desctext','Description text','1','0','0','0','en');
INSERT INTO met_language VALUES('3328','linkto','Link to','1','0','0','0','en');
INSERT INTO met_language VALUES('3329','releasenow','Publish now','1','0','0','0','en');
INSERT INTO met_language VALUES('3330','js79','Views','1','0','0','0','en');
INSERT INTO met_language VALUES('3331','added','Added','1','0','0','0','en');
INSERT INTO met_language VALUES('3332','column_littleicon_v6','Small icon icon','1','0','5','0','en');
INSERT INTO met_language VALUES('3333','column_choosicon_v6','Choice icon','1','0','5','0','en');
INSERT INTO met_language VALUES('3334','column_inputcolumnfolder_v6','Enter the name of the section folder','1','0','5','0','en');
INSERT INTO met_language VALUES('3335','browserupdatetips','You are using a obsolete browser. Please upgrade your browser to enhance your experience.','1','0','0','0','en');
INSERT INTO met_language VALUES('3336','column_selecticonlib_v6','Icon library selection','1','0','5','0','en');
INSERT INTO met_language VALUES('3337','column_viewicon_v6','Browse icons','1','0','5','0','en');
INSERT INTO met_language VALUES('3338','tips2_v6','Appears at the bottom of the detail page to aggregate the content','1','0','0','0','en');
INSERT INTO met_language VALUES('3339','tips3_v6','Multiple keywords should be separated by \"|\", such as \"building station | enterprise building station\"','1','0','0','0','en');
INSERT INTO met_language VALUES('3340','tips4_v6','Please enter the URL (need to include http or https); after setting the access to the information will be directed to the set URL','1','0','0','0','en');
INSERT INTO met_language VALUES('3341','tips5_v6','Timely release does not support static pages, please close the static pages. (Pseudo-static can be used)','1','0','0','0','en');
INSERT INTO met_language VALUES('3342','tips6_v6','If it is empty, it will be formed automatically according to the system rules. It can be modified in the SEO settings.','1','0','0','0','en');
INSERT INTO met_language VALUES('3343','tips7_v6','When not manually upload pictures, it will automatically extract the first picture as a cover (this feature requires template support)','1','0','0','0','en');
INSERT INTO met_language VALUES('3344','coverimg','cover image','1','0','0','0','en');
INSERT INTO met_language VALUES('3345','articletitle','Article title','1','0','0','0','en');
INSERT INTO met_language VALUES('3346','htmTip3','Generate homepage','1','0','11','0','en');
INSERT INTO met_language VALUES('3347','js81','You do not have the authority to contact the administrator','1','0','0','0','en');
INSERT INTO met_language VALUES('3348','help2','friendly reminder','1','0','0','0','en');
INSERT INTO met_language VALUES('3349','tips8_v6','There is a serious risk in the name of your site admin folder and I suggest you change it as soon as possible','1','0','0','0','en');
INSERT INTO met_language VALUES('3350','nohint','Do not remind again','1','0','0','0','en');
INSERT INTO met_language VALUES('3351','tochange','Go to edit','1','0','0','0','en');
INSERT INTO met_language VALUES('3352','homepage','Home','1','0','0','0','en');
INSERT INTO met_language VALUES('3353','backstage','Panel','1','0','0','0','en');
INSERT INTO met_language VALUES('3354','visualization','Visual','1','0','0','0','en');
INSERT INTO met_language VALUES('3355','opfailed','operation failed','1','0','1','0','en');
INSERT INTO met_language VALUES('3356','opsuccess','operation success','1','0','1','0','en');
INSERT INTO met_language VALUES('3357','unread','Not read','1','0','0','0','en');
INSERT INTO met_language VALUES('3358','language_outputlang_v6','Export language packs','1','0','16','0','en');
INSERT INTO met_language VALUES('3359','language_batchreplace_v6','Bulk replacement language','1','0','16','0','en');
INSERT INTO met_language VALUES('3360','language_copysetting_v6','Copy the basic settings','1','0','16','0','en');
INSERT INTO met_language VALUES('3361','notcopy','Do not copy','1','0','16','0','en');
INSERT INTO met_language VALUES('3362','language_tips1_v6','Based on the selected language copy all the parameters except column content configuration','1','0','16','0','en');
INSERT INTO met_language VALUES('3363','language_tips2_v6','Based on the selected language copy section and content information (share the selected language pictures, attachments, etc.)','1','0','16','0','en');
INSERT INTO met_language VALUES('3364','template_style_tips','Set parameters based on the selected language copy template','1','0','16','0','en');
INSERT INTO met_language VALUES('3365','websitetheme','Website theme style','1','0','16','0','en');
INSERT INTO met_language VALUES('3366','language_backlangchange_v6','Background language switch','1','0','16','0','en');
INSERT INTO met_language VALUES('3367','language_updatelang_v6','Update language pack data <br> Please paste in exactly as you wish','1','0','16','0','en');
INSERT INTO met_language VALUES('3368','message_mailtext_v6',' submitting a message','1','0','20','0','en');
INSERT INTO met_language VALUES('3369','nopicture','No picture','1','0','20','0','en');
INSERT INTO met_language VALUES('3370','message_tips1_v6','Prompt text, blank display, enter the text disappears','1','0','20','0','en');
INSERT INTO met_language VALUES('3371','message_tips2_v6','Prompt text','1','119','0','0','en');
INSERT INTO met_language VALUES('3372','message_tips3_v6','It is used to set the prompt text or option name in the foreground form input box; if it is not filled in, the parameter name will be displayed','1','119','0','0','en');
INSERT INTO met_language VALUES('3373','onlone_onlinelist_v6','Customer list','1','0','23','0','en');
INSERT INTO met_language VALUES('3374','onlone_online_v6','online service','1','0','23','0','en');
INSERT INTO met_language VALUES('3375','online_csname_v6','Customer service name','1','0','23','0','en');
INSERT INTO met_language VALUES('3376','online_taobaocs_v6','Taobao Want','1','0','23','0','en');
INSERT INTO met_language VALUES('3377','online_alics_v6','Ali Want','1','0','23','0','en');
INSERT INTO met_language VALUES('3378','online_tips1_v6','Add QQ need to [shang.qq.com] login in the 【promotion tools - set??security level choose to be completely open, otherwise it will display \"not enabled\" QQ number added to the need to personal QQ settings - permission settings Inside, open the temporary session function, otherwise click QQ, will prompt to add friends to dialogue','1','0','23','0','en');
INSERT INTO met_language VALUES('3379','confirm','determine','1','0','1','0','en');
INSERT INTO met_language VALUES('3380','frontshow','Front display','1','0','0','0','en');
INSERT INTO met_language VALUES('3381','fronthidden','Front desk hidden','1','0','0','0','en');
INSERT INTO met_language VALUES('3382','state','status','1','0','0','0','en');
INSERT INTO met_language VALUES('3383','visitcount','Views','1','0','0','0','en');
INSERT INTO met_language VALUES('3384','selectcolumn','Please select the column','1','0','0','0','en');
INSERT INTO met_language VALUES('3385','tips11_v6','You can drag the picture to adjust the picture order.','1','0','28','0','en');
INSERT INTO met_language VALUES('3386','tips12_v6','Press the \"ctrl\" key on the computer keyboard to select multiple columns at the same time.','1','0','28','0','en');
INSERT INTO met_language VALUES('3387','columumanage','Column','1','0','0','0','en');
INSERT INTO met_language VALUES('3388','titletips','Title (name)','1','0','28','0','en');
INSERT INTO met_language VALUES('3389','seotipssitemap1','Filtering does not appear in the first level of navigation','1','0','32','0','en');
INSERT INTO met_language VALUES('3390','seotips2','The site generated by the site only a first column and the column displayed in the navigation bar. <br /> do not display content and columns, will not be generated in the site map.','1','0','32','0','en');
INSERT INTO met_language VALUES('3391','seotips3','Compared with pure static functions, pseudo-static is more suitable for corporate websites, which can satisfy both SEO optimization and convenient management.','1','0','32','0','en');
INSERT INTO met_language VALUES('3392','defaultlangtag','Default language ID','1','0','32','0','en');
INSERT INTO met_language VALUES('3393','seotips4','After the default language flag is enabled, the default language pseudo-static file will be added at the end of a \"- language label\", such as \"-cn\"','1','0','32','0','en');
INSERT INTO met_language VALUES('3394','uisetTips3','The current page does not have the parameters that can be set. Click the Set and Contents buttons of the corresponding block in the page to set','1','0','36','0','en');
INSERT INTO met_language VALUES('3395','upload_addoutimg_v6','Add an external picture','1','0','1','0','en');
INSERT INTO met_language VALUES('3396','upload_progress_v6','Uploading','1','0','1','0','en');
INSERT INTO met_language VALUES('3397','upload_local_v6','Local upload','1','0','1','0','en');
INSERT INTO met_language VALUES('3398','upload_selectimg_v6','Select a picture','1','0','1','0','en');
INSERT INTO met_language VALUES('3399','upload_pselectimg_v6','Please select the picture','1','0','1','0','en');
INSERT INTO met_language VALUES('3400','upload_libraryimg_v6','Select from the picture library','1','0','1','0','en');
INSERT INTO met_language VALUES('3401','upload_extraimglink_v6','External picture link','1','0','1','0','en');
INSERT INTO met_language VALUES('3402','compliance_materials','Compliance materials','1','0','1','0','en');
INSERT INTO met_language VALUES('3403','addbaricon','Address bar icon','1','0','39','0','en');
INSERT INTO met_language VALUES('3404','webset_tips1_v6','If you can not display the new upload icon, clear the browser cache access.','1','0','39','0','en');
INSERT INTO met_language VALUES('3405','webset_tips2_v6','Click to create ICO','1','0','39','0','en');
INSERT INTO met_language VALUES('3406','icontips','.ico file.','1','0','39','0','en');
INSERT INTO met_language VALUES('3407','PC','Computer side','1','0','0','0','en');
INSERT INTO met_language VALUES('3408','memberist','member list','1','0','38','0','en');
INSERT INTO met_language VALUES('3409','membergroup','member group','1','0','38','0','en');
INSERT INTO met_language VALUES('3410','memberattribute','Member properties','1','0','38','0','en');
INSERT INTO met_language VALUES('3411','memberfunc','Member function settings','1','0','38','0','en');
INSERT INTO met_language VALUES('3412','thirdlogin','Social login','1','0','38','0','en');
INSERT INTO met_language VALUES('3413','mailcontentsetting','Mail content settings','1','0','38','0','en');
INSERT INTO met_language VALUES('3414','user_tips1_v6','You can register','1','0','38','0','en');
INSERT INTO met_language VALUES('3415','user_tips2_v6','Contains illegal characters','1','0','38','0','en');
INSERT INTO met_language VALUES('3416','user_tips3_v6','Username already exists','1','0','38','0','en');
INSERT INTO met_language VALUES('3417','user_tips4_v6','Please enter the 6-30 password','1','0','38','0','en');
INSERT INTO met_language VALUES('3418','weixinlogin','Wechat login','1','0','38','0','en');
INSERT INTO met_language VALUES('3419','sinalogin','Weibo login','1','0','38','0','en');
INSERT INTO met_language VALUES('3420','qqlogin','QQ login','1','0','38','0','en');
INSERT INTO met_language VALUES('3421','register','registered','1','0','38','0','en');
INSERT INTO met_language VALUES('3422','lastactive','Last active','1','0','38','0','en');
INSERT INTO met_language VALUES('3423','source','source','1','0','38','0','en');
INSERT INTO met_language VALUES('3424','bindingmail','Bind the mailbox','1','0','38','0','en');
INSERT INTO met_language VALUES('3425','bindingmobile','Binding phone','1','0','38','0','en');
INSERT INTO met_language VALUES('3426','systips1','You do not have permission to access this content! Please login to visit!','1','0','0','0','en');
INSERT INTO met_language VALUES('3427','systips2','Your user group does not have permission to access this content!','1','0','0','0','en');
INSERT INTO met_language VALUES('3428','unrestricted','not limited','1','0','40','0','en');
INSERT INTO met_language VALUES('3429','dowloadauthority','Download permissions','1','0','40','0','en');
INSERT INTO met_language VALUES('3430','save','save','1','0','0','0','en');
INSERT INTO met_language VALUES('3431','baceinfo','Basic Information','1','0','0','0','en');
INSERT INTO met_language VALUES('3432','staticpage','Static page settings','1','162','0','0','en');
INSERT INTO met_language VALUES('3433','pseudostatic','Pseudo-static','1','164','0','0','en');
INSERT INTO met_language VALUES('3434','setequivalentcolumns','The current section','1','22','0','0','en');
INSERT INTO met_language VALUES('3435','veditor','Visual editing','1','0','2','0','en');
INSERT INTO met_language VALUES('3436','veditortips1','Open ','1','0','2','0','en');
INSERT INTO met_language VALUES('3437','funcCollection','Collection','1','0','0','0','en');
INSERT INTO met_language VALUES('3438','websiteSet','Website configuration and management','1','0','0','0','en');
INSERT INTO met_language VALUES('3439','systemModule','System module','1','0','0','0','en');
INSERT INTO met_language VALUES('3440','appearanceSetting','Appearance settings','1','0','0','0','en');
INSERT INTO met_language VALUES('3441','basicInfoSet','Basic information configuration','1','0','0','0','en');
INSERT INTO met_language VALUES('3442','multilingual','Languages','1','0','0','0','en');
INSERT INTO met_language VALUES('3443','mailSetting','Send mailbox configuration','1','0','0','0','en');
INSERT INTO met_language VALUES('3444','thirdCode','Third-party code to add','1','0','0','0','en');
INSERT INTO met_language VALUES('3445','watermarkThumbnail','Watermark / thumbnail','1','0','0','0','en');
INSERT INTO met_language VALUES('3446','customerService','online service','1','0','0','0','en');
INSERT INTO met_language VALUES('3447','recycleBin','Recycle Bin','1','0','0','0','en');
INSERT INTO met_language VALUES('3448','securityTools','System Security and Tools','1','0','0','0','en');
INSERT INTO met_language VALUES('3449','searchEngineOptimization','SEO search engine optimization','1','0','0','0','en');
INSERT INTO met_language VALUES('3450','seoSetting','SEO parameter settings','1','0','0','0','en');
INSERT INTO met_language VALUES('3451','thirdPartyLogin','Social login settings','1','0','0','0','en');
INSERT INTO met_language VALUES('3452','appAndPlugin','Application plug-ins','1','0','0','0','en');
INSERT INTO met_language VALUES('3453','metShop','Official mall','1','0','0','0','en');
INSERT INTO met_language VALUES('3454','purchase_notice','Purchase Notice','1','0','0','0','en');
INSERT INTO met_language VALUES('3455','commercialAuthorizationCode','Commercial authorization code','1','0','0','0','en');
INSERT INTO met_language VALUES('3456','systips13','Old version template compatible (non-responsive template)','1','0','0','0','en');
INSERT INTO met_language VALUES('3457','mobileSetting','Mobile version set','1','0','0','0','en');
INSERT INTO met_language VALUES('3458','mobileVersion','Mobile version of the appearance','1','0','0','0','en');
INSERT INTO met_language VALUES('3459','uiset_descript_v6','The selected application will appear in the navigation bar [common function] drop-down list','1','0','0','0','en');
INSERT INTO met_language VALUES('3460','uisetTips4','Current page preview','1','0','36','0','en');
INSERT INTO met_language VALUES('3461','uisetTips5','The current page system parameter settings','1','0','36','0','en');
INSERT INTO met_language VALUES('3462','uisetTips6','Page','1','0','36','0','en');
INSERT INTO met_language VALUES('3463','moreSettings','More','1','0','36','0','en');
INSERT INTO met_language VALUES('3464','sysMailboxConfig','Mail Settings','1','0','36','0','en');
INSERT INTO met_language VALUES('3465','navSetting','Navigation menu settings','1','0','36','0','en');
INSERT INTO met_language VALUES('3466','oldBackstage','Panel','1','0','36','0','en');
INSERT INTO met_language VALUES('3467','sysMessage','system information','1','0','36','0','en');
INSERT INTO met_language VALUES('3468','replaceImg','Replace the picture','1','0','36','0','en');
INSERT INTO met_language VALUES('3469','uisetTips8','Hide the element <br> (hide the modified occlusion element, <br> refresh the page can be displayed again)','1','0','36','0','en');
INSERT INTO met_language VALUES('3470','putIntoRecycle','Into the recycling station','1','0','1','0','en');
INSERT INTO met_language VALUES('3471','thoroughlyDeleting','Remove completely','1','0','1','0','en');
INSERT INTO met_language VALUES('3472','websiteContent','Website basic content','1','0','16','0','en');
INSERT INTO met_language VALUES('3473','jslang0','Into the recycling station','1','0','1','0','en');
INSERT INTO met_language VALUES('3474','jslang1','Remove completely','1','0','1','0','en');
INSERT INTO met_language VALUES('3475','jslang2','cancel','1','0','1','0','en');
INSERT INTO met_language VALUES('3476','seotips26','After opening to simplify the front page URL (URL); and end in html (static page function is disabled).','1','0','32','0','en');
INSERT INTO met_language VALUES('3477','systips14','(Please ensure that the pseudo-static function is turned off before opening)','1','0','11','0','en');
INSERT INTO met_language VALUES('3478','systips15','MB (If the website background setting value exceeds the maximum limit of the upload file of the server, the value of the server limit shall prevail)','1','0','30','0','en');
INSERT INTO met_language VALUES('3479','third_code_mobile','Mobile third-party code','1','0','39','0','en');
INSERT INTO met_language VALUES('3480','clearCache','Cache','1','0','1','0','en');
INSERT INTO met_language VALUES('3481','jsx39','(Delete column will delete all the contents of the column)','1','0','5','0','en');
INSERT INTO met_language VALUES('3482','jslang3','No records selected','1','0','1','0','en');
INSERT INTO met_language VALUES('3483','jslang4','Please select the column','1','0','1','0','en');
INSERT INTO met_language VALUES('3484','jslang5','I know','1','0','1','0','en');
INSERT INTO met_language VALUES('3485','jslang6','Expand more settings','1','0','1','0','en');
INSERT INTO met_language VALUES('3486','jslang7','Hide settings','1','0','1','0','en');
INSERT INTO met_language VALUES('3487','newFeedback','You received new feedback','1','0','9','0','en');
INSERT INTO met_language VALUES('3488','wap_descript5_v6','The name cannot be empty!','1','450','41','0','en');
INSERT INTO met_language VALUES('3489','allapp_v6','All applications','1','469','21','0','en');
INSERT INTO met_language VALUES('3490','freeapp_v6','Free application','1','470','21','0','en');
INSERT INTO met_language VALUES('3491','Business_membersapp_v6','Commercial Application','1','471','21','0','en');
INSERT INTO met_language VALUES('3492','payapp','Charge application','1','472','21','0','en');
INSERT INTO met_language VALUES('3493','servicename_v6','Service name','1','473','21','0','en');
INSERT INTO met_language VALUES('3494','appstore_descript1_v6','Technical support service / Renewal','1','474','21','0','en');
INSERT INTO met_language VALUES('3495','appstore_Servicescope_v6','Service scope','1','475','21','0','en');
INSERT INTO met_language VALUES('3496','appstore_descript2_v6','MetInfo product service (installation, upgrading, moving, troubleshooting and processing, server debugging','1','476','21','0','en');
INSERT INTO met_language VALUES('3497','appstore_descript3_v6','Direct help.','1','477','21','0','en');
INSERT INTO met_language VALUES('3498','appstore_descript4_v6','Server debugging: setting up the server environment for the first time and handling the server environment problems related to the MetInfo failure.','1','478','21','0','en');
INSERT INTO met_language VALUES('3499','appstore_descript5_v6','Professional solutions (product use / skill, SEO optimization, network marketing)','1','479','21','0','en');
INSERT INTO met_language VALUES('3500','appstore_descript6_v6','Help analysis, provide solutions and guidance, and do not provide operational services.','1','480','21','0','en');
INSERT INTO met_language VALUES('3501','appstore_descript7_v6','The scope of service is subject to the above content. If unmarked, the service is not provided.','1','481','21','0','en');
INSERT INTO met_language VALUES('3502','appstore_descript8_v6','There is no service provided in the following case','1','482','21','0','en');
INSERT INTO met_language VALUES('3503','appstore_descript9_v6','Problems generated by self modification or use of non original MetInfo code','1','483','21','0','en');
INSERT INTO met_language VALUES('3504','appstore_descript10_v6','Problems caused by unofficially developed application plug-ins and made templates (the third party application / template on the application store is a service range)','1','484','21','0','en');
INSERT INTO met_language VALUES('3505','appstore_descript11_v6','System failures caused by server and virtual host causes','1','485','21','0','en');
INSERT INTO met_language VALUES('3506','appstore_descript12_v6','Unauthorized removal of copyright information without a commercial authorization','1','486','21','0','en');
INSERT INTO met_language VALUES('3507','appstore_descript13_v6','Does not contain website content maintenance, picture processing, source code modification.','1','487','21','0','en');
INSERT INTO met_language VALUES('3508','appstore_servicemode_v6','service mode','1','488','21','0','en');
INSERT INTO met_language VALUES('3509','appstore_descript14_v6','Submission of work list: troubleshooting, problem consulting (daily)','1','489','21','0','en');
INSERT INTO met_language VALUES('3510','appstore_descript15_v6','Online consulting: problem consulting (only working day online, online time: 08:30 - 17:30)','1','490','21','0','en');
INSERT INTO met_language VALUES('3511','appstore_descript16_v6','Application store account login MetInfo official network can also obtain work list, online consulting services (not to access the background of the site of the recommended use).','1','491','21','0','en');
INSERT INTO met_language VALUES('3512','appstore_descript17_v6','Select service length','1','492','21','0','en');
INSERT INTO met_language VALUES('3513','appstore_descript18_v6','One month (300 yuan)','1','493','21','0','en');
INSERT INTO met_language VALUES('3514','appstore_descript19_v6','Three months (500 yuan)','1','494','21','0','en');
INSERT INTO met_language VALUES('3515','appstore_descript20_v6','One year (1000 yuan)','1','495','21','0','en');
INSERT INTO met_language VALUES('3516','appstore_QQsalesconsulting_v6','QQ sales consulting','1','496','21','0','en');
INSERT INTO met_language VALUES('3517','appstore_descript21_v6','Consult QQ for details of service','1','497','21','0','en');
INSERT INTO met_language VALUES('3518','appstore_descript22_v6','Single service price: the website moves 200 yuan / times, the website installs 100 yuan / times, the website upgrade 100 yuan, the malfunction processing 100 yuan','1','498','21','0','en');
INSERT INTO met_language VALUES('3519','appstore_descript23_v6','The login password of the application store account','1','499','21','0','en');
INSERT INTO met_language VALUES('3520','appstore_descript24_v6','Clear and comply with the above service scope and service mode','1','500','21','0','en');
INSERT INTO met_language VALUES('3521','appstore_descript25_v6','Immediately open / renew','1','501','21','0','en');
INSERT INTO met_language VALUES('3522','appstore_descript26_v6','Template making / modifying service provider','1','502','21','0','en');
INSERT INTO met_language VALUES('3523','appstore_sign_v6','sign','1','503','21','0','en');
INSERT INTO met_language VALUES('3524','appstore_name_v6','Name','1','504','21','0','en');
INSERT INTO met_language VALUES('3525','appstore_type_v6','type','1','505','21','0','en');
INSERT INTO met_language VALUES('3526','appstore_place_v6','region','1','506','21','0','en');
INSERT INTO met_language VALUES('3527','appstore_Abilityvalue_v6','Ability value','1','507','21','0','en');
INSERT INTO met_language VALUES('3528','appstore_descript27_v6','How do businesses enter?','1','508','21','0','en');
INSERT INTO met_language VALUES('3529','appstore_descript28_v6','Description of business entry','1','509','21','0','en');
INSERT INTO met_language VALUES('3530','appstore_Admissionrequirements_v6','Admission requirements','1','510','21','0','en');
INSERT INTO met_language VALUES('3531','appstore_descript29_v6','Business entry instructions have been awarded the title of \"official certification template designer\".','1','511','21','0','en');
INSERT INTO met_language VALUES('3532','appstore_descript30_v6','Completion of official template training and successful completion','1','512','21','0','en');
INSERT INTO met_language VALUES('3533','appstore_descript31_v6','Order this registration training','1','513','21','0','en');
INSERT INTO met_language VALUES('3534','appstore_descript32_v6','Line a set of charge templates to the application store.','1','514','21','0','en');
INSERT INTO met_language VALUES('3535','appstore_Admissionprocess_v6','Admission process','1','515','21','0','en');
INSERT INTO met_language VALUES('3536','appstore_descript33_v6','1. Contact the official business co - operation Commissioner:','1','516','21','0','en');
INSERT INTO met_language VALUES('3537','appstore_descript34_v6','QQ inviting investment','1','517','21','0','en');
INSERT INTO met_language VALUES('3538','appstore_descript35_v6','QQ joined 2, registered to participate in the official template production training and won the title of \"official certification template designer\".','1','518','21','0','en');
INSERT INTO met_language VALUES('3539','appstore_descript36_v6','3, through the official network audit and the smooth line of a set of charging templates to the application store.','1','519','21','0','en');
INSERT INTO met_language VALUES('3540','appstore_descript37_v6','4, provide the information required by the merchants to enter, and the official verification.','1','520','21','0','en');
INSERT INTO met_language VALUES('3541','appstore_descript38_v6','5, formally entered.','1','521','21','0','en');
INSERT INTO met_language VALUES('3542','appstore_descript39_v6','The standard and audit of a set of works to the application store will be very strict, because we need to ensure that the end users can get enough professional technical services.','1','522','21','0','en');
INSERT INTO met_language VALUES('3543','appstore_service_v6','service','1','523','21','0','en');
INSERT INTO met_language VALUES('3544','appstore_Spacedomain_name_v6','Space domain name','1','524','21','0','en');
INSERT INTO met_language VALUES('3545','appstore_Worryfree_service_v6','Worry free service','1','525','21','0','en');
INSERT INTO met_language VALUES('3546','appstore_buildweb_v6','Set up dinner set','1','526','21','0','en');
INSERT INTO met_language VALUES('3547','appstore_Thirdcooperation_v6','Third party cooperation','1','527','21','0','en');
INSERT INTO met_language VALUES('3548','appstore_downshowdata_v6','Downloading demo data','1','528','21','0','en');
INSERT INTO met_language VALUES('3549','banner_column_v6','column','1','533','4','0','en');
INSERT INTO met_language VALUES('3550','batch_watermarking_v6','Batch watermarking operation','1','538','5','0','en');
INSERT INTO met_language VALUES('3551','open_allchildcolumn_v6','Unfold all the subsections','1','541','7','0','en');
INSERT INTO met_language VALUES('3552','column_descript1_v6','The directory name only lowercase letters or numbers, and can not duplicate and other columns!','1','542','7','0','en');
INSERT INTO met_language VALUES('3553','add_to_v6','Add to','1','543','7','0','en');
INSERT INTO met_language VALUES('3554','seo_set_v6','SEO settings','1','544','7','0','en');
INSERT INTO met_language VALUES('3555','content_name_v6','Name','1','553','7','0','en');
INSERT INTO met_language VALUES('3556','html_createend_v6','Completion','1','559','1','0','en');
INSERT INTO met_language VALUES('3557','html_createfail_v6','Generation failure','1','560','11','0','en');
INSERT INTO met_language VALUES('3558','online_addkefu_v6','Add customer service','1','561','23','0','en');
INSERT INTO met_language VALUES('3559','pay_WeChat_v6','WeChat','1','628','26','0','en');
INSERT INTO met_language VALUES('3560','notauthen','Uncertified','1','9','2','0','en');
INSERT INTO met_language VALUES('3561','rnvalidate','Real name authentication','1','9','2','0','en');
INSERT INTO met_language VALUES('3562','mobile_logo','Wapsite LOGO','1','9','2','0','en');
INSERT INTO met_language VALUES('3563','mobile_banner_tips1','(When you do not upload pictures of mobile phones, the banner diagrams of mobile hones are consistent with the computer terminals.)','1','9','2','0','en');
INSERT INTO met_language VALUES('3564','langexisted','Lang Existed','1','9','2','0','en');
INSERT INTO met_language VALUES('3565','fdincTip12','Backstage display list item','1','49','0','0','en');
INSERT INTO met_language VALUES('3566','fdincTip13','You can only select drop-down, radio and multi-choice feedback fields. After setting and saving here, please go to \"Feedback Form Settings\" to set up the relevant product columns.','1','559','1','0','en');
INSERT INTO met_language VALUES('3567','unitytxt_1','Function setting','1','0','1','0','en');
INSERT INTO met_language VALUES('3568','enter_folder','Double click the folder icon and enter the folder to select the picture.','1','0','1','0','en');
INSERT INTO met_language VALUES('3569','fliptext2','loading','1','0','1','0','en');
INSERT INTO met_language VALUES('3570','memberarayname','Memberaray name','1','0','11','0','en');
INSERT INTO met_language VALUES('3571','thumbs_tips1_v6','After saving and modifying, please go to the visual interface and click on the frequently used function - clear the thumbnail for this save to take effect.','1','0','0','0','en');
INSERT INTO met_language VALUES('3572','recahrge_tips','After recharging, a refund of 2% will be deducted, and within 60 days after the recharge, the invoice application can be submitted in the \"user center financial center invoice application\".','1','0','0','0','en');
INSERT INTO met_language VALUES('3573','sys_lang_operate','system languag opreate','1','0','0','0','en');
INSERT INTO met_language VALUES('3574','edit_app_lang','Edit plugin language','1','0','0','0','en');
INSERT INTO met_language VALUES('3575','product_para_tips','The link field type requires foreground template support. If the template is not supported, the attachment type can be used for function substitution.','1','0','0','0','en');
INSERT INTO met_language VALUES('3576','met_template_nofile','Template folder does not exist','1','0','0','50002','en');
INSERT INTO met_language VALUES('3577','met_template_fileexist','Template already exists','1','0','0','50002','en');
INSERT INTO met_language VALUES('3578','met_template_noconfigfile','Template profile does not exist','1','0','0','50002','en');
INSERT INTO met_language VALUES('3579','met_template_falsedelui','Failed to delete UI','1','0','0','50002','en');
INSERT INTO met_language VALUES('3580','met_template_falsedeluiconfig','Deleting UI configuration failed','1','0','0','50002','en');
INSERT INTO met_language VALUES('3581','met_template_falsedelconfig','Delete global configuration failed','1','0','0','50002','en');
INSERT INTO met_language VALUES('3582','met_template_downloadfalse','download failed','1','0','0','50002','en');
INSERT INTO met_language VALUES('3583','met_template_downloadok','download successful','1','0','0','50002','en');
INSERT INTO met_language VALUES('3584','met_template_temnoexist','Template does not exist','1','0','0','50002','en');
INSERT INTO met_language VALUES('3585','met_template_demonoexist','Demo data does not exist','1','0','0','50002','en');
INSERT INTO met_language VALUES('3586','met_template_upzipdemofalse','Unpacking demo data failed','1','0','0','50002','en');
INSERT INTO met_language VALUES('3587','met_template_upzipok','Decompression succeeded','1','0','0','50002','en');
INSERT INTO met_language VALUES('3588','met_template_installok','Successful installation','1','0','0','50002','en');
INSERT INTO met_language VALUES('3589','met_template_templates','UI business template','1','0','0','50002','en');
INSERT INTO met_language VALUES('3590','met_template_othertemplates','Other templates','1','0','0','50002','en');
INSERT INTO met_language VALUES('3591','met_template_installdemo','Install demo data','1','0','0','50002','en');
INSERT INTO met_language VALUES('3592','met_template_deletteminfo','Are you sure you want to delete this template? Cannot be restored after deletion.','1','0','0','50002','en');
INSERT INTO met_language VALUES('3593','met_template_nodelet','System app does not allow deletion','1','0','0','50002','en');
INSERT INTO met_language VALUES('3594','met_template_filesavef','File save failed','1','0','0','50002','en');
INSERT INTO met_language VALUES('3595','met_template_installuierr','Error importing UI','1','0','0','50002','en');
INSERT INTO met_language VALUES('3596','met_template_installuiparaerr','Error importing UI parameters','1','0','0','50002','en');
INSERT INTO met_language VALUES('3597','met_template_updateok','update successed','1','0','0','50002','en');
INSERT INTO met_language VALUES('3598','met_template_updatefalse','Update failed','1','0','0','50002','en');
INSERT INTO met_language VALUES('3599','met_template_updatedatafalse','Data update failed','1','0','0','50002','en');
INSERT INTO met_language VALUES('3600','met_template_donotinfo','No action or no permission','1','0','0','50002','en');
INSERT INTO met_language VALUES('3601','met_template_langinfotext','When multi-language is turned on, you must first switch to the visual management of the corresponding language or the traditional background, and then enable a set of templates here; different languages can enable different templates.','1','0','0','50002','en');
INSERT INTO met_language VALUES('3602','met_template_metinfouserinfo','The Mito official website user center account can simultaneously install the purchased and bound domain name as the business template of the website. You can bind the domain name in the Mituo user center within 60 days after purchase.','1','0','0','50002','en');
INSERT INTO met_language VALUES('3603','met_template_buytemplates','Purchase new template','1','0','0','50002','en');
INSERT INTO met_language VALUES('3604','met_template_delettemplatesinfo','Deleting a template from the list does not delete the template folder under the website root /templates/','1','0','0','50002','en');
INSERT INTO met_language VALUES('3605','met_template_demoinstalltitle','Demo data installation tips! ! !','1','0','0','50002','en');
INSERT INTO met_language VALUES('3606','met_template_demoinstallsel','Please choose the appropriate installation method for you','1','0','0','50002','en');
INSERT INTO met_language VALUES('3607','met_template_demoinstallt1','Restore factory settings: The system will clear all existing data of the website and restore the website to the template demo data status;','1','0','0','50002','en');
INSERT INTO met_language VALUES('3608','met_template_demoinstallt2','Back up existing data and install it: the system will automatically back up the existing database and image of the website, and then restore the website to the template demo data status. In the future, you can restore the website to the state before the demo data is installed by restoring the backup data.','1','0','0','50002','en');
INSERT INTO met_language VALUES('3609','met_template_demoinstallt3','Cancel: If your website has already added content, we recommend that you do not install demo data. After installing the template, you can set the relevant block content directly in the visualization.','1','0','0','50002','en');
INSERT INTO met_language VALUES('3610','met_template_saveinstall','Back up existing data and install it','1','0','0','50002','en');
INSERT INTO met_language VALUES('3611','met_template_installnewmetinfo','reset','1','0','0','50002','en');
INSERT INTO met_language VALUES('3612','met_template_downloadtemjs','Downloading template...','1','0','1','50002','en');
INSERT INTO met_language VALUES('3613','met_template_downloadtemokjs','Download template successfully','1','0','1','50002','en');
INSERT INTO met_language VALUES('3614','met_template_downloaduijs','Downloading UI','1','0','1','50002','en');
INSERT INTO met_language VALUES('3615','metinfoapp3','Official statement','1','0','0','0','en');
INSERT INTO met_language VALUES('3616','metinfoapptext3','Third-party merchants cover MetInfo application and template development, and SME information services. However, MetInfo officials are not involved in the operation and division of related products and services. Users are requested to identify and bear all the consequences. If you find that the business is illegal or dishonest, you are welcome to report it to MetInfo, and we will remove it.','1','0','0','0','en');
INSERT INTO met_language VALUES('3617','metinfoappinstallinfo','Application first install will automatically bind the domain name','1','0','0','0','en');
INSERT INTO met_language VALUES('3618','metinfoappinstallinfo4','installation tips','1','0','1','0','en');
INSERT INTO met_language VALUES('3619','columnselect1','Select Category','1','0','0','0','en');
INSERT INTO met_language VALUES('3620','columnnofollow','Nofollow attribute','1','0','0','0','en');
INSERT INTO met_language VALUES('3621','columnnofollowinfo','After checking, the website does not pass weights to the link URL.','1','0','0','0','en');
INSERT INTO met_language VALUES('3622','feedbackinquiry','Online Inquiry','1','0','0','0','en');
INSERT INTO met_language VALUES('3623','feedbackinquiryinfo','This option can only be turned on in one feedback column','1','0','0','0','en');
INSERT INTO met_language VALUES('3624','feedbackinquiryinfo1','After opening the online inquiry, the product details page will automatically display the inquiry button.','1','0','0','0','en');
INSERT INTO met_language VALUES('3625','webupate1','Website backup','1','0','0','0','en');
INSERT INTO met_language VALUES('3626','webupate3','Decompression succeeded','1','0','0','0','en');
INSERT INTO met_language VALUES('3627','webupate4','Unpacking failed','1','0','0','0','en');
INSERT INTO met_language VALUES('3628','webupate5','Compressed package does not exist','1','0','0','0','en');
INSERT INTO met_language VALUES('3629','webupate6','file type','1','0','0','0','en');
INSERT INTO met_language VALUES('3630','webupate7','Decompression','1','0','0','0','en');
INSERT INTO met_language VALUES('3631','webupate9','Use backup administrator account','1','0','0','0','en');
INSERT INTO met_language VALUES('3632','webupate10','Do not override the administrator account','1','0','0','0','en');
INSERT INTO met_language VALUES('3633','seohtaccess1','Whether to display the file list in the root directory','1','0','1','0','en');
INSERT INTO met_language VALUES('3634','updatenofile','The installation package does not exist','1','0','0','0','en');
INSERT INTO met_language VALUES('3635','updateupzipfileno','Unpacking data failed','1','0','0','0','en');
INSERT INTO met_language VALUES('3636','updateinstallnow','installing...','1','0','1','0','en');
INSERT INTO met_language VALUES('3637','useinfopay','This feature requires the payment interface management application to be enabled before it can be enabled.','1','0','0','0','en');
INSERT INTO met_language VALUES('3638','usegroupauto1','Automatically upgrade the full amount of recharge','1','0','0','0','en');
INSERT INTO met_language VALUES('3639','usegroupbuy','Paid purchase member group','1','0','0','0','en');
INSERT INTO met_language VALUES('3640','usereadinfo','Reading permission value must be greater than 0','1','0','0','0','en');
INSERT INTO met_language VALUES('3641','userselectname','Tab','1','0','0','0','en');
INSERT INTO met_language VALUES('3642','msmnoifno','SMS function has not been activated','1','0','0','0','en');
INSERT INTO met_language VALUES('3643','templateseditfalse','fail to edit','1','0','0','0','en');
INSERT INTO met_language VALUES('3644','templatefilewritno','Directory is not writable','1','0','0','0','en');
INSERT INTO met_language VALUES('3645','times1','Seconds ago','1','0','0','0','en');
INSERT INTO met_language VALUES('3646','times2','minutes ago','1','0','0','0','en');
INSERT INTO met_language VALUES('3647','times3','hour ago','1','0','0','0','en');
INSERT INTO met_language VALUES('3648','times4','Days ago','1','0','0','0','en');
INSERT INTO met_language VALUES('3649','uploadfilenop','No permission to upload','1','0','0','0','en');
INSERT INTO met_language VALUES('3650','rurlerror','Request address error','1','0','0','0','en');
INSERT INTO met_language VALUES('3651','paranouse','The parameter is invalid','1','0','0','0','en');
INSERT INTO met_language VALUES('3652','linkmetinfoerror','Your server is not connected to the Net User Center, please contact the official website customer service staff to detect the server!!!','1','0','0','0','en');
INSERT INTO met_language VALUES('3653','appusererror','The login password in the background is incorrect. Please reset the account password in the Met User Center! ! !','1','0','0','0','en');
INSERT INTO met_language VALUES('3654','parameter10','link','1','0','0','0','en');
INSERT INTO met_language VALUES('3655','parametervalueinfo','value','1','0','0','0','en');
INSERT INTO met_language VALUES('3656','indexmobilelogoinfo','When the template has the mobile phone LOGO setting, the setting here is invalid. When the static page is opened, the setting is invalid. Leave the mobile terminal to use the default LOGO.','1','0','0','0','en');
INSERT INTO met_language VALUES('3657','met_template_setmarktext','Click to expand advanced settings','1','0','0','50002','en');
INSERT INTO met_language VALUES('3658','met_template_setmarktexth','Hide advanced settings','1','0','0','50002','en');
INSERT INTO met_language VALUES('3659','columndeffflor','The name of the column file you are using conflicts with the system default module folder name. Please rename it.','1','0','0','0','en');
INSERT INTO met_language VALUES('3660','cancel','cancel','1','0','1','0','en');
INSERT INTO met_language VALUES('3661','banner_setmobileImgUrl_v6','Mobile phone end picture address','1','0','4','0','en');
INSERT INTO met_language VALUES('3662','idcode','ID code','1','0','0','0','en');
INSERT INTO met_language VALUES('3663','recoveryisntallinfo','The imported version of the database is inconsistent with the current version of the system. Some parameters and configuration data may be lost after import. Please import it carefully!','1','0','0','0','en');
INSERT INTO met_language VALUES('3664','setpnorder','Previous and Next Call Settings','1','0','0','50002','en');
INSERT INTO met_language VALUES('3665','disableCssJs','Turn off system css and js','1','1','0','0','en');
INSERT INTO met_language VALUES('3666','disableCssJsTips','It is forbidden to load the default css and js (for developers to create templates, ordinary users should not close)','1','1','0','0','en');
INSERT INTO met_language VALUES('3667','setseoLogoKeyword','Logo KeyWord','1','21','32','0','en');
INSERT INTO met_language VALUES('3668','301jump','Website 301 jump','1','1','0','0','en');
INSERT INTO met_language VALUES('3669','301jumpDescription','After opening, the website domain name will automatically jump to the website domain name with www. Example: ******.cn Jump www.******.cn','1','1','0','0','en');
INSERT INTO met_language VALUES('3670','gotohttps','HTTP jump to HTTPS','1','1','0','0','en');
INSERT INTO met_language VALUES('3671','gotohttps_tips','This function requires the server to install SSL certificate and support HTTPS protocol to enable','1','1','0','0','en');
INSERT INTO met_language VALUES('3672','admin_login_lang','Login to the background language','1','0','0','0','en');
INSERT INTO met_language VALUES('3673','admin_del_error','Prohibition to delete founder','1','0','0','0','en');
INSERT INTO met_language VALUES('3674','sethttps','After opening, the system automatically replaces all HTTP paths on the site and clears the template cache','1','0','0','0','en');
INSERT INTO met_language VALUES('3675','404page','404 page content','1','0','0','0','en');
INSERT INTO met_language VALUES('3676','data_null','No content prompt text','1','0','0','0','en');
INSERT INTO met_language VALUES('3677','column_other_info','Other info','1','0','0','0','en');
INSERT INTO met_language VALUES('3678','column_custom_info','Custom info','1','0','0','0','en');
INSERT INTO met_language VALUES('3679','seting','Seting','1','0','0','0','en');
INSERT INTO met_language VALUES('3680','special_che_deny','Do not use special characters','1','0','0','0','en');
INSERT INTO met_language VALUES('3681','clearThumb','Clear thumbnails','1','0','0','0','en');
INSERT INTO met_language VALUES('3682','operation_log','Operation log','1','0','0','0','en');
INSERT INTO met_language VALUES('3683','request_address','Request address','1','0','0','0','en');
INSERT INTO met_language VALUES('3684','request_result','Request result','1','0','0','0','en');
INSERT INTO met_language VALUES('3685','admin_log','Open the background operation log','1','0','0','0','en');
INSERT INTO met_language VALUES('3686','associated_columns','Associated Columns','1','0','0','0','en');
INSERT INTO met_language VALUES('3687','pass_empty','Do not enter does not change the password','1','0','0','0','en');
INSERT INTO met_language VALUES('3688','unzip_tips','Unzip will overwrite the same named file in the upload folder','1','0','0','0','en');
INSERT INTO met_language VALUES('3689','adminFunOperate','Function module operation authority','1','0','0','0','en');
INSERT INTO met_language VALUES('3690','tags_title','Tags page title','1','0','0','0','en');
INSERT INTO met_language VALUES('3691','tags_title_tips','Tags page title content','1','0','0','0','en');
INSERT INTO met_language VALUES('3692','text_size','Text size','1','0','0','0','en');
INSERT INTO met_language VALUES('3693','desc_size','Describe size','1','0','0','0','en');
INSERT INTO met_language VALUES('3694','desc_color','Describe color','1','0','0','0','en');
INSERT INTO met_language VALUES('3695','column_style_tips','This setting requires template support','1','0','0','0','en');
INSERT INTO met_language VALUES('3696','content_style_tips','This setting is generally valid only in the information list','1','0','0','0','en');
INSERT INTO met_language VALUES('3697','modifyaccemail','Bind mailbox to modify mail','1','0','0','0','en');
INSERT INTO met_language VALUES('3698','temSupport','This feature requires template support','1','0','0','0','en');
INSERT INTO met_language VALUES('3699','update','update','1','0','0','0','en');
INSERT INTO met_language VALUES('3700','onlyInStyle3','Effective only in Style 3','1','0','0','0','en');
INSERT INTO met_language VALUES('3701','thumb_tips','(Wide X Height) (Pixel) The default thumbnail size of the module. The thumbnail size of each column can be set independently in visual editing.','1','0','0','0','en');
INSERT INTO met_language VALUES('3702','freeapp','Free plugin','1','0','0','0','en');
INSERT INTO met_language VALUES('3703','businessapp','Commercial plugin','1','0','0','0','en');
INSERT INTO met_language VALUES('3704','chargeapp','Charge plugin','1','0','0','0','en');
INSERT INTO met_language VALUES('3705','userCondition','Register for the MetInfo User Center for free download and use','1','0','0','0','en');
INSERT INTO met_language VALUES('3706','installCondition','Buy the commercial version of the MetInfo Enterprise Website System and install it under the binding domain name site.','1','0','0','0','en');
INSERT INTO met_language VALUES('3707','buyCondition','Can be installed and used under a binding domain name site after purchase.','1','0','0','0','en');
INSERT INTO met_language VALUES('3708','thumb_size_list','List page thumbnail size','1','440','0','0','en');
INSERT INTO met_language VALUES('3709','thumb_size_showpage','Details page thumbnail size','1','440','0','0','en');
INSERT INTO met_language VALUES('3710','thumb_seting_tips','Details page thumbnail size and tabs should be set in Visual Editing Current Page Settings for corresponding columns','1','440','0','0','en');
INSERT INTO met_language VALUES('3711','top_menu','Top menu','1','0','0','0','en');
INSERT INTO met_language VALUES('3712','admin_name_repeat',' Administrator name cannot be repeated','1','0','0','0','en');
INSERT INTO met_language VALUES('3713','settings_tab','Settings tab','1','0','0','0','en');
INSERT INTO met_language VALUES('3714','custom_info','Custom information','1','0','0','0','en');
INSERT INTO met_language VALUES('3715','admin_content_list1','Click on the blank part of each row of the table to drag up and down and save to change the sort.','1','0','0','0','en');
INSERT INTO met_language VALUES('3716','module_reply1','Separate multiple numbers by |','1','0','0','0','en');
INSERT INTO met_language VALUES('3717','module_reply2','To reply to the SMS content, you need to submit the content template review on the SMS function providing platform, and the verification will be successful before it can be sent.','1','0','0','0','en');
INSERT INTO met_language VALUES('3718','online_list1','Number/link/picture','1','0','0','0','en');
INSERT INTO met_language VALUES('3719','choice_style','choice of style','1','0','0','0','en');
INSERT INTO met_language VALUES('3720','reading_authority','Reading authority','1','0','0','0','en');
INSERT INTO met_language VALUES('3721','empty_not_modified','If it is empty, it will not be modified','1','0','0','0','en');
INSERT INTO met_language VALUES('3722','button','Button','1','0','0','0','en');
INSERT INTO met_language VALUES('3723','fliptext1','see more','1','0','0','0','en');
INSERT INTO met_language VALUES('3724','being_imported','Being imported, please do not operate.','1','0','0','0','en');
INSERT INTO met_language VALUES('3725','least_one_item','Please select at least one item','1','0','0','0','en');
INSERT INTO met_language VALUES('3726','feedfback','Feedback','1','0','0','0','en');
INSERT INTO met_language VALUES('3727','message','Message','1','0','0','0','en');
INSERT INTO met_language VALUES('3728','job','Recruitment','1','0','0','0','en');
INSERT INTO met_language VALUES('3729','product','Product','1','0','0','0','en');
INSERT INTO met_language VALUES('3730','saving','Save, please wait...','1','0','0','0','en');
INSERT INTO met_language VALUES('3731','no_data','No data','1','0','0','0','en');
INSERT INTO met_language VALUES('3732','numbering','Numbering','1','0','0','0','en');
INSERT INTO met_language VALUES('3733','successful_syn','Successful synchronization','1','0','0','0','en');
INSERT INTO met_language VALUES('3734','failed_syn','Synchronization failed','1','0','0','0','en');
INSERT INTO met_language VALUES('3735','being_synced','Being synced, please be patient.','1','0','0','0','en');
INSERT INTO met_language VALUES('3736','national_flag','National flag','1','0','0','0','en');
INSERT INTO met_language VALUES('3737','national_flag_tips1','Custom flag gif images can be placed in the public/images/flag/ folder of the website.','1','0','0','0','en');
INSERT INTO met_language VALUES('3738','manage_tips1','Click to collapse/expand the list of columns','1','0','0','0','en');
INSERT INTO met_language VALUES('3739','set_default_section','Set default section','1','0','0','0','en');
INSERT INTO met_language VALUES('3740','enter_user_name','please enter user name','1','0','0','0','en');
INSERT INTO met_language VALUES('3741','system_plugin_uninstall','System plugin, unable to uninstall','1','0','0','0','en');
INSERT INTO met_language VALUES('3742','install_first','Please install first!','1','0','0','0','en');
INSERT INTO met_language VALUES('3743','upgrade','In the upgrade, please wait...','1','0','0','0','en');
INSERT INTO met_language VALUES('3744','file_download_failed','File download failed','1','0','0','0','en');
INSERT INTO met_language VALUES('3745','column_search','Column search','1','0','0','0','en');
INSERT INTO met_language VALUES('3746','advanced_search','Advanced Search','1','0','0','0','en');
INSERT INTO met_language VALUES('3747','replacement_text','Replacement text cannot be empty','1','0','0','0','en');
INSERT INTO met_language VALUES('3748','ing','ing','1','0','0','0','en');
INSERT INTO met_language VALUES('3749','static_page_success','Static page generation completed','1','0','0','0','en');
INSERT INTO met_language VALUES('3750','successful_conversion','The conversion was successful!','1','0','0','0','en');
INSERT INTO met_language VALUES('3751','full_site','Full Site','1','0','0','0','en');
INSERT INTO met_language VALUES('3752','default','default','1','0','0','0','en');
INSERT INTO met_language VALUES('3753','valid_phone_number','Please enter a valid phone number','1','0','0','0','en');
INSERT INTO met_language VALUES('3754','valid_email_address','Please enter a valid email address','1','0','0','0','en');
INSERT INTO met_language VALUES('3755','button_text','Button text','1','0','0','0','en');
INSERT INTO met_language VALUES('3756','open_mode','Open mode','1','0','0','0','en');
INSERT INTO met_language VALUES('3757','button_size','Button size','1','0','0','0','en');
INSERT INTO met_language VALUES('3758','button_color','Button color','1','0','0','0','en');
INSERT INTO met_language VALUES('3759','mouse_over_button_color','Mouse over button color','1','0','0','0','en');
INSERT INTO met_language VALUES('3760','font_size','font size','1','0','0','0','en');
INSERT INTO met_language VALUES('3761','mouse_over_text_color','Mouse over text color','1','0','0','0','en');
INSERT INTO met_language VALUES('3762','display_client','Display client','1','0','0','0','en');
INSERT INTO met_language VALUES('3763','new_window','New window','1','0','0','0','en');
INSERT INTO met_language VALUES('3764','original_window','Original window','1','0','0','0','en');
INSERT INTO met_language VALUES('3765','mobile_terminal','Mobile terminal','1','0','0','0','en');
INSERT INTO met_language VALUES('3766','image_title_font_size','Image title font size','1','0','0','0','en');
INSERT INTO met_language VALUES('3767','image_description_font_size','Image description font size','1','0','0','0','en');
INSERT INTO met_language VALUES('3768','mobile_terminal_settings','Mobile phone settings','1','0','0','0','en');
INSERT INTO met_language VALUES('3769','mobile_phone_picture_title','Mobile image title','1','0','0','0','en');
INSERT INTO met_language VALUES('3770','banner_edit1','If you do not fill in the settings, keep consistent with the computer','1','0','0','0','en');
INSERT INTO met_language VALUES('3771','banner_edit2','Mobile phone picture title color:','1','0','0','0','en');
INSERT INTO met_language VALUES('3772','banner_edit3','Mobile phone image title font size','1','0','0','0','en');
INSERT INTO met_language VALUES('3773','banner_edit5','Mobile phone picture description','1','0','0','0','en');
INSERT INTO met_language VALUES('3774','banner_edit6','Mobile phone picture description color','1','0','0','0','en');
INSERT INTO met_language VALUES('3775','banner_edit7','Mobile phone image description font size','1','0','0','0','en');
INSERT INTO met_language VALUES('3776','banner_edit8','Mobile phone image text position','1','0','0','0','en');
INSERT INTO met_language VALUES('3777','feedbackTip5','Export the currently selected information','1','0','0','0','en');
INSERT INTO met_language VALUES('3778','setimgLeftMid','Left middle','1','0','0','0','en');
INSERT INTO met_language VALUES('3779','function_ency1','Only the traditional background functions are listed here. For more setting functions, please edit the columns and pages in the visual editing background.','1','0','0','0','en');
INSERT INTO met_language VALUES('3780','environmental_test','environmental test','1','0','0','0','en');
INSERT INTO met_language VALUES('3781','function_ency2','Please add the corresponding module column in \"Column Management\" and then manage it in the corresponding function menu.','1','0','0','0','en');
INSERT INTO met_language VALUES('3782','sms_function','SMS function','1','0','0','0','en');
INSERT INTO met_language VALUES('3783','website_overview','Website overview','1','0','0','0','en');
INSERT INTO met_language VALUES('3784','system_cache','System cache','1','0','0','0','en');
INSERT INTO met_language VALUES('3785','help_manual','Help manual','1','0','0','0','en');
INSERT INTO met_language VALUES('3786','online_quiz','Online quiz','1','0','0','0','en');
INSERT INTO met_language VALUES('3787','online_work_order','Online work order','1','0','0','0','en');
INSERT INTO met_language VALUES('3788','clear_sys_cache','Clear system cache','1','0','0','0','en');
INSERT INTO met_language VALUES('3789','clear_thumbnail','Clear thumbnail','1','0','0','0','en');
INSERT INTO met_language VALUES('3790','admin_job1','Need to add a resume to the job management position','1','0','0','0','en');
INSERT INTO met_language VALUES('3791','admin_manage1','Click on the left column list to manage content','1','0','0','0','en');
INSERT INTO met_language VALUES('3792','admin_menu1','This feature requires template support. Some templates come with a mobile phone menu at the bottom. Please set it in the visual interface.','1','0','0','0','en');
INSERT INTO met_language VALUES('3793','search_range','Search range','1','0','0','0','en');
INSERT INTO met_language VALUES('3794','search_weight','Module sequencing','1','0','0','0','en');
INSERT INTO met_language VALUES('3795','search_weight_tips','Drag left and right to adjust the module sorting. The global search results will be displayed according to the order of modules','1','0','0','0','en');
INSERT INTO met_language VALUES('3796','admin_search1','Specify a level column','1','0','0','0','en');
INSERT INTO met_language VALUES('3797','admin_search2','Whether to open the search method','1','0','0','0','en');
INSERT INTO met_language VALUES('3798','admin_search3','Whether to link','1','0','0','0','en');
INSERT INTO met_language VALUES('3799','admin_search4','Search box default content','1','0','0','0','en');
INSERT INTO met_language VALUES('3800','admin_search5','Current level 1 column','1','0','0','0','en');
INSERT INTO met_language VALUES('3801','admin_search6','Search method','1','0','0','0','en');
INSERT INTO met_language VALUES('3802','admin_search7','Title and content','1','0','0','0','en');
INSERT INTO met_language VALUES('3803','by_module','By module','1','0','0','0','en');
INSERT INTO met_language VALUES('3804','by_column','By column','1','0','0','0','en');
INSERT INTO met_language VALUES('3805','admin_seo1','Index-language identifier.html (eg index-cn.html)','1','0','0','0','en');
INSERT INTO met_language VALUES('3806','admin_seo2','Directory name /list - static page name or ID - language identifier .html (eg product/list-1-cn.html)','1','0','0','0','en');
INSERT INTO met_language VALUES('3807','admin_seo3','Directory name /list - static page name or ID - language identifier .html (eg product/list-1-cn.html)','1','0','0','0','en');
INSERT INTO met_language VALUES('3808','admin_tag_setting1','TAG settings','1','0','0','0','en');
INSERT INTO met_language VALUES('3809','admin_tag_setting2','TAG generation rule','1','0','0','0','en');
INSERT INTO met_language VALUES('3810','admin_tag_setting3','By level 1','1','0','0','0','en');
INSERT INTO met_language VALUES('3811','admin_tag_setting4','TAG Label Aggregation Rules','1','0','0','0','en');
INSERT INTO met_language VALUES('3812','admin_tag_setting5','Set the same tag content','1','0','0','0','en');
INSERT INTO met_language VALUES('3813','admin_tag_setting6','Content details page aggregation number','1','0','0','0','en');
INSERT INTO met_language VALUES('3814','admin_tag_setting7','Use the system default if you don\'t fill it out','1','0','0','0','en');
INSERT INTO met_language VALUES('3815','admin_tag_setting8','Please add the column of setting \"tag tag\" module in column management first, and the front access address is','1','0','0','0','en');
INSERT INTO met_language VALUES('3816','add_tag','add tag','1','0','0','0','en');
INSERT INTO met_language VALUES('3817','tag_name','Label name','1','0','0','0','en');
INSERT INTO met_language VALUES('3818','add_manully','add manully','1','0','0','0','en');
INSERT INTO met_language VALUES('3819','aggregation_range','Aggregation range','1','0','0','0','en');
INSERT INTO met_language VALUES('3820','admin_tag_setting9','Label name format is incorrect','1','0','0','0','en');
INSERT INTO met_language VALUES('3821','admin_tag_setting10','Static page name format is incorrect','1','0','0','0','en');
INSERT INTO met_language VALUES('3822','system_check1','Check if your server supports all the features of the system.','1','0','0','0','en');
INSERT INTO met_language VALUES('3823','system_check2','Environment/function test result','1','0','0','0','en');
INSERT INTO met_language VALUES('3824','system_check3','File and directory permissions','1','0','0','0','en');
INSERT INTO met_language VALUES('3825','system_check4','To be able to use the system\'s cache, pseudo-static, and upload files functions properly, you need to set the following files/directories to \"writable\". Below is a list of directories that need to be set to \"writable\" and the suggested CHMOD settings.','1','0','0','0','en');
INSERT INTO met_language VALUES('3826','system_check5','Some hosts do not allow you to set CHMOD 777, you need to use 666. Try the highest value first, if not, then gradually reduce the value.','1','0','0','0','en');
INSERT INTO met_language VALUES('3827','visualization1','Long press the place you want to modify to trigger the modification function','1','0','0','0','en');
INSERT INTO met_language VALUES('3828','stand_by','stand by','1','0','0','0','en');
INSERT INTO met_language VALUES('3829','close_this_time','Close this time','1','0','0','0','en');
INSERT INTO met_language VALUES('3830','Submit','submit','1','0','0','0','en');
INSERT INTO met_language VALUES('3831','rename_admin_dir','The current system environment does not support modifying the background folder name. Please modify it manually.','1','0','0','0','en');
INSERT INTO met_language VALUES('3832','notemptips','There is no website template in the current language. Please go to Style-Website Template and select a set of templates.','1','0','0','0','en');
INSERT INTO met_language VALUES('3833','short_message','short message','1','0','0','0','en');
INSERT INTO met_language VALUES('3834','common_qq','common qq','1','0','0','0','en');
INSERT INTO met_language VALUES('3835','enterprise_qq','enterprise qq','1','0','0','0','en');
INSERT INTO met_language VALUES('3836','back_folder_list','back folder list','1','0','0','0','en');
INSERT INTO met_language VALUES('3837','back_icon_iibrary_list','back icon iibrary list','1','0','0','0','en');
INSERT INTO met_language VALUES('3838','choose_icon_tips','Click on the selected icon and save it','1','0','0','0','en');
INSERT INTO met_language VALUES('3839','jump_to_no','Jump to No','1','0','0','0','en');
INSERT INTO met_language VALUES('3840','page','page','1','0','0','0','en');
INSERT INTO met_language VALUES('3841','goto','goto','1','0','0','0','en');
INSERT INTO met_language VALUES('3842','save_image_to_website','save image to website','1','0','0','0','en');
INSERT INTO met_language VALUES('3843','save_allimages_to_website','save all images to website','1','0','0','0','en');
INSERT INTO met_language VALUES('3844','block_style','block style','1','0','0','0','en');
INSERT INTO met_language VALUES('3845','change','change','1','0','0','0','en');
INSERT INTO met_language VALUES('3846','change_blockstyle_tips','After selecting the style, please click the [change] button.','1','0','0','0','en');
INSERT INTO met_language VALUES('3847','installing','Do not operate during installation.','1','0','0','0','en');
INSERT INTO met_language VALUES('3848','databacking','Do not operate during backup.','1','0','0','0','en');
INSERT INTO met_language VALUES('3849','already_update_package','Manual upgrade package exists','1','0','0','0','en');
INSERT INTO met_language VALUES('3850','edit_authority','Edit authority','1','0','0','0','en');
INSERT INTO met_language VALUES('3851','editable','Editable','1','0','0','0','en');
INSERT INTO met_language VALUES('3852','non_editable','Non editable','1','0','0','0','en');
INSERT INTO met_language VALUES('3853','cv_export','CV export','1','0','0','0','en');
INSERT INTO met_language VALUES('3854','access_type','Display mode of reading authority','1','0','0','0','en');
INSERT INTO met_language VALUES('3855','access_type1','No permission information is displayed at the front desk. Click read to judge the permission.','1','0','0','0','en');
INSERT INTO met_language VALUES('3856','access_type2','No permission information is displayed in the foreground','1','0','0','0','en');
INSERT INTO met_language VALUES('3857','database_switch','Database switching','1','0','0','0','en');
INSERT INTO met_language VALUES('3858','database_switch_tips','Please do not frequently switch the database type during the use of the website. Some applications do not support the sqlite database. It is recommended to use a more stable and efficient mysql database.','1','0','0','0','en');
INSERT INTO met_language VALUES('3859','database_switch_tips1','Please configure MySQL database parameters. For database information, please contact your server provider.','1','0','0','0','en');
INSERT INTO met_language VALUES('3860','database_switch_tips2','For example: met, please do not leave blank and use \"\" to end','1','0','0','0','en');
INSERT INTO met_language VALUES('3861','database_switch_tips3','Generally, no change is required. Refer to MySQL control panel of host or server.','1','0','0','0','en');
INSERT INTO met_language VALUES('3862','database_switch_tips4','For example, \"met\" or \"my met\", make sure to start with a letter','1','0','0','0','en');
INSERT INTO met_language VALUES('3863','database_type','Database type','1','0','0','0','en');
INSERT INTO met_language VALUES('3864','table_prefix','Table Prefix','1','0','0','0','en');
INSERT INTO met_language VALUES('3865','database_address','Database connection address','1','0','0','0','en');
INSERT INTO met_language VALUES('3866','database_name','Database name','1','0','0','0','en');
INSERT INTO met_language VALUES('3867','database_user','Database user name','1','0','0','0','en');
INSERT INTO met_language VALUES('3868','database_password','Database password','1','0','0','0','en');
INSERT INTO met_language VALUES('3869','read_protocol','Please read the following agreement carefully','1','0','0','0','en');
INSERT INTO met_language VALUES('3870','disagree','Disagree','1','0','0','0','en');
INSERT INTO met_language VALUES('3871','agree','Agree','1','0','0','0','en');
INSERT INTO met_language VALUES('3872','copyright_nofollow','Foreground copyright link nofollow property','1','0','0','0','en');
INSERT INTO met_language VALUES('3873','copyright_nofollow_description','After opening, the copyright link at the bottom of the foreground will add the nofollow attribute','1','0','0','0','en');
INSERT INTO met_language VALUES('3874','close_allchildcolumn_v6','Hide all sub columns','1','0','0','0','en');
INSERT INTO met_language VALUES('3875','emailhave','Mailbox is bound','1','0','0','0','en');
INSERT INTO met_language VALUES('3876','telhave','Mobile number is bound','1','0','0','0','en');
INSERT INTO met_language VALUES('3877','noupdate','No updates available','1','0','0','0','en');
INSERT INTO met_language VALUES('3878','delete_all_saveimgbtn','Delete all save pictures button','1','0','0','0','en');
INSERT INTO met_language VALUES('3879','fdinc_msg_content','The default reply content of the front desk message list will call this setting','1','0','0','0','en');
INSERT INTO met_language VALUES('3880','third_party_error','Non default language cannot enable social login function','1','0','0','0','en');
INSERT INTO met_language VALUES('3881','show_video','Show video','1','0','0','0','en');
INSERT INTO met_language VALUES('3882','show_video_tips','Only one video can be added. Please do not add text here. After adding the video, the front desk will display a play button like Taobao on the display picture. Click the button to play the video','1','0','0','0','en');
INSERT INTO met_language VALUES('3883','copyright_type','System copyright text style','1','0','0','0','en');
INSERT INTO met_language VALUES('3884','copyright_type_tips1','Please observe','1','0','0','0','en');
INSERT INTO met_language VALUES('3885','copyright_type_tips2','License agreement for end user of Mituo enterprise station building system','1','0','0','0','en');
INSERT INTO met_language VALUES('3886','copyright_type_tips3','To modify or remove the official copyright logo, please purchase','1','0','0','0','en');
INSERT INTO met_language VALUES('3887','copyright_type_tips4','Copyright mark modification license','1','0','0','0','en');
INSERT INTO met_language VALUES('3888','video_switch','Product module video playback control','1','0','0','0','en');
INSERT INTO met_language VALUES('3889','auto_play_tips','Auto play is not supported for videos added through the chain (according to browser rules, auto play is muted by default)','1','0','0','0','en');
INSERT INTO met_language VALUES('3890','auto_play_pc','Automatic play on PC','1','0','0','0','en');
INSERT INTO met_language VALUES('3891','auto_play_mobile','Auto play on mobile','1','0','0','0','en');
INSERT INTO met_language VALUES('3892','auto_play_tips1','If off, the AutoPlay setting is invalid','1','0','0','0','en');
INSERT INTO met_language VALUES('3893','relation_data','Relation data','1','0','0','0','en');
INSERT INTO met_language VALUES('3894','relation_data_add','Add relation data','1','0','0','0','en');
INSERT INTO met_language VALUES('3895','relation_add','Add associations','1','0','0','0','en');
INSERT INTO met_language VALUES('3896','relation_cancel','Disassociate','1','0','0','0','en');
INSERT INTO met_language VALUES('3897','relation_checked','Associated','1','0','0','0','en');
INSERT INTO met_language VALUES('3898','relation_tips','Template support is required to display this content','1','0','0','0','en');
INSERT INTO met_language VALUES('3899','auto_close','Automatically close after playing','1','0','0','0','en');
INSERT INTO met_language VALUES('3900','auto_show','Show video by default','1','0','0','0','en');
INSERT INTO met_language VALUES('3901','open_wechat','open Wechat ','1','0','0','0','en');
INSERT INTO met_language VALUES('3902','info_security_statement_tips2','The text is displayed in the highlighted color by default. If there is a book name \"《 》\" in the text, only the book name and its containing text are displayed in the highlighted color','1','0','0','0','en');
INSERT INTO met_language VALUES('3903','myfiles','File management','1','0','0','0','en');
INSERT INTO met_language VALUES('3904','history','History','1','0','0','0','en');
INSERT INTO met_language VALUES('3905','history_details','History Details','1','0','0','0','en');
INSERT INTO met_language VALUES('3906','history_restore','Restore History','1','0','0','0','en');
INSERT INTO met_language VALUES('3907','save_as_draft','Save as draft','1','0','0','0','en');
INSERT INTO met_language VALUES('3908','publish','Publish','1','0','0','0','en');
INSERT INTO met_language VALUES('3909','publish_tips','Publish this content now?','1','0','0','0','en');
INSERT INTO met_language VALUES('3910','permission_member','member','1','0','0','0','en');
INSERT INTO met_language VALUES('3911','permission_new_member','New member','1','0','0','0','en');
INSERT INTO met_language VALUES('3912','permission_role','role','1','0','0','0','en');
INSERT INTO met_language VALUES('3913','permission_new_role','New role','1','0','0','0','en');
INSERT INTO met_language VALUES('3914','permission_role_name','name','1','0','0','0','en');
INSERT INTO met_language VALUES('3915','permission_role_desc','description','1','0','0','0','en');
INSERT INTO met_language VALUES('3916','permission_role_access','Access','1','0','0','0','en');
INSERT INTO met_language VALUES('3917','permission_left_menus','Left Bar Menu','1','0','0','0','en');
INSERT INTO met_language VALUES('3918','permission_top_menus','Top bar menu','1','0','0','0','en');
INSERT INTO met_language VALUES('3919','permission_ui_set_menus','Visual top bar menu','1','0','0','0','en');
INSERT INTO met_language VALUES('3920','permission_apps','Apps','1','0','0','0','en');
INSERT INTO met_language VALUES('3921','permission_columns','Columns','1','0','0','0','en');
INSERT INTO met_language VALUES('3922','permission_actions','Actions','1','0','0','0','en');
INSERT INTO met_language VALUES('3923','permission_menus','Menus','1','0','0','0','en');
INSERT INTO met_language VALUES('3924','permission_sys','System funcs','1','0','0','0','en');
INSERT INTO met_language VALUES('3925','permission_web_lang','Sites','1','0','0','0','en');
INSERT INTO met_language VALUES('3926','permissions_lang_content_manage','Content','1','0','0','0','en');
INSERT INTO met_language VALUES('3927','permissions_lang_column_manage','Column','1','0','0','0','en');
INSERT INTO met_language VALUES('3928','permissions_lang_feedback_interaction','Feedback','1','0','0','0','en');
INSERT INTO met_language VALUES('3929','permissions_lang_seo_settings','SEO settings','1','0','0','0','en');
INSERT INTO met_language VALUES('3930','permissions_lang_site_template','Templates','1','0','0','0','en');
INSERT INTO met_language VALUES('3931','permissions_lang_application','Apps','1','0','0','0','en');
INSERT INTO met_language VALUES('3932','permissions_lang_user_manage','Users','1','0','0','0','en');
INSERT INTO met_language VALUES('3933','permissions_lang_security_setting','Security','1','0','0','0','en');
INSERT INTO met_language VALUES('3934','permissions_lang_multilingual','Multilingual','1','0','0','0','en');
INSERT INTO met_language VALUES('3935','permissions_lang_basic_settings','Basic Settings','1','0','0','0','en');
INSERT INTO met_language VALUES('3936','permissions_lang_enterprise_market','Platforms','1','0','0','0','en');
INSERT INTO met_language VALUES('3937','permissions_lang_feedback_system','Feedback system','1','0','0','0','en');
INSERT INTO met_language VALUES('3938','permissions_lang_message_system','Message system','1','0','0','0','en');
INSERT INTO met_language VALUES('3939','permissions_lang_recruitment_system','Recruitment system','1','0','0','0','en');
INSERT INTO met_language VALUES('3940','permissions_lang_online_settings','Customer service settings','1','0','0','0','en');
INSERT INTO met_language VALUES('3941','permissions_lang_members','Members','1','0','0','0','en');
INSERT INTO met_language VALUES('3942','permissions_lang_admins','Administrators','1','0','0','0','en');
INSERT INTO met_language VALUES('3943','permissions_lang_safety_efficiency','Safety and efficiency','1','0','0','0','en');
INSERT INTO met_language VALUES('3944','permissions_lang_backup_Recovery','Backup and Recovery','1','0','0','0','en');
INSERT INTO met_language VALUES('3945','permissions_lang_basic_info','Basic info','1','0','0','0','en');
INSERT INTO met_language VALUES('3946','permissions_lang_watermark','Watermark','1','0','0','0','en');
INSERT INTO met_language VALUES('3947','permissions_lang_banner_manage','Banners','1','0','0','0','en');
INSERT INTO met_language VALUES('3948','permissions_lang_mobile_menus','Mobile Menus','1','0','0','0','en');
INSERT INTO met_language VALUES('3949','permissions_lang_app_install','Install apps','1','0','0','0','en');
INSERT INTO met_language VALUES('3950','permissions_lang_app_uninstall','Uninstall apps','1','0','0','0','en');
INSERT INTO met_language VALUES('3951','permissions_lang_add','Add Content','1','0','0','0','en');
INSERT INTO met_language VALUES('3952','permissions_lang_edit','Edit Content','1','0','0','0','en');
INSERT INTO met_language VALUES('3953','permissions_lang_delete','Delete Content','1','0','0','0','en');
INSERT INTO met_language VALUES('3954','permissions_lang_column_add','Add columns','1','0','0','0','en');
INSERT INTO met_language VALUES('3955','permissions_lang_column_edit','Edit column','1','0','0','0','en');
INSERT INTO met_language VALUES('3956','permissions_lang_column_del','Delete columns','1','0','0','0','en');
INSERT INTO met_language VALUES('3957','permissions_lang_admin_pop','Visual','1','0','0','0','en');

DROP TABLE IF EXISTS met_link;
CREATE TABLE `met_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `webname` varchar(255) DEFAULT '',
  `module` text,
  `weburl` varchar(255) DEFAULT '',
  `weblogo` varchar(255) DEFAULT '',
  `link_type` int(11) DEFAULT '0',
  `info` varchar(255) DEFAULT '',
  `contact` varchar(255) DEFAULT '',
  `orderno` int(11) DEFAULT '0',
  `com_ok` int(11) DEFAULT '0',
  `show_ok` int(11) DEFAULT '0',
  `addtime` datetime DEFAULT NULL,
  `lang` varchar(50) DEFAULT '',
  `ip` varchar(255) DEFAULT '',
  `nofollow` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO met_link VALUES('1','米拓建站',',10001,','https://www.mituo.cn/','','0','米拓建站','','1','0','1','2021-09-14 09:38:37','cn','','0');
INSERT INTO met_link VALUES('2','网站模板',',10001,','https://www.metinfo.cn/','','0','网站模板','','0','0','1','2019-08-02 18:32:54','cn','','0');
INSERT INTO met_link VALUES('3','Mituo',',10001,','https://www.mituo.cn/','','0','Mituo','','1','0','1','2021-09-14 09:38:37','en','','0');
INSERT INTO met_link VALUES('4','MetInfo',',10001,','https://www.metinfo.cn/','','0','MetInfo','','0','0','1','2019-08-02 18:32:54','en','','0');

DROP TABLE IF EXISTS met_menu;
CREATE TABLE `met_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT '',
  `url` varchar(255) DEFAULT '',
  `icon` varchar(255) DEFAULT '',
  `type` int(11) DEFAULT '0',
  `text_color` varchar(100) DEFAULT '',
  `but_color` varchar(100) DEFAULT '',
  `target` int(11) DEFAULT '0',
  `enabled` int(11) DEFAULT '1',
  `no_order` int(11) DEFAULT '0',
  `lang` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

INSERT INTO met_menu VALUES('1','首页','https://www.mituo.cn/','icon fa-home','0','#ffffff','#298dff','0','1','0','cn');
INSERT INTO met_menu VALUES('2','产品','https://www.mituo.cn/product/','icon fa-product-hunt','0','#ffffff','#298dff','0','1','1','cn');
INSERT INTO met_menu VALUES('3','新闻','https://www.mituo.cn/news/','icon fa-th-large','0','#ffffff','#298dff','0','1','2','cn');
INSERT INTO met_menu VALUES('4','联系','https://www.mituo.cn/about/contact.html','icon fa-address-book-o','0','#ffffff','#298dff','0','1','3','cn');
INSERT INTO met_menu VALUES('5','Home','https://www.mituo.cn/','icon fa-home','0','#ffffff','#298dff','0','1','0','en');
INSERT INTO met_menu VALUES('6','Product','https://www.mituo.cn/product/','icon fa-product-hunt','0','#ffffff','#298dff','0','1','1','en');
INSERT INTO met_menu VALUES('7','News','https://www.mituo.cn/news/','icon fa-th-large','0','#ffffff','#298dff','0','1','2','en');
INSERT INTO met_menu VALUES('8','Contact','https://www.mituo.cn/about/contact.html','icon fa-address-book-o','0','#ffffff','#298dff','0','1','3','en');

DROP TABLE IF EXISTS met_message;
CREATE TABLE `met_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(255) DEFAULT '',
  `addtime` datetime DEFAULT NULL,
  `readok` int(11) DEFAULT '0',
  `useinfo` text,
  `lang` varchar(50) DEFAULT '',
  `access` text,
  `customerid` varchar(30) DEFAULT '0',
  `checkok` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

INSERT INTO met_message VALUES('9','127.0.0.1','2021-09-14 11:07:09','1','请登录我们的官网www.mituo.cn选择你喜欢的模板，购买后你可以直接下载源代码或一键安装','cn','0','','1');
INSERT INTO met_message VALUES('6','::1','2018-01-18 22:32:46','1','免费使用 MetInfo 在未经授权前，请务必保留底部 Powered by MetInfo 字样版权及链接，后台版权及链接，否则我们将追究法律责任。','cn','0','','1');
INSERT INTO met_message VALUES('7','127.0.0.1','2021-09-14 11:03:51','1','Please visit our official website www.mituo.cn to choose your favorite template. After purchase, you can download the source code directly or install it with one click.','en','0','','1');

DROP TABLE IF EXISTS met_mlist;
CREATE TABLE `met_mlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `listid` int(11) DEFAULT '0',
  `paraid` int(11) DEFAULT '0',
  `info` text,
  `lang` varchar(50) DEFAULT '',
  `imgname` varchar(255) DEFAULT '',
  `module` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

INSERT INTO met_mlist VALUES('42','9','140','如何购买7.5可视化编辑模板?','cn','留言内容','7');
INSERT INTO met_mlist VALUES('41','9','139','','cn','联系地址','7');
INSERT INTO met_mlist VALUES('40','9','138','111','cn','联系电话','7');
INSERT INTO met_mlist VALUES('39','9','186','email@e.mt','cn','Email','7');
INSERT INTO met_mlist VALUES('38','9','137','张三','cn','姓名','7');
INSERT INTO met_mlist VALUES('22','6','137','李四','cn','姓名','7');
INSERT INTO met_mlist VALUES('23','6','186','buy@test.com','cn','Email','7');
INSERT INTO met_mlist VALUES('24','6','138','18888888888','cn','联系电话','7');
INSERT INTO met_mlist VALUES('25','6','139','','cn','联系地址','7');
INSERT INTO met_mlist VALUES('26','6','140','MetInfo可以免费使用吗？免费版和收费版有什么区别？','cn','留言内容','7');
INSERT INTO met_mlist VALUES('43','9','0','','cn','','7');
INSERT INTO met_mlist VALUES('44','6','0','','cn','','7');
INSERT INTO met_mlist VALUES('28','7','227','','en','E-mail<m met-id=227 met-table=parameter met-field=name></m>','7');
INSERT INTO met_mlist VALUES('27','7','226','LIsa','en','Name<m met-id=226 met-table=parameter met-field=name></m>','7');
INSERT INTO met_mlist VALUES('29','7','228','111','en','Tel<m met-id=228 met-table=parameter met-field=name></m>','7');
INSERT INTO met_mlist VALUES('30','7','229','','en','Add<m met-id=229 met-table=parameter met-field=name></m>','7');
INSERT INTO met_mlist VALUES('31','7','230','How do I purchase a 7.5 Visual Editing Template','en','Message content<m met-id=230 met-table=parameter met-field=name></m>','7');
INSERT INTO met_mlist VALUES('32','7','0','','en','','7');

DROP TABLE IF EXISTS met_news;
CREATE TABLE `met_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT '',
  `ctitle` varchar(200) DEFAULT '',
  `keywords` varchar(200) DEFAULT '',
  `description` text,
  `content` longtext,
  `class1` int(11) DEFAULT '0',
  `class2` int(11) DEFAULT '0',
  `class3` int(11) DEFAULT '0',
  `no_order` int(11) DEFAULT '0',
  `wap_ok` int(1) DEFAULT '0',
  `img_ok` int(1) DEFAULT '0',
  `imgurl` varchar(255) DEFAULT '',
  `imgurls` varchar(255) DEFAULT '',
  `com_ok` int(1) DEFAULT '0',
  `issue` varchar(100) DEFAULT '',
  `hits` int(11) DEFAULT '0',
  `updatetime` datetime DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `access` text,
  `top_ok` int(1) DEFAULT '0',
  `filename` varchar(255) DEFAULT '',
  `lang` varchar(50) DEFAULT '',
  `recycle` int(11) DEFAULT '0',
  `displaytype` int(11) DEFAULT '1',
  `tag` text,
  `links` varchar(200) DEFAULT '',
  `publisher` varchar(50) DEFAULT '',
  `text_size` int(11) DEFAULT '0',
  `text_color` varchar(100) DEFAULT '',
  `other_info` text,
  `custom_info` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

INSERT INTO met_news VALUES('37','首战告捷，高端智能音箱梦','','','音响作为生活中电子发声设备的必备品，特别是现在的智能家居用的智能音箱，通过语音就可以实现家中任一电器的开关，无疑是很方便的','<p><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\"></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\"></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p>','128','141','0','0','0','0','','','0','admin','0','2021-09-14 17:23:09','2021-09-13 18:11:46','0','0','','cn','0','1','','','MetInfo','0','','','');
INSERT INTO met_news VALUES('28','智能音箱防水检测与音响气密性测试应用','','','通过语音就可以实现家中任一电器的开关，无疑是很方便的，就比如说控制灯、窗帘、扫地机等设备。现在的音箱门类多种多样，各有侧重点，在现在的消费者对于产品要求越来越高的情况下，有一些音箱开始注重起了产品的防水性能','<p><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\"></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\"></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p>','128','142','0','0','0','0','','','0','admin','0','2021-09-13 18:10:14','2021-09-13 18:09:08','0','0','','cn','0','1','','','MetInfo','0','','','');
INSERT INTO met_news VALUES('27','摄像头如何连WiFi配置“终极问题解决方法”','','','有一些音箱开始注重起了产品的防水性能，特别是在户外使用的音箱，如果音箱没有做防水密封处理，那么内部的喇叭和电子元器件就很容易受到外部灰尘和湿气的影响','<p><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\"></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\"></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p>','128','142','0','0','0','0','','','0','admin','0','2021-09-13 18:11:07','2021-09-13 18:09:08','0','0','','cn','0','1','','','MetInfo','0','','','');
INSERT INTO met_news VALUES('26','耳机及智能音箱行业高速发展','','','控制灯、窗帘、扫地机等设备，现在的音箱门类多种多样，各有侧重点，在现在的消费者对于产品要求越来越高的情况下，有一些音箱开始注重起了产品的防水性能','<p><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\"></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\"></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p>','128','142','0','0','0','0','','','0','admin','0','2021-09-13 18:10:50','2021-09-13 18:09:02','0','0','','cn','0','1','','','MetInfo','0','','','');
INSERT INTO met_news VALUES('25','首战告捷，高端智能音箱梦','','','音响作为生活中电子发声设备的必备品，特别是现在的智能家居用的智能音箱，通过语音就可以实现家中任一电器的开关，无疑是很方便的','<p><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\"></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\"></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p>','128','142','0','0','0','0','','','0','admin','0','2021-09-13 18:11:40','2021-09-13 17:59:19','0','0','','cn','0','1','','','MetInfo','0','','','');
INSERT INTO met_news VALUES('38','摄像头如何连WiFi配置“终极问题解决方法”','','','有一些音箱开始注重起了产品的防水性能，特别是在户外使用的音箱，如果音箱没有做防水密封处理，那么内部的喇叭和电子元器件就很容易受到外部灰尘和湿气的影响','<p><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\"></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\"></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p>','128','141','0','0','0','0','','','0','admin','1','2021-09-14 17:23:15','2021-09-13 18:11:46','0','0','','cn','0','1','','','MetInfo','0','','','');
INSERT INTO met_news VALUES('39','耳机及智能音箱行业高速发展','','','控制灯、窗帘、扫地机等设备，现在的音箱门类多种多样，各有侧重点，在现在的消费者对于产品要求越来越高的情况下，有一些音箱开始注重起了产品的防水性能','<p><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\"></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\"></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p>','128','141','0','0','0','0','','','0','admin','0','2021-09-13 18:11:46','2021-09-13 18:11:46','0','0','','cn','0','1','','','MetInfo','0','','','');
INSERT INTO met_news VALUES('40','智能音箱防水检测与音响气密性测试应用','','','通过语音就可以实现家中任一电器的开关，无疑是很方便的，就比如说控制灯、窗帘、扫地机等设备。现在的音箱门类多种多样，各有侧重点，在现在的消费者对于产品要求越来越高的情况下，有一些音箱开始注重起了产品的防水性能','<p><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\"></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\"></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p>','128','141','0','0','0','0','','','0','admin','0','2021-09-13 18:11:46','2021-09-13 18:11:46','0','0','','cn','0','1','','','MetInfo','0','','','');
INSERT INTO met_news VALUES('41','首战告捷，高端智能音箱梦','','','音响作为生活中电子发声设备的必备品，特别是现在的智能家居用的智能音箱，通过语音就可以实现家中任一电器的开关，无疑是很方便的','<p><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\"></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\"></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p>','128','140','0','0','0','0','../upload/202109/1631582678.jpg','','0','admin','0','2021-09-13 18:11:51','2021-09-13 18:11:51','0','0','','cn','0','1','','','MetInfo','0','','','');
INSERT INTO met_news VALUES('42','摄像头如何连WiFi配置“终极问题解决方法”','','','有一些音箱开始注重起了产品的防水性能，特别是在户外使用的音箱，如果音箱没有做防水密封处理，那么内部的喇叭和电子元器件就很容易受到外部灰尘和湿气的影响','<p><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\"></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\"></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p>','128','140','0','0','0','0','../upload/202109/1631582600.jpg','','0','admin','1','2021-09-13 18:11:51','2021-09-13 18:11:51','0','0','','cn','0','1','','','MetInfo','0','','','');
INSERT INTO met_news VALUES('43','耳机及智能音箱行业高速发展','','','控制灯、窗帘、扫地机等设备，现在的音箱门类多种多样，各有侧重点，在现在的消费者对于产品要求越来越高的情况下，有一些音箱开始注重起了产品的防水性能','<p><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\"></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\"></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p>','128','140','0','0','0','0','../upload/202109/1631583129.jpg','','0','admin','0','2021-09-13 18:11:51','2021-09-13 18:11:51','0','0','','cn','0','1','','','MetInfo','0','','','');
INSERT INTO met_news VALUES('44','智能音箱防水检测与音响气密性测试应用','','','通过语音就可以实现家中任一电器的开关，无疑是很方便的，就比如说控制灯、窗帘、扫地机等设备。现在的音箱门类多种多样，各有侧重点，在现在的消费者对于产品要求越来越高的情况下，有一些音箱开始注重起了产品的防水性能','<p><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\"></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\"></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p>','128','140','0','0','0','0','../upload/202109/1631582777.jpg','','0','admin','1','2021-09-13 18:11:51','2021-09-13 18:11:51','0','0','','cn','0','1','','','MetInfo','0','','','');
INSERT INTO met_news VALUES('64','A successful first battle, high-end smart speaker dream','','','Acoustics serves as the essential article of equipment of electronic sound making sound in the life, especially the intelligent sound box that present intelligent household uses, can realize the switch of any electric appliance in the home through voice, it is very convenient undoubtedly','<p><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\"></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\"></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p>','152','153','0','0','0','0','../upload/202109/1631582678.jpg','','0','admin','0','2021-09-14 11:42:43','2021-09-14 11:42:43','0','0','','en','0','1','','','MetInfo','0','','','');
INSERT INTO met_news VALUES('63','Headphone and smart speaker industries are developing rapidly','','','Control the equipment such as machine of lamp, curtain, sweeping the floor, present sound box category is a variety of diversiform, each have side key, below the circumstance with higher and higher to product requirement in present consumer, a few sound boxes begin to notice the waterproof performance that had the product','<p><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\"></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\"></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p>','152','153','0','0','0','0','../upload/202109/1631527403.jpg','','0','admin','2','2021-09-14 11:42:43','2021-09-14 11:42:43','0','0','','en','0','1','','','MetInfo','0','','','');
INSERT INTO met_news VALUES('61','Intelligent speaker waterproof test and sound air tightness test application','','','Through the voice can realize the switch of any electrical appliances in the home, is undoubtedly very convenient, such as the control of lights, curtains, sweeper and other equipment. Present sound box category is a variety of diversiform, each have side key, below the circumstance with higher and higher to product requirement in present consumer, the waterproof performance that a few sound boxes began to notice the product','<p><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\"></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\"></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p>','152','153','0','0','0','0','../upload/202109/1631527466.jpg','','0','admin','0','2021-09-14 11:42:43','2021-09-14 11:42:43','0','0','','en','0','1','','','MetInfo','0','','','');
INSERT INTO met_news VALUES('62','How to configure the camera with WiFi','','','Some speakers began to pay attention to the waterproof performance of the product, especially in the outdoor use of the speaker, if the speaker did not do waterproof sealing treatment, then the internal speaker and electronic components are vulnerable to external dust and moisture','<p><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\"></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\"></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p>','152','153','0','0','0','0','../upload/202109/1631527670.jpg','','0','admin','0','2021-09-14 11:42:43','2021-09-14 11:42:43','0','0','','en','0','1','','','MetInfo','0','','','');
INSERT INTO met_news VALUES('57','A successful first battle, high-end smart speaker dream','','','Acoustics serves as the essential article of equipment of electronic sound making sound in the life, especially the intelligent sound box that present intelligent household uses, can realize the switch of any electric appliance in the home through voice, it is very convenient undoubtedly','<p><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\"></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\"></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p>','152','154','0','0','0','0','','','0','admin','0','2021-09-14 11:42:36','2021-09-14 11:42:36','0','0','','en','0','1','','','MetInfo','0','','','');
INSERT INTO met_news VALUES('58','Headphone and smart speaker industries are developing rapidly','','','Control the equipment such as machine of lamp, curtain, sweeping the floor, present sound box category is a variety of diversiform, each have side key, below the circumstance with higher and higher to product requirement in present consumer, a few sound boxes begin to notice the waterproof performance that had the product','<p><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\"></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\"></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p>','152','154','0','0','0','0','','','0','admin','0','2021-09-14 11:42:36','2021-09-14 11:42:36','0','0','','en','0','1','','','MetInfo','0','','','');
INSERT INTO met_news VALUES('59','How to configure the camera with WiFi','','','Some speakers began to pay attention to the waterproof performance of the product, especially in the outdoor use of the speaker, if the speaker did not do waterproof sealing treatment, then the internal speaker and electronic components are vulnerable to external dust and moisture','<p><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\"></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\"></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p>','152','154','0','0','0','0','','','0','admin','0','2021-09-14 11:42:36','2021-09-14 11:42:36','0','0','','en','0','1','','','MetInfo','0','','','');
INSERT INTO met_news VALUES('60','Intelligent speaker waterproof test and sound air tightness test application','','','Through the voice can realize the switch of any electrical appliances in the home, is undoubtedly very convenient, such as the control of lights, curtains, sweeper and other equipment. Present sound box category is a variety of diversiform, each have side key, below the circumstance with higher and higher to product requirement in present consumer, the waterproof performance that a few sound boxes began to notice the product','<p><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\"></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\"></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p>','152','154','0','0','0','0','','','0','admin','0','2021-09-14 11:42:36','2021-09-14 11:42:36','0','0','','en','0','1','','','MetInfo','0','','','');
INSERT INTO met_news VALUES('53','Intelligent speaker waterproof test and sound air tightness test application','','','Through the voice can realize the switch of any electrical appliances in the home, is undoubtedly very convenient, such as the control of lights, curtains, sweeper and other equipment. Present sound box category is a variety of diversiform, each have side key, below the circumstance with higher and higher to product requirement in present consumer, the waterproof performance that a few sound boxes began to notice the product','<p><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\"></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\"></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p>','152','155','0','0','0','0','','','0','admin','0','2021-09-14 11:40:50','2021-09-14 10:39:57','0','0','','en','0','1','','','MetInfo','0','','','');
INSERT INTO met_news VALUES('54','How to configure the camera with WiFi','','','Some speakers began to pay attention to the waterproof performance of the product, especially in the outdoor use of the speaker, if the speaker did not do waterproof sealing treatment, then the internal speaker and electronic components are vulnerable to external dust and moisture','<p><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\"></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\"></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p>','152','155','0','0','0','0','','','0','admin','0','2021-09-14 11:41:14','2021-09-14 10:39:57','0','0','','en','0','1','','','MetInfo','0','','','');
INSERT INTO met_news VALUES('55','Headphone and smart speaker industries are developing rapidly','','','Control the equipment such as machine of lamp, curtain, sweeping the floor, present sound box category is a variety of diversiform, each have side key, below the circumstance with higher and higher to product requirement in present consumer, a few sound boxes begin to notice the waterproof performance that had the product','<p><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\"></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\"></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p>','152','155','0','0','0','0','','','0','admin','0','2021-09-14 11:41:35','2021-09-14 10:39:57','0','0','','en','0','1','','','MetInfo','0','','','');
INSERT INTO met_news VALUES('56','A successful first battle, high-end smart speaker dream','','','Acoustics serves as the essential article of equipment of electronic sound making sound in the life, especially the intelligent sound box that present intelligent household uses, can realize the switch of any electric appliance in the home through voice, it is very convenient undoubtedly','<p><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\"></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p><span style=\"font-size: 14px; text-indent: 32px;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\"></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p>','152','155','0','0','0','0','','','0','admin','0','2021-09-14 11:42:00','2021-09-14 10:39:57','0','0','','en','0','1','','','MetInfo','0','','','');

DROP TABLE IF EXISTS met_online;
CREATE TABLE `met_online` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `no_order` int(11) DEFAULT '0',
  `name` varchar(255) DEFAULT '',
  `value` varchar(255) DEFAULT '',
  `icon` varchar(255) DEFAULT '',
  `type` int(11) DEFAULT '0',
  `lang` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

INSERT INTO met_online VALUES('1','0','售前客服','00000000','icon fa-qq','0','cn');
INSERT INTO met_online VALUES('2','0','售后支持','00000000','icon fa-qq','0','cn');
INSERT INTO met_online VALUES('3','0','服务热线','00000000','icon fa-phone-square','3','cn');
INSERT INTO met_online VALUES('4','0','微信客服','../upload/202109/1631614014.jpg','icon fa-wechat','4','cn');
INSERT INTO met_online VALUES('5','0','微信客服','../upload/201807/1554199135.jpg','icon fa-wechat','4','en');
INSERT INTO met_online VALUES('6','0','服务热线','00000000','icon fa-phone-square','3','en');
INSERT INTO met_online VALUES('7','0','售后支持','00000000','icon fa-qq','0','en');
INSERT INTO met_online VALUES('8','0','售前客服','00000000','icon fa-qq','0','en');

DROP TABLE IF EXISTS met_para;
CREATE TABLE `met_para` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(10) DEFAULT '0',
  `value` varchar(255) DEFAULT '',
  `module` int(10) DEFAULT '0',
  `order` int(10) DEFAULT '0',
  `lang` varchar(100) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;

INSERT INTO met_para VALUES('5','164','先生','6','1','cn');
INSERT INTO met_para VALUES('6','164','女士','6','2','cn');
INSERT INTO met_para VALUES('50','206','其他方式','8','4','cn');
INSERT INTO met_para VALUES('51','206','电视广告','8','3','cn');
INSERT INTO met_para VALUES('52','206','朋友结束','8','2','cn');
INSERT INTO met_para VALUES('53','206','网站链接','8','1','cn');
INSERT INTO met_para VALUES('54','206','搜索引擎','8','0','cn');
INSERT INTO met_para VALUES('55','142','其他反馈','8','3','cn');
INSERT INTO met_para VALUES('56','142','商务合作','8','2','cn');
INSERT INTO met_para VALUES('57','142','产品购买','8','1','cn');
INSERT INTO met_para VALUES('58','142','获取资料','8','0','cn');
INSERT INTO met_para VALUES('74','239','Search engine','8','0','en');
INSERT INTO met_para VALUES('73','239','Links to sites','8','1','en');
INSERT INTO met_para VALUES('65','214','female','6','2','en');
INSERT INTO met_para VALUES('64','214','male','6','1','en');
INSERT INTO met_para VALUES('72','239','Friend introduced','8','2','en');
INSERT INTO met_para VALUES('71','239','TV commercial','8','3','en');
INSERT INTO met_para VALUES('70','239','Other way','8','4','en');
INSERT INTO met_para VALUES('69','231','Access to materials','8','0','en');
INSERT INTO met_para VALUES('66','231','Other feedback','8','3','en');
INSERT INTO met_para VALUES('67','231','Business cooperation','8','2','en');
INSERT INTO met_para VALUES('68','231','Products to buy','8','1','en');

DROP TABLE IF EXISTS met_parameter;
CREATE TABLE `met_parameter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT '',
  `options` text,
  `description` text,
  `no_order` int(2) DEFAULT '0',
  `type` int(2) DEFAULT '0',
  `access` text,
  `wr_ok` int(2) DEFAULT '0',
  `class1` int(11) DEFAULT '0',
  `class2` int(11) DEFAULT '0',
  `class3` int(11) DEFAULT '0',
  `module` int(2) DEFAULT '0',
  `lang` varchar(50) DEFAULT '',
  `wr_oks` int(2) DEFAULT '0',
  `related` varchar(50) DEFAULT '',
  `edit_ok` int(2) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=241 DEFAULT CHARSET=utf8;

INSERT INTO met_parameter VALUES('1','公司名称','','','9','1','0','0','0','0','0','10','cn','1','','1');
INSERT INTO met_parameter VALUES('2','公司传真','','','10','1','0','0','0','0','0','10','cn','1','','1');
INSERT INTO met_parameter VALUES('3','公司联系地址','','','11','1','0','0','0','0','0','10','cn','1','','1');
INSERT INTO met_parameter VALUES('4','公司邮政编码','','','12','1','0','0','0','0','0','10','cn','1','','1');
INSERT INTO met_parameter VALUES('5','公司网址','','','13','1','0','0','0','0','0','10','cn','1','','1');
INSERT INTO met_parameter VALUES('137','姓名','','','0','1','0','1','0','0','0','7','cn','0','','1');
INSERT INTO met_parameter VALUES('138','联系电话','','','2','8','0','1','0','0','0','7','cn','0','','1');
INSERT INTO met_parameter VALUES('139','联系地址','','','3','1','0','0','0','0','0','7','cn','0','','1');
INSERT INTO met_parameter VALUES('140','留言内容','','','4','3','0','1','0','0','0','7','cn','0','','1');
INSERT INTO met_parameter VALUES('142','反馈主题','[{\"id\":\"58\",\"value\":\"获取资料\",\"order\":\"0\"},{\"id\":\"57\",\"value\":\"产品购买\",\"order\":\"1\"},{\"id\":\"56\",\"value\":\"商务合作\",\"order\":\"2\"},{\"id\":\"55\",\"value\":\"其他反馈\",\"order\":\"3\"}]','','2','2','0','1','0','0','0','8','cn','1','','1');
INSERT INTO met_parameter VALUES('163','姓名','','','1','1','0','1','0','0','0','6','cn','0','','1');
INSERT INTO met_parameter VALUES('164','性别','','','2','6','0','0','0','0','0','6','cn','0','','1');
INSERT INTO met_parameter VALUES('165','出生年月','','','3','1','0','0','0','0','0','6','cn','0','','1');
INSERT INTO met_parameter VALUES('166','籍贯','','','4','1','0','0','0','0','0','6','cn','0','','1');
INSERT INTO met_parameter VALUES('167','联系电话','','','5','8','0','1','0','0','0','6','cn','0','','1');
INSERT INTO met_parameter VALUES('168','E-mail','','','6','9','0','1','0','0','0','6','cn','0','','1');
INSERT INTO met_parameter VALUES('169','学历','','','7','1','0','0','0','0','0','6','cn','0','','1');
INSERT INTO met_parameter VALUES('170','专业','','','8','1','0','0','0','0','0','6','cn','0','','1');
INSERT INTO met_parameter VALUES('171','学校','','','9','1','0','0','0','0','0','6','cn','0','','1');
INSERT INTO met_parameter VALUES('172','通讯地址','','','10','1','0','0','0','0','0','6','cn','0','','1');
INSERT INTO met_parameter VALUES('173','工作经历','','','11','3','0','0','0','0','0','6','cn','0','','1');
INSERT INTO met_parameter VALUES('174','业余爱好','','','12','3','0','0','0','0','0','6','cn','0','','1');
INSERT INTO met_parameter VALUES('175','作品','','','13','5','0','0','0','0','0','6','cn','0','','1');
INSERT INTO met_parameter VALUES('176','姓名','','','5','1','0','0','0','0','0','8','cn','1','','1');
INSERT INTO met_parameter VALUES('179','职务','','','8','3','0','0','0','0','0','8','cn','1','','1');
INSERT INTO met_parameter VALUES('186','Email','','','1','9','0','1','0','0','0','7','cn','0','','1');
INSERT INTO met_parameter VALUES('200','版本','','','0','1','0','0','0','0','0','4','cn','1','','1');
INSERT INTO met_parameter VALUES('201','E-mail','','','3','9','0','0','134','0','0','8','cn','1','','1');
INSERT INTO met_parameter VALUES('205','信息描述','','','7','1','0','0','134','0','0','8','cn','1','','1');
INSERT INTO met_parameter VALUES('206','你是怎么找的我们的','[{\"id\":\"54\",\"value\":\"搜索引擎\",\"order\":\"0\"},{\"id\":\"53\",\"value\":\"网站链接\",\"order\":\"1\"},{\"id\":\"52\",\"value\":\"朋友结束\",\"order\":\"2\"},{\"id\":\"51\",\"value\":\"电视广告\",\"order\":\"3\"},{\"id\":\"50\",\"value\":\"其他方式\",\"order\":\"4\"}]','','8','4','0','0','134','0','0','8','cn','1','','1');
INSERT INTO met_parameter VALUES('202','联系电话','','','4','8','0','1','134','0','0','8','cn','1','','1');
INSERT INTO met_parameter VALUES('203','单位名称','','','5','1','0','0','134','0','0','8','cn','1','','1');
INSERT INTO met_parameter VALUES('204','详细地址','','','6','3','0','0','134','0','0','8','cn','1','','1');
INSERT INTO met_parameter VALUES('240','版本','','','0','1','0','0','0','0','0','4','en','1','','1');
INSERT INTO met_parameter VALUES('230','Message','','','4','3','0','0','0','0','0','7','en','1','','1');
INSERT INTO met_parameter VALUES('229','Add','','','3','1','0','0','0','0','0','7','en','1','','1');
INSERT INTO met_parameter VALUES('228','Tel','','','2','8','0','1','0','0','0','7','en','1','','1');
INSERT INTO met_parameter VALUES('227','E-mail','','','1','9','0','0','0','0','0','7','en','1','','1');
INSERT INTO met_parameter VALUES('223','Work experience','','','11','3','0','0','0','0','0','6','en','1','','1');
INSERT INTO met_parameter VALUES('224','A hobby','','','12','3','0','0','0','0','0','6','en','1','','1');
INSERT INTO met_parameter VALUES('225','Works','','','13','5','0','0','0','0','0','6','en','1','','1');
INSERT INTO met_parameter VALUES('226','Name','','','0','1','0','1','0','0','0','7','en','1','','1');
INSERT INTO met_parameter VALUES('222','Add','','','10','1','0','0','0','0','0','6','en','1','','1');
INSERT INTO met_parameter VALUES('221','The school','','','9','1','0','0','0','0','0','6','en','1','','1');
INSERT INTO met_parameter VALUES('220','professional','','','8','1','0','0','0','0','0','6','en','1','','1');
INSERT INTO met_parameter VALUES('219','Record of formal schooling','','','7','1','0','0','0','0','0','6','en','1','','1');
INSERT INTO met_parameter VALUES('218','E-mail','','','6','9','0','1','0','0','0','6','en','0','','1');
INSERT INTO met_parameter VALUES('217','Contact phone number','','','5','8','0','1','0','0','0','6','en','1','','1');
INSERT INTO met_parameter VALUES('216','Native place','','','4','1','0','0','0','0','0','6','en','1','','1');
INSERT INTO met_parameter VALUES('215','Date of birth','','','3','1','0','0','0','0','0','6','en','1','','1');
INSERT INTO met_parameter VALUES('214','Gender','[{\"id\":\"64\",\"value\":\"先生\",\"order\":\"1\"},{\"id\":\"65\",\"value\":\"女士\",\"order\":\"2\"}]','','2','6','0','0','0','0','0','6','en','1','','1');
INSERT INTO met_parameter VALUES('213','Name','','','1','1','0','1','0','0','0','6','en','1','','1');
INSERT INTO met_parameter VALUES('235','Tel','','','4','8','0','1','146','0','0','8','en','1','','1');
INSERT INTO met_parameter VALUES('236','Company name','','','5','1','0','0','146','0','0','8','en','1','','1');
INSERT INTO met_parameter VALUES('237','Add','','','6','1','0','0','146','0','0','8','en','1','','1');
INSERT INTO met_parameter VALUES('238','Information description','','','7','3','0','0','146','0','0','8','en','1','','1');
INSERT INTO met_parameter VALUES('231','Feedback the theme','[{\"id\":\"69\",\"value\":\"Access to materials\",\"order\":\"0\"},{\"id\":\"68\",\"value\":\"Products to buy\",\"order\":\"1\"},{\"id\":\"67\",\"value\":\"Business cooperation\",\"order\":\"2\"},{\"id\":\"66\",\"value\":\"Other feedback\",\"order\":\"3\"}]','','0','2','0','1','146','0','0','8','en','1','','1');
INSERT INTO met_parameter VALUES('232','Name','','','1','1','0','1','146','0','0','8','en','1','','1');
INSERT INTO met_parameter VALUES('233','Position','','','2','1','0','0','146','0','0','8','en','1','','1');
INSERT INTO met_parameter VALUES('234','E-mail','','','3','9','0','0','146','0','0','8','en','1','','1');
INSERT INTO met_parameter VALUES('239','How did you find us?','[{\"id\":\"74\",\"value\":\"Search engine\",\"order\":\"0\"},{\"id\":\"73\",\"value\":\"Links to sites\",\"order\":\"1\"},{\"id\":\"72\",\"value\":\"Friend introduced\",\"order\":\"2\"},{\"id\":\"71\",\"value\":\"TV commercial\",\"order\":\"3\"},{\"id\":\"70\",\"value\":\"Other way\",\"order\":\"4\"}]','','8','4','0','0','146','0','0','8','en','1','','1');

DROP TABLE IF EXISTS met_plist;
CREATE TABLE `met_plist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `listid` int(11) DEFAULT '0',
  `paraid` int(11) DEFAULT '0',
  `info` text,
  `lang` varchar(50) DEFAULT '',
  `imgname` varchar(255) DEFAULT '',
  `module` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=126 DEFAULT CHARSET=utf8;

INSERT INTO met_plist VALUES('124','24','200','V7.5','cn','版本','4');
INSERT INTO met_plist VALUES('125','25','240','V7.5','cn','版本','4');

DROP TABLE IF EXISTS met_product;
CREATE TABLE `met_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT '',
  `ctitle` varchar(200) DEFAULT '',
  `keywords` varchar(200) DEFAULT '',
  `description` text,
  `content` longtext,
  `class1` int(11) DEFAULT '0',
  `class2` int(11) DEFAULT '0',
  `class3` int(11) DEFAULT '0',
  `classother` text NOT NULL,
  `no_order` int(11) DEFAULT '0',
  `wap_ok` int(1) DEFAULT '0',
  `new_ok` int(1) DEFAULT '0',
  `imgurl` varchar(255) DEFAULT '',
  `imgurls` varchar(255) DEFAULT '',
  `displayimg` text,
  `com_ok` int(1) DEFAULT '0',
  `hits` int(11) DEFAULT '0',
  `updatetime` datetime DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `issue` varchar(100) DEFAULT '',
  `access` text,
  `top_ok` int(1) DEFAULT '0',
  `filename` varchar(255) DEFAULT '',
  `lang` varchar(50) DEFAULT '',
  `video` text,
  `content1` mediumtext,
  `content2` mediumtext,
  `content3` mediumtext,
  `content4` mediumtext,
  `contentinfo` varchar(255) DEFAULT '',
  `contentinfo1` varchar(255) DEFAULT '',
  `contentinfo2` varchar(255) DEFAULT '',
  `contentinfo3` varchar(255) DEFAULT '',
  `contentinfo4` varchar(255) DEFAULT '',
  `recycle` int(11) DEFAULT '0',
  `displaytype` int(11) DEFAULT '1',
  `tag` text,
  `links` varchar(200) DEFAULT '',
  `imgsize` varchar(200) DEFAULT '',
  `text_size` int(11) DEFAULT '0',
  `text_color` varchar(100) DEFAULT '',
  `other_info` text,
  `custom_info` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=122 DEFAULT CHARSET=utf8;

INSERT INTO met_product VALUES('98','智能路由器Ⅱ','','','演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演','<p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\"></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p><br/></p>','127','139','0','','0','0','0','../upload/202109/1631528459.jpg','','智能路由器Ⅱ*../upload/202109/1631528895.jpg*350x325','0','0','2021-09-13 18:15:42','2021-09-13 18:14:35','admin','0','0','','cn','','<p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p>','<p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p>','','','','','','','','0','1','','','350x325','0','','','');
INSERT INTO met_product VALUES('99','智能路由器Ⅲ','','','演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演','<p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\"></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p><br/></p>','127','139','0','','0','0','0','../upload/202109/1631528454.jpg','','智能路由器Ⅲ*../upload/202109/1631528762.jpg*350x325','0','1','2021-09-13 18:15:28','2021-09-13 18:15:12','admin','0','0','','cn','','<p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p>','<p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p>','','','','','','','','0','1','','','350x325','0','','','');
INSERT INTO met_product VALUES('100','智能路由器Ⅰ','','','演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演','<p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\"></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p><br/></p>','127','139','0','','0','0','0','../upload/202109/1631529161.jpg','','智能路由器Ⅰ*../upload/202109/1631529010.jpg*350x325','0','0','2021-09-13 18:16:15','2021-09-13 18:15:25','admin','0','0','','cn','','<p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p>','<p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p>','','','','','','','','0','1','','','350x325','0','','','');
INSERT INTO met_product VALUES('101','智能路由器Ⅳ','','','演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演','<p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\"></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p><br/></p>','127','139','0','','0','0','0','../upload/202109/1631528277.jpg','','智能路由器Ⅳ*../upload/202109/1631528454.jpg*350x325','0','1','2021-09-13 18:15:25','2021-09-13 18:15:25','admin','0','0','','cn','','<p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p>','<p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p>','','','','','','','','0','1','','','350x325','0','','','');
INSERT INTO met_product VALUES('102','智能云摄像头Ⅲ','','','演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演','<p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\"></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p><br/></p>','127','137','0','','0','0','0','../upload/202109/1631528646.jpg','','智能云摄像头Ⅲ*../upload/202109/1631529215.jpg*350x325','0','0','2021-09-13 18:18:26','2021-09-13 18:17:45','admin','0','0','','cn','','<p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p>','<p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p>','','','','','','','','0','1','','','350x325','0','','','');
INSERT INTO met_product VALUES('103','智能云摄像头Ⅱ','','','演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演','<p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\"></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p><br/></p>','127','137','0','','0','0','0','../upload/202109/1631529226.jpg','','智能云摄像头Ⅱ*../upload/202109/1631529327.jpg*350x325','0','0','2021-09-13 18:18:40','2021-09-13 18:18:18','admin','0','0','','cn','','<p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p>','<p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p>','','','','','','','','0','1','','','350x325','0','','','');
INSERT INTO met_product VALUES('104','智能云摄像头Ⅳ','','','演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演','<p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\"></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p><br/></p>','127','137','0','','0','0','0','../upload/202109/1631529160.jpg','','','0','0','2021-09-13 18:18:55','2021-09-13 18:18:24','admin','0','0','','cn','','<p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p>','<p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p>','','','','','','','','0','1','','','350x325','0','','','');
INSERT INTO met_product VALUES('106','智能蓝牙音箱Ⅲ','','','演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演','<p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px;\"></span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px;\"></span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p>','127','136','0','','2','0','0','../upload/202109/1631529072.jpg','','智能蓝牙音箱Ⅲ*../upload/202109/1631528575.jpg*350x325','0','0','2021-09-14 10:21:13','2021-09-13 18:19:41','admin','0','0','','cn','','<p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p>','<p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p>','','','','','','','','0','1','','','350x325','0','','','');
INSERT INTO met_product VALUES('105','智能云摄像头Ⅳ','','','演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演','<p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\"></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p><br/></p>','127','137','0','','0','0','0','../upload/202109/1631528866.jpg','','智能云摄像头Ⅳ*../upload/202109/1631528646.jpg*350x325','0','0','2021-09-13 18:18:24','2021-09-13 18:18:24','admin','0','0','','cn','','<p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p>','<p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p>','','','','','','','','0','1','','','350x325','0','','','');
INSERT INTO met_product VALUES('107','智能蓝牙音箱Ⅱ','','','演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演','<p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px; text-indent: 32px;\"></span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px; text-indent: 32px;\"></span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p>','127','136','0','','3','0','0','../upload/202109/1631528927.jpg','','智能蓝牙音箱Ⅱ*../upload/202109/1631529246.jpg*350x325','0','7','2021-09-13 18:21:22','2021-09-13 18:20:27','admin','0','0','','cn','','<p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p>','<p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p>','','','','','','','','0','1','','','350x325','0','','','');
INSERT INTO met_product VALUES('108','智能蓝牙音箱Ⅰ','','','演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演','<p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px;\"></span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px;\"></span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p>','127','136','0','','4','0','0','../upload/202109/1631529441.jpg','','智能蓝牙音箱Ⅰ*../upload/202109/1631528758.jpg*350x325|智能蓝牙音箱Ⅰ*../upload/202109/1631528575.jpg*350x325|智能蓝牙音箱Ⅰ*../upload/202109/1631529072.jpg*350x325','0','27','2021-09-14 16:37:48','2021-09-13 18:20:32','admin','0','0','','cn','','<p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p>','<p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p>','','','','','','','','0','1','','','350x325','0','','','');
INSERT INTO met_product VALUES('109','智能蓝牙音箱Ⅳ','','','演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演','<p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px;\"></span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px;\"></span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p>','127','136','0','','1','0','0','../upload/202109/1631529212.jpg','','智能蓝牙音箱Ⅳ*../upload/202109/1631529072.jpg*350x325','0','0','2021-09-14 10:21:00','2021-09-13 18:20:32','admin','0','0','','cn','','<p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p>','<p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p>','','','','','','','','0','1','','','350x325','0','','','');
INSERT INTO met_product VALUES('110','Smart Bluetooth speakerⅢ','','','演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演','<p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px;\"></span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px;\"></span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p>','148','149','0','','2','0','0','../upload/202109/1631529072.jpg','','Smart Bluetooth speakerⅢ*../upload/202109/1631528575.jpg*350x325','0','0','2021-09-14 11:20:23','2021-09-14 10:39:57','admin','0','0','','en','','<p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p>','<p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p>','','','','','','','','0','1','','','350x325','0','','','');
INSERT INTO met_product VALUES('111','Smart Bluetooth speakerⅡ','','','演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演','<p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px; text-indent: 32px;\"></span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px; text-indent: 32px;\"></span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p>','148','149','0','','3','0','0','../upload/202109/1631528927.jpg','','Smart Bluetooth speakerⅡ*../upload/202109/1631529246.jpg*350x325','0','7','2021-09-14 11:20:28','2021-09-14 10:39:57','admin','0','0','','en','','<p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p>','<p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p>','','','','','','','','0','1','','','350x325','0','','','');
INSERT INTO met_product VALUES('112','Smart Bluetooth speakerⅠ','','','演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演','<p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px;\"></span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px;\"></span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p>','148','149','0','','4','0','0','../upload/202109/1631529441.jpg','','Smart Bluetooth speakerⅠ*../upload/202109/1631528758.jpg*350x325','0','7','2021-09-14 11:20:33','2021-09-14 10:39:57','admin','0','0','','en','','<p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p>','<p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p>','','','','','','','','0','1','','','350x325','0','','','');
INSERT INTO met_product VALUES('113','Smart Bluetooth speakerⅣ','','','演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演','<p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px;\"></span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px;\"></span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"font-size: 14px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p>','148','149','0','','1','0','0','../upload/202109/1631529212.jpg','','Smart Bluetooth speakerⅣ*../upload/202109/1631529072.jpg*350x325','0','0','2021-09-14 11:20:12','2021-09-14 10:39:57','admin','0','0','','en','','<p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p>','<p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p>','','','','','','','','0','1','','','350x325','0','','','');
INSERT INTO met_product VALUES('114','Smart cloud cameraⅢ','','','演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演','<p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\"></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p><br/></p>','148','150','0','','0','0','0','../upload/202109/1631528646.jpg','','Smart cloud cameraⅢ*../upload/202109/1631529215.jpg*350x325','0','0','2021-09-14 11:17:17','2021-09-14 10:39:57','admin','0','0','','en','','<p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p>','<p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p>','','','','','','','','0','1','','','350x325','0','','','');
INSERT INTO met_product VALUES('115','Smart cloud cameraⅡ','','','演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演','<p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\"></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p><br/></p>','148','150','0','','0','0','0','../upload/202109/1631529226.jpg','','Smart cloud cameraⅡ*../upload/202109/1631529327.jpg*350x325','0','0','2021-09-14 11:17:35','2021-09-14 10:39:57','admin','0','0','','en','','<p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p>','<p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p>','','','','','','','','0','1','','','350x325','0','','','');
INSERT INTO met_product VALUES('116','Smart cloud cameraⅣ','','','演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演','<p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\"></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p><br/></p>','148','150','0','','0','0','0','../upload/202109/1631529160.jpg','','','0','0','2021-09-14 11:18:00','2021-09-14 10:39:57','admin','0','0','','en','','<p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p>','<p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p>','','','','','','','','0','1','','','350x325','0','','','');
INSERT INTO met_product VALUES('117','Smart cloud cameraⅣ','','','演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演','<p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\"></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p><br/></p>','148','150','0','','0','0','0','../upload/202109/1631528866.jpg','','Smart cloud cameraⅣ*../upload/202109/1631528646.jpg*350x325','0','0','2021-09-14 11:18:18','2021-09-14 10:39:57','admin','0','0','','en','','<p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p>','<p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p>','','','','','','','','0','1','','','350x325','0','','','');
INSERT INTO met_product VALUES('118','Intelligent routerⅡ','','','演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演','<p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\"></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p><br/></p>','148','151','0','','0','0','0','../upload/202109/1631528459.jpg','','Intelligent routerⅡ*../upload/202109/1631528895.jpg*350x325','0','0','2021-09-14 11:18:35','2021-09-14 10:39:57','admin','0','0','','en','','<p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p>','<p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p>','','','','','','','','0','1','','','350x325','0','','','');
INSERT INTO met_product VALUES('119','Intelligent routerⅢ','','','演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演','<p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\"></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p><br/></p>','148','151','0','','0','0','0','../upload/202109/1631528454.jpg','','Intelligent routerⅢ*../upload/202109/1631528762.jpg*350x325','0','0','2021-09-14 11:18:57','2021-09-14 10:39:57','admin','0','0','','en','','<p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p>','<p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p>','','','','','','','','0','1','','','350x325','0','','','');
INSERT INTO met_product VALUES('120','Intelligent routerⅠ','','','演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演','<p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\"></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p><br/></p>','148','151','0','','0','0','0','../upload/202109/1631529161.jpg','','Intelligent routerⅠ*../upload/202109/1631529010.jpg*350x325','0','0','2021-09-14 11:19:59','2021-09-14 10:39:57','admin','0','0','','en','','<p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p>','<p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p>','','','','','','','','0','1','','','350x325','0','','','');
INSERT INTO met_product VALUES('121','Intelligent routerⅣ','','','演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演','<p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\"></span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p><br/></p>','148','151','0','','0','0','0','../upload/202109/1631528277.jpg','','Intelligent routerⅣ*../upload/202109/1631528454.jpg*350x325','0','0','2021-09-14 11:20:05','2021-09-14 10:39:57','admin','0','0','','en','','<p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p><p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据！</span></p>','<p style=\"white-space: normal;\"><span style=\"font-size: 14px; text-indent: 32px;\">演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据，据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演示数据演，示数据演示数据演示数据演示数据演示数据演示数据演示数。</span></p>','','','','','','','','0','1','','','350x325','0','','','');

DROP TABLE IF EXISTS met_relation;
CREATE TABLE `met_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aid` int(11) DEFAULT NULL COMMENT '内容id',
  `module` int(11) DEFAULT NULL,
  `relation_id` int(11) DEFAULT NULL COMMENT '关联内容id',
  `relation_module` int(11) DEFAULT NULL,
  `lang` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

INSERT INTO met_relation VALUES('16','108','3','108','3','cn');
INSERT INTO met_relation VALUES('15','108','3','106','3','cn');
INSERT INTO met_relation VALUES('14','108','3','109','3','cn');
INSERT INTO met_relation VALUES('13','108','3','107','3','cn');
INSERT INTO met_relation VALUES('17','106','3','104','3','cn');
INSERT INTO met_relation VALUES('18','106','3','103','3','cn');
INSERT INTO met_relation VALUES('19','106','3','102','3','cn');
INSERT INTO met_relation VALUES('20','106','3','105','3','cn');
INSERT INTO met_relation VALUES('21','107','3','100','3','cn');
INSERT INTO met_relation VALUES('22','107','3','98','3','cn');
INSERT INTO met_relation VALUES('23','107','3','99','3','cn');
INSERT INTO met_relation VALUES('24','107','3','101','3','cn');
INSERT INTO met_relation VALUES('25','109','3','107','3','cn');
INSERT INTO met_relation VALUES('26','109','3','106','3','cn');
INSERT INTO met_relation VALUES('27','109','3','108','3','cn');
INSERT INTO met_relation VALUES('28','109','3','109','3','cn');
INSERT INTO met_relation VALUES('48','104','3','105','3','cn');
INSERT INTO met_relation VALUES('47','104','3','102','3','cn');
INSERT INTO met_relation VALUES('46','104','3','103','3','cn');
INSERT INTO met_relation VALUES('45','104','3','104','3','cn');
INSERT INTO met_relation VALUES('33','105','3','100','3','cn');
INSERT INTO met_relation VALUES('34','105','3','98','3','cn');
INSERT INTO met_relation VALUES('35','105','3','99','3','cn');
INSERT INTO met_relation VALUES('36','105','3','101','3','cn');
INSERT INTO met_relation VALUES('37','102','3','105','3','cn');
INSERT INTO met_relation VALUES('38','102','3','104','3','cn');
INSERT INTO met_relation VALUES('39','102','3','103','3','cn');
INSERT INTO met_relation VALUES('40','102','3','102','3','cn');
INSERT INTO met_relation VALUES('41','103','3','109','3','cn');
INSERT INTO met_relation VALUES('42','103','3','107','3','cn');
INSERT INTO met_relation VALUES('43','103','3','106','3','cn');
INSERT INTO met_relation VALUES('44','103','3','108','3','cn');
INSERT INTO met_relation VALUES('49','101','3','100','3','cn');
INSERT INTO met_relation VALUES('50','101','3','98','3','cn');
INSERT INTO met_relation VALUES('51','101','3','99','3','cn');
INSERT INTO met_relation VALUES('52','101','3','101','3','cn');
INSERT INTO met_relation VALUES('53','99','3','104','3','cn');
INSERT INTO met_relation VALUES('54','99','3','103','3','cn');
INSERT INTO met_relation VALUES('55','99','3','102','3','cn');
INSERT INTO met_relation VALUES('56','99','3','105','3','cn');
INSERT INTO met_relation VALUES('57','98','3','109','3','cn');
INSERT INTO met_relation VALUES('58','98','3','107','3','cn');
INSERT INTO met_relation VALUES('59','98','3','106','3','cn');
INSERT INTO met_relation VALUES('60','98','3','108','3','cn');
INSERT INTO met_relation VALUES('61','100','3','98','3','cn');
INSERT INTO met_relation VALUES('62','100','3','99','3','cn');
INSERT INTO met_relation VALUES('63','100','3','101','3','cn');
INSERT INTO met_relation VALUES('64','100','3','100','3','cn');

DROP TABLE IF EXISTS met_skin_table;
CREATE TABLE `met_skin_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `skin_name` varchar(200) DEFAULT '',
  `skin_file` varchar(20) DEFAULT '',
  `skin_info` text,
  `devices` int(11) DEFAULT '0',
  `ver` varchar(10) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO met_skin_table VALUES('1','metv75','metv75','MetInfo v7.5.0正式版新推出一套全新精致免费模板！','0','');
INSERT INTO met_skin_table VALUES('2','m1156ui010','m1156ui010','','0','1.0');

DROP TABLE IF EXISTS met_tags;
CREATE TABLE `met_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(255) DEFAULT '',
  `tag_pinyin` varchar(255) DEFAULT '',
  `module` int(11) DEFAULT '0',
  `cid` int(11) DEFAULT '0',
  `list_id` varchar(255) DEFAULT '',
  `title` varchar(255) DEFAULT '',
  `keywords` varchar(255) DEFAULT '',
  `description` varchar(255) DEFAULT '',
  `tag_color` varchar(255) DEFAULT '',
  `tag_size` int(10) DEFAULT '0',
  `sort` int(10) DEFAULT '0',
  `lang` varchar(100) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO met_tags VALUES('1','企业','qiye','2','3','|12|','文章模块自动聚合标签','','','#f7113f','0','0','cn');
INSERT INTO met_tags VALUES('2','消费','xiaofei','2','3','|12|','','','','','0','0','cn');
INSERT INTO met_tags VALUES('3','华为','huawei','3','4','','产品聚合标签','','','','0','0','cn');

DROP TABLE IF EXISTS met_templates;
CREATE TABLE `met_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `no` varchar(20) DEFAULT '0',
  `pos` int(11) DEFAULT '0',
  `no_order` int(11) DEFAULT '0',
  `type` int(11) DEFAULT '0',
  `style` int(11) DEFAULT '0',
  `selectd` varchar(500) DEFAULT '',
  `name` varchar(50) DEFAULT '',
  `value` text,
  `defaultvalue` text,
  `valueinfo` varchar(100) DEFAULT '',
  `tips` varchar(255) DEFAULT '',
  `lang` varchar(50) DEFAULT '',
  `bigclass` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=625 DEFAULT CHARSET=utf8;

INSERT INTO met_templates VALUES('338','metv75','0','10','1','3','','met_foot','','','底部设置','','cn','0');
INSERT INTO met_templates VALUES('339','metv75','0','13','4','3','$M$底部$T$0$M$顶部$T$1','cn1_position','0','0','简繁体切换按钮位置','','cn','338');
INSERT INTO met_templates VALUES('340','metv75','0','12','2','3','','footlink_title','友情链接','友情链接','友情链接标题','','cn','338');
INSERT INTO met_templates VALUES('341','metv75','0','11','4','3','$M$开启$T$1$M$关闭$T$0','link_ok','1','1','友情链接开关','','cn','338');
INSERT INTO met_templates VALUES('342','metv75','0','14','4','3','$M$开启$T$1$M$关闭$T$0','cn1_ok','0','1','简繁体切换开关','','cn','338');
INSERT INTO met_templates VALUES('343','metv75','2','10','1','3','','met_news','','','文章模块','','cn','0');
INSERT INTO met_templates VALUES('344','metv75','2','11','4','3','$M$开启$T$1$M$关闭$T$0','news_imgok','','1','图片开关','','cn','343');
INSERT INTO met_templates VALUES('345','metv75','3','10','1','3','','downlaod_bar','','','下载模块','','cn','0');
INSERT INTO met_templates VALUES('346','metv75','3','15','4','3','$M$开启$T$1$M$关闭$T$0','downloadsidebar_column_ok','','1','侧栏栏目开关','','cn','345');
INSERT INTO met_templates VALUES('347','metv75','3','16','4','3','$M$开启$T$1$M$关闭$T$0','sidebar_downloadlist_ok','','1','侧栏文章列表开关','','cn','345');
INSERT INTO met_templates VALUES('348','metv75','3','13','4','3','$M$全部$T$all$M$推荐$T$com','download_bar_list_type','','all','侧栏列表下载类型','','cn','345');
INSERT INTO met_templates VALUES('349','metv75','3','11','2','3','','download_bar_list_title','','为你推荐','侧栏下载列表标题','','cn','345');
INSERT INTO met_templates VALUES('350','metv75','3','14','4','3','$M$开启$T$1$M$关闭$T$0','download_column3_ok','','1','三级栏目开关','','cn','345');
INSERT INTO met_templates VALUES('351','metv75','3','12','2','3','','sidebar_downloadlist_num','','5','侧栏下载列表数量','','cn','345');
INSERT INTO met_templates VALUES('352','metv75','2','3','1','3','','met_img','','','图片模块','','cn','0');
INSERT INTO met_templates VALUES('353','metv75','2','4','4','3','$M$浏览模式$T$1$M$详情模式$T$0','img_listlook_style','','1','查看模式','浏览模式为在列表页浏览图片，详情模式为点击进入详情页','cn','352');
INSERT INTO met_templates VALUES('354','metv75','2','7','1','3','','subcolumn_nav','','','子栏目设置','','cn','0');
INSERT INTO met_templates VALUES('355','metv75','2','8','4','3','$M$开启$T$1$M$关闭$T$0','tagshow_2','1','1','区块开关','','cn','354');
INSERT INTO met_templates VALUES('356','metv75','0','7','1','3','','met_position','','','当前位置','','cn','0');
INSERT INTO met_templates VALUES('357','metv75','0','8','2','3','','position_text','','你的位置','当前位置标题','','cn','356');
INSERT INTO met_templates VALUES('358','metv75','0','9','4','3','$M$开启$T$1$M$关闭$T$0','tagshow_1','','1','区域开关','','cn','356');
INSERT INTO met_templates VALUES('359','metv75','3','17','1','3','','img_bar','','','图片模块','','cn','0');
INSERT INTO met_templates VALUES('360','metv75','3','20','4','3','$M$全部$T$all$M$推荐$T$com','img_bar_list_type','','all','侧栏列表图片类型','','cn','359');
INSERT INTO met_templates VALUES('361','metv75','3','19','2','3','','img_bar_list_title','','为您推荐','侧栏图片列表标题','','cn','359');
INSERT INTO met_templates VALUES('362','metv75','3','18','4','3','$M$开启$T$1$M$关闭$T$0','img_bar_list_open','','1','侧栏图片列表开关','','cn','359');
INSERT INTO met_templates VALUES('363','metv75','3','22','4','3','$M$开启$T$1$M$关闭$T$0','imgbar_column_open','','1','侧栏栏目开关','','cn','359');
INSERT INTO met_templates VALUES('364','metv75','3','21','2','3','','img_bar_list_num','','5','侧栏列表图片数量','','cn','359');
INSERT INTO met_templates VALUES('365','metv75','3','23','4','3','$M$开启$T$1$M$关闭$T$0','img_column3_ok','','1','三级栏目开关','','cn','359');
INSERT INTO met_templates VALUES('366','metv75','3','24','1','3','','product_bar','','','产品模块侧边栏','','cn','0');
INSERT INTO met_templates VALUES('367','metv75','3','28','4','3','当前一级栏目内容列表$T$1$M$TAG标签聚合$T$0','product_sidebar_content','1','1','调用内容','默认调用当前栏目内容列表','cn','366');
INSERT INTO met_templates VALUES('368','metv75','3','25','2','3','','product_sidebar_piclist_title','相关推荐','热门推荐','区块标题','','cn','366');
INSERT INTO met_templates VALUES('369','metv75','3','26','2','3','','product_sidebar_piclist_num','4','5','调用条数','','cn','366');
INSERT INTO met_templates VALUES('370','metv75','3','27','4','3','$M$全部$T$all$M$推荐$T$com','product_sidebar_piclist_type','all','all','调用类型','','cn','366');
INSERT INTO met_templates VALUES('371','metv75','0','30','1','3','','banner','','','banner设置','','cn','0');
INSERT INTO met_templates VALUES('372','metv75','0','31','4','3','$M$提示$T$1','info','1','1','提示','此banner是图片不适合设置高度，如果觉得banner尺寸不合适请更换banner尺寸','cn','371');
INSERT INTO met_templates VALUES('373','metv75','0','32','9','3','','page_top_bgcolor','#ffffff','#ccc','内页无banner背景色','','cn','371');
INSERT INTO met_templates VALUES('374','metv75','0','33','9','3','','bannersub_color','#0c0d0d','#fff','内页无banner字体色','','cn','371');
INSERT INTO met_templates VALUES('375','metv75','0','34','2','3','','btn_margin','5','5','电脑端按钮之间的边距','默认为5px','cn','371');
INSERT INTO met_templates VALUES('376','metv75','0','35','2','3','','mbtn_margin','5','5','手机端按钮之间的边距','默认为5px','cn','371');
INSERT INTO met_templates VALUES('377','metv75','1','26','1','3','','met_index_news','','','首页新闻区块','','cn','0');
INSERT INTO met_templates VALUES('378','metv75','1','34','2','3','','home_product_img_h','130','130','图片风格下右边小缩略图高','默认为130px','cn','377');
INSERT INTO met_templates VALUES('379','metv75','1','33','2','3','','home_product_img_w','210','210','图片风格下右边小缩略图宽','默认为210px','cn','377');
INSERT INTO met_templates VALUES('380','metv75','1','30','2','3','','home_news_num','4','4','调用条数','默认4条,仅为无图模式生效，有图模式固定调用4条','cn','377');
INSERT INTO met_templates VALUES('381','metv75','1','32','2','3','','home_news_img_maxnum','54','54','描述文字字数限制','默认为54个字符','cn','377');
INSERT INTO met_templates VALUES('382','metv75','1','29','6','3','','home_news1','128','4','调用栏目','调用当前栏目的内容列表','cn','377');
INSERT INTO met_templates VALUES('385','metv75','1','27','2','3','','index_news_title','新闻资讯','标题','区块标题','填0隐藏','cn','377');
INSERT INTO met_templates VALUES('386','metv75','1','31','4','3','$M$全部$T$all$M$推荐$T$com','home_news_type','all','all','调用类型','','cn','377');
INSERT INTO met_templates VALUES('387','metv75','1','28','3','3','','index_news_desc','Latest news and information','描述','区块描述','填0隐藏','cn','377');
INSERT INTO met_templates VALUES('388','metv75','0','1','1','3','','met_head','','','顶部设置','','cn','0');
INSERT INTO met_templates VALUES('390','metv75','0','6','4','3','$M$开启$T$1$M$关闭$T$0','langlist1_icon_ok','1','1','语言国旗开关','','cn','388');
INSERT INTO met_templates VALUES('391','metv75','0','3','2','3','','nav_ml','10','10','导航间距','默认是10，仅支持5的倍数（0/5/10/15/20...最大50）<br/>不同网站的导航数量不同，根据需求适当调整间距，让网站更协调。','cn','388');
INSERT INTO met_templates VALUES('392','metv75','0','2','4','3','$M$开启$T$1$M$关闭$T$0','navbarok','1','1','下拉菜单','','cn','388');
INSERT INTO met_templates VALUES('393','metv75','0','4','2','3','','nav_all','全部','全部','移动端下拉菜单全部','仅在手机端显示，简介模块不展示，填0隐藏','cn','388');
INSERT INTO met_templates VALUES('394','metv75','0','5','4','3','$M$头部$T$1$M$底部$T$0','langlist_position','1','1','多语言位置','','cn','388');
INSERT INTO met_templates VALUES('395','metv75','0','21','1','3','','global','','','全局参数','','cn','0');
INSERT INTO met_templates VALUES('396','metv75','0','26','2','3','','search_placeholder','请输入内容关键词','请输入内容关键词','搜索文字','','cn','395');
INSERT INTO met_templates VALUES('397','metv75','0','23','2','3','','sub_all','全部','全部','页面文字','','cn','395');
INSERT INTO met_templates VALUES('398','metv75','0','27','9','3','','first_color','#0c0d0d','#000000','模板主色调','','cn','395');
INSERT INTO met_templates VALUES('399','metv75','0','29','4','3','当前窗口打开$T$target=_self$M$新窗口打开$T$target=_blank','urlnew','target=_self','target=_self','内容列表链接打开方式','列表页链接打开方式可在栏目管理中对每个栏目进行单独设置','cn','395');
INSERT INTO met_templates VALUES('400','metv75','0','25','2','3','','nodata','没有数据了','没有数据了','无数据提示','','cn','395');
INSERT INTO met_templates VALUES('401','metv75','0','24','2','3','','page_ajax_next','加载更多','加载更多','分页文字','无刷新分页默认文字','cn','395');
INSERT INTO met_templates VALUES('402','metv75','0','22','2','3','','met_font','','','页面字体','非特殊语种，建议留空使用模板默认字体','cn','395');
INSERT INTO met_templates VALUES('403','metv75','2','5','1','3','','met_job','','','招聘模块','','cn','0');
INSERT INTO met_templates VALUES('404','metv75','2','6','2','3','','cvtitle','在线应聘','在线应聘','按钮文字','','cn','403');
INSERT INTO met_templates VALUES('405','metv75','1','1','1','3','','met_index_product','','','首页产品区块','','cn','0');
INSERT INTO met_templates VALUES('406','metv75','1','2','2','3','','index_product_title','产品中心','标题','区块标题','填0隐藏','cn','405');
INSERT INTO met_templates VALUES('407','metv75','1','3','3','3','','index_product_desc','PRODUCT','描述','区块描述','填0隐藏','cn','405');
INSERT INTO met_templates VALUES('463','metv75','1','9','2','3','','index_product_moretext','了解更多+','了解更多+','了解更多按钮文本','填0隐藏','cn','405');
INSERT INTO met_templates VALUES('409','metv75','1','4','6','3','','index_product_id','127','','调用栏目','调用指定栏目下的子栏目的图片，标题，描述，及该栏目下列表的图片，标题','cn','405');
INSERT INTO met_templates VALUES('464','metv75','1','10','2','3','','index_product_img_w1','350','350','右侧列表缩略图宽','默认为350px','cn','405');
INSERT INTO met_templates VALUES('465','metv75','1','11','2','3','','index_product_img_h1','328','328','右侧列表缩略图高','默认为328px','cn','405');
INSERT INTO met_templates VALUES('414','metv75','1','5','2','3','','index_product_allnum','4','4','调用导航栏目条数','建议4个','cn','405');
INSERT INTO met_templates VALUES('415','metv75','1','6','4','3','全部$T$all$M$推荐$T$com','index_product_type','all','all','列表调用类型','列表信息调用类型，【推荐】可以在添加或管理文章列表时设置。','cn','405');
INSERT INTO met_templates VALUES('416','metv75','1','8','2','3','','index_product_img_h','500','500','左侧子栏目缩略图高','默认为500px','cn','405');
INSERT INTO met_templates VALUES('417','metv75','1','7','2','3','','index_product_img_w','800','800','左侧子栏目缩略图宽','默认为800px','cn','405');
INSERT INTO met_templates VALUES('418','metv75','1','17','1','3','','met_index_case','','','首页合作伙伴','','cn','0');
INSERT INTO met_templates VALUES('419','metv75','1','18','2','3','','home_case_title','成功案例','标题','区块标题','填0隐藏','cn','418');
INSERT INTO met_templates VALUES('420','metv75','1','19','2','3','','home_case_desc','CASE','描述','区块描述','填0隐藏','cn','418');
INSERT INTO met_templates VALUES('421','metv75','1','21','2','3','','home_case_num','8','8','调用条数','默认调用8条','cn','418');
INSERT INTO met_templates VALUES('422','metv75','1','20','6','3','','home_case_id','130','','栏目选择','','cn','418');
INSERT INTO met_templates VALUES('423','metv75','1','22','4','3','全部$T$all$M$推荐$T$com','home_case_type','all','all','调用类型','','cn','418');
INSERT INTO met_templates VALUES('424','metv75','1','23','4','3','纯展示$T$0$M$超链接$T$1','home_case_linkok','1','1','展示方式','默认为超链接','cn','418');
INSERT INTO met_templates VALUES('425','metv75','1','24','2','3','','home_case_imgw','800','800','缩略图宽','默认为800px','cn','418');
INSERT INTO met_templates VALUES('426','metv75','1','25','2','3','','home_case_imgh','500','500','缩略图高','默认为500px','cn','418');
INSERT INTO met_templates VALUES('468','metv75','1','37','2','3','','home_product_img_h1','500','500','图片风格下左边缩略图宽','默认为500px','cn','377');
INSERT INTO met_templates VALUES('467','metv75','1','36','2','3','','home_product_img_w1','800','800','图片风格下左边缩略图宽','默认为800px','cn','377');
INSERT INTO met_templates VALUES('466','metv75','1','35','4','3','无图风格$T$1$M$有图风格$T$0','index_news_mytype','1','1','展示风格','默认无图风格','cn','377');
INSERT INTO met_templates VALUES('431','metv75','1','12','1','3','','met_index_about','','','首页简介区块','','cn','0');
INSERT INTO met_templates VALUES('432','metv75','1','13','2','3','','home_about_title','关于我们','标题','区块标题','填0隐藏','cn','431');
INSERT INTO met_templates VALUES('433','metv75','1','14','2','3','','home_about_desc','About us and company introduction','描述','区块描述','填0隐藏','cn','431');
INSERT INTO met_templates VALUES('434','metv75','1','15','8','3','','home_about_content','<div microsoft=\"\" white-space:=\"\" style=\"text-align: left;\"><p style=\"text-indent: 0em;\"><span style=\"text-align:center;font-size: 14px; text-indent: 0em;\"><img src=\"../upload/202109/1631599054743513.jpg\" data-width=\"610\" data-height=\"490\" title=\"1631599054743513.jpg\" style=\"font-size: 14px; text-align: center; white-space: normal; float: right; width: 501px; height: 396px;\" width=\"501\" height=\"396\" alt=\"关于我们.jpg\"/>长沙米拓信息技术有限公司成立于 2009 年 6 月，是一家专注于「为中小企业提供信息化服务」的软件企业。</span></p><p style=\"text-indent: 0em;\"><span style=\"font-size: 14px;\">公司一直围绕互联网相关软件进行自主开发和运营，旗下主打产品平台有：米拓建站、米拓单页制作平台、米拓流程管理系统。</span></p><p style=\"text-indent: 0em;\"><strong><span style=\"font-size: 14px;\">米拓企业建站系统支持将1个网站内容轻松同步到10种终端展示（电脑、手机、平板、微官网、微信小程序、百度小程序、支付宝小程序、字节跳动小程序[今日头条、抖音]、360小程序、QQ小程序），开源免费，适合用于搭建专业的网站。</span></strong></p><p style=\"text-indent: 0em;\"><span style=\"font-size: 14px;\">我们自创业之初就自主研发了一款免费开源的企业级 CMS ——米拓企业建站系统（MetInfo ），并且以 MetInfo 为核心产品一直不断更新研发至今，致力于打造中小企业优质的互联网信息化工具供应平台。</span></p><p style=\"text-indent: 0em;\"><span style=\"font-size: 14px;\">米拓企业建站系统的愿景是任何中小企业和个人能够轻松基于 MetInfo 搭建高品质的企业门户网站（不需要任何专业技能）；我们不夹杂当前网站建设行业乱象，提供「清澈透明实惠」的价格和优质的售后服务。</span></p></div>','','区块内容','','cn','431');
INSERT INTO met_templates VALUES('435','metv75','3','1','1','3','','news_bar','','','文章模块','','cn','0');
INSERT INTO met_templates VALUES('436','metv75','3','7','2','3','','sidebar_newslist_num','3','3','侧栏列表数量','','cn','435');
INSERT INTO met_templates VALUES('437','metv75','3','8','4','3','$M$全部$T$all$M$推荐$T$com','news_bar_list_type','all','all','侧栏列表类型','','cn','435');
INSERT INTO met_templates VALUES('438','metv75','3','2','4','3','$M$开启$T$1$M$关闭$T$0','bar_column3_open','1','1','三级栏目开关','除开产品模块以外的侧栏','cn','435');
INSERT INTO met_templates VALUES('439','metv75','3','4','4','3','$M$开启$T$1$M$关闭$T$0','news_bar_list_open','1','1','侧栏列表开关','','cn','435');
INSERT INTO met_templates VALUES('440','metv75','3','3','4','3','$M$开启$T$1$M$关闭$T$0','bar_column_open','1','1','侧栏栏目开关','除开产品模块以外的侧栏','cn','435');
INSERT INTO met_templates VALUES('441','metv75','3','5','2','3','','news_bar_list_title','为您推荐','为您推荐','侧栏文章列表标题','','cn','435');
INSERT INTO met_templates VALUES('442','metv75','2','1','1','3','','met_download','','','下载模块','','cn','0');
INSERT INTO met_templates VALUES('443','metv75','2','2','2','3','','download','','立即下载','按钮文字','','cn','442');
INSERT INTO met_templates VALUES('444','metv75','0','36','1','3','','met_contact','','','底部联系信息设置','','cn','0');
INSERT INTO met_templates VALUES('445','metv75','0','53','2','3','','footinfo_email','','','邮箱地址','','cn','444');
INSERT INTO met_templates VALUES('446','metv75','0','52','4','3','$M$开启$T$1$M$关闭$T$0','footinfo_emailok','0','0','邮箱','','cn','444');
INSERT INTO met_templates VALUES('447','metv75','0','51','2','3','','footinfo_facebook','','','Facebook网址','','cn','444');
INSERT INTO met_templates VALUES('448','metv75','0','48','4','3','$M$开启$T$1$M$关闭$T$0','footinfo_googleok','0','0','google+','','cn','444');
INSERT INTO met_templates VALUES('449','metv75','0','50','4','3','$M$开启$T$1$M$关闭$T$0','footinfo_facebookok','0','0','Facebook','','cn','444');
INSERT INTO met_templates VALUES('450','metv75','0','47','2','3','','footinfo_twitter','','','twitter网址','','cn','444');
INSERT INTO met_templates VALUES('451','metv75','0','46','4','3','$M$开启$T$1$M$关闭$T$0','footinfo_twitterok','0','0','twitter（推特）','','cn','444');
INSERT INTO met_templates VALUES('452','metv75','0','45','2','3','','footinfo_sina','https://weibo.com/metinfo','','新浪微博网址','请输入微博网址','cn','444');
INSERT INTO met_templates VALUES('453','metv75','0','44','4','3','$M$开启$T$1$M$关闭$T$0','footinfo_sina_ok','1','1','新浪微博','','cn','444');
INSERT INTO met_templates VALUES('454','metv75','0','43','2','3','','footinfo_qq','0731-85514433','','QQ号码','点击QQ链接可直接对话，需要先到 shang.qq.com 免费开通。<br/>企业营销QQ 无需开通','cn','444');
INSERT INTO met_templates VALUES('455','metv75','0','42','4','3','$M$个人QQ$T$1$M$企业营销QQ$T$2','foot_info_qqtype','2','1','QQ类型','个人QQ和企业营销QQ超链接结构不一样，因此请务必选择正确。','cn','444');
INSERT INTO met_templates VALUES('456','metv75','0','41','4','3','$M$开启$T$1$M$关闭$T$0','footinfo_qq_ok','1','1','QQ','','cn','444');
INSERT INTO met_templates VALUES('457','metv75','0','39','4','3','$M$开启$T$1$M$关闭$T$0','footinfo_wx_ok','1','1','微信','','cn','444');
INSERT INTO met_templates VALUES('458','metv75','0','49','2','3','','footinfo_google','','','google+网址','','cn','444');
INSERT INTO met_templates VALUES('459','metv75','0','38','2','3','','footinfo_dsc','0731-85514433','','描述文字','填0隐藏','cn','444');
INSERT INTO met_templates VALUES('460','metv75','0','37','2','3','','footinfo_tel','联系我们','联系我们','联系我们','填0隐藏','cn','444');
INSERT INTO met_templates VALUES('461','metv75','0','40','7','3','','footinfo_wx','../upload/202109/1631611753.jpg','','微信二维码','','cn','444');
INSERT INTO met_templates VALUES('462','metv75','0','28','9','3','','thirdcolor','#298dff','#1baadb','模板配色调','','cn','395');
INSERT INTO met_templates VALUES('469','metv75','0','15','9','3','','bg_color','#292e44','#292e44','背景颜色','默认#292e44','cn','338');
INSERT INTO met_templates VALUES('470','metv75','0','16','2','3','','aboutus_text','关注我们','关注我们','关注我们文字','','cn','338');
INSERT INTO met_templates VALUES('471','metv75','0','17','2','3','','erweima_one','关注公众号','订阅“公众号”','第一个二维码标题','','cn','338');
INSERT INTO met_templates VALUES('472','metv75','0','18','2','3','','erweima_two','添加小程序','扫码咨询','第二个二维码标题','','cn','338');
INSERT INTO met_templates VALUES('473','metv75','0','19','2','3','','wooktime_text','周一至周五 09：00-18：00','周一至周五 09：00-18：00','工作时间文字','填0则整行隐藏','cn','338');
INSERT INTO met_templates VALUES('474','metv75','2','9','2','3','','all','0','全部','全部文字','填0隐藏','cn','354');
INSERT INTO met_templates VALUES('475','metv75','2','12','1','3','','para_search','','','搜索模块','','cn','0');
INSERT INTO met_templates VALUES('476','metv75','2','13','4','3','非全屏$T$1$M$全屏$T$0','type','','1','是否全屏展示','默认非全屏','cn','475');
INSERT INTO met_templates VALUES('477','metv75','2','14','4','3','开启$T$1$M$关闭$T$0','attr_ok','','1','参数开关','默认开启','cn','475');
INSERT INTO met_templates VALUES('478','metv75','2','15','4','3','开启$T$1$M$关闭$T$0','sort_ok','','1','排序开关','默认开启','cn','475');
INSERT INTO met_templates VALUES('479','metv75','3','9','2','3','','all','全部','全部','全部文字','','cn','435');
INSERT INTO met_templates VALUES('480','metv75','3','6','6','3','','sidebar_newslist_idid','130','','图文列表调用选择','','cn','435');
INSERT INTO met_templates VALUES('481','metv75','2','16','1','3','','met_product','','','产品列表','','cn','0');
INSERT INTO met_templates VALUES('618','metv75','0','20','7','3','','footinfo_wx2','../upload/202109/1631611502.jpg','','第二个二维码','建议尺寸112*112','cn','338');
INSERT INTO met_templates VALUES('619','metv75','1','16','7','3','','uiBgImage','../upload/202109/1631611567.jpg','','区块背景图','建议宽度1920，高度自适应，移动端截取中间展示','cn','431');
INSERT INTO met_templates VALUES('623','metv75','3','29','2','3','','product_hottitle','关联内容','热门推荐','热门推荐文字','','cn','366');
INSERT INTO met_templates VALUES('581','metv75','1','15','8','3','','home_about_content','<div microsoft=\"\" white-space:=\"\" style=\"text-align: left;\"><p style=\"text-indent: 0em;\"><span style=\"text-align:center;font-size: 14px; text-indent: 0em;\"><img src=\"../upload/202109/1631599037199493.jpg\" data-width=\"610\" data-height=\"490\" title=\"1631599037199493.jpg\" style=\"font-size: 14px; text-align: center; white-space: normal; float: right; width: 501px; height: 396px;\" width=\"501\" height=\"396\" alt=\"关于我们.jpg\"/></span></p><p>Changsha Mituo Information Technology Co., LTD., founded in June 2009, is a high-tech enterprise and double-soft certification enterprise focusing on &quot;providing information services for small and medium-sized enterprises&quot;.</p><p>The company has been around the Internet related software independent development and operation, its main product platforms are: Mito build station, Mito single page production platform, Mito process management system.</p><p><strong>米拓企业建站系统 support 1 content easily synchronized to 10 kinds of terminal display (computer, mobile phone, tablet, micro website, WeChat applet, baidu small programs, pay treasure to small procedures, bytes to beat small [today&#39;s headlines, trill], 360 small programs, QQ small program), free, open source suitable for use in building professional websites.</strong></p><p>Since the beginning of our business, we have independently developed a free and open source enterprise CMS -- MetInfo Enterprise Website Building System (MetInfo), and with MetInfo as the core product has been constantly updated and developed, committed to creating a high-quality Internet information tool supply platform for small and medium-sized enterprises.</p><p style=\"text-indent: 0em;\"><span style=\"font-size: 14px;\"></span><br/></p></div>','','区块内容','','en','578');
INSERT INTO met_templates VALUES('580','metv75','1','14','2','3','','home_about_desc','关于我们','描述','区块描述','填0隐藏','en','578');
INSERT INTO met_templates VALUES('579','metv75','1','13','2','3','','home_about_title','About us','标题','区块标题','填0隐藏','en','578');
INSERT INTO met_templates VALUES('578','metv75','1','12','1','3','','met_index_about','','','首页简介区块','','en','0');
INSERT INTO met_templates VALUES('576','metv75','1','23','2','3','','home_case_imgw','800','422','缩略图宽','默认为422px','en','569');
INSERT INTO met_templates VALUES('577','metv75','1','24','2','3','','home_case_imgh','500','415','缩略图高','默认为415px','en','569');
INSERT INTO met_templates VALUES('575','metv75','1','22','4','3','纯展示$T$0$M$超链接$T$1','home_case_linkok','1','1','展示方式','默认为超链接','en','569');
INSERT INTO met_templates VALUES('574','metv75','1','21','4','3','全部$T$all$M$推荐$T$com','home_case_type','all','all','调用类型','','en','569');
INSERT INTO met_templates VALUES('573','metv75','1','19','6','3','','home_case_id','157','','栏目选择','','en','569');
INSERT INTO met_templates VALUES('572','metv75','1','20','2','3','','home_case_num','6','8','调用条数','默认调用8条','en','569');
INSERT INTO met_templates VALUES('571','metv75','1','18','2','3','','home_case_desc','成功案例','描述','区块描述','填0隐藏','en','569');
INSERT INTO met_templates VALUES('570','metv75','1','17','2','3','','home_case_title','CASE','标题','区块标题','填0隐藏','en','569');
INSERT INTO met_templates VALUES('569','metv75','1','16','1','3','','met_index_case','','','首页合作伙伴','','en','0');
INSERT INTO met_templates VALUES('568','metv75','1','7','2','3','','index_product_img_w','582','582','左侧子栏目缩略图宽','默认为582px','en','558');
INSERT INTO met_templates VALUES('567','metv75','1','8','2','3','','index_product_img_h','670','670','左侧子栏目缩略图高','默认为670px','en','558');
INSERT INTO met_templates VALUES('566','metv75','1','6','4','3','全部$T$all$M$推荐$T$com','index_product_type','all','all','列表调用类型','列表信息调用类型，【推荐】可以在添加或管理文章列表时设置。','en','558');
INSERT INTO met_templates VALUES('565','metv75','1','5','2','3','','index_product_allnum','4','4','调用导航栏目条数','建议4个','en','558');
INSERT INTO met_templates VALUES('564','metv75','1','11','2','3','','index_product_img_h1','328','328','右侧列表缩略图高','默认为328px','en','558');
INSERT INTO met_templates VALUES('563','metv75','1','10','2','3','','index_product_img_w1','350','350','右侧列表缩略图宽','默认为350px','en','558');
INSERT INTO met_templates VALUES('562','metv75','1','4','6','3','','index_product_id','148','','调用栏目','调用指定栏目下的子栏目的图片，标题，描述，及该栏目下列表的图片，标题','en','558');
INSERT INTO met_templates VALUES('561','metv75','1','9','2','3','','index_product_moretext','More +','了解更多+','了解更多按钮文本','填0隐藏','en','558');
INSERT INTO met_templates VALUES('560','metv75','1','3','3','3','','index_product_desc','产品中心','描述','区块描述','填0隐藏','en','558');
INSERT INTO met_templates VALUES('559','metv75','1','2','2','3','','index_product_title','PRODUCT','标题','区块标题','填0隐藏','en','558');
INSERT INTO met_templates VALUES('558','metv75','1','1','1','3','','met_index_product','','','首页产品区块','','en','0');
INSERT INTO met_templates VALUES('556','metv75','2','5','1','3','','met_job','','','招聘模块','','en','0');
INSERT INTO met_templates VALUES('557','metv75','2','6','2','3','','cvtitle','在线应聘','在线应聘','按钮文字','','en','556');
INSERT INTO met_templates VALUES('555','metv75','0','27','9','3','','thirdcolor','#298dff','#1baadb','模板配色调','','en','547');
INSERT INTO met_templates VALUES('554','metv75','0','21','2','3','','met_font','','','页面字体','非特殊语种，建议留空使用模板默认字体','en','547');
INSERT INTO met_templates VALUES('553','metv75','0','23','2','3','','page_ajax_next','加载更多','加载更多','分页文字','无刷新分页默认文字','en','547');
INSERT INTO met_templates VALUES('552','metv75','0','24','2','3','','nodata','没有数据了','没有数据了','无数据提示','','en','547');
INSERT INTO met_templates VALUES('551','metv75','0','28','4','3','当前窗口打开$T$target=_self$M$新窗口打开$T$target=_blank','urlnew','target=_self','target=_self','内容列表链接打开方式','列表页链接打开方式可在栏目管理中对每个栏目进行单独设置','en','547');
INSERT INTO met_templates VALUES('549','metv75','0','22','2','3','','sub_all','全部','全部','页面文字','','en','547');
INSERT INTO met_templates VALUES('550','metv75','0','26','9','3','','first_color','#0c0d0d','#000000','模板主色调','','en','547');
INSERT INTO met_templates VALUES('548','metv75','0','25','2','3','','search_placeholder','请输入内容关键词','请输入内容关键词','搜索文字','','en','547');
INSERT INTO met_templates VALUES('547','metv75','0','20','1','3','','global','','','全局参数','','en','0');
INSERT INTO met_templates VALUES('546','metv75','0','5','4','3','$M$头部$T$1$M$底部$T$0','langlist_position','1','1','多语言位置','','en','541');
INSERT INTO met_templates VALUES('545','metv75','0','4','2','3','','nav_all','全部','全部','移动端下拉菜单全部','仅在手机端显示，简介模块不展示，填0隐藏','en','541');
INSERT INTO met_templates VALUES('544','metv75','0','2','4','3','$M$开启$T$1$M$关闭$T$0','navbarok','1','1','下拉菜单','','en','541');
INSERT INTO met_templates VALUES('543','metv75','0','3','2','3','','nav_ml','10','10','导航间距','默认是10，仅支持5的倍数（0/5/10/15/20...最大50）<br/>不同网站的导航数量不同，根据需求适当调整间距，让网站更协调。','en','541');
INSERT INTO met_templates VALUES('542','metv75','0','6','4','3','$M$开启$T$1$M$关闭$T$0','langlist1_icon_ok','1','1','语言国旗开关','','en','541');
INSERT INTO met_templates VALUES('541','metv75','0','1','1','3','','met_head','','','顶部设置','','en','0');
INSERT INTO met_templates VALUES('540','metv75','1','34','4','3','无图风格$T$1$M$有图风格$T$0','index_news_mytype','0','1','展示风格','默认无图风格','en','529');
INSERT INTO met_templates VALUES('539','metv75','1','35','2','3','','home_product_img_w1','800','636','图片风格下左边缩略图宽','默认为636px','en','529');
INSERT INTO met_templates VALUES('538','metv75','1','36','2','3','','home_product_img_h1','500','491','图片风格下左边缩略图宽','默认为491px','en','529');
INSERT INTO met_templates VALUES('537','metv75','1','27','3','3','','index_news_desc','新闻资讯','描述','区块描述','填0隐藏','en','529');
INSERT INTO met_templates VALUES('536','metv75','1','30','4','3','$M$全部$T$all$M$推荐$T$com','home_news_type','all','all','调用类型','','en','529');
INSERT INTO met_templates VALUES('535','metv75','1','26','2','3','','index_news_title','News and information','标题','区块标题','填0隐藏','en','529');
INSERT INTO met_templates VALUES('534','metv75','1','28','6','3','','home_news1','152','4','调用栏目','调用当前栏目的内容列表','en','529');
INSERT INTO met_templates VALUES('533','metv75','1','31','2','3','','home_news_img_maxnum','54','54','描述文字字数限制','默认为54个字符','en','529');
INSERT INTO met_templates VALUES('532','metv75','1','29','2','3','','home_news_num','4','6','调用条数','默认6条,仅为无图模式生效，有图模式固定调用4条','en','529');
INSERT INTO met_templates VALUES('531','metv75','1','32','2','3','','home_product_img_w','210','210','图片风格下右边小缩略图宽','默认为210px','en','529');
INSERT INTO met_templates VALUES('530','metv75','1','33','2','3','','home_product_img_h','130','130','图片风格下右边小缩略图高','默认为130px','en','529');
INSERT INTO met_templates VALUES('529','metv75','1','25','1','3','','met_index_news','','','首页新闻区块','','en','0');
INSERT INTO met_templates VALUES('528','metv75','0','34','2','3','','mbtn_margin','5','5','手机端按钮之间的边距','默认为5px','en','523');
INSERT INTO met_templates VALUES('527','metv75','0','33','2','3','','btn_margin','5','5','电脑端按钮之间的边距','默认为5px','en','523');
INSERT INTO met_templates VALUES('526','metv75','0','32','9','3','','bannersub_color','#0c0d0d','#fff','内页无banner字体色','','en','523');
INSERT INTO met_templates VALUES('525','metv75','0','31','9','3','','page_top_bgcolor','#ffffff','#ccc','内页无banner背景色','','en','523');
INSERT INTO met_templates VALUES('524','metv75','0','30','4','3','$M$提示$T$1','info','1','1','提示','此banner是图片不适合设置高度，如果觉得banner尺寸不合适请更换banner尺寸','en','523');
INSERT INTO met_templates VALUES('523','metv75','0','29','1','3','','banner','','','banner设置','','en','0');
INSERT INTO met_templates VALUES('522','metv75','3','27','4','3','$M$全部$T$all$M$推荐$T$com','product_sidebar_piclist_type','all','all','调用类型','','en','518');
INSERT INTO met_templates VALUES('521','metv75','3','26','2','3','','product_sidebar_piclist_num','4','5','调用条数','','en','518');
INSERT INTO met_templates VALUES('510','metv75','0','9','4','3','$M$开启$T$1$M$关闭$T$0','tagshow_1','','1','区域开关','','en','508');
INSERT INTO met_templates VALUES('511','metv75','3','17','1','3','','img_bar','','','图片模块','','en','0');
INSERT INTO met_templates VALUES('512','metv75','3','20','4','3','$M$全部$T$all$M$推荐$T$com','img_bar_list_type','','all','侧栏列表图片类型','','en','511');
INSERT INTO met_templates VALUES('513','metv75','3','19','2','3','','img_bar_list_title','','为您推荐','侧栏图片列表标题','','en','511');
INSERT INTO met_templates VALUES('514','metv75','3','18','4','3','$M$开启$T$1$M$关闭$T$0','img_bar_list_open','','1','侧栏图片列表开关','','en','511');
INSERT INTO met_templates VALUES('515','metv75','3','22','4','3','$M$开启$T$1$M$关闭$T$0','imgbar_column_open','','1','侧栏栏目开关','','en','511');
INSERT INTO met_templates VALUES('516','metv75','3','21','2','3','','img_bar_list_num','','5','侧栏列表图片数量','','en','511');
INSERT INTO met_templates VALUES('517','metv75','3','23','4','3','$M$开启$T$1$M$关闭$T$0','img_column3_ok','','1','三级栏目开关','','en','511');
INSERT INTO met_templates VALUES('518','metv75','3','24','1','3','','product_bar','','','产品模块侧边栏','','en','0');
INSERT INTO met_templates VALUES('519','metv75','3','28','4','3','当前一级栏目内容列表$T$1$M$TAG标签聚合$T$0','product_sidebar_content','1','1','调用内容','默认调用当前栏目内容列表','en','518');
INSERT INTO met_templates VALUES('520','metv75','3','25','2','3','','product_sidebar_piclist_title','Recommend','热门推荐','区块标题','','en','518');
INSERT INTO met_templates VALUES('509','metv75','0','8','2','3','','position_text','','你的位置','当前位置标题','','en','508');
INSERT INTO met_templates VALUES('508','metv75','0','7','1','3','','met_position','','','当前位置','','en','0');
INSERT INTO met_templates VALUES('507','metv75','2','9','2','3','','all','0','全部','全部文字','填0隐藏','en','505');
INSERT INTO met_templates VALUES('506','metv75','2','8','4','3','$M$开启$T$1$M$关闭$T$0','tagshow_2','1','1','区块开关','','en','505');
INSERT INTO met_templates VALUES('505','metv75','2','7','1','3','','subcolumn_nav','','','子栏目设置','','en','0');
INSERT INTO met_templates VALUES('503','metv75','2','3','1','3','','met_img','','','图片模块','','en','0');
INSERT INTO met_templates VALUES('504','metv75','2','4','4','3','$M$浏览模式$T$1$M$详情模式$T$0','img_listlook_style','','1','查看模式','浏览模式为在列表页浏览图片，详情模式为点击进入详情页','en','503');
INSERT INTO met_templates VALUES('502','metv75','3','12','2','3','','sidebar_downloadlist_num','','5','侧栏下载列表数量','','en','496');
INSERT INTO met_templates VALUES('501','metv75','3','14','4','3','$M$开启$T$1$M$关闭$T$0','download_column3_ok','','1','三级栏目开关','','en','496');
INSERT INTO met_templates VALUES('500','metv75','3','11','2','3','','download_bar_list_title','','为你推荐','侧栏下载列表标题','','en','496');
INSERT INTO met_templates VALUES('499','metv75','3','13','4','3','$M$全部$T$all$M$推荐$T$com','download_bar_list_type','','all','侧栏列表下载类型','','en','496');
INSERT INTO met_templates VALUES('498','metv75','3','16','4','3','$M$开启$T$1$M$关闭$T$0','sidebar_downloadlist_ok','','1','侧栏文章列表开关','','en','496');
INSERT INTO met_templates VALUES('497','metv75','3','15','4','3','$M$开启$T$1$M$关闭$T$0','downloadsidebar_column_ok','','1','侧栏栏目开关','','en','496');
INSERT INTO met_templates VALUES('496','metv75','3','10','1','3','','downlaod_bar','','','下载模块','','en','0');
INSERT INTO met_templates VALUES('495','metv75','2','11','4','3','$M$开启$T$1$M$关闭$T$0','news_imgok','','1','图片开关','','en','494');
INSERT INTO met_templates VALUES('494','metv75','2','10','1','3','','met_news','','','文章模块','','en','0');
INSERT INTO met_templates VALUES('493','metv75','0','19','2','3','','wooktime_text','Monday to Friday 09：00-18：00','周一至周五 09：00-18：00','工作时间文字','填0则整行隐藏','en','484');
INSERT INTO met_templates VALUES('492','metv75','0','18','2','3','','erweima_two','Add applets','扫码咨询','第二个二维码标题','','en','484');
INSERT INTO met_templates VALUES('491','metv75','0','17','2','3','','erweima_one','Follow public account','订阅“公众号”','第一个二维码标题','','en','484');
INSERT INTO met_templates VALUES('490','metv75','0','16','2','3','','aboutus_text','Pay attention to us','关注我们','关注我们文字','','en','484');
INSERT INTO met_templates VALUES('489','metv75','0','15','9','3','','bg_color','#292e44','#292e44','背景颜色','默认#292e44','en','484');
INSERT INTO met_templates VALUES('488','metv75','0','14','4','3','$M$开启$T$1$M$关闭$T$0','cn1_ok','0','1','简繁体切换开关','','en','484');
INSERT INTO met_templates VALUES('487','metv75','0','11','4','3','$M$开启$T$1$M$关闭$T$0','link_ok','1','1','友情链接开关','','en','484');
INSERT INTO met_templates VALUES('486','metv75','0','12','2','3','','footlink_title','Link','友情链接','友情链接标题','','en','484');
INSERT INTO met_templates VALUES('484','metv75','0','10','1','3','','met_foot','','','底部设置','','en','0');
INSERT INTO met_templates VALUES('485','metv75','0','13','4','3','$M$底部$T$0$M$顶部$T$1','cn1_position','0','0','简繁体切换按钮位置','','en','484');
INSERT INTO met_templates VALUES('582','metv75','3','1','1','3','','news_bar','','','文章模块','','en','0');
INSERT INTO met_templates VALUES('583','metv75','3','7','2','3','','sidebar_newslist_num','4','3','侧栏列表数量','','en','582');
INSERT INTO met_templates VALUES('584','metv75','3','8','4','3','$M$全部$T$all$M$推荐$T$com','news_bar_list_type','all','all','侧栏列表类型','','en','582');
INSERT INTO met_templates VALUES('585','metv75','3','2','4','3','$M$开启$T$1$M$关闭$T$0','bar_column3_open','1','1','三级栏目开关','除开产品模块以外的侧栏','en','582');
INSERT INTO met_templates VALUES('586','metv75','3','4','4','3','$M$开启$T$1$M$关闭$T$0','news_bar_list_open','1','1','侧栏列表开关','','en','582');
INSERT INTO met_templates VALUES('587','metv75','3','3','4','3','$M$开启$T$1$M$关闭$T$0','bar_column_open','1','1','侧栏栏目开关','除开产品模块以外的侧栏','en','582');
INSERT INTO met_templates VALUES('588','metv75','3','5','2','3','','news_bar_list_title','Recommend','为您推荐','侧栏文章列表标题','','en','582');
INSERT INTO met_templates VALUES('589','metv75','3','9','2','3','','all','All','全部','全部文字','','en','582');
INSERT INTO met_templates VALUES('590','metv75','3','6','6','3','','sidebar_newslist_idid','157','','图文列表调用选择','','en','582');
INSERT INTO met_templates VALUES('591','metv75','2','1','1','3','','met_download','','','下载模块','','en','0');
INSERT INTO met_templates VALUES('592','metv75','2','2','2','3','','download','Download','立即下载','按钮文字','','en','591');
INSERT INTO met_templates VALUES('593','metv75','0','35','1','3','','met_contact','','','底部联系信息设置','','en','0');
INSERT INTO met_templates VALUES('594','metv75','0','52','2','3','','footinfo_email','','','邮箱地址','','en','593');
INSERT INTO met_templates VALUES('595','metv75','0','51','4','3','$M$开启$T$1$M$关闭$T$0','footinfo_emailok','0','0','邮箱','','en','593');
INSERT INTO met_templates VALUES('596','metv75','0','50','2','3','','footinfo_facebook','','','Facebook网址','','en','593');
INSERT INTO met_templates VALUES('597','metv75','0','47','4','3','$M$开启$T$1$M$关闭$T$0','footinfo_googleok','0','0','google+','','en','593');
INSERT INTO met_templates VALUES('598','metv75','0','49','4','3','$M$开启$T$1$M$关闭$T$0','footinfo_facebookok','0','0','Facebook','','en','593');
INSERT INTO met_templates VALUES('599','metv75','0','46','2','3','','footinfo_twitter','','','twitter网址','','en','593');
INSERT INTO met_templates VALUES('600','metv75','0','45','4','3','$M$开启$T$1$M$关闭$T$0','footinfo_twitterok','0','0','twitter（推特）','','en','593');
INSERT INTO met_templates VALUES('601','metv75','0','44','2','3','','footinfo_sina','https://weibo.com/metinfo','','新浪微博网址','请输入微博网址','en','593');
INSERT INTO met_templates VALUES('602','metv75','0','43','4','3','$M$开启$T$1$M$关闭$T$0','footinfo_sina_ok','1','1','新浪微博','','en','593');
INSERT INTO met_templates VALUES('603','metv75','0','42','2','3','','footinfo_qq','0731-85514433','','QQ号码','点击QQ链接可直接对话，需要先到 shang.qq.com 免费开通。<br/>企业营销QQ 无需开通','en','593');
INSERT INTO met_templates VALUES('604','metv75','0','41','4','3','$M$个人QQ$T$1$M$企业营销QQ$T$2','foot_info_qqtype','2','1','QQ类型','个人QQ和企业营销QQ超链接结构不一样，因此请务必选择正确。','en','593');
INSERT INTO met_templates VALUES('605','metv75','0','40','4','3','$M$开启$T$1$M$关闭$T$0','footinfo_qq_ok','1','1','QQ','','en','593');
INSERT INTO met_templates VALUES('606','metv75','0','38','4','3','$M$开启$T$1$M$关闭$T$0','footinfo_wx_ok','1','1','微信','','en','593');
INSERT INTO met_templates VALUES('607','metv75','0','48','2','3','','footinfo_google','','','google+网址','','en','593');
INSERT INTO met_templates VALUES('608','metv75','0','37','2','3','','footinfo_dsc','0731-85514433','','描述文字','填0隐藏','en','593');
INSERT INTO met_templates VALUES('609','metv75','0','36','2','3','','footinfo_tel','Contact us','联系我们','联系我们','填0隐藏','en','593');
INSERT INTO met_templates VALUES('610','metv75','0','39','7','3','','footinfo_wx','../upload/202109/1631614014.jpg','','微信二维码','','en','593');
INSERT INTO met_templates VALUES('611','metv75','2','12','1','3','','para_search','','','搜索模块','','en','0');
INSERT INTO met_templates VALUES('612','metv75','2','13','4','3','非全屏$T$1$M$全屏$T$0','type','','1','是否全屏展示','默认非全屏','en','611');
INSERT INTO met_templates VALUES('613','metv75','2','14','4','3','开启$T$1$M$关闭$T$0','attr_ok','','1','参数开关','默认开启','en','611');
INSERT INTO met_templates VALUES('614','metv75','2','15','4','3','开启$T$1$M$关闭$T$0','sort_ok','','1','排序开关','默认开启','en','611');
INSERT INTO met_templates VALUES('615','metv75','2','16','1','3','','met_product','','','产品列表','','en','0');
INSERT INTO met_templates VALUES('620','metv75','1','16','7','3','','uiBgImage','../upload/202109/1631611567.jpg','','区块背景图','建议宽度1920，高度自适应，移动端截取中间展示','en','578');
INSERT INTO met_templates VALUES('622','metv75','0','20','7','3','','footinfo_wx2','../upload/202109/1631611502.jpg','','第二个二维码','建议尺寸112*112','en','484');
INSERT INTO met_templates VALUES('624','metv75','3','29','2','3','','product_hottitle','','热门推荐','热门推荐文字','','en','518');

DROP TABLE IF EXISTS met_ui_config;
CREATE TABLE `met_ui_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) DEFAULT '0',
  `parent_name` varchar(100) DEFAULT '',
  `ui_name` varchar(100) DEFAULT '',
  `skin_name` varchar(100) DEFAULT '',
  `uip_type` int(10) DEFAULT '0',
  `uip_style` tinyint(1) DEFAULT '0',
  `uip_select` varchar(500) DEFAULT '1',
  `uip_name` varchar(100) DEFAULT '',
  `uip_key` varchar(100) DEFAULT '',
  `uip_value` text,
  `uip_default` varchar(255) DEFAULT '',
  `uip_title` varchar(100) DEFAULT '',
  `uip_description` varchar(255) DEFAULT '',
  `uip_order` int(10) DEFAULT '0',
  `lang` varchar(100) DEFAULT '',
  `uip_hidden` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=928 DEFAULT CHARSET=utf8;

INSERT INTO met_ui_config VALUES('1','1','head_nav','met_m1156_7','m1156ui010','4','0','$M$开启$T$1$M$关闭$T$0','ui_show','ui_show','1','1','区块显示开关','当前UI区块的开启关闭设置，关闭后可以在可视化编辑中开启','1','cn','0');
INSERT INTO met_ui_config VALUES('2','1','head_nav','met_m1156_7','m1156ui010','6','4','','icon_id','icon_id','130','','联系图标栏目','新建一个图标联系栏目；然后添加子栏目，使用“外部模块”在“链接地址”写入联系链接、“小图标icon”选择联系图标、“栏目图片”上传二维码；','2','cn','0');
INSERT INTO met_ui_config VALUES('3','1','head_nav','met_m1156_7','m1156ui010','2','0','','right_more','right_more','更多关注','更多关注','右上角文字','手机端右上角文字点击弹出右上角栏目','3','cn','0');
INSERT INTO met_ui_config VALUES('4','1','head_nav','met_m1156_7','m1156ui010','6','4','','right_id','right_id','117','','右上角栏目','显示指定栏目的子栏目','4','cn','0');
INSERT INTO met_ui_config VALUES('5','1','head_nav','met_m1156_7','m1156ui010','4','0','开启$T$1$M$关闭$T$0','top_ok','top_ok','1','1','顶部横条开关','','5','cn','0');
INSERT INTO met_ui_config VALUES('6','1','head_nav','met_m1156_7','m1156ui010','4','0','开启$T$1$M$关闭$T$0','fixed','fixed','','0','导航固定','设置导航是否随页面滚动固定页面头部','6','cn','0');
INSERT INTO met_ui_config VALUES('7','1','head_nav','met_m1156_7','m1156ui010','4','0','开启$T$1$M$关闭$T$0','s2t_ok','s2t_ok','0','1','简繁体开关','中文语言有效','7','cn','0');
INSERT INTO met_ui_config VALUES('8','1','head_nav','met_m1156_7','m1156ui010','4','0','开启$T$1$M$关闭$T$0','lang_ok','lang_ok','0','1','语言开关','需要系统对应的功能开启才有效','8','cn','0');
INSERT INTO met_ui_config VALUES('9','1','head_nav','met_m1156_7','m1156ui010','4','0','开启$T$1$M$关闭$T$0','user_ok','user_ok','0','1','会员开关','需要系统对应的功能开启才有效','9','cn','0');
INSERT INTO met_ui_config VALUES('10','1','head_nav','met_m1156_7','m1156ui010','2','0','','search','search','请输入搜索关键词！','','搜索提示文字','搜索框不输入数据时的提示文字','10','cn','0');
INSERT INTO met_ui_config VALUES('11','1','head_nav','met_m1156_7','m1156ui010','4','0','开启$T$1$M$关闭$T$0','search_ok','search_ok','1','1','搜索开关','','11','cn','0');
INSERT INTO met_ui_config VALUES('12','1','head_nav','met_m1156_7','m1156ui010','2','0','','nav2_hide','nav_hide','','','隐藏下拉栏目','设置需要隐藏下拉菜单的一级栏目；格式：栏目一|栏目二|栏目三','12','cn','0');
INSERT INTO met_ui_config VALUES('13','1','head_nav','met_m1156_7','m1156ui010','2','0','','nav2_all','nav2_all','全部','全部','二级栏目总栏目文字','','13','cn','0');
INSERT INTO met_ui_config VALUES('14','1','head_nav','met_m1156_7','m1156ui010','4','0','开启$T$1$M$关闭$T$0','nav2_ok','nav2_ok','1','1','下拉菜单开关','设置开启或关闭下拉菜单的一级栏目','14','cn','0');
INSERT INTO met_ui_config VALUES('15','1','head_nav','met_m1156_7','m1156ui010','9','0','','backgroundcolor','bgcolor-1','#ffffff','','区块背景色','默认为模板背景色','15','cn','1');
INSERT INTO met_ui_config VALUES('16','1','head_nav','met_m1156_7','m1156ui010','9','0','','headercolor','headercolor','#222222','','头部横条背景色','默认为区块背景色','16','cn','1');
INSERT INTO met_ui_config VALUES('17','1','head_nav','met_m1156_7','m1156ui010','9','0','','headerfontcolor','headerfontcolor','#dddddd','#dddddd','头部横条字体颜色','默认为浅灰色','17','cn','1');
INSERT INTO met_ui_config VALUES('18','1','head_nav','met_m1156_7','m1156ui010','9','0','','headerhrcolor','headerhrcolor','#666666','#444444','头部横条分割线颜色','默认为深灰色','18','cn','1');
INSERT INTO met_ui_config VALUES('19','1','head_nav','met_m1156_7','m1156ui010','9','0','','headerhovercolor','headerhovercolor','#ffffff','#ffffff','头部横条鼠标经过颜色','默认为白色','19','cn','1');
INSERT INTO met_ui_config VALUES('20','1','head_nav','met_m1156_7','m1156ui010','9','0','','navcolor','navcolor','#ffffff','','导航区背景色','默认为区块背景色','20','cn','1');
INSERT INTO met_ui_config VALUES('21','1','head_nav','met_m1156_7','m1156ui010','9','0','','titlecolor','titlecolor','#333333','','导航栏目文字颜色','默认为模板主色调','21','cn','1');
INSERT INTO met_ui_config VALUES('22','1','head_nav','met_m1156_7','m1156ui010','9','0','','hovercolor','hovercolor','#f06ca8','','导航栏目鼠标经过颜色','默认为模板配色调','22','cn','1');
INSERT INTO met_ui_config VALUES('23','1','head_nav','met_m1156_7','m1156ui010','9','0','','bordercolor','bordercolor','#eeeeee','#eeeeee','线条颜色','默认为浅灰色','23','cn','1');
INSERT INTO met_ui_config VALUES('24','1','head_nav','met_m1156_7','m1156ui010','9','0','','nav2titlecolor','nav2titlecolor','#333333','','下拉菜单文字颜色','默认为模板主色调','24','cn','1');
INSERT INTO met_ui_config VALUES('25','1','head_nav','met_m1156_7','m1156ui010','9','0','','nav2hovercolor','nav2hovercolor','#ffffff','','下拉菜单鼠标经过颜色','默认为模板配色调','25','cn','1');
INSERT INTO met_ui_config VALUES('26','1','head_nav','met_m1156_7','m1156ui010','9','0','','nav2hoverbgcolor','nav2hoverbgcolor','#f06ca8','','下拉菜单鼠标经过背景色','','26','cn','1');
INSERT INTO met_ui_config VALUES('27','1','head_nav','met_m1156_7','m1156ui010','9','0','','nav2bgcolor','nav2bgcolor','#ffffff','','下拉菜单背景色','','27','cn','1');
INSERT INTO met_ui_config VALUES('28','1','head_nav','met_m1156_7','m1156ui010','9','0','','nav2borderoclor','nav2borderoclor','#eeeeee','#eeeeee','下拉菜单线条颜色','默认为浅灰色','28','cn','1');
INSERT INTO met_ui_config VALUES('29','1','head_nav','met_m1156_7','m1156ui010','9','0','','searchbgcolor','searchbgcolor','#f06ca8','','搜索框背景色','默认为模板配色调','29','cn','1');
INSERT INTO met_ui_config VALUES('30','1','head_nav','met_m1156_7','m1156ui010','9','0','','searchfontcolor','searchfontcolor','#ffffff','#ffffff','搜索框字体色','默认为白色','30','cn','1');
INSERT INTO met_ui_config VALUES('31','1','head_nav','met_m1156_7','m1156ui010','9','0','','searchhoverbgcolor','searchhoverbgcolor','#be6fe8','#ffffff','搜索框鼠标经过背景色','默认为白色','31','cn','1');
INSERT INTO met_ui_config VALUES('32','1','head_nav','met_m1156_7','m1156ui010','9','0','','langcolor','langcolor','#ffffff','','语言字体颜色','默认为模板主色调','32','cn','1');
INSERT INTO met_ui_config VALUES('33','1','head_nav','met_m1156_7','m1156ui010','9','0','','langhoverbgcolor','langhoverbgcolor','#be6fe8','','语言经过背景色','','33','cn','1');
INSERT INTO met_ui_config VALUES('34','1','head_nav','met_m1156_7','m1156ui010','9','0','','logincolor','logincolor','#ffffff','#ffffff','登陆注册字体颜色','默认为白色','34','cn','1');
INSERT INTO met_ui_config VALUES('35','1','head_nav','met_m1156_7','m1156ui010','9','0','','loginbgcolor','loginbgcolor','#f06ca8','','登陆背景色','默认为模板配色调','35','cn','1');
INSERT INTO met_ui_config VALUES('36','1','head_nav','met_m1156_7','m1156ui010','9','0','','regbgcolor','regbgcolor','#be6fe8','','注册背景色','默认为模板配色调','36','cn','1');
INSERT INTO met_ui_config VALUES('37','1','head_nav','met_m1156_7','m1156ui010','9','0','','loginhoverbgcolor','loginhoverbgcolor','#e04141','','登陆鼠标经过颜色','','37','cn','1');
INSERT INTO met_ui_config VALUES('38','52','banner','met_m1156_2','m1156ui010','4','0','$M$开启$T$1$M$关闭$T$0','ui_show','ui_show','1','1','区块显示开关','当前UI区块的开启关闭设置，关闭后可以在可视化编辑中开启','0','cn','0');
INSERT INTO met_ui_config VALUES('39','52','banner','met_m1156_2','m1156ui010','9','0','','bgcolor','bgcolor','#eeeeee','','区块背景色','默认为网站背景颜色','2','cn','0');
INSERT INTO met_ui_config VALUES('40','52','banner','met_m1156_2','m1156ui010','9','0','','titlecolor','titlecolor-1','#eeeeee','','标题文字颜色','默认为模板主色调，可在各幻灯片中单独设置','3','cn','0');
INSERT INTO met_ui_config VALUES('41','52','banner','met_m1156_2','m1156ui010','2','0','','titlesizelg','titlesizelg','30','','标题文字大小（电脑端）','设置电脑端标题文字的字体大小','4','cn','0');
INSERT INTO met_ui_config VALUES('42','52','banner','met_m1156_2','m1156ui010','2','0','','titlesizemd','titlesizemd','28','','标题文字大小（平板端）','设置平板端标题文字的字体大小','5','cn','0');
INSERT INTO met_ui_config VALUES('43','52','banner','met_m1156_2','m1156ui010','2','0','','titlesizexs','titlesizexs','16','','标题文字大小（手机端）','设置手机端标题文字的字体大小','6','cn','0');
INSERT INTO met_ui_config VALUES('44','52','banner','met_m1156_2','m1156ui010','9','0','','desccolor','desccolor-1','#ffffff','','描述文字颜色','默认为模板副色调，可在各幻灯片中单独设置','7','cn','0');
INSERT INTO met_ui_config VALUES('45','52','banner','met_m1156_2','m1156ui010','2','0','','descsizelg','descsizelg','36','','描述文字大小（电脑端）','设置电脑端描述文字的字体大小','8','cn','0');
INSERT INTO met_ui_config VALUES('46','52','banner','met_m1156_2','m1156ui010','2','0','','descsizemd','descsizemd','32','','描述文字大小（平板端）','设置平板端描述文字的字体大小','9','cn','0');
INSERT INTO met_ui_config VALUES('47','52','banner','met_m1156_2','m1156ui010','2','0','','descsizexs','descsizexs','20','','描述文字大小（手机端）','设置手机端描述文字的字体大小','10','cn','0');
INSERT INTO met_ui_config VALUES('48','52','banner','met_m1156_2','m1156ui010','9','0','','hovercolor','hovercolor-1','','','区块配色调','默认为模板配色调','11','cn','0');
INSERT INTO met_ui_config VALUES('49','52','banner','met_m1156_2','m1156ui010','2','0','','bgtitle','bgtitle-1','','','区块标题名称','区块隐藏标题，用于整页滚动切换类模板的导航','12','cn','0');
INSERT INTO met_ui_config VALUES('50','52','banner','met_m1156_2','m1156ui010','4','0','$M$开启$T$1$M$关闭$T$0$M$首页开启$T$2','heightfull','heightfull','0','0','全屏显示','开启后区块高度为窗口高度','13','cn','0');
INSERT INTO met_ui_config VALUES('51','52','banner','met_m1156_2','m1156ui010','4','0','$M$显示$T$1$M$隐藏$T$0','word_ok','word_ok-1','1','1','是否显示文字','','14','cn','0');
INSERT INTO met_ui_config VALUES('52','52','banner','met_m1156_2','m1156ui010','2','0','','showlist','showlist','','','禁止显示模块（列表页）','设置禁止显示该区块的模块名称，格式：产品模块|新闻模块|图片模块','15','cn','0');
INSERT INTO met_ui_config VALUES('53','52','banner','met_m1156_2','m1156ui010','2','0','','showdetail','showdetail','产品模块|新闻模块|图片模块','产品模块|新闻模块|图片模块','禁止显示模块（详情页）','设置禁止显示该区块的模块名称，格式：产品模块|新闻模块|图片模块','16','cn','0');
INSERT INTO met_ui_config VALUES('54','2','column_list','met_m1156_7','m1156ui010','4','0','$M$开启$T$1$M$关闭$T$0','ui_show','ui_show','1','1','区块显示开关','当前UI区块的开启关闭设置，关闭后可以在可视化编辑中开启','0','cn','0');
INSERT INTO met_ui_config VALUES('55','2','column_list','met_m1156_7','m1156ui010','7','0','','bgimg','bgimg','','','区块背景图','背景图片建议尺寸：1920px * 1080px','1','cn','0');
INSERT INTO met_ui_config VALUES('56','2','column_list','met_m1156_7','m1156ui010','4','0','开启$T$1$M$关闭$T$0','bgok','bgok','1','1','背景图开关','设置区块的背景是否启用背景图','1','cn','0');
INSERT INTO met_ui_config VALUES('57','2','column_list','met_m1156_7','m1156ui010','2','0','','bgtitle','bgtitle','','','区块标题名称','区块隐藏标题，用于整页滚动切换类模板的导航','15','cn','1');
INSERT INTO met_ui_config VALUES('58','2','column_list','met_m1156_7','m1156ui010','2','4','','bgcolumn','bgcolumn','','','区块显示的栏目','指定同一模块下需要显示该区块的栏目名称；多栏目显示使用“|”隔开；格式：栏目名称1|栏目名称2； （首页不需要设置此项）（不填写则不限制显示）','16','cn','1');
INSERT INTO met_ui_config VALUES('59','2','column_list','met_m1156_7','m1156ui010','2','0','','title','abouttitle','优秀服务','','标题文字','正上方大标题文字','29','cn','0');
INSERT INTO met_ui_config VALUES('60','2','column_list','met_m1156_7','m1156ui010','3','0','','description','description','缤纷瑜伽，人气登场，带你走进梦的殿堂；越练越健康，越练越美丽，越练越吸粉','','标题描述','大标题下的描述内容','30','cn','0');
INSERT INTO met_ui_config VALUES('61','2','column_list','met_m1156_7','m1156ui010','6','4','','columnid','imgcolumn','100','','展示栏目选择','指定该区域的展示内容所属栏目','46','cn','0');
INSERT INTO met_ui_config VALUES('62','2','column_list','met_m1156_7','m1156ui010','4','0','栏目图标$T$0$M$栏目图片$T$1','icontype','icontype','1','1','图标类型','每个图标的类型属性；栏目图标：请在栏目设置的图标选择中设置；栏目图片：请将图标图片上传到对应栏目图片中','50','cn','0');
INSERT INTO met_ui_config VALUES('63','2','column_list','met_m1156_7','m1156ui010','4','0','$M$开启$T$1$M$关闭$T$0','linkok','aboutmoreok','1','1','是否链接','该区域的内容是否带有链接','61','cn','0');
INSERT INTO met_ui_config VALUES('64','2','column_list','met_m1156_7','m1156ui010','2','0','','paddinglg','paddinglg-1','40','40','间距距离（电脑端）','电脑端区块距离上下其他区块的距离，建议设置为 40 px','80','cn','0');
INSERT INTO met_ui_config VALUES('65','2','column_list','met_m1156_7','m1156ui010','2','0','','paddingsm','paddingsm-1','30','30','间距距离（平板端）','平板端区块距离上下其他区块的距离，建议设置为 30 px','81','cn','0');
INSERT INTO met_ui_config VALUES('66','2','column_list','met_m1156_7','m1156ui010','2','0','','paddingxs','paddingxs-1','20','20','间距距离（手机端）','手机端区块距离上下其他区块的距离，建议设置为 20 px','82','cn','0');
INSERT INTO met_ui_config VALUES('67','2','column_list','met_m1156_7','m1156ui010','9','0','','bgcolor','bgcolor','#f5f5f5','','区块背景色','默认为网站背景颜色；如果添加了“区块背景图”则背景色会被遮挡。','82','cn','1');
INSERT INTO met_ui_config VALUES('68','2','column_list','met_m1156_7','m1156ui010','9','0','','titlecolor','titlecolor-1','','','标题文字颜色','默认为模板主色调','84','cn','1');
INSERT INTO met_ui_config VALUES('69','2','column_list','met_m1156_7','m1156ui010','9','0','','desccolor','desccolor','#91969b','','描述文字颜色','默认为模板副色调','85','cn','1');
INSERT INTO met_ui_config VALUES('70','2','column_list','met_m1156_7','m1156ui010','9','0','','hovercolor','hovercolor-1','#be6fe8','','区块配色调','默认为模板配色调','86','cn','1');
INSERT INTO met_ui_config VALUES('71','2','column_list','met_m1156_7','m1156ui010','9','0','','showcolor','showcolor','#ffffff','','内容背景色','内容列表的单个的背景色','88','cn','1');
INSERT INTO met_ui_config VALUES('72','2','column_list','met_m1156_7','m1156ui010','9','0','','iconbgcolor','iconbgcolor','#f06ca8','','图标背景色','单个内容上方圆形图标的背景色','89','cn','1');
INSERT INTO met_ui_config VALUES('73','2','column_list','met_m1156_7','m1156ui010','9','0','','iconcolor','iconcolor','#ffffff','','图标颜色','单个内容上方圆形图标的颜色；注：只有《图标类型》设置为栏目图标时有效','91','cn','1');
INSERT INTO met_ui_config VALUES('74','3','show_list','met_m1156_7','m1156ui010','4','0','$M$开启$T$1$M$关闭$T$0','ui_show','ui_show','1','1','区块显示开关','当前UI区块的开启关闭设置，关闭后可以在可视化编辑中开启','0','cn','0');
INSERT INTO met_ui_config VALUES('75','3','show_list','met_m1156_7','m1156ui010','4','0','开启$T$1$M$关闭$T$0','bgok','bgok-1','1','1','背景图开关','设置区块的背景是否启用背景图','1','cn','0');
INSERT INTO met_ui_config VALUES('76','3','show_list','met_m1156_7','m1156ui010','7','0','','bgimg','bgimg','../upload/201711/1510736492.jpg','','区块背景图','背景图片建议尺寸：1920px * 1080px','1','cn','0');
INSERT INTO met_ui_config VALUES('77','3','show_list','met_m1156_7','m1156ui010','2','0','','bgtitle','bgtitle','','','区块标题名称','区块隐藏标题，用于整页滚动切换类模板的导航','15','cn','1');
INSERT INTO met_ui_config VALUES('78','3','show_list','met_m1156_7','m1156ui010','2','4','','bgcolumn','bgcolumn','','','区块显示的栏目','指定同一模块下需要显示该区块的栏目名称；多栏目显示使用“|”隔开；格式：栏目名称1|栏目名称2； （首页不需要设置此项）（不填写则不限制显示）','16','cn','1');
INSERT INTO met_ui_config VALUES('79','3','show_list','met_m1156_7','m1156ui010','2','0','','title','abouttitle','关于我们','','标题文字','左上侧标题文字','29','cn','0');
INSERT INTO met_ui_config VALUES('80','3','show_list','met_m1156_7','m1156ui010','8','0','','content','content','<p>塑身瑜伽馆于2002年成立！15年来，“先进、专业、卓越”是我们不变的追求。在获得“业界领头羊”专业认可的同时，更是深受广大学生的信任与欢迎。</p><p>作为中国首家引进瑜伽课程的健身中心。自2007年开始，就开设了瑜伽教练培训的课程，至今瑜伽派别丰富实用，已经为中国瑜伽市场培育了近万名优秀的瑜伽教练。让众多学员通过培训，经历了全新的蜕变，成为了瑜伽界的精英。练习瑜伽是通过练身体来养心，提高专注力，定力、获得健康，愉悦的身心。我们坚持专业、坚持品质、更坚持支持学生。我们珍惜与大家的缘分，与大家一起走向更善，更美。</p>','','描述内容','左侧文字内容','30','cn','0');
INSERT INTO met_ui_config VALUES('81','3','show_list','met_m1156_7','m1156ui010','8','0','','videoshow','videoshow-1','<p style=\"text-align: center;\"><video class=\"edui-upload-video  vjs-default-skin video-js\" controls=\"\" poster=\"\" width=\"\" height=\"\" src=\"../upload/video/202105/1621856484393518.mp4\" data-setup=\"{}\"><source src=\"../upload/video/202105/1621856484393518.mp4\" type=\"video/mp4\"/></video></p>','','视频图片内容','如果使用优酷、腾讯视频，直接复制《iframe ...》的分享视频代码！右边内容高度建议小于左边内容高度，否则会以滚动条模式展示；','31','cn','0');
INSERT INTO met_ui_config VALUES('82','3','show_list','met_m1156_7','m1156ui010','6','4','','columnid','imgcolumn','100','','链接栏目','左下方按钮的链接栏目','36','cn','0');
INSERT INTO met_ui_config VALUES('83','3','show_list','met_m1156_7','m1156ui010','2','0','','more','more','查看更多','查看更多','更多文字','左下方按钮的文字','38','cn','0');
INSERT INTO met_ui_config VALUES('84','3','show_list','met_m1156_7','m1156ui010','2','0','','paddinglg','paddinglg-1','40','40','间距距离（电脑端）','电脑端区块距离上下其他区块的距离，建议设置为 40 px','80','cn','0');
INSERT INTO met_ui_config VALUES('85','3','show_list','met_m1156_7','m1156ui010','2','0','','paddingsm','paddingsm-1','30','30','间距距离（平板端）','平板端区块距离上下其他区块的距离，建议设置为 30 px','81','cn','0');
INSERT INTO met_ui_config VALUES('86','3','show_list','met_m1156_7','m1156ui010','2','0','','paddingxs','paddingxs-1','20','20','间距距离（手机端）','手机端区块距离上下其他区块的距离，建议设置为 20 px','82','cn','0');
INSERT INTO met_ui_config VALUES('87','3','show_list','met_m1156_7','m1156ui010','9','0','','bgcolor','bgcolor','#000000','','区块背景色','默认为网站背景颜色；如果添加了“区块背景图”则背景色会被遮挡。','82','cn','1');
INSERT INTO met_ui_config VALUES('88','3','show_list','met_m1156_7','m1156ui010','9','0','','titlecolor','titlecolor-1','#ffffff','','标题文字颜色','默认为模板主色调','84','cn','1');
INSERT INTO met_ui_config VALUES('89','3','show_list','met_m1156_7','m1156ui010','9','0','','desccolor','desccolor','#fcfcfc','','内容文字颜色','默认为模板副色调','85','cn','1');
INSERT INTO met_ui_config VALUES('90','3','show_list','met_m1156_7','m1156ui010','9','0','','hovercolor','hovercolor-1','#f06ca8','','区块配色调','默认为模板配色调','86','cn','1');
INSERT INTO met_ui_config VALUES('91','3','show_list','met_m1156_7','m1156ui010','9','0','','buttoncolor','buttoncolor','#ffffff','','按钮文字颜色','默认为模板主色调；左下方按钮的文字颜色','90','cn','1');
INSERT INTO met_ui_config VALUES('92','3','show_list','met_m1156_7','m1156ui010','9','0','','bordercolor','bordercolor-1','#eeeeee','','按钮线条颜色','左下方按钮的边框线条颜色','91','cn','1');
INSERT INTO met_ui_config VALUES('93','4','product_list','met_m1156_7','m1156ui010','4','0','$M$开启$T$1$M$关闭$T$0','ui_show','ui_show','1','1','区块显示开关','当前UI区块的开启关闭设置，关闭后可以在可视化编辑中开启','0','cn','0');
INSERT INTO met_ui_config VALUES('94','4','product_list','met_m1156_7','m1156ui010','7','0','','bgimg','bgimg','','','区块背景图','背景图片建议尺寸：1920px * 1080px','1','cn','0');
INSERT INTO met_ui_config VALUES('95','4','product_list','met_m1156_7','m1156ui010','4','0','开启$T$1$M$关闭$T$0','bgok','bgok-1','1','1','背景图开关','设置区块的背景是否启用背景图','1','cn','0');
INSERT INTO met_ui_config VALUES('96','4','product_list','met_m1156_7','m1156ui010','2','0','','bgtitle','bgtitle','','','区块标题名称','区块隐藏标题，用于整页滚动切换类模板的导航','15','cn','1');
INSERT INTO met_ui_config VALUES('97','4','product_list','met_m1156_7','m1156ui010','2','4','','bgcolumn','bgcolumn','','','区块显示的栏目','指定同一模块下需要显示该区块的栏目名称；多栏目显示使用“|”隔开；格式：栏目名称1|栏目名称2； （首页不需要设置此项）（不填写则不限制显示）','16','cn','1');
INSERT INTO met_ui_config VALUES('98','4','product_list','met_m1156_7','m1156ui010','2','0','','title','abouttitle','瑜伽课程','','标题文字','正上方标题文字','29','cn','0');
INSERT INTO met_ui_config VALUES('99','4','product_list','met_m1156_7','m1156ui010','3','0','','description','description','完美是一种态度，优雅是一种生活，宽容是一种心态，美丽人生从瑜伽开始','','标题描述','正上方描述文字','30','cn','0');
INSERT INTO met_ui_config VALUES('100','4','product_list','met_m1156_7','m1156ui010','6','4','','columnid','imgcolumn','104','','展示栏目选择','指定下方内容列表所属的栏目','46','cn','0');
INSERT INTO met_ui_config VALUES('101','4','product_list','met_m1156_7','m1156ui010','4','0','全部$T$$M$推荐$T$com','type','type','','','展示类型','展示的内容列表在后台设置的类型','47','cn','0');
INSERT INTO met_ui_config VALUES('102','4','product_list','met_m1156_7','m1156ui010','2','0','','number','number','8','8','显示个数','内容列表显示的个数','48','cn','0');
INSERT INTO met_ui_config VALUES('103','4','product_list','met_m1156_7','m1156ui010','2','0','','more','more-1','查看更多课程','查看更多','更多文字','**下方更多按钮文字','50','cn','0');
INSERT INTO met_ui_config VALUES('104','4','product_list','met_m1156_7','m1156ui010','2','0','','width','width','400','400','图片宽度（px）','内容列表图片的宽度','62','cn','0');
INSERT INTO met_ui_config VALUES('105','4','product_list','met_m1156_7','m1156ui010','2','0','','height','height','300','300','图片高度（px)','内容列表图片的高度','63','cn','0');
INSERT INTO met_ui_config VALUES('106','4','product_list','met_m1156_7','m1156ui010','2','0','','paddinglg','paddinglg-1','40','40','间距距离（电脑端）','电脑端区块距离上下其他区块的距离，建议设置为 40 px','80','cn','0');
INSERT INTO met_ui_config VALUES('107','4','product_list','met_m1156_7','m1156ui010','2','0','','paddingsm','paddingsm-1','30','30','间距距离（平板端）','平板端区块距离上下其他区块的距离，建议设置为 30 px','81','cn','0');
INSERT INTO met_ui_config VALUES('108','4','product_list','met_m1156_7','m1156ui010','2','0','','paddingxs','paddingxs-1','20','20','间距距离（手机端）','手机端区块距离上下其他区块的距离，建议设置为 20 px','82','cn','0');
INSERT INTO met_ui_config VALUES('109','4','product_list','met_m1156_7','m1156ui010','9','0','','bgcolor','bgcolor','#f5f5f5','','区块背景色','默认为网站背景颜色；如果添加了“区块背景图”则背景色会被遮挡。','82','cn','1');
INSERT INTO met_ui_config VALUES('110','4','product_list','met_m1156_7','m1156ui010','9','0','','titlecolor','titlecolor-1','#333333','','标题文字颜色','默认为模板主色调','84','cn','1');
INSERT INTO met_ui_config VALUES('111','4','product_list','met_m1156_7','m1156ui010','9','0','','desccolor','desccolor','#91969b','','描述文字颜色','默认为模板副色调','85','cn','1');
INSERT INTO met_ui_config VALUES('112','4','product_list','met_m1156_7','m1156ui010','9','0','','hovercolor','hovercolor-1','#f06ca8','','区块配色调','默认为模板配色调','86','cn','1');
INSERT INTO met_ui_config VALUES('113','4','product_list','met_m1156_7','m1156ui010','9','0','','showcolor','showcolor','#ffffff','','内容背景色','列表的单个内容的背景色','88','cn','1');
INSERT INTO met_ui_config VALUES('114','4','product_list','met_m1156_7','m1156ui010','9','0','','titlescolor','titlescolor','#333333','','内容标题文字颜色','默认为标题文字颜色','89','cn','1');
INSERT INTO met_ui_config VALUES('115','4','product_list','met_m1156_7','m1156ui010','9','0','','focuscolor','focuscolor','#ffffff','','标题鼠标经过颜色','默认为模板配色调','90','cn','1');
INSERT INTO met_ui_config VALUES('116','4','product_list','met_m1156_7','m1156ui010','9','0','','bordercolor','bordercolor-1','','','线条颜色','下方按钮的边框线条颜色','91','cn','1');
INSERT INTO met_ui_config VALUES('117','4','product_list','met_m1156_7','m1156ui010','9','0','','pricecolor','pricecolor-1','#cc0000','#cc0000','价格文字颜色','默认为红色，开启商城模块后有效','92','cn','1');
INSERT INTO met_ui_config VALUES('118','5','img_list','met_m1156_7','m1156ui010','4','0','$M$开启$T$1$M$关闭$T$0','ui_show','ui_show','1','1','区块显示开关','当前UI区块的开启关闭设置，关闭后可以在可视化编辑中开启','0','cn','0');
INSERT INTO met_ui_config VALUES('119','5','img_list','met_m1156_7','m1156ui010','7','0','','bgimg','bgimg','../upload/201711/1510736954.jpg','','区块背景图','背景图片建议尺寸：1920px * 1080px','1','cn','0');
INSERT INTO met_ui_config VALUES('120','5','img_list','met_m1156_7','m1156ui010','4','0','开启$T$1$M$关闭$T$0','bgok','bgok-1','1','1','背景图开关','设置区块的背景是否启用背景图','1','cn','0');
INSERT INTO met_ui_config VALUES('121','5','img_list','met_m1156_7','m1156ui010','2','0','','bgtitle','bgtitle','','','区块标题名称','区块隐藏标题，用于整页滚动切换类模板的导航','15','cn','1');
INSERT INTO met_ui_config VALUES('122','5','img_list','met_m1156_7','m1156ui010','2','4','','bgcolumn','bgcolumn','','','区块显示的栏目','指定同一模块下需要显示该区块的栏目名称；多栏目显示使用“|”隔开；格式：栏目名称1|栏目名称2； （首页不需要设置此项）（不填写则不限制显示）','16','cn','1');
INSERT INTO met_ui_config VALUES('123','5','img_list','met_m1156_7','m1156ui010','2','0','','title','abouttitle','会馆环境','','标题文字','区块正上方标题文字','29','cn','0');
INSERT INTO met_ui_config VALUES('124','5','img_list','met_m1156_7','m1156ui010','3','0','','description','description','以诗对抗平庸，以水的冥想对抗火的浮躁，在瑜伽里寻找永恒的青春','','标题描述','区块正上方描述文字','30','cn','0');
INSERT INTO met_ui_config VALUES('125','5','img_list','met_m1156_7','m1156ui010','6','4','','columnid','imgcolumn','109','','展示栏目选择','指定内容列表所属栏目','46','cn','0');
INSERT INTO met_ui_config VALUES('126','5','img_list','met_m1156_7','m1156ui010','4','0','全部$T$$M$推荐$T$com','type','type','','','展示类型','展示内容列表后台设置的指定类型','47','cn','0');
INSERT INTO met_ui_config VALUES('127','5','img_list','met_m1156_7','m1156ui010','2','0','','number','number','8','8','显示个数','内容列表的个数','48','cn','0');
INSERT INTO met_ui_config VALUES('128','5','img_list','met_m1156_7','m1156ui010','2','0','','more','more-1','查看更多','查看更多','更多文字','下方更多按钮文字','50','cn','0');
INSERT INTO met_ui_config VALUES('129','5','img_list','met_m1156_7','m1156ui010','2','0','','width','width','400','400','图片宽度（px）','内容列表的图片宽度','62','cn','0');
INSERT INTO met_ui_config VALUES('130','5','img_list','met_m1156_7','m1156ui010','2','0','','height','height','300','300','图片高度（px)','内容列表的图片高度','63','cn','0');
INSERT INTO met_ui_config VALUES('131','5','img_list','met_m1156_7','m1156ui010','2','0','','paddinglg','paddinglg-1','40','40','间距距离（电脑端）','电脑端区块距离上下其他区块的距离，建议设置为 40 px','80','cn','0');
INSERT INTO met_ui_config VALUES('132','5','img_list','met_m1156_7','m1156ui010','2','0','','paddingsm','paddingsm-1','30','30','间距距离（平板端）','平板端区块距离上下其他区块的距离，建议设置为 30 px','81','cn','0');
INSERT INTO met_ui_config VALUES('133','5','img_list','met_m1156_7','m1156ui010','2','0','','paddingxs','paddingxs-1','20','20','间距距离（手机端）','手机端区块距离上下其他区块的距离，建议设置为 20 px','82','cn','0');
INSERT INTO met_ui_config VALUES('134','5','img_list','met_m1156_7','m1156ui010','9','0','','bgcolor','bgcolor','#000000','','区块背景色','默认为网站背景颜色；如果添加了“区块背景图”则背景色会被遮挡。','82','cn','1');
INSERT INTO met_ui_config VALUES('135','5','img_list','met_m1156_7','m1156ui010','9','0','','namecolor','namecolor','#ffffff','','标题颜色','默认为模板主色调','83','cn','1');
INSERT INTO met_ui_config VALUES('136','5','img_list','met_m1156_7','m1156ui010','9','0','','titlecolor','titlecolor-1','#333333','','标题文字颜色','默认为模板主色调','84','cn','1');
INSERT INTO met_ui_config VALUES('137','5','img_list','met_m1156_7','m1156ui010','9','0','','desccolor','desccolor','#eeeeee','','描述文字颜色','默认为模板副色调','85','cn','1');
INSERT INTO met_ui_config VALUES('138','5','img_list','met_m1156_7','m1156ui010','9','0','','hovercolor','hovercolor-1','#f06ca8','','区块配色调','默认为模板配色调','86','cn','1');
INSERT INTO met_ui_config VALUES('139','5','img_list','met_m1156_7','m1156ui010','9','0','','showcolor','showcolor','#ffffff','','内容背景色','内容列表的单个背景色','88','cn','1');
INSERT INTO met_ui_config VALUES('140','5','img_list','met_m1156_7','m1156ui010','9','0','','focuscolor','focuscolor','#ffffff','','标题鼠标经过颜色','内容列表标题鼠标经过颜色','90','cn','1');
INSERT INTO met_ui_config VALUES('141','5','img_list','met_m1156_7','m1156ui010','9','0','','bordercolor','bordercolor-1','#eeeeee','','线条颜色','下方更多按钮线条颜色','91','cn','1');
INSERT INTO met_ui_config VALUES('142','6','news_list','met_m1156_7','m1156ui010','4','0','$M$开启$T$1$M$关闭$T$0','ui_show','ui_show','1','1','区块显示开关','当前UI区块的开启关闭设置，关闭后可以在可视化编辑中开启','0','cn','0');
INSERT INTO met_ui_config VALUES('143','6','news_list','met_m1156_7','m1156ui010','7','0','','bgimg','bgimg','','','区块背景图','背景图片建议尺寸：1920px * 1080px','1','cn','0');
INSERT INTO met_ui_config VALUES('144','6','news_list','met_m1156_7','m1156ui010','4','0','开启$T$1$M$关闭$T$0','bgok','bgok-1','1','1','背景图开关','设置区块的背景是否启用背景图','1','cn','0');
INSERT INTO met_ui_config VALUES('145','6','news_list','met_m1156_7','m1156ui010','2','0','','bgtitle','bgtitle','','','区块标题名称','区块隐藏标题，用于整页滚动切换类模板的导航','15','cn','1');
INSERT INTO met_ui_config VALUES('146','6','news_list','met_m1156_7','m1156ui010','2','4','','bgcolumn','bgcolumn','','','区块显示的栏目','指定同一模块下需要显示该区块的栏目名称；多栏目显示使用“|”隔开；格式：栏目名称1|栏目名称2； （首页不需要设置此项）（不填写则不限制显示）','16','cn','1');
INSERT INTO met_ui_config VALUES('147','6','news_list','met_m1156_7','m1156ui010','2','0','','title','abouttitle','新闻动态','','标题文字','正上方标题文字','29','cn','0');
INSERT INTO met_ui_config VALUES('148','6','news_list','met_m1156_7','m1156ui010','3','0','','description','description','瑜伽会馆致力于传播瑜伽文化，让每个人都能够感受到瑜伽的快乐','','标题描述','正上方描述文字','30','cn','0');
INSERT INTO met_ui_config VALUES('149','6','news_list','met_m1156_7','m1156ui010','6','4','','columnid','imgcolumn','101','','展示栏目选择','指定内容列表所属栏目','46','cn','0');
INSERT INTO met_ui_config VALUES('150','6','news_list','met_m1156_7','m1156ui010','4','0','全部$T$$M$推荐$T$com','type','type','','','展示类型','调用指定类型的内容列表','47','cn','0');
INSERT INTO met_ui_config VALUES('151','6','news_list','met_m1156_7','m1156ui010','2','0','','number','number','4','4','显示个数','每列内容所显示的个数','48','cn','0');
INSERT INTO met_ui_config VALUES('152','6','news_list','met_m1156_7','m1156ui010','2','0','','tag','tag','标签：','标签：','标签文字','页面文字','51','cn','0');
INSERT INTO met_ui_config VALUES('153','6','news_list','met_m1156_7','m1156ui010','4','0','开启$T$1$M$关闭$T$0','tagok','tagok','1','1','标签开关','内容列表标签的开关','52','cn','0');
INSERT INTO met_ui_config VALUES('154','6','news_list','met_m1156_7','m1156ui010','2','0','','paddinglg','paddinglg-1','40','40','间距距离（电脑端）','电脑端区块距离上下其他区块的距离，建议设置为 40 px','80','cn','0');
INSERT INTO met_ui_config VALUES('155','6','news_list','met_m1156_7','m1156ui010','2','0','','paddingsm','paddingsm-1','30','30','间距距离（平板端）','平板端区块距离上下其他区块的距离，建议设置为 30 px','81','cn','0');
INSERT INTO met_ui_config VALUES('156','6','news_list','met_m1156_7','m1156ui010','2','0','','paddingxs','paddingxs-1','20','20','间距距离（手机端）','手机端区块距离上下其他区块的距离，建议设置为 20 px','82','cn','0');
INSERT INTO met_ui_config VALUES('157','6','news_list','met_m1156_7','m1156ui010','9','0','','bgcolor','bgcolor','#f5f5f5','','区块背景色','默认为网站背景颜色；如果添加了“区块背景图”则背景色会被遮挡。','82','cn','1');
INSERT INTO met_ui_config VALUES('158','6','news_list','met_m1156_7','m1156ui010','9','0','','namecolor','namecolor','#333333','','标题颜色','默认为模板主色调','83','cn','1');
INSERT INTO met_ui_config VALUES('159','6','news_list','met_m1156_7','m1156ui010','9','0','','titlecolor','titlecolor-1','#333333','','标题文字颜色','默认为模板主色调','84','cn','1');
INSERT INTO met_ui_config VALUES('160','6','news_list','met_m1156_7','m1156ui010','9','0','','desccolor','desccolor','#91969b','','描述文字颜色','默认为模板副色调','85','cn','1');
INSERT INTO met_ui_config VALUES('161','6','news_list','met_m1156_7','m1156ui010','9','0','','hovercolor','hovercolor-1','#f06ca8','','区块配色调','默认为模板配色调','86','cn','1');
INSERT INTO met_ui_config VALUES('162','6','news_list','met_m1156_7','m1156ui010','9','0','','tagcolor','tagcolor','#888888','','标签时间文字颜色','默认为模板配色调','87','cn','1');
INSERT INTO met_ui_config VALUES('163','6','news_list','met_m1156_7','m1156ui010','9','0','','showcolor','showcolor','#ffffff','','内容背景色','每列内容的背景色','88','cn','1');
INSERT INTO met_ui_config VALUES('164','6','news_list','met_m1156_7','m1156ui010','9','0','','bordercolor','bordercolor-1','#e9e9e9','','线条颜色','内容列表分割线线条颜色','91','cn','1');
INSERT INTO met_ui_config VALUES('165','6','news_list','met_m1156_7','m1156ui010','9','0','','columnbgcolor','columnbgcolor','#f06ca8','','栏目标题背景色','每列左上标题的背景色','93','cn','1');
INSERT INTO met_ui_config VALUES('166','6','news_list','met_m1156_7','m1156ui010','9','0','','columncolor','columncolor','#ffffff','#ffffff','栏目标题文字颜色','默认为白色','94','cn','1');
INSERT INTO met_ui_config VALUES('167','7','case_list','met_m1156_7','m1156ui010','4','0','$M$开启$T$1$M$关闭$T$0','ui_show','ui_show','1','1','区块显示开关','当前UI区块的开启关闭设置，关闭后可以在可视化编辑中开启','0','cn','0');
INSERT INTO met_ui_config VALUES('168','7','case_list','met_m1156_7','m1156ui010','7','0','','bgimg','bgimg','../upload/201711/1510737030.jpg','','区块背景图','背景图片建议尺寸：1920px * 1080px','1','cn','0');
INSERT INTO met_ui_config VALUES('169','7','case_list','met_m1156_7','m1156ui010','4','4','开启$T$1$M$关闭$T$0','bgok','bgok-1','1','1','背景图开关','设置区块的背景是否启用背景图','1','cn','0');
INSERT INTO met_ui_config VALUES('170','7','case_list','met_m1156_7','m1156ui010','2','0','','bgtitle','bgtitle','','','区块标题名称','区块隐藏标题，用于整页滚动切换类模板的导航','15','cn','1');
INSERT INTO met_ui_config VALUES('171','7','case_list','met_m1156_7','m1156ui010','2','4','','bgcolumn','bgcolumn','','','区块显示的栏目','指定同一模块下需要显示该区块的栏目名称；多栏目显示使用“|”隔开；格式：栏目名称1|栏目名称2； （首页不需要设置此项）（不填写则不限制显示）','16','cn','1');
INSERT INTO met_ui_config VALUES('172','7','case_list','met_m1156_7','m1156ui010','2','0','','title','abouttitle','教练团队','案例展示','标题文字','正上方标题文字','29','cn','0');
INSERT INTO met_ui_config VALUES('173','7','case_list','met_m1156_7','m1156ui010','3','0','','description','description','把瑜伽带给大家，就是把健康带给大家；练习瑜伽，就是畅享自然健康','','标题描述','正上方描述文字','30','cn','0');
INSERT INTO met_ui_config VALUES('174','7','case_list','met_m1156_7','m1156ui010','6','4','','columnid','imgcolumn','105','','展示栏目选择','指定内容列表所属栏目','46','cn','0');
INSERT INTO met_ui_config VALUES('175','7','case_list','met_m1156_7','m1156ui010','4','0','全部$T$$M$推荐$T$com','type','type','','','展示类型','调用指定类型的内容列表','47','cn','0');
INSERT INTO met_ui_config VALUES('176','7','case_list','met_m1156_7','m1156ui010','2','0','','number','number','6','8','显示个数','每列内容所显示的个数','48','cn','0');
INSERT INTO met_ui_config VALUES('177','7','case_list','met_m1156_7','m1156ui010','2','0','','more','more-1','查看更多','查看更多','更多文字','下方更多按钮显示文字','50','cn','0');
INSERT INTO met_ui_config VALUES('178','7','case_list','met_m1156_7','m1156ui010','4','0','开启$T$1$M$关闭$T$0','tagok','tagok-1','1','1','标签开关','内容列表标签的开关','53','cn','0');
INSERT INTO met_ui_config VALUES('179','7','case_list','met_m1156_7','m1156ui010','2','0','','width','width','400','400','图片宽度（px）','内容列表图片的宽度','62','cn','0');
INSERT INTO met_ui_config VALUES('180','7','case_list','met_m1156_7','m1156ui010','2','0','','height','height','300','300','图片高度（px)','内容列表图片的高度','63','cn','0');
INSERT INTO met_ui_config VALUES('181','7','case_list','met_m1156_7','m1156ui010','2','0','','paddinglg','paddinglg-1','40','40','间距距离（电脑端）','电脑端区块距离上下其他区块的距离，建议设置为 40 px','80','cn','0');
INSERT INTO met_ui_config VALUES('182','7','case_list','met_m1156_7','m1156ui010','2','0','','paddingsm','paddingsm-1','30','30','间距距离（平板端）','平板端区块距离上下其他区块的距离，建议设置为 30 px','81','cn','0');
INSERT INTO met_ui_config VALUES('183','7','case_list','met_m1156_7','m1156ui010','2','0','','paddingxs','paddingxs-1','20','20','间距距离（手机端）','手机端区块距离上下其他区块的距离，建议设置为 20 px','82','cn','0');
INSERT INTO met_ui_config VALUES('184','7','case_list','met_m1156_7','m1156ui010','9','0','','bgcolor','bgcolor','#000000','','区块背景色','默认为网站背景颜色；如果添加了“区块背景图”则背景色会被遮挡。','82','cn','1');
INSERT INTO met_ui_config VALUES('185','7','case_list','met_m1156_7','m1156ui010','9','0','','namecolor','namecolor','#ffffff','','标题颜色','默认为模板主色调','83','cn','1');
INSERT INTO met_ui_config VALUES('186','7','case_list','met_m1156_7','m1156ui010','9','0','','titlecolor','titlecolor-1','#333333','','标题文字颜色','默认为模板主色调','84','cn','1');
INSERT INTO met_ui_config VALUES('187','7','case_list','met_m1156_7','m1156ui010','9','0','','desccolor','desccolor','#eeeeee','','标题描述颜色','默认为模板副色调','85','cn','1');
INSERT INTO met_ui_config VALUES('188','7','case_list','met_m1156_7','m1156ui010','9','0','','hovercolor','hovercolor-1','#f06ca8','','区块配色调','默认为模板配色调','86','cn','1');
INSERT INTO met_ui_config VALUES('189','7','case_list','met_m1156_7','m1156ui010','9','0','','textcolor','textcolor','#383838','','描述文字颜色','默认为模板副色调','87','cn','1');
INSERT INTO met_ui_config VALUES('190','7','case_list','met_m1156_7','m1156ui010','9','0','','showcolor','showcolor','#ffffff','','内容背景色','内容列表的每个背景色','88','cn','1');
INSERT INTO met_ui_config VALUES('191','7','case_list','met_m1156_7','m1156ui010','9','0','','tagcolor','tagcolor-1','#aaaaaa','','标签文字颜色','默认为模板副色调','89','cn','1');
INSERT INTO met_ui_config VALUES('192','7','case_list','met_m1156_7','m1156ui010','9','0','','focuscolor','focuscolor','#ffffff','','标题鼠标经过颜色','鼠标经过列表内容标题时的颜色','90','cn','1');
INSERT INTO met_ui_config VALUES('193','7','case_list','met_m1156_7','m1156ui010','9','0','','bordercolor','bordercolor-1','#eeeeee','','线条颜色','下方按钮边框线条颜色','91','cn','1');
INSERT INTO met_ui_config VALUES('194','8','feedback_list','met_m1156_7','m1156ui010','4','0','$M$开启$T$1$M$关闭$T$0','ui_show','ui_show','1','1','区块显示开关','当前UI区块的开启关闭设置，关闭后可以在可视化编辑中开启','0','cn','0');
INSERT INTO met_ui_config VALUES('195','8','feedback_list','met_m1156_7','m1156ui010','7','0','','bgimg','bgimg','','','区块背景图','背景图片建议尺寸：1920px * 1080px','1','cn','0');
INSERT INTO met_ui_config VALUES('196','8','feedback_list','met_m1156_7','m1156ui010','4','0','开启$T$1$M$关闭$T$0','bgok','bgok-1','1','1','背景图开关','设置区块的背景是否启用背景图','1','cn','0');
INSERT INTO met_ui_config VALUES('197','8','feedback_list','met_m1156_7','m1156ui010','2','0','','bgtitle','bgtitle','','','区块标题名称','区块隐藏标题，用于整页滚动切换类模板的导航','15','cn','1');
INSERT INTO met_ui_config VALUES('198','8','feedback_list','met_m1156_7','m1156ui010','2','4','','bgcolumn','bgcolumn','','','区块显示的栏目','指定同一模块下需要显示该区块的栏目名称；多栏目显示使用“|”隔开；格式：栏目名称1|栏目名称2； （首页不需要设置此项）（不填写则不限制显示）','16','cn','1');
INSERT INTO met_ui_config VALUES('199','8','feedback_list','met_m1156_7','m1156ui010','2','0','','title','abouttitle','立即报名','立即报名','标题文字','区块正上方标题文字','29','cn','0');
INSERT INTO met_ui_config VALUES('200','8','feedback_list','met_m1156_7','m1156ui010','3','0','','description','description','让我们一起来分享瑜伽文化带给我们的美丽容颜、快乐心情、完美人生','','标题描述','区块正上方描述文字','30','cn','0');
INSERT INTO met_ui_config VALUES('201','8','feedback_list','met_m1156_7','m1156ui010','6','4','','columnid','imgcolumn','134','','反馈栏目选择','必须选中反馈模块的栏目','46','cn','0');
INSERT INTO met_ui_config VALUES('202','8','feedback_list','met_m1156_7','m1156ui010','2','0','','name','name','免费报名','免费报名','表单名称','请控制字数在4个字内；区块左上方斜字；填写0则不显示','58','cn','0');
INSERT INTO met_ui_config VALUES('203','8','feedback_list','met_m1156_7','m1156ui010','2','0','','titles','titles','填写表单','填写表单','表单标题','表单提示大标题；填写0则不显示','59','cn','0');
INSERT INTO met_ui_config VALUES('204','8','feedback_list','met_m1156_7','m1156ui010','2','0','','say','say','( 提示：<font color=#f00>*</font> 为必填选项 )','( 提示：<b>*</b> 为必填选项 )','提示内容','表单提示内容描述；填写0则不显示','60','cn','0');
INSERT INTO met_ui_config VALUES('205','8','feedback_list','met_m1156_7','m1156ui010','2','0','','paddinglg','paddinglg-1','40','40','间距距离（电脑端）','电脑端区块距离上下其他区块的距离，建议设置为 40 px','80','cn','0');
INSERT INTO met_ui_config VALUES('206','8','feedback_list','met_m1156_7','m1156ui010','2','0','','paddingsm','paddingsm-1','30','30','间距距离（平板端）','平板端区块距离上下其他区块的距离，建议设置为 30 px','81','cn','0');
INSERT INTO met_ui_config VALUES('207','8','feedback_list','met_m1156_7','m1156ui010','2','0','','paddingxs','paddingxs-1','20','20','间距距离（手机端）','手机端区块距离上下其他区块的距离，建议设置为 20 px','82','cn','0');
INSERT INTO met_ui_config VALUES('208','8','feedback_list','met_m1156_7','m1156ui010','9','0','','bgcolor','bgcolor','#f5f5f5','','区块背景色','默认为网站背景颜色；如果添加了“区块背景图”则背景色会被遮挡。','82','cn','1');
INSERT INTO met_ui_config VALUES('209','8','feedback_list','met_m1156_7','m1156ui010','9','0','','namecolor','namecolor','#333333','','标题颜色','默认为模板主色调','83','cn','1');
INSERT INTO met_ui_config VALUES('210','8','feedback_list','met_m1156_7','m1156ui010','9','0','','titlecolor','titlecolor-1','#91969b','','标题文字颜色','默认为模板主色调','84','cn','1');
INSERT INTO met_ui_config VALUES('211','8','feedback_list','met_m1156_7','m1156ui010','9','0','','desccolor','desccolor','#91969b','','描述文字颜色','默认为模板副色调','85','cn','1');
INSERT INTO met_ui_config VALUES('212','8','feedback_list','met_m1156_7','m1156ui010','9','0','','hovercolor','hovercolor-1','#be6fe8','','鼠标经过颜色','默认为模板配色调','86','cn','1');
INSERT INTO met_ui_config VALUES('213','8','feedback_list','met_m1156_7','m1156ui010','9','0','','biaocolor','biaocolor','#ffffff','','区标字体颜色','默认为模板副色调','87','cn','1');
INSERT INTO met_ui_config VALUES('214','8','feedback_list','met_m1156_7','m1156ui010','9','0','','biaobgcolor','biaobgcolor','#be6fe8','','区标背景色','左上斜字标题的区域背景色','87','cn','1');
INSERT INTO met_ui_config VALUES('215','8','feedback_list','met_m1156_7','m1156ui010','9','0','','showcolor','showcolor','#ffffff','','内容背景色','表单内容区的背景色','88','cn','1');
INSERT INTO met_ui_config VALUES('216','8','feedback_list','met_m1156_7','m1156ui010','9','0','','hintcolor','hintcolor','#333333','','提示主文字颜色','表单提示大标题的颜色','89','cn','1');
INSERT INTO met_ui_config VALUES('217','8','feedback_list','met_m1156_7','m1156ui010','9','0','','hintscolor','hintscolor','#91969b','','提示副文字颜色','表单提示内容描述的颜色','89','cn','1');
INSERT INTO met_ui_config VALUES('218','8','feedback_list','met_m1156_7','m1156ui010','9','0','','bordercolor','bordercolor-1','#cccccc','','线条颜色','表单边框线条的颜色','91','cn','1');
INSERT INTO met_ui_config VALUES('219','8','feedback_list','met_m1156_7','m1156ui010','9','0','','inputbgcolor','inputbgcolor','#ffffff','','表单背景色','表单每个控件的背景色','92','cn','1');
INSERT INTO met_ui_config VALUES('220','8','feedback_list','met_m1156_7','m1156ui010','9','0','','inputcolor','inputcolor','#333333','','表单文字颜色','表单每个控件的文字颜色','93','cn','1');
INSERT INTO met_ui_config VALUES('221','8','feedback_list','met_m1156_7','m1156ui010','9','0','','buttoncolor','buttoncolor-1','#ffffff','#ffffff','按钮字体颜色','默认为白色','94','cn','1');
INSERT INTO met_ui_config VALUES('222','8','feedback_list','met_m1156_7','m1156ui010','9','0','','buttonbgcolor','buttonbgcolor','#f06ca8','','按钮背景色','默认为模板配色调','95','cn','1');
INSERT INTO met_ui_config VALUES('223','9','foot_nav','met_m1156_7','m1156ui010','4','0','$M$开启$T$1$M$关闭$T$0','ui_show','ui_show','1','1','区块显示开关','当前UI区块的开启关闭设置，关闭后可以在可视化编辑中开启','0','cn','0');
INSERT INTO met_ui_config VALUES('224','9','foot_nav','met_m1156_7','m1156ui010','4','0','开启$T$1$M$关闭$T$0','full','full-1','','0','全屏宽显示','区块是否全屏宽度显示','15','cn','0');
INSERT INTO met_ui_config VALUES('225','9','foot_nav','met_m1156_7','m1156ui010','4','0','$M$开启$T$1$M$关闭$T$0','nav2ok','nav2ok','1','1','底部导航次级','底部导航次级栏目的开关；栏目过多时会自动轮播显示','17','cn','0');
INSERT INTO met_ui_config VALUES('226','9','foot_nav','met_m1156_7','m1156ui010','2','0','','phonetel','phonetel','服务热线','服务热线','热线文字','右侧联系的小标题文字','18','cn','1');
INSERT INTO met_ui_config VALUES('227','9','foot_nav','met_m1156_7','m1156ui010','2','0','','info_tel','info_tel','4000-000-000','4000-000-000','热线号码','右侧联系的电话号码','19','cn','0');
INSERT INTO met_ui_config VALUES('228','9','foot_nav','met_m1156_7','m1156ui010','2','0','','info_dsc','info_dsc','客服服务时段：周一至周五，9:30 - 20:30，节假日休息','服务时间 9:00-22:00','描述文字','右侧联系的小描述文字','20','cn','0');
INSERT INTO met_ui_config VALUES('229','9','foot_nav','met_m1156_7','m1156ui010','6','4','','iconid','iconid-1','130','','联系图标','新建一个图标联系栏目；然后添加子栏目，使用“外部模块”在“链接地址”写入联系链接、“小图标icon”选择联系图标、“栏目图片”弹出二维码图片；（提示！！！QQ的联系链接是：http://wpa.qq.com/msgrd?v=3&uin=您的QQ号码&site=qq&menu=yes）','22','cn','0');
INSERT INTO met_ui_config VALUES('230','9','foot_nav','met_m1156_7','m1156ui010','2','0','','paddinglg','paddinglg','40','40','上下方距离','（电脑端）区块上下方的间距','23','cn','1');
INSERT INTO met_ui_config VALUES('231','9','foot_nav','met_m1156_7','m1156ui010','2','0','','paddingmd','paddingmd','30','30','上下方距离','（平板端）区块上下方的间距','24','cn','1');
INSERT INTO met_ui_config VALUES('232','9','foot_nav','met_m1156_7','m1156ui010','2','0','','paddingxs','paddingxs','20','20','上下方距离','（手机端）区块上下方的间距','25','cn','1');
INSERT INTO met_ui_config VALUES('233','9','foot_nav','met_m1156_7','m1156ui010','9','0','','bgcolor','bgcolor','#222222','','区块背景色','默认为网站背景颜色','31','cn','1');
INSERT INTO met_ui_config VALUES('234','9','foot_nav','met_m1156_7','m1156ui010','9','0','','titlecolor','titlecolor-1','#dddddd','','标题文字颜色','默认为模板主色调','32','cn','1');
INSERT INTO met_ui_config VALUES('235','9','foot_nav','met_m1156_7','m1156ui010','9','0','','desccolor','desccolor-1','#aaaaaa','','描述文字颜色','默认为模板副色调','33','cn','1');
INSERT INTO met_ui_config VALUES('236','9','foot_nav','met_m1156_7','m1156ui010','9','0','','hovercolor','hovercolor-1','#ffffff','','区块配色调','默认为模板配色调','34','cn','1');
INSERT INTO met_ui_config VALUES('237','9','foot_nav','met_m1156_7','m1156ui010','9','0','','bordercolor','bordercolor-1','#444444','','线条颜色','用于右侧联系方式的分割线和图标边框','35','cn','1');
INSERT INTO met_ui_config VALUES('238','9','foot_nav','met_m1156_7','m1156ui010','9','0','','telcolor','telcolor','#ffffff','','电话号码颜色','默认为模板配色调','36','cn','1');
INSERT INTO met_ui_config VALUES('239','10','foot_info','met_m1156_5','m1156ui010','4','0','$M$开启$T$1$M$关闭$T$0','ui_show','ui_show','1','1','区块显示开关','当前UI区块的开启关闭设置，关闭后可以在可视化编辑中开启','0','cn','0');
INSERT INTO met_ui_config VALUES('240','10','foot_info','met_m1156_5','m1156ui010','4','0','$M$开启$T$1$M$关闭$T$0','navok','navok','0','1','底部导航开关','','3','cn','0');
INSERT INTO met_ui_config VALUES('241','10','foot_info','met_m1156_5','m1156ui010','4','0','$M$开启$T$1$M$关闭$T$0','linkok','linkok','1','1','友链开关','右下角友情链接开关','5','cn','0');
INSERT INTO met_ui_config VALUES('242','10','foot_info','met_m1156_5','m1156ui010','2','0','','linktitle','linktitle','友情链接：','友情链接：','友链标题','友情链接的标题文字','6','cn','0');
INSERT INTO met_ui_config VALUES('243','10','foot_info','met_m1156_5','m1156ui010','4','0','$M$开启$T$1$M$关闭$T$0','simok','simok-1','1','1','繁简体切换开关','此处开启后还需要到后台语言设置开启','7','cn','0');
INSERT INTO met_ui_config VALUES('244','10','foot_info','met_m1156_5','m1156ui010','4','0','$M$开启$T$1$M$关闭$T$0','langok','langok-1','1','1','语言切换开关','此处开启后还需要到后台语言设置开启','8','cn','0');
INSERT INTO met_ui_config VALUES('245','10','foot_info','met_m1156_5','m1156ui010','4','0','$M$开启$T$1$M$关闭$T$0','langqiok','langqiok-1','1','1','语言国旗开关','','9','cn','0');
INSERT INTO met_ui_config VALUES('246','10','foot_info','met_m1156_5','m1156ui010','4','0','$M$左右分开$T$1$M$居中对齐$T$0','contenttype','contenttype','0','1','内容展示模式','','12','cn','0');
INSERT INTO met_ui_config VALUES('247','10','foot_info','met_m1156_5','m1156ui010','4','0','开启$T$1$M$关闭$T$0','boticon_ok','boticon_ok','','1','手机端按钮区块开关','','60','cn','0');
INSERT INTO met_ui_config VALUES('248','10','foot_info','met_m1156_5','m1156ui010','2','0','','iconone','iconone','','phone','手机端按钮一图标','默认为电话图标，可在http://fontawesome.dashgame.com找图标，复制图标名称填写','61','cn','0');
INSERT INTO met_ui_config VALUES('249','10','foot_info','met_m1156_5','m1156ui010','2','0','','icontwo','icontwo','','envelope','手机端按钮二图标','默认为邮件图标，可在http://fontawesome.dashgame.com找图标，复制图标名称填写','62','cn','0');
INSERT INTO met_ui_config VALUES('250','10','foot_info','met_m1156_5','m1156ui010','2','0','','iconthird','iconthird','','map-marker','手机端按钮三图标','默认为地图图标，可在http://fontawesome.dashgame.com找图标，复制图标名称填写','63','cn','0');
INSERT INTO met_ui_config VALUES('251','10','foot_info','met_m1156_5','m1156ui010','2','0','','iconfour','iconfour','','qq','手机端按钮四图标','默认为qq图标，可在http://fontawesome.dashgame.com找图标，复制图标名称填写','64','cn','0');
INSERT INTO met_ui_config VALUES('252','10','foot_info','met_m1156_5','m1156ui010','2','0','','icononet','icononet','','电话咨询','手机端按钮一标题','填写0隐藏','65','cn','0');
INSERT INTO met_ui_config VALUES('253','10','foot_info','met_m1156_5','m1156ui010','2','0','','icontwot','icontwot','','邮件咨询','手机端按钮二标题','填写0隐藏','66','cn','0');
INSERT INTO met_ui_config VALUES('254','10','foot_info','met_m1156_5','m1156ui010','2','0','','iconthirdt','iconthirdt','','在线地图','手机端按钮三标题','填写0隐藏','67','cn','0');
INSERT INTO met_ui_config VALUES('255','10','foot_info','met_m1156_5','m1156ui010','2','0','','iconfourt','iconfourt','','QQ客服','手机端按钮四标题','填写0隐藏','68','cn','0');
INSERT INTO met_ui_config VALUES('256','10','foot_info','met_m1156_5','m1156ui010','3','0','','icononelink','icononelink','','tel:4000000000','手机端按钮一链接','电话链接为【tel:您的电话号码】，如：tel:4000000000；短信链接为【sms:您的手机号码】如：sms:13300000000；','69','cn','0');
INSERT INTO met_ui_config VALUES('257','10','foot_info','met_m1156_5','m1156ui010','3','0','','icontwolink','icontwolink','','mailto:email@email.mt','手机端按钮二链接','邮箱链接为【mailto:你的邮箱】，如：mailto:4000000000','70','cn','0');
INSERT INTO met_ui_config VALUES('258','10','foot_info','met_m1156_5','m1156ui010','3','0','','iconthirdlink','iconthirdlink','','https://uri.amap.com/marker?position=112.941052,28.128617&name=长沙洋湖总经济区','手机端按钮三链接','百度地图链接：http://api.map.baidu.com/marker?location=纬度,经度&title=所在位置名称&content=所在位置的简介（可选）&output=html；高德地图链接：https://uri.amap.com/marker?position=经度,纬度&name=你的位置，如：https://uri.amap.com/marker?position=112.941052,28.128617&name=长沙洋湖总经济区','71','cn','0');
INSERT INTO met_ui_config VALUES('259','10','foot_info','met_m1156_5','m1156ui010','3','0','','iconfourlink','iconfourlink','','http://wpa.qq.com/msgrd?v=3&uin=00000000&site=qq&menu=yes','手机端按钮四链接','个人qq链接：http://wpa.qq.com/msgrd?v=3&uin=QQ号码&site=qq&menu=yes；企业QQ链接：http://crm2.qq.com/page/portalpage/wpa.php?uin=QQ号码&aty=0&a=0&curl=&ty=1','72','cn','0');
INSERT INTO met_ui_config VALUES('260','10','foot_info','met_m1156_5','m1156ui010','9','0','','bgcolor','bgcolor','#282828','','区块背景色','默认为网站背景颜色','521','cn','1');
INSERT INTO met_ui_config VALUES('261','10','foot_info','met_m1156_5','m1156ui010','9','0','','titlecolor','titlecolor-1','#dddddd','','标题文字颜色','默认为模板主色调','522','cn','1');
INSERT INTO met_ui_config VALUES('262','10','foot_info','met_m1156_5','m1156ui010','9','0','','desccolor','desccolor-1','#cccccc','','描述文字颜色','默认为模板副色调','523','cn','1');
INSERT INTO met_ui_config VALUES('263','10','foot_info','met_m1156_5','m1156ui010','9','0','','hovercolor','hovercolor-1','#ffffff','','区块配色调','默认为模板配色调','524','cn','1');
INSERT INTO met_ui_config VALUES('264','10','foot_info','met_m1156_5','m1156ui010','9','0','','buttonbgcolor','buttonbgcolor-1','','','按钮背景色','繁简体按钮和语言切换按钮的背景色','530','cn','1');
INSERT INTO met_ui_config VALUES('265','10','foot_info','met_m1156_5','m1156ui010','9','0','','buttontitlecolor','buttontitlecolor-1','','','按钮文字颜色','繁简体按钮和语言切换按钮的文字颜色','531','cn','1');
INSERT INTO met_ui_config VALUES('266','10','foot_info','met_m1156_5','m1156ui010','9','0','','bottomiconc','bottomiconc','','#ffffff','手机端按钮图标颜色','默认为#ffffff','573','cn','1');
INSERT INTO met_ui_config VALUES('267','10','foot_info','met_m1156_5','m1156ui010','9','0','','bottombgc','bottombgc','','','手机端按钮区块背景颜色','默认为网站配色调','574','cn','1');
INSERT INTO met_ui_config VALUES('268','10','foot_info','met_m1156_5','m1156ui010','9','0','','bottomicontc','bottomicontc','','#ffffff','手机端按钮图标标题颜色','默认为#ffffff','575','cn','1');
INSERT INTO met_ui_config VALUES('269','10','foot_info','met_m1156_5','m1156ui010','2','0','','opacity','opacity-1','','1','手机端按钮区块背景颜色透明度','设置0-1之间的值，1为不透明，0为完全透明','576','cn','1');
INSERT INTO met_ui_config VALUES('270','50','back_top','met_m1156_1','m1156ui010','4','3','$M$开启$T$1$M$关闭$T$0','ui_show','ui_show','1','1','区块显示开关','当前UI区块的开启关闭设置，关闭后可以在可视化编辑中开启','0','cn','0');
INSERT INTO met_ui_config VALUES('271','50','back_top','met_m1156_1','m1156ui010','9','3','','bgcolor','bgcolor','#f06ca8','','按钮背景色','默认为红色背景','2','cn','0');
INSERT INTO met_ui_config VALUES('272','50','back_top','met_m1156_1','m1156ui010','9','3','','titlecolor','titlecolor-1','#ffffff','','图标颜色','默认为模板主色调','3','cn','0');
INSERT INTO met_ui_config VALUES('273','50','back_top','met_m1156_1','m1156ui010','9','3','','hovercolor','hovercolor-1','#be6fe8','','鼠标配色调','默认为模板配色调','4','cn','0');
INSERT INTO met_ui_config VALUES('274','50','back_top','met_m1156_1','m1156ui010','2','0','','number','window','1','1','出现高度','页面滚动到第几个屏幕高度时出现按钮','5','cn','0');
INSERT INTO met_ui_config VALUES('275','50','back_top','met_m1156_1','m1156ui010','2','0','','width','width','45','45','按钮尺寸','建议尺寸：45px','6','cn','0');
INSERT INTO met_ui_config VALUES('276','50','back_top','met_m1156_1','m1156ui010','2','0','','right','right','15','15','右方距离','建议距离：15px','8','cn','0');
INSERT INTO met_ui_config VALUES('277','50','back_top','met_m1156_1','m1156ui010','2','0','','bottom','bottom','15','15','下方距离','建议距离：15px','9','cn','0');
INSERT INTO met_ui_config VALUES('278','14','location','met_m1156_7','m1156ui010','4','3','$M$开启$T$1$M$关闭$T$0','ui_show','ui_show','1','1','区块显示开关','当前UI区块的开启关闭设置，关闭后可以在可视化编辑中开启','0','cn','0');
INSERT INTO met_ui_config VALUES('279','14','location','met_m1156_7','m1156ui010','7','0','','bgimg','bgimg-1','','','区块背景图','背景图片建议尺寸：1920px * 1080px；该ui为组合型ui模块，设置的背景图会覆盖整个组合ui区域；','1','cn','0');
INSERT INTO met_ui_config VALUES('280','14','location','met_m1156_7','m1156ui010','4','0','开启$T$1$M$关闭$T$0','bgok','bgok-1','1','1','背景图开关','设置区块的背景是否启用背景图','1','cn','0');
INSERT INTO met_ui_config VALUES('281','14','location','met_m1156_7','m1156ui010','2','0','','all','all','全部','全部','全部文字','下拉菜单显示的主栏目标题文字','6','cn','0');
INSERT INTO met_ui_config VALUES('282','14','location','met_m1156_7','m1156ui010','9','3','','bgcolor','bgcolor','#f5f5f5','','区块背景色','默认为网站背景颜色；该ui为组合型ui模块，设置的背景色会覆盖整个组合ui区域；','12','cn','1');
INSERT INTO met_ui_config VALUES('283','14','location','met_m1156_7','m1156ui010','9','0','','showcolor','showcolor-1','#ffffff','','内容区背景色','内容区块的背景色','13','cn','1');
INSERT INTO met_ui_config VALUES('284','14','location','met_m1156_7','m1156ui010','9','3','','titlecolor','titlecolor-1','#333333','','标题文字颜色','默认为模板主色调','14','cn','1');
INSERT INTO met_ui_config VALUES('285','14','location','met_m1156_7','m1156ui010','9','3','','hovercolor','hovercolor-1','#f06ca8','','区块配色调','默认为模板配色调','15','cn','1');
INSERT INTO met_ui_config VALUES('286','14','location','met_m1156_7','m1156ui010','9','0','','nav2titlecolor','nav2titlecolor-1','#333333','','次级栏目字体色','默认为模板主色调','16','cn','1');
INSERT INTO met_ui_config VALUES('287','14','location','met_m1156_7','m1156ui010','9','0','','nav2bordercolor','nav2bordercolor','#eeeeee','','次级栏目线条颜色','下拉菜单次级栏目的边框线条颜色','17','cn','1');
INSERT INTO met_ui_config VALUES('288','14','location','met_m1156_7','m1156ui010','9','0','','nav2bgcolor','nav2bgcolor-1','#ffffff','','次级栏目背景色','默认为内容区块背景色','18','cn','1');
INSERT INTO met_ui_config VALUES('289','14','location','met_m1156_7','m1156ui010','9','0','','nav2hovercolor','nav2hovercolor-1','#ffffff','','次级栏目选中颜色','默认为模板配色调','19','cn','1');
INSERT INTO met_ui_config VALUES('290','14','location','met_m1156_7','m1156ui010','9','0','','nav2hoverbgcolor','nav2hoverbgcolor-1','#f06ca8','','次级栏目选中背景色','默认为内容区块背景色','20','cn','1');
INSERT INTO met_ui_config VALUES('291','20','show','met_m1156_7','m1156ui010','4','3','$M$开启$T$1$M$关闭$T$0','ui_show','ui_show','1','1','区块显示开关','当前UI区块的开启关闭设置，关闭后可以在可视化编辑中开启','0','cn','0');
INSERT INTO met_ui_config VALUES('292','20','show','met_m1156_7','m1156ui010','7','0','','bgimg','bgimg-1','','','区块背景图','背景图片建议尺寸：1920px * 1080px；如果开启“面包屑”ui模块，界面会调用它的背景图，则该设置无效','1','cn','0');
INSERT INTO met_ui_config VALUES('293','20','show','met_m1156_7','m1156ui010','4','0','开启$T$1$M$关闭$T$0','bgok','bgok-1','1','1','背景图开关','设置区块的背景是否启用背景图','1','cn','0');
INSERT INTO met_ui_config VALUES('294','20','show','met_m1156_7','m1156ui010','9','3','','bgcolor','bgcolor','#f5f5f5','','区块背景色','默认为网站背景颜色；如果开启“面包屑”ui模块，界面会调用它的背景颜色，则该设置无效；','82','cn','1');
INSERT INTO met_ui_config VALUES('295','20','show','met_m1156_7','m1156ui010','9','3','','showcolor','showcolor','#ffffff','','内容区背景色','区域中间内容部分的背景颜色','83','cn','1');
INSERT INTO met_ui_config VALUES('296','20','show','met_m1156_7','m1156ui010','9','3','','hovercolor','hovercolor-1','#f06ca8','','区块配色调','超链接内容鼠标经过颜色','87','cn','1');
INSERT INTO met_ui_config VALUES('297','11','sidebar','met_m1156_7','m1156ui010','4','4','$M$开启$T$1$M$关闭$T$0','ui_show','ui_show','1','1','区块显示开关','当前UI区块的开启关闭设置，关闭后可以在可视化编辑中开启','0','cn','0');
INSERT INTO met_ui_config VALUES('298','11','sidebar','met_m1156_7','m1156ui010','2','0','','service_name','service_name','教练团队','产品推荐','区块名称（上方区块）','上方图文区块的标题名称','6','cn','0');
INSERT INTO met_ui_config VALUES('299','11','sidebar','met_m1156_7','m1156ui010','6','4','','service_id','service_id','105','','栏目选择（上方区块）','上方图文区块的内容列表栏目','7','cn','0');
INSERT INTO met_ui_config VALUES('300','11','sidebar','met_m1156_7','m1156ui010','4','4','全部$T$$M$推荐$T$com','service_type','service_type','','','展示类型（上方区块）','上方图文区块的内容类型','8','cn','0');
INSERT INTO met_ui_config VALUES('301','11','sidebar','met_m1156_7','m1156ui010','2','4','','service_num','service_num','3','4','显示数量（上方区块）','上方图文区块的内容列表数量','9','cn','0');
INSERT INTO met_ui_config VALUES('302','11','sidebar','met_m1156_7','m1156ui010','2','4','','service_width','service_width','300','300','图片宽度（上方区块）','上方图文区块的图片宽度','11','cn','0');
INSERT INTO met_ui_config VALUES('303','11','sidebar','met_m1156_7','m1156ui010','2','4','','service_height','service_height','200','200','图片高度（上方区块）','上方图文区块的图片高度','12','cn','0');
INSERT INTO met_ui_config VALUES('304','11','sidebar','met_m1156_7','m1156ui010','4','0','开启$T$1$M$关闭$T$0','service_ok','service_ok','1','1','区块开关（上方区块）','上方图文区块的开关','13','cn','0');
INSERT INTO met_ui_config VALUES('305','11','sidebar','met_m1156_7','m1156ui010','2','0','','information_name','information_name','新闻动态','新闻动态','区块名称（下方区块）','下方区块的标题名称','19','cn','0');
INSERT INTO met_ui_config VALUES('306','11','sidebar','met_m1156_7','m1156ui010','6','4','','information_id','information_id','101','','栏目选择（下方区块）','下方区块的内容列表栏目','20','cn','0');
INSERT INTO met_ui_config VALUES('307','11','sidebar','met_m1156_7','m1156ui010','4','4','全部$T$$M$推荐$T$com','information_type','information_type','','','展示类型（下方区块）','下方区块的内容类型','21','cn','0');
INSERT INTO met_ui_config VALUES('308','11','sidebar','met_m1156_7','m1156ui010','2','4','','information_num','information_num','4','4','显示数量（下方区块）','下方区块的内容列表数量','22','cn','0');
INSERT INTO met_ui_config VALUES('309','11','sidebar','met_m1156_7','m1156ui010','4','0','开启$T$1$M$关闭$T$0','information_ok','information_ok','1','1','区块开关（下方区块）','下方区块的开关','23','cn','0');
INSERT INTO met_ui_config VALUES('310','11','sidebar','met_m1156_7','m1156ui010','9','4','','bgcolor','bgcolor','#f5f5f5','','区块背景色','默认为模板背景色','92','cn','1');
INSERT INTO met_ui_config VALUES('311','11','sidebar','met_m1156_7','m1156ui010','9','4','','showcolor','showcolor','#ffffff','','内容区背景色','默认为模板背景色','93','cn','1');
INSERT INTO met_ui_config VALUES('312','11','sidebar','met_m1156_7','m1156ui010','9','4','','titlecolor','titlecolor-1','#333333','','标题文字颜色','默认为模板主色调','94','cn','1');
INSERT INTO met_ui_config VALUES('313','11','sidebar','met_m1156_7','m1156ui010','9','4','','desccolor','desccolor-1','#383838','','描述文字颜色','默认为模板副色调','95','cn','1');
INSERT INTO met_ui_config VALUES('314','11','sidebar','met_m1156_7','m1156ui010','9','4','','hovercolor','hovercolor-1','#f06ca8','','区块配色调','默认为模板配色调','96','cn','1');
INSERT INTO met_ui_config VALUES('315','11','sidebar','met_m1156_7','m1156ui010','9','0','','bordercolor','bordercolor-1','#eeeeee','','线条颜色','默认不显示','97','cn','1');
INSERT INTO met_ui_config VALUES('316','15','location','met_m1156_7','m1156ui010','4','3','$M$开启$T$1$M$关闭$T$0','ui_show','ui_show','1','1','区块显示开关','当前UI区块的开启关闭设置，关闭后可以在可视化编辑中开启','0','cn','0');
INSERT INTO met_ui_config VALUES('317','15','location','met_m1156_7','m1156ui010','7','0','','bgimg','bgimg-1','','','区块背景图','背景图片建议尺寸：1920px * 1080px；该ui为组合型ui模块，设置的背景图会覆盖整个组合ui区域；','1','cn','0');
INSERT INTO met_ui_config VALUES('318','15','location','met_m1156_7','m1156ui010','4','0','开启$T$1$M$关闭$T$0','bgok','bgok-1','1','1','背景图开关','设置区块的背景是否启用背景图','1','cn','0');
INSERT INTO met_ui_config VALUES('319','15','location','met_m1156_7','m1156ui010','2','0','','all','all','全部','全部','全部文字','下拉菜单显示的主栏目标题文字','6','cn','0');
INSERT INTO met_ui_config VALUES('320','15','location','met_m1156_7','m1156ui010','9','3','','bgcolor','bgcolor','#f5f5f5','','区块背景色','默认为网站背景颜色；该ui为组合型ui模块，设置的背景色会覆盖整个组合ui区域；','12','cn','1');
INSERT INTO met_ui_config VALUES('321','15','location','met_m1156_7','m1156ui010','9','0','','showcolor','showcolor-1','#ffffff','','内容区背景色','内容区块的背景色','13','cn','1');
INSERT INTO met_ui_config VALUES('322','15','location','met_m1156_7','m1156ui010','9','3','','titlecolor','titlecolor-1','#333333','','标题文字颜色','默认为模板主色调','14','cn','1');
INSERT INTO met_ui_config VALUES('323','15','location','met_m1156_7','m1156ui010','9','3','','hovercolor','hovercolor-1','#f06ca8','','区块配色调','默认为模板配色调','15','cn','1');
INSERT INTO met_ui_config VALUES('324','15','location','met_m1156_7','m1156ui010','9','0','','nav2titlecolor','nav2titlecolor-1','#333333','','次级栏目字体色','默认为模板主色调','16','cn','1');
INSERT INTO met_ui_config VALUES('325','15','location','met_m1156_7','m1156ui010','9','0','','nav2bordercolor','nav2bordercolor','#eeeeee','','次级栏目线条颜色','下拉菜单次级栏目的边框线条颜色','17','cn','1');
INSERT INTO met_ui_config VALUES('326','15','location','met_m1156_7','m1156ui010','9','0','','nav2bgcolor','nav2bgcolor-1','#ffffff','','次级栏目背景色','默认为内容区块背景色','18','cn','1');
INSERT INTO met_ui_config VALUES('327','15','location','met_m1156_7','m1156ui010','9','0','','nav2hovercolor','nav2hovercolor-1','#ffffff','','次级栏目选中颜色','默认为模板配色调','19','cn','1');
INSERT INTO met_ui_config VALUES('328','15','location','met_m1156_7','m1156ui010','9','0','','nav2hoverbgcolor','nav2hoverbgcolor-1','#f06ca8','','次级栏目选中背景色','默认为内容区块背景色','20','cn','1');
INSERT INTO met_ui_config VALUES('329','21','news_list_page','met_m1156_7','m1156ui010','4','3','$M$开启$T$1$M$关闭$T$0','ui_show','ui_show','1','1','区块显示开关','当前UI区块的开启关闭设置，关闭后可以在可视化编辑中开启','0','cn','0');
INSERT INTO met_ui_config VALUES('330','21','news_list_page','met_m1156_7','m1156ui010','7','3','','bgimg','bgimg','','','区块背景图','背景图片建议尺寸：1920px * 1080px','1','cn','0');
INSERT INTO met_ui_config VALUES('331','21','news_list_page','met_m1156_7','m1156ui010','4','0','开启$T$1$M$关闭$T$0','bgok','bgok-1','1','1','背景图开关','设置区块的背景是否启用背景图','1','cn','0');
INSERT INTO met_ui_config VALUES('332','21','news_list_page','met_m1156_7','m1156ui010','4','0','极简$T$1$M$图文$T$2$M$橱窗$T$3','listtype','listtype-1','2','2','列表展示方式','自定义模式和橱窗模式下新闻头条无效；','20','cn','0');
INSERT INTO met_ui_config VALUES('333','21','news_list_page','met_m1156_7','m1156ui010','4','3','$M$开启$T$1$M$关闭$T$0','headlines','headlines','0','0','新闻头条','头条将采用大图轮播的方式展现；橱窗模式下无效！','21','cn','0');
INSERT INTO met_ui_config VALUES('334','21','news_list_page','met_m1156_7','m1156ui010','2','3','','headlines_num','headlines_num','3','3','头条数量','数量必须小于文章列表页每页显示条数','22','cn','0');
INSERT INTO met_ui_config VALUES('335','21','news_list_page','met_m1156_7','m1156ui010','2','3','','headlines_x','headlines_x','900','900','头条图片宽度','建议尺寸：900','23','cn','0');
INSERT INTO met_ui_config VALUES('336','21','news_list_page','met_m1156_7','m1156ui010','2','3','','headlines_y','headlines_y','300','300','头条图片高度','建议尺寸：300','24','cn','0');
INSERT INTO met_ui_config VALUES('337','21','news_list_page','met_m1156_7','m1156ui010','2','3','','ccimg_x','ccimg_x','900','900','橱窗模式图片宽度','建议尺寸：900','25','cn','0');
INSERT INTO met_ui_config VALUES('338','21','news_list_page','met_m1156_7','m1156ui010','2','3','','ccimg_y','ccimg_y','300','300','橱窗模式图片高度','建议尺寸：300','26','cn','0');
INSERT INTO met_ui_config VALUES('339','21','news_list_page','met_m1156_7','m1156ui010','2','0','','descnum','descnum','50','50','描述文字个数','新闻简单描述的字体格式；字体个数会因中英文和符合等因素影响展示','27','cn','0');
INSERT INTO met_ui_config VALUES('340','21','news_list_page','met_m1156_7','m1156ui010','2','0','','datestrong','datestrong','Y年m月d日','Y年m月d日','日期格式','“Y”为年份，“m”为月份，“d”为日期','28','cn','0');
INSERT INTO met_ui_config VALUES('341','21','news_list_page','met_m1156_7','m1156ui010','2','0','','more','more-1','阅读更多>>','阅读更多>>','更多文字','右下方查看详情的按钮文字','29','cn','1');
INSERT INTO met_ui_config VALUES('342','21','news_list_page','met_m1156_7','m1156ui010','9','3','','bgcolor','bgcolor','#f5f5f5','','区块背景色','默认为网站背景颜色；如果添加了“区块背景图”则背景色会被遮挡。','82','cn','1');
INSERT INTO met_ui_config VALUES('343','21','news_list_page','met_m1156_7','m1156ui010','9','3','','titlecolor','titlecolor-1','#333333','','标题文字颜色','默认为模板主色调','83','cn','1');
INSERT INTO met_ui_config VALUES('344','21','news_list_page','met_m1156_7','m1156ui010','9','3','','desccolor','desccolor-1','#383838','','描述文字颜色','默认为模板副色调','84','cn','1');
INSERT INTO met_ui_config VALUES('345','21','news_list_page','met_m1156_7','m1156ui010','9','3','','hovercolor','hovercolor-1','#f06ca8','','区块配色调','默认为模板配色调','85','cn','1');
INSERT INTO met_ui_config VALUES('346','21','news_list_page','met_m1156_7','m1156ui010','9','0','','headlinescolor','headlinescolor','#ffffff','#ffffff','头条标题颜色','默认为默认为白色','86','cn','1');
INSERT INTO met_ui_config VALUES('347','21','news_list_page','met_m1156_7','m1156ui010','9','3','','showcolor','showcolor','#ffffff','','内容区背景色','区域中间内容部分的背景颜色','92','cn','1');
INSERT INTO met_ui_config VALUES('348','21','news_list_page','met_m1156_7','m1156ui010','9','0','','bordercolor','bordercolor-1','#eeeeee','','线条颜色','分割线线条颜色','93','cn','1');
INSERT INTO met_ui_config VALUES('349','21','news_list_page','met_m1156_7','m1156ui010','9','0','','datecolor','datacolor-1','#555555','','数据内容颜色','日期点击数等数据内容的字体颜色','94','cn','1');
INSERT INTO met_ui_config VALUES('350','21','news_list_page','met_m1156_7','m1156ui010','9','0','','morecolor','morecolor','#f06ca8','','更多文字颜色','右下方查看详情的按钮颜色','95','cn','1');
INSERT INTO met_ui_config VALUES('351','21','news_list_page','met_m1156_7','m1156ui010','9','3','','pagebgcolor','pagercolor','#fcfcfc','','翻页按钮背景色','默认为白色','98','cn','1');
INSERT INTO met_ui_config VALUES('352','21','news_list_page','met_m1156_7','m1156ui010','9','0','','pagetitlecolor','pagetitlecolor','#333333','','翻页按钮字体颜色','默认为模板副色调','99','cn','1');
INSERT INTO met_ui_config VALUES('353','21','news_list_page','met_m1156_7','m1156ui010','9','0','','pagehovercolor','pagehovercolor','#ffffff','','翻页选中按钮字体颜色','默认为模板配色调','100','cn','1');
INSERT INTO met_ui_config VALUES('354','12','sidebar','met_m1156_7','m1156ui010','4','4','$M$开启$T$1$M$关闭$T$0','ui_show','ui_show','1','1','区块显示开关','当前UI区块的开启关闭设置，关闭后可以在可视化编辑中开启','0','cn','0');
INSERT INTO met_ui_config VALUES('355','12','sidebar','met_m1156_7','m1156ui010','2','0','','service_name','service_name','教练团队','产品推荐','区块名称（上方区块）','上方图文区块的标题名称','6','cn','0');
INSERT INTO met_ui_config VALUES('356','12','sidebar','met_m1156_7','m1156ui010','6','4','','service_id','service_id','105','','栏目选择（上方区块）','上方图文区块的内容列表栏目','7','cn','0');
INSERT INTO met_ui_config VALUES('357','12','sidebar','met_m1156_7','m1156ui010','4','4','全部$T$$M$推荐$T$com','service_type','service_type','','','展示类型（上方区块）','上方图文区块的内容类型','8','cn','0');
INSERT INTO met_ui_config VALUES('358','12','sidebar','met_m1156_7','m1156ui010','2','4','','service_num','service_num','4','4','显示数量（上方区块）','上方图文区块的内容列表数量','9','cn','0');
INSERT INTO met_ui_config VALUES('359','12','sidebar','met_m1156_7','m1156ui010','2','4','','service_width','service_width','300','300','图片宽度（上方区块）','上方图文区块的图片宽度','11','cn','0');
INSERT INTO met_ui_config VALUES('360','12','sidebar','met_m1156_7','m1156ui010','2','4','','service_height','service_height','200','200','图片高度（上方区块）','上方图文区块的图片高度','12','cn','0');
INSERT INTO met_ui_config VALUES('361','12','sidebar','met_m1156_7','m1156ui010','4','0','开启$T$1$M$关闭$T$0','service_ok','service_ok','1','1','区块开关（上方区块）','上方图文区块的开关','13','cn','0');
INSERT INTO met_ui_config VALUES('362','12','sidebar','met_m1156_7','m1156ui010','2','0','','information_name','information_name','新闻动态','新闻动态','区块名称（下方区块）','下方区块的标题名称','19','cn','0');
INSERT INTO met_ui_config VALUES('363','12','sidebar','met_m1156_7','m1156ui010','6','4','','information_id','information_id','101','','栏目选择（下方区块）','下方区块的内容列表栏目','20','cn','0');
INSERT INTO met_ui_config VALUES('364','12','sidebar','met_m1156_7','m1156ui010','4','4','全部$T$$M$推荐$T$com','information_type','information_type','','','展示类型（下方区块）','下方区块的内容类型','21','cn','0');
INSERT INTO met_ui_config VALUES('365','12','sidebar','met_m1156_7','m1156ui010','2','4','','information_num','information_num','4','4','显示数量（下方区块）','下方区块的内容列表数量','22','cn','0');
INSERT INTO met_ui_config VALUES('366','12','sidebar','met_m1156_7','m1156ui010','4','0','开启$T$1$M$关闭$T$0','information_ok','information_ok','1','1','区块开关（下方区块）','下方区块的开关','23','cn','0');
INSERT INTO met_ui_config VALUES('367','12','sidebar','met_m1156_7','m1156ui010','9','4','','bgcolor','bgcolor','#f5f5f5','','区块背景色','默认为模板背景色','92','cn','1');
INSERT INTO met_ui_config VALUES('368','12','sidebar','met_m1156_7','m1156ui010','9','4','','showcolor','showcolor','#ffffff','','内容区背景色','默认为模板背景色','93','cn','1');
INSERT INTO met_ui_config VALUES('369','12','sidebar','met_m1156_7','m1156ui010','9','4','','titlecolor','titlecolor-1','#333333','','标题文字颜色','默认为模板主色调','94','cn','1');
INSERT INTO met_ui_config VALUES('370','12','sidebar','met_m1156_7','m1156ui010','9','4','','desccolor','desccolor-1','#383838','','描述文字颜色','默认为模板副色调','95','cn','1');
INSERT INTO met_ui_config VALUES('371','12','sidebar','met_m1156_7','m1156ui010','9','4','','hovercolor','hovercolor-1','#f06ca8','','区块配色调','默认为模板配色调','96','cn','1');
INSERT INTO met_ui_config VALUES('372','12','sidebar','met_m1156_7','m1156ui010','9','0','','bordercolor','bordercolor-1','#eeeeee','','线条颜色','默认不显示','97','cn','1');
INSERT INTO met_ui_config VALUES('373','16','location','met_m1156_7','m1156ui010','4','3','$M$开启$T$1$M$关闭$T$0','ui_show','ui_show','1','1','区块显示开关','当前UI区块的开启关闭设置，关闭后可以在可视化编辑中开启','0','cn','0');
INSERT INTO met_ui_config VALUES('374','16','location','met_m1156_7','m1156ui010','7','0','','bgimg','bgimg-1','','','区块背景图','背景图片建议尺寸：1920px * 1080px；该ui为组合型ui模块，设置的背景图会覆盖整个组合ui区域；','1','cn','0');
INSERT INTO met_ui_config VALUES('375','16','location','met_m1156_7','m1156ui010','4','0','开启$T$1$M$关闭$T$0','bgok','bgok-1','1','1','背景图开关','设置区块的背景是否启用背景图','1','cn','0');
INSERT INTO met_ui_config VALUES('376','16','location','met_m1156_7','m1156ui010','2','0','','all','all','全部','全部','全部文字','下拉菜单显示的主栏目标题文字','6','cn','0');
INSERT INTO met_ui_config VALUES('377','16','location','met_m1156_7','m1156ui010','9','3','','bgcolor','bgcolor','#fafafa','','区块背景色','默认为网站背景颜色；该ui为组合型ui模块，设置的背景色会覆盖整个组合ui区域；','12','cn','1');
INSERT INTO met_ui_config VALUES('378','16','location','met_m1156_7','m1156ui010','9','0','','showcolor','showcolor-1','#ffffff','','内容区背景色','内容区块的背景色','13','cn','1');
INSERT INTO met_ui_config VALUES('379','16','location','met_m1156_7','m1156ui010','9','3','','titlecolor','titlecolor-1','#333333','','标题文字颜色','默认为模板主色调','14','cn','1');
INSERT INTO met_ui_config VALUES('380','16','location','met_m1156_7','m1156ui010','9','3','','hovercolor','hovercolor-1','#f06ca8','','区块配色调','默认为模板配色调','15','cn','1');
INSERT INTO met_ui_config VALUES('381','16','location','met_m1156_7','m1156ui010','9','0','','nav2titlecolor','nav2titlecolor-1','#333333','','次级栏目字体色','默认为模板主色调','16','cn','1');
INSERT INTO met_ui_config VALUES('382','16','location','met_m1156_7','m1156ui010','9','0','','nav2bordercolor','nav2bordercolor','#eeeeee','','次级栏目线条颜色','下拉菜单次级栏目的边框线条颜色','17','cn','1');
INSERT INTO met_ui_config VALUES('383','16','location','met_m1156_7','m1156ui010','9','0','','nav2bgcolor','nav2bgcolor-1','#ffffff','','次级栏目背景色','默认为内容区块背景色','18','cn','1');
INSERT INTO met_ui_config VALUES('384','16','location','met_m1156_7','m1156ui010','9','0','','nav2hovercolor','nav2hovercolor-1','#ffffff','','次级栏目选中颜色','默认为模板配色调','19','cn','1');
INSERT INTO met_ui_config VALUES('385','16','location','met_m1156_7','m1156ui010','9','0','','nav2hoverbgcolor','nav2hoverbgcolor-1','#f06ca8','','次级栏目选中背景色','默认为内容区块背景色','20','cn','1');
INSERT INTO met_ui_config VALUES('386','58','para_search','met_16_1','m1156ui010','4','0','$M$开启$T$1$M$关闭$T$0','ui_show','ui_show','0','1','区块显示开关','当前UI区块的开启关闭设置，关闭后可以在可视化编辑中开启','1','cn','0');
INSERT INTO met_ui_config VALUES('387','58','para_search','met_16_1','m1156ui010','4','0','$M$固定宽度$T$1$M$全屏$T$0','type','type-1','1','1','展示样式','','2','cn','0');
INSERT INTO met_ui_config VALUES('388','58','para_search','met_16_1','m1156ui010','4','0','$M$开启$T$1$M$关闭$T$0','sort_ok','sort_ok','1','1','排序','可以按照推荐，点击次数，最新来排序，在开启商城的前提下产品模块还有按销量来排序','3','cn','0');
INSERT INTO met_ui_config VALUES('389','58','para_search','met_16_1','m1156ui010','4','0','$M$开启$T$1$M$关闭$T$0','attr_ok','attr_ok','1','1','参数搜索','只有在有参数管理的的模块下才有参数搜索，比如产品，图片，下载等模块','4','cn','0');
INSERT INTO met_ui_config VALUES('390','58','para_search','met_16_1','m1156ui010','2','0','','padding','padding-1','5','30','电脑区块边距','默认为30px','5','cn','0');
INSERT INTO met_ui_config VALUES('391','58','para_search','met_16_1','m1156ui010','2','0','','padding_p','padding_p-1','5','20','平板区块边距','默认为20px','6','cn','0');
INSERT INTO met_ui_config VALUES('392','58','para_search','met_16_1','m1156ui010','2','0','','padding_m','padding_m','5','10','手机区块边距','默认为10px','7','cn','0');
INSERT INTO met_ui_config VALUES('393','58','para_search','met_16_1','m1156ui010','2','4','1','xl_width','sm_width','','8.33','pc端（宽度大于等于1200px）参数名称所占整行宽度比列','最大100%为整行宽度的一半，默认8.33%，设置支持100以内可保留两位小数，直接数字设置不需要单位','8','cn','0');
INSERT INTO met_ui_config VALUES('394','58','para_search','met_16_1','m1156ui010','2','4','1','lg_width','lg_width','','16.67','平板端（宽度小于1200大于等于768px）参数名称所占整行宽度','最大100%为整行宽度的一半，默认16.67%，设置支持100以内保留两位小数，直接数字设置不需要单位','9','cn','0');
INSERT INTO met_ui_config VALUES('395','58','para_search','met_16_1','m1156ui010','2','4','1','sm_width','xl_width','','25','手机端（宽度小于768px大于等于481px）参数名称所占整行宽度','最大100%为整行宽度的一半，默认25%，设置支持100以内保留两位小数，直接数字设置不需要单位，小屏手机端（宽度小于等于480px）参数单独占一行展示行','10','cn','0');
INSERT INTO met_ui_config VALUES('396','58','para_search','met_16_1','m1156ui010','9','0','','pricecolor','pricecolor-1','','','价格颜色','默认为模板主色调','11','cn','1');
INSERT INTO met_ui_config VALUES('397','58','para_search','met_16_1','m1156ui010','9','0','','priceline','priceline','#e4eaec','#e4eaec','价格搜索框颜色','默认为#e4eaec','12','cn','1');
INSERT INTO met_ui_config VALUES('398','58','para_search','met_16_1','m1156ui010','9','0','','confirmbgcolor','confirmbgcolor','#f96868','#f96868','确认按钮背景色','默认为#f96868','13','cn','1');
INSERT INTO met_ui_config VALUES('399','58','para_search','met_16_1','m1156ui010','9','0','','confirmcolor','confirmcolor','#ffffff','#ffffff','确认按钮文字色','默认为#ffffff','14','cn','1');
INSERT INTO met_ui_config VALUES('400','58','para_search','met_16_1','m1156ui010','9','0','','bgcolor','bgcolor-1','#ffffff','','区块背景色','默认为网站背景色','15','cn','1');
INSERT INTO met_ui_config VALUES('401','58','para_search','met_16_1','m1156ui010','9','0','','attr_namebgcolor','attr_namebgcolor','','','筛选参数名称背景色','默认为#e5e5e5','16','cn','1');
INSERT INTO met_ui_config VALUES('402','58','para_search','met_16_1','m1156ui010','9','0','','attr_nametextcolor','attr_nametextcolor','','','筛选参数名称字体颜色','默认为#76838f','17','cn','1');
INSERT INTO met_ui_config VALUES('403','58','para_search','met_16_1','m1156ui010','9','0','','attr_vbgcolor','attr_vbgcolor','#fafafa','#fafafa','筛选参数值背景色','默认为#fafafa','18','cn','1');
INSERT INTO met_ui_config VALUES('404','58','para_search','met_16_1','m1156ui010','9','0','','attr_vtextcolor','attr_vtextcolor','','','筛选参数值字体颜色','默认为模板副色调','19','cn','1');
INSERT INTO met_ui_config VALUES('405','58','para_search','met_16_1','m1156ui010','9','0','','border_color','border_color','','','筛选边框颜色','默认为#e4e4e4','20','cn','1');
INSERT INTO met_ui_config VALUES('406','58','para_search','met_16_1','m1156ui010','9','0','','hovercolor','hovercolor-1','','','筛选文字鼠标经过色','默认为模板配色调','21','cn','1');
INSERT INTO met_ui_config VALUES('407','58','para_search','met_16_1','m1156ui010','9','0','','sort_bgcolor','sort_bgcolor','','','排序背景色','默认为白色','22','cn','1');
INSERT INTO met_ui_config VALUES('408','58','para_search','met_16_1','m1156ui010','9','0','','sort_textcolor','sort_textcolor','','','排序字体颜色','默认为模板主色调','23','cn','1');
INSERT INTO met_ui_config VALUES('409','58','para_search','met_16_1','m1156ui010','9','0','','sort_hovercolor','sort_hovercolor','','','排序字体鼠标经过颜色','默认为模板配色调','24','cn','1');
INSERT INTO met_ui_config VALUES('410','22','product_list_page','met_m1156_7','m1156ui010','4','3','$M$开启$T$1$M$关闭$T$0','ui_show','ui_show','1','1','区块显示开关','当前UI区块的开启关闭设置，关闭后可以在可视化编辑中开启','0','cn','0');
INSERT INTO met_ui_config VALUES('411','22','product_list_page','met_m1156_7','m1156ui010','7','3','','bgimg','bgimg','','','区块背景图','背景图片建议尺寸：1920px * 1080px；如果开启“面包屑”ui模块，界面会调用它的背景图，则该设置无效','1','cn','0');
INSERT INTO met_ui_config VALUES('412','22','product_list_page','met_m1156_7','m1156ui010','4','0','开启$T$1$M$关闭$T$0','bgok','bgok-1','1','1','背景图开关','设置区块的背景是否启用背景图','1','cn','0');
INSERT INTO met_ui_config VALUES('413','22','product_list_page','met_m1156_7','m1156ui010','4','0','标准$T$1$M$纯图$T$2$M$橱窗$T$3','listtype','listtype-1','1','1','列表展示方式','当设置栏目标识为“1”时列表展示方式为“标准模式”；当设置栏目标识为“2”时列表展示方式为“纯图模式”；当设置栏目标识为“3”时列表展示方式为“橱窗模式”。','11','cn','0');
INSERT INTO met_ui_config VALUES('414','22','product_list_page','met_m1156_7','m1156ui010','2','0','','xlg','xs','3','3','大尺寸电脑显示列数','大尺寸电脑：浏览器宽度大于1600像素','12','cn','0');
INSERT INTO met_ui_config VALUES('415','22','product_list_page','met_m1156_7','m1156ui010','2','0','','lg','md','3','3','普通电脑显示列数','普通电脑：浏览器宽度大于992像素小于1600像素','13','cn','0');
INSERT INTO met_ui_config VALUES('416','22','product_list_page','met_m1156_7','m1156ui010','2','0','','md','lg','2','2','平板显示列数','平板：浏览器宽度大于768像素小于992像素','14','cn','0');
INSERT INTO met_ui_config VALUES('417','22','product_list_page','met_m1156_7','m1156ui010','2','0','','xs','xlg','2','2','手机显示列数','手机：浏览器宽度小于768像素','15','cn','0');
INSERT INTO met_ui_config VALUES('418','22','product_list_page','met_m1156_7','m1156ui010','9','3','','bgcolor','bgcolor','#fafafa','','区块背景色','默认为网站背景颜色；如果开启“面包屑”ui模块，界面会调用它的背景颜色，则该设置无效','82','cn','1');
INSERT INTO met_ui_config VALUES('419','22','product_list_page','met_m1156_7','m1156ui010','9','3','','titlecolor','titlecolor-1','#333333','','标题文字颜色','默认为模板主色调','83','cn','1');
INSERT INTO met_ui_config VALUES('420','22','product_list_page','met_m1156_7','m1156ui010','9','3','','desccolor','desccolor-1','#383838','','描述文字颜色','默认为模板副色调','84','cn','1');
INSERT INTO met_ui_config VALUES('421','22','product_list_page','met_m1156_7','m1156ui010','9','3','','hovercolor','hovercolor-1','#f06ca8','','区块配色调','模板配色调','85','cn','1');
INSERT INTO met_ui_config VALUES('422','22','product_list_page','met_m1156_7','m1156ui010','9','0','','foucscolor','foucscolor','#ffffff','','区块副色调','区块中彩色区域中的文字颜色','86','cn','1');
INSERT INTO met_ui_config VALUES('423','22','product_list_page','met_m1156_7','m1156ui010','9','0','','detailcolor','detailcolor','#f06ca8','','详情按钮背景色','“橱窗”模式下的单个产品下方按钮背景色','87','cn','1');
INSERT INTO met_ui_config VALUES('424','22','product_list_page','met_m1156_7','m1156ui010','9','0','','pricecolor','pricecolor','#ff0000','','价格文字颜色','启用商城模式时的价格文字颜色','88','cn','1');
INSERT INTO met_ui_config VALUES('425','22','product_list_page','met_m1156_7','m1156ui010','9','3','','showcolor','showcolor','#ffffff','','内容区背景色','区域中间内容部分的背景颜色','92','cn','1');
INSERT INTO met_ui_config VALUES('426','22','product_list_page','met_m1156_7','m1156ui010','9','0','','paracolor','tagcolor-1','#333333','','参数文字颜色','默认为模板副色调','93','cn','1');
INSERT INTO met_ui_config VALUES('427','22','product_list_page','met_m1156_7','m1156ui010','9','3','','pagebgcolor','pagercolor','#ffffff','','翻页按钮背景色','默认为白色','98','cn','1');
INSERT INTO met_ui_config VALUES('428','22','product_list_page','met_m1156_7','m1156ui010','9','0','','pagetitlecolor','pagetitlecolor','#333333','','翻页按钮字体颜色','默认为模板副色调','99','cn','1');
INSERT INTO met_ui_config VALUES('429','22','product_list_page','met_m1156_7','m1156ui010','9','0','','pagehovercolor','pagehovercolor','#ffffff','','翻页选中按钮字体颜色','默认为模板配色调','100','cn','1');
INSERT INTO met_ui_config VALUES('430','13','sidebar','met_m1156_7','m1156ui010','4','4','$M$开启$T$1$M$关闭$T$0','ui_show','ui_show','1','1','区块显示开关','当前UI区块的开启关闭设置，关闭后可以在可视化编辑中开启','0','cn','0');
INSERT INTO met_ui_config VALUES('431','13','sidebar','met_m1156_7','m1156ui010','2','0','','service_name','service_name','教练团队','产品推荐','区块名称（上方区块）','上方图文区块的标题名称','6','cn','0');
INSERT INTO met_ui_config VALUES('432','13','sidebar','met_m1156_7','m1156ui010','6','4','','service_id','service_id','105','','栏目选择（上方区块）','上方图文区块的内容列表栏目','7','cn','0');
INSERT INTO met_ui_config VALUES('433','13','sidebar','met_m1156_7','m1156ui010','4','4','全部$T$$M$推荐$T$com','service_type','service_type','','','展示类型（上方区块）','上方图文区块的内容类型','8','cn','0');
INSERT INTO met_ui_config VALUES('434','13','sidebar','met_m1156_7','m1156ui010','2','4','','service_num','service_num','4','4','显示数量（上方区块）','上方图文区块的内容列表数量','9','cn','0');
INSERT INTO met_ui_config VALUES('435','13','sidebar','met_m1156_7','m1156ui010','2','4','','service_width','service_width','300','300','图片宽度（上方区块）','上方图文区块的图片宽度','11','cn','0');
INSERT INTO met_ui_config VALUES('436','13','sidebar','met_m1156_7','m1156ui010','2','4','','service_height','service_height','200','200','图片高度（上方区块）','上方图文区块的图片高度','12','cn','0');
INSERT INTO met_ui_config VALUES('437','13','sidebar','met_m1156_7','m1156ui010','4','0','开启$T$1$M$关闭$T$0','service_ok','service_ok','1','1','区块开关（上方区块）','上方图文区块的开关','13','cn','0');
INSERT INTO met_ui_config VALUES('438','13','sidebar','met_m1156_7','m1156ui010','2','0','','information_name','information_name','新闻动态','新闻动态','区块名称（下方区块）','下方区块的标题名称','19','cn','0');
INSERT INTO met_ui_config VALUES('439','13','sidebar','met_m1156_7','m1156ui010','6','4','','information_id','information_id','101','','栏目选择（下方区块）','下方区块的内容列表栏目','20','cn','0');
INSERT INTO met_ui_config VALUES('440','13','sidebar','met_m1156_7','m1156ui010','4','4','全部$T$$M$推荐$T$com','information_type','information_type','','','展示类型（下方区块）','下方区块的内容类型','21','cn','0');
INSERT INTO met_ui_config VALUES('441','13','sidebar','met_m1156_7','m1156ui010','2','4','','information_num','information_num','4','4','显示数量（下方区块）','下方区块的内容列表数量','22','cn','0');
INSERT INTO met_ui_config VALUES('442','13','sidebar','met_m1156_7','m1156ui010','4','0','开启$T$1$M$关闭$T$0','information_ok','information_ok','1','1','区块开关（下方区块）','下方区块的开关','23','cn','0');
INSERT INTO met_ui_config VALUES('443','13','sidebar','met_m1156_7','m1156ui010','9','4','','bgcolor','bgcolor','#fafafa','','区块背景色','默认为模板背景色','92','cn','1');
INSERT INTO met_ui_config VALUES('444','13','sidebar','met_m1156_7','m1156ui010','9','4','','showcolor','showcolor','#ffffff','','内容区背景色','默认为模板背景色','93','cn','1');
INSERT INTO met_ui_config VALUES('445','13','sidebar','met_m1156_7','m1156ui010','9','4','','titlecolor','titlecolor-1','#333333','','标题文字颜色','默认为模板主色调','94','cn','1');
INSERT INTO met_ui_config VALUES('446','13','sidebar','met_m1156_7','m1156ui010','9','4','','desccolor','desccolor-1','#383838','','描述文字颜色','默认为模板副色调','95','cn','1');
INSERT INTO met_ui_config VALUES('447','13','sidebar','met_m1156_7','m1156ui010','9','4','','hovercolor','hovercolor-1','#f06ca8','','区块配色调','默认为模板配色调','96','cn','1');
INSERT INTO met_ui_config VALUES('448','13','sidebar','met_m1156_7','m1156ui010','9','0','','bordercolor','bordercolor-1','#eeeeee','','线条颜色','默认不显示','97','cn','1');
INSERT INTO met_ui_config VALUES('449','17','location','met_m1156_7','m1156ui010','4','3','$M$开启$T$1$M$关闭$T$0','ui_show','ui_show','1','1','区块显示开关','当前UI区块的开启关闭设置，关闭后可以在可视化编辑中开启','0','cn','0');
INSERT INTO met_ui_config VALUES('450','17','location','met_m1156_7','m1156ui010','7','0','','bgimg','bgimg-1','','','区块背景图','背景图片建议尺寸：1920px * 1080px；该ui为组合型ui模块，设置的背景图会覆盖整个组合ui区域；','1','cn','0');
INSERT INTO met_ui_config VALUES('451','17','location','met_m1156_7','m1156ui010','4','0','开启$T$1$M$关闭$T$0','bgok','bgok-1','1','1','背景图开关','设置区块的背景是否启用背景图','1','cn','0');
INSERT INTO met_ui_config VALUES('452','17','location','met_m1156_7','m1156ui010','2','0','','all','all','全部','全部','全部文字','下拉菜单显示的主栏目标题文字','6','cn','0');
INSERT INTO met_ui_config VALUES('453','17','location','met_m1156_7','m1156ui010','9','3','','bgcolor','bgcolor','#fafafa','','区块背景色','默认为网站背景颜色；该ui为组合型ui模块，设置的背景色会覆盖整个组合ui区域；','12','cn','1');
INSERT INTO met_ui_config VALUES('454','17','location','met_m1156_7','m1156ui010','9','0','','showcolor','showcolor-1','#ffffff','','内容区背景色','内容区块的背景色','13','cn','1');
INSERT INTO met_ui_config VALUES('455','17','location','met_m1156_7','m1156ui010','9','3','','titlecolor','titlecolor-1','#333333','','标题文字颜色','默认为模板主色调','14','cn','1');
INSERT INTO met_ui_config VALUES('456','17','location','met_m1156_7','m1156ui010','9','3','','hovercolor','hovercolor-1','#f06ca8','','区块配色调','默认为模板配色调','15','cn','1');
INSERT INTO met_ui_config VALUES('457','17','location','met_m1156_7','m1156ui010','9','0','','nav2titlecolor','nav2titlecolor-1','#333333','','次级栏目字体色','默认为模板主色调','16','cn','1');
INSERT INTO met_ui_config VALUES('458','17','location','met_m1156_7','m1156ui010','9','0','','nav2bordercolor','nav2bordercolor','#eeeeee','','次级栏目线条颜色','下拉菜单次级栏目的边框线条颜色','17','cn','1');
INSERT INTO met_ui_config VALUES('459','17','location','met_m1156_7','m1156ui010','9','0','','nav2bgcolor','nav2bgcolor-1','#ffffff','','次级栏目背景色','默认为内容区块背景色','18','cn','1');
INSERT INTO met_ui_config VALUES('460','17','location','met_m1156_7','m1156ui010','9','0','','nav2hovercolor','nav2hovercolor-1','#ffffff','','次级栏目选中颜色','默认为模板配色调','19','cn','1');
INSERT INTO met_ui_config VALUES('461','17','location','met_m1156_7','m1156ui010','9','0','','nav2hoverbgcolor','nav2hoverbgcolor-1','#f06ca8','','次级栏目选中背景色','默认为内容区块背景色','20','cn','1');
INSERT INTO met_ui_config VALUES('462','23','img_list_page','met_m1156_7','m1156ui010','4','3','$M$开启$T$1$M$关闭$T$0','ui_show','ui_show','1','1','区块显示开关','当前UI区块的开启关闭设置，关闭后可以在可视化编辑中开启','0','cn','0');
INSERT INTO met_ui_config VALUES('463','23','img_list_page','met_m1156_7','m1156ui010','7','3','','bgimg','bgimg','','','区块背景图','背景图片建议尺寸：1920px * 1080px；如果开启“面包屑”ui模块，界面会调用它的背景图片，则该设置无效','1','cn','0');
INSERT INTO met_ui_config VALUES('464','23','img_list_page','met_m1156_7','m1156ui010','4','0','开启$T$1$M$关闭$T$0','bgok','bgok-1','1','1','背景图开关','设置区块的背景是否启用背景图','1','cn','0');
INSERT INTO met_ui_config VALUES('465','23','img_list_page','met_m1156_7','m1156ui010','4','0','图文模式$T$1$M$详细模式$T$2','listtype','listtype','2','1','列表展示方式','当设置栏目标识为“1”时列表展示方式为“图文模式”；当设置栏目标识为“2”时列表展示方式为“详细模式”。','11','cn','0');
INSERT INTO met_ui_config VALUES('466','23','img_list_page','met_m1156_7','m1156ui010','2','0','','xlg','xs','2','2','大尺寸电脑显示列数','大尺寸电脑：浏览器宽度大于1600像素','12','cn','0');
INSERT INTO met_ui_config VALUES('467','23','img_list_page','met_m1156_7','m1156ui010','2','0','','lg','md','2','2','普通电脑显示列数','普通电脑：浏览器宽度大于992像素小于1600像素','13','cn','0');
INSERT INTO met_ui_config VALUES('468','23','img_list_page','met_m1156_7','m1156ui010','2','0','','md','lg','2','2','平板显示列数','平板：浏览器宽度大于768像素小于992像素','14','cn','0');
INSERT INTO met_ui_config VALUES('469','23','img_list_page','met_m1156_7','m1156ui010','2','0','','xs','xlg','1','1','手机显示列数','手机：浏览器宽度小于768像素','15','cn','0');
INSERT INTO met_ui_config VALUES('470','23','img_list_page','met_m1156_7','m1156ui010','9','3','','bgcolor','bgcolor','#fafafa','','区块背景色','默认为网站背景颜色；如果开启“面包屑”ui模块，界面会调用它的背景颜色，则该设置无效','82','cn','1');
INSERT INTO met_ui_config VALUES('471','23','img_list_page','met_m1156_7','m1156ui010','9','3','','titlecolor','titlecolor-1','#333333','','标题文字颜色','默认为模板主色调','83','cn','1');
INSERT INTO met_ui_config VALUES('472','23','img_list_page','met_m1156_7','m1156ui010','9','3','','desccolor','desccolor-1','#383838','','描述文字颜色','默认为模板副色调','84','cn','1');
INSERT INTO met_ui_config VALUES('473','23','img_list_page','met_m1156_7','m1156ui010','9','3','','hovercolor','hovercolor-1','#f06ca8','','区块配色调','默认为模板配色调','85','cn','1');
INSERT INTO met_ui_config VALUES('474','23','img_list_page','met_m1156_7','m1156ui010','9','0','','foucscolor','foucscolor','#ffffff','','标题经过颜色','区块中彩色区域中的文字颜色；“图文模式”下标题有效','86','cn','1');
INSERT INTO met_ui_config VALUES('475','23','img_list_page','met_m1156_7','m1156ui010','9','3','','showcolor','showcolor','#ffffff','','内容区背景色','区域中间内容部分的背景颜色','92','cn','1');
INSERT INTO met_ui_config VALUES('476','23','img_list_page','met_m1156_7','m1156ui010','9','0','','tagcolor','tagcolor-1','#aaaaaa','','标签文字颜色','默认为模板副色调','93','cn','1');
INSERT INTO met_ui_config VALUES('477','23','img_list_page','met_m1156_7','m1156ui010','9','3','','pagebgcolor','pagercolor','#ffffff','#ffffff','翻页按钮背景色','默认为白色','98','cn','1');
INSERT INTO met_ui_config VALUES('478','23','img_list_page','met_m1156_7','m1156ui010','9','0','','pagetitlecolor','pagetitlecolor','#333333','','翻页按钮字体颜色','默认为模板副色调','99','cn','1');
INSERT INTO met_ui_config VALUES('479','23','img_list_page','met_m1156_7','m1156ui010','9','0','','pagehovercolor','pagehovercolor','#ffffff','','翻页选中按钮字体颜色','默认为模板配色调','100','cn','1');
INSERT INTO met_ui_config VALUES('480','19','sidebar','met_m1156_7','m1156ui010','4','4','$M$开启$T$1$M$关闭$T$0','ui_show','ui_show','1','1','区块显示开关','当前UI区块的开启关闭设置，关闭后可以在可视化编辑中开启','0','cn','0');
INSERT INTO met_ui_config VALUES('481','19','sidebar','met_m1156_7','m1156ui010','2','0','','service_name','service_name','教练团队','产品推荐','区块名称（上方区块）','上方图文区块的标题名称','6','cn','0');
INSERT INTO met_ui_config VALUES('482','19','sidebar','met_m1156_7','m1156ui010','6','4','','service_id','service_id','105','','栏目选择（上方区块）','上方图文区块的内容列表栏目','7','cn','0');
INSERT INTO met_ui_config VALUES('483','19','sidebar','met_m1156_7','m1156ui010','4','4','全部$T$$M$推荐$T$com','service_type','service_type','','','展示类型（上方区块）','上方图文区块的内容类型','8','cn','0');
INSERT INTO met_ui_config VALUES('484','19','sidebar','met_m1156_7','m1156ui010','2','4','','service_num','service_num','4','4','显示数量（上方区块）','上方图文区块的内容列表数量','9','cn','0');
INSERT INTO met_ui_config VALUES('485','19','sidebar','met_m1156_7','m1156ui010','2','4','','service_width','service_width','300','300','图片宽度（上方区块）','上方图文区块的图片宽度','11','cn','0');
INSERT INTO met_ui_config VALUES('486','19','sidebar','met_m1156_7','m1156ui010','2','4','','service_height','service_height','200','200','图片高度（上方区块）','上方图文区块的图片高度','12','cn','0');
INSERT INTO met_ui_config VALUES('487','19','sidebar','met_m1156_7','m1156ui010','4','0','开启$T$1$M$关闭$T$0','service_ok','service_ok','1','1','区块开关（上方区块）','上方图文区块的开关','13','cn','0');
INSERT INTO met_ui_config VALUES('488','19','sidebar','met_m1156_7','m1156ui010','2','0','','information_name','information_name','新闻动态','新闻动态','区块名称（下方区块）','下方区块的标题名称','19','cn','0');
INSERT INTO met_ui_config VALUES('489','19','sidebar','met_m1156_7','m1156ui010','6','4','','information_id','information_id','101','','栏目选择（下方区块）','下方区块的内容列表栏目','20','cn','0');
INSERT INTO met_ui_config VALUES('490','19','sidebar','met_m1156_7','m1156ui010','4','4','全部$T$$M$推荐$T$com','information_type','information_type','','','展示类型（下方区块）','下方区块的内容类型','21','cn','0');
INSERT INTO met_ui_config VALUES('491','19','sidebar','met_m1156_7','m1156ui010','2','4','','information_num','information_num','4','4','显示数量（下方区块）','下方区块的内容列表数量','22','cn','0');
INSERT INTO met_ui_config VALUES('492','19','sidebar','met_m1156_7','m1156ui010','4','0','开启$T$1$M$关闭$T$0','information_ok','information_ok','1','1','区块开关（下方区块）','下方区块的开关','23','cn','0');
INSERT INTO met_ui_config VALUES('493','19','sidebar','met_m1156_7','m1156ui010','9','4','','bgcolor','bgcolor','#fafafa','','区块背景色','默认为模板背景色','92','cn','1');
INSERT INTO met_ui_config VALUES('494','19','sidebar','met_m1156_7','m1156ui010','9','4','','showcolor','showcolor','#ffffff','','内容区背景色','默认为模板背景色','93','cn','1');
INSERT INTO met_ui_config VALUES('495','19','sidebar','met_m1156_7','m1156ui010','9','4','','titlecolor','titlecolor-1','#333333','','标题文字颜色','默认为模板主色调','94','cn','1');
INSERT INTO met_ui_config VALUES('496','19','sidebar','met_m1156_7','m1156ui010','9','4','','desccolor','desccolor-1','#383838','','描述文字颜色','默认为模板副色调','95','cn','1');
INSERT INTO met_ui_config VALUES('497','19','sidebar','met_m1156_7','m1156ui010','9','4','','hovercolor','hovercolor-1','#f06ca8','','区块配色调','默认为模板配色调','96','cn','1');
INSERT INTO met_ui_config VALUES('498','19','sidebar','met_m1156_7','m1156ui010','9','0','','bordercolor','bordercolor-1','#eeeeee','','线条颜色','默认不显示','97','cn','1');
INSERT INTO met_ui_config VALUES('499','57','subcolumn_nav','met_m1156_4','m1156ui010','4','1','$M$开启$T$1$M$关闭$T$0','ui_show','ui_show','1','1','区块显示开关','当前UI区块的开启关闭设置，关闭后可以在可视化编辑中开启','0','cn','0');
INSERT INTO met_ui_config VALUES('500','57','subcolumn_nav','met_m1156_4','m1156ui010','9','1','','bgcolor','bgcolor-1','#ffffff','','区块背景色','默认为网站背景颜色','1','cn','0');
INSERT INTO met_ui_config VALUES('501','57','subcolumn_nav','met_m1156_4','m1156ui010','9','1','','titlecolor','titlecolor','#de4c4c','','区块标题颜色','默认为模板主色调','2','cn','0');
INSERT INTO met_ui_config VALUES('502','57','subcolumn_nav','met_m1156_4','m1156ui010','9','1','','hovercolor','hovercolor','#f06ca8','','区块配色调','默认为模板配色调','4','cn','0');
INSERT INTO met_ui_config VALUES('503','57','subcolumn_nav','met_m1156_4','m1156ui010','9','0','','focuscolor','focuscolor','#ffffff','','区块副色调','彩色区块中的文字颜色','5','cn','0');
INSERT INTO met_ui_config VALUES('504','57','subcolumn_nav','met_m1156_4','m1156ui010','9','0','','bordercolor','bordercolor-1','#ffffff','','区块分割线条','','6','cn','0');
INSERT INTO met_ui_config VALUES('505','57','subcolumn_nav','met_m1156_4','m1156ui010','4','0','$M$开启$T$1$M$关闭$T$0','navsonopen','navsonopen','1','1','下级栏目开关','','9','cn','0');
INSERT INTO met_ui_config VALUES('506','57','subcolumn_nav','met_m1156_4','m1156ui010','9','0','','navsonbgcolor','navsonbgcolor','#ffffff','','下级栏目背景色','','10','cn','0');
INSERT INTO met_ui_config VALUES('507','57','subcolumn_nav','met_m1156_4','m1156ui010','9','0','','navsontitlecolor','navsontitlecolor-1','#333333','','下级栏目标题颜色','','11','cn','0');
INSERT INTO met_ui_config VALUES('508','57','subcolumn_nav','met_m1156_4','m1156ui010','9','0','','navsonbordercolor','navsonbordercolor-1','#eeeeee','','下级栏目线条颜色','','12','cn','0');
INSERT INTO met_ui_config VALUES('509','57','subcolumn_nav','met_m1156_4','m1156ui010','4','0','$M$开启$T$1$M$关闭$T$0','navsondown','navsondown','0','0','下级栏目三角符','','13','cn','0');
INSERT INTO met_ui_config VALUES('510','57','subcolumn_nav','met_m1156_4','m1156ui010','4','0','$M$开启$T$center$M$关闭$T$','navcenter','navcenter','center','','导航居中显示','','14','cn','0');
INSERT INTO met_ui_config VALUES('511','57','subcolumn_nav','met_m1156_4','m1156ui010','4','0','全屏宽$T$1$M$中间显示$T$0','navfull','navfull','','0','是否全屏宽展示','设置栏目内容部分宽度是否全屏宽展示','15','cn','0');
INSERT INTO met_ui_config VALUES('512','57','subcolumn_nav','met_m1156_4','m1156ui010','2','0','','navall','navall','全部','全部','总栏目文字','简介模块下无效','27','cn','0');
INSERT INTO met_ui_config VALUES('513','57','subcolumn_nav','met_m1156_4','m1156ui010','2','0','','navsonall','navsonall','全部','全部','次级栏目文字','','28','cn','0');
INSERT INTO met_ui_config VALUES('514','57','subcolumn_nav','met_m1156_4','m1156ui010','2','0','','navbarprohibit','navbarprohibit','','','禁用下拉名单','禁止指定栏目显示下拉菜单，请填写栏目名称，多个用竖线（|）隔开','29','cn','0');
INSERT INTO met_ui_config VALUES('515','25','job_list_page','met_m1156_5','m1156ui010','4','3','$M$开启$T$1$M$关闭$T$0','ui_show','ui_show','1','1','区块显示开关','当前UI区块的开启关闭设置，关闭后可以在可视化编辑中开启','1','cn','0');
INSERT INTO met_ui_config VALUES('516','25','job_list_page','met_m1156_5','m1156ui010','7','3','','bgimg','bgimg','','','区块背景图','背景图片建议尺寸：1920px * 1080px','2','cn','0');
INSERT INTO met_ui_config VALUES('517','25','job_list_page','met_m1156_5','m1156ui010','2','0','','cvtitle','cvtitle','在线应聘','在线应聘','按钮文字','','3','cn','0');
INSERT INTO met_ui_config VALUES('518','25','job_list_page','met_m1156_5','m1156ui010','4','0','$M$开启$T$1$M$关闭$T$0','cvok','cvop','1','','在线应聘开关','','4','cn','0');
INSERT INTO met_ui_config VALUES('519','25','job_list_page','met_m1156_5','m1156ui010','2','0','','paddinglg','paddinglg','50','','区块上下间距（电脑端）','电脑端区块距离上下的间距','5','cn','0');
INSERT INTO met_ui_config VALUES('520','25','job_list_page','met_m1156_5','m1156ui010','2','0','','paddingsm','paddingsm','30','','区块上下间距（平板端）','平板端区块距离上下的间距','6','cn','0');
INSERT INTO met_ui_config VALUES('521','25','job_list_page','met_m1156_5','m1156ui010','2','0','','paddingxs','paddingxs','20','','区块上下间距（手机端）','手机端区块距离上下的间距','7','cn','0');
INSERT INTO met_ui_config VALUES('522','25','job_list_page','met_m1156_5','m1156ui010','2','0','','marginbottom','marginbottom','','','内容列表间距','两个内容列表之间的上下间距','8','cn','1');
INSERT INTO met_ui_config VALUES('523','25','job_list_page','met_m1156_5','m1156ui010','9','3','','bgcolor','bgcolor','#fafafa','','区块背景色','默认为网站背景颜色；如果添加了“区块背景图”则背景色会被遮挡。','9','cn','1');
INSERT INTO met_ui_config VALUES('524','25','job_list_page','met_m1156_5','m1156ui010','9','3','','titlecolor','titlecolor-1','#333333','','标题文字颜色','默认为模板主色调','10','cn','1');
INSERT INTO met_ui_config VALUES('525','25','job_list_page','met_m1156_5','m1156ui010','9','3','','desccolor','desccolor-1','#383838','','描述文字颜色','默认为模板副色调','11','cn','1');
INSERT INTO met_ui_config VALUES('526','25','job_list_page','met_m1156_5','m1156ui010','9','3','','hovercolor','hovercolor-1','#f06ca8','','区块配色调','模板配色调','12','cn','1');
INSERT INTO met_ui_config VALUES('527','25','job_list_page','met_m1156_5','m1156ui010','9','0','','focuscolor','focuscolor-1','#ffffff','','区块副色调','区块中彩色区域中的文字颜色','13','cn','1');
INSERT INTO met_ui_config VALUES('528','25','job_list_page','met_m1156_5','m1156ui010','9','0','','datacolor','datacolor','#999999','','日期文字颜色','','14','cn','1');
INSERT INTO met_ui_config VALUES('529','25','job_list_page','met_m1156_5','m1156ui010','9','3','','pagebgcolor','pagercolor','#ffffff','','翻页按钮背景色','','15','cn','1');
INSERT INTO met_ui_config VALUES('530','25','job_list_page','met_m1156_5','m1156ui010','9','0','','pagetitlecolor','pagetitlecolor','#333333','','翻页按钮字体颜色','','16','cn','1');
INSERT INTO met_ui_config VALUES('531','25','job_list_page','met_m1156_5','m1156ui010','9','0','','pagehovercolor','pagehovercolor','#ffffff','','翻页选中按钮字体颜色','','17','cn','1');
INSERT INTO met_ui_config VALUES('532','25','job_list_page','met_m1156_5','m1156ui010','9','3','','showcolor','showcolor','#ffffff','','内容区背景色','区域中间内容部分的背景颜色','18','cn','1');
INSERT INTO met_ui_config VALUES('533','25','job_list_page','met_m1156_5','m1156ui010','9','0','','bordercolor','bordercolor-1','#eeeeee','','表单线条颜色','','19','cn','1');
INSERT INTO met_ui_config VALUES('534','25','job_list_page','met_m1156_5','m1156ui010','9','0','','borderbgcolor','borderbgcolor-1','#ffffff','','表单背景颜色','应聘表单的各个输入文本框的背景色','20','cn','1');
INSERT INTO met_ui_config VALUES('535','55','subcolumn_nav','met_m1156_4','m1156ui010','4','1','$M$开启$T$1$M$关闭$T$0','ui_show','ui_show','0','1','区块显示开关','当前UI区块的开启关闭设置，关闭后可以在可视化编辑中开启','0','cn','0');
INSERT INTO met_ui_config VALUES('536','55','subcolumn_nav','met_m1156_4','m1156ui010','9','1','','bgcolor','bgcolor-1','#ffffff','','区块背景色','默认为网站背景颜色','1','cn','0');
INSERT INTO met_ui_config VALUES('537','55','subcolumn_nav','met_m1156_4','m1156ui010','9','1','','titlecolor','titlecolor','#333333','','区块标题颜色','默认为模板主色调','2','cn','0');
INSERT INTO met_ui_config VALUES('538','55','subcolumn_nav','met_m1156_4','m1156ui010','9','1','','hovercolor','hovercolor','#f06ca8','','区块配色调','默认为模板配色调','4','cn','0');
INSERT INTO met_ui_config VALUES('539','55','subcolumn_nav','met_m1156_4','m1156ui010','9','0','','focuscolor','focuscolor','#ffffff','','区块副色调','彩色区块中的文字颜色','5','cn','0');
INSERT INTO met_ui_config VALUES('540','55','subcolumn_nav','met_m1156_4','m1156ui010','9','0','','bordercolor','bordercolor-1','#ffffff','','区块分割线条','','6','cn','0');
INSERT INTO met_ui_config VALUES('541','55','subcolumn_nav','met_m1156_4','m1156ui010','4','0','$M$开启$T$1$M$关闭$T$0','navsonopen','navsonopen','0','1','下级栏目开关','','9','cn','0');
INSERT INTO met_ui_config VALUES('542','55','subcolumn_nav','met_m1156_4','m1156ui010','9','0','','navsonbgcolor','navsonbgcolor','#ffffff','','下级栏目背景色','','10','cn','0');
INSERT INTO met_ui_config VALUES('543','55','subcolumn_nav','met_m1156_4','m1156ui010','9','0','','navsontitlecolor','navsontitlecolor-1','#333333','','下级栏目标题颜色','','11','cn','0');
INSERT INTO met_ui_config VALUES('544','55','subcolumn_nav','met_m1156_4','m1156ui010','9','0','','navsonbordercolor','navsonbordercolor-1','#eeeeee','','下级栏目线条颜色','','12','cn','0');
INSERT INTO met_ui_config VALUES('545','55','subcolumn_nav','met_m1156_4','m1156ui010','4','0','$M$开启$T$1$M$关闭$T$0','navsondown','navsondown','0','0','下级栏目三角符','','13','cn','0');
INSERT INTO met_ui_config VALUES('546','55','subcolumn_nav','met_m1156_4','m1156ui010','4','0','$M$开启$T$center$M$关闭$T$','navcenter','navcenter','center','','导航居中显示','','14','cn','0');
INSERT INTO met_ui_config VALUES('547','55','subcolumn_nav','met_m1156_4','m1156ui010','4','0','全屏宽$T$1$M$中间显示$T$0','navfull','navfull','','0','是否全屏宽展示','设置栏目内容部分宽度是否全屏宽展示','15','cn','0');
INSERT INTO met_ui_config VALUES('548','55','subcolumn_nav','met_m1156_4','m1156ui010','2','0','','navall','navall','全部','全部','总栏目文字','简介模块下无效','27','cn','0');
INSERT INTO met_ui_config VALUES('549','55','subcolumn_nav','met_m1156_4','m1156ui010','2','0','','navsonall','navsonall','全部','全部','次级栏目文字','','28','cn','0');
INSERT INTO met_ui_config VALUES('550','55','subcolumn_nav','met_m1156_4','m1156ui010','2','0','','navbarprohibit','navbarprohibit','','','禁用下拉名单','禁止指定栏目显示下拉菜单，请填写栏目名称，多个用竖线（|）隔开','29','cn','0');
INSERT INTO met_ui_config VALUES('551','56','message','met_m1156_4','m1156ui010','4','0','$M$开启$T$1$M$关闭$T$0','ui_show','ui_show','1','1','区块显示开关','当前UI区块的开启关闭设置，关闭后可以在可视化编辑中开启','0','cn','0');
INSERT INTO met_ui_config VALUES('552','56','message','met_m1156_4','m1156ui010','7','0','','bgimg','bgimg','','','区块背景图','背景图片建议尺寸：1920px * 1080px','1','cn','0');
INSERT INTO met_ui_config VALUES('553','56','message','met_m1156_4','m1156ui010','9','0','','bgcolor','bgcolor','#fafafa','','区块背景色','默认为网站背景颜色；如果添加了“区块背景图”则背景色会被遮挡。','2','cn','0');
INSERT INTO met_ui_config VALUES('554','56','message','met_m1156_4','m1156ui010','9','0','','titlecolor','titlecolor-1','#333333','','标题文字颜色','默认为模板主色调','3','cn','0');
INSERT INTO met_ui_config VALUES('555','56','message','met_m1156_4','m1156ui010','9','0','','desccolor','desccolor-1','#383838','','描述文字颜色','默认为模板副色调','4','cn','0');
INSERT INTO met_ui_config VALUES('556','56','message','met_m1156_4','m1156ui010','9','0','','hovercolor','hovercolor-1','#f06ca8','','区块配色调','模板配色调','5','cn','0');
INSERT INTO met_ui_config VALUES('557','56','message','met_m1156_4','m1156ui010','9','0','','pagebgcolor','pagercolor-1','#f8f8f8','','翻页按钮背景色','','7','cn','0');
INSERT INTO met_ui_config VALUES('558','56','message','met_m1156_4','m1156ui010','9','0','','pagetitlecolor','pagetitlecolor','#333333','','翻页按钮字体颜色','','9','cn','0');
INSERT INTO met_ui_config VALUES('559','56','message','met_m1156_4','m1156ui010','9','0','','pagehovercolor','pagehovercolor','#ffffff','','翻页选中按钮字体颜色','','10','cn','0');
INSERT INTO met_ui_config VALUES('560','56','message','met_m1156_4','m1156ui010','9','0','','showcolor','showcolor','#ffffff','','内容区背景色','区域中间内容部分的背景颜色','11','cn','0');
INSERT INTO met_ui_config VALUES('561','56','message','met_m1156_4','m1156ui010','9','0','','headcolor','headcolor','#c2c2c2','','留言头像颜色','','12','cn','0');
INSERT INTO met_ui_config VALUES('562','56','message','met_m1156_4','m1156ui010','9','0','','listbgcolor','listbgcolor','#fcfcfc','','留言回复背景色','','13','cn','0');
INSERT INTO met_ui_config VALUES('563','56','message','met_m1156_4','m1156ui010','9','0','','bordercolor','bordercolor-1','#eeeeee','','表单线条颜色','留言表单的各文本框的线条颜色','38','cn','0');
INSERT INTO met_ui_config VALUES('564','56','message','met_m1156_4','m1156ui010','9','0','','borderbgcolor','borderbgcolor','#ffffff','','表单背景颜色','留言表单的各文本框的背景颜色','39','cn','0');
INSERT INTO met_ui_config VALUES('565','29','location','met_m1156_7','m1156ui010','4','3','$M$开启$T$1$M$关闭$T$0','ui_show','ui_show','1','1','区块显示开关','当前UI区块的开启关闭设置，关闭后可以在可视化编辑中开启','0','cn','0');
INSERT INTO met_ui_config VALUES('566','29','location','met_m1156_7','m1156ui010','7','0','','bgimg','bgimg-1','','','区块背景图','背景图片建议尺寸：1920px * 1080px；该ui为组合型ui模块，设置的背景图会覆盖整个组合ui区域；','1','cn','0');
INSERT INTO met_ui_config VALUES('567','29','location','met_m1156_7','m1156ui010','4','0','开启$T$1$M$关闭$T$0','bgok','bgok-1','1','1','背景图开关','设置区块的背景是否启用背景图','1','cn','0');
INSERT INTO met_ui_config VALUES('568','29','location','met_m1156_7','m1156ui010','2','0','','all','all','全部','全部','全部文字','下拉菜单显示的主栏目标题文字','6','cn','0');
INSERT INTO met_ui_config VALUES('569','29','location','met_m1156_7','m1156ui010','9','3','','bgcolor','bgcolor','#fafafa','','区块背景色','默认为网站背景颜色；该ui为组合型ui模块，设置的背景色会覆盖整个组合ui区域；','12','cn','1');
INSERT INTO met_ui_config VALUES('570','29','location','met_m1156_7','m1156ui010','9','0','','showcolor','showcolor-1','#ffffff','','内容区背景色','内容区块的背景色','13','cn','1');
INSERT INTO met_ui_config VALUES('571','29','location','met_m1156_7','m1156ui010','9','3','','titlecolor','titlecolor-1','#333333','','标题文字颜色','默认为模板主色调','14','cn','1');
INSERT INTO met_ui_config VALUES('572','29','location','met_m1156_7','m1156ui010','9','3','','hovercolor','hovercolor-1','#f06ca8','','区块配色调','默认为模板配色调','15','cn','1');
INSERT INTO met_ui_config VALUES('573','29','location','met_m1156_7','m1156ui010','9','0','','nav2titlecolor','nav2titlecolor-1','#333333','','次级栏目字体色','默认为模板主色调','16','cn','1');
INSERT INTO met_ui_config VALUES('574','29','location','met_m1156_7','m1156ui010','9','0','','nav2bordercolor','nav2bordercolor','#eeeeee','','次级栏目线条颜色','下拉菜单次级栏目的边框线条颜色','17','cn','1');
INSERT INTO met_ui_config VALUES('575','29','location','met_m1156_7','m1156ui010','9','0','','nav2bgcolor','nav2bgcolor-1','#ffffff','','次级栏目背景色','默认为内容区块背景色','18','cn','1');
INSERT INTO met_ui_config VALUES('576','29','location','met_m1156_7','m1156ui010','9','0','','nav2hovercolor','nav2hovercolor-1','#ffffff','','次级栏目选中颜色','默认为模板配色调','19','cn','1');
INSERT INTO met_ui_config VALUES('577','29','location','met_m1156_7','m1156ui010','9','0','','nav2hoverbgcolor','nav2hoverbgcolor-1','#f06ca8','','次级栏目选中背景色','默认为内容区块背景色','20','cn','1');
INSERT INTO met_ui_config VALUES('578','30','news_list_detail','met_m1156_7','m1156ui010','4','3','$M$开启$T$1$M$关闭$T$0','ui_show','ui_show','1','1','区块显示开关','当前UI区块的开启关闭设置，关闭后可以在可视化编辑中开启','0','cn','0');
INSERT INTO met_ui_config VALUES('579','30','news_list_detail','met_m1156_7','m1156ui010','7','0','','bgimg','bgimg-1','','','区块背景图','背景图片建议尺寸：1920px * 1080px；如果开启“面包屑”ui模块，界面会调用它的背景图，则该设置无效','1','cn','0');
INSERT INTO met_ui_config VALUES('580','30','news_list_detail','met_m1156_7','m1156ui010','4','0','开启$T$1$M$关闭$T$0','bgok','bgok-1','1','1','背景图开关','设置区块的背景是否启用背景图','1','cn','0');
INSERT INTO met_ui_config VALUES('581','30','news_list_detail','met_m1156_7','m1156ui010','9','3','','bgcolor','bgcolor','#fafafa','','区块背景色','默认为网站背景颜色；如果开启“面包屑”ui模块，界面会调用它的背景颜色，则该设置无效','82','cn','1');
INSERT INTO met_ui_config VALUES('582','30','news_list_detail','met_m1156_7','m1156ui010','9','3','','showcolor','showcolor','#ffffff','','内容区背景色','区域中间内容部分的背景颜色','83','cn','1');
INSERT INTO met_ui_config VALUES('583','30','news_list_detail','met_m1156_7','m1156ui010','9','3','','titlecolor','titlecolor-1','#333333','','标题文字颜色','默认为模板主色调','84','cn','1');
INSERT INTO met_ui_config VALUES('584','30','news_list_detail','met_m1156_7','m1156ui010','9','0','','datecolor','datacolor-1','#666666','','数据内容颜色','日期点击数等数据内容的字体颜色','85','cn','1');
INSERT INTO met_ui_config VALUES('585','30','news_list_detail','met_m1156_7','m1156ui010','9','3','','hovercolor','hovercolor-1','#f06ca8','','区块配色调','模板配色调','87','cn','1');
INSERT INTO met_ui_config VALUES('586','30','news_list_detail','met_m1156_7','m1156ui010','9','0','','bordercolor','bordercolor-1','#eeeeee','','线条颜色','上下页边框线条颜色','93','cn','1');
INSERT INTO met_ui_config VALUES('587','30','news_list_detail','met_m1156_7','m1156ui010','9','0','','pagecolor','pagecolor-1','#333333','','翻页按钮文字颜色','上下翻页按钮文字颜色','94','cn','1');
INSERT INTO met_ui_config VALUES('588','31','sidebar','met_m1156_7','m1156ui010','4','4','$M$开启$T$1$M$关闭$T$0','ui_show','ui_show','1','1','区块显示开关','当前UI区块的开启关闭设置，关闭后可以在可视化编辑中开启','0','cn','0');
INSERT INTO met_ui_config VALUES('589','31','sidebar','met_m1156_7','m1156ui010','2','0','','service_name','service_name','教练团队','产品推荐','区块名称（上方区块）','上方图文区块的标题名称','6','cn','0');
INSERT INTO met_ui_config VALUES('590','31','sidebar','met_m1156_7','m1156ui010','6','4','','service_id','service_id','105','','栏目选择（上方区块）','上方图文区块的内容列表栏目','7','cn','0');
INSERT INTO met_ui_config VALUES('591','31','sidebar','met_m1156_7','m1156ui010','4','4','全部$T$$M$推荐$T$com','service_type','service_type','','','展示类型（上方区块）','上方图文区块的内容类型','8','cn','0');
INSERT INTO met_ui_config VALUES('592','31','sidebar','met_m1156_7','m1156ui010','2','4','','service_num','service_num','4','4','显示数量（上方区块）','上方图文区块的内容列表数量','9','cn','0');
INSERT INTO met_ui_config VALUES('593','31','sidebar','met_m1156_7','m1156ui010','2','4','','service_width','service_width','300','300','图片宽度（上方区块）','上方图文区块的图片宽度','11','cn','0');
INSERT INTO met_ui_config VALUES('594','31','sidebar','met_m1156_7','m1156ui010','2','4','','service_height','service_height','200','200','图片高度（上方区块）','上方图文区块的图片高度','12','cn','0');
INSERT INTO met_ui_config VALUES('595','31','sidebar','met_m1156_7','m1156ui010','4','0','开启$T$1$M$关闭$T$0','service_ok','service_ok','1','1','区块开关（上方区块）','上方图文区块的开关','13','cn','0');
INSERT INTO met_ui_config VALUES('596','31','sidebar','met_m1156_7','m1156ui010','2','0','','information_name','information_name','新闻动态','新闻动态','区块名称（下方区块）','下方区块的标题名称','19','cn','0');
INSERT INTO met_ui_config VALUES('597','31','sidebar','met_m1156_7','m1156ui010','6','4','','information_id','information_id','','','栏目选择（下方区块）','下方区块的内容列表栏目','20','cn','0');
INSERT INTO met_ui_config VALUES('598','31','sidebar','met_m1156_7','m1156ui010','4','4','全部$T$$M$推荐$T$com','information_type','information_type','','','展示类型（下方区块）','下方区块的内容类型','21','cn','0');
INSERT INTO met_ui_config VALUES('599','31','sidebar','met_m1156_7','m1156ui010','2','4','','information_num','information_num','4','4','显示数量（下方区块）','下方区块的内容列表数量','22','cn','0');
INSERT INTO met_ui_config VALUES('600','31','sidebar','met_m1156_7','m1156ui010','4','0','开启$T$1$M$关闭$T$0','information_ok','information_ok','1','1','区块开关（下方区块）','下方区块的开关','23','cn','0');
INSERT INTO met_ui_config VALUES('601','31','sidebar','met_m1156_7','m1156ui010','9','4','','bgcolor','bgcolor','#fafafa','','区块背景色','默认为模板背景色','92','cn','1');
INSERT INTO met_ui_config VALUES('602','31','sidebar','met_m1156_7','m1156ui010','9','4','','showcolor','showcolor','#ffffff','','内容区背景色','默认为模板背景色','93','cn','1');
INSERT INTO met_ui_config VALUES('603','31','sidebar','met_m1156_7','m1156ui010','9','4','','titlecolor','titlecolor-1','#333333','','标题文字颜色','默认为模板主色调','94','cn','1');
INSERT INTO met_ui_config VALUES('604','31','sidebar','met_m1156_7','m1156ui010','9','4','','desccolor','desccolor-1','#383838','','描述文字颜色','默认为模板副色调','95','cn','1');
INSERT INTO met_ui_config VALUES('605','31','sidebar','met_m1156_7','m1156ui010','9','4','','hovercolor','hovercolor-1','#f06ca8','','区块配色调','默认为模板配色调','96','cn','1');
INSERT INTO met_ui_config VALUES('606','31','sidebar','met_m1156_7','m1156ui010','9','0','','bordercolor','bordercolor-1','#eeeeee','','线条颜色','默认不显示','97','cn','1');
INSERT INTO met_ui_config VALUES('607','32','location','met_m1156_7','m1156ui010','4','3','$M$开启$T$1$M$关闭$T$0','ui_show','ui_show','1','1','区块显示开关','当前UI区块的开启关闭设置，关闭后可以在可视化编辑中开启','0','cn','0');
INSERT INTO met_ui_config VALUES('608','32','location','met_m1156_7','m1156ui010','7','0','','bgimg','bgimg-1','','','区块背景图','背景图片建议尺寸：1920px * 1080px；该ui为组合型ui模块，设置的背景图会覆盖整个组合ui区域；','1','cn','0');
INSERT INTO met_ui_config VALUES('609','32','location','met_m1156_7','m1156ui010','4','0','开启$T$1$M$关闭$T$0','bgok','bgok-1','1','1','背景图开关','设置区块的背景是否启用背景图','1','cn','0');
INSERT INTO met_ui_config VALUES('610','32','location','met_m1156_7','m1156ui010','2','0','','all','all','全部','全部','全部文字','下拉菜单显示的主栏目标题文字','6','cn','0');
INSERT INTO met_ui_config VALUES('611','32','location','met_m1156_7','m1156ui010','9','3','','bgcolor','bgcolor','#fafafa','','区块背景色','默认为网站背景颜色；该ui为组合型ui模块，设置的背景色会覆盖整个组合ui区域；','12','cn','1');
INSERT INTO met_ui_config VALUES('612','32','location','met_m1156_7','m1156ui010','9','0','','showcolor','showcolor-1','#ffffff','','内容区背景色','内容区块的背景色','13','cn','1');
INSERT INTO met_ui_config VALUES('613','32','location','met_m1156_7','m1156ui010','9','3','','titlecolor','titlecolor-1','#333333','','标题文字颜色','默认为模板主色调','14','cn','1');
INSERT INTO met_ui_config VALUES('614','32','location','met_m1156_7','m1156ui010','9','3','','hovercolor','hovercolor-1','#f06ca8','','区块配色调','默认为模板配色调','15','cn','1');
INSERT INTO met_ui_config VALUES('615','32','location','met_m1156_7','m1156ui010','9','0','','nav2titlecolor','nav2titlecolor-1','#333333','','次级栏目字体色','默认为模板主色调','16','cn','1');
INSERT INTO met_ui_config VALUES('616','32','location','met_m1156_7','m1156ui010','9','0','','nav2bordercolor','nav2bordercolor','#eeeeee','','次级栏目线条颜色','下拉菜单次级栏目的边框线条颜色','17','cn','1');
INSERT INTO met_ui_config VALUES('617','32','location','met_m1156_7','m1156ui010','9','0','','nav2bgcolor','nav2bgcolor-1','#ffffff','','次级栏目背景色','默认为内容区块背景色','18','cn','1');
INSERT INTO met_ui_config VALUES('618','32','location','met_m1156_7','m1156ui010','9','0','','nav2hovercolor','nav2hovercolor-1','#ffffff','','次级栏目选中颜色','默认为模板配色调','19','cn','1');
INSERT INTO met_ui_config VALUES('619','32','location','met_m1156_7','m1156ui010','9','0','','nav2hoverbgcolor','nav2hoverbgcolor-1','#f06ca8','','次级栏目选中背景色','默认为内容区块背景色','20','cn','1');
INSERT INTO met_ui_config VALUES('620','33','product_list_detail','met_m1156_7','m1156ui010','4','3','$M$开启$T$1$M$关闭$T$0','ui_show','ui_show','1','1','区块显示开关','当前UI区块的开启关闭设置，关闭后可以在可视化编辑中开启','0','cn','0');
INSERT INTO met_ui_config VALUES('621','33','product_list_detail','met_m1156_7','m1156ui010','7','3','','bgimg','bgimg','','','区块背景图','背景图片建议尺寸：1920px * 1080px；如果开启“面包屑”ui模块，界面会调用它的背景图，则该设置无效','1','cn','0');
INSERT INTO met_ui_config VALUES('622','33','product_list_detail','met_m1156_7','m1156ui010','4','0','开启$T$1$M$关闭$T$0','bgok','bgok-1','1','1','背景图开关','设置区块的背景是否启用背景图','1','cn','0');
INSERT INTO met_ui_config VALUES('623','33','product_list_detail','met_m1156_7','m1156ui010','4','0','$M$标准$T$1$M$时尚$T$2','pagetype','pagetype','1','1','展示方式','设置区块的展示方式','13','cn','0');
INSERT INTO met_ui_config VALUES('624','33','product_list_detail','met_m1156_7','m1156ui010','4','0','开启$T$1$M$关闭$T$0','dateok','dateok','1','1','数据内容开关','日期时间访问次数等数据内容开关','17','cn','0');
INSERT INTO met_ui_config VALUES('625','33','product_list_detail','met_m1156_7','m1156ui010','4','0','$M$开启$T$1$M$关闭$T$0','hitsok','hitsok','1','1','热门推荐开关','区块下方推荐内容的开关','29','cn','0');
INSERT INTO met_ui_config VALUES('626','33','product_list_detail','met_m1156_7','m1156ui010','6','3','','hitsid','hitsid','','','热门推荐栏目','区块下方推荐内容所属栏目','30','cn','0');
INSERT INTO met_ui_config VALUES('627','33','product_list_detail','met_m1156_7','m1156ui010','2','0','','hitsname','hitsname','热门推荐','热门推荐','热门推荐标题','标准模式下右侧列表用到','31','cn','0');
INSERT INTO met_ui_config VALUES('628','33','product_list_detail','met_m1156_7','m1156ui010','4','0','全部$T$$M$推荐$T$com','hitstype','hitstype-1','','','热门推荐类型','区块下方推荐内容的类型','32','cn','0');
INSERT INTO met_ui_config VALUES('629','33','product_list_detail','met_m1156_7','m1156ui010','2','0','','hitsnumber','hitsnumber','6','6','热门推荐数量','区块下方推荐内容的数量','33','cn','0');
INSERT INTO met_ui_config VALUES('630','33','product_list_detail','met_m1156_7','m1156ui010','2','0','','specpara','specpara-1','产品参数','产品参数','产品参数文字','时尚模式下导航点击用到','35','cn','0');
INSERT INTO met_ui_config VALUES('631','33','product_list_detail','met_m1156_7','m1156ui010','2','0','','paranum','paranum-1','0','0','产品参数个数','设置产品参数前多少个参数不显示','36','cn','0');
INSERT INTO met_ui_config VALUES('632','33','product_list_detail','met_m1156_7','m1156ui010','2','0','','fixedclass','fixedclass','','','隐藏的元素','时尚模式下，有页面固定的产品标题导航条，会被一些元素遮挡；将遮挡的元素的class属性填入此处，滚动后则导航不会被遮挡','38','cn','0');
INSERT INTO met_ui_config VALUES('633','33','product_list_detail','met_m1156_7','m1156ui010','9','3','','bgcolor','bgcolor','#ffffff','','区块背景色','默认为网站背景颜色；如果开启“面包屑”ui模块，界面会调用它的背景颜色，则该设置无效','72','cn','1');
INSERT INTO met_ui_config VALUES('634','33','product_list_detail','met_m1156_7','m1156ui010','9','3','','titlecolor','titlecolor-1','#333333','','标题文字颜色','默认为模板主色调','73','cn','1');
INSERT INTO met_ui_config VALUES('635','33','product_list_detail','met_m1156_7','m1156ui010','9','3','','desccolor','desccolor-1','#383838','','描述文字颜色','默认为模板副色调','74','cn','1');
INSERT INTO met_ui_config VALUES('636','33','product_list_detail','met_m1156_7','m1156ui010','9','3','','hovercolor','hovercolor-1','#f06ca8','','区块配色调','模板配色调','75','cn','1');
INSERT INTO met_ui_config VALUES('637','33','product_list_detail','met_m1156_7','m1156ui010','9','0','','bordercolor','bordercolor-1','#eeeeee','','线条颜色','区块各种需要线条的地方都显示该线条颜色','76','cn','1');
INSERT INTO met_ui_config VALUES('638','33','product_list_detail','met_m1156_7','m1156ui010','9','3','','showcolor','showcolor','#ffffff','','内容区背景色','区域中间内容部分的背景颜色','77','cn','1');
INSERT INTO met_ui_config VALUES('639','33','product_list_detail','met_m1156_7','m1156ui010','9','0','','paracolor','paracolor','#555555','','产品参数颜色','默认为模板副色调','83','cn','1');
INSERT INTO met_ui_config VALUES('640','33','product_list_detail','met_m1156_7','m1156ui010','9','0','','wordcolor','wordcolor','#ffffff','#ffffff','彩色按钮文字颜色','带有背景色的按钮的文字颜色','87','cn','1');
INSERT INTO met_ui_config VALUES('641','33','product_list_detail','met_m1156_7','m1156ui010','9','0','','parabgcolor','parabgcolor','#f06ca8','','产品参数链接背景','产品参数为“链接”时，按钮的背景色','94','cn','1');
INSERT INTO met_ui_config VALUES('642','33','product_list_detail','met_m1156_7','m1156ui010','9','0','','formbordercolor','formbordercolor','#cccccc','','数量选择器线条颜色','默认为“线条颜色”设置的颜色','96','cn','1');
INSERT INTO met_ui_config VALUES('643','33','product_list_detail','met_m1156_7','m1156ui010','9','0','','datecolor','datecolor','#555555','','数据内容字体颜色','时间，访问量等数据内容字体颜色；默认为模板副色调','97','cn','1');
INSERT INTO met_ui_config VALUES('644','34','sidebar','met_m1156_7','m1156ui010','4','4','$M$开启$T$1$M$关闭$T$0','ui_show','ui_show','1','1','区块显示开关','当前UI区块的开启关闭设置，关闭后可以在可视化编辑中开启','0','cn','0');
INSERT INTO met_ui_config VALUES('645','34','sidebar','met_m1156_7','m1156ui010','2','0','','service_name','service_name','教练团队','产品推荐','区块名称（上方区块）','上方图文区块的标题名称','6','cn','0');
INSERT INTO met_ui_config VALUES('646','34','sidebar','met_m1156_7','m1156ui010','6','4','','service_id','service_id','105','','栏目选择（上方区块）','上方图文区块的内容列表栏目','7','cn','0');
INSERT INTO met_ui_config VALUES('647','34','sidebar','met_m1156_7','m1156ui010','4','4','全部$T$$M$推荐$T$com','service_type','service_type','','','展示类型（上方区块）','上方图文区块的内容类型','8','cn','0');
INSERT INTO met_ui_config VALUES('648','34','sidebar','met_m1156_7','m1156ui010','2','4','','service_num','service_num','4','4','显示数量（上方区块）','上方图文区块的内容列表数量','9','cn','0');
INSERT INTO met_ui_config VALUES('649','34','sidebar','met_m1156_7','m1156ui010','2','4','','service_width','service_width','300','300','图片宽度（上方区块）','上方图文区块的图片宽度','11','cn','0');
INSERT INTO met_ui_config VALUES('650','34','sidebar','met_m1156_7','m1156ui010','2','4','','service_height','service_height','200','200','图片高度（上方区块）','上方图文区块的图片高度','12','cn','0');
INSERT INTO met_ui_config VALUES('651','34','sidebar','met_m1156_7','m1156ui010','4','0','开启$T$1$M$关闭$T$0','service_ok','service_ok','1','1','区块开关（上方区块）','上方图文区块的开关','13','cn','0');
INSERT INTO met_ui_config VALUES('652','34','sidebar','met_m1156_7','m1156ui010','2','0','','information_name','information_name','新闻动态','新闻动态','区块名称（下方区块）','下方区块的标题名称','19','cn','0');
INSERT INTO met_ui_config VALUES('653','34','sidebar','met_m1156_7','m1156ui010','6','4','','information_id','information_id','101','','栏目选择（下方区块）','下方区块的内容列表栏目','20','cn','0');
INSERT INTO met_ui_config VALUES('654','34','sidebar','met_m1156_7','m1156ui010','4','4','全部$T$$M$推荐$T$com','information_type','information_type','','','展示类型（下方区块）','下方区块的内容类型','21','cn','0');
INSERT INTO met_ui_config VALUES('655','34','sidebar','met_m1156_7','m1156ui010','2','4','','information_num','information_num','4','4','显示数量（下方区块）','下方区块的内容列表数量','22','cn','0');
INSERT INTO met_ui_config VALUES('656','34','sidebar','met_m1156_7','m1156ui010','4','0','开启$T$1$M$关闭$T$0','information_ok','information_ok','1','1','区块开关（下方区块）','下方区块的开关','23','cn','0');
INSERT INTO met_ui_config VALUES('657','34','sidebar','met_m1156_7','m1156ui010','9','4','','bgcolor','bgcolor','#fafafa','','区块背景色','默认为模板背景色','92','cn','1');
INSERT INTO met_ui_config VALUES('658','34','sidebar','met_m1156_7','m1156ui010','9','4','','showcolor','showcolor','#ffffff','','内容区背景色','默认为模板背景色','93','cn','1');
INSERT INTO met_ui_config VALUES('659','34','sidebar','met_m1156_7','m1156ui010','9','4','','titlecolor','titlecolor-1','#333333','','标题文字颜色','默认为模板主色调','94','cn','1');
INSERT INTO met_ui_config VALUES('660','34','sidebar','met_m1156_7','m1156ui010','9','4','','desccolor','desccolor-1','#383838','','描述文字颜色','默认为模板副色调','95','cn','1');
INSERT INTO met_ui_config VALUES('661','34','sidebar','met_m1156_7','m1156ui010','9','4','','hovercolor','hovercolor-1','#f06ca8','','区块配色调','默认为模板配色调','96','cn','1');
INSERT INTO met_ui_config VALUES('662','34','sidebar','met_m1156_7','m1156ui010','9','0','','bordercolor','bordercolor-1','#eeeeee','','线条颜色','默认不显示','97','cn','1');
INSERT INTO met_ui_config VALUES('663','35','location','met_m1156_7','m1156ui010','4','3','$M$开启$T$1$M$关闭$T$0','ui_show','ui_show','1','1','区块显示开关','当前UI区块的开启关闭设置，关闭后可以在可视化编辑中开启','0','cn','0');
INSERT INTO met_ui_config VALUES('664','35','location','met_m1156_7','m1156ui010','7','0','','bgimg','bgimg-1','','','区块背景图','背景图片建议尺寸：1920px * 1080px；该ui为组合型ui模块，设置的背景图会覆盖整个组合ui区域；','1','cn','0');
INSERT INTO met_ui_config VALUES('665','35','location','met_m1156_7','m1156ui010','4','0','开启$T$1$M$关闭$T$0','bgok','bgok-1','1','1','背景图开关','设置区块的背景是否启用背景图','1','cn','0');
INSERT INTO met_ui_config VALUES('666','35','location','met_m1156_7','m1156ui010','2','0','','all','all','全部','全部','全部文字','下拉菜单显示的主栏目标题文字','6','cn','0');
INSERT INTO met_ui_config VALUES('667','35','location','met_m1156_7','m1156ui010','9','3','','bgcolor','bgcolor','#fafafa','','区块背景色','默认为网站背景颜色；该ui为组合型ui模块，设置的背景色会覆盖整个组合ui区域；','12','cn','1');
INSERT INTO met_ui_config VALUES('668','35','location','met_m1156_7','m1156ui010','9','0','','showcolor','showcolor-1','#ffffff','','内容区背景色','内容区块的背景色','13','cn','1');
INSERT INTO met_ui_config VALUES('669','35','location','met_m1156_7','m1156ui010','9','3','','titlecolor','titlecolor-1','#333333','','标题文字颜色','默认为模板主色调','14','cn','1');
INSERT INTO met_ui_config VALUES('670','35','location','met_m1156_7','m1156ui010','9','3','','hovercolor','hovercolor-1','#f06ca8','','区块配色调','默认为模板配色调','15','cn','1');
INSERT INTO met_ui_config VALUES('671','35','location','met_m1156_7','m1156ui010','9','0','','nav2titlecolor','nav2titlecolor-1','#333333','','次级栏目字体色','默认为模板主色调','16','cn','1');
INSERT INTO met_ui_config VALUES('672','35','location','met_m1156_7','m1156ui010','9','0','','nav2bordercolor','nav2bordercolor','#eeeeee','','次级栏目线条颜色','下拉菜单次级栏目的边框线条颜色','17','cn','1');
INSERT INTO met_ui_config VALUES('673','35','location','met_m1156_7','m1156ui010','9','0','','nav2bgcolor','nav2bgcolor-1','#ffffff','','次级栏目背景色','默认为内容区块背景色','18','cn','1');
INSERT INTO met_ui_config VALUES('674','35','location','met_m1156_7','m1156ui010','9','0','','nav2hovercolor','nav2hovercolor-1','#ffffff','','次级栏目选中颜色','默认为模板配色调','19','cn','1');
INSERT INTO met_ui_config VALUES('675','35','location','met_m1156_7','m1156ui010','9','0','','nav2hoverbgcolor','nav2hoverbgcolor-1','#f06ca8','','次级栏目选中背景色','默认为内容区块背景色','20','cn','1');
INSERT INTO met_ui_config VALUES('676','36','img_list_detail','met_m1156_7','m1156ui010','4','3','$M$开启$T$1$M$关闭$T$0','ui_show','ui_show','1','1','区块显示开关','当前UI区块的开启关闭设置，关闭后可以在可视化编辑中开启','0','cn','0');
INSERT INTO met_ui_config VALUES('677','36','img_list_detail','met_m1156_7','m1156ui010','7','0','','bgimg','bgimg-1','','','区块背景图','背景图片建议尺寸：1920px * 1080px；如果开启“面包屑”ui模块，界面会调用它的背景图片，则该设置无效','1','cn','0');
INSERT INTO met_ui_config VALUES('678','36','img_list_detail','met_m1156_7','m1156ui010','4','0','开启$T$1$M$关闭$T$0','bgok','bgok-1','1','1','背景图开关','设置区块的背景是否启用背景图','1','cn','0');
INSERT INTO met_ui_config VALUES('679','36','img_list_detail','met_m1156_7','m1156ui010','9','3','','bgcolor','bgcolor','#fafafa','','区块背景色','默认为网站背景颜色；如果开启“面包屑”ui模块，界面会调用它的背景颜色，则该设置无效','82','cn','1');
INSERT INTO met_ui_config VALUES('680','36','img_list_detail','met_m1156_7','m1156ui010','9','3','','showcolor','showcolor','#ffffff','','内容区背景色','区域中间内容部分的背景颜色','83','cn','1');
INSERT INTO met_ui_config VALUES('681','36','img_list_detail','met_m1156_7','m1156ui010','9','3','','titlecolor','titlecolor-1','#333333','','标题文字颜色','默认为模板主色调','84','cn','1');
INSERT INTO met_ui_config VALUES('682','36','img_list_detail','met_m1156_7','m1156ui010','9','0','','datecolor','datacolor-1','#666666','','数据内容颜色','日期点击数等数据内容的字体颜色','85','cn','1');
INSERT INTO met_ui_config VALUES('683','36','img_list_detail','met_m1156_7','m1156ui010','9','3','','desccolor','desccolor-1','#383838','','描述文字颜色','默认为模板副色调','86','cn','1');
INSERT INTO met_ui_config VALUES('684','36','img_list_detail','met_m1156_7','m1156ui010','9','3','','hovercolor','hovercolor-1','#f06ca8','','区块配色调','模板配色调','87','cn','1');
INSERT INTO met_ui_config VALUES('685','36','img_list_detail','met_m1156_7','m1156ui010','9','0','','paracolor','paracolor','#333333','','参数文字颜色','默认为模板副色调','88','cn','1');
INSERT INTO met_ui_config VALUES('686','36','img_list_detail','met_m1156_7','m1156ui010','9','0','','paralinkcolor','paralinkcolor','#333333','','参数链接文字颜色','默认为参数文字颜色','89','cn','1');
INSERT INTO met_ui_config VALUES('687','36','img_list_detail','met_m1156_7','m1156ui010','9','0','','bordercolor','bordercolor-1','#eeeeee','','线条颜色','缩略图和上下按钮的边框线条颜色','93','cn','1');
INSERT INTO met_ui_config VALUES('688','36','img_list_detail','met_m1156_7','m1156ui010','9','0','','pagecolor','pagecolor-1','#333333','','翻页按钮文字','默认为模板副色调','94','cn','1');
INSERT INTO met_ui_config VALUES('689','37','sidebar','met_m1156_7','m1156ui010','4','4','$M$开启$T$1$M$关闭$T$0','ui_show','ui_show','1','1','区块显示开关','当前UI区块的开启关闭设置，关闭后可以在可视化编辑中开启','0','cn','0');
INSERT INTO met_ui_config VALUES('690','37','sidebar','met_m1156_7','m1156ui010','2','0','','service_name','service_name','教练团队','产品推荐','区块名称（上方区块）','上方图文区块的标题名称','6','cn','0');
INSERT INTO met_ui_config VALUES('691','37','sidebar','met_m1156_7','m1156ui010','6','4','','service_id','service_id','105','','栏目选择（上方区块）','上方图文区块的内容列表栏目','7','cn','0');
INSERT INTO met_ui_config VALUES('692','37','sidebar','met_m1156_7','m1156ui010','4','4','全部$T$$M$推荐$T$com','service_type','service_type','','','展示类型（上方区块）','上方图文区块的内容类型','8','cn','0');
INSERT INTO met_ui_config VALUES('693','37','sidebar','met_m1156_7','m1156ui010','2','4','','service_num','service_num','4','4','显示数量（上方区块）','上方图文区块的内容列表数量','9','cn','0');
INSERT INTO met_ui_config VALUES('694','37','sidebar','met_m1156_7','m1156ui010','2','4','','service_width','service_width','300','300','图片宽度（上方区块）','上方图文区块的图片宽度','11','cn','0');
INSERT INTO met_ui_config VALUES('695','37','sidebar','met_m1156_7','m1156ui010','2','4','','service_height','service_height','200','200','图片高度（上方区块）','上方图文区块的图片高度','12','cn','0');
INSERT INTO met_ui_config VALUES('696','37','sidebar','met_m1156_7','m1156ui010','4','0','开启$T$1$M$关闭$T$0','service_ok','service_ok','1','1','区块开关（上方区块）','上方图文区块的开关','13','cn','0');
INSERT INTO met_ui_config VALUES('697','37','sidebar','met_m1156_7','m1156ui010','2','0','','information_name','information_name','新闻动态','新闻动态','区块名称（下方区块）','下方区块的标题名称','19','cn','0');
INSERT INTO met_ui_config VALUES('698','37','sidebar','met_m1156_7','m1156ui010','6','4','','information_id','information_id','101','','栏目选择（下方区块）','下方区块的内容列表栏目','20','cn','0');
INSERT INTO met_ui_config VALUES('699','37','sidebar','met_m1156_7','m1156ui010','4','4','全部$T$$M$推荐$T$com','information_type','information_type','','','展示类型（下方区块）','下方区块的内容类型','21','cn','0');
INSERT INTO met_ui_config VALUES('700','37','sidebar','met_m1156_7','m1156ui010','2','4','','information_num','information_num','4','4','显示数量（下方区块）','下方区块的内容列表数量','22','cn','0');
INSERT INTO met_ui_config VALUES('701','37','sidebar','met_m1156_7','m1156ui010','4','0','开启$T$1$M$关闭$T$0','information_ok','information_ok','1','1','区块开关（下方区块）','下方区块的开关','23','cn','0');
INSERT INTO met_ui_config VALUES('702','37','sidebar','met_m1156_7','m1156ui010','9','4','','bgcolor','bgcolor','#fafafa','','区块背景色','默认为模板背景色','92','cn','1');
INSERT INTO met_ui_config VALUES('703','37','sidebar','met_m1156_7','m1156ui010','9','4','','showcolor','showcolor','#ffffff','','内容区背景色','默认为模板背景色','93','cn','1');
INSERT INTO met_ui_config VALUES('704','37','sidebar','met_m1156_7','m1156ui010','9','4','','titlecolor','titlecolor-1','#333333','','标题文字颜色','默认为模板主色调','94','cn','1');
INSERT INTO met_ui_config VALUES('705','37','sidebar','met_m1156_7','m1156ui010','9','4','','desccolor','desccolor-1','#383838','','描述文字颜色','默认为模板副色调','95','cn','1');
INSERT INTO met_ui_config VALUES('706','37','sidebar','met_m1156_7','m1156ui010','9','4','','hovercolor','hovercolor-1','#f06ca8','','区块配色调','默认为模板配色调','96','cn','1');
INSERT INTO met_ui_config VALUES('707','37','sidebar','met_m1156_7','m1156ui010','9','0','','bordercolor','bordercolor-1','#eeeeee','','线条颜色','默认不显示','97','cn','1');
INSERT INTO met_ui_config VALUES('708','38','location','met_m1156_7','m1156ui010','4','3','$M$开启$T$1$M$关闭$T$0','ui_show','ui_show','','1','区块显示开关','当前UI区块的开启关闭设置，关闭后可以在可视化编辑中开启','0','cn','0');
INSERT INTO met_ui_config VALUES('709','38','location','met_m1156_7','m1156ui010','7','0','','bgimg','bgimg-1','','','区块背景图','背景图片建议尺寸：1920px * 1080px；该ui为组合型ui模块，设置的背景图会覆盖整个组合ui区域；','1','cn','0');
INSERT INTO met_ui_config VALUES('710','38','location','met_m1156_7','m1156ui010','4','0','开启$T$1$M$关闭$T$0','bgok','bgok-1','','1','背景图开关','设置区块的背景是否启用背景图','1','cn','0');
INSERT INTO met_ui_config VALUES('711','38','location','met_m1156_7','m1156ui010','2','0','','all','all','','全部','全部文字','下拉菜单显示的主栏目标题文字','6','cn','0');
INSERT INTO met_ui_config VALUES('712','38','location','met_m1156_7','m1156ui010','9','3','','bgcolor','bgcolor','','','区块背景色','默认为网站背景颜色；该ui为组合型ui模块，设置的背景色会覆盖整个组合ui区域；','12','cn','1');
INSERT INTO met_ui_config VALUES('713','38','location','met_m1156_7','m1156ui010','9','0','','showcolor','showcolor-1','','','内容区背景色','内容区块的背景色','13','cn','1');
INSERT INTO met_ui_config VALUES('714','38','location','met_m1156_7','m1156ui010','9','3','','titlecolor','titlecolor-1','','','标题文字颜色','默认为模板主色调','14','cn','1');
INSERT INTO met_ui_config VALUES('715','38','location','met_m1156_7','m1156ui010','9','3','','hovercolor','hovercolor-1','','','区块配色调','默认为模板配色调','15','cn','1');
INSERT INTO met_ui_config VALUES('716','38','location','met_m1156_7','m1156ui010','9','0','','nav2titlecolor','nav2titlecolor-1','','','次级栏目字体色','默认为模板主色调','16','cn','1');
INSERT INTO met_ui_config VALUES('717','38','location','met_m1156_7','m1156ui010','9','0','','nav2bordercolor','nav2bordercolor','','','次级栏目线条颜色','下拉菜单次级栏目的边框线条颜色','17','cn','1');
INSERT INTO met_ui_config VALUES('718','38','location','met_m1156_7','m1156ui010','9','0','','nav2bgcolor','nav2bgcolor-1','','','次级栏目背景色','默认为内容区块背景色','18','cn','1');
INSERT INTO met_ui_config VALUES('719','38','location','met_m1156_7','m1156ui010','9','0','','nav2hovercolor','nav2hovercolor-1','','','次级栏目选中颜色','默认为模板配色调','19','cn','1');
INSERT INTO met_ui_config VALUES('720','38','location','met_m1156_7','m1156ui010','9','0','','nav2hoverbgcolor','nav2hoverbgcolor-1','','','次级栏目选中背景色','默认为内容区块背景色','20','cn','1');
INSERT INTO met_ui_config VALUES('721','40','shop_product_detail','met_m1156_7','m1156ui010','4','3','$M$开启$T$1$M$关闭$T$0','ui_show','ui_show','','1','区块显示开关','当前UI区块的开启关闭设置，关闭后可以在可视化编辑中开启','0','cn','0');
INSERT INTO met_ui_config VALUES('722','40','shop_product_detail','met_m1156_7','m1156ui010','7','3','','bgimg','bgimg','','','区块背景图','背景图片建议尺寸：1920px * 1080px；如果开启“面包屑”ui模块，界面会调用它的背景图，则该设置无效','1','cn','0');
INSERT INTO met_ui_config VALUES('723','40','shop_product_detail','met_m1156_7','m1156ui010','4','0','开启$T$1$M$关闭$T$0','bgok','bgok-1','','1','背景图开关','设置区块的背景是否启用背景图','1','cn','0');
INSERT INTO met_ui_config VALUES('724','40','shop_product_detail','met_m1156_7','m1156ui010','4','0','$M$标准$T$1$M$时尚$T$2','pagetype','pagetype','','1','展示方式','设置区块的展示方式','13','cn','0');
INSERT INTO met_ui_config VALUES('725','40','shop_product_detail','met_m1156_7','m1156ui010','4','0','开启$T$1$M$关闭$T$0','dateok','dateok','','1','数据内容开关','日期时间访问次数等数据内容开关','17','cn','0');
INSERT INTO met_ui_config VALUES('726','40','shop_product_detail','met_m1156_7','m1156ui010','4','0','$M$开启$T$1$M$关闭$T$0','hitsok','hitsok','','1','热门推荐开关','区块下方推荐内容的开关','29','cn','0');
INSERT INTO met_ui_config VALUES('727','40','shop_product_detail','met_m1156_7','m1156ui010','6','3','','hitsid','hitsid','','','热门推荐栏目','区块下方推荐内容所属栏目','30','cn','0');
INSERT INTO met_ui_config VALUES('728','40','shop_product_detail','met_m1156_7','m1156ui010','2','0','','hitsname','hitsname','','热门推荐','热门推荐标题','标准模式下右侧列表用到','31','cn','0');
INSERT INTO met_ui_config VALUES('729','40','shop_product_detail','met_m1156_7','m1156ui010','4','0','全部$T$$M$推荐$T$com','hitstype','hitstype-1','','','热门推荐类型','区块下方推荐内容的类型','32','cn','0');
INSERT INTO met_ui_config VALUES('730','40','shop_product_detail','met_m1156_7','m1156ui010','2','0','','hitsnumber','hitsnumber','','6','热门推荐数量','区块下方推荐内容的数量','33','cn','0');
INSERT INTO met_ui_config VALUES('731','40','shop_product_detail','met_m1156_7','m1156ui010','2','0','','specpara','specpara-1','','产品参数','产品参数文字','时尚模式下导航点击用到','35','cn','0');
INSERT INTO met_ui_config VALUES('732','40','shop_product_detail','met_m1156_7','m1156ui010','2','0','','paranum','paranum-1','','0','产品参数个数','设置产品参数前多少个参数不显示','36','cn','0');
INSERT INTO met_ui_config VALUES('733','40','shop_product_detail','met_m1156_7','m1156ui010','2','0','','fixedclass','fixedclass','','','隐藏的元素','时尚模式下，有页面固定的产品标题导航条，会被一些元素遮挡；将遮挡的元素的class属性填入此处，滚动后则导航不会被遮挡','38','cn','0');
INSERT INTO met_ui_config VALUES('734','40','shop_product_detail','met_m1156_7','m1156ui010','9','3','','bgcolor','bgcolor','','','区块背景色','默认为网站背景颜色；如果开启“面包屑”ui模块，界面会调用它的背景颜色，则该设置无效','72','cn','1');
INSERT INTO met_ui_config VALUES('735','40','shop_product_detail','met_m1156_7','m1156ui010','9','3','','titlecolor','titlecolor-1','','','标题文字颜色','默认为模板主色调','73','cn','1');
INSERT INTO met_ui_config VALUES('736','40','shop_product_detail','met_m1156_7','m1156ui010','9','3','','desccolor','desccolor-1','','','描述文字颜色','默认为模板副色调','74','cn','1');
INSERT INTO met_ui_config VALUES('737','40','shop_product_detail','met_m1156_7','m1156ui010','9','3','','hovercolor','hovercolor-1','','','区块配色调','模板配色调','75','cn','1');
INSERT INTO met_ui_config VALUES('738','40','shop_product_detail','met_m1156_7','m1156ui010','9','0','','bordercolor','bordercolor-1','','','线条颜色','区块各种需要线条的地方都显示该线条颜色','76','cn','1');
INSERT INTO met_ui_config VALUES('739','40','shop_product_detail','met_m1156_7','m1156ui010','9','3','','showcolor','showcolor','','','内容区背景色','区域中间内容部分的背景颜色','77','cn','1');
INSERT INTO met_ui_config VALUES('740','40','shop_product_detail','met_m1156_7','m1156ui010','9','0','','pricecolor','pricecolor-1','','','价格颜色','默认为配色调','81','cn','1');
INSERT INTO met_ui_config VALUES('741','40','shop_product_detail','met_m1156_7','m1156ui010','9','0','','pricebgcolor','pricebgcolor','','','价格背景色','默认不显示背景色','82','cn','1');
INSERT INTO met_ui_config VALUES('742','40','shop_product_detail','met_m1156_7','m1156ui010','9','0','','paracolor','paracolor','','','产品参数颜色','默认为模板副色调','83','cn','1');
INSERT INTO met_ui_config VALUES('743','40','shop_product_detail','met_m1156_7','m1156ui010','9','0','','cartcolor','cartcolor','','#f96868','加入购物车按钮颜色','默认为红色','84','cn','1');
INSERT INTO met_ui_config VALUES('744','40','shop_product_detail','met_m1156_7','m1156ui010','9','0','','favoritecolor','favoritecolor','','#f2a654','加入收藏按钮颜色','默认为橙色','85','cn','1');
INSERT INTO met_ui_config VALUES('745','40','shop_product_detail','met_m1156_7','m1156ui010','9','0','','buycolor','buycolor','','#f96868','立即购买按钮颜色','时尚模式下用到','86','cn','1');
INSERT INTO met_ui_config VALUES('746','40','shop_product_detail','met_m1156_7','m1156ui010','9','0','','wordcolor','wordcolor','','#ffffff','彩色按钮文字颜色','带有背景色的按钮的文字颜色','87','cn','1');
INSERT INTO met_ui_config VALUES('747','40','shop_product_detail','met_m1156_7','m1156ui010','9','0','','parabgcolor','parabgcolor','','','产品参数链接背景','产品参数为“链接”时，按钮的背景色','94','cn','1');
INSERT INTO met_ui_config VALUES('748','40','shop_product_detail','met_m1156_7','m1156ui010','9','0','','formbordercolor','formbordercolor','','','数量选择器线条颜色','默认为“线条颜色”设置的颜色','96','cn','1');
INSERT INTO met_ui_config VALUES('749','40','shop_product_detail','met_m1156_7','m1156ui010','9','0','','warncolor','warncolor','','#f2a654','优惠劵按钮颜色','默认为橙色','97','cn','1');
INSERT INTO met_ui_config VALUES('750','39','sidebar','met_m1156_7','m1156ui010','4','4','$M$开启$T$1$M$关闭$T$0','ui_show','ui_show','','1','区块显示开关','当前UI区块的开启关闭设置，关闭后可以在可视化编辑中开启','0','cn','0');
INSERT INTO met_ui_config VALUES('751','39','sidebar','met_m1156_7','m1156ui010','2','0','','service_name','service_name','','产品推荐','区块名称（上方区块）','上方图文区块的标题名称','6','cn','0');
INSERT INTO met_ui_config VALUES('752','39','sidebar','met_m1156_7','m1156ui010','6','4','','service_id','service_id','','','栏目选择（上方区块）','上方图文区块的内容列表栏目','7','cn','0');
INSERT INTO met_ui_config VALUES('753','39','sidebar','met_m1156_7','m1156ui010','4','4','全部$T$$M$推荐$T$com','service_type','service_type','','','展示类型（上方区块）','上方图文区块的内容类型','8','cn','0');
INSERT INTO met_ui_config VALUES('754','39','sidebar','met_m1156_7','m1156ui010','2','4','','service_num','service_num','','4','显示数量（上方区块）','上方图文区块的内容列表数量','9','cn','0');
INSERT INTO met_ui_config VALUES('755','39','sidebar','met_m1156_7','m1156ui010','2','4','','service_width','service_width','','300','图片宽度（上方区块）','上方图文区块的图片宽度','11','cn','0');
INSERT INTO met_ui_config VALUES('756','39','sidebar','met_m1156_7','m1156ui010','2','4','','service_height','service_height','','200','图片高度（上方区块）','上方图文区块的图片高度','12','cn','0');
INSERT INTO met_ui_config VALUES('757','39','sidebar','met_m1156_7','m1156ui010','4','0','开启$T$1$M$关闭$T$0','service_ok','service_ok','','1','区块开关（上方区块）','上方图文区块的开关','13','cn','0');
INSERT INTO met_ui_config VALUES('758','39','sidebar','met_m1156_7','m1156ui010','2','0','','information_name','information_name','','新闻动态','区块名称（下方区块）','下方区块的标题名称','19','cn','0');
INSERT INTO met_ui_config VALUES('759','39','sidebar','met_m1156_7','m1156ui010','6','4','','information_id','information_id','','','栏目选择（下方区块）','下方区块的内容列表栏目','20','cn','0');
INSERT INTO met_ui_config VALUES('760','39','sidebar','met_m1156_7','m1156ui010','4','4','全部$T$$M$推荐$T$com','information_type','information_type','','','展示类型（下方区块）','下方区块的内容类型','21','cn','0');
INSERT INTO met_ui_config VALUES('761','39','sidebar','met_m1156_7','m1156ui010','2','4','','information_num','information_num','','4','显示数量（下方区块）','下方区块的内容列表数量','22','cn','0');
INSERT INTO met_ui_config VALUES('762','39','sidebar','met_m1156_7','m1156ui010','4','0','开启$T$1$M$关闭$T$0','information_ok','information_ok','','1','区块开关（下方区块）','下方区块的开关','23','cn','0');
INSERT INTO met_ui_config VALUES('763','39','sidebar','met_m1156_7','m1156ui010','9','4','','bgcolor','bgcolor','','','区块背景色','默认为模板背景色','92','cn','1');
INSERT INTO met_ui_config VALUES('764','39','sidebar','met_m1156_7','m1156ui010','9','4','','showcolor','showcolor','','','内容区背景色','默认为模板背景色','93','cn','1');
INSERT INTO met_ui_config VALUES('765','39','sidebar','met_m1156_7','m1156ui010','9','4','','titlecolor','titlecolor-1','','','标题文字颜色','默认为模板主色调','94','cn','1');
INSERT INTO met_ui_config VALUES('766','39','sidebar','met_m1156_7','m1156ui010','9','4','','desccolor','desccolor-1','','','描述文字颜色','默认为模板副色调','95','cn','1');
INSERT INTO met_ui_config VALUES('767','39','sidebar','met_m1156_7','m1156ui010','9','4','','hovercolor','hovercolor-1','','','区块配色调','默认为模板配色调','96','cn','1');
INSERT INTO met_ui_config VALUES('768','39','sidebar','met_m1156_7','m1156ui010','9','0','','bordercolor','bordercolor-1','','','线条颜色','默认不显示','97','cn','1');
INSERT INTO met_ui_config VALUES('769','42','subcolumn_nav','met_m1156_5','m1156ui010','4','1','$M$开启$T$1$M$关闭$T$0','ui_show','ui_show','0','1','区块显示开关','当前UI区块的开启关闭设置，关闭后可以在可视化编辑中开启','0','cn','0');
INSERT INTO met_ui_config VALUES('770','42','subcolumn_nav','met_m1156_5','m1156ui010','9','1','','bgcolor','bgcolor-1','','','区块背景色','默认为网站背景颜色','1','cn','0');
INSERT INTO met_ui_config VALUES('771','42','subcolumn_nav','met_m1156_5','m1156ui010','9','1','','titlecolor','titlecolor','','','区块标题颜色','默认为模板主色调','2','cn','0');
INSERT INTO met_ui_config VALUES('772','42','subcolumn_nav','met_m1156_5','m1156ui010','9','1','','hovercolor','hovercolor','','','区块配色调','默认为模板配色调','4','cn','0');
INSERT INTO met_ui_config VALUES('773','42','subcolumn_nav','met_m1156_5','m1156ui010','9','0','','focuscolor','focuscolor','','','区块副色调','彩色区块中的文字颜色','5','cn','0');
INSERT INTO met_ui_config VALUES('774','42','subcolumn_nav','met_m1156_5','m1156ui010','9','0','','bordercolor','bordercolor-1','','','线条颜色','','6','cn','0');
INSERT INTO met_ui_config VALUES('775','42','subcolumn_nav','met_m1156_5','m1156ui010','9','0','','showcolor','showbgcolor','','','内容背景色','','7','cn','0');
INSERT INTO met_ui_config VALUES('776','42','subcolumn_nav','met_m1156_5','m1156ui010','9','0','','navbgcolor','navbgcolor-1','','','导航背景色','','8','cn','0');
INSERT INTO met_ui_config VALUES('777','42','subcolumn_nav','met_m1156_5','m1156ui010','4','0','$M$开启$T$1$M$关闭$T$0','navsonopen','navsonopen','1','1','下级栏目开关','','9','cn','0');
INSERT INTO met_ui_config VALUES('778','42','subcolumn_nav','met_m1156_5','m1156ui010','9','0','','navsonbgcolor','navsonbgcolor','','','下级栏目背景色','','10','cn','0');
INSERT INTO met_ui_config VALUES('779','42','subcolumn_nav','met_m1156_5','m1156ui010','9','0','','navsontitlecolor','navsontitlecolor-1','','','下级栏目标题颜色','','11','cn','0');
INSERT INTO met_ui_config VALUES('780','42','subcolumn_nav','met_m1156_5','m1156ui010','9','0','','navsonbordercolor','navsonbordercolor-1','','','下级栏目线条颜色','','12','cn','0');
INSERT INTO met_ui_config VALUES('781','42','subcolumn_nav','met_m1156_5','m1156ui010','4','0','$M$开启$T$1$M$关闭$T$0','navsondown','navsondown','0','0','下级栏目三角符','','13','cn','0');
INSERT INTO met_ui_config VALUES('782','42','subcolumn_nav','met_m1156_5','m1156ui010','2','0','','navall','navall','全部','全部','总栏目文字','简介模块下无效','27','cn','0');
INSERT INTO met_ui_config VALUES('783','42','subcolumn_nav','met_m1156_5','m1156ui010','2','0','','navsonall','navsonall','全部','全部','次级栏目文字','','28','cn','0');
INSERT INTO met_ui_config VALUES('784','42','subcolumn_nav','met_m1156_5','m1156ui010','2','0','','navbarprohibit','navbarprohibit','','','禁用下拉名单','禁止指定栏目显示下拉菜单，请填写栏目名称，多个用竖线（|）隔开','29','cn','0');
INSERT INTO met_ui_config VALUES('785','43','search','met_m1156_5','m1156ui010','4','3','$M$开启$T$1$M$关闭$T$0','ui_show','ui_show','1','1','区块显示开关','当前UI区块的开启关闭设置，关闭后可以在可视化编辑中开启','0','cn','0');
INSERT INTO met_ui_config VALUES('786','43','search','met_m1156_5','m1156ui010','7','3','','bgimg','bgimg','','','区块背景图','背景图片建议尺寸：1920px * 1080px','1','cn','0');
INSERT INTO met_ui_config VALUES('787','43','search','met_m1156_5','m1156ui010','9','3','','bgcolor','bgcolor','#fafafa','','区块背景色','默认为网站背景颜色；如果添加了“区块背景图”则背景色会被遮挡。','2','cn','0');
INSERT INTO met_ui_config VALUES('788','43','search','met_m1156_5','m1156ui010','9','3','','titlecolor','titlecolor-1','#333333','','标题文字颜色','默认为模板主色调','3','cn','0');
INSERT INTO met_ui_config VALUES('789','43','search','met_m1156_5','m1156ui010','9','3','','desccolor','desccolor-1','#383838','','描述文字颜色','默认为模板副色调','4','cn','0');
INSERT INTO met_ui_config VALUES('790','43','search','met_m1156_5','m1156ui010','9','3','','hovercolor','hovercolor-1','#f06ca8','','区块配色调','模板配色调','5','cn','0');
INSERT INTO met_ui_config VALUES('791','43','search','met_m1156_5','m1156ui010','9','0','','bordercolor','borderwidth','#eeeeee','','线条颜色','','6','cn','0');
INSERT INTO met_ui_config VALUES('792','43','search','met_m1156_5','m1156ui010','9','3','','pagebgcolor','pagercolor','#fafafa','','翻页按钮背景色','','8','cn','0');
INSERT INTO met_ui_config VALUES('793','43','search','met_m1156_5','m1156ui010','9','0','','pagetitlecolor','pagetitlecolor-1','#333333','','翻页按钮字体颜色','','9','cn','0');
INSERT INTO met_ui_config VALUES('794','43','search','met_m1156_5','m1156ui010','9','0','','pagehovercolor','pagehovercolor-1','#333333','','翻页选中按钮字体颜色','','10','cn','0');
INSERT INTO met_ui_config VALUES('795','43','search','met_m1156_5','m1156ui010','9','3','','showcolor','showcolor','#ffffff','','内容区背景色','区域中间内容部分的背景颜色','12','cn','0');
INSERT INTO met_ui_config VALUES('796','43','search','met_m1156_5','m1156ui010','9','0','','inputcolor','inputcolor','#ffffff','','搜索框背景色','','13','cn','0');
INSERT INTO met_ui_config VALUES('797','44','subcolumn_nav','met_m1156_5','m1156ui010','4','1','$M$开启$T$1$M$关闭$T$0','ui_show','ui_show','','1','区块显示开关','当前UI区块的开启关闭设置，关闭后可以在可视化编辑中开启','0','cn','0');
INSERT INTO met_ui_config VALUES('798','44','subcolumn_nav','met_m1156_5','m1156ui010','9','1','','bgcolor','bgcolor-1','','','区块背景色','默认为网站背景颜色','1','cn','0');
INSERT INTO met_ui_config VALUES('799','44','subcolumn_nav','met_m1156_5','m1156ui010','9','1','','titlecolor','titlecolor','','','区块标题颜色','默认为模板主色调','2','cn','0');
INSERT INTO met_ui_config VALUES('800','44','subcolumn_nav','met_m1156_5','m1156ui010','9','1','','hovercolor','hovercolor','','','区块配色调','默认为模板配色调','4','cn','0');
INSERT INTO met_ui_config VALUES('801','44','subcolumn_nav','met_m1156_5','m1156ui010','9','0','','focuscolor','focuscolor','','','区块副色调','彩色区块中的文字颜色','5','cn','0');
INSERT INTO met_ui_config VALUES('802','44','subcolumn_nav','met_m1156_5','m1156ui010','9','0','','bordercolor','bordercolor-1','','','线条颜色','','6','cn','0');
INSERT INTO met_ui_config VALUES('803','44','subcolumn_nav','met_m1156_5','m1156ui010','9','0','','showcolor','showbgcolor','','','内容背景色','','7','cn','0');
INSERT INTO met_ui_config VALUES('804','44','subcolumn_nav','met_m1156_5','m1156ui010','9','0','','navbgcolor','navbgcolor-1','','','导航背景色','','8','cn','0');
INSERT INTO met_ui_config VALUES('805','44','subcolumn_nav','met_m1156_5','m1156ui010','4','0','$M$开启$T$1$M$关闭$T$0','navsonopen','navsonopen','','1','下级栏目开关','','9','cn','0');
INSERT INTO met_ui_config VALUES('806','44','subcolumn_nav','met_m1156_5','m1156ui010','9','0','','navsonbgcolor','navsonbgcolor','','','下级栏目背景色','','10','cn','0');
INSERT INTO met_ui_config VALUES('807','44','subcolumn_nav','met_m1156_5','m1156ui010','9','0','','navsontitlecolor','navsontitlecolor-1','','','下级栏目标题颜色','','11','cn','0');
INSERT INTO met_ui_config VALUES('808','44','subcolumn_nav','met_m1156_5','m1156ui010','9','0','','navsonbordercolor','navsonbordercolor-1','','','下级栏目线条颜色','','12','cn','0');
INSERT INTO met_ui_config VALUES('809','44','subcolumn_nav','met_m1156_5','m1156ui010','4','0','$M$开启$T$1$M$关闭$T$0','navsondown','navsondown','','0','下级栏目三角符','','13','cn','0');
INSERT INTO met_ui_config VALUES('810','44','subcolumn_nav','met_m1156_5','m1156ui010','2','0','','navall','navall','','全部','总栏目文字','简介模块下无效','27','cn','0');
INSERT INTO met_ui_config VALUES('811','44','subcolumn_nav','met_m1156_5','m1156ui010','2','0','','navsonall','navsonall','','全部','次级栏目文字','','28','cn','0');
INSERT INTO met_ui_config VALUES('812','44','subcolumn_nav','met_m1156_5','m1156ui010','2','0','','navbarprohibit','navbarprohibit','','','禁用下拉名单','禁止指定栏目显示下拉菜单，请填写栏目名称，多个用竖线（|）隔开','29','cn','0');
INSERT INTO met_ui_config VALUES('813','41','sitemap','met_m1156_1','m1156ui010','4','3','$M$开启$T$1$M$关闭$T$0','ui_show','ui_show','','1','区块显示开关','当前UI区块的开启关闭设置，关闭后可以在可视化编辑中开启','0','cn','0');
INSERT INTO met_ui_config VALUES('814','41','sitemap','met_m1156_1','m1156ui010','7','3','','bgimg','bgimg','','','区块背景图','背景图片建议尺寸：1920px * 1080px','1','cn','0');
INSERT INTO met_ui_config VALUES('815','41','sitemap','met_m1156_1','m1156ui010','9','3','','bgcolor','bgcolor','','','区块背景色','默认为网站背景颜色；如果添加了“区块背景图”则背景色会被遮挡。','2','cn','0');
INSERT INTO met_ui_config VALUES('816','41','sitemap','met_m1156_1','m1156ui010','9','3','','titlecolor','titlecolor-1','','','标题文字颜色','默认为模板主色调','3','cn','0');
INSERT INTO met_ui_config VALUES('817','41','sitemap','met_m1156_1','m1156ui010','9','3','','hovercolor','hovercolor-1','','','区块配色调','模板配色调','5','cn','0');
INSERT INTO met_ui_config VALUES('818','41','sitemap','met_m1156_1','m1156ui010','9','0','','bordercolor','bordercolor-1','','','线条颜色','','8','cn','0');
INSERT INTO met_ui_config VALUES('819','41','sitemap','met_m1156_1','m1156ui010','9','3','','showcolor','showcolor','','','内容区背景色','区域中间内容部分的背景颜色','10','cn','0');
INSERT INTO met_ui_config VALUES('820','41','sitemap','met_m1156_1','m1156ui010','2','3','','showopacity','showopacity','','','内容区背景透明度','区域中间内容部分的背景加了颜色后的透明度，数值必须是：0.01~1之间','11','cn','0');
INSERT INTO met_ui_config VALUES('821','46','subcolumn_nav','met_m1156_5','m1156ui010','4','1','$M$开启$T$1$M$关闭$T$0','ui_show','ui_show','','1','区块显示开关','当前UI区块的开启关闭设置，关闭后可以在可视化编辑中开启','0','cn','0');
INSERT INTO met_ui_config VALUES('822','46','subcolumn_nav','met_m1156_5','m1156ui010','9','1','','bgcolor','bgcolor-1','','','区块背景色','默认为网站背景颜色','1','cn','0');
INSERT INTO met_ui_config VALUES('823','46','subcolumn_nav','met_m1156_5','m1156ui010','9','1','','titlecolor','titlecolor','','','区块标题颜色','默认为模板主色调','2','cn','0');
INSERT INTO met_ui_config VALUES('824','46','subcolumn_nav','met_m1156_5','m1156ui010','9','1','','hovercolor','hovercolor','','','区块配色调','默认为模板配色调','4','cn','0');
INSERT INTO met_ui_config VALUES('825','46','subcolumn_nav','met_m1156_5','m1156ui010','9','0','','focuscolor','focuscolor','','','区块副色调','彩色区块中的文字颜色','5','cn','0');
INSERT INTO met_ui_config VALUES('826','46','subcolumn_nav','met_m1156_5','m1156ui010','9','0','','bordercolor','bordercolor-1','','','线条颜色','','6','cn','0');
INSERT INTO met_ui_config VALUES('827','46','subcolumn_nav','met_m1156_5','m1156ui010','9','0','','showcolor','showbgcolor','','','内容背景色','','7','cn','0');
INSERT INTO met_ui_config VALUES('828','46','subcolumn_nav','met_m1156_5','m1156ui010','9','0','','navbgcolor','navbgcolor-1','','','导航背景色','','8','cn','0');
INSERT INTO met_ui_config VALUES('829','46','subcolumn_nav','met_m1156_5','m1156ui010','4','0','$M$开启$T$1$M$关闭$T$0','navsonopen','navsonopen','','1','下级栏目开关','','9','cn','0');
INSERT INTO met_ui_config VALUES('830','46','subcolumn_nav','met_m1156_5','m1156ui010','9','0','','navsonbgcolor','navsonbgcolor','','','下级栏目背景色','','10','cn','0');
INSERT INTO met_ui_config VALUES('831','46','subcolumn_nav','met_m1156_5','m1156ui010','9','0','','navsontitlecolor','navsontitlecolor-1','','','下级栏目标题颜色','','11','cn','0');
INSERT INTO met_ui_config VALUES('832','46','subcolumn_nav','met_m1156_5','m1156ui010','9','0','','navsonbordercolor','navsonbordercolor-1','','','下级栏目线条颜色','','12','cn','0');
INSERT INTO met_ui_config VALUES('833','46','subcolumn_nav','met_m1156_5','m1156ui010','4','0','$M$开启$T$1$M$关闭$T$0','navsondown','navsondown','','0','下级栏目三角符','','13','cn','0');
INSERT INTO met_ui_config VALUES('834','46','subcolumn_nav','met_m1156_5','m1156ui010','2','0','','navall','navall','','全部','总栏目文字','简介模块下无效','27','cn','0');
INSERT INTO met_ui_config VALUES('835','46','subcolumn_nav','met_m1156_5','m1156ui010','2','0','','navsonall','navsonall','','全部','次级栏目文字','','28','cn','0');
INSERT INTO met_ui_config VALUES('836','46','subcolumn_nav','met_m1156_5','m1156ui010','2','0','','navbarprohibit','navbarprohibit','','','禁用下拉名单','禁止指定栏目显示下拉菜单，请填写栏目名称，多个用竖线（|）隔开','29','cn','0');
INSERT INTO met_ui_config VALUES('837','47','download_list_page','met_m1156_1','m1156ui010','4','3','$M$开启$T$1$M$关闭$T$0','ui_show','ui_show','','1','区块显示开关','当前UI区块的开启关闭设置，关闭后可以在可视化编辑中开启','1','cn','0');
INSERT INTO met_ui_config VALUES('838','47','download_list_page','met_m1156_1','m1156ui010','7','3','','bgimg','bgimg','','','区块背景图','背景图片建议尺寸：1920px * 1080px','2','cn','0');
INSERT INTO met_ui_config VALUES('839','47','download_list_page','met_m1156_1','m1156ui010','2','0','','downword','downword','','立即下载','立即下载按钮文字','','3','cn','0');
INSERT INTO met_ui_config VALUES('840','47','download_list_page','met_m1156_1','m1156ui010','2','3','','barlisttitle','barlisttitle','','为您推荐','侧栏列表标题','','4','cn','0');
INSERT INTO met_ui_config VALUES('841','47','download_list_page','met_m1156_1','m1156ui010','6','3','','barlistid','barlistid','','','侧栏列表调用栏目','','5','cn','0');
INSERT INTO met_ui_config VALUES('842','47','download_list_page','met_m1156_1','m1156ui010','4','0','$M$全部$T$$M$推荐$T$com$M$点击$T$hits$M$最新$T$new','barlisttype','barlisttype','','','侧栏列表类型','','6','cn','0');
INSERT INTO met_ui_config VALUES('843','47','download_list_page','met_m1156_1','m1156ui010','2','0','','barlistnum','barlistnum','','5','侧栏列表数量','','7','cn','0');
INSERT INTO met_ui_config VALUES('844','47','download_list_page','met_m1156_1','m1156ui010','9','3','','bgcolor','bgcolor','','','区块背景色','默认为网站背景颜色；如果添加了“区块背景图”则背景色会被遮挡。','8','cn','1');
INSERT INTO met_ui_config VALUES('845','47','download_list_page','met_m1156_1','m1156ui010','9','3','','titlecolor','titlecolor-1','','','标题文字颜色','默认为模板主色调','9','cn','1');
INSERT INTO met_ui_config VALUES('846','47','download_list_page','met_m1156_1','m1156ui010','9','3','','desccolor','desccolor-1','','','描述文字颜色','默认为模板副色调','10','cn','1');
INSERT INTO met_ui_config VALUES('847','47','download_list_page','met_m1156_1','m1156ui010','9','3','','hovercolor','hovercolor-1','','','区块配色调','模板配色调','11','cn','1');
INSERT INTO met_ui_config VALUES('848','47','download_list_page','met_m1156_1','m1156ui010','9','3','','pagebgcolor','pagercolor','','','翻页按钮背景色','','12','cn','1');
INSERT INTO met_ui_config VALUES('849','47','download_list_page','met_m1156_1','m1156ui010','9','0','','pagetitlecolor','pagetitlecolor','','','翻页按钮字体颜色','','13','cn','1');
INSERT INTO met_ui_config VALUES('850','47','download_list_page','met_m1156_1','m1156ui010','9','0','','pagehovercolor','pagehovercolor','','','翻页选中按钮字体颜色','','14','cn','1');
INSERT INTO met_ui_config VALUES('851','47','download_list_page','met_m1156_1','m1156ui010','9','0','','bordercolor','bordercolor','','','列表分隔线条颜色','','15','cn','1');
INSERT INTO met_ui_config VALUES('852','47','download_list_page','met_m1156_1','m1156ui010','9','3','','showcolor','showcolor','','','内容区背景色','区域中间内容部分的背景颜色','16','cn','1');
INSERT INTO met_ui_config VALUES('853','47','download_list_page','met_m1156_1','m1156ui010','2','3','','showopacity','showopacity','','','内容区背景透明度','区域中间内容部分的背景加了颜色后的透明度，数值必须是：0.01~1之间','17','cn','1');
INSERT INTO met_ui_config VALUES('854','47','download_list_page','met_m1156_1','m1156ui010','9','0','','btnbgcolor','btnbgcolor-1','','','下载按钮背景色','','18','cn','1');
INSERT INTO met_ui_config VALUES('855','47','download_list_page','met_m1156_1','m1156ui010','9','0','','btncolor','btncolor-1','','#ffffff','下载按钮文字颜色','','19','cn','1');
INSERT INTO met_ui_config VALUES('856','49','subcolumn_nav','met_m1156_5','m1156ui010','4','1','$M$开启$T$1$M$关闭$T$0','ui_show','ui_show','','1','区块显示开关','当前UI区块的开启关闭设置，关闭后可以在可视化编辑中开启','0','cn','0');
INSERT INTO met_ui_config VALUES('857','49','subcolumn_nav','met_m1156_5','m1156ui010','9','1','','bgcolor','bgcolor-1','','','区块背景色','默认为网站背景颜色','1','cn','0');
INSERT INTO met_ui_config VALUES('858','49','subcolumn_nav','met_m1156_5','m1156ui010','9','1','','titlecolor','titlecolor','','','区块标题颜色','默认为模板主色调','2','cn','0');
INSERT INTO met_ui_config VALUES('859','49','subcolumn_nav','met_m1156_5','m1156ui010','9','1','','hovercolor','hovercolor','','','区块配色调','默认为模板配色调','4','cn','0');
INSERT INTO met_ui_config VALUES('860','49','subcolumn_nav','met_m1156_5','m1156ui010','9','0','','focuscolor','focuscolor','','','区块副色调','彩色区块中的文字颜色','5','cn','0');
INSERT INTO met_ui_config VALUES('861','49','subcolumn_nav','met_m1156_5','m1156ui010','9','0','','bordercolor','bordercolor-1','','','线条颜色','','6','cn','0');
INSERT INTO met_ui_config VALUES('862','49','subcolumn_nav','met_m1156_5','m1156ui010','9','0','','showcolor','showbgcolor','','','内容背景色','','7','cn','0');
INSERT INTO met_ui_config VALUES('863','49','subcolumn_nav','met_m1156_5','m1156ui010','9','0','','navbgcolor','navbgcolor-1','','','导航背景色','','8','cn','0');
INSERT INTO met_ui_config VALUES('864','49','subcolumn_nav','met_m1156_5','m1156ui010','4','0','$M$开启$T$1$M$关闭$T$0','navsonopen','navsonopen','','1','下级栏目开关','','9','cn','0');
INSERT INTO met_ui_config VALUES('865','49','subcolumn_nav','met_m1156_5','m1156ui010','9','0','','navsonbgcolor','navsonbgcolor','','','下级栏目背景色','','10','cn','0');
INSERT INTO met_ui_config VALUES('866','49','subcolumn_nav','met_m1156_5','m1156ui010','9','0','','navsontitlecolor','navsontitlecolor-1','','','下级栏目标题颜色','','11','cn','0');
INSERT INTO met_ui_config VALUES('867','49','subcolumn_nav','met_m1156_5','m1156ui010','9','0','','navsonbordercolor','navsonbordercolor-1','','','下级栏目线条颜色','','12','cn','0');
INSERT INTO met_ui_config VALUES('868','49','subcolumn_nav','met_m1156_5','m1156ui010','4','0','$M$开启$T$1$M$关闭$T$0','navsondown','navsondown','','0','下级栏目三角符','','13','cn','0');
INSERT INTO met_ui_config VALUES('869','49','subcolumn_nav','met_m1156_5','m1156ui010','2','0','','navall','navall','','全部','总栏目文字','简介模块下无效','27','cn','0');
INSERT INTO met_ui_config VALUES('870','49','subcolumn_nav','met_m1156_5','m1156ui010','2','0','','navsonall','navsonall','','全部','次级栏目文字','','28','cn','0');
INSERT INTO met_ui_config VALUES('871','49','subcolumn_nav','met_m1156_5','m1156ui010','2','0','','navbarprohibit','navbarprohibit','','','禁用下拉名单','禁止指定栏目显示下拉菜单，请填写栏目名称，多个用竖线（|）隔开','29','cn','0');
INSERT INTO met_ui_config VALUES('872','45','download_list_detail','met_m1156_1','m1156ui010','4','3','$M$开启$T$1$M$关闭$T$0','ui_show','ui_show','','1','区块显示开关','当前UI区块的开启关闭设置，关闭后可以在可视化编辑中开启','1','cn','0');
INSERT INTO met_ui_config VALUES('873','45','download_list_detail','met_m1156_1','m1156ui010','7','3','','bgimg','bgimg','','','区块背景图','背景图片建议尺寸：1920px * 1080px','2','cn','0');
INSERT INTO met_ui_config VALUES('874','45','download_list_detail','met_m1156_1','m1156ui010','2','0','','downloadword','downloadword','','立即下载','下载按钮文字','','3','cn','0');
INSERT INTO met_ui_config VALUES('875','45','download_list_detail','met_m1156_1','m1156ui010','2','0','','location','location-1','','当前位置：','面包屑标题','','4','cn','0');
INSERT INTO met_ui_config VALUES('876','45','download_list_detail','met_m1156_1','m1156ui010','4','0','开启$T$1$M$关闭$T$0','locationok','locationok-1','','0','面包屑开关','','5','cn','0');
INSERT INTO met_ui_config VALUES('877','45','download_list_detail','met_m1156_1','m1156ui010','2','3','','barlisttitle','barlisttitle','','为您推荐','侧栏列表标题','','6','cn','0');
INSERT INTO met_ui_config VALUES('878','45','download_list_detail','met_m1156_1','m1156ui010','6','3','','barlistid','barlistid','','','侧栏列表调用栏目','','7','cn','0');
INSERT INTO met_ui_config VALUES('879','45','download_list_detail','met_m1156_1','m1156ui010','4','0','$M$全部$T$$M$推荐$T$com$M$点击$T$hits$M$最新$T$new','barlisttype','barlisttype','','','侧栏列表类型','','8','cn','0');
INSERT INTO met_ui_config VALUES('880','45','download_list_detail','met_m1156_1','m1156ui010','2','0','','barlistnum','barlistnum','','5','侧栏列表数量','','9','cn','0');
INSERT INTO met_ui_config VALUES('881','45','download_list_detail','met_m1156_1','m1156ui010','9','3','','bgcolor','bgcolor','','','区块背景色','默认为网站背景颜色；如果添加了“区块背景图”则背景色会被遮挡。','10','cn','1');
INSERT INTO met_ui_config VALUES('882','45','download_list_detail','met_m1156_1','m1156ui010','9','3','','titlecolor','titlecolor-1','','','标题文字颜色','默认为模板主色调','11','cn','1');
INSERT INTO met_ui_config VALUES('883','45','download_list_detail','met_m1156_1','m1156ui010','9','3','','desccolor','desccolor-1','','','描述文字颜色','默认为模板副色调','12','cn','1');
INSERT INTO met_ui_config VALUES('884','45','download_list_detail','met_m1156_1','m1156ui010','9','3','','hovercolor','hovercolor-1','','','区块配色调','默认为模板配色调','13','cn','1');
INSERT INTO met_ui_config VALUES('885','45','download_list_detail','met_m1156_1','m1156ui010','9','0','','bordercolor','bordercolor-1','','','分割线条颜色','','14','cn','1');
INSERT INTO met_ui_config VALUES('886','45','download_list_detail','met_m1156_1','m1156ui010','9','3','','showcolor','showcolor','','','内容区背景色','区域中间内容部分的背景颜色','15','cn','1');
INSERT INTO met_ui_config VALUES('887','45','download_list_detail','met_m1156_1','m1156ui010','2','3','','showopacity','showopacity','','','内容区背景透明度','区域中间内容部分的背景加了颜色后的透明度，数值必须是：0.01~1之间','16','cn','1');
INSERT INTO met_ui_config VALUES('888','45','download_list_detail','met_m1156_1','m1156ui010','9','0','','btnbgcolor','btnbgcolor','','','下载按钮背景色','默认为模板配色调','17','cn','1');
INSERT INTO met_ui_config VALUES('889','45','download_list_detail','met_m1156_1','m1156ui010','9','0','','btncolor','btncolor-1','','#ffffff','下载按钮文字颜色','默认为 #ffffff','18','cn','1');
INSERT INTO met_ui_config VALUES('890','54','subcolumn_nav','met_m1156_4','m1156ui010','4','1','$M$开启$T$1$M$关闭$T$0','ui_show','ui_show','1','1','区块显示开关','当前UI区块的开启关闭设置，关闭后可以在可视化编辑中开启','0','cn','0');
INSERT INTO met_ui_config VALUES('891','54','subcolumn_nav','met_m1156_4','m1156ui010','9','1','','bgcolor','bgcolor-1','#ffffff','','区块背景色','默认为网站背景颜色','1','cn','0');
INSERT INTO met_ui_config VALUES('892','54','subcolumn_nav','met_m1156_4','m1156ui010','9','1','','titlecolor','titlecolor','#333333','','区块标题颜色','默认为模板主色调','2','cn','0');
INSERT INTO met_ui_config VALUES('893','54','subcolumn_nav','met_m1156_4','m1156ui010','9','1','','hovercolor','hovercolor','#f06ca8','','区块配色调','默认为模板配色调','4','cn','0');
INSERT INTO met_ui_config VALUES('894','54','subcolumn_nav','met_m1156_4','m1156ui010','9','0','','focuscolor','focuscolor','#ffffff','','区块副色调','彩色区块中的文字颜色','5','cn','0');
INSERT INTO met_ui_config VALUES('895','54','subcolumn_nav','met_m1156_4','m1156ui010','9','0','','bordercolor','bordercolor-1','#ffffff','','区块分割线条','','6','cn','0');
INSERT INTO met_ui_config VALUES('896','54','subcolumn_nav','met_m1156_4','m1156ui010','4','0','$M$开启$T$1$M$关闭$T$0','navsonopen','navsonopen','1','1','下级栏目开关','','9','cn','0');
INSERT INTO met_ui_config VALUES('897','54','subcolumn_nav','met_m1156_4','m1156ui010','9','0','','navsonbgcolor','navsonbgcolor','#ffffff','','下级栏目背景色','','10','cn','0');
INSERT INTO met_ui_config VALUES('898','54','subcolumn_nav','met_m1156_4','m1156ui010','9','0','','navsontitlecolor','navsontitlecolor-1','#333333','','下级栏目标题颜色','','11','cn','0');
INSERT INTO met_ui_config VALUES('899','54','subcolumn_nav','met_m1156_4','m1156ui010','9','0','','navsonbordercolor','navsonbordercolor-1','#eeeeee','','下级栏目线条颜色','','12','cn','0');
INSERT INTO met_ui_config VALUES('900','54','subcolumn_nav','met_m1156_4','m1156ui010','4','0','$M$开启$T$1$M$关闭$T$0','navsondown','navsondown','0','0','下级栏目三角符','','13','cn','0');
INSERT INTO met_ui_config VALUES('901','54','subcolumn_nav','met_m1156_4','m1156ui010','4','0','$M$开启$T$center$M$关闭$T$','navcenter','navcenter','center','','导航居中显示','','14','cn','0');
INSERT INTO met_ui_config VALUES('902','54','subcolumn_nav','met_m1156_4','m1156ui010','4','0','全屏宽$T$1$M$中间显示$T$0','navfull','navfull','','0','是否全屏宽展示','设置栏目内容部分宽度是否全屏宽展示','15','cn','0');
INSERT INTO met_ui_config VALUES('903','54','subcolumn_nav','met_m1156_4','m1156ui010','2','0','','navall','navall','全部','全部','总栏目文字','简介模块下无效','27','cn','0');
INSERT INTO met_ui_config VALUES('904','54','subcolumn_nav','met_m1156_4','m1156ui010','2','0','','navsonall','navsonall','全部','全部','次级栏目文字','','28','cn','0');
INSERT INTO met_ui_config VALUES('905','54','subcolumn_nav','met_m1156_4','m1156ui010','2','0','','navbarprohibit','navbarprohibit','','','禁用下拉名单','禁止指定栏目显示下拉菜单，请填写栏目名称，多个用竖线（|）隔开','29','cn','0');
INSERT INTO met_ui_config VALUES('906','48','feedback','met_m1156_1','m1156ui010','4','0','$M$开启$T$1$M$关闭$T$0','ui_show','ui_show','1','1','区块显示开关','当前UI区块的开启关闭设置，关闭后可以在可视化编辑中开启','0','cn','0');
INSERT INTO met_ui_config VALUES('907','48','feedback','met_m1156_1','m1156ui010','7','0','','bgimg','bgimg','','','区块背景图','背景图片建议尺寸：1920px * 1080px','1','cn','0');
INSERT INTO met_ui_config VALUES('908','48','feedback','met_m1156_1','m1156ui010','2','0','','title','title','免费报名！','感谢您的反馈意见！','标题文字','填0不显示标题，填1该处调用栏目名称','12','cn','0');
INSERT INTO met_ui_config VALUES('909','48','feedback','met_m1156_1','m1156ui010','2','0','','showopacity','showopacity','1','','内容区背景透明度','区域中间内容部分的背景加了颜色后的透明度，数值必须是：0.01~1之间','550','cn','1');
INSERT INTO met_ui_config VALUES('910','48','feedback','met_m1156_1','m1156ui010','9','0','','bgcolor','bgcolor','#fafafa','','区块背景色','默认为网站背景颜色；如果添加了“区块背景图”则背景色会被遮挡。','552','cn','1');
INSERT INTO met_ui_config VALUES('911','48','feedback','met_m1156_1','m1156ui010','9','0','','titlecolor','titlecolor-1','#333333','','标题文字颜色','默认为模板主色调','553','cn','1');
INSERT INTO met_ui_config VALUES('912','48','feedback','met_m1156_1','m1156ui010','9','0','','desccolor','desccolor-1','#383838','','描述文字颜色','默认为模板副色调','554','cn','1');
INSERT INTO met_ui_config VALUES('913','48','feedback','met_m1156_1','m1156ui010','9','0','','hovercolor','hovercolor-1','#f06ca8','','区块配色调','模板配色调','555','cn','1');
INSERT INTO met_ui_config VALUES('914','48','feedback','met_m1156_1','m1156ui010','9','0','','showcolor','showcolor','#ffffff','','内容区背景色','区域中间内容部分的背景颜色','556','cn','1');
INSERT INTO met_ui_config VALUES('915','48','feedback','met_m1156_1','m1156ui010','9','0','','bordercolor','bordercolor-1','#eeeeee','','表单线条颜色','反馈表单各文本框的线条颜色','561','cn','1');
INSERT INTO met_ui_config VALUES('916','48','feedback','met_m1156_1','m1156ui010','9','0','','borderbgcolor','borderbgcolor','#ffffff','','表单背景颜色','反馈表单各文本框的背景颜色','562','cn','1');
INSERT INTO met_ui_config VALUES('917','59','404','met_16_1','m1156ui010','4','0','$M$开启$T$1$M$关闭$T$0','ui_show','ui_show','','1','区块显示开关','当前UI区块的开启关闭设置，关闭后可以在可视化编辑中开启','0','cn','0');
INSERT INTO met_ui_config VALUES('918','59','404','met_16_1','m1156ui010','9','0','','bgcolor','bgcolor-1','','','区块背景色','默认为网站背景色','1','cn','0');
INSERT INTO met_ui_config VALUES('919','59','404','met_16_1','m1156ui010','9','0','','titlecolor','titlecolor-1','','','字体颜色','默认为模板主色调','2','cn','0');
INSERT INTO met_ui_config VALUES('920','0','global','system','m1156ui010','9','0','','bodybgcolor','bodybgcolor','#fafafa','','网站背景颜色','网站整体的背景颜色，个别区块会有自定义的背景，优先显示区块背景颜色','1','cn','0');
INSERT INTO met_ui_config VALUES('921','0','global','system','m1156ui010','9','0','','firstcolor','firstcolor','#333333','','模板主色调','一般为标题颜色，也可以使用各区块颜色参数单独设置区块为不同颜色','2','cn','0');
INSERT INTO met_ui_config VALUES('922','0','global','system','m1156ui010','9','0','','secondcolor','secondcolor','#383838','','模板副色调','一般为副标题或描述颜色，也可以使用各区块颜色参数单独设置区块为不同颜色','3','cn','0');
INSERT INTO met_ui_config VALUES('923','0','global','system','m1156ui010','9','0','','thirdcolor','thirdcolor','#f06ca8','','模板配色调','一般为鼠标经过颜色，也可以使用各区块颜色参数单独设置区块为不同颜色','4','cn','0');
INSERT INTO met_ui_config VALUES('924','0','global','system','m1156ui010','2','0','','met_font','met_font','','','网站字体','建议留空（使用模板默认字体），自定义字体需要访问终端浏览器支持','5','cn','0');
INSERT INTO met_ui_config VALUES('925','0','global','system','m1156ui010','7','0','','bodybgimg','bodybgimg','','','网站背景图片','网站整体的背景图片，个别区块会有自定义的背景，优先显示区块背景图片','6','cn','0');
INSERT INTO met_ui_config VALUES('926','0','global','system','m1156ui010','7','0','','lazyloadbg','lazyloadbg','','','图片延迟加载背景图','不上传则显示默认的延迟加载背景图','7','cn','0');
INSERT INTO met_ui_config VALUES('927','0','global','system','m1156ui010','4','0','$M$新窗口打开$T$target=_blank$M$当前窗口打开$T$target=_self','urlnew','urlnew','target=_self','target=_self','内容列表链接打开方式','列表页链接打开方式可在栏目管理中对每个栏目进行单独设置','8','cn','0');

DROP TABLE IF EXISTS met_ui_list;
CREATE TABLE `met_ui_list` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `installid` int(10) DEFAULT '0',
  `parent_name` varchar(100) DEFAULT '',
  `ui_name` varchar(100) DEFAULT '',
  `skin_name` varchar(100) DEFAULT '',
  `ui_page` varchar(200) DEFAULT '',
  `ui_title` varchar(100) DEFAULT '',
  `ui_description` varchar(500) DEFAULT '',
  `ui_order` int(10) DEFAULT '0',
  `ui_version` varchar(100) DEFAULT '',
  `ui_installtime` int(10) DEFAULT '0',
  `ui_edittime` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

INSERT INTO met_ui_list VALUES('1','1','head_nav','met_m1156_7','m1156ui010','head','头部导航','头部导航','1','1.6','1788947933','0');
INSERT INTO met_ui_list VALUES('2','52','banner','met_m1156_2','m1156ui010','head','轮播图','轮播图','2','1.4','1788947933','0');
INSERT INTO met_ui_list VALUES('3','2','column_list','met_m1156_7','m1156ui010','index','首页栏目模块','首页栏目模块','1','1.1','1788947933','0');
INSERT INTO met_ui_list VALUES('4','3','show_list','met_m1156_7','m1156ui010','index','首页简介模块','首页简介模块','2','1.0','1788947933','0');
INSERT INTO met_ui_list VALUES('5','4','product_list','met_m1156_7','m1156ui010','index','首页产品模块','首页产品模块','3','1.2','1788947933','0');
INSERT INTO met_ui_list VALUES('6','5','img_list','met_m1156_7','m1156ui010','index','首页图片模块','首页图片模块','4','1.0','1788947933','0');
INSERT INTO met_ui_list VALUES('7','6','news_list','met_m1156_7','m1156ui010','index','首页新闻模块','首页新闻模块','5','1.0','1788947933','0');
INSERT INTO met_ui_list VALUES('8','7','case_list','met_m1156_7','m1156ui010','index','首页案例模块','首页案例模块','6','1.2','1788947933','0');
INSERT INTO met_ui_list VALUES('9','8','feedback_list','met_m1156_7','m1156ui010','index','首页反馈模块','首页反馈模块','7','1.3','1788947933','0');
INSERT INTO met_ui_list VALUES('10','9','foot_nav','met_m1156_7','m1156ui010','foot','底部导航','底部导航','1','1.3','1788947933','0');
INSERT INTO met_ui_list VALUES('11','10','foot_info','met_m1156_5','m1156ui010','foot','底部版权信息','底部版权信息','2','1.3','1788947933','0');
INSERT INTO met_ui_list VALUES('12','50','back_top','met_m1156_1','m1156ui010','foot','回到顶部','回到顶部','3','1.0','1788947933','0');
INSERT INTO met_ui_list VALUES('13','14','location','met_m1156_7','m1156ui010','show','面包屑','面包屑','1','1.0','1788947933','0');
INSERT INTO met_ui_list VALUES('14','20','show','met_m1156_7','m1156ui010','show','简介模块','简介模块','2','1.0','1788947933','0');
INSERT INTO met_ui_list VALUES('15','11','sidebar','met_m1156_7','m1156ui010','show','侧边栏','侧边栏','3','1.0','1788947933','0');
INSERT INTO met_ui_list VALUES('16','15','location','met_m1156_7','m1156ui010','news','面包屑','面包屑','1','1.0','1788947933','0');
INSERT INTO met_ui_list VALUES('17','21','news_list_page','met_m1156_7','m1156ui010','news','新闻模块列表页','新闻模块列表页','2','1.1','1788947933','0');
INSERT INTO met_ui_list VALUES('18','12','sidebar','met_m1156_7','m1156ui010','news','侧边栏','侧边栏','3','1.0','1788947933','0');
INSERT INTO met_ui_list VALUES('19','16','location','met_m1156_7','m1156ui010','product','面包屑','面包屑','1','1.0','1788947933','0');
INSERT INTO met_ui_list VALUES('20','58','para_search','met_16_1','m1156ui010','product','参数搜索','参数搜索','2','3.1','1788947933','0');
INSERT INTO met_ui_list VALUES('21','22','product_list_page','met_m1156_7','m1156ui010','product','产品模块列表页','产品模块列表页','3','1.0','1788947933','0');
INSERT INTO met_ui_list VALUES('22','13','sidebar','met_m1156_7','m1156ui010','product','侧边栏','侧边栏','4','1.0','1788947933','0');
INSERT INTO met_ui_list VALUES('23','17','location','met_m1156_7','m1156ui010','img','面包屑','面包屑','1','1.0','1788947933','0');
INSERT INTO met_ui_list VALUES('24','23','img_list_page','met_m1156_7','m1156ui010','img','图片模块列表页','图片模块列表页','2','1.4','1788947933','0');
INSERT INTO met_ui_list VALUES('25','19','sidebar','met_m1156_7','m1156ui010','img','侧边栏','侧边栏','3','1.0','1788947933','0');
INSERT INTO met_ui_list VALUES('26','57','subcolumn_nav','met_m1156_4','m1156ui010','job','列表页二级导航','列表页二级导航','1','1.8','1788947933','0');
INSERT INTO met_ui_list VALUES('27','25','job_list_page','met_m1156_5','m1156ui010','job','招聘模块列表页','招聘模块列表页','2','1.4','1788947933','0');
INSERT INTO met_ui_list VALUES('28','55','subcolumn_nav','met_m1156_4','m1156ui010','message_index','列表页二级导航','列表页二级导航','1','1.8','1788947933','0');
INSERT INTO met_ui_list VALUES('29','56','message','met_m1156_4','m1156ui010','message_index','留言模块','留言模块','2','1.1','1788947933','0');
INSERT INTO met_ui_list VALUES('30','29','location','met_m1156_7','m1156ui010','shownews','面包屑','面包屑','1','1.0','1788947933','0');
INSERT INTO met_ui_list VALUES('31','30','news_list_detail','met_m1156_7','m1156ui010','shownews','新闻模块详情页','新闻模块详情页','2','1.0','1788947933','0');
INSERT INTO met_ui_list VALUES('32','31','sidebar','met_m1156_7','m1156ui010','shownews','侧边栏','侧边栏','3','1.0','1788947933','0');
INSERT INTO met_ui_list VALUES('33','32','location','met_m1156_7','m1156ui010','showproduct','面包屑','面包屑','1','1.0','1788947933','0');
INSERT INTO met_ui_list VALUES('34','33','product_list_detail','met_m1156_7','m1156ui010','showproduct','产品模块详情页','产品模块详情页','2','1.0','1788947933','0');
INSERT INTO met_ui_list VALUES('35','34','sidebar','met_m1156_7','m1156ui010','showproduct','侧边栏','侧边栏','3','1.0','1788947933','0');
INSERT INTO met_ui_list VALUES('36','35','location','met_m1156_7','m1156ui010','showimg','面包屑','面包屑','1','1.0','1788947933','0');
INSERT INTO met_ui_list VALUES('37','36','img_list_detail','met_m1156_7','m1156ui010','showimg','图片模块详情页','图片模块详情页','2','1.1','1788947933','0');
INSERT INTO met_ui_list VALUES('38','37','sidebar','met_m1156_7','m1156ui010','showimg','侧边栏','侧边栏','3','1.0','1788947933','0');
INSERT INTO met_ui_list VALUES('39','38','location','met_m1156_7','m1156ui010','shop_showproduct','面包屑','面包屑','1','1.0','1788947933','0');
INSERT INTO met_ui_list VALUES('40','40','shop_product_detail','met_m1156_7','m1156ui010','shop_showproduct','产品模块详情页（带商城）','产品模块详情页（带商城）','2','1.0','1788947933','0');
INSERT INTO met_ui_list VALUES('41','39','sidebar','met_m1156_7','m1156ui010','shop_showproduct','侧边栏','侧边栏','3','1.0','1788947933','0');
INSERT INTO met_ui_list VALUES('42','42','subcolumn_nav','met_m1156_5','m1156ui010','search','列表页二级导航','列表页二级导航','1','1.0','1788947933','0');
INSERT INTO met_ui_list VALUES('43','43','search','met_m1156_5','m1156ui010','search','搜索模块','搜索模块','2','1.1','1788947933','0');
INSERT INTO met_ui_list VALUES('44','44','subcolumn_nav','met_m1156_5','m1156ui010','sitemap','列表页二级导航','列表页二级导航','1','1.0','1788947933','0');
INSERT INTO met_ui_list VALUES('45','41','sitemap','met_m1156_1','m1156ui010','sitemap','网站地图','网站地图','2','1.1','1788947933','0');
INSERT INTO met_ui_list VALUES('46','46','subcolumn_nav','met_m1156_5','m1156ui010','download','列表页二级导航','列表页二级导航','1','1.0','1788947933','0');
INSERT INTO met_ui_list VALUES('47','47','download_list_page','met_m1156_1','m1156ui010','download','下载模块列表页','下载模块列表页','2','1.5','1788947933','0');
INSERT INTO met_ui_list VALUES('48','49','subcolumn_nav','met_m1156_5','m1156ui010','showdownload','列表页二级导航','列表页二级导航','1','1.0','1788947933','0');
INSERT INTO met_ui_list VALUES('49','45','download_list_detail','met_m1156_1','m1156ui010','showdownload','下载模块详情页','下载模块详情页','2','1.7','1788947933','0');
INSERT INTO met_ui_list VALUES('50','54','subcolumn_nav','met_m1156_4','m1156ui010','feedback','列表页二级导航','列表页二级导航','1','1.8','1788947933','0');
INSERT INTO met_ui_list VALUES('51','48','feedback','met_m1156_1','m1156ui010','feedback','反馈模块','反馈模块','2','1.9','1788947933','0');
INSERT INTO met_ui_list VALUES('52','59','404','met_16_1','m1156ui010','404','简单的404页面','简单的404页面','1','1.2','1788947933','0');

DROP TABLE IF EXISTS met_user;
CREATE TABLE `met_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) DEFAULT '',
  `password` varchar(32) DEFAULT '',
  `head` varchar(100) DEFAULT '',
  `email` varchar(50) DEFAULT '',
  `tel` varchar(20) DEFAULT '',
  `groupid` int(11) DEFAULT '0',
  `register_time` int(11) DEFAULT '0',
  `register_ip` varchar(15) DEFAULT '',
  `login_time` int(11) DEFAULT '0',
  `login_count` int(11) DEFAULT '0',
  `login_ip` varchar(15) DEFAULT '',
  `valid` int(1) DEFAULT '0',
  `source` varchar(20) DEFAULT '',
  `lang` varchar(50) DEFAULT '',
  `idvalid` int(1) DEFAULT '0' COMMENT '实名认证状态',
  `reidinfo` varchar(100) DEFAULT '' COMMENT '实名信息  姓名|身份证|手机号',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS met_user_group;
CREATE TABLE `met_user_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT '',
  `access` int(11) DEFAULT '0',
  `lang` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

INSERT INTO met_user_group VALUES('1','普通会员','1','cn');
INSERT INTO met_user_group VALUES('2','代理商','3','cn');
INSERT INTO met_user_group VALUES('4','Member','1','en');
INSERT INTO met_user_group VALUES('5','Agents','2','en');

DROP TABLE IF EXISTS met_user_group_pay;
CREATE TABLE `met_user_group_pay` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `groupid` int(11) DEFAULT '0' COMMENT '会员组ID',
  `price` double(10,2) DEFAULT '0.00' COMMENT '购买价格',
  `recharge_price` double(10,2) DEFAULT '0.00' COMMENT '充值价格',
  `buyok` int(1) DEFAULT '0' COMMENT '付费会员',
  `rechargeok` int(50) DEFAULT '0' COMMENT '充值会员',
  `lang` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS met_user_list;
CREATE TABLE `met_user_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `listid` int(11) DEFAULT '0',
  `paraid` int(11) DEFAULT '0',
  `info` text,
  `lang` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS met_user_other;
CREATE TABLE `met_user_other` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `met_uid` int(11) DEFAULT '0',
  `openid` varchar(100) DEFAULT '',
  `unionid` varchar(100) DEFAULT '',
  `access_token` varchar(255) DEFAULT '',
  `expires_in` int(11) DEFAULT '0',
  `type` varchar(10) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `openid` (`openid`),
  KEY `met_uid` (`met_uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS met_weixin_reply_log;
CREATE TABLE `met_weixin_reply_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `FromUserName` varchar(255) DEFAULT '',
  `Content` text,
  `rid` int(11) DEFAULT NULL,
  `CreateTime` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


