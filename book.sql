/*
 Navicat Premium Data Transfer

 Source Server         : test2
 Source Server Type    : MySQL
 Source Server Version : 80020
 Source Host           : localhost:3306
 Source Schema         : book

 Target Server Type    : MySQL
 Target Server Version : 80020
 File Encoding         : 65001

 Date: 18/05/2021 17:21:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for book_class
-- ----------------------------
DROP TABLE IF EXISTS `book_class`;
CREATE TABLE `book_class`  (
  `isbn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `categories` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图书大类',
  `genre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '小类',
  PRIMARY KEY (`isbn`) USING BTREE,
  CONSTRAINT `book_class_ibfk_1` FOREIGN KEY (`isbn`) REFERENCES `library_book` (`isbn`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book_class
-- ----------------------------
INSERT INTO `book_class` VALUES ('9787040255362', '数学', '线性代数');
INSERT INTO `book_class` VALUES ('9787111544937', '计算机', '计算机系统');
INSERT INTO `book_class` VALUES ('9787111649649', '计算机', '运维监控');
INSERT INTO `book_class` VALUES ('9787115273680', '计算机', '网络安全');
INSERT INTO `book_class` VALUES ('9787115341082', '计算机', '数据库');
INSERT INTO `book_class` VALUES ('9787115354594', '计算机', '算法');
INSERT INTO `book_class` VALUES ('9787302356288', '计算机', '算法');
INSERT INTO `book_class` VALUES ('9787302389644', '计算机', '网络安全');
INSERT INTO `book_class` VALUES ('9787508353944', '计算机', '计算机系统');
INSERT INTO `book_class` VALUES ('9787512361881', '计算机', '计算机语言');
INSERT INTO `book_class` VALUES ('9787569305944', '数学', '高等数学');

-- ----------------------------
-- Table structure for book_number
-- ----------------------------
DROP TABLE IF EXISTS `book_number`;
CREATE TABLE `book_number`  (
  `isbn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `number` int(0) NULL DEFAULT NULL,
  `nownumber` int(0) NULL DEFAULT NULL,
  `total_borrow` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`isbn`) USING BTREE,
  CONSTRAINT `book_number_ibfk_1` FOREIGN KEY (`isbn`) REFERENCES `library_book` (`isbn`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book_number
-- ----------------------------
INSERT INTO `book_number` VALUES ('9787040255362', 2, 1, 0);
INSERT INTO `book_number` VALUES ('9787111544937', 2, 2, 1);
INSERT INTO `book_number` VALUES ('9787111649649', 13, 11, 6);
INSERT INTO `book_number` VALUES ('9787115273680', 1, 0, 3);
INSERT INTO `book_number` VALUES ('9787115341082', 2, 2, 6);
INSERT INTO `book_number` VALUES ('9787115354594', 2, 1, 1);
INSERT INTO `book_number` VALUES ('9787302356288', 2, 2, 0);
INSERT INTO `book_number` VALUES ('9787302389644', 2, 2, 1);
INSERT INTO `book_number` VALUES ('9787508353944', 2, 2, 1);
INSERT INTO `book_number` VALUES ('9787512361881', 3, 2, 8);
INSERT INTO `book_number` VALUES ('9787569305944', 2, 2, 1);

-- ----------------------------
-- Table structure for book_room
-- ----------------------------
DROP TABLE IF EXISTS `book_room`;
CREATE TABLE `book_room`  (
  `isbn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `room` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bookrack` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`isbn`) USING BTREE,
  CONSTRAINT `book_room_ibfk_1` FOREIGN KEY (`isbn`) REFERENCES `library_book` (`isbn`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book_room
-- ----------------------------
INSERT INTO `book_room` VALUES ('9787040255362', '社会科学图书室3', '3架B面1列');
INSERT INTO `book_room` VALUES ('9787111544937', '社会科学图书室3', '3架B面1列');
INSERT INTO `book_room` VALUES ('9787111649649', '社会科学图书室3', '1架A面1列');
INSERT INTO `book_room` VALUES ('9787115273680', '社会科学图书室3', '3架B面1列');
INSERT INTO `book_room` VALUES ('9787115341082', '社会科学图书室1', '1架A面1列');
INSERT INTO `book_room` VALUES ('9787115354594', '社会科学图书室3', '33架B面1列');
INSERT INTO `book_room` VALUES ('9787302356288', '社会科学图书室1', '1架A面1列');
INSERT INTO `book_room` VALUES ('9787302389644', '社会科学图书室3', '3架B面1列');
INSERT INTO `book_room` VALUES ('9787508353944', '社会科学图书室3', '3架B面1列');
INSERT INTO `book_room` VALUES ('9787512361881', '社会科学图书室1', '1架A面1列');
INSERT INTO `book_room` VALUES ('9787569305944', '社会科学图书室3', '1架A面1列');

-- ----------------------------
-- Table structure for borrowlog
-- ----------------------------
DROP TABLE IF EXISTS `borrowlog`;
CREATE TABLE `borrowlog`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `isbn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_code` int(0) NOT NULL,
  `borrowtime` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `returntime` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否逾期',
  `operation` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 80 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of borrowlog
-- ----------------------------
INSERT INTO `borrowlog` VALUES (1, '9787111649649', 123, '2021-04-30', '2021-06-29', '未逾期', '借阅');
INSERT INTO `borrowlog` VALUES (2, '9787111649649', 123, '2021-04-30', '2021-06-29', '未逾期', '归还');
INSERT INTO `borrowlog` VALUES (3, '9787111649649', 123, '2021-04-30', '2021-06-29', '未逾期', '归还');
INSERT INTO `borrowlog` VALUES (4, '9787111649649', 123, '2021-04-30', '2021-06-29', '未逾期', '归还');
INSERT INTO `borrowlog` VALUES (5, '9787111649649', 123, '2021-04-30', '2021-06-29', '未逾期', '归还');
INSERT INTO `borrowlog` VALUES (6, '9787111649649', 123, '2021-04-30', '2021-06-29', '未逾期', '归还');
INSERT INTO `borrowlog` VALUES (7, '9787111649649', 123, '2021-04-30', '2021-06-29', '未逾期', '归还');
INSERT INTO `borrowlog` VALUES (8, '9787111649649', 123, '2021-04-30', '2021-06-29', '未逾期', '归还');
INSERT INTO `borrowlog` VALUES (9, '9787111649649', 123, '2021-04-30', '2021-06-29', '未逾期', '归还');
INSERT INTO `borrowlog` VALUES (10, '9787111649649', 123, '2021-04-30', '2021-06-29', '未逾期', '归还');
INSERT INTO `borrowlog` VALUES (12, '9787115341082', 12, '2021-04-30', '2021-06-29', '未逾期', '归还');
INSERT INTO `borrowlog` VALUES (13, '9787512361881', 12, '2021-04-30', '2021-06-29', '未逾期', '归还');
INSERT INTO `borrowlog` VALUES (14, '9787512361881', 123, '2021-04-30', '2021-06-29', '未逾期', '借阅');
INSERT INTO `borrowlog` VALUES (15, '9787512361881', 123, '2021-04-30', '2021-06-29', '未逾期', '借阅');
INSERT INTO `borrowlog` VALUES (16, '9787512361881', 123, '2021-04-30', '2021-06-29', '未逾期', '借阅');
INSERT INTO `borrowlog` VALUES (17, '9787512361881', 123, '2021-04-30', '2021-06-29', '未逾期', '归还');
INSERT INTO `borrowlog` VALUES (18, '9787512361881', 123, '2021-04-30', '2021-06-29', '未逾期', '归还');
INSERT INTO `borrowlog` VALUES (19, '9787512361881', 123, '2021-04-30', '2021-06-29', '未逾期', '借阅');
INSERT INTO `borrowlog` VALUES (20, '9787512361881', 123, '2021-04-30', '2021-06-29', '未逾期', '归还');
INSERT INTO `borrowlog` VALUES (21, '9787512361881', 123, '2021-04-30', '2021-06-29', '未逾期', '借阅');
INSERT INTO `borrowlog` VALUES (22, '9787512361881', 123, '2021-04-30', '2021-06-29', '未逾期', '归还');
INSERT INTO `borrowlog` VALUES (23, '9787512361881', 123, '2021-04-30', '2021-06-29', '未逾期', '借阅');
INSERT INTO `borrowlog` VALUES (24, '9787512361881', 123, '2021-04-30', '2021-06-29', '未逾期', '归还');
INSERT INTO `borrowlog` VALUES (25, '9787111649649', 123, '2021-05-01', '2021-06-31', '未逾期', '借阅');
INSERT INTO `borrowlog` VALUES (26, '9787512361881', 123, '2021-05-01', '2021-06-31', '未逾期', '借阅');
INSERT INTO `borrowlog` VALUES (27, '9787115341082', 12, '2021-05-01', '2021-06-31', '未逾期', '借阅');
INSERT INTO `borrowlog` VALUES (28, '9787111649649', 123, '2021-05-01', '2021-06-31', '未逾期', '归还');
INSERT INTO `borrowlog` VALUES (29, '9787512361881', 123, '2021-05-01', '2021-06-31', '未逾期', '归还');
INSERT INTO `borrowlog` VALUES (30, '9787115341082', 12, '2021-05-01', '2021-06-31', '未逾期', '归还');
INSERT INTO `borrowlog` VALUES (31, '9787512361881', 123, '2021-05-01', '2021-06-31', '未逾期', '借阅');
INSERT INTO `borrowlog` VALUES (32, '9787115351082', 123, '2021-05-01', '2021-06-31', '未逾期', '借阅');
INSERT INTO `borrowlog` VALUES (33, '9787512361881', 123, '2021-05-01', '2021-06-31', '未逾期', '归还');
INSERT INTO `borrowlog` VALUES (34, '9787115351082', 123, '2021-05-01', '2021-06-31', '未逾期', '归还');
INSERT INTO `borrowlog` VALUES (35, '9787111649649', 123, '2021-05-01', '2021-06-31', '未逾期', '借阅');
INSERT INTO `borrowlog` VALUES (36, '9787115351082', 123, '2021-05-01', '2021-06-31', '未逾期', '借阅');
INSERT INTO `borrowlog` VALUES (37, '9787111649649', 123, '2021-05-01', '2021-06-31', '未逾期', '归还');
INSERT INTO `borrowlog` VALUES (38, '9787115351082', 123, '2021-05-01', '2021-06-31', '未逾期', '归还');
INSERT INTO `borrowlog` VALUES (39, '9787115351082', 123, '2021-05-01', '2021-06-31', '未逾期', '借阅');
INSERT INTO `borrowlog` VALUES (40, '9787512361881', 123, '2021-05-01', '2021-06-31', '未逾期', '借阅');
INSERT INTO `borrowlog` VALUES (41, '9787115341082', 123, '2021-05-01', '2021-06-31', '未逾期', '借阅');
INSERT INTO `borrowlog` VALUES (42, '9787115351082', 123, '2021-05-01', '2021-06-31', '未逾期', '归还');
INSERT INTO `borrowlog` VALUES (43, '9787512361881', 123, '2021-05-01', '2021-06-31', '未逾期', '归还');
INSERT INTO `borrowlog` VALUES (44, '9787115341082', 123, '2021-05-01', '2021-06-31', '未逾期', '归还');
INSERT INTO `borrowlog` VALUES (45, '9787111649649', 123, '2021-05-01', '2021-06-31', '未逾期', '借阅');
INSERT INTO `borrowlog` VALUES (46, '9787115341082', 123, '2021-05-01', '2021-06-31', '未逾期', '借阅');
INSERT INTO `borrowlog` VALUES (47, '9787115351082', 123, '2021-05-01', '2021-06-31', '未逾期', '借阅');
INSERT INTO `borrowlog` VALUES (48, '9787512361881', 123, '2021-05-01', '2021-06-31', '未逾期', '借阅');
INSERT INTO `borrowlog` VALUES (49, '9787111649649', 123, '2021-05-01', '2021-06-31', '未逾期', '归还');
INSERT INTO `borrowlog` VALUES (50, '9787115341082', 123, '2021-05-01', '2021-06-31', '未逾期', '归还');
INSERT INTO `borrowlog` VALUES (51, '9787115351082', 123, '2021-05-01', '2021-06-31', '未逾期', '归还');
INSERT INTO `borrowlog` VALUES (52, '9787512361881', 123, '2021-05-01', '2021-06-31', '未逾期', '归还');
INSERT INTO `borrowlog` VALUES (53, '9787115273680', 123, '2021-05-01', '2021-06-31', '未逾期', '借阅');
INSERT INTO `borrowlog` VALUES (54, '9787115273680', 123, '2021-05-01', '2021-06-31', '未逾期', '归还');
INSERT INTO `borrowlog` VALUES (55, '9787115351082', 123, '2021-05-01', '2021-06-31', '未逾期', '借阅');
INSERT INTO `borrowlog` VALUES (56, '9787115273680', 123, '2021-05-01', '2021-06-31', '未逾期', '借阅');
INSERT INTO `borrowlog` VALUES (57, '9787115341082', 123, '2021-05-01', '2021-06-31', '未逾期', '借阅');
INSERT INTO `borrowlog` VALUES (58, '9787115351082', 123, '2021-05-01', '2021-06-31', '未逾期', '归还');
INSERT INTO `borrowlog` VALUES (59, '9787115341082', 123, '2021-05-01', '2021-06-31', '未逾期', '归还');
INSERT INTO `borrowlog` VALUES (60, '9787115273680', 123, '2021-05-01', '2021-04-30', '逾期', '归还');
INSERT INTO `borrowlog` VALUES (61, '9787115351082', 123, '2021-05-01', '2021-06-31', '未逾期', '借阅');
INSERT INTO `borrowlog` VALUES (62, '9787115273680', 123, '2021-05-01', '2021-06-31', '未逾期', '借阅');
INSERT INTO `borrowlog` VALUES (63, '9787508353944', 123, '2021-05-01', '2021-06-31', '未逾期', '借阅');
INSERT INTO `borrowlog` VALUES (64, '9787111544937', 123, '2021-05-01', '2021-06-31', '未逾期', '借阅');
INSERT INTO `borrowlog` VALUES (65, '9787569305944', 123, '2021-05-01', '2021-06-31', '未逾期', '借阅');
INSERT INTO `borrowlog` VALUES (66, '9787111649649', 12, '2021-05-02', '2021-07-01', '未逾期', '借阅');
INSERT INTO `borrowlog` VALUES (67, '9787508353944', 123, '2021-05-02', '2021-06-31', '未逾期', '归还');
INSERT INTO `borrowlog` VALUES (68, '9787111544937', 123, '2021-05-02', '2021-06-31', '未逾期', '归还');
INSERT INTO `borrowlog` VALUES (69, '9787569305944', 123, '2021-05-13', '2021-06-31', '未逾期', '归还');
INSERT INTO `borrowlog` VALUES (70, '9787512361881', 123, '2021-05-13', '2021-07-12', '未逾期', '借阅');
INSERT INTO `borrowlog` VALUES (71, '9787115351082', 123, '2021-05-13', '2021-06-31', '未逾期', '归还');
INSERT INTO `borrowlog` VALUES (73, '9787302389644', 123, '2021-05-13', '2021-07-12', '未逾期', '借阅');
INSERT INTO `borrowlog` VALUES (74, '9787115351082', 123, '2021-05-13', '2021-07-12', '未逾期', '归还');
INSERT INTO `borrowlog` VALUES (75, '9787115341082', 123, '2021-05-13', '2021-07-12', '未逾期', '借阅');
INSERT INTO `borrowlog` VALUES (76, '9787115341082', 123, '2021-05-13', '2021-07-12', '未逾期', '归还');
INSERT INTO `borrowlog` VALUES (77, '9787115354594', 123, '2021-05-13', '2021-07-12', '未逾期', '借阅');
INSERT INTO `borrowlog` VALUES (78, '9787115354594', 123, '2021-05-13', '2021-07-12', '未逾期', '归还');
INSERT INTO `borrowlog` VALUES (79, '9787111649649', 123, '2021-05-14', '2021-07-13', '未逾期', '借阅');
INSERT INTO `borrowlog` VALUES (80, '9787302389644', 123, '2021-05-14', '2021-07-12', '未逾期', '归还');

-- ----------------------------
-- Table structure for dictionary
-- ----------------------------
DROP TABLE IF EXISTS `dictionary`;
CREATE TABLE `dictionary`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `type_code` int(0) NULL DEFAULT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dictionary
-- ----------------------------
INSERT INTO `dictionary` VALUES (1, 1, '读者');
INSERT INTO `dictionary` VALUES (2, 1, '图书管理员');

-- ----------------------------
-- Table structure for library_book
-- ----------------------------
DROP TABLE IF EXISTS `library_book`;
CREATE TABLE `library_book`  (
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '书名',
  `subtitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '副书名',
  `pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作者',
  `summary` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '摘要',
  `publisher` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出版社',
  `pubplace` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出版地',
  `pubdate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出版时间',
  `page` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '页数',
  `price` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '价格',
  `binding` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '装帧方式',
  `isbn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ISBN',
  `isbn10` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ISBN 10位',
  `keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主题词',
  `edition` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '版次',
  `impression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '印次',
  `language` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '正文语种',
  `format` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开本',
  `cip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'CIP核准号',
  PRIMARY KEY (`isbn`) USING BTREE,
  INDEX `isbn`(`isbn`) USING BTREE,
  INDEX `title`(`title`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of library_book
-- ----------------------------
INSERT INTO `library_book` VALUES ('线性代数', '', 'http://api.jisuapi.com/isbn//upload/f0/af172cb7bf7fb7.jpg', '黄廷祝, 成孝予著', '本书是在作者编写的普通高等教育“十一五”国家级规划教材《线性代数与空间解析几何（第三版）》的基础上，针对未将线性代数与空间解析几何融为一门课程的院校，和不同高等院校对线性代数课程的不同要求，在保持原有教材的内容体系和编写风格的基础上，以线性代数作为独立内容简化修改而成。', '高等教育出版社', '北京', '2009-01', '0', '21.80', '平装', '9787040255362', '7040255367', '线性代数－高等学校－教材', '1版', '1', '', '23', '2009004685');
INSERT INTO `library_book` VALUES ('深入理解计算机系统', '计算机科学丛书', 'http://api.jisuapi.com/isbn/upload/10/b779cc5f163e76.jpg', ' (美) 兰德尔·E.布莱恩特 (Randal E. Bry', '本书是将计算机软件和硬件理论结合讲述的经典教程，内容覆盖计算机导论、体系结构和处理器设计等多门课程。本书的最大优点是为程序员描述计算机系统的实现细节，通过描述程序是如何映射到系统上，以及程序是如何执行的，使读者更好地理解程序的行为为什么是这样的，以及造成效率低下的原因。', '机械工业出版社', '北京', '2016-7', '737', '139.00', '平装', '9787111544937', '7111544935', '计算机系统', '1版', '1', '', '19×26', '2016182367');
INSERT INTO `library_book` VALUES ('Prometheus监控技术与实践', '', 'http://api.jisuapi.com/isbn//upload/09/aca9c169fea047.jpg', '陈金窗，刘政委，张其栋，郑少斌 著', '本书系统化介绍云原生监控系统Prometheus的基本概念和使用方法。本书从基础内容讲起，由浅入深，分析了监控系统的主要功能和运维原则。主要内容包括三大部分，第壹部分“入门基础篇”介绍初识Prometheus云监控的基本点和主要方向，Prometheus架构及核心组件，监控指标与Labels，常用Exporter探测器等；第二部分“技术提高篇”介绍服务发现、告警处理、PromQL数据查询、可视化、Pushgateway等；第三部分“应用实践篇”介绍监控方向，如监控Docker与cAdvisor、Kubernetes、业务程序，编写Exporter探测器和日志监控指标，生产部署，云业务监控平台搭建等。', '机械工业出版社', '', '2020-04-01', '344', '99.00', '平装', '9787111649649', '7111649648', '暂缺', '', '', '', '16开', '');
INSERT INTO `library_book` VALUES ('IDA Pro权威指南', '图灵程序设计丛书', 'http://api.jisuapi.com/isbn/upload/d2/9f348af07b1b5a.jpg', ' (美) 伊格尔 (Eagle,C.) , 著', '本书是IDA Pro的权威指南，是迄今最全面的一本关于IDA Pro的著作，被业界评为“胜过官方参考手册的非官方参考手册”。本书一共分为6个部分，由浅入深，理论与实践相结合。从内容结构上来讲，本书可谓完备。', '人民邮电出版社', '北京', '2012-1', '0', '89.00', '平装', '9787115273680', '7115273685', '反汇编程序', '2版', '1', '', '24×19', '2012004334');
INSERT INTO `library_book` VALUES ('MongoDB权威指南', '图灵程序设计丛书', 'http://api.jisuapi.com/isbn/upload/25/698051a0fbdb77.jpg', ' (美) 霍多罗夫 (Chodorow,K.) , 著', 'MongoDB权威指南', '人民邮电出版社', '北京', '2014-1', '390', '79.00', '平装', '9787115341082', '7115341087', '关系数据库系统', '1版', '1', '中文', '24×18', '2013302154');
INSERT INTO `library_book` VALUES ('啊哈！算法', '图灵原创', 'http://api.jisuapi.com/isbn/upload/56/6e0b06c04535ee.jpg', '啊哈磊, 著', '这是一本充满趣味的通俗易懂的算法入门书籍。没有枯燥的描述，更没有难懂的公式，以实际应用为出发点，通过幽默的语言来讲解算法。在轻松愉悦之中感受算法之美，领悟算法之用。本书涉及算法和数据结构。数据结构方面的内容包括栈、队列、链表、树、并查集、堆和图等，算法方面的内容包括排序、枚举、搜索及剪枝、贪心、动态规划与记忆化搜索，图论中的最短路、最小生成树、割点与割边、二分图以及网络流等。', '人民邮电出版社', '北京', '2014-7', '246', '48.75', '平装', '9787115354594', '7115354596', '电子计算机－算法理论', '1版', '1', '中文', '24×19', '2014094155');
INSERT INTO `library_book` VALUES ('算法竞赛入门经典', '算法艺术与信息学竞赛', 'http://api.jisuapi.com/isbn/upload/ee/74e762fda70f27.jpg', '刘汝佳著', '本书是一本算法竞赛的入门教材，主要内容包括程序设计入门、循环结构程序设计、数组和字符串、函数和递归、基础题目选解、数据结构基础、暴力求解法、高效算法设计、动态规划初步、数学概念与方法、图论模型与算法等，基本覆盖了算法竞赛入门所需的主要知识点。本书可作为全国青少年信息学奥林匹克联赛（NOIP）的复赛教材及ACM国际大学生程序设计竞赛（ACM/ICPC）的入门参考，还可作为IT工程师与科研人员的参考用书。', '清华大学出版社', '北京', '2014-', '464', '36.00', '平装', '9787302356288', '7302356289', '计算机算法－教材', '2版', '1', '中文', '26×19', '2014046697');
INSERT INTO `library_book` VALUES ('Kali Linux渗透测试技术详解', '', 'http://api.jisuapi.com/isbn/upload/dc/b56989fcc2496f.jpg', '杨波著', '本书是国内第一本Kali Linux渗透测试教程。全书内容采用理论+操作的方式，对渗透测试的各个环节进行详细讲解。内容包括Kali Linux环境搭建、高级测试实验室、信息收集、漏洞扫描、漏洞利用、权限提升、密码攻击和无线网络密码破解等八个部分。通过本书学习，读者可以快速进入渗透测试领域，了解黑客攻击手段，快速掌握基本工作方式。', '清华大学出版社', '北京', '2015-', '1', '59.80', '平装', '9787302389644', '7302389640', 'Linux操作系统', '1版', '1', '中文', '26×19', '2015005625');
INSERT INTO `library_book` VALUES ('深入理解Linux内核', '', 'http://api.jisuapi.com/isbn/upload/e4/bd52a4a601284f.jpg', '(美) 博韦 (Bovet,D.P.) , (美) 西斯特 ', '本书是一本非常优秀的描述Linux内核的书，主要描述了Linux如何与其他著名的Unix系统竞争、内存寻址、进程、中断和异常、内核同步、定时测量、进程调度、内存管理、进程地址空间、系统调用、信号、虚拟文件系统、I/O体系结构和设备驱动程序、块设备驱动程序、页高速缓存、访问文件、回收页框、Ext2和Ext3文件系统、进程通信、程序的执行等内容，通过对上述内容详细透彻地描述，为广大读者揭开了Linux内核的神秘面纱。本书写的系统、透彻，非常适合广大本专科院校学生学习，也是Linux内核开发人员不可缺少的工具书。', '中国电力出版社', '北京', '2007-05', '896', '98.00', '平装', '9787508353944', '7508353943', 'Linux操作系统', '1版', '1', '', '26', '2007031334');
INSERT INTO `library_book` VALUES ('Java网络编程', '', 'http://api.jisuapi.com/isbn/upload/59/867373eff5f2b7.jpg', ' (美) 哈诺德 (Harold,E.R.) , 著', '这本实用指南全面介绍了如何使用Java开发网络程序。你将学习如何使用Java的网络类库既快速又轻松地完成常见的网络编程任务，如编写多线程服务器、加密通信、广播到本地网络，以及向服务器端程序提交数据。作者提供了真正可实用的程序来讲解他介绍的方法和类。第4版经过全面修订，已经涵盖REST、SPDY、异步I/O和很多其他高级技术。本书主要内容有：研究Internet底层协议，如TCP/IP和UDP/IP；了解Java的核心I/O API如何处理网络输入和输出；发现InetAddress类如何帮助Java程序与DNS交互；用Java的URI和URL类定位、识别和下载网络资源；深入研究HTTP协议，包括REST、HTTP首部和cookie；使用Java的底层Socket类编写服务器和网络客户端；利用非阻塞I/O同时管理多个连接。', '中国电力出版社', '北京', '2014-9', '448', '78.00', '平装', '9787512361881', '7512361882', 'JAVA语言－程序设计', '1版', '1', '', '24×18', '2014151539');
INSERT INTO `library_book` VALUES ('数学历年真题全精解析', NULL, 'http://api.jisuapi.com/isbn/upload/c3/2544914dd860de.jpg', '李永乐, 王式安, 武忠祥, 主编', '本书将历年数学研究生入学考试试卷的题目进行系统分析，按所属内容、难度进行归纳，总结各种题型的解题方法。这些解法均来自各位专家多年教学实践总结和长期命题阅卷经验。针对以往考生在解题过程中普遍存在的问题及常犯的错误，给出相应的注意事项，对每一道真题都给出解题思路的分析，以便考生真正的理解和掌握解题方法。使考生能举一反三，触类旁通。为了使考生更好地巩固所学知识，提高实际解题能力，本书作者精心选取历年真题其他卷别的试题作为练习题，供考生练习。', '西安交通大学出版社', '西安', '2018-4', NULL, '89.80', '平装', '9787569305944', '7569305949', '高等数学－研究生－入学考试－题解', '1版', '1', NULL, '19×13', '2018087643');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_code` int(0) NOT NULL COMMENT '用户账号',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名称',
  `user_password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户密码',
  `user_level` int(0) NOT NULL,
  `user_over` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_code`) USING BTREE,
  INDEX `user_code`(`user_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (12, 'mikon', 'zxczxc', 0, 0);
INSERT INTO `user` VALUES (123, 'zhakul', 'zxczxc', 0, 0);
INSERT INTO `user` VALUES (234, 'mikon', 'zxczxc', 1, 0);
INSERT INTO `user` VALUES (2333, 'root', 'root', 2, 0);
INSERT INTO `user` VALUES (4455, '诸葛', 'zxczxc', 0, 0);
INSERT INTO `user` VALUES (4567, '张宝', 'zxczxc', 0, 0);
INSERT INTO `user` VALUES (4614, 'mikon', 'zxczxc', 0, 0);
INSERT INTO `user` VALUES (10001, '小韩', '123', 1, 0);
INSERT INTO `user` VALUES (12311, '诸葛瑾', 'zxczxc', 1, 0);
INSERT INTO `user` VALUES (20002, '小雪', '123', 0, 0);
INSERT INTO `user` VALUES (30003, '小石', '123', 0, 0);
INSERT INTO `user` VALUES (34724, 'mikon', '222', 0, 0);
INSERT INTO `user` VALUES (40004, '小陈', '123', 0, 0);
INSERT INTO `user` VALUES (125125, '马超', 'zxczxc', 0, 0);
INSERT INTO `user` VALUES (246241, 'mikon', 'rrr', 0, 0);
INSERT INTO `user` VALUES (452357, 'mikon', 'ino', 1, 0);

-- ----------------------------
-- Table structure for user_borrow
-- ----------------------------
DROP TABLE IF EXISTS `user_borrow`;
CREATE TABLE `user_borrow`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `usercode` int(0) NOT NULL,
  `isbn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `start_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `returntime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_borrow
-- ----------------------------
INSERT INTO `user_borrow` VALUES (28, 123, '9787115273680', '2021-05-01', '2021-06-31', '未逾期');
INSERT INTO `user_borrow` VALUES (32, 12, '9787111649649', '2021-05-02', '2021-07-01', '未逾期');
INSERT INTO `user_borrow` VALUES (33, 123, '9787512361881', '2021-05-13', '2021-07-12', '未逾期');
INSERT INTO `user_borrow` VALUES (38, 123, '9787111649649', '2021-05-14', '2021-07-13', '未逾期');

-- ----------------------------
-- Table structure for user_in
-- ----------------------------
DROP TABLE IF EXISTS `user_in`;
CREATE TABLE `user_in`  (
  `user_code` int(0) NOT NULL COMMENT '用户学号',
  `in_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`user_code`) USING BTREE,
  CONSTRAINT `user_in_ibfk_1` FOREIGN KEY (`user_code`) REFERENCES `user` (`user_code`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_in
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
