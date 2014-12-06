/*
Navicat MySQL Data Transfer

Source Server         : 转赚
Source Server Version : 50520
Source Host           : localhost:3308
Source Database       : cmsdb

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2014-12-06 23:35:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for dict_data
-- ----------------------------
DROP TABLE IF EXISTS `dict_data`;
CREATE TABLE `dict_data` (
  `treeid` varchar(255) DEFAULT NULL COMMENT '字典类型',
  `nodeid` varchar(255) DEFAULT NULL,
  `parentnodeid` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL COMMENT '数据值',
  `orders` int(16) DEFAULT NULL,
  `data1` varchar(255) DEFAULT NULL,
  `data2` varchar(255) DEFAULT NULL,
  `data3` varchar(255) DEFAULT NULL,
  `id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `treeid` (`treeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dict_data
-- ----------------------------
INSERT INTO `dict_data` VALUES ('region', 'region10', '', '100', '1', '钦州市', null, null, '12333');
INSERT INTO `dict_data` VALUES ('region', 'region20', 'region10', '200', '2', '钦南', null, null, '12345');
INSERT INTO `dict_data` VALUES ('Sex', 'Sex002', null, '1', null, '男', null, null, '14120616004357730633');
INSERT INTO `dict_data` VALUES ('dangerous', 'dangerous10', '', '100', '0', '隐患类型', null, null, '334566');
INSERT INTO `dict_data` VALUES ('dangerous', 'dangerous20', 'dangerous10', '200', '2', '隐患风险', null, null, '345678');
INSERT INTO `dict_data` VALUES ('dangerous', 'dangerous30', 'dangerous10', '300', '1', '自然风险', null, null, '67890');
