/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : localhost:3306
 Source Schema         : ceshuju

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 25/06/2021 23:56:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for assess
-- ----------------------------
DROP TABLE IF EXISTS `assess`;
CREATE TABLE `assess`  (
  `assessid` int(11) NOT NULL AUTO_INCREMENT,
  `a1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `a2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `a3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `a4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `b1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `b2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `b3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `b4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `c1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `c2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `c3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `c4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`assessid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of assess
-- ----------------------------
INSERT INTO `assess` VALUES (1, '射门', '盘带', '跑动', '积极', '上抢', '断球', '拦截', '抢断', '打卡', '认真', '团队交流', '热情', '未启用', '无');
INSERT INTO `assess` VALUES (12, '抢点', '射门', '防守', '球路判断', '护球', '围抢', '关键接应', '战术犯规', '打卡', '更衣室氛围', '活跃气氛', '核心', '已启用', '无');

-- ----------------------------
-- Table structure for assesscoach
-- ----------------------------
DROP TABLE IF EXISTS `assesscoach`;
CREATE TABLE `assesscoach`  (
  `assesscoachid` int(11) NOT NULL,
  `coach` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`assesscoachid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of assesscoach
-- ----------------------------
INSERT INTO `assesscoach` VALUES (1, '116,117,118,120');

-- ----------------------------
-- Table structure for assessment
-- ----------------------------
DROP TABLE IF EXISTS `assessment`;
CREATE TABLE `assessment`  (
  `assessmentid` int(11) NOT NULL AUTO_INCREMENT,
  `tuserid` int(11) NULL DEFAULT NULL,
  `attack` int(255) NULL DEFAULT NULL,
  `defense` int(255) NULL DEFAULT NULL,
  `quality` int(255) NULL DEFAULT NULL,
  `total` int(255) NULL DEFAULT NULL,
  `coachname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `coachid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`assessmentid`) USING BTREE,
  INDEX `tuserid`(`tuserid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of assessment
-- ----------------------------
INSERT INTO `assessment` VALUES (1, 6, 77, 65, 81, 223, '瓜迪奥拉', 100);
INSERT INTO `assessment` VALUES (2, 7, 45, 87, 57, 189, '瓜迪奥拉', 100);
INSERT INTO `assessment` VALUES (3, 9, 66, 78, 96, 240, '瓜迪奥拉', 100);
INSERT INTO `assessment` VALUES (4, 10, 54, 76, 86, 216, '瓜迪奥拉', 100);
INSERT INTO `assessment` VALUES (5, 6, 72, 75, 91, 238, '瓜迪奥拉', 100);

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments`  (
  `commentsID` int(11) NOT NULL AUTO_INCREMENT,
  `tuserID` int(11) NULL DEFAULT NULL,
  `skill` int(255) NULL DEFAULT NULL,
  `manage` int(255) NULL DEFAULT NULL,
  `quality` int(255) NULL DEFAULT NULL,
  `total` int(255) NULL DEFAULT NULL,
  `playername` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `playerid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`commentsID`) USING BTREE,
  INDEX `tuserID`(`tuserID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES (2, 2, 67, 78, 72, 217, '2', 2);
INSERT INTO `comments` VALUES (8, 11, 47, 90, 86, 223, '球员7', 7);

-- ----------------------------
-- Table structure for data
-- ----------------------------
DROP TABLE IF EXISTS `data`;
CREATE TABLE `data`  (
  `dataid` int(11) NOT NULL AUTO_INCREMENT,
  `minutes` int(11) NULL DEFAULT NULL,
  `goals` int(11) NULL DEFAULT NULL,
  `assists` int(11) NULL DEFAULT NULL,
  `tackles` int(11) NULL DEFAULT NULL,
  `clear` int(11) NULL DEFAULT NULL,
  `fouls` int(11) NULL DEFAULT NULL,
  `pass` int(11) NULL DEFAULT NULL,
  `tuserid` int(11) NULL DEFAULT NULL,
  `date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`dataid`) USING BTREE,
  INDEX `tuserid`(`tuserid`) USING BTREE,
  CONSTRAINT `data_ibfk_1` FOREIGN KEY (`tuserid`) REFERENCES `tuser` (`tuserID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 261 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of data
-- ----------------------------
INSERT INTO `data` VALUES (232, 45, 0, 2, 3, 4, 5, 9, 105, '2014-02-01');
INSERT INTO `data` VALUES (233, 34, 1, 3, 2, 3, 4, 5, 105, '2014-02-03');
INSERT INTO `data` VALUES (234, 37, 2, 2, 3, 2, 3, 7, 105, '2014-02-07');
INSERT INTO `data` VALUES (235, 57, 2, 4, 6, 3, 2, 6, 105, '2014-02-11');
INSERT INTO `data` VALUES (236, 53, 3, 2, 1, 3, 4, 8, 105, '2014-02-22');
INSERT INTO `data` VALUES (239, 53, 2, 3, 5, 2, 5, 6, 106, '2015-05-01');
INSERT INTO `data` VALUES (240, 45, 2, 3, 5, 2, 2, 5, 106, '2015-05-05');
INSERT INTO `data` VALUES (241, 34, 1, 2, 5, 4, 7, 8, 106, '2015-05-08');
INSERT INTO `data` VALUES (242, 23, 0, 3, 2, 5, 6, 3, 106, '2015-05-15');
INSERT INTO `data` VALUES (243, 28, 1, 2, 3, 4, 5, 3, 106, '2015-05-22');
INSERT INTO `data` VALUES (246, 34, 1, 5, 5, 8, 3, 3, 107, '2016-09-01');
INSERT INTO `data` VALUES (247, 44, 2, 3, 3, 3, 4, 5, 107, '2016-09-07');
INSERT INTO `data` VALUES (248, 55, 3, 5, 8, 6, 8, 8, 107, '2016-09-11');
INSERT INTO `data` VALUES (249, 35, 1, 3, 7, 9, 7, 6, 107, '2016-09-18');
INSERT INTO `data` VALUES (250, 45, 2, 3, 5, 6, 2, 3, 107, '2016-09-22');

-- ----------------------------
-- Table structure for formation
-- ----------------------------
DROP TABLE IF EXISTS `formation`;
CREATE TABLE `formation`  (
  `formationid` int(11) NOT NULL AUTO_INCREMENT,
  `forward` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `center` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `back` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `coachname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`formationid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of formation
-- ----------------------------
INSERT INTO `formation` VALUES (2, '3', '3', '4', '攻守兼备', '瓜迪奥拉', '已启用');

-- ----------------------------
-- Table structure for judgement
-- ----------------------------
DROP TABLE IF EXISTS `judgement`;
CREATE TABLE `judgement`  (
  `judgementID` int(11) NOT NULL,
  `a1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `a2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `a3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `a4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `b1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `b2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `b3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `b4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `c1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `c2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `c3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `c4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`judgementID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of judgement
-- ----------------------------
INSERT INTO `judgement` VALUES (1, '比赛对手研究', '阵型调整', '士气提升', '更衣室控制', '身体状态检查', '训练整备', '挖掘队战术水平', '后勤保障', '俱乐部事物', '事务处理', '能力', '反向');

-- ----------------------------
-- Table structure for memo
-- ----------------------------
DROP TABLE IF EXISTS `memo`;
CREATE TABLE `memo`  (
  `memoID` int(11) NOT NULL AUTO_INCREMENT,
  `tuserID` int(11) NULL DEFAULT NULL,
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`memoID`) USING BTREE,
  INDEX `tuserID`(`tuserID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of memo
-- ----------------------------
INSERT INTO `memo` VALUES (7, 2, '2', 'A', '1');
INSERT INTO `memo` VALUES (8, 2, '2', 'B', '1');
INSERT INTO `memo` VALUES (9, 3, '213', 'C', '2');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `menuID` int(11) NOT NULL,
  `pid` int(11) NULL DEFAULT NULL,
  `mname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`menuID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, -1, '成员管理', '/');
INSERT INTO `menu` VALUES (2, -1, '球队信息管理', '/');
INSERT INTO `menu` VALUES (3, -1, '备忘录管理', '/');
INSERT INTO `menu` VALUES (5, -1, '球队日常管理', '/');
INSERT INTO `menu` VALUES (7, -1, '权限信息管理', '/');
INSERT INTO `menu` VALUES (8, -1, '个人信息管理', '/');
INSERT INTO `menu` VALUES (101, 1, '工作人员信息', 'tuserCtrl/queryTuser?action=staff&currpage=1');
INSERT INTO `menu` VALUES (102, 1, '球员信息', 'tuserCtrl/queryTuser?action=player&currpage=1');
INSERT INTO `menu` VALUES (103, 1, '教练信息', 'tuserCtrl/queryTuser?action=coach&currpage=1');
INSERT INTO `menu` VALUES (104, 1, '停职员工', 'tuserCtrl/queryTuser?action=stop&currpage=1');
INSERT INTO `menu` VALUES (201, 2, '新增简介信息', 'common/summary/regSummary');
INSERT INTO `menu` VALUES (202, 2, '球队简介管理', 'summaryCtrl/querySummary?currpage=1');
INSERT INTO `menu` VALUES (203, 2, '球队公告管理', 'common/summary/edtNotice');
INSERT INTO `menu` VALUES (301, 3, '新增备忘录', 'common/memo/regMemo');
INSERT INTO `menu` VALUES (302, 3, '查询备忘录', 'memoCtrl/queryMemo?currpage=1&mark=0');
INSERT INTO `menu` VALUES (303, 3, '已完成任务', 'memoCtrl/queryMemo?currpage=1&mark=1');
INSERT INTO `menu` VALUES (501, 5, '训练计划管理', 'trainCtrl/queryTrain');
INSERT INTO `menu` VALUES (502, 5, '球队阵容管理', 'formationCtrl/queryFormation');
INSERT INTO `menu` VALUES (503, 5, '数据统计管理', 'dataCtrl/queryData');
INSERT INTO `menu` VALUES (601, 6, '制定评价标准', 'common/comments/judgement');
INSERT INTO `menu` VALUES (702, 7, '工作人员组权限', 'tuserCtrl/queryTright?action=staff&currpage=1');
INSERT INTO `menu` VALUES (703, 7, '球员组权限', 'tuserCtrl/queryTright?action=player&currpage=1');
INSERT INTO `menu` VALUES (704, 7, '教练组权限', 'tuserCtrl/queryTright?action=coach&currpage=1');
INSERT INTO `menu` VALUES (801, 8, '编辑个人信息', 'common/login/edtUser');

-- ----------------------------
-- Table structure for menurightrelation
-- ----------------------------
DROP TABLE IF EXISTS `menurightrelation`;
CREATE TABLE `menurightrelation`  (
  `menurightrelationid` int(11) NOT NULL,
  `menuid` int(11) NULL DEFAULT NULL,
  `rname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`menurightrelationid`) USING BTREE,
  INDEX `menuid`(`menuid`) USING BTREE,
  INDEX `rname`(`rname`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menurightrelation
-- ----------------------------
INSERT INTO `menurightrelation` VALUES (1, 1, 'boss');
INSERT INTO `menurightrelation` VALUES (2, 2, 'boss');
INSERT INTO `menurightrelation` VALUES (3, 3, 'boss');
INSERT INTO `menurightrelation` VALUES (4, 4, 'boss');
INSERT INTO `menurightrelation` VALUES (5, 5, 'boss');
INSERT INTO `menurightrelation` VALUES (6, 6, 'boss');
INSERT INTO `menurightrelation` VALUES (7, 7, 'boss');
INSERT INTO `menurightrelation` VALUES (8, 8, 'boss');
INSERT INTO `menurightrelation` VALUES (9, 9, 'boss');
INSERT INTO `menurightrelation` VALUES (10, 10, 'boss');
INSERT INTO `menurightrelation` VALUES (11, 11, 'boss');
INSERT INTO `menurightrelation` VALUES (12, 11, 'player');
INSERT INTO `menurightrelation` VALUES (13, 11, 'coach');
INSERT INTO `menurightrelation` VALUES (14, 11, 'staff');
INSERT INTO `menurightrelation` VALUES (31, 1, 'staff');
INSERT INTO `menurightrelation` VALUES (32, 1, 'player');
INSERT INTO `menurightrelation` VALUES (33, 1, 'coach');
INSERT INTO `menurightrelation` VALUES (41, 4, 'staff');
INSERT INTO `menurightrelation` VALUES (42, 4, 'player');
INSERT INTO `menurightrelation` VALUES (43, 4, 'coach');
INSERT INTO `menurightrelation` VALUES (51, 5, 'player');
INSERT INTO `menurightrelation` VALUES (52, 5, 'coach');
INSERT INTO `menurightrelation` VALUES (61, 6, 'staff');
INSERT INTO `menurightrelation` VALUES (62, 6, 'coach');
INSERT INTO `menurightrelation` VALUES (63, 6, 'player');
INSERT INTO `menurightrelation` VALUES (81, 8, 'player');
INSERT INTO `menurightrelation` VALUES (82, 8, 'coach');
INSERT INTO `menurightrelation` VALUES (83, 8, 'staff');
INSERT INTO `menurightrelation` VALUES (91, 9, 'staff');
INSERT INTO `menurightrelation` VALUES (92, 9, 'coach');
INSERT INTO `menurightrelation` VALUES (93, 9, 'player');
INSERT INTO `menurightrelation` VALUES (101, 101, 'boss');
INSERT INTO `menurightrelation` VALUES (102, 102, 'boss');
INSERT INTO `menurightrelation` VALUES (103, 103, 'boss');
INSERT INTO `menurightrelation` VALUES (104, 104, 'boss');
INSERT INTO `menurightrelation` VALUES (201, 201, 'boss');
INSERT INTO `menurightrelation` VALUES (202, 202, 'boss');
INSERT INTO `menurightrelation` VALUES (203, 203, 'boss');
INSERT INTO `menurightrelation` VALUES (301, 301, 'boss');
INSERT INTO `menurightrelation` VALUES (302, 302, 'boss');
INSERT INTO `menurightrelation` VALUES (303, 303, 'boss');
INSERT INTO `menurightrelation` VALUES (304, 301, 'staff');
INSERT INTO `menurightrelation` VALUES (305, 302, 'staff');
INSERT INTO `menurightrelation` VALUES (306, 303, 'staff');
INSERT INTO `menurightrelation` VALUES (307, 301, 'coach');
INSERT INTO `menurightrelation` VALUES (308, 302, 'coach');
INSERT INTO `menurightrelation` VALUES (309, 303, 'coach');
INSERT INTO `menurightrelation` VALUES (310, 301, 'player');
INSERT INTO `menurightrelation` VALUES (311, 302, 'player');
INSERT INTO `menurightrelation` VALUES (312, 303, 'player');
INSERT INTO `menurightrelation` VALUES (401, 401, 'boss');
INSERT INTO `menurightrelation` VALUES (402, 402, 'boss');
INSERT INTO `menurightrelation` VALUES (403, 403, 'boss');
INSERT INTO `menurightrelation` VALUES (404, 404, 'boss');
INSERT INTO `menurightrelation` VALUES (405, 402, 'staff');
INSERT INTO `menurightrelation` VALUES (406, 403, 'staff');
INSERT INTO `menurightrelation` VALUES (407, 404, 'staff');
INSERT INTO `menurightrelation` VALUES (408, 402, 'coach');
INSERT INTO `menurightrelation` VALUES (409, 403, 'coach');
INSERT INTO `menurightrelation` VALUES (410, 404, 'coach');
INSERT INTO `menurightrelation` VALUES (411, 402, 'player');
INSERT INTO `menurightrelation` VALUES (412, 403, 'player');
INSERT INTO `menurightrelation` VALUES (413, 404, 'player');
INSERT INTO `menurightrelation` VALUES (501, 501, 'boss');
INSERT INTO `menurightrelation` VALUES (502, 502, 'boss');
INSERT INTO `menurightrelation` VALUES (503, 503, 'boss');
INSERT INTO `menurightrelation` VALUES (504, 501, 'player');
INSERT INTO `menurightrelation` VALUES (505, 502, 'player');
INSERT INTO `menurightrelation` VALUES (506, 503, 'player');
INSERT INTO `menurightrelation` VALUES (507, 501, 'coach');
INSERT INTO `menurightrelation` VALUES (508, 502, 'coach');
INSERT INTO `menurightrelation` VALUES (509, 503, 'coach');
INSERT INTO `menurightrelation` VALUES (601, 601, 'boss');
INSERT INTO `menurightrelation` VALUES (603, 603, 'boss');
INSERT INTO `menurightrelation` VALUES (604, 602, 'player');
INSERT INTO `menurightrelation` VALUES (605, 603, 'player');
INSERT INTO `menurightrelation` VALUES (606, 603, 'staff');
INSERT INTO `menurightrelation` VALUES (607, 603, 'coach');
INSERT INTO `menurightrelation` VALUES (702, 702, 'boss');
INSERT INTO `menurightrelation` VALUES (703, 703, 'boss');
INSERT INTO `menurightrelation` VALUES (704, 704, 'boss');
INSERT INTO `menurightrelation` VALUES (801, 801, 'player');
INSERT INTO `menurightrelation` VALUES (803, 801, 'staff');
INSERT INTO `menurightrelation` VALUES (805, 801, 'coach');
INSERT INTO `menurightrelation` VALUES (807, 801, 'boss');
INSERT INTO `menurightrelation` VALUES (901, 901, 'boss');
INSERT INTO `menurightrelation` VALUES (902, 902, 'boss');
INSERT INTO `menurightrelation` VALUES (903, 903, 'coach');
INSERT INTO `menurightrelation` VALUES (904, 904, 'boss');
INSERT INTO `menurightrelation` VALUES (905, 904, 'player');
INSERT INTO `menurightrelation` VALUES (906, 904, 'staff');
INSERT INTO `menurightrelation` VALUES (907, 904, 'coach');
INSERT INTO `menurightrelation` VALUES (1001, 1001, 'boss');
INSERT INTO `menurightrelation` VALUES (1002, 1002, 'boss');
INSERT INTO `menurightrelation` VALUES (1101, 1101, 'boss');
INSERT INTO `menurightrelation` VALUES (1102, 1101, 'staff');
INSERT INTO `menurightrelation` VALUES (1103, 1101, 'coach');
INSERT INTO `menurightrelation` VALUES (1104, 1101, 'player');
INSERT INTO `menurightrelation` VALUES (1105, 1102, 'boss');
INSERT INTO `menurightrelation` VALUES (1106, 1102, 'staff');
INSERT INTO `menurightrelation` VALUES (1107, 1102, 'coach');
INSERT INTO `menurightrelation` VALUES (1108, 1102, 'player');

-- ----------------------------
-- Table structure for myfile
-- ----------------------------
DROP TABLE IF EXISTS `myfile`;
CREATE TABLE `myfile`  (
  `myfileid` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `poster` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`myfileid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of myfile
-- ----------------------------
INSERT INTO `myfile` VALUES (16, '123', '123', '南德斯', '2017/07/07 ', '/usr/share/tomcat/webapps/Soccer/file/3.png');

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `noticeID` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`noticeID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (1, '无');

-- ----------------------------
-- Table structure for schedule
-- ----------------------------
DROP TABLE IF EXISTS `schedule`;
CREATE TABLE `schedule`  (
  `scheduleID` int(11) NOT NULL AUTO_INCREMENT,
  `tuserID` int(11) NULL DEFAULT NULL,
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `task` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `place` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`scheduleID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2312335 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of schedule
-- ----------------------------
INSERT INTO `schedule` VALUES (2312330, 101, '2015年11月11日', '工资发放', '-1', '财务办公室');
INSERT INTO `schedule` VALUES (2312331, 102, '2016年7月30日', '球鞋发放', '-1', '装备管理室');
INSERT INTO `schedule` VALUES (2312332, 103, '2016年7月30日', '球衣发放', '-1', '装备管理室');

-- ----------------------------
-- Table structure for summary
-- ----------------------------
DROP TABLE IF EXISTS `summary`;
CREATE TABLE `summary`  (
  `summaryID` int(11) NOT NULL AUTO_INCREMENT,
  `years` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `days` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`summaryID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of summary
-- ----------------------------
INSERT INTO `summary` VALUES (6, '2011年', '9月6日', '5：0', '大胜切尔西');
INSERT INTO `summary` VALUES (7, '2012年', '3月19日', '0：1', '惜败曼城');
INSERT INTO `summary` VALUES (8, '2013年', '4月30日', '6：2', '血洗巴黎圣日耳曼');
INSERT INTO `summary` VALUES (9, '2014年', '7月12日', '1：0', '客战顿涅茨克矿工一球小胜');
INSERT INTO `summary` VALUES (10, '2015年', '12月8日', '3：2', '联赛夺冠');
INSERT INTO `summary` VALUES (11, '2016年', '4月11日', '4：3晋级半决赛', '战胜拜仁慕尼黑，挺进决赛');

-- ----------------------------
-- Table structure for train
-- ----------------------------
DROP TABLE IF EXISTS `train`;
CREATE TABLE `train`  (
  `trainid` int(11) NOT NULL AUTO_INCREMENT,
  `tuserid` int(11) NULL DEFAULT NULL,
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `coachname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `coachdp` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`trainid`) USING BTREE,
  INDEX `tuserid`(`tuserid`) USING BTREE,
  CONSTRAINT `train_ibfk_1` FOREIGN KEY (`tuserid`) REFERENCES `tuser` (`tuserID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of train
-- ----------------------------
INSERT INTO `train` VALUES (1, 105, '2019年1月11日', '红蓝组对抗', '瓜迪奥拉', '主教练');
INSERT INTO `train` VALUES (2, 115, '2019年2月27日', '抢圈训练', '瓜迪奥拉', '主教练');
INSERT INTO `train` VALUES (3, 105, '	 2019年6月1日', '三角配合', '瓜迪奥拉', '主教练');

-- ----------------------------
-- Table structure for tright
-- ----------------------------
DROP TABLE IF EXISTS `tright`;
CREATE TABLE `tright`  (
  `trightID` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NULL DEFAULT NULL,
  `rname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`trightID`) USING BTREE,
  INDEX `rname`(`rname`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 123 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tright
-- ----------------------------
INSERT INTO `tright` VALUES (1, 100, 'staff', '财务');
INSERT INTO `tright` VALUES (2, 100, 'staff', '球鞋管理');
INSERT INTO `tright` VALUES (3, 100, 'staff', '球衣管理');
INSERT INTO `tright` VALUES (11, 30, 'player', '中场');
INSERT INTO `tright` VALUES (12, 12, 'player', '中场');
INSERT INTO `tright` VALUES (13, 13, 'player', '边锋');
INSERT INTO `tright` VALUES (14, 14, 'player', '前锋');
INSERT INTO `tright` VALUES (15, 15, 'player', '后腰');
INSERT INTO `tright` VALUES (20, 100, 'coach', '主教练');
INSERT INTO `tright` VALUES (21, 100, 'coach', '建筑');
INSERT INTO `tright` VALUES (22, 100, 'coach', '歌唱');
INSERT INTO `tright` VALUES (23, 23, 'coach', '辅助');
INSERT INTO `tright` VALUES (24, 100, 'coach', '说唱');
INSERT INTO `tright` VALUES (30, 100, 'coach', '主教练');
INSERT INTO `tright` VALUES (100, -1, 'boss', '球队经理');
INSERT INTO `tright` VALUES (113, 30, 'staff', '球童');
INSERT INTO `tright` VALUES (114, 30, 'player', '边前卫');
INSERT INTO `tright` VALUES (115, 30, 'player', '后腰');
INSERT INTO `tright` VALUES (116, 30, 'player', '边后卫');
INSERT INTO `tright` VALUES (117, 30, 'player', '中后卫');
INSERT INTO `tright` VALUES (118, 30, 'player', '门将');
INSERT INTO `tright` VALUES (120, 100, 'staff', '后勤补助');
INSERT INTO `tright` VALUES (121, 100, 'staff', '后勤补助');
INSERT INTO `tright` VALUES (122, 100, 'stop', '留观');

-- ----------------------------
-- Table structure for tuser
-- ----------------------------
DROP TABLE IF EXISTS `tuser`;
CREATE TABLE `tuser`  (
  `tuserID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `realname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nationality` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `age` int(11) NULL DEFAULT NULL,
  `height` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `weight` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `experience` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`tuserID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 124 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tuser
-- ----------------------------
INSERT INTO `tuser` VALUES (100, 'boss', '123', 'FCBH', '中国', 18, '179', '68', '俱乐部CEO', '199999999', '1');
INSERT INTO `tuser` VALUES (101, 'staff1', '321', '李瑞', '中国', 25, '174', '56', '财务管理', '151515151', '男');
INSERT INTO `tuser` VALUES (102, 'staff2', '321', '韩洪', '中国', 24, '190', '76', '球鞋管理师', '151515151', '男');
INSERT INTO `tuser` VALUES (103, 'staff3', '321', '李志', '中国', 18, '183', '45', '球衣管理师', '151515151', '女');
INSERT INTO `tuser` VALUES (105, 'player1', '111111', '哈维', '西班牙', 18, '167', '78', '控球大师', '151515151', '男');
INSERT INTO `tuser` VALUES (106, 'player2', '111111', '伊涅斯塔', '西班牙', 19, '168', '79', '原地摆脱', '151515151', '男');
INSERT INTO `tuser` VALUES (107, 'player3', '111111', '席尔瓦', '西班牙', 20, '175', '80', '梳理进攻', '151515151', '男');
INSERT INTO `tuser` VALUES (108, 'player4', '111111', '苏亚雷斯', '乌拉圭', 22, '181', '85', '冷血杀手', '151515151', '男');
INSERT INTO `tuser` VALUES (109, 'player5', '111111', '内马尔', '巴西', 18, '178', '76', '巴西精灵', '151515151', '男');
INSERT INTO `tuser` VALUES (110, 'player6', '111111', 'B席尔瓦', '葡萄牙', 19, '174', '89', '多面手', '151515151', '男');
INSERT INTO `tuser` VALUES (111, 'player7', '111111', '远藤保仁', '日本', 19, '167', '76', '任意球大师', '151515151', '男');
INSERT INTO `tuser` VALUES (112, 'player8', '111111', '川边骏', '日本', 19, '168', '76', '防守', '151515151', '男');
INSERT INTO `tuser` VALUES (113, 'player9', '111111', '梅西', '阿根廷', 19, '176', '65', 'GOAT', '151515151', '男');
INSERT INTO `tuser` VALUES (114, 'player10', '111111', '吴曦', '中国', 19, '185', '65', '后插上', '151515151', '男');
INSERT INTO `tuser` VALUES (115, 'player11', '111111', '中村俊辅', '日本', 22, '185', '78', '灵魂人物', '151515151', '男');
INSERT INTO `tuser` VALUES (116, 'coach1', '111111', '瓜迪奥拉', '西班牙', 35, '167', '78', '战术大师', '151515151', '男');
INSERT INTO `tuser` VALUES (117, 'coach2', '321', '马璞', '越南', 25, '177', '100', '南通大学建筑师', '151515151', '男');
INSERT INTO `tuser` VALUES (118, 'coach3', '321', '朱叫', '老挝', 27, '178', '100', '曼彻斯特大学歌唱家', '151515151', '男');
INSERT INTO `tuser` VALUES (120, 'coach4', '321', '医生', '英国', 25, '174', '55', '徐州医学院麻醉系', '151515151', '女');
INSERT INTO `tuser` VALUES (122, 'stop', '321', '停职', '中国', 23, '166', '76', '场上斗殴', '151515151', '男');

-- ----------------------------
-- Table structure for tuserrightrelation
-- ----------------------------
DROP TABLE IF EXISTS `tuserrightrelation`;
CREATE TABLE `tuserrightrelation`  (
  `tuserrightrelationID` int(11) NOT NULL AUTO_INCREMENT,
  `tuserID` int(11) NULL DEFAULT NULL,
  `trightID` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`tuserrightrelationID`) USING BTREE,
  INDEX `tuserID`(`tuserID`) USING BTREE,
  INDEX `trightID`(`trightID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 123 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tuserrightrelation
-- ----------------------------
INSERT INTO `tuserrightrelation` VALUES (100, 100, 100);
INSERT INTO `tuserrightrelation` VALUES (101, 101, 1);
INSERT INTO `tuserrightrelation` VALUES (102, 102, 2);
INSERT INTO `tuserrightrelation` VALUES (103, 103, 3);
INSERT INTO `tuserrightrelation` VALUES (105, 105, 11);
INSERT INTO `tuserrightrelation` VALUES (106, 106, 11);
INSERT INTO `tuserrightrelation` VALUES (107, 107, 12);
INSERT INTO `tuserrightrelation` VALUES (108, 108, 12);
INSERT INTO `tuserrightrelation` VALUES (109, 109, 13);
INSERT INTO `tuserrightrelation` VALUES (110, 110, 13);
INSERT INTO `tuserrightrelation` VALUES (111, 111, 14);
INSERT INTO `tuserrightrelation` VALUES (112, 112, 15);
INSERT INTO `tuserrightrelation` VALUES (113, 113, 114);
INSERT INTO `tuserrightrelation` VALUES (114, 114, 117);
INSERT INTO `tuserrightrelation` VALUES (115, 115, 118);
INSERT INTO `tuserrightrelation` VALUES (116, 116, 20);
INSERT INTO `tuserrightrelation` VALUES (117, 117, 21);
INSERT INTO `tuserrightrelation` VALUES (118, 118, 22);
INSERT INTO `tuserrightrelation` VALUES (120, 120, 24);
INSERT INTO `tuserrightrelation` VALUES (122, 122, 0);

SET FOREIGN_KEY_CHECKS = 1;
