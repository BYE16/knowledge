/*
Navicat MySQL Data Transfer

Source Server         : MySQL5
Source Server Version : 50518
Source Host           : localhost:3306
Source Database       : knowledge

Target Server Type    : MYSQL
Target Server Version : 50518
File Encoding         : 65001

Date: 2020-11-22 22:09:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `book`
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `brand` varchar(20) NOT NULL,
  `introduction` varchar(255) NOT NULL,
  `price` float(50,0) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20005 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('20001', 'python中的小坑', 'python', '一、注意书写规范，例如空行，换行。二、区分大小写。。。。。', '14');
INSERT INTO `book` VALUES ('20002', 'web前端心得', 'web前端框架', 'element-ui非常好用。', '10');
INSERT INTO `book` VALUES ('20003', '记一次JavaWeb实验', 'JavaWeb', '如何进行跳转', '45');
INSERT INTO `book` VALUES ('20004', '数据仓库算法合集', '数据仓库', '这次我整合了这学期数据仓库中学到的分析算法。', '35');

-- ----------------------------
-- Table structure for `file`
-- ----------------------------
DROP TABLE IF EXISTS `file`;
CREATE TABLE `file` (
  `id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `file` varchar(255) NOT NULL,
  `file_flag` int(1) NOT NULL DEFAULT '0',
  `updatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `file-name` (`name`),
  CONSTRAINT `file-name` FOREIGN KEY (`name`) REFERENCES `user` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of file
-- ----------------------------
INSERT INTO `file` VALUES ('1', 'Mike', '/file/a.txt', '1', '2020-11-18 00:46:09');
INSERT INTO `file` VALUES ('2', 'Mike', '/file/b.docx', '0', '2020-11-15 10:38:29');
INSERT INTO `file` VALUES ('3', 'Alice', '/file/c.jpeg', '0', '2020-11-15 10:23:55');
INSERT INTO `file` VALUES ('4', 'Mike', '/file/d.jpeg', '1', '2020-11-15 21:10:20');
INSERT INTO `file` VALUES ('5', 'Mike', '/file/e.pptx', '0', '2020-11-15 10:31:36');
INSERT INTO `file` VALUES ('6', 'Mike', '/file/f.pdf', '1', '2020-11-18 00:51:49');
INSERT INTO `file` VALUES ('7', 'Mike', '/file/g.xlsx', '0', '2020-11-15 10:34:23');
INSERT INTO `file` VALUES ('8', 'Mike', '/file/h.zip', '0', '2020-11-15 11:06:36');

-- ----------------------------
-- Table structure for `text`
-- ----------------------------
DROP TABLE IF EXISTS `text`;
CREATE TABLE `text` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `text` varchar(1000) NOT NULL,
  `text_flag` int(1) unsigned zerofill NOT NULL DEFAULT '0',
  `updatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `text-name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of text
-- ----------------------------
INSERT INTO `text` VALUES ('1', 'Mike', '这条路是一道风景，他们——那些千千万万的劳动者更是风景。他们就像春季，大地回暖，生机勃发，一切生与希望整装待发：就像夏季，朴实厚重：就像秋，情意绵绵，硕果含羞：还有冬，傲骨铮铮。', '1', '2020-11-18 00:23:12');
INSERT INTO `text` VALUES ('2', 'Mike', '有位名人说过：“上帝在为你关闭一扇窗子的同时会为你打开另一扇窗。”人生没有永远的绝境，每一条看似走到尽头的小路其实还有“柳暗花明”。道路前面还是道路，人生也没有永远的成功，只有把一次次成功当作一个个奋斗的起点，不断进取，才能走向更大的辉煌。', '1', '2020-11-22 22:05:02');
INSERT INTO `text` VALUES ('3', 'Alice', '曾几何时，我以为自己的心灵会想断了线的纸鸢，在重力的作用下，越来越下沉，会越来越累，再没有飞上苍穹那一日。曾几何时，我以为自己的心灵会像飘落的树叶一般，被埋入泥土，渐渐被覆盖上一层层落花及一片片落叶，然后就被埋藏地很深很深，再没有重见天日的那一刻。', '0', '2020-11-10 19:21:05');
INSERT INTO `text` VALUES ('4', 'zhangsan', '霜降，像是季节的分水岭，将沾着花色的一端关在深秋，将飘着凉瑟的一端领进初冬。感受着萧瑟的风越来越冷了，耳边飘零的落雨声已不再绵绵温宜，那散落枯萎的落叶也凋零成了笔下落墨的闲趣。我的心也将不再疏离与执意，眉目上的清明，手心里的温情，愿都尽数...', '1', '2020-11-17 22:54:43');
INSERT INTO `text` VALUES ('5', 'Mike', '人生路漫漫，道阻且长，会享受阳光的照拂，也会经历风雨的洗礼；会有不期而遇的温暖，也会有旦夕祸福的叵测。\r\n\r\n有些路，终要自己一个人走，是平坦，是泥泞，都不能回头。有些苦，只能自己品尝，经历过了，就成长了。\r\n\r\n那些曾以为走不出来的困境，终会跨越；那些曾以为攀登不了的高峰，总有希望登顶；那些曾以为无法忘却的悲伤，终有一天也会风轻云淡。\r\n\r\n珍惜所有的陌路相逢，看淡所有的不欢而散。人生最好的状态便是：既往不恋，当下不杂，未来不忧。', '1', '2020-11-22 22:05:00');
INSERT INTO `text` VALUES ('6', 'Mike', '有人曾说：“人间许多情事其实只是时光撒下的谎言，而我们却愿意为一个谎言执迷不悔，甚至追忆一生。”也许每个人的内心深处都有一些执念，或是功名利禄，或是成败得失，或是爱恨痴缠。执于一念，便会受困于一念；一念放下，便会自在安宁。', '0', '2020-11-18 00:10:39');
INSERT INTO `text` VALUES ('7', 'Mike', '有句歌词写得好：“岁月是一场有去无回的旅行，好的坏的都是风景。”生活中有酸甜也有苦辣，人生路上有顺遂也有坎坷。不沉醉于往日的辉煌，也不沉溺于过往的忧伤。既往不恋，才能不乱于心、不困于情，勇敢前行。', '1', '2020-11-18 00:23:17');
INSERT INTO `text` VALUES ('8', 'Mike', '在万千繁华中保持一颗宁静的心，不以物喜不以己悲，不因外界的喧嚣而浮躁，不因别人的评判而动摇。专注地活在当下，是一种能力，也是一种境界。', '1', '2020-11-22 22:05:08');
INSERT INTO `text` VALUES ('9', 'Mike', '有人说过这样一句话：“当我们深深地融入当下，全心全意地对待平静寻常的时刻，我们就可以触及过去与未来；当我们知道如何恰当地把握当下，我们就能治愈过去、改变现在。', '0', '2020-11-16 16:25:36');
INSERT INTO `text` VALUES ('10', 'Mike', '有人曾说：真正使我疲惫的，不是遥远的路途，而是鞋子里的一粒沙。和遥远的路途相比，一粒沙看似微不足道，却决定着路途中花费的时间和精力，影响着行走的速度，这就是我们平常所说细节的力量。 人生的每一步想要走得踏实而坚定，就要学会大处着眼，小处着...', '1', '2020-11-22 22:05:03');

-- ----------------------------
-- Table structure for `thing`
-- ----------------------------
DROP TABLE IF EXISTS `thing`;
CREATE TABLE `thing` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `title` varchar(100) NOT NULL,
  `matter` varchar(1024) NOT NULL,
  `thing_flag` int(1) NOT NULL DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  CONSTRAINT `thing-name` FOREIGN KEY (`name`) REFERENCES `user` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of thing
-- ----------------------------
INSERT INTO `thing` VALUES ('1', 'Mike', 'web前端', 'Web前端答辩，Web前端答辩，Web前端答辩，Web前端答辩，Web前端答辩，Web前端答辩，Web前端答辩，Web前端答辩', '1', '2020-11-22 21:09:00');
INSERT INTO `thing` VALUES ('2', 'Mike', 'Javaweb', 'JavaWeb实验，JavaWeb实验，JavaWeb实验，JavaWeb实验，JavaWeb实验，JavaWeb实验，JavaWeb实验，JavaWeb实验，', '0', '2020-11-15 00:04:59');
INSERT INTO `thing` VALUES ('3', 'Alice', 'web前端', 'Web前端大作业答辩，Web前端大作业答辩，Web前端大作业答辩Web前端大作业答辩Web前端大作业答辩Web前端大作业答辩，Web前端大作业答辩，Web前端大作业答辩，Web前端大作业答辩', '0', '2020-11-15 00:05:12');
INSERT INTO `thing` VALUES ('4', 'Mike', '课设', '综合课程设计，综合课程设计，综合课程设计，综合课程设计，综合课程设计，综合课程设计', '0', '2020-11-15 00:05:22');
INSERT INTO `thing` VALUES ('5', 'Mike', '数据库', '创建表，创建表，创建表，创建表，创建表，创建表，', '1', '2020-11-22 21:09:04');
INSERT INTO `thing` VALUES ('6', 'Mike', '项目管理', '编写需求说明书', '0', '2020-11-14 23:22:08');
INSERT INTO `thing` VALUES ('7', 'Mike', '软件测试', '对所开发的软件进行功能测试', '0', '2020-11-14 23:22:45');
INSERT INTO `thing` VALUES ('8', 'Mike', 'Python复习', 'Python复习，Python复习，Python复习Python复习，Python复习，Python复习', '0', '2020-11-22 21:10:33');
INSERT INTO `thing` VALUES ('9', 'Mike', '大数据实验', '提交实验报告，提交实验报告，提交实验报告，提交实验报告，提交实验报告，提交实验报告', '1', '2020-11-22 21:11:17');
INSERT INTO `thing` VALUES ('10', 'Mike', '形式与政策', '智慧树提交作业，我的家乡，智慧树提交作业，我的家乡，智慧树提交作业，我的家乡，智慧树提交作业，我的家乡，智慧树提交作业，我的家乡智慧树提交作业，我的家乡，智慧树提交作业，我的家乡，的家乡，智慧树提交作业，我的家乡，智慧树提交作业，我的家乡，智慧树提交作业，我的家乡，智慧树提交作业，我的家乡智慧树提交作业，我的家乡，智慧树提交作业，我的家乡，智慧树提交作业，我的家乡，智慧树提交作业，我的家乡，智慧树提交作业，我的家乡，智慧树提交作业，我的家乡智慧树提交作业，我的家乡，智慧树提交作业，我', '0', '2020-11-22 22:07:03');
INSERT INTO `thing` VALUES ('11', 'Mike', '网络操作系统', '手写实验报告，手写实验报告，手写实验报告，手写实验报告，手写实验报告', '0', '2020-11-22 21:14:03');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `sex` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_2` (`name`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'Mike', '123', '3194745800@qq.com', '0');
INSERT INTO `user` VALUES ('2', 'Alice', '111', '2099271535@qq.com', '1');
INSERT INTO `user` VALUES ('3', 'zhangsan', '222', '1986210@163.com', '1');
