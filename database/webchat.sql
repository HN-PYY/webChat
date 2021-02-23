/*
 Navicat Premium Data Transfer

 Source Server         : xiangmu
 Source Server Type    : MySQL
 Source Server Version : 50530
 Source Host           : localhost:3306
 Source Schema         : webchat

 Target Server Type    : MySQL
 Target Server Version : 50530
 File Encoding         : 65001

 Date: 23/02/2021 18:36:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for 123__id_record
-- ----------------------------
DROP TABLE IF EXISTS `123__id_record`;
CREATE TABLE `123__id_record`  (
  `record_id` int(255) NOT NULL COMMENT '单条聊天记录的id',
  `from_email` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '消息来源',
  `record_date` datetime NOT NULL COMMENT '消息时间',
  `record_content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '消息内容',
  PRIMARY KEY (`record_id`) USING BTREE,
  INDEX `pk_emailss`(`from_email`) USING BTREE,
  CONSTRAINT `pk_emailss` FOREIGN KEY (`from_email`) REFERENCES `123_id_member` (`email`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of 123__id_record
-- ----------------------------

-- ----------------------------
-- Table structure for 123_id_member
-- ----------------------------
DROP TABLE IF EXISTS `123_id_member`;
CREATE TABLE `123_id_member`  (
  `email` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '群成员的email',
  `position` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '群职务',
  `join_date` datetime NOT NULL COMMENT '进群时间',
  PRIMARY KEY (`email`) USING BTREE,
  CONSTRAINT `pk_emails` FOREIGN KEY (`email`) REFERENCES `user_basic` (`user_email`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of 123_id_member
-- ----------------------------

-- ----------------------------
-- Table structure for 3118557515@qq.com_contacts
-- ----------------------------
DROP TABLE IF EXISTS `3118557515@qq.com_contacts`;
CREATE TABLE `3118557515@qq.com_contacts`  (
  `contacts_remarks` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人备注',
  `contacts_email` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系人邮箱',
  PRIMARY KEY (`contacts_email`) USING BTREE,
  CONSTRAINT `pk_email` FOREIGN KEY (`contacts_email`) REFERENCES `user_basic` (`user_email`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of 3118557515@qq.com_contacts
-- ----------------------------

-- ----------------------------
-- Table structure for 3118557515@qq.com_group
-- ----------------------------
DROP TABLE IF EXISTS `3118557515@qq.com_group`;
CREATE TABLE `3118557515@qq.com_group`  (
  `group_id` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '群号',
  PRIMARY KEY (`group_id`) USING BTREE,
  CONSTRAINT `pk_emailsss` FOREIGN KEY (`group_id`) REFERENCES `group` (`group_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of 3118557515@qq.com_group
-- ----------------------------

-- ----------------------------
-- Table structure for 3118557515@qq.com_single_record
-- ----------------------------
DROP TABLE IF EXISTS `3118557515@qq.com_single_record`;
CREATE TABLE `3118557515@qq.com_single_record`  (
  `record_id` int(255) NOT NULL COMMENT '单条聊天记录的id',
  `from_email` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '消息来源',
  `to_email` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '消息去向',
  `record_date` datetime NOT NULL COMMENT '消息时间',
  `record_content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '消息内容',
  PRIMARY KEY (`record_id`) USING BTREE,
  INDEX `pk_from`(`from_email`) USING BTREE,
  INDEX `pk_to`(`to_email`) USING BTREE,
  CONSTRAINT `pk_from` FOREIGN KEY (`from_email`) REFERENCES `user_basic` (`user_email`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `pk_to` FOREIGN KEY (`to_email`) REFERENCES `user_basic` (`user_email`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of 3118557515@qq.com_single_record
-- ----------------------------

-- ----------------------------
-- Table structure for group
-- ----------------------------
DROP TABLE IF EXISTS `group`;
CREATE TABLE `group`  (
  `group_id` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '群号',
  `group_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '群名',
  `group_introduce` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '群简介',
  PRIMARY KEY (`group_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of group
-- ----------------------------
INSERT INTO `group` VALUES ('123', '测试群名', '没啥简介');

-- ----------------------------
-- Table structure for user_basic
-- ----------------------------
DROP TABLE IF EXISTS `user_basic`;
CREATE TABLE `user_basic`  (
  `user_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `user_email` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户邮箱',
  `user_psw` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户密码',
  PRIMARY KEY (`user_email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_basic
-- ----------------------------
INSERT INTO `user_basic` VALUES ('万里扬', '123321@qq.com', '123123');
INSERT INTO `user_basic` VALUES ('肖记超', '3118557515@qq.com', '123123');

-- ----------------------------
-- Table structure for user_detailed
-- ----------------------------
DROP TABLE IF EXISTS `user_detailed`;
CREATE TABLE `user_detailed`  (
  `user_email` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户邮箱',
  `user_headPhoto` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户头像',
  `user_address` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户地址',
  `user_personalMessage` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户个签',
  `user_phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户手机号',
  PRIMARY KEY (`user_email`) USING BTREE,
  CONSTRAINT `pk_user_email` FOREIGN KEY (`user_email`) REFERENCES `user_basic` (`user_email`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_detailed
-- ----------------------------
INSERT INTO `user_detailed` VALUES ('3118557515@qq.com', 'dfk', '湖南生物机电职业技术学院', '这个人很懒,什么也没留下~', '17674329745');

SET FOREIGN_KEY_CHECKS = 1;
