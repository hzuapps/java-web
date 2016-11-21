/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50632
Source Host           : localhost:3306
Source Database       : text

Target Server Type    : MYSQL
Target Server Version : 50632
File Encoding         : 65001

Date: 2016-11-21 10:55:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for shop
-- ----------------------------
DROP TABLE IF EXISTS `shop`;
CREATE TABLE `shop` (
  `shop_name` varchar(100) NOT NULL,
  `shop_id` varchar(255) NOT NULL,
  `price` varchar(50) NOT NULL,
  `descript` tinytext,
  `picture` mediumblob NOT NULL,
  `num` int(11) NOT NULL,
  `brand` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`shop_name`),
  KEY `shop_id` (`shop_id`),
  CONSTRAINT `shop_ibfk_1` FOREIGN KEY (`shop_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('123@qq.com', '123');
