/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : horizon

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-05-27 14:22:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
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
-- Table structure for `cartitem`
-- ----------------------------
DROP TABLE IF EXISTS `cartitem`;
CREATE TABLE `cartitem` (
  `cartItemId` char(32) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `productid` char(40) DEFAULT NULL,
  `uid` char(32) DEFAULT NULL,
  `orderBy` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`cartItemId`),
  KEY `orderBy` (`orderBy`),
  KEY `FK_cartitem_user` (`uid`),
  KEY `FK_cartitem_book` (`productid`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cartitem
-- ----------------------------

-- ----------------------------
-- Table structure for `category`
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
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('160429f8-21f9-4733-8c00-e6041a4930b9', '洗衣机', 'cc7127d8-9e73-4a0b-9cdf-a4dedba46654', '洗衣机', '37');
INSERT INTO `category` VALUES ('29db0d59-f5f3-4356-8bc5-8463da284e55', '手机', 'a53aebbe-970b-42bc-8363-1437ab446cef', '各种品牌手机', '47');
INSERT INTO `category` VALUES ('3dffb9e4-e8d9-4ce1-899d-c18e202bf7c9', '男装', 'ddbd642c-6370-47dc-8185-81e1b1445baa', 'T恤、休闲裤、衬衫、鞋类等', '42');
INSERT INTO `category` VALUES ('42741d04-aaae-4725-8ff9-c46d82318d93', '数码相机', 'a53aebbe-970b-42bc-8363-1437ab446cef', '数码相机', '48');
INSERT INTO `category` VALUES ('4b31720a-3b2a-4224-a089-3b48d2ef9ead', '女装', 'ddbd642c-6370-47dc-8185-81e1b1445baa', 'T恤、休闲裤、裙子、鞋类等', '43');
INSERT INTO `category` VALUES ('7590ec11-29b3-48d4-a188-69de9e7a21e7', '电视机', 'cc7127d8-9e73-4a0b-9cdf-a4dedba46654', '电视机', '38');
INSERT INTO `category` VALUES ('814fc0f8-d78a-421a-8cf0-bf5b5cc64824', '电脑耗材', null, '键盘，鼠标，U盘，连接线，读卡器等', '50');
INSERT INTO `category` VALUES ('92bce0f0-4f53-4994-97b6-42a3eb7d13c8', 'U盘', '814fc0f8-d78a-421a-8cf0-bf5b5cc64824', '各种U盘', '51');
INSERT INTO `category` VALUES ('a53aebbe-970b-42bc-8363-1437ab446cef', '数码产品', null, '手机、MP3、数码相机等', '46');
INSERT INTO `category` VALUES ('bca91f07-6251-4cc0-b699-a3537f8b0996', '小吃', 'ecfb586a-f8b8-409a-b0ac-467f61a4be73', '小吃', '45');
INSERT INTO `category` VALUES ('cc7127d8-9e73-4a0b-9cdf-a4dedba46654', '家用电器', null, '洗衣机、电视机、冰箱、空调、微波炉等', '36');
INSERT INTO `category` VALUES ('ddbd642c-6370-47dc-8185-81e1b1445baa', '服装', null, '男装、女装、童装、配饰等', '40');
INSERT INTO `category` VALUES ('ecfb586a-f8b8-409a-b0ac-467f61a4be73', '食品', null, '小吃、水果等', '44');
INSERT INTO `category` VALUES ('f18d1fd2-e690-4afb-bcc1-02a81be58518', '冰箱', 'cc7127d8-9e73-4a0b-9cdf-a4dedba46654', '冰箱', '39');

-- ----------------------------
-- Table structure for `comment`
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
INSERT INTO `comment` VALUES ('2C6D7879528F4984B592227C624B5B32', 'c1f2e7fb-155c-49b1-9378-2dc11588822c', '电视机13电视机13电视机13不错', '789');
INSERT INTO `comment` VALUES ('35CA2B1F00BB470D89FC0745D1849E89', '05f51643-9b43-40b2-b8ed-7626e0de29e4', 'U盘20好U盘20好U盘20好U盘20好U盘20好U盘20好', 'qwe');
INSERT INTO `comment` VALUES ('65FD58703D43452AA69AEA88FE88ED81', '524e1daf-ff9a-4d5a-9f31-45198b790ef5', '电视机7不错', '123');
INSERT INTO `comment` VALUES ('7A3C9025D9B4425CBBA90797A9C4B636', '05f51643-9b43-40b2-b8ed-7626e0de29e4', 'U盘20U盘20U盘20U盘20好', '789');
INSERT INTO `comment` VALUES ('9D24C8C9D15A4AB695812AA7865A44AD', '2c0df41d-2c78-45cf-9de4-b61203f96bb0', 'U盘好U盘好U盘好', '789');
INSERT INTO `comment` VALUES ('C0FBEE392111434BBCA2646E8CB1C2F8', 'c1f2e7fb-155c-49b1-9378-2dc11588822c', '电视机13电视机13电视机13电视机13好', '123');
INSERT INTO `comment` VALUES ('DA3E4BCE93984DBB9B2CF890DE093B6E', '0baa0ff6-ec9e-4660-99b8-b4ea56096f01', '电视机11不错', '123');
INSERT INTO `comment` VALUES ('E31FEF1A58C846439E3953D679DFB8FF', '32895ed6-dff4-42f6-bd22-dcb9f45daa86', '冰箱15不错', '123');

-- ----------------------------
-- Table structure for `issue`
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
INSERT INTO `issue` VALUES ('954356ce-6848-421e-9b87-87ba3bb9e826', '123', '123@123.com', '问题标题问题标题问题标题', '反馈的问题反馈的问题反馈的问题反馈的问题反馈的问题反馈的问题', '2017-05-27 13:25:14');
INSERT INTO `issue` VALUES ('e5496cef-bde7-44c3-bef9-a5d42742c1f8', '789', '789@789.com', '标题标题标题标题标题标题789', '内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容789', '2017-05-27 13:27:12');

-- ----------------------------
-- Table structure for `order`
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
INSERT INTO `order` VALUES ('2FB97587B7E7429584926054E31A2A7C', '8b703084-8562-4eaa-8b07-6d7a4a32fecc', '2017-05-27 13:39:44', '1500.00', '5', '789地址地址地址地址地址', 'F9FFBE742CA24987AA5285B8C8E7991D');
INSERT INTO `order` VALUES ('3D3E62AFF6BF4307B89BC50D1E05B030', '', '2017-05-27 13:41:59', '8640.00', '1', '我的地址我的地址我的地址', '87BFD27805F44F44BBAAF60BD6013164');
INSERT INTO `order` VALUES ('511990A1FB9F4AB0B77B74DA7CAA2179', '8b703084-8562-4eaa-8b07-6d7a4a32fecc', '2017-05-27 14:16:01', '960.00', '4', '789地址地址地址地址地址', 'F9FFBE742CA24987AA5285B8C8E7991D');
INSERT INTO `order` VALUES ('5958920EC86C4A02B747C9779B5849FF', null, '2017-05-27 13:50:10', '990.00', '2', '789地址地址地址地址地址', 'F9FFBE742CA24987AA5285B8C8E7991D');
INSERT INTO `order` VALUES ('5B375B6BD33E4B5FBB116700E7DC9071', '8b703084-8562-4eaa-8b07-6d7a4a32fecc', '2017-05-27 13:36:21', '3600.00', '2', '789地址地址地址地址地址', 'F9FFBE742CA24987AA5285B8C8E7991D');
INSERT INTO `order` VALUES ('5C1BB9851F944F95B86A57A72D0BC991', 'a0a42d69-e6e4-4072-8a0a-0777a3dac587', '2017-05-27 14:16:18', '30.00', '4', '789地址地址地址地址地址', 'F9FFBE742CA24987AA5285B8C8E7991D');
INSERT INTO `order` VALUES ('6270F77B69B04CA0BEEDF37FDE4F8222', '8b703084-8562-4eaa-8b07-6d7a4a32fecc', '2017-05-27 13:47:00', '30.00', '1', '我的地址我的地址我的地址', '87BFD27805F44F44BBAAF60BD6013164');
INSERT INTO `order` VALUES ('6689D8E48FC64EA7BAC2B20F10683955', 'a0a42d69-e6e4-4072-8a0a-0777a3dac587', '2017-05-27 13:39:22', '180.00', '4', '789地址地址地址地址地址', 'F9FFBE742CA24987AA5285B8C8E7991D');
INSERT INTO `order` VALUES ('9714E1B3E3F1496E9B32B011CB107484', '8b703084-8562-4eaa-8b07-6d7a4a32fecc', '2017-05-27 13:43:17', '1950.00', '4', '我的地址我的地址我的地址', '87BFD27805F44F44BBAAF60BD6013164');
INSERT INTO `order` VALUES ('9DAA2BCA30594CD3AA3BB2BFE7A0079D', null, '2017-05-27 13:38:02', '890.00', '1', '789地址地址地址地址地址', 'F9FFBE742CA24987AA5285B8C8E7991D');
INSERT INTO `order` VALUES ('A092AF14013D427AB0B775AD95B2B1F2', '8b703084-8562-4eaa-8b07-6d7a4a32fecc', '2017-05-27 14:15:35', '960.00', '4', '我的地址我的地址我的地址', '87BFD27805F44F44BBAAF60BD6013164');
INSERT INTO `order` VALUES ('A18ECA29D9E640F4BD47C9FD0BB60277', '8b703084-8562-4eaa-8b07-6d7a4a32fecc', '2017-05-27 13:42:26', '150.00', '2', '我的地址我的地址我的地址', '87BFD27805F44F44BBAAF60BD6013164');
INSERT INTO `order` VALUES ('A45EC3FA22354528A1A3A4D999255970', 'a0a42d69-e6e4-4072-8a0a-0777a3dac587', '2017-05-27 13:38:22', '30.00', '3', '789地址地址地址地址地址', 'F9FFBE742CA24987AA5285B8C8E7991D');
INSERT INTO `order` VALUES ('FC0CE71B838C4DCBA36BAF801D233491', '8b703084-8562-4eaa-8b07-6d7a4a32fecc', '2017-05-27 13:46:46', '3420.00', '3', '我的地址我的地址我的地址', '87BFD27805F44F44BBAAF60BD6013164');
INSERT INTO `order` VALUES ('FF41D4C0739F4C5BBAFEFB3554EE23C6', 'a0a42d69-e6e4-4072-8a0a-0777a3dac587', '2017-05-27 14:04:45', '30.00', '4', '地址地址qwe地址', 'BFD8727805FBAAF3B44F4416460BD601');

-- ----------------------------
-- Table structure for `orderitem`
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `orderItemId` char(32) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `subtotal` decimal(8,2) DEFAULT NULL,
  `productid` char(40) DEFAULT NULL,
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
INSERT INTO `orderitem` VALUES ('1034ECBC242346BAA86A88D534B6F86A', '1', '960.00', 'c1f2e7fb-155c-49b1-9378-2dc11588822c', '电视机13', '960.00', '/Horizon/Back_Shop/ma_product/product_img/c1f2e7fb-155c-49b1-9378-2dc11588822c_tv1.jpg', '5958920EC86C4A02B747C9779B5849FF');
INSERT INTO `orderitem` VALUES ('1519E3BF5A924D40B7D535BEF00894DD', '1', '30.00', '05f51643-9b43-40b2-b8ed-7626e0de29e4', 'U盘20', '30.00', '/Horizon/Back_Shop/ma_product/product_img/05f51643-9b43-40b2-b8ed-7626e0de29e4_Udisk1.jpg', 'FF41D4C0739F4C5BBAFEFB3554EE23C6');
INSERT INTO `orderitem` VALUES ('15C9C355FE114C1C92031C179718EFF8', '2', '1920.00', 'e9d43e3e-b5ca-4025-aa68-c3518aed876a', '电视机18', '960.00', '/Horizon/Back_Shop/ma_product/product_img/e9d43e3e-b5ca-4025-aa68-c3518aed876a_tv1.jpg', 'FC0CE71B838C4DCBA36BAF801D233491');
INSERT INTO `orderitem` VALUES ('1CF61AD4E9B646E4A6E008DE95E2C839', '1', '30.00', 'c9dac625-f8a2-4b97-9b55-cbf3e5c79954', '洗衣机17', '30.00', '/Horizon/Back_Shop/ma_product/product_img/c9dac625-f8a2-4b97-9b55-cbf3e5c79954_washing1.jpg', '6270F77B69B04CA0BEEDF37FDE4F8222');
INSERT INTO `orderitem` VALUES ('22FAEEC016BA40849F2CAF06ADAC652B', '1', '960.00', '524e1daf-ff9a-4d5a-9f31-45198b790ef5', '电视机7', '960.00', '/Horizon/Back_Shop/ma_product/product_img/524e1daf-ff9a-4d5a-9f31-45198b790ef5_tv1.jpg', '9714E1B3E3F1496E9B32B011CB107484');
INSERT INTO `orderitem` VALUES ('2ECD57673B5744B1A66068FCECE7BF4F', '1', '30.00', '05f51643-9b43-40b2-b8ed-7626e0de29e4', 'U盘20', '30.00', '/Horizon/Back_Shop/ma_product/product_img/05f51643-9b43-40b2-b8ed-7626e0de29e4_Udisk1.jpg', '5C1BB9851F944F95B86A57A72D0BC991');
INSERT INTO `orderitem` VALUES ('31833237FB1840C794332284D82CBA37', '3', '90.00', '05f51643-9b43-40b2-b8ed-7626e0de29e4', 'U盘20', '30.00', '/Horizon/Back_Shop/ma_product/product_img/05f51643-9b43-40b2-b8ed-7626e0de29e4_Udisk1.jpg', '9DAA2BCA30594CD3AA3BB2BFE7A0079D');
INSERT INTO `orderitem` VALUES ('37FB1B934AC5432D9DC6CE30F4087CD4', '1', '960.00', '0baa0ff6-ec9e-4660-99b8-b4ea56096f01', '电视机11', '960.00', '/Horizon/Back_Shop/ma_product/product_img/0baa0ff6-ec9e-4660-99b8-b4ea56096f01_tv1.jpg', '9714E1B3E3F1496E9B32B011CB107484');
INSERT INTO `orderitem` VALUES ('494447C6313342ADBC83AE0562F81B77', '1', '1500.00', '049b9a11-f092-4545-ae71-95864bf2387f', '冰箱1', '1500.00', '/Horizon/Back_Shop/ma_product/product_img/049b9a11-f092-4545-ae71-95864bf2387f_fridge1.jpg', 'FC0CE71B838C4DCBA36BAF801D233491');
INSERT INTO `orderitem` VALUES ('51328975D189480F973F1E5C9315F894', '1', '800.00', '0bd69310-0d08-4b8a-a255-15da5798d294', '洗衣机20', '800.00', '/Horizon/Back_Shop/ma_product/product_img/0bd69310-0d08-4b8a-a255-15da5798d294_washing1.jpg', '5B375B6BD33E4B5FBB116700E7DC9071');
INSERT INTO `orderitem` VALUES ('5832C94482FC48ADA94E70713EFDB375', '1', '960.00', 'c1f2e7fb-155c-49b1-9378-2dc11588822c', '电视机13', '960.00', '/Horizon/Back_Shop/ma_product/product_img/c1f2e7fb-155c-49b1-9378-2dc11588822c_tv1.jpg', '511990A1FB9F4AB0B77B74DA7CAA2179');
INSERT INTO `orderitem` VALUES ('75A156868A5C4AAE95577EE7FC73E396', '1', '1500.00', '049b9a11-f092-4545-ae71-95864bf2387f', '冰箱1', '1500.00', '/Horizon/Back_Shop/ma_product/product_img/049b9a11-f092-4545-ae71-95864bf2387f_fridge1.jpg', '5B375B6BD33E4B5FBB116700E7DC9071');
INSERT INTO `orderitem` VALUES ('7F7E523DF5FE4E6FA565600A6B82C642', '9', '8640.00', 'c1f2e7fb-155c-49b1-9378-2dc11588822c', '电视机13', '960.00', '/Horizon/Back_Shop/ma_product/product_img/c1f2e7fb-155c-49b1-9378-2dc11588822c_tv1.jpg', '3D3E62AFF6BF4307B89BC50D1E05B030');
INSERT INTO `orderitem` VALUES ('8CFB7CC6F42F429EBBE617CAD55BA6A3', '1', '1300.00', '0c55f48c-0ea8-404c-a5cb-f29c59c4817a', '电视机20', '1300.00', '/Horizon/Back_Shop/ma_product/product_img/0c55f48c-0ea8-404c-a5cb-f29c59c4817a_tv1.jpg', '5B375B6BD33E4B5FBB116700E7DC9071');
INSERT INTO `orderitem` VALUES ('9D252D1270254532B73AD6FE3576C965', '1', '1500.00', '049b9a11-f092-4545-ae71-95864bf2387f', '冰箱1', '1500.00', '/Horizon/Back_Shop/ma_product/product_img/049b9a11-f092-4545-ae71-95864bf2387f_fridge1.jpg', '2FB97587B7E7429584926054E31A2A7C');
INSERT INTO `orderitem` VALUES ('A50C9D496A924D70921DFD24742420D3', '5', '150.00', '3bf9a578-ed15-4c12-a7a4-7abde1bafb54', '洗衣机18', '30.00', '/Horizon/Back_Shop/ma_product/product_img/3bf9a578-ed15-4c12-a7a4-7abde1bafb54_washing1.jpg', 'A18ECA29D9E640F4BD47C9FD0BB60277');
INSERT INTO `orderitem` VALUES ('B060F7AA6E224B88A6F5A373AF5C4999', '6', '180.00', '2c0df41d-2c78-45cf-9de4-b61203f96bb0', 'U盘2', '30.00', '/Horizon/Back_Shop/ma_product/product_img/2c0df41d-2c78-45cf-9de4-b61203f96bb0_Udisk1.jpg', '6689D8E48FC64EA7BAC2B20F10683955');
INSERT INTO `orderitem` VALUES ('C64CE527F7DB4436875DFDE25552F0F8', '1', '960.00', 'c1f2e7fb-155c-49b1-9378-2dc11588822c', '电视机13', '960.00', '/Horizon/Back_Shop/ma_product/product_img/c1f2e7fb-155c-49b1-9378-2dc11588822c_tv1.jpg', 'A092AF14013D427AB0B775AD95B2B1F2');
INSERT INTO `orderitem` VALUES ('CE2D240AF3D241E4B165BDA9CBEE24FC', '1', '800.00', '0bd69310-0d08-4b8a-a255-15da5798d294', '洗衣机20', '800.00', '/Horizon/Back_Shop/ma_product/product_img/0bd69310-0d08-4b8a-a255-15da5798d294_washing1.jpg', '9DAA2BCA30594CD3AA3BB2BFE7A0079D');
INSERT INTO `orderitem` VALUES ('D9E61931BF834E7A9C9D96360953344D', '1', '30.00', '32895ed6-dff4-42f6-bd22-dcb9f45daa86', '冰箱15', '30.00', '/Horizon/Back_Shop/ma_product/product_img/32895ed6-dff4-42f6-bd22-dcb9f45daa86_fridge1.jpg', '9714E1B3E3F1496E9B32B011CB107484');
INSERT INTO `orderitem` VALUES ('E8FCFA4B5ACF4057881D9613F0544E3C', '1', '30.00', '05f51643-9b43-40b2-b8ed-7626e0de29e4', 'U盘20', '30.00', '/Horizon/Back_Shop/ma_product/product_img/05f51643-9b43-40b2-b8ed-7626e0de29e4_Udisk1.jpg', 'A45EC3FA22354528A1A3A4D999255970');
INSERT INTO `orderitem` VALUES ('ECA676F3C57141EB9649F5EE5CD98829', '1', '30.00', 'ba63482c-307a-46ac-94d2-f31299797d59', 'U盘18', '30.00', '/Horizon/Back_Shop/ma_product/product_img/ba63482c-307a-46ac-94d2-f31299797d59_Udisk1.jpg', '5958920EC86C4A02B747C9779B5849FF');

-- ----------------------------
-- Table structure for `product`
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
) ENGINE=InnoDB AUTO_INCREMENT=264 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('049b9a11-f092-4545-ae71-95864bf2387f', '8b703084-8562-4eaa-8b07-6d7a4a32fecc', '冰箱1', '/Horizon/Back_Shop/ma_product/product_img/049b9a11-f092-4545-ae71-95864bf2387f_fridge1.jpg', '/Horizon/Back_Shop/ma_product/product_img/049b9a11-f092-4545-ae71-95864bf2387f_fridge2.jpg', '1600', '1500', '品质冰箱', '97', '3', '2016-12-01', '2016-12-10', 'f18d1fd2-e690-4afb-bcc1-02a81be58518', '这是冰箱这是冰箱这是冰箱这是冰箱这是冰箱这是品质冰箱', '223');
INSERT INTO `product` VALUES ('05f51643-9b43-40b2-b8ed-7626e0de29e4', 'a0a42d69-e6e4-4072-8a0a-0777a3dac587', 'U盘20', '/Horizon/Back_Shop/ma_product/product_img/05f51643-9b43-40b2-b8ed-7626e0de29e4_Udisk1.jpg', '/Horizon/Back_Shop/ma_product/product_img/05f51643-9b43-40b2-b8ed-7626e0de29e4_Udisk2.jpg', '50', '30', '品质U盘', '91', '9', '2016-12-01', '2016-12-10', '92bce0f0-4f53-4994-97b6-42a3eb7d13c8', '这是U盘这是U盘这是U盘这是U盘这是U盘这是品质U盘', '183');
INSERT INTO `product` VALUES ('0baa0ff6-ec9e-4660-99b8-b4ea56096f01', '8b703084-8562-4eaa-8b07-6d7a4a32fecc', '电视机11', '/Horizon/Back_Shop/ma_product/product_img/0baa0ff6-ec9e-4660-99b8-b4ea56096f01_tv1.jpg', '/Horizon/Back_Shop/ma_product/product_img/0baa0ff6-ec9e-4660-99b8-b4ea56096f01_tv2.jpg', '1000', '960', '品质电视机', '99', '1', '2016-12-01', '2016-12-10', '7590ec11-29b3-48d4-a188-69de9e7a21e7', '这是电视机这是电视机这是电视机这是电视机这是电视机这是品质电视机', '253');
INSERT INTO `product` VALUES ('0bd69310-0d08-4b8a-a255-15da5798d294', '8b703084-8562-4eaa-8b07-6d7a4a32fecc', '洗衣机20', '/Horizon/Back_Shop/ma_product/product_img/0bd69310-0d08-4b8a-a255-15da5798d294_washing1.jpg', '/Horizon/Back_Shop/ma_product/product_img/0bd69310-0d08-4b8a-a255-15da5798d294_washing2.jpg', '900', '800', '品质洗衣机', '98', '2', '2016-12-01', '2016-12-10', '160429f8-21f9-4733-8c00-e6041a4930b9', '这是洗衣机这是洗衣机这是洗衣机这是洗衣机这是洗衣机这是品质洗衣机', '224');
INSERT INTO `product` VALUES ('0c55f48c-0ea8-404c-a5cb-f29c59c4817a', '8b703084-8562-4eaa-8b07-6d7a4a32fecc', '电视机20', '/Horizon/Back_Shop/ma_product/product_img/0c55f48c-0ea8-404c-a5cb-f29c59c4817a_tv1.jpg', '/Horizon/Back_Shop/ma_product/product_img/0c55f48c-0ea8-404c-a5cb-f29c59c4817a_tv2.jpg', '1500', '1300', '品质电视机', '99', '1', '2016-12-01', '2016-12-10', '7590ec11-29b3-48d4-a188-69de9e7a21e7', '这是电视机这是电视机这是电视机这是电视机这是电视机这是品质电视机', '244');
INSERT INTO `product` VALUES ('1345a7af-0bde-4c92-9318-2dcf1b5b9838', 'a0a42d69-e6e4-4072-8a0a-0777a3dac587', 'U盘14', '/Horizon/Back_Shop/ma_product/product_img/1345a7af-0bde-4c92-9318-2dcf1b5b9838_Udisk1.jpg', '/Horizon/Back_Shop/ma_product/product_img/1345a7af-0bde-4c92-9318-2dcf1b5b9838_Udisk2.jpg', '50', '30', '品质U盘', '100', '0', '2016-12-01', '2016-12-10', '92bce0f0-4f53-4994-97b6-42a3eb7d13c8', '这是U盘这是U盘这是U盘这是U盘这是U盘这是品质U盘', '189');
INSERT INTO `product` VALUES ('17cabd1c-fa83-4028-99ef-6d1175e72ae2', '8b703084-8562-4eaa-8b07-6d7a4a32fecc', '冰箱5', '/Horizon/Back_Shop/ma_product/product_img/17cabd1c-fa83-4028-99ef-6d1175e72ae2_fridge1.jpg', '/Horizon/Back_Shop/ma_product/product_img/17cabd1c-fa83-4028-99ef-6d1175e72ae2_fridge2.jpg', '50', '30', '品质冰箱', '100', '0', '2016-12-01', '2016-12-10', 'f18d1fd2-e690-4afb-bcc1-02a81be58518', '这是冰箱这是冰箱这是冰箱这是冰箱这是冰箱这是品质冰箱', '219');
INSERT INTO `product` VALUES ('1856b07a-7d11-4318-9eff-87f2dc45d217', '8b703084-8562-4eaa-8b07-6d7a4a32fecc', '电视机12', '/Horizon/Back_Shop/ma_product/product_img/1856b07a-7d11-4318-9eff-87f2dc45d217_tv1.jpg', '/Horizon/Back_Shop/ma_product/product_img/1856b07a-7d11-4318-9eff-87f2dc45d217_tv2.jpg', '1000', '960', '品质电视机', '100', '0', '2016-12-01', '2016-12-10', '7590ec11-29b3-48d4-a188-69de9e7a21e7', '这是电视机这是电视机这是电视机这是电视机这是电视机这是品质电视机', '252');
INSERT INTO `product` VALUES ('24dbade2-f47c-475d-ab61-c87e751a5f47', '8b703084-8562-4eaa-8b07-6d7a4a32fecc', '洗衣机12', '/Horizon/Back_Shop/ma_product/product_img/24dbade2-f47c-475d-ab61-c87e751a5f47_washing1.jpg', '/Horizon/Back_Shop/ma_product/product_img/24dbade2-f47c-475d-ab61-c87e751a5f47_washing2.jpg', '50', '30', '品质洗衣机', '100', '0', '2016-12-01', '2016-12-10', '160429f8-21f9-4733-8c00-e6041a4930b9', '这是洗衣机这是洗衣机这是洗衣机这是洗衣机这是洗衣机这是品质洗衣机', '232');
INSERT INTO `product` VALUES ('28693998-0dd0-4387-b522-47d9670184ec', 'a0a42d69-e6e4-4072-8a0a-0777a3dac587', 'U盘1', '/Horizon/Back_Shop/ma_product/product_img/28693998-0dd0-4387-b522-47d9670184ec_Udisk1.jpg', '/Horizon/Back_Shop/ma_product/product_img/28693998-0dd0-4387-b522-47d9670184ec_Udisk2.jpg', '50', '30', '品质U盘', '100', '0', '2016-12-01', '2016-12-10', '92bce0f0-4f53-4994-97b6-42a3eb7d13c8', '这是U盘这是U盘这是U盘这是U盘这是U盘这是品质U盘', '202');
INSERT INTO `product` VALUES ('28a8e39a-b02d-4ad6-99ea-afd19ebb7997', '8b703084-8562-4eaa-8b07-6d7a4a32fecc', '洗衣机10', '/Horizon/Back_Shop/ma_product/product_img/28a8e39a-b02d-4ad6-99ea-afd19ebb7997_washing1.jpg', '/Horizon/Back_Shop/ma_product/product_img/28a8e39a-b02d-4ad6-99ea-afd19ebb7997_washing2.jpg', '50', '30', '品质洗衣机', '100', '0', '2016-12-01', '2016-12-10', '160429f8-21f9-4733-8c00-e6041a4930b9', '这是洗衣机这是洗衣机这是洗衣机这是洗衣机这是洗衣机这是品质洗衣机', '234');
INSERT INTO `product` VALUES ('299aa857-e16c-44c9-b6b0-f82c98b0ad69', 'a0a42d69-e6e4-4072-8a0a-0777a3dac587', 'U盘16', '/Horizon/Back_Shop/ma_product/product_img/299aa857-e16c-44c9-b6b0-f82c98b0ad69_Udisk1.jpg', '/Horizon/Back_Shop/ma_product/product_img/299aa857-e16c-44c9-b6b0-f82c98b0ad69_Udisk2.jpg', '50', '30', '品质U盘', '100', '0', '2016-12-01', '2016-12-10', '92bce0f0-4f53-4994-97b6-42a3eb7d13c8', '这是U盘这是U盘这是U盘这是U盘这是U盘这是品质U盘', '187');
INSERT INTO `product` VALUES ('2bdc3af5-6716-4126-afd7-60fdddd4729f', '8b703084-8562-4eaa-8b07-6d7a4a32fecc', '洗衣机3', '/Horizon/Back_Shop/ma_product/product_img/2bdc3af5-6716-4126-afd7-60fdddd4729f_washing1.jpg', '/Horizon/Back_Shop/ma_product/product_img/2bdc3af5-6716-4126-afd7-60fdddd4729f_washing2.jpg', '50', '30', '品质洗衣机', '100', '0', '2016-12-01', '2016-12-10', '160429f8-21f9-4733-8c00-e6041a4930b9', '这是洗衣机这是洗衣机这是洗衣机这是洗衣机这是洗衣机这是品质洗衣机', '241');
INSERT INTO `product` VALUES ('2c0df41d-2c78-45cf-9de4-b61203f96bb0', 'a0a42d69-e6e4-4072-8a0a-0777a3dac587', 'U盘2', '/Horizon/Back_Shop/ma_product/product_img/2c0df41d-2c78-45cf-9de4-b61203f96bb0_Udisk1.jpg', '/Horizon/Back_Shop/ma_product/product_img/2c0df41d-2c78-45cf-9de4-b61203f96bb0_Udisk2.jpg', '50', '30', '品质U盘', '94', '6', '2016-12-01', '2016-12-10', '92bce0f0-4f53-4994-97b6-42a3eb7d13c8', '这是U盘这是U盘这是U盘这是U盘这是U盘这是品质U盘', '201');
INSERT INTO `product` VALUES ('2e4431d8-1a1c-4cc7-94e2-a5bbbeb4289d', '8b703084-8562-4eaa-8b07-6d7a4a32fecc', '洗衣机14', '/Horizon/Back_Shop/ma_product/product_img/2e4431d8-1a1c-4cc7-94e2-a5bbbeb4289d_washing1.jpg', '/Horizon/Back_Shop/ma_product/product_img/2e4431d8-1a1c-4cc7-94e2-a5bbbeb4289d_washing2.jpg', '50', '30', '品质洗衣机', '100', '0', '2016-12-01', '2016-12-10', '160429f8-21f9-4733-8c00-e6041a4930b9', '这是洗衣机这是洗衣机这是洗衣机这是洗衣机这是洗衣机这是品质洗衣机', '230');
INSERT INTO `product` VALUES ('2fd931a0-8151-4a23-9752-d6cfe63d5d9f', '8b703084-8562-4eaa-8b07-6d7a4a32fecc', '电视机4', '/Horizon/Back_Shop/ma_product/product_img/2fd931a0-8151-4a23-9752-d6cfe63d5d9f_tv1.jpg', '/Horizon/Back_Shop/ma_product/product_img/2fd931a0-8151-4a23-9752-d6cfe63d5d9f_tv2.jpg', '1000', '960', '品质电视机', '100', '0', '2016-12-01', '2016-12-10', '7590ec11-29b3-48d4-a188-69de9e7a21e7', '这是电视机这是电视机这是电视机这是电视机这是电视机这是品质电视机', '260');
INSERT INTO `product` VALUES ('32607169-c121-412d-8e52-a5758df6b98e', '8b703084-8562-4eaa-8b07-6d7a4a32fecc', '冰箱2', '/Horizon/Back_Shop/ma_product/product_img/32607169-c121-412d-8e52-a5758df6b98e_fridge1.jpg', '/Horizon/Back_Shop/ma_product/product_img/32607169-c121-412d-8e52-a5758df6b98e_fridge2.jpg', '50', '30', '品质冰箱', '100', '0', '2016-12-01', '2016-12-10', 'f18d1fd2-e690-4afb-bcc1-02a81be58518', '这是冰箱这是冰箱这是冰箱这是冰箱这是冰箱这是品质冰箱', '222');
INSERT INTO `product` VALUES ('32895ed6-dff4-42f6-bd22-dcb9f45daa86', '8b703084-8562-4eaa-8b07-6d7a4a32fecc', '冰箱15', '/Horizon/Back_Shop/ma_product/product_img/32895ed6-dff4-42f6-bd22-dcb9f45daa86_fridge1.jpg', '/Horizon/Back_Shop/ma_product/product_img/32895ed6-dff4-42f6-bd22-dcb9f45daa86_fridge2.jpg', '50', '30', '品质冰箱', '99', '1', '2016-12-01', '2016-12-10', 'f18d1fd2-e690-4afb-bcc1-02a81be58518', '这是冰箱这是冰箱这是冰箱这是冰箱这是冰箱这是品质冰箱', '209');
INSERT INTO `product` VALUES ('364f5728-5ce1-4e8a-9735-43dbc8d912da', '8b703084-8562-4eaa-8b07-6d7a4a32fecc', '冰箱11', '/Horizon/Back_Shop/ma_product/product_img/364f5728-5ce1-4e8a-9735-43dbc8d912da_fridge1.jpg', '/Horizon/Back_Shop/ma_product/product_img/364f5728-5ce1-4e8a-9735-43dbc8d912da_fridge2.jpg', '50', '30', '品质冰箱', '100', '0', '2016-12-01', '2016-12-10', 'f18d1fd2-e690-4afb-bcc1-02a81be58518', '这是冰箱这是冰箱这是冰箱这是冰箱这是冰箱这是品质冰箱', '213');
INSERT INTO `product` VALUES ('37fc03bd-520e-4005-81fb-9d4c9d3b585e', '8b703084-8562-4eaa-8b07-6d7a4a32fecc', '冰箱6', '/Horizon/Back_Shop/ma_product/product_img/37fc03bd-520e-4005-81fb-9d4c9d3b585e_fridge1.jpg', '/Horizon/Back_Shop/ma_product/product_img/37fc03bd-520e-4005-81fb-9d4c9d3b585e_fridge2.jpg', '50', '30', '品质冰箱', '100', '0', '2016-12-01', '2016-12-10', 'f18d1fd2-e690-4afb-bcc1-02a81be58518', '这是冰箱这是冰箱这是冰箱这是冰箱这是冰箱这是品质冰箱', '218');
INSERT INTO `product` VALUES ('3bf9a578-ed15-4c12-a7a4-7abde1bafb54', '8b703084-8562-4eaa-8b07-6d7a4a32fecc', '洗衣机18', '/Horizon/Back_Shop/ma_product/product_img/3bf9a578-ed15-4c12-a7a4-7abde1bafb54_washing1.jpg', '/Horizon/Back_Shop/ma_product/product_img/3bf9a578-ed15-4c12-a7a4-7abde1bafb54_washing2.jpg', '50', '30', '品质洗衣机', '95', '5', '2016-12-01', '2016-12-10', '160429f8-21f9-4733-8c00-e6041a4930b9', '这是洗衣机这是洗衣机这是洗衣机这是洗衣机这是洗衣机这是品质洗衣机', '226');
INSERT INTO `product` VALUES ('3d5ada6f-d874-4665-9f49-f462f9809355', 'a0a42d69-e6e4-4072-8a0a-0777a3dac587', 'U盘3', '/Horizon/Back_Shop/ma_product/product_img/3d5ada6f-d874-4665-9f49-f462f9809355_Udisk1.jpg', '/Horizon/Back_Shop/ma_product/product_img/3d5ada6f-d874-4665-9f49-f462f9809355_Udisk2.jpg', '50', '30', '品质U盘', '100', '0', '2016-12-01', '2016-12-10', '92bce0f0-4f53-4994-97b6-42a3eb7d13c8', '这是U盘这是U盘这是U盘这是U盘这是U盘这是品质U盘', '200');
INSERT INTO `product` VALUES ('45efc3d5-6751-45da-8a05-c765e430edec', '8b703084-8562-4eaa-8b07-6d7a4a32fecc', '冰箱8', '/Horizon/Back_Shop/ma_product/product_img/45efc3d5-6751-45da-8a05-c765e430edec_fridge1.jpg', '/Horizon/Back_Shop/ma_product/product_img/45efc3d5-6751-45da-8a05-c765e430edec_fridge2.jpg', '50', '30', '品质冰箱', '100', '0', '2016-12-01', '2016-12-10', 'f18d1fd2-e690-4afb-bcc1-02a81be58518', '这是冰箱这是冰箱这是冰箱这是冰箱这是冰箱这是品质冰箱', '216');
INSERT INTO `product` VALUES ('49f718ed-bc3c-4ad0-9494-ec60a4269992', '8b703084-8562-4eaa-8b07-6d7a4a32fecc', '电视机10', '/Horizon/Back_Shop/ma_product/product_img/49f718ed-bc3c-4ad0-9494-ec60a4269992_tv1.jpg', '/Horizon/Back_Shop/ma_product/product_img/49f718ed-bc3c-4ad0-9494-ec60a4269992_tv2.jpg', '1000', '960', '品质电视机', '100', '0', '2016-12-01', '2016-12-10', '7590ec11-29b3-48d4-a188-69de9e7a21e7', '这是电视机这是电视机这是电视机这是电视机这是电视机这是品质电视机', '254');
INSERT INTO `product` VALUES ('4a8017ee-c589-4468-bad6-402ae2ec610e', '8b703084-8562-4eaa-8b07-6d7a4a32fecc', '洗衣机9', '/Horizon/Back_Shop/ma_product/product_img/4a8017ee-c589-4468-bad6-402ae2ec610e_washing1.jpg', '/Horizon/Back_Shop/ma_product/product_img/4a8017ee-c589-4468-bad6-402ae2ec610e_washing2.jpg', '50', '30', '品质洗衣机', '100', '0', '2016-12-01', '2016-12-10', '160429f8-21f9-4733-8c00-e6041a4930b9', '这是洗衣机这是洗衣机这是洗衣机这是洗衣机这是洗衣机这是品质洗衣机', '235');
INSERT INTO `product` VALUES ('4cfa223d-3268-443e-871c-8161d0178c46', '8b703084-8562-4eaa-8b07-6d7a4a32fecc', '冰箱4', '/Horizon/Back_Shop/ma_product/product_img/4cfa223d-3268-443e-871c-8161d0178c46_fridge1.jpg', '/Horizon/Back_Shop/ma_product/product_img/4cfa223d-3268-443e-871c-8161d0178c46_fridge2.jpg', '50', '30', '品质冰箱', '100', '0', '2016-12-01', '2016-12-10', 'f18d1fd2-e690-4afb-bcc1-02a81be58518', '这是冰箱这是冰箱这是冰箱这是冰箱这是冰箱这是品质冰箱', '220');
INSERT INTO `product` VALUES ('4ea8a5e2-4e8e-47e2-9368-b44948b085f2', 'a0a42d69-e6e4-4072-8a0a-0777a3dac587', 'U盘6', '/Horizon/Back_Shop/ma_product/product_img/4ea8a5e2-4e8e-47e2-9368-b44948b085f2_Udisk1.jpg', '/Horizon/Back_Shop/ma_product/product_img/4ea8a5e2-4e8e-47e2-9368-b44948b085f2_Udisk2.jpg', '50', '30', '品质U盘', '100', '0', '2016-12-01', '2016-12-10', '92bce0f0-4f53-4994-97b6-42a3eb7d13c8', '这是U盘这是U盘这是U盘这是U盘这是U盘这是品质U盘', '197');
INSERT INTO `product` VALUES ('524e1daf-ff9a-4d5a-9f31-45198b790ef5', '8b703084-8562-4eaa-8b07-6d7a4a32fecc', '电视机7', '/Horizon/Back_Shop/ma_product/product_img/524e1daf-ff9a-4d5a-9f31-45198b790ef5_tv1.jpg', '/Horizon/Back_Shop/ma_product/product_img/524e1daf-ff9a-4d5a-9f31-45198b790ef5_tv2.jpg', '1000', '960', '品质电视机', '99', '1', '2016-12-01', '2016-12-10', '7590ec11-29b3-48d4-a188-69de9e7a21e7', '这是电视机这是电视机这是电视机这是电视机这是电视机这是品质电视机', '257');
INSERT INTO `product` VALUES ('54902d8a-9195-4f52-b486-e90dbefd52c6', '8b703084-8562-4eaa-8b07-6d7a4a32fecc', '冰箱3', '/Horizon/Back_Shop/ma_product/product_img/54902d8a-9195-4f52-b486-e90dbefd52c6_fridge1.jpg', '/Horizon/Back_Shop/ma_product/product_img/54902d8a-9195-4f52-b486-e90dbefd52c6_fridge2.jpg', '50', '30', '品质冰箱', '100', '0', '2016-12-01', '2016-12-10', 'f18d1fd2-e690-4afb-bcc1-02a81be58518', '这是冰箱这是冰箱这是冰箱这是冰箱这是冰箱这是品质冰箱', '221');
INSERT INTO `product` VALUES ('5772a2dd-107b-40a2-b943-9e5eedfc2011', '8b703084-8562-4eaa-8b07-6d7a4a32fecc', '洗衣机2', '/Horizon/Back_Shop/ma_product/product_img/5772a2dd-107b-40a2-b943-9e5eedfc2011_washing1.jpg', '/Horizon/Back_Shop/ma_product/product_img/5772a2dd-107b-40a2-b943-9e5eedfc2011_washing2.jpg', '50', '30', '品质洗衣机', '100', '0', '2016-12-01', '2016-12-10', '160429f8-21f9-4733-8c00-e6041a4930b9', '这是洗衣机这是洗衣机这是洗衣机这是洗衣机这是洗衣机这是品质洗衣机', '242');
INSERT INTO `product` VALUES ('62acda34-6e05-4274-9228-166e0be58df7', '8b703084-8562-4eaa-8b07-6d7a4a32fecc', '电视机19', '/Horizon/Back_Shop/ma_product/product_img/62acda34-6e05-4274-9228-166e0be58df7_tv1.jpg', '/Horizon/Back_Shop/ma_product/product_img/62acda34-6e05-4274-9228-166e0be58df7_tv2.jpg', '1000', '960', '品质电视机', '100', '0', '2016-12-01', '2016-12-10', '7590ec11-29b3-48d4-a188-69de9e7a21e7', '这是电视机这是电视机这是电视机这是电视机这是电视机这是品质电视机', '245');
INSERT INTO `product` VALUES ('63526b1d-8f32-499d-b162-a82c7c3a427d', '8b703084-8562-4eaa-8b07-6d7a4a32fecc', '洗衣机15', '/Horizon/Back_Shop/ma_product/product_img/63526b1d-8f32-499d-b162-a82c7c3a427d_washing1.jpg', '/Horizon/Back_Shop/ma_product/product_img/63526b1d-8f32-499d-b162-a82c7c3a427d_washing2.jpg', '50', '30', '品质洗衣机', '100', '0', '2016-12-01', '2016-12-10', '160429f8-21f9-4733-8c00-e6041a4930b9', '这是洗衣机这是洗衣机这是洗衣机这是洗衣机这是洗衣机这是品质洗衣机', '229');
INSERT INTO `product` VALUES ('6354f082-dffe-4708-9841-5b9103c08242', '8b703084-8562-4eaa-8b07-6d7a4a32fecc', '冰箱13', '/Horizon/Back_Shop/ma_product/product_img/6354f082-dffe-4708-9841-5b9103c08242_fridge1.jpg', '/Horizon/Back_Shop/ma_product/product_img/6354f082-dffe-4708-9841-5b9103c08242_fridge2.jpg', '50', '30', '品质冰箱', '100', '0', '2016-12-01', '2016-12-10', 'f18d1fd2-e690-4afb-bcc1-02a81be58518', '这是冰箱这是冰箱这是冰箱这是冰箱这是冰箱这是品质冰箱', '211');
INSERT INTO `product` VALUES ('651e4caa-b632-44b9-989f-f414ec4d16ff', 'a0a42d69-e6e4-4072-8a0a-0777a3dac587', 'U盘19', '/Horizon/Back_Shop/ma_product/product_img/651e4caa-b632-44b9-989f-f414ec4d16ff_Udisk1.jpg', '/Horizon/Back_Shop/ma_product/product_img/651e4caa-b632-44b9-989f-f414ec4d16ff_Udisk2.jpg', '50', '30', '品质U盘', '100', '0', '2016-12-01', '2016-12-10', '92bce0f0-4f53-4994-97b6-42a3eb7d13c8', '这是U盘这是U盘这是U盘这是U盘这是U盘这是品质U盘', '184');
INSERT INTO `product` VALUES ('6b82a3f4-8472-45f0-8513-6d0ee372b36d', 'a0a42d69-e6e4-4072-8a0a-0777a3dac587', 'U盘8', '/Horizon/Back_Shop/ma_product/product_img/6b82a3f4-8472-45f0-8513-6d0ee372b36d_Udisk1.jpg', '/Horizon/Back_Shop/ma_product/product_img/6b82a3f4-8472-45f0-8513-6d0ee372b36d_Udisk2.jpg', '50', '30', '品质U盘', '100', '0', '2016-12-01', '2016-12-10', '92bce0f0-4f53-4994-97b6-42a3eb7d13c8', '这是U盘这是U盘这是U盘这是U盘这是U盘这是品质U盘', '195');
INSERT INTO `product` VALUES ('6bd67166-566d-4fee-93d3-ff29e15cd468', 'a0a42d69-e6e4-4072-8a0a-0777a3dac587', 'U盘10', '/Horizon/Back_Shop/ma_product/product_img/6bd67166-566d-4fee-93d3-ff29e15cd468_Udisk1.jpg', '/Horizon/Back_Shop/ma_product/product_img/6bd67166-566d-4fee-93d3-ff29e15cd468_Udisk2.jpg', '50', '30', '品质U盘', '100', '0', '2016-12-01', '2016-12-10', '92bce0f0-4f53-4994-97b6-42a3eb7d13c8', '这是U盘这是U盘这是U盘这是U盘这是U盘这是品质U盘', '193');
INSERT INTO `product` VALUES ('70fb460f-9dd5-4d65-9878-00c93c6f2f5b', '8b703084-8562-4eaa-8b07-6d7a4a32fecc', '电视机5', '/Horizon/Back_Shop/ma_product/product_img/70fb460f-9dd5-4d65-9878-00c93c6f2f5b_tv1.jpg', '/Horizon/Back_Shop/ma_product/product_img/70fb460f-9dd5-4d65-9878-00c93c6f2f5b_tv2.jpg', '1000', '960', '品质电视机', '100', '0', '2016-12-01', '2016-12-10', '7590ec11-29b3-48d4-a188-69de9e7a21e7', '这是电视机这是电视机这是电视机这是电视机这是电视机这是品质电视机', '259');
INSERT INTO `product` VALUES ('726f46f0-dda2-4946-9010-8523af0d4c8f', '8b703084-8562-4eaa-8b07-6d7a4a32fecc', '电视机3', '/Horizon/Back_Shop/ma_product/product_img/726f46f0-dda2-4946-9010-8523af0d4c8f_tv1.jpg', '/Horizon/Back_Shop/ma_product/product_img/726f46f0-dda2-4946-9010-8523af0d4c8f_tv2.jpg', '1000', '960', '品质电视机', '100', '0', '2016-12-01', '2016-12-10', '7590ec11-29b3-48d4-a188-69de9e7a21e7', '这是电视机这是电视机这是电视机这是电视机这是电视机这是品质电视机', '261');
INSERT INTO `product` VALUES ('7571db66-2ec7-49c2-bffa-7d314c23d4d2', 'a0a42d69-e6e4-4072-8a0a-0777a3dac587', 'U盘11', '/Horizon/Back_Shop/ma_product/product_img/7571db66-2ec7-49c2-bffa-7d314c23d4d2_Udisk1.jpg', '/Horizon/Back_Shop/ma_product/product_img/7571db66-2ec7-49c2-bffa-7d314c23d4d2_Udisk2.jpg', '50', '30', '品质U盘', '100', '0', '2016-12-01', '2016-12-10', '92bce0f0-4f53-4994-97b6-42a3eb7d13c8', '这是U盘这是U盘这是U盘这是U盘这是U盘这是品质U盘', '192');
INSERT INTO `product` VALUES ('78cc1248-2554-4214-8207-2a53a62a2996', '8b703084-8562-4eaa-8b07-6d7a4a32fecc', '冰箱17', '/Horizon/Back_Shop/ma_product/product_img/78cc1248-2554-4214-8207-2a53a62a2996_fridge1.jpg', '/Horizon/Back_Shop/ma_product/product_img/78cc1248-2554-4214-8207-2a53a62a2996_fridge2.jpg', '50', '30', '品质冰箱', '100', '0', '2016-12-01', '2016-12-10', 'f18d1fd2-e690-4afb-bcc1-02a81be58518', '这是冰箱这是冰箱这是冰箱这是冰箱这是冰箱这是品质冰箱', '207');
INSERT INTO `product` VALUES ('7a3d307b-bf5b-450b-b800-c5c3413ef57b', '8b703084-8562-4eaa-8b07-6d7a4a32fecc', '冰箱7', '/Horizon/Back_Shop/ma_product/product_img/7a3d307b-bf5b-450b-b800-c5c3413ef57b_fridge1.jpg', '/Horizon/Back_Shop/ma_product/product_img/7a3d307b-bf5b-450b-b800-c5c3413ef57b_fridge2.jpg', '50', '30', '品质冰箱', '100', '0', '2016-12-01', '2016-12-10', 'f18d1fd2-e690-4afb-bcc1-02a81be58518', '这是冰箱这是冰箱这是冰箱这是冰箱这是冰箱这是品质冰箱', '217');
INSERT INTO `product` VALUES ('7a9e425b-3a10-4f6d-906a-8fc8d7da3f8f', '8b703084-8562-4eaa-8b07-6d7a4a32fecc', '电视机1', '/Horizon/Back_Shop/ma_product/product_img/7a9e425b-3a10-4f6d-906a-8fc8d7da3f8f_tv1.jpg', '/Horizon/Back_Shop/ma_product/product_img/7a9e425b-3a10-4f6d-906a-8fc8d7da3f8f_tv2.jpg', '1500', '1300', '品质电视机', '100', '0', '2016-12-01', '2016-12-10', '7590ec11-29b3-48d4-a188-69de9e7a21e7', '这是电视机这是电视机这是电视机这是电视机这是电视机这是品质电视机', '263');
INSERT INTO `product` VALUES ('8ee49819-25da-4723-825e-8942abf309c5', '8b703084-8562-4eaa-8b07-6d7a4a32fecc', '冰箱16', '/Horizon/Back_Shop/ma_product/product_img/8ee49819-25da-4723-825e-8942abf309c5_fridge1.jpg', '/Horizon/Back_Shop/ma_product/product_img/8ee49819-25da-4723-825e-8942abf309c5_fridge2.jpg', '50', '30', '品质冰箱', '100', '0', '2016-12-01', '2016-12-10', 'f18d1fd2-e690-4afb-bcc1-02a81be58518', '这是冰箱这是冰箱这是冰箱这是冰箱这是冰箱这是品质冰箱', '208');
INSERT INTO `product` VALUES ('8f4064de-f864-4a20-aa77-447838bb347b', '8b703084-8562-4eaa-8b07-6d7a4a32fecc', '洗衣机13', '/Horizon/Back_Shop/ma_product/product_img/8f4064de-f864-4a20-aa77-447838bb347b_washing1.jpg', '/Horizon/Back_Shop/ma_product/product_img/8f4064de-f864-4a20-aa77-447838bb347b_washing2.jpg', '50', '30', '品质洗衣机', '100', '0', '2016-12-01', '2016-12-10', '160429f8-21f9-4733-8c00-e6041a4930b9', '这是洗衣机这是洗衣机这是洗衣机这是洗衣机这是洗衣机这是品质洗衣机', '231');
INSERT INTO `product` VALUES ('91fb5c53-48aa-4a89-b7da-d7fae29e36a5', '8b703084-8562-4eaa-8b07-6d7a4a32fecc', '洗衣机7', '/Horizon/Back_Shop/ma_product/product_img/91fb5c53-48aa-4a89-b7da-d7fae29e36a5_washing1.jpg', '/Horizon/Back_Shop/ma_product/product_img/91fb5c53-48aa-4a89-b7da-d7fae29e36a5_washing2.jpg', '50', '30', '品质洗衣机', '100', '0', '2016-12-01', '2016-12-10', '160429f8-21f9-4733-8c00-e6041a4930b9', '这是洗衣机这是洗衣机这是洗衣机这是洗衣机这是洗衣机这是品质洗衣机', '237');
INSERT INTO `product` VALUES ('92962f86-5677-41f0-812f-720899a148d1', '8b703084-8562-4eaa-8b07-6d7a4a32fecc', '洗衣机16', '/Horizon/Back_Shop/ma_product/product_img/92962f86-5677-41f0-812f-720899a148d1_washing1.jpg', '/Horizon/Back_Shop/ma_product/product_img/92962f86-5677-41f0-812f-720899a148d1_washing2.jpg', '50', '30', '品质洗衣机', '100', '0', '2016-12-01', '2016-12-10', '160429f8-21f9-4733-8c00-e6041a4930b9', '这是洗衣机这是洗衣机这是洗衣机这是洗衣机这是洗衣机这是品质洗衣机', '228');
INSERT INTO `product` VALUES ('95fde079-b2bc-4968-a78a-9e6634e522c9', 'a0a42d69-e6e4-4072-8a0a-0777a3dac587', 'U盘5', '/Horizon/Back_Shop/ma_product/product_img/95fde079-b2bc-4968-a78a-9e6634e522c9_Udisk1.jpg', '/Horizon/Back_Shop/ma_product/product_img/95fde079-b2bc-4968-a78a-9e6634e522c9_Udisk2.jpg', '50', '30', '品质U盘', '100', '0', '2016-12-01', '2016-12-10', '92bce0f0-4f53-4994-97b6-42a3eb7d13c8', '这是U盘这是U盘这是U盘这是U盘这是U盘这是品质U盘', '198');
INSERT INTO `product` VALUES ('9d412616-5cb6-4da6-a9f1-86357d840ff5', '8b703084-8562-4eaa-8b07-6d7a4a32fecc', '电视机6', '/Horizon/Back_Shop/ma_product/product_img/9d412616-5cb6-4da6-a9f1-86357d840ff5_tv1.jpg', '/Horizon/Back_Shop/ma_product/product_img/9d412616-5cb6-4da6-a9f1-86357d840ff5_tv2.jpg', '1000', '960', '品质电视机', '100', '0', '2016-12-01', '2016-12-10', '7590ec11-29b3-48d4-a188-69de9e7a21e7', '这是电视机这是电视机这是电视机这是电视机这是电视机这是品质电视机', '258');
INSERT INTO `product` VALUES ('ad5d398f-3555-4415-b71a-a8bf45ed9474', '8b703084-8562-4eaa-8b07-6d7a4a32fecc', '洗衣机11', '/Horizon/Back_Shop/ma_product/product_img/ad5d398f-3555-4415-b71a-a8bf45ed9474_washing1.jpg', '/Horizon/Back_Shop/ma_product/product_img/ad5d398f-3555-4415-b71a-a8bf45ed9474_washing2.jpg', '50', '30', '品质洗衣机', '100', '0', '2016-12-01', '2016-12-10', '160429f8-21f9-4733-8c00-e6041a4930b9', '这是洗衣机这是洗衣机这是洗衣机这是洗衣机这是洗衣机这是品质洗衣机', '233');
INSERT INTO `product` VALUES ('b0b085ee-0a3f-4cb6-be4f-d3d6df320144', '8b703084-8562-4eaa-8b07-6d7a4a32fecc', '洗衣机1', '/Horizon/Back_Shop/ma_product/product_img/b0b085ee-0a3f-4cb6-be4f-d3d6df320144_washing1.jpg', '/Horizon/Back_Shop/ma_product/product_img/b0b085ee-0a3f-4cb6-be4f-d3d6df320144_washing2.jpg', '900', '800', '品质洗衣机', '100', '0', '2016-12-01', '2016-12-10', '160429f8-21f9-4733-8c00-e6041a4930b9', '这是洗衣机这是洗衣机这是洗衣机这是洗衣机这是洗衣机这是品质洗衣机', '243');
INSERT INTO `product` VALUES ('b3f69908-87ae-4a8c-84ed-3f82eb69b232', '8b703084-8562-4eaa-8b07-6d7a4a32fecc', '冰箱18', '/Horizon/Back_Shop/ma_product/product_img/b3f69908-87ae-4a8c-84ed-3f82eb69b232_fridge1.jpg', '/Horizon/Back_Shop/ma_product/product_img/b3f69908-87ae-4a8c-84ed-3f82eb69b232_fridge2.jpg', '50', '30', '品质冰箱', '100', '0', '2016-12-01', '2016-12-10', 'f18d1fd2-e690-4afb-bcc1-02a81be58518', '这是冰箱这是冰箱这是冰箱这是冰箱这是冰箱这是品质冰箱', '206');
INSERT INTO `product` VALUES ('ba63482c-307a-46ac-94d2-f31299797d59', 'a0a42d69-e6e4-4072-8a0a-0777a3dac587', 'U盘18', '/Horizon/Back_Shop/ma_product/product_img/ba63482c-307a-46ac-94d2-f31299797d59_Udisk1.jpg', '/Horizon/Back_Shop/ma_product/product_img/ba63482c-307a-46ac-94d2-f31299797d59_Udisk2.jpg', '50', '30', '品质U盘', '99', '1', '2016-12-01', '2016-12-10', '92bce0f0-4f53-4994-97b6-42a3eb7d13c8', '这是U盘这是U盘这是U盘这是U盘这是U盘这是品质U盘', '185');
INSERT INTO `product` VALUES ('bb7711e5-8241-4fe0-aeaf-c5a9f356fbbe', '8b703084-8562-4eaa-8b07-6d7a4a32fecc', '冰箱10', '/Horizon/Back_Shop/ma_product/product_img/bb7711e5-8241-4fe0-aeaf-c5a9f356fbbe_fridge1.jpg', '/Horizon/Back_Shop/ma_product/product_img/bb7711e5-8241-4fe0-aeaf-c5a9f356fbbe_fridge2.jpg', '50', '30', '品质冰箱', '100', '0', '2016-12-01', '2016-12-10', 'f18d1fd2-e690-4afb-bcc1-02a81be58518', '这是冰箱这是冰箱这是冰箱这是冰箱这是冰箱这是品质冰箱', '214');
INSERT INTO `product` VALUES ('c07d2955-2ea5-4c03-ba51-28a3f75559ca', '8b703084-8562-4eaa-8b07-6d7a4a32fecc', '电视机14', '/Horizon/Back_Shop/ma_product/product_img/c07d2955-2ea5-4c03-ba51-28a3f75559ca_tv1.jpg', '/Horizon/Back_Shop/ma_product/product_img/c07d2955-2ea5-4c03-ba51-28a3f75559ca_tv2.jpg', '1000', '960', '品质电视机', '100', '0', '2016-12-01', '2016-12-10', '7590ec11-29b3-48d4-a188-69de9e7a21e7', '这是电视机这是电视机这是电视机这是电视机这是电视机这是品质电视机', '250');
INSERT INTO `product` VALUES ('c1f2e7fb-155c-49b1-9378-2dc11588822c', '8b703084-8562-4eaa-8b07-6d7a4a32fecc', '电视机13', '/Horizon/Back_Shop/ma_product/product_img/c1f2e7fb-155c-49b1-9378-2dc11588822c_tv1.jpg', '/Horizon/Back_Shop/ma_product/product_img/c1f2e7fb-155c-49b1-9378-2dc11588822c_tv2.jpg', '1000', '960', '品质电视机', '88', '12', '2016-12-01', '2016-12-10', '7590ec11-29b3-48d4-a188-69de9e7a21e7', '这是电视机这是电视机这是电视机这是电视机这是电视机这是品质电视机', '251');
INSERT INTO `product` VALUES ('c26acb32-be94-4154-a1f2-215907d3c0a0', '8b703084-8562-4eaa-8b07-6d7a4a32fecc', '电视机2', '/Horizon/Back_Shop/ma_product/product_img/c26acb32-be94-4154-a1f2-215907d3c0a0_tv1.jpg', '/Horizon/Back_Shop/ma_product/product_img/c26acb32-be94-4154-a1f2-215907d3c0a0_tv2.jpg', '1000', '960', '品质电视机', '100', '0', '2016-12-01', '2016-12-10', '7590ec11-29b3-48d4-a188-69de9e7a21e7', '这是电视机这是电视机这是电视机这是电视机这是电视机这是品质电视机', '262');
INSERT INTO `product` VALUES ('c3d765b3-03de-4e2e-90fc-7f2ba658c2a9', '8b703084-8562-4eaa-8b07-6d7a4a32fecc', '电视机9', '/Horizon/Back_Shop/ma_product/product_img/c3d765b3-03de-4e2e-90fc-7f2ba658c2a9_tv1.jpg', '/Horizon/Back_Shop/ma_product/product_img/c3d765b3-03de-4e2e-90fc-7f2ba658c2a9_tv2.jpg', '1000', '960', '品质电视机', '100', '0', '2016-12-01', '2016-12-10', '7590ec11-29b3-48d4-a188-69de9e7a21e7', '这是电视机这是电视机这是电视机这是电视机这是电视机这是品质电视机', '255');
INSERT INTO `product` VALUES ('c7425912-d3a1-4dfc-81f5-0846dd6ab6b9', '8b703084-8562-4eaa-8b07-6d7a4a32fecc', '洗衣机4', '/Horizon/Back_Shop/ma_product/product_img/c7425912-d3a1-4dfc-81f5-0846dd6ab6b9_washing1.jpg', '/Horizon/Back_Shop/ma_product/product_img/c7425912-d3a1-4dfc-81f5-0846dd6ab6b9_washing2.jpg', '50', '30', '品质洗衣机', '100', '0', '2016-12-01', '2016-12-10', '160429f8-21f9-4733-8c00-e6041a4930b9', '这是洗衣机这是洗衣机这是洗衣机这是洗衣机这是洗衣机这是品质洗衣机', '240');
INSERT INTO `product` VALUES ('c9612fdb-e933-41f5-9d94-2269bf00b483', '8b703084-8562-4eaa-8b07-6d7a4a32fecc', '洗衣机8', '/Horizon/Back_Shop/ma_product/product_img/c9612fdb-e933-41f5-9d94-2269bf00b483_washing1.jpg', '/Horizon/Back_Shop/ma_product/product_img/c9612fdb-e933-41f5-9d94-2269bf00b483_washing2.jpg', '50', '30', '品质洗衣机', '100', '0', '2016-12-01', '2016-12-10', '160429f8-21f9-4733-8c00-e6041a4930b9', '这是洗衣机这是洗衣机这是洗衣机这是洗衣机这是洗衣机这是品质洗衣机', '236');
INSERT INTO `product` VALUES ('c9dac625-f8a2-4b97-9b55-cbf3e5c79954', '8b703084-8562-4eaa-8b07-6d7a4a32fecc', '洗衣机17', '/Horizon/Back_Shop/ma_product/product_img/c9dac625-f8a2-4b97-9b55-cbf3e5c79954_washing1.jpg', '/Horizon/Back_Shop/ma_product/product_img/c9dac625-f8a2-4b97-9b55-cbf3e5c79954_washing2.jpg', '50', '30', '品质洗衣机', '99', '1', '2016-12-01', '2016-12-10', '160429f8-21f9-4733-8c00-e6041a4930b9', '这是洗衣机这是洗衣机这是洗衣机这是洗衣机这是洗衣机这是品质洗衣机', '227');
INSERT INTO `product` VALUES ('ccf99ce1-28bb-4a7d-b1f9-9b1935a2046d', '8b703084-8562-4eaa-8b07-6d7a4a32fecc', '洗衣机19', '/Horizon/Back_Shop/ma_product/product_img/ccf99ce1-28bb-4a7d-b1f9-9b1935a2046d_washing1.jpg', '/Horizon/Back_Shop/ma_product/product_img/ccf99ce1-28bb-4a7d-b1f9-9b1935a2046d_washing2.jpg', '50', '30', '品质洗衣机', '100', '0', '2016-12-01', '2016-12-10', '160429f8-21f9-4733-8c00-e6041a4930b9', '这是洗衣机这是洗衣机这是洗衣机这是洗衣机这是洗衣机这是品质洗衣机', '225');
INSERT INTO `product` VALUES ('cd97c9b5-c776-4577-aa52-800bb504fd5f', 'a0a42d69-e6e4-4072-8a0a-0777a3dac587', 'U盘4', '/Horizon/Back_Shop/ma_product/product_img/cd97c9b5-c776-4577-aa52-800bb504fd5f_Udisk1.jpg', '/Horizon/Back_Shop/ma_product/product_img/cd97c9b5-c776-4577-aa52-800bb504fd5f_Udisk2.jpg', '50', '30', '品质U盘', '100', '0', '2016-12-01', '2016-12-10', '92bce0f0-4f53-4994-97b6-42a3eb7d13c8', '这是U盘这是U盘这是U盘这是U盘这是U盘这是品质U盘', '199');
INSERT INTO `product` VALUES ('cfb8aead-e53a-4ecf-ae37-fae250fdf0ae', '8b703084-8562-4eaa-8b07-6d7a4a32fecc', '冰箱12', '/Horizon/Back_Shop/ma_product/product_img/cfb8aead-e53a-4ecf-ae37-fae250fdf0ae_fridge1.jpg', '/Horizon/Back_Shop/ma_product/product_img/cfb8aead-e53a-4ecf-ae37-fae250fdf0ae_fridge2.jpg', '50', '30', '品质冰箱', '100', '0', '2016-12-01', '2016-12-10', 'f18d1fd2-e690-4afb-bcc1-02a81be58518', '这是冰箱这是冰箱这是冰箱这是冰箱这是冰箱这是品质冰箱', '212');
INSERT INTO `product` VALUES ('d023ee29-f386-4cd6-9e82-c467c5fef80d', '8b703084-8562-4eaa-8b07-6d7a4a32fecc', '洗衣机5', '/Horizon/Back_Shop/ma_product/product_img/d023ee29-f386-4cd6-9e82-c467c5fef80d_washing1.jpg', '/Horizon/Back_Shop/ma_product/product_img/d023ee29-f386-4cd6-9e82-c467c5fef80d_washing2.jpg', '50', '30', '品质洗衣机', '100', '0', '2016-12-01', '2016-12-10', '160429f8-21f9-4733-8c00-e6041a4930b9', '这是洗衣机这是洗衣机这是洗衣机这是洗衣机这是洗衣机这是品质洗衣机', '239');
INSERT INTO `product` VALUES ('d466f486-fbe6-44d7-9da1-048fa479aa92', '8b703084-8562-4eaa-8b07-6d7a4a32fecc', '电视机15', '/Horizon/Back_Shop/ma_product/product_img/d466f486-fbe6-44d7-9da1-048fa479aa92_tv1.jpg', '/Horizon/Back_Shop/ma_product/product_img/d466f486-fbe6-44d7-9da1-048fa479aa92_tv2.jpg', '1000', '960', '品质电视机', '100', '0', '2016-12-01', '2016-12-10', '7590ec11-29b3-48d4-a188-69de9e7a21e7', '这是电视机这是电视机这是电视机这是电视机这是电视机这是品质电视机', '249');
INSERT INTO `product` VALUES ('d52bdf44-0f5d-430e-88da-1be10504ad44', '8b703084-8562-4eaa-8b07-6d7a4a32fecc', '电视机8', '/Horizon/Back_Shop/ma_product/product_img/d52bdf44-0f5d-430e-88da-1be10504ad44_tv1.jpg', '/Horizon/Back_Shop/ma_product/product_img/d52bdf44-0f5d-430e-88da-1be10504ad44_tv2.jpg', '1000', '960', '品质电视机', '100', '0', '2016-12-01', '2016-12-10', '7590ec11-29b3-48d4-a188-69de9e7a21e7', '这是电视机这是电视机这是电视机这是电视机这是电视机这是品质电视机', '256');
INSERT INTO `product` VALUES ('dd121ab0-cedf-4a24-b8e7-4dc6ba242b8f', '8b703084-8562-4eaa-8b07-6d7a4a32fecc', '冰箱14', '/Horizon/Back_Shop/ma_product/product_img/dd121ab0-cedf-4a24-b8e7-4dc6ba242b8f_fridge1.jpg', '/Horizon/Back_Shop/ma_product/product_img/dd121ab0-cedf-4a24-b8e7-4dc6ba242b8f_fridge2.jpg', '50', '30', '品质冰箱', '100', '0', '2016-12-01', '2016-12-10', 'f18d1fd2-e690-4afb-bcc1-02a81be58518', '这是冰箱这是冰箱这是冰箱这是冰箱这是冰箱这是品质冰箱', '210');
INSERT INTO `product` VALUES ('dd834575-0add-4570-a7eb-4b5767d1dee6', '8b703084-8562-4eaa-8b07-6d7a4a32fecc', '冰箱19', '/Horizon/Back_Shop/ma_product/product_img/dd834575-0add-4570-a7eb-4b5767d1dee6_fridge1.jpg', '/Horizon/Back_Shop/ma_product/product_img/dd834575-0add-4570-a7eb-4b5767d1dee6_fridge2.jpg', '50', '30', '品质冰箱', '100', '0', '2016-12-01', '2016-12-10', 'f18d1fd2-e690-4afb-bcc1-02a81be58518', '这是冰箱这是冰箱这是冰箱这是冰箱这是冰箱这是品质冰箱', '205');
INSERT INTO `product` VALUES ('df95a7c6-35f0-4249-8ba9-de43deffd431', 'a0a42d69-e6e4-4072-8a0a-0777a3dac587', 'U盘7', '/Horizon/Back_Shop/ma_product/product_img/df95a7c6-35f0-4249-8ba9-de43deffd431_Udisk1.jpg', '/Horizon/Back_Shop/ma_product/product_img/df95a7c6-35f0-4249-8ba9-de43deffd431_Udisk2.jpg', '50', '30', '品质U盘', '100', '0', '2016-12-01', '2016-12-10', '92bce0f0-4f53-4994-97b6-42a3eb7d13c8', '这是U盘这是U盘这是U盘这是U盘这是U盘这是品质U盘', '196');
INSERT INTO `product` VALUES ('e03015e6-ad9e-439d-874f-f7751feb490d', '8b703084-8562-4eaa-8b07-6d7a4a32fecc', '电视机16', '/Horizon/Back_Shop/ma_product/product_img/e03015e6-ad9e-439d-874f-f7751feb490d_tv1.jpg', '/Horizon/Back_Shop/ma_product/product_img/e03015e6-ad9e-439d-874f-f7751feb490d_tv2.jpg', '1000', '960', '品质电视机', '100', '0', '2016-12-01', '2016-12-10', '7590ec11-29b3-48d4-a188-69de9e7a21e7', '这是电视机这是电视机这是电视机这是电视机这是电视机这是品质电视机', '248');
INSERT INTO `product` VALUES ('e7e0034e-41ba-401f-8617-7cbfb1378b92', '8b703084-8562-4eaa-8b07-6d7a4a32fecc', '冰箱9', '/Horizon/Back_Shop/ma_product/product_img/e7e0034e-41ba-401f-8617-7cbfb1378b92_fridge1.jpg', '/Horizon/Back_Shop/ma_product/product_img/e7e0034e-41ba-401f-8617-7cbfb1378b92_fridge2.jpg', '50', '30', '品质冰箱', '100', '0', '2016-12-01', '2016-12-10', 'f18d1fd2-e690-4afb-bcc1-02a81be58518', '这是冰箱这是冰箱这是冰箱这是冰箱这是冰箱这是品质冰箱', '215');
INSERT INTO `product` VALUES ('e93b1ad5-9fb3-4bcc-b788-3a35060dd42d', 'a0a42d69-e6e4-4072-8a0a-0777a3dac587', 'U盘12', '/Horizon/Back_Shop/ma_product/product_img/e93b1ad5-9fb3-4bcc-b788-3a35060dd42d_Udisk1.jpg', '/Horizon/Back_Shop/ma_product/product_img/e93b1ad5-9fb3-4bcc-b788-3a35060dd42d_Udisk2.jpg', '50', '30', '品质U盘', '100', '0', '2016-12-01', '2016-12-10', '92bce0f0-4f53-4994-97b6-42a3eb7d13c8', '这是U盘这是U盘这是U盘这是U盘这是U盘这是品质U盘', '191');
INSERT INTO `product` VALUES ('e9d43e3e-b5ca-4025-aa68-c3518aed876a', '8b703084-8562-4eaa-8b07-6d7a4a32fecc', '电视机18', '/Horizon/Back_Shop/ma_product/product_img/e9d43e3e-b5ca-4025-aa68-c3518aed876a_tv1.jpg', '/Horizon/Back_Shop/ma_product/product_img/e9d43e3e-b5ca-4025-aa68-c3518aed876a_tv2.jpg', '1000', '960', '品质电视机', '98', '2', '2016-12-01', '2016-12-10', '7590ec11-29b3-48d4-a188-69de9e7a21e7', '这是电视机这是电视机这是电视机这是电视机这是电视机这是品质电视机', '246');
INSERT INTO `product` VALUES ('edd6b0b2-e40e-4c37-8a42-b6b2aad1a238', 'a0a42d69-e6e4-4072-8a0a-0777a3dac587', 'U盘17', '/Horizon/Back_Shop/ma_product/product_img/edd6b0b2-e40e-4c37-8a42-b6b2aad1a238_Udisk1.jpg', '/Horizon/Back_Shop/ma_product/product_img/edd6b0b2-e40e-4c37-8a42-b6b2aad1a238_Udisk2.jpg', '50', '30', '品质U盘', '100', '0', '2016-12-01', '2016-12-10', '92bce0f0-4f53-4994-97b6-42a3eb7d13c8', '这是U盘这是U盘这是U盘这是U盘这是U盘这是品质U盘', '186');
INSERT INTO `product` VALUES ('eea97a5d-d6a4-4206-867e-568614774c26', 'a0a42d69-e6e4-4072-8a0a-0777a3dac587', 'U盘9', '/Horizon/Back_Shop/ma_product/product_img/eea97a5d-d6a4-4206-867e-568614774c26_Udisk1.jpg', '/Horizon/Back_Shop/ma_product/product_img/eea97a5d-d6a4-4206-867e-568614774c26_Udisk2.jpg', '50', '30', '品质U盘', '100', '0', '2016-12-01', '2016-12-10', '92bce0f0-4f53-4994-97b6-42a3eb7d13c8', '这是U盘这是U盘这是U盘这是U盘这是U盘这是品质U盘', '194');
INSERT INTO `product` VALUES ('ef88e635-bb15-4991-89d2-e73ebf8dec86', '8b703084-8562-4eaa-8b07-6d7a4a32fecc', '洗衣机6', '/Horizon/Back_Shop/ma_product/product_img/ef88e635-bb15-4991-89d2-e73ebf8dec86_washing1.jpg', '/Horizon/Back_Shop/ma_product/product_img/ef88e635-bb15-4991-89d2-e73ebf8dec86_washing2.jpg', '50', '30', '品质洗衣机', '100', '0', '2016-12-01', '2016-12-10', '160429f8-21f9-4733-8c00-e6041a4930b9', '这是洗衣机这是洗衣机这是洗衣机这是洗衣机这是洗衣机这是品质洗衣机', '238');
INSERT INTO `product` VALUES ('f6368cf4-3cb8-4dec-b911-a2b4f2087b1e', '8b703084-8562-4eaa-8b07-6d7a4a32fecc', '冰箱20', '/Horizon/Back_Shop/ma_product/product_img/f6368cf4-3cb8-4dec-b911-a2b4f2087b1e_fridge1.jpg', '/Horizon/Back_Shop/ma_product/product_img/f6368cf4-3cb8-4dec-b911-a2b4f2087b1e_fridge2.jpg', '1600', '1500', '品质冰箱', '100', '0', '2016-12-01', '2016-12-10', 'f18d1fd2-e690-4afb-bcc1-02a81be58518', '这是冰箱这是冰箱这是冰箱这是冰箱这是冰箱这是品质冰箱', '204');
INSERT INTO `product` VALUES ('f8c3cb99-5416-4e34-b24e-8cc1b0c0a0a7', '8b703084-8562-4eaa-8b07-6d7a4a32fecc', '电视机17', '/Horizon/Back_Shop/ma_product/product_img/f8c3cb99-5416-4e34-b24e-8cc1b0c0a0a7_tv1.jpg', '/Horizon/Back_Shop/ma_product/product_img/f8c3cb99-5416-4e34-b24e-8cc1b0c0a0a7_tv2.jpg', '1000', '960', '品质电视机', '100', '0', '2016-12-01', '2016-12-10', '7590ec11-29b3-48d4-a188-69de9e7a21e7', '这是电视机这是电视机这是电视机这是电视机这是电视机这是品质电视机', '247');
INSERT INTO `product` VALUES ('f95ae558-e01d-4660-8500-636964efc8d2', 'a0a42d69-e6e4-4072-8a0a-0777a3dac587', 'U盘15', '/Horizon/Back_Shop/ma_product/product_img/f95ae558-e01d-4660-8500-636964efc8d2_Udisk1.jpg', '/Horizon/Back_Shop/ma_product/product_img/f95ae558-e01d-4660-8500-636964efc8d2_Udisk2.jpg', '50', '30', '品质U盘', '100', '0', '2016-12-01', '2016-12-10', '92bce0f0-4f53-4994-97b6-42a3eb7d13c8', '这是U盘这是U盘这是U盘这是U盘这是U盘这是品质U盘', '188');
INSERT INTO `product` VALUES ('fcebe950-d200-40b4-aa77-6b0bc1055057', 'a0a42d69-e6e4-4072-8a0a-0777a3dac587', 'U盘13', '/Horizon/Back_Shop/ma_product/product_img/fcebe950-d200-40b4-aa77-6b0bc1055057_Udisk1.jpg', '/Horizon/Back_Shop/ma_product/product_img/fcebe950-d200-40b4-aa77-6b0bc1055057_Udisk2.jpg', '50', '30', '品质U盘', '100', '0', '2016-12-01', '2016-12-10', '92bce0f0-4f53-4994-97b6-42a3eb7d13c8', '这是U盘这是U盘这是U盘这是U盘这是U盘这是品质U盘', '190');

