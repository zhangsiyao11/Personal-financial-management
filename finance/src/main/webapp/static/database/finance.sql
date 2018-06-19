/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50715
Source Host           : localhost:3306
Source Database       : finance

Target Server Type    : MYSQL
Target Server Version : 50715
File Encoding         : 65001

Date: 2018-05-01 18:08:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `incomeinfo`
-- ----------------------------
DROP TABLE IF EXISTS `incomeinfo`;
CREATE TABLE `incomeinfo` (
  `incomeid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '用户名',
  `date` date NOT NULL COMMENT '收支日期',
  `money` int(11) NOT NULL COMMENT '收支金额',
  `note` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`incomeid`),
  KEY `username` (`username`),
  CONSTRAINT `u-i` FOREIGN KEY (`username`) REFERENCES `userinfo` (`username`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of incomeinfo
-- ----------------------------
INSERT INTO `incomeinfo` VALUES ('20', 'lishang@pfg.com', '2018-01-15', '15000', '工资');
INSERT INTO `incomeinfo` VALUES ('21', 'lishang@pfg.com', '2018-04-15', '15000', '工资');
INSERT INTO `incomeinfo` VALUES ('22', 'lishang@pfg.com', '2018-04-12', '30000', '基金');
INSERT INTO `incomeinfo` VALUES ('25', 'lishang@pfg.com', '2018-04-06', '500', '兼职');

-- ----------------------------
-- Table structure for `spendinfo`
-- ----------------------------
DROP TABLE IF EXISTS `spendinfo`;
CREATE TABLE `spendinfo` (
  `spendid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '用户名',
  `date` date NOT NULL COMMENT '消费日期',
  `species` tinytext CHARACTER SET utf8 NOT NULL COMMENT '消费种类',
  `money` int(11) NOT NULL COMMENT '消费金额',
  `note` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`spendid`),
  KEY `username` (`username`),
  CONSTRAINT `u-s` FOREIGN KEY (`username`) REFERENCES `userinfo` (`username`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of spendinfo
-- ----------------------------
INSERT INTO `spendinfo` VALUES ('3', 'lishang@pfg.com', '2018-02-04', '衣着', '400', '外套');
INSERT INTO `spendinfo` VALUES ('4', 'lishang@pfg.com', '2018-04-20', '医疗', '300', '药品');
INSERT INTO `spendinfo` VALUES ('5', 'lishang@pfg.com', '2018-03-12', '理财', '5000', '证券');
INSERT INTO `spendinfo` VALUES ('6', 'lishang@pfg.com', '2018-04-13', '教育', '200', '买书');
INSERT INTO `spendinfo` VALUES ('7', 'lishang@pfg.com', '2017-10-18', '娱乐', '280', '游乐场');
INSERT INTO `spendinfo` VALUES ('8', 'tiantian@pfg.com', '2017-11-14', '教育', '500', '培训');
INSERT INTO `spendinfo` VALUES ('9', 'tiantian@pfg.com', '2018-01-15', '衣着', '750', '衣服');
INSERT INTO `spendinfo` VALUES ('10', 'tiantian@pfg.com', '2017-10-23', '食品', '150', '零食');
INSERT INTO `spendinfo` VALUES ('11', 'lishang@pfg.com', '2018-02-20', '其它', '200', '公益');
INSERT INTO `spendinfo` VALUES ('12', 'lufei11@pfg.com', '2018-04-03', '衣着', '500', '衣服');
INSERT INTO `spendinfo` VALUES ('13', 'lufei11@pfg.com', '2018-03-05', '医疗', '200', '看病');
INSERT INTO `spendinfo` VALUES ('14', 'zhangwei@pfg.com', '2018-04-09', '食品', '1500', '请客');
INSERT INTO `spendinfo` VALUES ('15', 'zhangwei@pfg.com', '2017-06-28', '娱乐', '700', '打球');

-- ----------------------------
-- Table structure for `userinfo`
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `username` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '用户名',
  `password` char(16) NOT NULL COMMENT '密码',
  `realname` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '真实姓名',
  `age` char(3) DEFAULT NULL COMMENT '年龄',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `phone` char(11) DEFAULT NULL COMMENT '电话',
  `money` int(11) DEFAULT NULL COMMENT '金额',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES ('lishang@pfg.com', 'abcdefg12345', '离殇', '27', 'lishang@163.com', '18293467856', null);
INSERT INTO `userinfo` VALUES ('lufei11@pfg.com', 'lufei12345', '路菲', '22', 'lufei@163.com', '15389276543', null);
INSERT INTO `userinfo` VALUES ('tiantian@pfg.com', 'ztt0924', '张田田', '19', '14657627@qq.com', '18292183104', '30000');
INSERT INTO `userinfo` VALUES ('zhangwei@pfg.com', 'zw0821', '张伟', '30', '64382864@qq.com', '13278365787', null);
