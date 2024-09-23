/*
 Navicat Premium Dump SQL

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80039 (8.0.39)
 Source Host           : localhost:3306
 Source Schema         : studentms

 Target Server Type    : MySQL
 Target Server Version : 80039 (8.0.39)
 File Encoding         : 65001

 Date: 23/09/2024 20:17:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for c
-- ----------------------------
DROP TABLE IF EXISTS `c`;
CREATE TABLE `c`  (
  `cid` int NOT NULL AUTO_INCREMENT,
  `cname` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ccredit` tinyint NULL DEFAULT NULL,
  PRIMARY KEY (`cid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of c
-- ----------------------------
INSERT INTO `c` VALUES (7, '数据结构', 6);
INSERT INTO `c` VALUES (8, '组合数学', 3);
INSERT INTO `c` VALUES (9, '计算机网络', 5);
INSERT INTO `c` VALUES (10, '计算机组成原理', 5);
INSERT INTO `c` VALUES (11, 'RJC教你做选课系统', 10);

-- ----------------------------
-- Table structure for ct
-- ----------------------------
DROP TABLE IF EXISTS `ct`;
CREATE TABLE `ct`  (
  `ctid` int NOT NULL AUTO_INCREMENT,
  `cid` int NULL DEFAULT NULL,
  `tid` int NULL DEFAULT NULL,
  `term` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`ctid`) USING BTREE,
  INDEX `cid`(`cid` ASC) USING BTREE,
  INDEX `tid`(`tid` ASC) USING BTREE,
  CONSTRAINT `ct_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `c` (`cid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ct_ibfk_2` FOREIGN KEY (`tid`) REFERENCES `t` (`tid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ct
-- ----------------------------
INSERT INTO `ct` VALUES (5, 8, 4, '22-春季学期');
INSERT INTO `ct` VALUES (6, 7, 4, '22-春季学期');
INSERT INTO `ct` VALUES (7, 10, 13, '22-春季学期');
INSERT INTO `ct` VALUES (8, 9, 13, '22-春季学期');
INSERT INTO `ct` VALUES (9, 11, 4, '22-春季学期');

-- ----------------------------
-- Table structure for s
-- ----------------------------
DROP TABLE IF EXISTS `s`;
CREATE TABLE `s`  (
  `sid` int NOT NULL AUTO_INCREMENT,
  `sname` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`sid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s
-- ----------------------------
INSERT INTO `s` VALUES (1, '阮健乘', '1234');
INSERT INTO `s` VALUES (2, '张四', '123');
INSERT INTO `s` VALUES (3, '李四', '1234');
INSERT INTO `s` VALUES (4, '彭昊辉', '123456');
INSERT INTO `s` VALUES (6, '林春霞', '123');
INSERT INTO `s` VALUES (7, '董一超', '12345');
INSERT INTO `s` VALUES (8, '董超', '123');
INSERT INTO `s` VALUES (9, '张千', '10086');
INSERT INTO `s` VALUES (10, '李万', '10085');
INSERT INTO `s` VALUES (14, '薇尔莉特', '123');
INSERT INTO `s` VALUES (21, '庄亮', '123');
INSERT INTO `s` VALUES (22, '钟平', '1234');
INSERT INTO `s` VALUES (23, '李煜豪', '123');

-- ----------------------------
-- Table structure for sct
-- ----------------------------
DROP TABLE IF EXISTS `sct`;
CREATE TABLE `sct`  (
  `sctid` int NOT NULL AUTO_INCREMENT,
  `sid` int NULL DEFAULT NULL,
  `cid` int NULL DEFAULT NULL,
  `tid` int NULL DEFAULT NULL,
  `grade` float NULL DEFAULT NULL,
  `term` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sctid`) USING BTREE,
  INDEX `sid`(`sid` ASC) USING BTREE,
  INDEX `tid`(`tid` ASC) USING BTREE,
  INDEX `cid`(`cid` ASC) USING BTREE,
  CONSTRAINT `sct_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `s` (`sid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sct_ibfk_2` FOREIGN KEY (`tid`) REFERENCES `ct` (`tid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sct_ibfk_3` FOREIGN KEY (`cid`) REFERENCES `ct` (`cid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sct
-- ----------------------------
INSERT INTO `sct` VALUES (10, 2, 8, 4, 1, '22-春季学期');
INSERT INTO `sct` VALUES (11, 2, 10, 13, NULL, '22-春季学期');
INSERT INTO `sct` VALUES (12, 2, 7, 4, NULL, '22-春季学期');
INSERT INTO `sct` VALUES (13, 4, 8, 4, 10, '22-春季学期');
INSERT INTO `sct` VALUES (14, 4, 7, 4, NULL, '22-春季学期');
INSERT INTO `sct` VALUES (15, 4, 10, 13, NULL, '22-春季学期');

-- ----------------------------
-- Table structure for situation
-- ----------------------------
DROP TABLE IF EXISTS `situation`;
CREATE TABLE `situation`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `topic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `time` datetime NOT NULL,
  `param` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of situation
-- ----------------------------
INSERT INTO `situation` VALUES (1, '温度', '2024-09-20 19:07:26', 100);
INSERT INTO `situation` VALUES (2, '湿度', '2024-08-22 19:07:42', 100);
INSERT INTO `situation` VALUES (3, '温度', '2019-01-01 00:00:00', 100000);
INSERT INTO `situation` VALUES (4, '温度', '2019-01-01 00:00:00', 100000);
INSERT INTO `situation` VALUES (5, '温度', '2019-01-01 00:00:00', 100000);
INSERT INTO `situation` VALUES (6, '温度', '2019-01-01 00:00:00', 100000);
INSERT INTO `situation` VALUES (7, '温度', '2019-01-01 00:00:00', 10);
INSERT INTO `situation` VALUES (8, '温度', '2019-01-01 00:00:00', 10000);
INSERT INTO `situation` VALUES (9, '温度', '2019-01-01 00:00:00', 10000);
INSERT INTO `situation` VALUES (10, '温度', '2019-01-01 00:00:00', 10);
INSERT INTO `situation` VALUES (11, '温度', '2019-01-01 00:00:00', 10);
INSERT INTO `situation` VALUES (12, '温度', '2019-01-01 00:00:00', 10);
INSERT INTO `situation` VALUES (13, '温度', '2019-01-01 00:00:00', 10);
INSERT INTO `situation` VALUES (14, '温度', '2019-01-01 00:00:00', 10);
INSERT INTO `situation` VALUES (15, '温度', '2019-01-01 00:00:00', 10);
INSERT INTO `situation` VALUES (16, '温度', '2019-01-01 00:00:00', 10);
INSERT INTO `situation` VALUES (17, '温度', '2019-01-01 00:00:00', 10);
INSERT INTO `situation` VALUES (18, '温度', '2019-01-01 00:00:00', 10);
INSERT INTO `situation` VALUES (19, '温度', '2019-01-01 00:00:00', 10);
INSERT INTO `situation` VALUES (20, '温度', '2019-01-01 00:00:00', 10);
INSERT INTO `situation` VALUES (21, '温度', '2019-01-01 00:00:00', 10);
INSERT INTO `situation` VALUES (22, '温度', '2019-01-01 00:00:00', 10);
INSERT INTO `situation` VALUES (23, '温度', '2019-01-01 00:00:00', 10);
INSERT INTO `situation` VALUES (24, '温度', '2019-01-01 00:00:00', 10);
INSERT INTO `situation` VALUES (25, '温度', '2019-01-01 00:00:00', 10);
INSERT INTO `situation` VALUES (26, '温度', '2019-01-01 00:00:00', 10);
INSERT INTO `situation` VALUES (27, '温度', '2019-01-01 00:00:00', 10);
INSERT INTO `situation` VALUES (28, '温度', '2019-01-01 00:00:00', 10);
INSERT INTO `situation` VALUES (29, '温度', '2019-01-01 00:00:00', 10);
INSERT INTO `situation` VALUES (30, '温度', '2019-01-01 00:00:00', 10);
INSERT INTO `situation` VALUES (31, '温度', '2019-01-01 00:00:00', 10);
INSERT INTO `situation` VALUES (32, '温度', '2019-01-01 00:00:00', 1000);
INSERT INTO `situation` VALUES (33, '温度', '2019-01-01 00:00:00', 10);
INSERT INTO `situation` VALUES (34, '温度', '2019-01-01 00:00:00', 10);
INSERT INTO `situation` VALUES (35, '温度', '2019-01-01 00:00:00', 10);
INSERT INTO `situation` VALUES (36, '温度', '2019-01-01 00:00:00', 10);
INSERT INTO `situation` VALUES (37, '温度', '2019-01-01 00:00:00', 10);
INSERT INTO `situation` VALUES (38, '温度', '2019-01-01 00:00:00', 10);
INSERT INTO `situation` VALUES (39, '温度', '2019-01-01 00:00:00', 1000);
INSERT INTO `situation` VALUES (40, '温度', '2019-01-01 00:00:00', 1000);
INSERT INTO `situation` VALUES (41, '温度', '2019-01-01 00:00:00', 10);

-- ----------------------------
-- Table structure for t
-- ----------------------------
DROP TABLE IF EXISTS `t`;
CREATE TABLE `t`  (
  `tid` int NOT NULL AUTO_INCREMENT,
  `tname` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`tid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t
-- ----------------------------
INSERT INTO `t` VALUES (4, '李玉民', '123');
INSERT INTO `t` VALUES (6, 'admin', '123');
INSERT INTO `t` VALUES (13, '张三', '123');

-- ----------------------------
-- Table structure for type_m
-- ----------------------------
DROP TABLE IF EXISTS `type_m`;
CREATE TABLE `type_m`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `up` int NOT NULL,
  `down` int NOT NULL,
  `topic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of type_m
-- ----------------------------
INSERT INTO `type_m` VALUES (1, '温度', 70, 0, 'psl/temperature');
INSERT INTO `type_m` VALUES (2, '湿度', 100, 40, 'psl/wet');

-- ----------------------------
-- Table structure for warning
-- ----------------------------
DROP TABLE IF EXISTS `warning`;
CREATE TABLE `warning`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `topic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `time` datetime NOT NULL,
  `param` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of warning
-- ----------------------------
INSERT INTO `warning` VALUES (1, '温度', '2024-09-17 18:26:06', 100);
INSERT INTO `warning` VALUES (2, '温度', '2024-09-13 19:08:23', 19);
INSERT INTO `warning` VALUES (3, '温度', '2019-01-01 00:00:00', 100000);
INSERT INTO `warning` VALUES (4, '温度', '2019-01-01 00:00:00', 100000);
INSERT INTO `warning` VALUES (5, '温度', '2019-01-01 00:00:00', 100000);
INSERT INTO `warning` VALUES (6, '温度', '2019-01-01 00:00:00', 10000);
INSERT INTO `warning` VALUES (7, '温度', '2019-01-01 00:00:00', 10);
INSERT INTO `warning` VALUES (8, '温度', '2019-01-01 00:00:00', 10);
INSERT INTO `warning` VALUES (9, '温度', '2019-01-01 00:00:00', 10);
INSERT INTO `warning` VALUES (10, '温度', '2019-01-01 00:00:00', 10);
INSERT INTO `warning` VALUES (11, '温度', '2019-01-01 00:00:00', 10);
INSERT INTO `warning` VALUES (12, '温度', '2019-01-01 00:00:00', 10);
INSERT INTO `warning` VALUES (13, '温度', '2019-01-01 00:00:00', 1000);
INSERT INTO `warning` VALUES (14, '温度', '2019-01-01 00:00:00', 10);
INSERT INTO `warning` VALUES (15, '温度', '2019-01-01 00:00:00', 10);
INSERT INTO `warning` VALUES (16, '温度', '2019-01-01 00:00:00', 10);
INSERT INTO `warning` VALUES (17, '温度', '2019-01-01 00:00:00', 10);
INSERT INTO `warning` VALUES (18, '温度', '2019-01-01 00:00:00', 1000);

SET FOREIGN_KEY_CHECKS = 1;
