/*
Navicat MySQL Data Transfer

Source Server         : MySQL-127.0.0.1
Source Server Version : 50717
Source Host           : 127.0.0.1:3306
Source Database       : horizon

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-05-23 22:31:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `adminId` char(32) NOT NULL,
  `adminname` varchar(50) DEFAULT NULL,
  `adminpwd` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`adminId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('a1', 'a1', '123');
INSERT INTO `admin` VALUES ('a2', 'a2', '123');
INSERT INTO `admin` VALUES ('a3', 'a3', '123');

-- ----------------------------
-- Table structure for cartitem
-- ----------------------------
DROP TABLE IF EXISTS `cartitem`;
CREATE TABLE `cartitem` (
  `cartItemId` char(32) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `bid` char(32) DEFAULT NULL,
  `uid` char(32) DEFAULT NULL,
  `orderBy` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`cartItemId`),
  KEY `orderBy` (`orderBy`),
  KEY `FK_cartitem_user` (`uid`),
  KEY `FK_cartitem_book` (`bid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cartitem
-- ----------------------------

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `cid` char(40) NOT NULL,
  `cname` varchar(50) DEFAULT NULL,
  `pid` char(40) DEFAULT NULL,
  `desc` varchar(100) DEFAULT NULL,
  `orderBy` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`cid`),
  KEY `orderBy` (`orderBy`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('0ec7c87a-93b4-4274-8e55-3c0b77a5c845', '一级一级', 'f3dc4a21-c96d-4cc0-bdb3-e1b4beeb0251', '6', '33');
INSERT INTO `category` VALUES ('1', '程序设计', null, '程序设计分类', '1');
INSERT INTO `category` VALUES ('3', 'JSP', '1', 'JSP分类', '10');
INSERT INTO `category` VALUES ('5869c1b0-064d-4dd9-8946-025dc2b79519', '6', 'f3dc4a21-c96d-4cc0-bdb3-e1b4beeb0251', '6', '35');
INSERT INTO `category` VALUES ('66b4fd1d-af7a-426e-af1d-7a9678f1f0b9', 'aa', null, 'aa', '27');
INSERT INTO `category` VALUES ('af2ff657-8a65-4467-8674-7b9380baac02', '1212213', '66b4fd1d-af7a-426e-af1d-7a9678f1f0b9', '12123', '23');
INSERT INTO `category` VALUES ('b09908da-8e44-4efd-836f-371bb4bb0afe', '12', '66b4fd1d-af7a-426e-af1d-7a9678f1f0b9', '12', '28');
INSERT INTO `category` VALUES ('f3dc4a21-c96d-4cc0-bdb3-e1b4beeb0251', '一级', null, '一级', '29');

-- ----------------------------
-- Table structure for issue
-- ----------------------------
DROP TABLE IF EXISTS `issue`;
CREATE TABLE `issue` (
  `loginname` varchar(50) NOT NULL,
  `email` varchar(40) NOT NULL,
  `issue_title` varchar(100) NOT NULL,
  `issue_con` varchar(600) DEFAULT NULL,
  `datetime` varchar(20) NOT NULL,
  PRIMARY KEY (`loginname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of issue
-- ----------------------------
INSERT INTO `issue` VALUES ('a1a', 'aaaaaaa', '中文', '中文中中文中文1', '2001-01-01');
INSERT INTO `issue` VALUES ('a1qghqa', 'aaaaaaa', '中文', '中文中中文中文1', '2001-01-01');
INSERT INTO `issue` VALUES ('a1qhj1qqa', 'aaaaaaa', '中文', '中文中中文中文1', '2001-01-01');
INSERT INTO `issue` VALUES ('a1qqdfa', 'aaaaaaa', '中文', '中文中中文中文1', '2001-01-01');
INSERT INTO `issue` VALUES ('a1qqjka', 'aaaaaaa', '中文', '中文中中文中文1', '2001-01-01');
INSERT INTO `issue` VALUES ('aa3', 'aaaaaaa', '中文', '中文1中中文中文1', '2001-01-01');
INSERT INTO `issue` VALUES ('aah', 'aaaaaaa', '中文', '中文中中文中文1', '2001-01-01');
INSERT INTO `issue` VALUES ('afhqa', 'aaaaaaa', '中文', '中文中中文中文1', '2001-01-01');
INSERT INTO `issue` VALUES ('ai8qa', 'aaaaaaa', '中文', '中文中中文中文1', '2001-01-01');
INSERT INTO `issue` VALUES ('ai8yuqa', 'aaaaaaa', '中文', '中文中中文中文1', '2001-01-01');
INSERT INTO `issue` VALUES ('ao9qa', 'aaaaaaa', '中文', '中文中中文中文1', '2001-01-01');
INSERT INTO `issue` VALUES ('ao9uiqa', 'aaaaaaa', '中文', '中文中中文中文1中文中中文中文1中文中中文中文1中文中中文中文1中文中中文中文1中文中中文中文1中文中中文中文1中文中中文中文1中文中中文中文1', '2001-01-01');
INSERT INTO `issue` VALUES ('aq1a', 'aaaaaaa', '中文', '中文中中文中文1中文中中文中文1中文中中文中文1中文中中文中文1中文中中文中文1中文中中文中文1中文中中文中文1', '2001-01-01');
INSERT INTO `issue` VALUES ('aq1asqa', 'aaaaaaa', '中文', '中文中中文中文1中文中中文中文1中文中中文中文1中文中中文中文1中文中中文中文1中文中中文中文1中文中中文中文1', '2001-01-01');
INSERT INTO `issue` VALUES ('aq1lqa', 'aaaaaaa', '中文', '中文中中文中文1中文中中文中文1中文中中文中文1中文中中文中文1中文中中文中文1', '2001-01-01');
INSERT INTO `issue` VALUES ('aq1qa', 'aaaaaaa', '中文', '中文中中文中文1中文中中文中文1中文中中文中文1中文中中文中文1', '2001-01-01');
INSERT INTO `issue` VALUES ('aq2a', 'aaaaaaa', '中文', '中文中中文中文', '2001-01-01');
INSERT INTO `issue` VALUES ('aq3a', 'aaaaaaa', '中文', '中文中中文中文', '2001-01-01');
INSERT INTO `issue` VALUES ('aq4a', 'aaaaaaa', '中文', '中文中中文中文', '2001-01-01');
INSERT INTO `issue` VALUES ('aq5a', 'aaaaaaa', '中文', '中文中中文中文', '2001-01-01');
INSERT INTO `issue` VALUES ('aq6a', 'aaaaaaa', '中文', '中文中中文中文', '2001-01-01');
INSERT INTO `issue` VALUES ('aq7a', 'aaaaaaa', '中文', '中文中中文中文', '2001-01-01');
INSERT INTO `issue` VALUES ('aq9a', 'aaaaaaa', '中文', '中文中中文中文', '2001-01-01');
INSERT INTO `issue` VALUES ('aqa', 'aaaaaaa', '中文', '中文中中文中文', '2001-01-01');
INSERT INTO `issue` VALUES ('aqa8', 'aaaaaaa', '中文', '中文中中文中文', '2001-01-01');
INSERT INTO `issue` VALUES ('aqakl1q', 'aaaaaaa', '中文', '中文中中文中文', '2001-01-01');
INSERT INTO `issue` VALUES ('aqdfdfq2a', 'aaaaaaa', '中文', '中文中中文中文', '2001-01-01');
INSERT INTO `issue` VALUES ('aqdqfdfq2a', 'aaaaaaa', '中文', '中文中中文中文', '2001-01-01');
INSERT INTO `issue` VALUES ('aqert5a', 'aaaaaaa', '中文', '中文中中文中文', '2001-01-01');
INSERT INTO `issue` VALUES ('aqfg1qa', 'aaaaaaa', '中文', '中文中中文中文', '2001-01-01');
INSERT INTO `issue` VALUES ('aqop1qa', 'aaaaaaa', '中文', '中文中中文中文', '2001-01-01');
INSERT INTO `issue` VALUES ('aqp0a', 'aaaaaaa', '中文', '中文中中文中文', '2001-01-01');
INSERT INTO `issue` VALUES ('aqpio0a', 'aaaaaaa', '中文', '中文中中文中文', '2001-01-01');
INSERT INTO `issue` VALUES ('aqp[1qa', 'aaaaaaa', '中文', '中文中中文中文', '2001-01-01');
INSERT INTO `issue` VALUES ('aqq2a', 'aaaaaaa', '中文', '中文中中文中文', '2001-01-01');
INSERT INTO `issue` VALUES ('aqqww3a', 'aaaaaaa', '中文', '中文中中文中文', '2001-01-01');
INSERT INTO `issue` VALUES ('aqr4a', 'aaaaaaa', '中文', '中文中中文中文', '2001-01-01');
INSERT INTO `issue` VALUES ('aqsd1qa', 'aaaaaaa', '中文', '中文中中文中文', '2001-01-01');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `oid` char(32) NOT NULL,
  `ordertime` char(19) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `address` varchar(1000) DEFAULT NULL,
  `uid` char(32) DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `FK_order_user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('a', '2017-02-05 17:47:13', '123.20', '2', 'test 淘淘', 'aaa');
INSERT INTO `order` VALUES ('b', '2017-03-05 18:18:53', '319.40', '2', 'test2', 'aa');
INSERT INTO `order` VALUES ('c', '2017-05-06 09:29:15', '47.40', '5', '', 'aa');
INSERT INTO `order` VALUES ('e', '2017-05-07 14:08:06', '54.50', '3', 'test', 'aaa');
INSERT INTO `order` VALUES ('f', '2017-05-05 18:19:58', '66.10', '4', '', 'aaa');
INSERT INTO `order` VALUES ('g', '2017-05-06 14:08:06', '54.50', '1', 'test', 'aaa');
INSERT INTO `order` VALUES ('h', '2017-05-13 14:08:06', '54.50', '3', 'test', 'aaa');

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `orderItemId` char(32) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `subtotal` decimal(8,2) DEFAULT NULL,
  `bid` char(32) DEFAULT NULL,
  `bname` varchar(200) DEFAULT NULL,
  `currPrice` decimal(8,2) DEFAULT NULL,
  `image_b` varchar(100) DEFAULT NULL,
  `oid` char(32) DEFAULT NULL,
  PRIMARY KEY (`orderItemId`),
  KEY `FK_orderitem_order` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES ('2A947313F06A49C68E2A87F74B31A31A', '1', '47.40', 'FFABBED1E5254BC0B2726EC4ED8ACCDA', '深入理解OSGi：Equinox原理、应用与最佳实践（《深入理解Java虚拟机》作者新作！全面解读最新OSGi R5.0规范，深入讲解OSGi原理和服务，以及Equinox框架的用法和原理）', '47.40', 'producimg/23179003-1_b.jpg', '805143D3AE99434C91EE7C365A96D5E4');
INSERT INTO `orderitem` VALUES ('80572102035644E7B59C5B675E834518', '1', '54.50', 'FFABBED1E5254BC0B2726EC4ED8ACCDA', '深入理解OSGi：Equinox原理、应用与最佳实践（《深入理解Java虚拟机》作者新作！全面解读最新OSGi R5.0规范，深入讲解OSGi原理和服务，以及Equinox框架的用法和原理）', '54.50', 'producimg/23179003-1_b.jpg', 'C73BB10850394310BF9BEC5F9443051B');
INSERT INTO `orderitem` VALUES ('ACB99B290AB9437EB05B0758BE00FD07', '1', '68.70', 'F693239BC3B3444C8538ABE7411BB38E', 'Java Web典型模块与项目实战大全（配光盘）', '68.70', 'producimg/20988080-1_b.jpg', '1EE9C48AA3464119A4CFAB9FD529CAD6');
INSERT INTO `orderitem` VALUES ('C85F585A6F7A485CB004033C0CC6ECDC', '1', '54.50', 'F6162799E913423EA5CB57BEC65AB1E9', 'JUnit实战(第2版)', '54.50', 'producimg/22633574-1_b.jpg', '4E6E4712ECF6481E9F93D1CDA165E29D');
INSERT INTO `orderitem` VALUES ('E8862C4998F24A469511FD854A1EF633', '3', '264.90', 'FEC3740CF30E442A94021911A25EF0D7', 'Spring攻略(第2版)(Spring攻略(第2版))', '88.30', 'producimg/22623020-1_b.jpg', '4E6E4712ECF6481E9F93D1CDA165E29D');
INSERT INTO `orderitem` VALUES ('F6D0C603521344E486C4B5C42191C4B8', '1', '54.50', 'FFABBED1E5254BC0B2726EC4ED8ACCDA', '深入理解OSGi：Equinox原理、应用与最佳实践（《深入理解Java虚拟机》作者新作！全面解读最新OSGi R5.0规范，深入讲解OSGi原理和服务，以及Equinox框架的用法和原理）', '54.50', 'producimg/23179003-1_b.jpg', '1EE9C48AA3464119A4CFAB9FD529CAD6');
INSERT INTO `orderitem` VALUES ('F7AD9C4363784DF8842EFEAD2B0C48DE', '1', '54.50', 'FFABBED1E5254BC0B2726EC4ED8ACCDA', '深入理解OSGi：Equinox原理、应用与最佳实践（《深入理解Java虚拟机》作者新作！全面解读最新OSGi R5.0规范，深入讲解OSGi原理和服务，以及Equinox框架的用法和原理）', '54.50', 'producimg/23179003-1_b.jpg', 'A8C4D5597A9A48B3A3D73734F31CDF41');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `productid` char(40) NOT NULL,
  `shopid` char(40) NOT NULL,
  `productName` varchar(200) DEFAULT NULL,
  `image_b` varchar(100) DEFAULT NULL,
  `image_w` varchar(100) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `currPrice` float DEFAULT NULL,
  `brand` varchar(100) DEFAULT NULL,
  `productNum` int(11) DEFAULT NULL,
  `salesNum` int(11) DEFAULT NULL,
  `proDate` varchar(15) DEFAULT NULL,
  `purDate` varchar(15) DEFAULT NULL,
  `cid` char(40) DEFAULT NULL,
  `productDesc` varchar(600) DEFAULT NULL,
  `orderBy` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`productid`),
  KEY `orderBy` (`orderBy`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('9ca72d3d-b14f-4091-b9fa-e1f562149226', '123123213', '1111王企鹅企鹅轻武器维权维', '/Horizon/Back_Shop/ma_product/product_img/96f33dc2-1fbd-4f70-862c-10e4b4b36801_1-b.jpg', '/Horizon/Back_Shop/ma_product/product_img/02a9ea76-e470-4895-bbac-98ae2ad48f7e_1-w.jpg', '8.1', '7.1', '12', '12', '0', '2017-05-05', '2017-05-19', '5869c1b0-064d-4dd9-8946-025dc2b79519', '1王企鹅企鹅轻武器维权维', '87');
INSERT INTO `product` VALUES ('F6162799E913423EA5CB57BEC65AB1E9', '', '商品商品qwe商品商品商品', '/Horizon/Back_Shop/ma_product/product_img/1-b.jpg', '/Horizon/Back_Shop/ma_product/product_img/1-w.jpg', '10', '8', '品牌', '20', '8', null, null, '3', 'aa', '80');
INSERT INTO `product` VALUES ('F78C94641DB4475BBA1E72A07DF9B3AE', '123123213', '商品商品qwe商品商品商品', '/Horizon/Back_Shop/ma_product/product_img/1-b.jpg', '/Horizon/Back_Shop/ma_product/product_img/1-w.jpg', '10', '8', '品牌', '20', '8', null, null, '3', 'aa', '69');
INSERT INTO `product` VALUES ('FC232CD9B6E6411BBBB1A5B781D2C3C9', '123123213', '商品商品qwe商品商品商品', '/Horizon/Back_Shop/ma_product/product_img/1-b.jpg', '/Horizon/Back_Shop/ma_product/product_img/1-w.jpg', '10', '8', '品牌', '20', '8', null, null, '3', 'aa', '67');
INSERT INTO `product` VALUES ('FEC3740CF30E442A94021911A25EF0D7', '123123213', '商品商品qwe商品商品商品', '/Horizon/Back_Shop/ma_product/product_img/1-b.jpg', '/Horizon/Back_Shop/ma_product/product_img/1-w.jpg', '10', '8', '品牌', '20', '8', null, null, '3', 'aa', '82');
INSERT INTO `product` VALUES ('FF1BBED1E5254BffB2726EC4ED8AC1DA', '123123213', '商品商品qwe商品商品商品', '/Horizon/Back_Shop/ma_product/product_img/1-b.jpg', '/Horizon/Back_Shop/ma_product/product_img/1-w.jpg', '10', '8', '品牌', '20', '8', null, null, '3', 'aa', '47');
INSERT INTO `product` VALUES ('FFAB2ED1E5254BffB2726EC4ED8AC1DA', '123123213', '商品商品qwe商品商品商品', '/Horizon/Back_Shop/ma_product/product_img/1-b.jpg', '/Horizon/Back_Shop/ma_product/product_img/1-w.jpg', '10', '8', '品牌', '20', '8', null, null, '3', 'aa', '47');
INSERT INTO `product` VALUES ('FFABBED1E5154B10B2726EC4ED8AC1DA', '123123213', '商品商品qwe商品商品商品', '/Horizon/Back_Shop/ma_product/product_img/1-b.jpg', '/Horizon/Back_Shop/ma_product/product_img/1-w.jpg', '10', '8', '品牌', '20', '8', null, null, '3', 'aa', '47');
INSERT INTO `product` VALUES ('FFABBED1E5252B10B2726EC4ED8AC1DA', '123123213', '商品商品qwe商品商品商品', '/Horizon/Back_Shop/ma_product/product_img/1-b.jpg', '/Horizon/Back_Shop/ma_product/product_img/1-w.jpg', '10', '8', '品牌', '20', '8', null, null, '3', 'aa', '47');
INSERT INTO `product` VALUES ('FFABBED1E5254B10B2726e44ED8AC1DA', '123123213', '商品商品qwe商品商品商品', '/Horizon/Back_Shop/ma_product/product_img/1-b.jpg', '/Horizon/Back_Shop/ma_product/product_img/1-w.jpg', '10', '8', '品牌', '20', '8', null, null, '3', 'aa', '47');
INSERT INTO `product` VALUES ('FFABBED1E5254B10B2726EC4ED8AC1DA', '123123213', '商品商品qwe商品商品商品', '/Horizon/Back_Shop/ma_product/product_img/1-b.jpg', '/Horizon/Back_Shop/ma_product/product_img/1-w.jpg', '10', '8', '品牌', '20', '8', null, null, '3', 'aa', '47');
INSERT INTO `product` VALUES ('FFABBED1E5254B10B2726ECgED8AC1DA', '123123213', '商品商品qwe商品商品商品', '/Horizon/Back_Shop/ma_product/product_img/1-b.jpg', '/Horizon/Back_Shop/ma_product/product_img/1-w.jpg', '10', '8', '品牌', '20', '8', null, null, '3', 'aa', '47');
INSERT INTO `product` VALUES ('FFABBED1E5254B10B2726ECrED8AC1DA', '123123213', '商品商品qwe商品商品商品', '/Horizon/Back_Shop/ma_product/product_img/1-b.jpg', '/Horizon/Back_Shop/ma_product/product_img/1-w.jpg', '10', '8', '品牌', '20', '8', null, null, '3', 'aa', '47');
INSERT INTO `product` VALUES ('FFABBED1E5254B10B2726EvfED8AC1DA', '123123213', '商品商品qwe商品商品商品', '/Horizon/Back_Shop/ma_product/product_img/1-b.jpg', '/Horizon/Back_Shop/ma_product/product_img/1-w.jpg', '10', '8', '品牌', '20', '8', null, null, '3', 'aa', '47');
INSERT INTO `product` VALUES ('FFABBED1E5254B10B2726tC4ED8AC1DA', '123123213', '商品商品qwe商品商品商品', '/Horizon/Back_Shop/ma_product/product_img/1-b.jpg', '/Horizon/Back_Shop/ma_product/product_img/1-w.jpg', '10', '8', '品牌', '20', '8', null, null, '3', 'aa', '47');
INSERT INTO `product` VALUES ('FFABBED1E5254B10B272hEw4ED8AC1DA', '123123213', '商品商品qwe商品商品商品', '/Horizon/Back_Shop/ma_product/product_img/1-b.jpg', '/Horizon/Back_Shop/ma_product/product_img/1-w.jpg', '10', '8', '品牌', '20', '8', null, null, '3', 'aa', '47');
INSERT INTO `product` VALUES ('FFABBED1E5254B10B272weC4ED8AC1DA', '123123213', '商品商品qwe商品商品商品', '/Horizon/Back_Shop/ma_product/product_img/1-b.jpg', '/Horizon/Back_Shop/ma_product/product_img/1-w.jpg', '10', '8', '品牌', '20', '8', null, null, '5F79D0D246AD4216AC04E9C5FAB3199E', 'aa', '47');
INSERT INTO `product` VALUES ('FFABBED1E5254B10B2g26EC4ED8AC1DA', '123123213', '商品商品qwe商品商品商品', '/Horizon/Back_Shop/ma_product/product_img/1-b.jpg', '/Horizon/Back_Shop/ma_product/product_img/1-w.jpg', '10', '8', '品牌', '20', '8', null, null, '5F79D0D246AD4216AC04E9C5FAB3199E', 'aa', '47');
INSERT INTO `product` VALUES ('FFABBED1E5254B10B3726EC4ED8AC1DA', '123123213', '商品商品qwe商品商品商品', '/Horizon/Back_Shop/ma_product/product_img/1-b.jpg', '/Horizon/Back_Shop/ma_product/product_img/1-w.jpg', '10', '8', '品牌', '20', '8', null, null, '5F79D0D246AD4216AC04E9C5FAB3199E', 'aa', '47');
INSERT INTO `product` VALUES ('FFABBED1E5254B10Bss26EC4ED8AC1DA', '123123213', '商品商品qwe商品商品商品', '/Horizon/Back_Shop/ma_product/product_img/1-b.jpg', '/Horizon/Back_Shop/ma_product/product_img/1-w.jpg', '10', '8', '品牌', '20', '8', null, null, '5F79D0D246AD4216AC04E9C5FAB3199E', 'aa', '47');
INSERT INTO `product` VALUES ('FFABBED1E5254BC0B2726EC4ED8AC1DA', '123123213', '商品商品qwe商品商品商品', '/Horizon/Back_Shop/ma_product/product_img/1-b.jpg', '/Horizon/Back_Shop/ma_product/product_img/1-w.jpg', '10', '8', '品牌', '20', '8', null, null, '5F79D0D246AD4216AC04E9C5FAB3199E', 'aa', '47');
INSERT INTO `product` VALUES ('FFABBED1E5254BffB2726EC4ED8AC1DA', '123123213', '商品商品qwe商品商品商品', '/Horizon/Back_Shop/ma_product/product_img/1-b.jpg', '/Horizon/Back_Shop/ma_product/product_img/1-w.jpg', '10', '8', '品牌', '20', '8', null, null, '5F79D0D246AD4216AC04E9C5FAB3199E', 'aa', '47');
INSERT INTO `product` VALUES ('FFABBED1E525vBffB2726EC4ED8AC1DA', '123123213', '商品商品qwe商品商品商品', '/Horizon/Back_Shop/ma_product/product_img/1-b.jpg', '/Horizon/Back_Shop/ma_product/product_img/1-w.jpg', '10', '8', '品牌', '20', '8', null, null, '5F79D0D246AD4216AC04E9C5FAB3199E', 'aa', '47');
INSERT INTO `product` VALUES ('FFABBED1E52a4BffB2726EC4ED8AC1DA', '123123213', '商品商品qwe商品商品商品', '/Horizon/Back_Shop/ma_product/product_img/1-b.jpg', '/Horizon/Back_Shop/ma_product/product_img/1-w.jpg', '10', '8', '品牌', '20', '8', null, null, '5F79D0D246AD4216AC04E9C5FAB3199E', 'aa', '47');
INSERT INTO `product` VALUES ('FFABBED1E52dfBffB2726EC4ED8AC1DA', '123123213', '商品商品qwe商品商品商品', '/Horizon/Back_Shop/ma_product/product_img/1-b.jpg', '/Horizon/Back_Shop/ma_product/product_img/1-w.jpg', '10', '8', '品牌', '20', '8', null, null, '5F79D0D246AD4216AC04E9C5FAB3199E', 'aa', '47');
INSERT INTO `product` VALUES ('FFABBED1E52f4BffB2726EC4ED8AC1DA', '123123213', '商品商品qwe商品商品商品', '/Horizon/Back_Shop/ma_product/product_img/1-b.jpg', '/Horizon/Back_Shop/ma_product/product_img/1-w.jpg', '10', '8', '品牌', '20', '8', null, null, '5F79D0D246AD4216AC04E9C5FAB3199E', 'aa', '47');
INSERT INTO `product` VALUES ('FFABBED1Ee254BffB2726EC4ED8AC1DA', '123123213', '商品商品qwe商品商品商品', '/Horizon/Back_Shop/ma_product/product_img/1-b.jpg', '/Horizon/Back_Shop/ma_product/product_img/1-w.jpg', '10', '8', '品牌', '20', '8', null, null, '5F79D0D246AD4216AC04E9C5FAB3199E', 'aa', '47');
INSERT INTO `product` VALUES ('FFABBED1z5254BffB2726EC4ED8AC1DA', '123123213', '商品商品qwe商品商品商品', '/Horizon/Back_Shop/ma_product/product_img/1-b.jpg', '/Horizon/Back_Shop/ma_product/product_img/1-w.jpg', '10', '8', '品牌', '20', '8', null, null, '5F79D0D246AD4216AC04E9C5FAB3199E', 'aa', '47');
INSERT INTO `product` VALUES ('FFABBEddE5254BffB2726EC4ED8AC1DA', '123123213', '商品商品qwe商品商品商品', '/Horizon/Back_Shop/ma_product/product_img/1-b.jpg', '/Horizon/Back_Shop/ma_product/product_img/1-w.jpg', '10', '8', '品牌', '20', '8', null, null, '5F79D0D246AD4216AC04E9C5FAB3199E', 'aa', '47');
INSERT INTO `product` VALUES ('FFABBEDwE5254BffB2726EC4ED8AC1DA', '123123213', '商品商品qwe商品商品商品', '/Horizon/Back_Shop/ma_product/product_img/1-b.jpg', '/Horizon/Back_Shop/ma_product/product_img/1-w.jpg', '10', '8', '品牌', '20', '8', null, null, '5F79D0D246AD4216AC04E9C5FAB3199E', 'aa', '47');
INSERT INTO `product` VALUES ('FFABBqD1E5254BffB2726EC4ED8AC1DA', '123123213', '商品商品qwe商品商品商品', '/Horizon/Back_Shop/ma_product/product_img/1-b.jpg', '/Horizon/Back_Shop/ma_product/product_img/1-w.jpg', '10', '8', '品牌', '20', '8', null, null, '5F79D0D246AD4216AC04E9C5FAB3199E', 'aa', '47');

-- ----------------------------
-- Table structure for shop
-- ----------------------------
DROP TABLE IF EXISTS `shop`;
CREATE TABLE `shop` (
  `shopid` varchar(40) NOT NULL,
  `sellerid` varchar(40) NOT NULL,
  `shopName` varchar(100) DEFAULT NULL,
  `shopCid` varchar(40) DEFAULT NULL,
  `descr` varchar(400) DEFAULT NULL,
  `pro_src` varchar(2) DEFAULT NULL,
  `phy_store` tinyint(1) DEFAULT NULL,
  `fac_rep` tinyint(1) DEFAULT NULL,
  `sellerName` varchar(20) DEFAULT NULL,
  `telNumber` varchar(20) DEFAULT NULL,
  `address` varchar(300) DEFAULT NULL,
  `postcode` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`shopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop
-- ----------------------------
INSERT INTO `shop` VALUES ('1', 'qwe', null, null, null, null, '0', '0', null, null, null, null);
INSERT INTO `shop` VALUES ('123123213', '123', '123描述文件店铺店铺', '\"null\"', '描述文件描述文件描述文件描述文件描述文件描述111描述文件描述文件描述文件描述文件描述文件描述文件', '3', '1', '1', '描述文件1', '12334535435345', '123描述文件描述文件描述文件', '123567');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` char(32) NOT NULL,
  `loginname` varchar(50) NOT NULL,
  `loginpass` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `loginname` (`loginname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1FF8D9A984E04BB59CD7F04DA7EF189B', 'qwe2rt12312312312', '123213', 'zhangFei@163.com', '123123123123123123', '地址地址通讯地址地址地址通讯地址地址地址');
INSERT INTO `user` VALUES ('2FF8D9A984E04BB59CD7F04DA7EF189B', 'qwe3rt', '123', 'zhangFei@163.com', '123123123123123123', '地址地址通讯地址地址地址通讯地址地址地址');
INSERT INTO `user` VALUES ('aa', 'qwertr', '123', 'zhangFei@163.com', '123123123123123123', '地址地址通讯地址地址地址通讯地址地址地址');
INSERT INTO `user` VALUES ('aaa', 'qwe5rt', '123', 'zhangFei@163.com', '123123123123123123', '地址地址通讯地址地址地址通讯地址地址地址');
INSERT INTO `user` VALUES ('EFF8D7A984E04BB59CD7F04DA7EF189B', 'qwer8t', '123', 'zhangFei@163.com', '123123123123123123', '地址地址通讯地址地址地址通讯地址地址地址');
INSERT INTO `user` VALUES ('EFF8D9A980E04BB59CD7F04DA7EF189B', 'qwetrt', '123', 'zhangFei@163.com', '123123123123123123', '地址地址通讯地址地址地址通讯地址地址地址');
INSERT INTO `user` VALUES ('EFF8D9A984E04BB59121204DA7EF189B', 'qwer1t', '123', 'zhangFei@163.com', '123123123123123123', '地址地址通讯地址地址地址通讯地址地址地址');
INSERT INTO `user` VALUES ('EFF8D9A984E04BB59CD7er4DA7EF189B', 'qwesdsrt', '123', 'zhangFei@163.com', '123123123123123123', '地址地址通讯地址地址地址通讯地址地址地址');
INSERT INTO `user` VALUES ('EFF8D9A984E04BB59CD7F04DA7EF189B', 'qwert', '123', 'zhangFei@163.com', '123123123123123123', '地址地址通讯地址地址地址通讯地址地址地址');
INSERT INTO `user` VALUES ('EFF8D9A984E04BB59CD7F04qqA7EF89B', 'qwccert', '123', 'zhangFei@163.com', '123123123123123123', '地址地址通讯地址地址地址通讯地址地址地址');
INSERT INTO `user` VALUES ('EFF8D9A984E04BB59CD7F04sd7EF189B', 'qwzert', '123', 'zhangFei@163.com', '123123123123123123', '地址地址通讯地址地址地址通讯地址地址地址');
INSERT INTO `user` VALUES ('EFF8D9A984E04BB59CD7F0aaA7EF189B', 'qwzcert', '123', 'zhangFei@163.com', '123123123123123123', '地址地址通讯地址地址地址通讯地址地址地址');
INSERT INTO `user` VALUES ('EFF8D9A984E04BB59CD7FdfdA7EF189B', 'qwedzcrt', '123', 'zhangFei@163.com', '123123123123123123', '地址地址通讯地址地址地址通讯地址地址地址');
INSERT INTO `user` VALUES ('EFF8D9A984E04BB59CD7Fklkl7EF189B', 'qwevvrt', '123', 'yuyu@163.com', '667676767', '地址地址通讯地址地址地址通讯地址地址地址');
INSERT INTO `user` VALUES ('EFF8D9A984E04BB59CD7sdfaA7EF189B', 'qwerzt', '123', 'zhangFei@163.com', '123123123123123123', '地址地址通讯地址地址地址通讯地址地址地址');
INSERT INTO `user` VALUES ('EFF8D9A984E04BB59CDasw4DA7EF189B', 'qwxcert', '123', 'zhangFei@163.com', '123123123123123123', '地址地址通讯地址地址地址通讯地址地址地址');
INSERT INTO `user` VALUES ('EFF8D9A984E04BB59CDbdf4DA7EF189B', 'qwecsrt', '123', 'zhangFei@163.com', '123123123123123123', '地址地址通讯地址地址地址通讯地址地址地址');
INSERT INTO `user` VALUES ('EFF8D9A984E04BB59df7F04DA7EF189B', 'qwsdcert', '123', 'zhangFei@163.com', '123123123123123123', '地址地址通讯地址地址地址通讯地址地址地址');
INSERT INTO `user` VALUES ('EFF8D9A984E04BB59hj7F04DA7EFdf9B', 'qzzwert', '123', 'zhangFei@163.com', '123123123123123123', '地址地址通讯地址地址地址通讯地址地址地址');
INSERT INTO `user` VALUES ('EFF8D9A984E04BB5www7F04DA7EF189B', 'qw9ert', '123', 'zhangFei@163.com', '123123123123123123', '地址地址通讯地址地址地址通讯地址地址地址');
INSERT INTO `user` VALUES ('EFF8D9A984E04BB5yuD7F04DA7EFgh9B', 'qwexrt', '123', 'zhangFei@163.com', '123123123123123123', '地址地址通讯地址地址地址通讯地址地址地址');
INSERT INTO `user` VALUES ('EFF8D9A984E04BBg9CD7F04DA7EF189B', 'qwerert', '123', 'zhangFei@163.com', '123123123123123123', '地址地址通讯地址地址地址通讯地址地址地址');
INSERT INTO `user` VALUES ('EFF8D9A984E04qrB59CD7F04D7EF189B', 'qwexcrt', '123', 'zhangFei@163.com', '123123123123123123', '地址地址通讯地址地址地址通讯地址地址地址');
INSERT INTO `user` VALUES ('EFF8D9A984E04yB59CD7F04DA7EF189B', 'qwhhert', '123', 'zhangFei@163.com', '123123123123123123', '地址地址通讯地址地址地址通讯地址地址地址');
INSERT INTO `user` VALUES ('EFF8D9A984Et4BB59CD7F04DA7EF189B', 'qwyyert', '123', 'zhangFei@163.com', '123123123123123123', '地址地址通讯地址地址地址通讯地址地址地址');
INSERT INTO `user` VALUES ('EFF8D9A98qE04BB59CD7F04DA7EF189B', 'qqwert', '123', 'zhangFei@163.com', '123123123123123123', '地址地址通讯地址地址地址通讯地址地址地址');
INSERT INTO `user` VALUES ('EFF8D9AdxfE04BB59CD7F04DA7EF189B', 'qwsdert', '123', 'zhangFei@163.com', '123123123123123123', '地址地址通讯地址地址地址通讯地址地址地址');
INSERT INTO `user` VALUES ('EFF8D9e98rE04BB59CD7F04DA7EF189B', 'qwefrt', '123', 'zhangFei@163.com', '123123123123123123', '地址地址通讯地址地址地址通讯地址地址地址');
INSERT INTO `user` VALUES ('EFF8Dase84E04BB59CD7F04DA7EF189B', 'qwerfswt', '123', 'zhangFei@163.com', '123123123123123123', '地址地址通讯地址地址地址通讯地址地址地址');

-- ----------------------------
-- View structure for ordernumview
-- ----------------------------
DROP VIEW IF EXISTS `ordernumview`;
CREATE ALGORITHM=UNDEFINED DEFINER=`skip-grants user`@`skip-grants host` SQL SECURITY DEFINER VIEW `ordernumview` AS select `order`.`uid` AS `uid`,count(`order`.`oid`) AS `orderNum` from `order` group by `order`.`uid` ;

-- ----------------------------
-- View structure for trans_record
-- ----------------------------
DROP VIEW IF EXISTS `trans_record`;
CREATE ALGORITHM=UNDEFINED DEFINER=`skip-grants user`@`skip-grants host` SQL SECURITY DEFINER VIEW `trans_record` AS select `user`.`loginname` AS `loginname`,`ordernumview`.`orderNum` AS `orderNum`,max(`order`.`ordertime`) AS `ordertime`,sum(`order`.`total`) AS `price` from ((`order` join `user`) join `ordernumview`) where (((curdate() - interval 90 day) <= cast(`order`.`ordertime` as date)) and (`order`.`uid` = `user`.`uid`) and (`order`.`uid` = `ordernumview`.`uid`)) group by `order`.`uid` ;
