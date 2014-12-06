/*
Navicat MySQL Data Transfer

Source Server         : 转赚
Source Server Version : 50520
Source Host           : localhost:3308
Source Database       : cmsdb

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2014-12-06 23:35:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for dict_type
-- ----------------------------
DROP TABLE IF EXISTS `dict_type`;
CREATE TABLE `dict_type` (
  `id` varchar(255) NOT NULL,
  `treeid` varchar(255) NOT NULL COMMENT '字典表类型',
  `name` varchar(255) DEFAULT NULL COMMENT '字典表名称',
  `des` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dict_type
-- ----------------------------
INSERT INTO `dict_type` VALUES ('12334', 'Sex', '性别', '性别');
INSERT INTO `dict_type` VALUES ('12345678', 'region', '区域', '行政区域');
INSERT INTO `dict_type` VALUES ('234567890', 'dangerous', '风险', '风险');