-- ----------------------------
-- Table structure for `shop`
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
INSERT INTO `shop` VALUES ('8b703084-8562-4eaa-8b07-6d7a4a32fecc', 'qwe', '李四的店铺', '日常家电', '这是李四的店铺李四的店铺', '1', '0', '1', '李四', '123312367867', '发货地址发货地址地址', '123123');
INSERT INTO `shop` VALUES ('a0a42d69-e6e4-4072-8a0a-0777a3dac587', '123', '123的小店铺', '电脑耗材', '这是我的123店铺，出售商品包括各种常用电脑配件', '2', '1', '0', '张三', '12312312312', '发货地址发货地址发货地址', '123123');

-- ----------------------------
-- Table structure for `shopverify`
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
INSERT INTO `shopverify` VALUES ('123', '姓名', '1234567889123456789', '常用地址常用地址常用地址地址常用地址', '3232123123123', '开户开户开户银行', '67867867867867876876878', '1', null, '0');
INSERT INTO `shopverify` VALUES ('qwe', '李四', '987654321123456789', '常用地址常用地址常用地址123', '12312312321123', '银行银行银行银行银行银行', '12121212121212121212121212', '1', null, '0');

-- ----------------------------
-- Table structure for `user`
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
INSERT INTO `user` VALUES ('87BFD27805F44F44BBAAF60BD6013164', '123', '123', '123@123.com', '12312312312', '我的地址我的地址我的地址');
INSERT INTO `user` VALUES ('BFD8727805FBAAF3B44F4416460BD601', 'qwe', 'qwe', 'qwe@qwe.com', '12331236786', '地址地址qwe地址');
INSERT INTO `user` VALUES ('F9FFBE742CA24987AA5285B8C8E7991D', '789', '789', '789@789.com', '78787878788', '789地址地址地址地址地址');

-- ----------------------------
-- View structure for `ordernumview`
-- ----------------------------
DROP VIEW IF EXISTS `ordernumview`;
CREATE ALGORITHM=UNDEFINED DEFINER=`skip-grants user`@`skip-grants host` SQL SECURITY DEFINER VIEW `ordernumview` AS select `order`.`uid` AS `uid`,count(`order`.`oid`) AS `orderNum` from `order` group by `order`.`uid` ;

-- ----------------------------
-- View structure for `trans_record`
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
