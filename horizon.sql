/*
Navicat MySQL Data Transfer

Source Server         : MySQL-127.0.0.1
Source Server Version : 50717
Source Host           : 127.0.0.1:3306
Source Database       : horizon

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-05-26 21:58:39
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
  `productid` char(32) DEFAULT NULL,
  `uid` char(32) DEFAULT NULL,
  `orderBy` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`cartItemId`),
  KEY `orderBy` (`orderBy`),
  KEY `FK_cartitem_user` (`uid`),
  KEY `FK_cartitem_book` (`productid`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cartitem
-- ----------------------------
INSERT INTO `cartitem` VALUES ('1132DE7D185543A39A2FA1FB07AEE1C9', '1', 'FFABBED1E5254B10B2726ECrED8AC1DA', '6171DD8CE6D34AAAAA8925232EE56B27', '16');
INSERT INTO `cartitem` VALUES ('81335CF2C9E241219381B3BCA0D639BF', '1', 'F78C94641DB4475BBA1E72A07DF9B3AE', '6171DD8CE6D34AAAAA8925232EE56B27', '17');

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
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `commentid` varchar(40) NOT NULL,
  `productid` char(40) DEFAULT NULL,
  `desc` varchar(80) DEFAULT NULL,
  `loginname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`commentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('4831DE0F6991453087B2DFB4C5C71F79', 'FF1BBED1E5254BffB2726EC4ED8AC1DA', 'ewfwqef23e', 'xxx');
INSERT INTO `comment` VALUES ('64F08435DDF24541805F15BE07120D66', 'FFAB2ED1E5254BffB2726EC4ED8AC1DA', 'awfasdfasd', 'xxx');
INSERT INTO `comment` VALUES ('7D0C6FE61646436D83B1200CC3C66B11', 'FFABBED1E5254B10B2726ECrED8AC1DA', 'fefefef', 'xxx');
INSERT INTO `comment` VALUES ('BBBE633BF66743F1B0048A9F4752AEED', 'FF1BBED1E5254BffB2726EC4ED8AC1DA', '213213123', 'xxx');
INSERT INTO `comment` VALUES ('D0CFA4D3116343ACA27F853B2E8F2114', 'FFABBED1E5254B10B2726ECrED8AC1DA', 'sadfdasf', 'xxx');

-- ----------------------------
-- Table structure for issue
-- ----------------------------
DROP TABLE IF EXISTS `issue`;
CREATE TABLE `issue` (
  `issueid` varchar(40) NOT NULL,
  `loginname` varchar(50) NOT NULL,
  `email` varchar(40) NOT NULL,
  `issue_title` varchar(100) NOT NULL,
  `issue_con` varchar(600) DEFAULT NULL,
  `datetime` varchar(20) NOT NULL,
  PRIMARY KEY (`issueid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of issue
-- ----------------------------
INSERT INTO `issue` VALUES ('d60368cb-0e1b-4bb0-aa7e-dcc4e04d5bdd', '123', 'qweqew', 'qweqew', 'qewqwe', '2017-05-26 16:15:34');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `oid` char(32) NOT NULL,
  `shopid` varchar(40) DEFAULT NULL,
  `ordertime` char(19) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `address` varchar(1000) DEFAULT NULL,
  `uid` char(32) DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `FK_order_user` (`uid`),
  CONSTRAINT `FK_order_user` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('0A3967AF644644C79E779B37A501DBF7', '123123213', '2017-05-22 22:27:19', '8.00', '4', '12345678910', 'EFF8D9A984E04BB59CD7F04DA7EF189B');
INSERT INTO `order` VALUES ('1D0A76AD64FE459589AFE1F03700D031', '123123213', '2017-05-26 16:34:33', '24.00', '2', '123123', '6171DD8CE6D34AAAAA8925232EE56B27');
INSERT INTO `order` VALUES ('74EBE596471647A9B5336D7071D69270', '123123213', '2017-05-26 17:16:02', '80.00', '5', '123123', '6171DD8CE6D34AAAAA8925232EE56B27');
INSERT INTO `order` VALUES ('C8538C680C1D422B87076AB918AA8333', null, '2017-05-22 22:24:11', '8.00', '2', '12345678910', 'EFF8D9A984E04BB59CD7F04DA7EF189B');
INSERT INTO `order` VALUES ('C93711562F2E400696FE67A8046FBE78', null, '2017-05-26 16:52:53', '8.00', '4', '123123', '6171DD8CE6D34AAAAA8925232EE56B27');
INSERT INTO `order` VALUES ('E2BEC57E99D048FB8339935980D645E5', null, '2017-05-24 18:00:26', '16.00', '4', '12312312312', 'EFF8D9A984E04BB59CD7F04DA7EF189B');
INSERT INTO `order` VALUES ('F77DA1CA8F9E4B898DB4D806F28F77E5', null, '2017-05-25 11:36:49', '32.00', '2', '123123', '6171DD8CE6D34AAAAA8925232EE56B27');

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `orderItemId` char(32) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `subtotal` decimal(8,2) DEFAULT NULL,
  `productid` char(32) DEFAULT NULL,
  `productName` varchar(200) DEFAULT NULL,
  `currPrice` decimal(8,2) DEFAULT NULL,
  `image_b` varchar(100) DEFAULT NULL,
  `oid` char(32) DEFAULT NULL,
  PRIMARY KEY (`orderItemId`),
  KEY `FK_orderitem_order` (`oid`),
  CONSTRAINT `FK_orderitem_order` FOREIGN KEY (`oid`) REFERENCES `order` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES ('04C2273D45C54137B7208EEBBD1664A8', '3', '24.00', 'FFAB2ED1E5254BffB2726EC4ED8AC1DA', '商品商品qwe商品商品商品1', '8.00', '/Horizon/Back_Shop/ma_product/product_img/1-b.jpg', 'F77DA1CA8F9E4B898DB4D806F28F77E5');
INSERT INTO `orderitem` VALUES ('07ED34F66BDB4FFBA5FC06088E846140', '1', '8.00', 'FFABBED1E5254B10B2726ECrED8AC1DA', '商品商品qwe商品商品商品', '8.00', '/Horizon/Back_Shop/ma_product/product_img/1-b.jpg', 'E2BEC57E99D048FB8339935980D645E5');
INSERT INTO `orderitem` VALUES ('138366F0406B4C7BB8AD0877FD0DE6F5', '1', '8.00', 'FFABBED1E5254B10B2726ECrED8AC1DA', '商品商品qwe商品商品商品3', '8.00', '/Horizon/Back_Shop/ma_product/product_img/1-b.jpg', 'C93711562F2E400696FE67A8046FBE78');
INSERT INTO `orderitem` VALUES ('3D174014455340E2979D21357200092F', '2', '16.00', 'FFABBED1E5254B10B2726ECrED8AC1DA', '商品商品qwe商品商品商品3', '8.00', '/Horizon/Back_Shop/ma_product/product_img/1-b.jpg', '1D0A76AD64FE459589AFE1F03700D031');
INSERT INTO `orderitem` VALUES ('4D8DD3C3B77C4BF3B4369FEB46E11A10', '1', '8.00', 'FFAB2ED1E5254BffB2726EC4ED8AC1DA', '商品商品qwe商品商品商品', '8.00', '/Horizon/Back_Shop/ma_product/product_img/1-b.jpg', '0A3967AF644644C79E779B37A501DBF7');
INSERT INTO `orderitem` VALUES ('62C1A8FFCC724A959427A478EEDF6D2E', '4', '32.00', 'FFAB2ED1E5254BffB2726EC4ED8AC1DA', '商品商品qwe商品商品商品1', '8.00', '/Horizon/Back_Shop/ma_product/product_img/1-b.jpg', '74EBE596471647A9B5336D7071D69270');
INSERT INTO `orderitem` VALUES ('646EB11997A548269EEFB84E26005A10', '1', '8.00', 'FF1BBED1E5254BffB2726EC4ED8AC1DA', '商品商品qwe商品商品商品', '8.00', '/Horizon/Back_Shop/ma_product/product_img/1-b.jpg', 'E2BEC57E99D048FB8339935980D645E5');
INSERT INTO `orderitem` VALUES ('C20920771FFD4FFE8C57E51337E12BA1', '1', '8.00', 'F78C94641DB4475BBA1E72A07DF9B3AE', '商品商品qwe商品商品商品', '8.00', '/Horizon/Back_Shop/ma_product/product_img/1-b.jpg', '1D0A76AD64FE459589AFE1F03700D031');
INSERT INTO `orderitem` VALUES ('DE0892A76FE24D82B0F78F111C49AB80', '6', '48.00', 'FFABBED1E5254B10B2726ECrED8AC1DA', '商品商品qwe商品商品商品3', '8.00', '/Horizon/Back_Shop/ma_product/product_img/1-b.jpg', '74EBE596471647A9B5336D7071D69270');
INSERT INTO `orderitem` VALUES ('EC05C6D14AE04ECAB3E2FF8E3C6B1433', '1', '8.00', 'FC232CD9B6E6411BBBB1A5B781D2C3C9', '商品商品qwe商品商品商品', '8.00', '/Horizon/Back_Shop/ma_product/product_img/1-b.jpg', 'C8538C680C1D422B87076AB918AA8333');
INSERT INTO `orderitem` VALUES ('F86CFEBBF7EB452D89BA79C7230EBDF9', '1', '8.00', 'FF1BBED1E5254BffB2726EC4ED8AC1DA', '商品商品qwe商品商品商品2', '8.00', '/Horizon/Back_Shop/ma_product/product_img/1-b.jpg', 'F77DA1CA8F9E4B898DB4D806F28F77E5');
INSERT INTO `orderitem` VALUES ('FFAB2ED1E5254BffB2726EC4ED8AC1BA', '2', null, 'FFAB2ED1E5254BffB2726EC4ED8AC1DA', null, null, null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('F78C94641DB4475BBA1E72A07DF9B3AE', '123123213', '商品商品qwe商品商品商品', '/Horizon/Back_Shop/ma_product/product_img/1-b.jpg', '/Horizon/Back_Shop/ma_product/product_img/1-w.jpg', '10', '8', '品牌', '19', '9', '2012-01-01', '2014-04-01', 'af2ff657-8a65-4467-8674-7b9380baac02', 'aa', '69');
INSERT INTO `product` VALUES ('FC232CD9B6E6411BBBB1A5B781D2C3C9', '123123213', '商品商品qwe商品商品商品', '/Horizon/Back_Shop/ma_product/product_img/1-b.jpg', '/Horizon/Back_Shop/ma_product/product_img/1-w.jpg', '10', '8', '品牌', '20', '8', '2012-01-01', '2014-04-01', '3', 'aa', '67');
INSERT INTO `product` VALUES ('FEC3740CF30E442A94021911A25EF0D7', '123123213', '商品商品qwe1', '/Horizon/Back_Shop/ma_product/product_img/1-b.jpg', '/Horizon/Back_Shop/ma_product/product_img/1-w.jpg', '10', '8', '品牌1', '20', '8', '2012-01-01', '2014-04-01', '3', 'aa', '82');
INSERT INTO `product` VALUES ('FF1BBED1E5254BffB2726EC4ED8AC1DA', '123123213', '商品商品qwe商品商品商品2', '/Horizon/Back_Shop/ma_product/product_img/1-b.jpg', '/Horizon/Back_Shop/ma_product/product_img/1-w.jpg', '10', '8', '品牌', '18', '10', '2012-01-01', '2014-04-01', '3', 'aa', '47');
INSERT INTO `product` VALUES ('FFAB2ED1E5254BffB2726EC4ED8AC1DA', '123123213', '商品商品qwe商品商品商品1', '/Horizon/Back_Shop/ma_product/product_img/1-b.jpg', '/Horizon/Back_Shop/ma_product/product_img/1-w.jpg', '10', '8', '品牌', '11', '17', '2012-01-01', '2014-04-01', '3', 'aa', '47');
INSERT INTO `product` VALUES ('FFABBED1E5154B10B2726EC4ED8AC1DA', '123123213', '商品商品qwe商品商品商品', '/Horizon/Back_Shop/ma_product/product_img/1-b.jpg', '/Horizon/Back_Shop/ma_product/product_img/1-w.jpg', '10', '8', '品牌', '20', '8', '2012-01-01', null, '3', 'aa', '47');
INSERT INTO `product` VALUES ('FFABBED1E5252B10B2726EC4ED8AC1DA', '123123213', '商品商品qwe商品商品商品', '/Horizon/Back_Shop/ma_product/product_img/1-b.jpg', '/Horizon/Back_Shop/ma_product/product_img/1-w.jpg', '10', '8', '品牌', '20', '8', null, null, '3', 'aa', '47');
INSERT INTO `product` VALUES ('FFABBED1E5254B10B2726e44ED8AC1DA', '123123213', '商品商品qwe商品商品商品', '/Horizon/Back_Shop/ma_product/product_img/1-b.jpg', '/Horizon/Back_Shop/ma_product/product_img/1-w.jpg', '10', '8', '品牌', '20', '8', null, null, '3', 'aa', '47');
INSERT INTO `product` VALUES ('FFABBED1E5254B10B2726EC4ED8AC1DA', '123123213', '商品商品qwe商品商品商品', '/Horizon/Back_Shop/ma_product/product_img/1-b.jpg', '/Horizon/Back_Shop/ma_product/product_img/1-w.jpg', '10', '8', '品牌', '20', '8', null, null, '3', 'aa', '47');
INSERT INTO `product` VALUES ('FFABBED1E5254B10B2726ECgED8AC1DA', '123123213', '商品商品qwe商品商品商品', '/Horizon/Back_Shop/ma_product/product_img/1-b.jpg', '/Horizon/Back_Shop/ma_product/product_img/1-w.jpg', '10', '8', '品牌', '20', '8', null, null, '3', 'aa', '47');
INSERT INTO `product` VALUES ('FFABBED1E5254B10B2726ECrED8AC1DA', '123123213', '商品商品qwe商品商品商品3', '/Horizon/Back_Shop/ma_product/product_img/1-b.jpg', '/Horizon/Back_Shop/ma_product/product_img/1-w.jpg', '10', '8', '品牌', '10', '24', null, null, '3', 'aa', '47');
INSERT INTO `product` VALUES ('FFABBED1E5254B10B2726EvfED8AC1DA', '123123213', '商品商品qwe商品商品商品', '/Horizon/Back_Shop/ma_product/product_img/1-b.jpg', '/Horizon/Back_Shop/ma_product/product_img/1-w.jpg', '10', '8', '品牌', '20', '8', null, null, '3', 'aa', '47');
INSERT INTO `product` VALUES ('FFABBED1E5254B10B2726tC4ED8AC1DA', '123123213', '商品商品qwe商品商品商品', '/Horizon/Back_Shop/ma_product/product_img/1-b.jpg', '/Horizon/Back_Shop/ma_product/product_img/1-w.jpg', '10', '8', '品牌', '20', '8', null, null, '3', 'aa', '47');
INSERT INTO `product` VALUES ('FFABBED1E5254B10B272hEw4ED8AC1DA', '123123213', '商品商品qwe商品商品商品', '/Horizon/Back_Shop/ma_product/product_img/1-b.jpg', '/Horizon/Back_Shop/ma_product/product_img/1-w.jpg', '10', '8', '品牌', '20', '8', null, null, '3', 'aa', '47');
INSERT INTO `product` VALUES ('FFABBED1E5254B10B272weC4ED8AC1DA', '123123213', '商品商品qwe商品商品商品', '/Horizon/Back_Shop/ma_product/product_img/1-b.jpg', '/Horizon/Back_Shop/ma_product/product_img/1-w.jpg', '10', '8', '品牌', '20', '8', null, null, '5F79D0D246AD4216AC04E9C5FAB3199E', 'aa', '47');
INSERT INTO `product` VALUES ('FFABBED1E5254B10B2g26EC4ED8AC1DA', '123123213', '商品商品qwe商品商品商品', '/Horizon/Back_Shop/ma_product/product_img/1-b.jpg', '/Horizon/Back_Shop/ma_product/product_img/1-w.jpg', '10', '8', '品牌', '20', '8', null, null, '5F79D0D246AD4216AC04E9C5FAB3199E', 'aa', '47');
INSERT INTO `product` VALUES ('FFABBED1E5254B10B3726EC4ED8AC1DA', '123123213', '商品商品qwe商品商品商品', '/Horizon/Back_Shop/ma_product/product_img/1-b.jpg', '/Horizon/Back_Shop/ma_product/product_img/1-w.jpg', '10', '8', '品牌', '20', '8', null, null, '5F79D0D246AD4216AC04E9C5FAB3199E', 'aa', '47');
INSERT INTO `product` VALUES ('FFABBED1E5254B10Bss26EC4ED8AC1DA', '123123213', '商品商品qwe商品商品商品', '/Horizon/Back_Shop/ma_product/product_img/1-b.jpg', '/Horizon/Back_Shop/ma_product/product_img/1-w.jpg', '10', '8', '品牌', '20', '8', null, null, '5F79D0D246AD4216AC04E9C5FAB3199E', 'aa', '47');
INSERT INTO `product` VALUES ('FFABBED1E5254BC0B2726EC4ED8AC1DA', '123123213', '商品商品qwe商品商品商品', '/Horizon/Back_Shop/ma_product/product_img/1-b.jpg', '/Horizon/Back_Shop/ma_product/product_img/1-w.jpg', '10', '8', '品牌', '20', '8', null, null, '5F79D0D246AD4216AC04E9C5FAB3199E', 'aa', '47');
INSERT INTO `product` VALUES ('FFABBED1E5254BC0B2726EC4ED8ACCDA', '111', '商品商品qwe商品商品商品', '/Horizon/Back_Shop/ma_product/product_img/1-b.jpg', '/Horizon/Back_Shop/ma_product/product_img/1-w.jpg', '10', '8', '品牌', '16', '3', null, null, '5F79D0D246AD4216AC04E9C5FAB3199E', 'aa', '47');
INSERT INTO `product` VALUES ('FFABBED1E5254BffB2726EC4ED8AC1DA', '111', '商品商品qwe商品商品商品', '/Horizon/Back_Shop/ma_product/product_img/1-b.jpg', '/Horizon/Back_Shop/ma_product/product_img/1-w.jpg', '10', '8', '品牌', '15', '3', null, null, '5F79D0D246AD4216AC04E9C5FAB3199E', 'aa', '47');
INSERT INTO `product` VALUES ('FFABBED1E525vBffB2726EC4ED8AC1DA', '111', '商品商品qwe商品商品商品', '/Horizon/Back_Shop/ma_product/product_img/1-b.jpg', '/Horizon/Back_Shop/ma_product/product_img/1-w.jpg', '10', '8', '品牌', '17', '8', null, null, '5F79D0D246AD4216AC04E9C5FAB3199E', 'aa', '47');
INSERT INTO `product` VALUES ('FFABBED1E52a4BffB2726EC4ED8AC1DA', '111', '商品商品qwe商品商品商品', '/Horizon/Back_Shop/ma_product/product_img/1-b.jpg', '/Horizon/Back_Shop/ma_product/product_img/1-w.jpg', '10', '8', '品牌', '18', '7', null, null, '5F79D0D246AD4216AC04E9C5FAB3199E', 'aa', '47');
INSERT INTO `product` VALUES ('FFABBED1E52dfBffB2726EC4ED8AC1DA', '111', '商品商品qwe商品商品商品', '/Horizon/Back_Shop/ma_product/product_img/1-b.jpg', '/Horizon/Back_Shop/ma_product/product_img/1-w.jpg', '10', '8', '品牌', '10', '6', null, null, '5F79D0D246AD4216AC04E9C5FAB3199E', 'aa', '47');
INSERT INTO `product` VALUES ('FFABBED1E52f4BffB2726EC4ED8AC1DA', '111', '00', '/Horizon/Back_Shop/ma_product/product_img/1-b.jpg', '/Horizon/Back_Shop/ma_product/product_img/1-w.jpg', '10', '8', '品牌', '10', '7', null, null, '5F79D0D246AD4216AC04E9C5FAB3199E', 'aa', '47');
INSERT INTO `product` VALUES ('FFABBED1Ee254BffB2726EC4ED8AC1DA', '111', '5', '/Horizon/Back_Shop/ma_product/product_img/1-b.jpg', '/Horizon/Back_Shop/ma_product/product_img/1-w.jpg', '10', '8', '品牌', '10', '7', null, null, '5F79D0D246AD4216AC04E9C5FAB3199E', 'aa', '47');
INSERT INTO `product` VALUES ('FFABBED1z5254BffB2726EC4ED8AC1DA', '111', '4', '/Horizon/Back_Shop/ma_product/product_img/1-b.jpg', '/Horizon/Back_Shop/ma_product/product_img/1-w.jpg', '10', '8', '品牌', '10', '5', null, null, '5F79D0D246AD4216AC04E9C5FAB3199E', 'aa', '47');
INSERT INTO `product` VALUES ('FFABBEddE5254BffB2726EC4ED8AC1DA', '111', '3', '/Horizon/Back_Shop/ma_product/product_img/1-b.jpg', '/Horizon/Back_Shop/ma_product/product_img/1-w.jpg', '10', '8', '品牌', '10', '8', null, null, '5F79D0D246AD4216AC04E9C5FAB3199E', 'aa', '47');
INSERT INTO `product` VALUES ('FFABBEDwE5254BffB2726EC4ED8AC1DA', '111', '2', '/Horizon/Back_Shop/ma_product/product_img/1-b.jpg', '/Horizon/Back_Shop/ma_product/product_img/1-w.jpg', '10', '8', '品牌', '10', '7', null, null, '5F79D0D246AD4216AC04E9C5FAB3199E', 'aa', '47');
INSERT INTO `product` VALUES ('FFABBqD1E5254BffB2726EC4ED8AC1DA', '111', '1', '/Horizon/Back_Shop/ma_product/product_img/1-b.jpg', '/Horizon/Back_Shop/ma_product/product_img/1-w.jpg', '10', '8', '品牌', '10', '8', null, null, '5F79D0D246AD4216AC04E9C5FAB3199E', 'aa', '47');

-- ----------------------------
-- Table structure for shop
-- ----------------------------
DROP TABLE IF EXISTS `shop`;
CREATE TABLE `shop` (
  `shopid` varchar(40) NOT NULL,
  `sellerid` varchar(40) NOT NULL,
  `shopName` varchar(100) DEFAULT NULL,
  `busi` varchar(40) DEFAULT NULL,
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
INSERT INTO `shop` VALUES ('111', '123qwe', 'qwe1', '商品', null, null, '0', '0', null, null, null, null);
INSERT INTO `shop` VALUES ('123123213', '123', '123描述文件描述文件', '主营主营', '描述文件描述文件描述文件描述文件描述文件描述文件描述文件描述文件描述文件描述文件描述文件描述文件', '3', '1', '1', '描述文件', '12334535435345', '123描述文件描述文件描述文件', '123567');
INSERT INTO `shop` VALUES ('64947167-a34c-425b-acc6-c88dc9468f04', '1231', '12店铺名1', '店铺名', '店铺名', '3', '0', '1', '店铺名1', '店铺名', '店铺名123', '店铺名123');

-- ----------------------------
-- Table structure for shopverify
-- ----------------------------
DROP TABLE IF EXISTS `shopverify`;
CREATE TABLE `shopverify` (
  `loginname` varchar(40) NOT NULL,
  `name` varchar(10) NOT NULL,
  `idcardNum` varchar(20) NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `bank` varchar(40) NOT NULL,
  `bankcardNum` varchar(30) NOT NULL,
  `status` varchar(3) NOT NULL,
  `reason` varchar(300) DEFAULT NULL,
  `notice` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`loginname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopverify
-- ----------------------------
INSERT INTO `shopverify` VALUES ('123', '12', '12', '12', '12', '12', '12', '1', null, '0');
INSERT INTO `shopverify` VALUES ('aa1', '中1文', '231123123123123', '中文文字中文文字中文文字中文文字中文文字', '123123123123', '中文文字中文文字中', '1231231231232213123123', '1', null, null);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` char(32) NOT NULL,
  `loginname` varchar(50) DEFAULT NULL,
  `loginpass` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `address` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `loginname` (`loginname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('6171DD8CE6D34AAAAA8925232EE56B27', '123', '123', '123@123.com', '12312312312', '123123');
INSERT INTO `user` VALUES ('EFF8D9A984E04BB59CD7F04DA7EF189B', 'xxx', '123', 'fef@ff.cc', '12312312312', '12312312312');

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
DROP TRIGGER IF EXISTS `changepro`;
DELIMITER ;;
CREATE TRIGGER `changepro` AFTER INSERT ON `orderitem` FOR EACH ROW BEGIN
	UPDATE product SET productNum = productNum-new.quantity,salesNum = salesNum+new.quantity WHERE productid = new.productid;
    END
;;
DELIMITER ;
