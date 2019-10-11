/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 80017
Source Host           : localhost:3306
Source Database       : game_card_sale

Target Server Type    : MYSQL
Target Server Version : 80017
File Encoding         : 65001

Date: 2019-10-11 22:50:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for accessory_file
-- ----------------------------
DROP TABLE IF EXISTS `accessory_file`;
CREATE TABLE `accessory_file` (
  `accessoryId` int(11) NOT NULL AUTO_INCREMENT COMMENT '文件附件Id',
  `fileId` int(11) NOT NULL COMMENT '文件Id',
  `accessoryName` varchar(50) NOT NULL COMMENT '附件名称',
  `accessorySize` int(11) NOT NULL COMMENT '附件大小',
  `accessoryType` int(11) NOT NULL COMMENT '附件类型',
  `createDate` datetime NOT NULL COMMENT '创建日期',
  `accessoryPath` varchar(200) NOT NULL COMMENT '附件路径',
  PRIMARY KEY (`accessoryId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of accessory_file
-- ----------------------------
INSERT INTO `accessory_file` VALUES ('100', '5', '附件1', '20', '11', '2019-10-08 10:36:22', 'D:\\\\MyOffice\\\\文档管理\\\\公共文档\\\\研发部门\\\\三级文件');
INSERT INTO `accessory_file` VALUES ('101', '5', '附件2', '50', '11', '2019-10-08 10:37:00', 'D:\\\\MyOffice\\\\文档管理\\\\公共文档\\\\研发部门\\\\三级文件');
INSERT INTO `accessory_file` VALUES ('102', '5', '附件3', '60', '11', '2019-10-08 10:37:19', 'D:\\\\MyOffice\\\\文档管理\\\\公共文档\\\\研发部门\\\\三级文件');
INSERT INTO `accessory_file` VALUES ('124', '4', 'p2.jpg', '8', '16', '2019-10-11 10:00:55', 'D:\\\\MyOffice\\\\文档管理\\\\私有文档\\\\私有部门\\\\p2.jpg');

-- ----------------------------
-- Table structure for branch
-- ----------------------------
DROP TABLE IF EXISTS `branch`;
CREATE TABLE `branch` (
  `branchId` int(11) NOT NULL AUTO_INCREMENT COMMENT '机构id',
  `branchName` varchar(50) NOT NULL COMMENT '机构名称',
  `branchShortName` varchar(50) NOT NULL COMMENT '机构简称',
  PRIMARY KEY (`branchId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of branch
-- ----------------------------
INSERT INTO `branch` VALUES ('30', '机构A', '机构简称A');
INSERT INTO `branch` VALUES ('31', '机构B', '机构简称B');
INSERT INTO `branch` VALUES ('32', '机构C', '机构简称C');

-- ----------------------------
-- Table structure for depart
-- ----------------------------
DROP TABLE IF EXISTS `depart`;
CREATE TABLE `depart` (
  `departId` int(11) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `departName` varchar(50) NOT NULL COMMENT '部门名称',
  `principalUser` varchar(50) NOT NULL COMMENT '部门负责人',
  `connectTelNo` bigint(20) DEFAULT NULL COMMENT '联系电话',
  `connectMobileTelNo` bigint(20) DEFAULT NULL COMMENT '移动电话',
  `faxes` bigint(20) DEFAULT NULL COMMENT '传真',
  `branchId` int(11) NOT NULL COMMENT '所属机构',
  PRIMARY KEY (`departId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of depart
-- ----------------------------
INSERT INTO `depart` VALUES ('40', '部门A', '负责人1', '111111', '13735555777', '202015646546484', '30');
INSERT INTO `depart` VALUES ('41', '部门B', '负责人1', '111112', '13735555777', '202015646546484', '30');
INSERT INTO `depart` VALUES ('42', '部门C', '负责人2', '111113', '13735555777', '202015646546484', '30');
INSERT INTO `depart` VALUES ('43', '部门D', '负责人2', '111114', '13735555777', '202015646546484', '31');
INSERT INTO `depart` VALUES ('44', '部门E', '负责人3', '111115', '13735555777', '202015646546484', '31');
INSERT INTO `depart` VALUES ('45', '部门F', '负责人4', '111116', '13735555777', '202015646546484', '32');
INSERT INTO `depart` VALUES ('46', '部门G', '负责人5', '111117', '13735555777', '202015646546484', '32');

-- ----------------------------
-- Table structure for file
-- ----------------------------
DROP TABLE IF EXISTS `file`;
CREATE TABLE `file` (
  `fileId` int(11) NOT NULL AUTO_INCREMENT COMMENT '文件Id',
  `label` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件名称',
  `fileType` int(11) NOT NULL COMMENT '文件类型',
  `remark` varchar(50) DEFAULT NULL COMMENT '备注',
  `fileOwner` varchar(50) NOT NULL COMMENT '创建者',
  `createDate` datetime NOT NULL COMMENT '创建日期',
  `parentId` int(11) NOT NULL COMMENT '父节点Id',
  `filePath` varchar(200) NOT NULL COMMENT '文件路径',
  `ifDelete` varchar(1) DEFAULT '0' COMMENT '删除标志位（0：正常，1：删除）',
  `deleteDate` datetime DEFAULT NULL,
  PRIMARY KEY (`fileId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of file
-- ----------------------------
INSERT INTO `file` VALUES ('1', '公共文档', '1', '111', '管理员', '2019-09-30 12:58:37', '0', 'D:\\\\MyOffice\\\\文档管理\\\\公共文档', '0', null);
INSERT INTO `file` VALUES ('2', '私有文档', '1', '第三方', '管理员', '2019-09-30 13:00:15', '0', 'D:\\\\MyOffice\\\\文档管理\\\\私有文档', '0', null);
INSERT INTO `file` VALUES ('3', '研发部门', '1', 's十大', '管理员', '2019-09-30 13:01:01', '1', 'D:\\\\MyOffice\\\\文档管理\\\\公共文档\\\\研发部门', '0', null);
INSERT INTO `file` VALUES ('4', '私有部门', '2', '十大', '管理员', '2019-09-30 13:02:36', '2', 'D:\\\\MyOffice\\\\文档管理\\\\私有文档\\\\私有部门', '0', null);
INSERT INTO `file` VALUES ('5', '三级文件', '2', '嗯嗯', '管理员', '2019-10-05 13:55:32', '3', 'D:\\\\MyOffice\\\\文档管理\\\\公共文档\\\\研发部门\\\\三级文件', '0', null);
INSERT INTO `file` VALUES ('6', '二级文件', '2', '哈哈', '管理员', '2019-10-08 10:09:27', '1', 'D:\\\\MyOffice\\\\文档管理\\\\公共文档\\\\二级文件', '0', null);
INSERT INTO `file` VALUES ('105', '修改文件夹1', '1', '不知道修改行不行', '管理员', '2019-10-08 16:26:57', '1', 'D:\\\\MyOffice\\\\文档管理\\\\公共文档\\\\新增文件夹1', '1', '2019-10-11 16:23:50');
INSERT INTO `file` VALUES ('110', '新建文件2', '2', '一定可以', '管理员', '2019-10-08 17:24:53', '1', 'D:\\\\MyOffice\\\\文档管理\\\\公共文档\\\\新建文件2', '0', null);
INSERT INTO `file` VALUES ('112', '新增文件夹2', '1', '嗯嗯', '管理员', '2019-10-09 09:20:54', '1', 'D:\\\\MyOffice\\\\文档管理\\\\公共文档\\\\新增文件夹2', '0', '2019-10-11 12:30:18');
INSERT INTO `file` VALUES ('115', '1', '2', '1', '管理员', '2019-10-09 17:30:05', '3', 'D:\\\\MyOffice\\\\文档管理\\\\公共文档\\\\研发部门\\\\1', '0', null);

-- ----------------------------
-- Table structure for filetype
-- ----------------------------
DROP TABLE IF EXISTS `filetype`;
CREATE TABLE `filetype` (
  `fileTypeId` int(11) NOT NULL AUTO_INCREMENT COMMENT '文件类型id',
  `fileTypeName` varchar(50) NOT NULL COMMENT '文件类型名',
  `fileTypeImage` varchar(50) NOT NULL COMMENT '文件类型对应的图标',
  `fileTypeSuffix` varchar(50) DEFAULT NULL COMMENT '文件类型后缀',
  PRIMARY KEY (`fileTypeId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of filetype
-- ----------------------------
INSERT INTO `filetype` VALUES ('1', '文件夹', '后缀1', '图标1');
INSERT INTO `filetype` VALUES ('2', '文件', '后缀2', '图标2');
INSERT INTO `filetype` VALUES ('11', 'text', '1', '1');
INSERT INTO `filetype` VALUES ('12', 'word', '2', '2');
INSERT INTO `filetype` VALUES ('13', 'excel', '3', '3');
INSERT INTO `filetype` VALUES ('14', 'ppt', '4', '4');
INSERT INTO `filetype` VALUES ('15', 'pdf', '5', '5');
INSERT INTO `filetype` VALUES ('16', 'jpeg', '6', '6');
INSERT INTO `filetype` VALUES ('17', '附件7', '7', '7');
INSERT INTO `filetype` VALUES ('18', '附件8', '8', '8');
INSERT INTO `filetype` VALUES ('19', '附件9', '9', '9');
INSERT INTO `filetype` VALUES ('20', '附件10', '10', '10');
INSERT INTO `filetype` VALUES ('21', '附件11', '11', '11');
INSERT INTO `filetype` VALUES ('22', '附件12', '12', '12');

-- ----------------------------
-- Table structure for login_log
-- ----------------------------
DROP TABLE IF EXISTS `login_log`;
CREATE TABLE `login_log` (
  `loginId` int(11) NOT NULL AUTO_INCREMENT COMMENT '登录日志id',
  `userId` int(11) NOT NULL COMMENT '登录者',
  `chineseName` varchar(50) DEFAULT NULL,
  `loginTime` datetime NOT NULL COMMENT '登录时间',
  `ifSuccess` varchar(1) NOT NULL COMMENT '登录是否成功。1：成功、0失败',
  `loginUserIp` varchar(100) NOT NULL COMMENT '登录用户IP',
  `loginDesc` varchar(100) DEFAULT NULL COMMENT '登录备注',
  PRIMARY KEY (`loginId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=461 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of login_log
-- ----------------------------
INSERT INTO `login_log` VALUES ('452', '1', '杨文君', '2019-10-11 16:30:56', '1', '127.0.0.1', '登录成功');
INSERT INTO `login_log` VALUES ('453', '4', '沈梦磊', '2019-10-11 16:32:27', '1', '127.0.0.1', '登录成功');
INSERT INTO `login_log` VALUES ('454', '4', '沈梦磊', '2019-10-11 16:35:10', '1', '127.0.0.1', '登录成功');
INSERT INTO `login_log` VALUES ('455', '1', '杨文君', '2019-10-11 16:35:53', '1', '127.0.0.1', '登录成功');
INSERT INTO `login_log` VALUES ('456', '4', '沈梦磊', '2019-10-11 16:37:51', '1', '127.0.0.1', '登录成功');
INSERT INTO `login_log` VALUES ('457', '1', '杨文君', '2019-10-11 16:38:53', '1', '127.0.0.1', '登录成功');
INSERT INTO `login_log` VALUES ('458', '1', '杨文君', '2019-10-11 16:43:54', '1', '127.0.0.1', '登录成功');
INSERT INTO `login_log` VALUES ('459', '1', '杨文君', '2019-10-11 17:11:50', '1', '127.0.0.1', '登录成功');
INSERT INTO `login_log` VALUES ('460', '1', '杨文君', '2019-10-11 21:52:21', '1', '127.0.0.1', '登录成功');

-- ----------------------------
-- Table structure for manual_sign
-- ----------------------------
DROP TABLE IF EXISTS `manual_sign`;
CREATE TABLE `manual_sign` (
  `signId` int(11) NOT NULL AUTO_INCREMENT COMMENT '签卡Id',
  `userId` int(11) NOT NULL COMMENT '用户id',
  `signTime` datetime NOT NULL COMMENT '签卡时间',
  `signDesc` varchar(200) NOT NULL COMMENT '签卡备注',
  `signTag` int(11) NOT NULL COMMENT '签卡标记',
  PRIMARY KEY (`signId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of manual_sign
-- ----------------------------
INSERT INTO `manual_sign` VALUES ('100', '1', '2019-09-25 11:21:11', '杨文君签到', '1');
INSERT INTO `manual_sign` VALUES ('101', '1', '2019-09-25 11:21:19', '杨文君签退', '2');
INSERT INTO `manual_sign` VALUES ('102', '1', '2019-09-25 11:23:14', '杨文君签到', '1');
INSERT INTO `manual_sign` VALUES ('103', '1', '2019-09-25 12:16:22', '杨文君签退', '2');
INSERT INTO `manual_sign` VALUES ('133', '1', '2019-10-11 22:41:22', '杨文君签到', '1');
INSERT INTO `manual_sign` VALUES ('134', '1', '2019-10-11 22:41:45', '杨文君签退', '2');

-- ----------------------------
-- Table structure for meeting
-- ----------------------------
DROP TABLE IF EXISTS `meeting`;
CREATE TABLE `meeting` (
  `meetingId` int(11) NOT NULL AUTO_INCREMENT COMMENT '会议类型Id',
  `meetingName` varchar(50) NOT NULL COMMENT '会议类型名称',
  PRIMARY KEY (`meetingId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meeting
-- ----------------------------
INSERT INTO `meeting` VALUES ('1', '公司年会');
INSERT INTO `meeting` VALUES ('2', '机构会议');
INSERT INTO `meeting` VALUES ('3', '部门会议');
INSERT INTO `meeting` VALUES ('4', '小组会议');
INSERT INTO `meeting` VALUES ('5', '外部合作会议');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `messageId` int(11) NOT NULL AUTO_INCREMENT COMMENT '消息Id',
  `title` varchar(100) NOT NULL COMMENT '消息标题',
  `content` varchar(5000) NOT NULL COMMENT '消息内容',
  `type` int(11) NOT NULL COMMENT '消息类型',
  `beginTime` datetime NOT NULL COMMENT '开始有效时间',
  `endTime` datetime NOT NULL COMMENT '有效结束时间',
  `fromUserId` varchar(50) NOT NULL COMMENT '发送者',
  `ifPublish` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0' COMMENT '是否已发布（0：未发布，1：发布）',
  `recordTime` datetime DEFAULT NULL COMMENT '发送时间',
  `createTime` datetime NOT NULL,
  `isDeleted` varchar(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`messageId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1992294401 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('-1656750080', '给文君再来一条消息', '收到请回复', '2', '2019-09-29 00:00:00', '2019-09-30 00:00:00', '4', '0', null, '2019-09-29 22:07:39', '0');
INSERT INTO `message` VALUES ('-767557632', '你好啊，文君', '再试一下', '2', '2019-09-29 00:00:00', '2019-09-30 00:00:00', '4', '0', null, '2019-09-29 22:27:20', '0');
INSERT INTO `message` VALUES ('-339738624', '再给阿磊一个消息', '请回复啊', '2', '2019-09-29 00:00:00', '2019-09-30 00:00:00', '1', '0', null, '2019-09-29 22:04:21', '0');
INSERT INTO `message` VALUES ('-276824064', '文君要收到啊', '哈哈哈哈哈哈哈哈哈哈哈', '2', '2019-10-11 00:00:00', '2019-10-12 00:00:00', '4', '1', '2019-10-11 16:38:42', '2019-10-11 16:38:36', '0');
INSERT INTO `message` VALUES ('-117440512', '哈哈', '东方闪电', '2', '2019-09-26 00:00:00', '2019-09-27 00:00:00', '1', '0', null, '2019-09-27 15:30:55', '0');
INSERT INTO `message` VALUES ('1', '测试1', '测试一下而已', '1', '2019-09-20 10:04:24', '2019-09-27 10:04:48', '1', '1', '2019-09-27 10:05:17', '2019-09-25 10:25:07', '1');
INSERT INTO `message` VALUES ('2', '测试2', '傻子婷', '2', '2019-09-17 14:00:56', '2019-09-28 14:00:59', '1', '1', '2019-09-27 10:38:34', '2019-09-27 14:01:15', '1');
INSERT INTO `message` VALUES ('121634816', '添加测试', '不知道说什么', '1', '2019-09-25 00:00:00', '2019-09-26 00:00:00', '1', '1', '2019-09-27 10:05:43', '2019-09-26 21:30:07', '1');
INSERT INTO `message` VALUES ('176160768', '傻子婷', '好烦啊', '2', '2019-09-27 00:00:00', '2019-09-28 00:00:00', '1', '1', '2019-09-27 10:40:31', '2019-09-27 09:29:50', '0');
INSERT INTO `message` VALUES ('490733568', '添加全部', '全部', '2', '2019-09-25 00:00:00', '2019-09-26 00:00:00', '1', '1', '2019-09-27 09:59:35', '2019-09-26 22:17:00', '0');
INSERT INTO `message` VALUES ('524288000', '给文君消息', '哈哈', '2', '2019-10-10 00:00:00', '2019-10-11 00:00:00', '4', '1', '2019-10-11 16:35:44', '2019-10-11 16:34:47', '0');
INSERT INTO `message` VALUES ('868220928', '电风扇', '地方', '2', '2019-09-26 00:00:00', '2019-09-27 00:00:00', '1', '0', null, '2019-09-27 15:32:45', '0');
INSERT INTO `message` VALUES ('973078528', '测试创建时间', '傻子婷', '1', '2019-09-27 00:00:00', '2019-09-28 00:00:00', '1', '1', '2019-09-27 09:58:28', '2019-09-27 09:29:02', '0');
INSERT INTO `message` VALUES ('1308622848', '发给阿磊的', '你好啊，阿磊', '2', '2019-09-29 00:00:00', '2019-09-30 00:00:00', '1', '1', '2019-10-11 16:27:01', '2019-09-29 21:58:18', '0');
INSERT INTO `message` VALUES ('1358954496', '给阿磊信息', '阿磊好', '2', '2019-10-01 00:00:00', '2019-10-03 00:00:00', '1', '0', null, '2019-10-11 16:29:01', '0');
INSERT INTO `message` VALUES ('1707081728', '给文君的消息', '文君，你好', '2', '2019-10-20 00:00:00', '2019-10-21 00:00:00', '4', '0', null, '2019-09-29 21:53:16', '0');

-- ----------------------------
-- Table structure for message_to_user
-- ----------------------------
DROP TABLE IF EXISTS `message_to_user`;
CREATE TABLE `message_to_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号Id',
  `messageId` int(11) NOT NULL COMMENT '消息Id',
  `toUserId` varchar(50) NOT NULL COMMENT '发送对象Id',
  `ifRead` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0' COMMENT '是否已读。1：已读、0：未读',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2009071623 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message_to_user
-- ----------------------------
INSERT INTO `message_to_user` VALUES ('-1975517184', '-1979711488', '1', '0');
INSERT INTO `message_to_user` VALUES ('-1975517183', '-1979711488', '2', '0');
INSERT INTO `message_to_user` VALUES ('-1975517182', '-1979711488', '3', '0');
INSERT INTO `message_to_user` VALUES ('-1975517181', '-1979711488', '4', '0');
INSERT INTO `message_to_user` VALUES ('-1975517180', '-1979711488', '5', '0');
INSERT INTO `message_to_user` VALUES ('-1975517179', '-1979711488', '6', '0');
INSERT INTO `message_to_user` VALUES ('-1975517178', '-1979711488', '7', '0');
INSERT INTO `message_to_user` VALUES ('-1656750079', '-1656750080', '1', '1');
INSERT INTO `message_to_user` VALUES ('-1484783616', '176160768', '1', '1');
INSERT INTO `message_to_user` VALUES ('-1484783615', '176160768', '2', '0');
INSERT INTO `message_to_user` VALUES ('-1484783614', '176160768', '3', '0');
INSERT INTO `message_to_user` VALUES ('-1484783613', '176160768', '4', '0');
INSERT INTO `message_to_user` VALUES ('-1484783612', '176160768', '5', '0');
INSERT INTO `message_to_user` VALUES ('-1484783611', '176160768', '6', '0');
INSERT INTO `message_to_user` VALUES ('-1484783610', '176160768', '7', '0');
INSERT INTO `message_to_user` VALUES ('-905969664', '-910163968', '1', '0');
INSERT INTO `message_to_user` VALUES ('-905969663', '-910163968', '2', '0');
INSERT INTO `message_to_user` VALUES ('-905969662', '-910163968', '3', '0');
INSERT INTO `message_to_user` VALUES ('-905969661', '-910163968', '4', '0');
INSERT INTO `message_to_user` VALUES ('-905969660', '-910163968', '5', '0');
INSERT INTO `message_to_user` VALUES ('-905969659', '-910163968', '6', '0');
INSERT INTO `message_to_user` VALUES ('-905969658', '-910163968', '7', '0');
INSERT INTO `message_to_user` VALUES ('-767557631', '-767557632', '1', '1');
INSERT INTO `message_to_user` VALUES ('-339738623', '-339738624', '4', '0');
INSERT INTO `message_to_user` VALUES ('-276824063', '-276824064', '1', '1');
INSERT INTO `message_to_user` VALUES ('-100663296', '-117440512', '1', '1');
INSERT INTO `message_to_user` VALUES ('-100663295', '-117440512', '2', '0');
INSERT INTO `message_to_user` VALUES ('-100663294', '-117440512', '3', '0');
INSERT INTO `message_to_user` VALUES ('-100663293', '-117440512', '4', '0');
INSERT INTO `message_to_user` VALUES ('-100663292', '-117440512', '5', '0');
INSERT INTO `message_to_user` VALUES ('-100663291', '-117440512', '6', '0');
INSERT INTO `message_to_user` VALUES ('-100663290', '-117440512', '7', '0');
INSERT INTO `message_to_user` VALUES ('1', '1', '1', '1');
INSERT INTO `message_to_user` VALUES ('2', '1', '2', '0');
INSERT INTO `message_to_user` VALUES ('3', '1', '3', '0');
INSERT INTO `message_to_user` VALUES ('4', '1', '4', '0');
INSERT INTO `message_to_user` VALUES ('5', '1', '5', '0');
INSERT INTO `message_to_user` VALUES ('6', '1', '6', '0');
INSERT INTO `message_to_user` VALUES ('7', '1', '7', '0');
INSERT INTO `message_to_user` VALUES ('8', '2', '2', '0');
INSERT INTO `message_to_user` VALUES ('121634817', '121634816', '1', '1');
INSERT INTO `message_to_user` VALUES ('499122176', '490733568', '1', '1');
INSERT INTO `message_to_user` VALUES ('499122177', '490733568', '2', '0');
INSERT INTO `message_to_user` VALUES ('499122178', '490733568', '3', '0');
INSERT INTO `message_to_user` VALUES ('499122179', '490733568', '4', '0');
INSERT INTO `message_to_user` VALUES ('499122180', '490733568', '5', '0');
INSERT INTO `message_to_user` VALUES ('499122181', '490733568', '6', '0');
INSERT INTO `message_to_user` VALUES ('499122182', '490733568', '7', '0');
INSERT INTO `message_to_user` VALUES ('524288001', '524288000', '1', '0');
INSERT INTO `message_to_user` VALUES ('931135488', '868220928', '1', '1');
INSERT INTO `message_to_user` VALUES ('931135489', '868220928', '2', '0');
INSERT INTO `message_to_user` VALUES ('931135490', '868220928', '3', '0');
INSERT INTO `message_to_user` VALUES ('931135491', '868220928', '4', '0');
INSERT INTO `message_to_user` VALUES ('931135492', '868220928', '5', '0');
INSERT INTO `message_to_user` VALUES ('931135493', '868220928', '6', '0');
INSERT INTO `message_to_user` VALUES ('931135494', '868220928', '7', '0');
INSERT INTO `message_to_user` VALUES ('977272832', '973078528', '1', '1');
INSERT INTO `message_to_user` VALUES ('977272833', '973078528', '2', '0');
INSERT INTO `message_to_user` VALUES ('977272834', '973078528', '3', '0');
INSERT INTO `message_to_user` VALUES ('977272835', '973078528', '4', '0');
INSERT INTO `message_to_user` VALUES ('977272836', '973078528', '5', '0');
INSERT INTO `message_to_user` VALUES ('977272837', '973078528', '6', '0');
INSERT INTO `message_to_user` VALUES ('977272838', '973078528', '7', '0');
INSERT INTO `message_to_user` VALUES ('1308622849', '1308622848', '4', '0');
INSERT INTO `message_to_user` VALUES ('1363148800', '1358954496', '4', '0');
INSERT INTO `message_to_user` VALUES ('1719664640', '1707081728', '1', '0');

-- ----------------------------
-- Table structure for message_type
-- ----------------------------
DROP TABLE IF EXISTS `message_type`;
CREATE TABLE `message_type` (
  `messageTypeId` int(11) NOT NULL AUTO_INCREMENT COMMENT '消息类型Id',
  `messageTypeName` varchar(50) NOT NULL COMMENT '消息类型名称',
  `messageDesc` varchar(50) DEFAULT NULL COMMENT '消息类型描述',
  PRIMARY KEY (`messageTypeId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message_type
-- ----------------------------
INSERT INTO `message_type` VALUES ('1', '一般消息', '普通的消息');
INSERT INTO `message_type` VALUES ('2', '紧急消息', '需要优先处理的消息');

-- ----------------------------
-- Table structure for my_note
-- ----------------------------
DROP TABLE IF EXISTS `my_note`;
CREATE TABLE `my_note` (
  `noteId` int(11) NOT NULL AUTO_INCREMENT COMMENT '便签id',
  `noteTitle` varchar(50) NOT NULL COMMENT '便签标题',
  `noteContent` varchar(500) DEFAULT NULL COMMENT '便签内容',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `createUser` varchar(50) NOT NULL COMMENT '创建者',
  PRIMARY KEY (`noteId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of my_note
-- ----------------------------
INSERT INTO `my_note` VALUES ('100', '陆子婷来了', '陆子婷说：没有难点', '2019-09-20 16:02:03', 'ywj');
INSERT INTO `my_note` VALUES ('101', '阿祖说', '陆子婷是个傻闺女', '2019-09-19 12:57:21', 'ywj');
INSERT INTO `my_note` VALUES ('102', '阿磊又说', '没有没有', '2019-09-19 12:57:21', 'ywj');
INSERT INTO `my_note` VALUES ('104', '阿福又看韩剧了', '韩剧真好看', '2019-09-19 12:57:41', 'ywj');
INSERT INTO `my_note` VALUES ('106', '好晚了', '好困啊', '2019-09-19 12:57:41', 'ywj');

-- ----------------------------
-- Table structure for operate_log
-- ----------------------------
DROP TABLE IF EXISTS `operate_log`;
CREATE TABLE `operate_log` (
  `operateId` int(11) NOT NULL AUTO_INCREMENT COMMENT '操作日志Id',
  `userId` varchar(50) NOT NULL COMMENT '操作者',
  `operateName` varchar(50) NOT NULL COMMENT '操作名称',
  `objectId` varchar(50) NOT NULL COMMENT '操作对象Id',
  `operateDesc` varchar(200) NOT NULL COMMENT '操作描述',
  `operateTime` datetime NOT NULL COMMENT '操作时间',
  PRIMARY KEY (`operateId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=736 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operate_log
-- ----------------------------
INSERT INTO `operate_log` VALUES ('100', '1', '删除', '杨文君', '执行的操作是：deleteLoginLogById', '2019-09-21 10:15:58');
INSERT INTO `operate_log` VALUES ('101', '1', '添加', '杨文君', '执行的操作是：addNote', '2019-09-21 13:01:35');
INSERT INTO `operate_log` VALUES ('102', '1', '添加', '杨文君', '执行的操作是：addNote', '2019-09-23 12:58:11');
INSERT INTO `operate_log` VALUES ('103', '1', '添加', '杨文君', '执行的操作是：addNote', '2019-09-23 12:58:55');
INSERT INTO `operate_log` VALUES ('104', '1', '添加', '杨文君', '执行的操作是：addNote', '2019-09-23 13:00:09');
INSERT INTO `operate_log` VALUES ('105', '1', '更新', '杨文君', '执行的操作是：updateNote', '2019-09-23 16:01:45');
INSERT INTO `operate_log` VALUES ('106', '1', '删除', '杨文君', '执行的操作是：deleteNote', '2019-09-23 16:06:25');
INSERT INTO `operate_log` VALUES ('107', '1', '添加', '杨文君', '执行的操作是：addNote', '2019-09-23 16:17:26');
INSERT INTO `operate_log` VALUES ('108', '1', '添加', '杨文君', '执行的操作是：addNote', '2019-09-23 16:44:07');
INSERT INTO `operate_log` VALUES ('109', '1', '更新', '杨文君', '执行的操作是：updateNote', '2019-09-23 16:44:22');
INSERT INTO `operate_log` VALUES ('110', '1', '删除', '杨文君', '执行的操作是：deleteNote', '2019-09-23 16:44:30');
INSERT INTO `operate_log` VALUES ('111', '1', '更新', '杨文君', '执行的操作是：updateNote', '2019-09-23 21:16:16');
INSERT INTO `operate_log` VALUES ('112', '1', '更新', '杨文君', '执行的操作是：updateNote', '2019-09-23 21:17:48');
INSERT INTO `operate_log` VALUES ('113', '1', '更新', '杨文君', '执行的操作是：updateNote', '2019-09-23 21:18:17');
INSERT INTO `operate_log` VALUES ('114', '1', '更新', '杨文君', '执行的操作是：updateNote', '2019-09-23 21:18:36');
INSERT INTO `operate_log` VALUES ('115', '1', '更新', '杨文君', '执行的操作是：updateNote', '2019-09-23 21:18:57');
INSERT INTO `operate_log` VALUES ('116', '1', '添加', '杨文君', '执行的操作是：addNote', '2019-09-24 00:46:00');
INSERT INTO `operate_log` VALUES ('117', '1', '删除', '杨文君', '执行的操作是：deleteMySchedule', '2019-09-24 13:55:44');
INSERT INTO `operate_log` VALUES ('118', '1', '添加', '杨文君', '执行的操作是：addMySchedule', '2019-09-24 16:35:51');
INSERT INTO `operate_log` VALUES ('119', '1', '删除', '杨文君', '执行的操作是：deleteMySchedule', '2019-09-24 16:49:16');
INSERT INTO `operate_log` VALUES ('120', '1', '添加', '杨文君', '执行的操作是：addMySchedule', '2019-09-24 16:54:39');
INSERT INTO `operate_log` VALUES ('121', '1', '添加', '杨文君', '执行的操作是：addMySchedule', '2019-09-24 16:55:50');
INSERT INTO `operate_log` VALUES ('122', '1', '添加', '杨文君', '执行的操作是：addMySchedule', '2019-09-24 16:56:37');
INSERT INTO `operate_log` VALUES ('123', '1', '添加', '杨文君', '执行的操作是：addMySchedule', '2019-09-24 17:07:32');
INSERT INTO `operate_log` VALUES ('124', '1', '添加', '杨文君', '执行的操作是：addMySchedule', '2019-09-24 17:29:41');
INSERT INTO `operate_log` VALUES ('125', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-25 11:21:23');
INSERT INTO `operate_log` VALUES ('126', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-25 11:21:43');
INSERT INTO `operate_log` VALUES ('127', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-25 11:21:43');
INSERT INTO `operate_log` VALUES ('128', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-25 11:22:08');
INSERT INTO `operate_log` VALUES ('129', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-25 11:22:17');
INSERT INTO `operate_log` VALUES ('130', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-25 11:22:20');
INSERT INTO `operate_log` VALUES ('131', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-25 11:22:20');
INSERT INTO `operate_log` VALUES ('132', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-25 11:22:21');
INSERT INTO `operate_log` VALUES ('133', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-25 11:22:23');
INSERT INTO `operate_log` VALUES ('134', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-25 11:25:39');
INSERT INTO `operate_log` VALUES ('135', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-25 11:25:43');
INSERT INTO `operate_log` VALUES ('136', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-25 11:25:46');
INSERT INTO `operate_log` VALUES ('137', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-25 11:25:46');
INSERT INTO `operate_log` VALUES ('138', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-25 11:25:48');
INSERT INTO `operate_log` VALUES ('139', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-25 11:25:51');
INSERT INTO `operate_log` VALUES ('140', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-25 11:25:51');
INSERT INTO `operate_log` VALUES ('141', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-25 11:25:52');
INSERT INTO `operate_log` VALUES ('142', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-25 11:26:13');
INSERT INTO `operate_log` VALUES ('143', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-25 12:16:26');
INSERT INTO `operate_log` VALUES ('144', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-25 12:16:51');
INSERT INTO `operate_log` VALUES ('145', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-25 15:33:56');
INSERT INTO `operate_log` VALUES ('146', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-25 15:51:52');
INSERT INTO `operate_log` VALUES ('147', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-25 15:51:52');
INSERT INTO `operate_log` VALUES ('148', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-25 16:05:22');
INSERT INTO `operate_log` VALUES ('149', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-25 16:05:22');
INSERT INTO `operate_log` VALUES ('150', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-25 16:07:15');
INSERT INTO `operate_log` VALUES ('151', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-25 16:07:15');
INSERT INTO `operate_log` VALUES ('152', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-25 16:07:23');
INSERT INTO `operate_log` VALUES ('153', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-25 16:07:23');
INSERT INTO `operate_log` VALUES ('154', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-25 16:09:12');
INSERT INTO `operate_log` VALUES ('155', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-25 16:09:12');
INSERT INTO `operate_log` VALUES ('156', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-25 16:09:26');
INSERT INTO `operate_log` VALUES ('157', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-25 16:09:36');
INSERT INTO `operate_log` VALUES ('158', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-25 16:25:43');
INSERT INTO `operate_log` VALUES ('159', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-25 16:25:51');
INSERT INTO `operate_log` VALUES ('160', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-25 16:25:51');
INSERT INTO `operate_log` VALUES ('161', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-25 16:27:07');
INSERT INTO `operate_log` VALUES ('162', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-25 16:27:07');
INSERT INTO `operate_log` VALUES ('163', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-25 16:27:09');
INSERT INTO `operate_log` VALUES ('164', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-25 16:27:09');
INSERT INTO `operate_log` VALUES ('165', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-25 16:27:11');
INSERT INTO `operate_log` VALUES ('166', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-25 16:27:14');
INSERT INTO `operate_log` VALUES ('167', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-25 16:27:14');
INSERT INTO `operate_log` VALUES ('168', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-25 16:27:15');
INSERT INTO `operate_log` VALUES ('169', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-25 16:29:44');
INSERT INTO `operate_log` VALUES ('170', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-25 16:29:44');
INSERT INTO `operate_log` VALUES ('171', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-25 16:29:46');
INSERT INTO `operate_log` VALUES ('172', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-25 16:47:49');
INSERT INTO `operate_log` VALUES ('173', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-25 16:51:38');
INSERT INTO `operate_log` VALUES ('174', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-25 16:55:59');
INSERT INTO `operate_log` VALUES ('175', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-25 17:04:44');
INSERT INTO `operate_log` VALUES ('176', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-25 17:04:59');
INSERT INTO `operate_log` VALUES ('177', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-25 17:05:06');
INSERT INTO `operate_log` VALUES ('178', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-25 17:07:05');
INSERT INTO `operate_log` VALUES ('179', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-25 17:35:53');
INSERT INTO `operate_log` VALUES ('180', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-25 17:35:53');
INSERT INTO `operate_log` VALUES ('181', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-25 17:36:19');
INSERT INTO `operate_log` VALUES ('182', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-25 17:36:19');
INSERT INTO `operate_log` VALUES ('183', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-25 17:36:38');
INSERT INTO `operate_log` VALUES ('184', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-25 17:36:38');
INSERT INTO `operate_log` VALUES ('185', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-25 17:39:03');
INSERT INTO `operate_log` VALUES ('186', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-25 17:39:03');
INSERT INTO `operate_log` VALUES ('187', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-25 17:39:30');
INSERT INTO `operate_log` VALUES ('188', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-25 17:39:30');
INSERT INTO `operate_log` VALUES ('189', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-25 17:39:52');
INSERT INTO `operate_log` VALUES ('190', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-25 17:39:52');
INSERT INTO `operate_log` VALUES ('191', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-25 17:40:17');
INSERT INTO `operate_log` VALUES ('192', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-25 17:40:17');
INSERT INTO `operate_log` VALUES ('193', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-25 17:42:42');
INSERT INTO `operate_log` VALUES ('194', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-25 17:42:42');
INSERT INTO `operate_log` VALUES ('195', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-25 17:43:07');
INSERT INTO `operate_log` VALUES ('196', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-25 17:43:32');
INSERT INTO `operate_log` VALUES ('197', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-25 17:43:32');
INSERT INTO `operate_log` VALUES ('198', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-25 17:44:06');
INSERT INTO `operate_log` VALUES ('199', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-25 17:45:39');
INSERT INTO `operate_log` VALUES ('200', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-25 17:45:54');
INSERT INTO `operate_log` VALUES ('201', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-25 17:46:10');
INSERT INTO `operate_log` VALUES ('202', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-25 17:48:24');
INSERT INTO `operate_log` VALUES ('203', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 09:14:11');
INSERT INTO `operate_log` VALUES ('204', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 09:20:31');
INSERT INTO `operate_log` VALUES ('205', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 09:22:32');
INSERT INTO `operate_log` VALUES ('206', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 09:24:30');
INSERT INTO `operate_log` VALUES ('207', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 09:31:32');
INSERT INTO `operate_log` VALUES ('208', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 09:33:32');
INSERT INTO `operate_log` VALUES ('209', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 09:36:53');
INSERT INTO `operate_log` VALUES ('210', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 09:49:42');
INSERT INTO `operate_log` VALUES ('211', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 10:03:21');
INSERT INTO `operate_log` VALUES ('212', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 10:06:45');
INSERT INTO `operate_log` VALUES ('213', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 10:07:26');
INSERT INTO `operate_log` VALUES ('214', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 10:14:21');
INSERT INTO `operate_log` VALUES ('215', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 10:15:22');
INSERT INTO `operate_log` VALUES ('216', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 10:16:05');
INSERT INTO `operate_log` VALUES ('217', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 10:16:32');
INSERT INTO `operate_log` VALUES ('218', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 10:17:56');
INSERT INTO `operate_log` VALUES ('219', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 10:19:37');
INSERT INTO `operate_log` VALUES ('220', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 10:20:30');
INSERT INTO `operate_log` VALUES ('221', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 10:20:47');
INSERT INTO `operate_log` VALUES ('222', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 10:27:37');
INSERT INTO `operate_log` VALUES ('223', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 10:28:27');
INSERT INTO `operate_log` VALUES ('224', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 10:29:56');
INSERT INTO `operate_log` VALUES ('225', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 10:45:45');
INSERT INTO `operate_log` VALUES ('226', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 11:35:49');
INSERT INTO `operate_log` VALUES ('227', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 11:37:49');
INSERT INTO `operate_log` VALUES ('228', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 12:16:27');
INSERT INTO `operate_log` VALUES ('229', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 12:17:58');
INSERT INTO `operate_log` VALUES ('230', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 12:18:17');
INSERT INTO `operate_log` VALUES ('231', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 12:19:10');
INSERT INTO `operate_log` VALUES ('232', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 12:22:50');
INSERT INTO `operate_log` VALUES ('233', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 12:27:55');
INSERT INTO `operate_log` VALUES ('234', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 12:31:11');
INSERT INTO `operate_log` VALUES ('235', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 12:34:38');
INSERT INTO `operate_log` VALUES ('236', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 12:35:29');
INSERT INTO `operate_log` VALUES ('237', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 12:52:12');
INSERT INTO `operate_log` VALUES ('238', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 12:54:00');
INSERT INTO `operate_log` VALUES ('239', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-26 12:54:01');
INSERT INTO `operate_log` VALUES ('240', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 12:54:19');
INSERT INTO `operate_log` VALUES ('241', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-26 12:54:19');
INSERT INTO `operate_log` VALUES ('242', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 12:54:41');
INSERT INTO `operate_log` VALUES ('243', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-26 12:54:41');
INSERT INTO `operate_log` VALUES ('244', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 12:55:28');
INSERT INTO `operate_log` VALUES ('245', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 12:58:08');
INSERT INTO `operate_log` VALUES ('246', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 13:00:39');
INSERT INTO `operate_log` VALUES ('247', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 13:07:21');
INSERT INTO `operate_log` VALUES ('248', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 13:10:34');
INSERT INTO `operate_log` VALUES ('249', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 13:11:32');
INSERT INTO `operate_log` VALUES ('250', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 13:16:42');
INSERT INTO `operate_log` VALUES ('251', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 13:18:02');
INSERT INTO `operate_log` VALUES ('252', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 13:18:25');
INSERT INTO `operate_log` VALUES ('253', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 13:23:43');
INSERT INTO `operate_log` VALUES ('254', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 13:24:10');
INSERT INTO `operate_log` VALUES ('255', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 13:33:31');
INSERT INTO `operate_log` VALUES ('256', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 13:35:15');
INSERT INTO `operate_log` VALUES ('257', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 13:37:49');
INSERT INTO `operate_log` VALUES ('258', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 13:40:05');
INSERT INTO `operate_log` VALUES ('259', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 13:43:05');
INSERT INTO `operate_log` VALUES ('260', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 13:45:06');
INSERT INTO `operate_log` VALUES ('261', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 13:45:35');
INSERT INTO `operate_log` VALUES ('262', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 13:49:52');
INSERT INTO `operate_log` VALUES ('263', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 13:54:42');
INSERT INTO `operate_log` VALUES ('264', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 13:55:07');
INSERT INTO `operate_log` VALUES ('265', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 13:56:02');
INSERT INTO `operate_log` VALUES ('266', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 13:57:25');
INSERT INTO `operate_log` VALUES ('267', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 13:59:48');
INSERT INTO `operate_log` VALUES ('268', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 13:59:56');
INSERT INTO `operate_log` VALUES ('269', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 14:11:27');
INSERT INTO `operate_log` VALUES ('270', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 14:12:14');
INSERT INTO `operate_log` VALUES ('271', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 14:14:24');
INSERT INTO `operate_log` VALUES ('272', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 14:14:53');
INSERT INTO `operate_log` VALUES ('273', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 14:47:21');
INSERT INTO `operate_log` VALUES ('274', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 14:52:44');
INSERT INTO `operate_log` VALUES ('275', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 14:54:59');
INSERT INTO `operate_log` VALUES ('276', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 14:55:38');
INSERT INTO `operate_log` VALUES ('277', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 14:56:03');
INSERT INTO `operate_log` VALUES ('278', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 15:01:41');
INSERT INTO `operate_log` VALUES ('279', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 16:21:13');
INSERT INTO `operate_log` VALUES ('280', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 16:24:43');
INSERT INTO `operate_log` VALUES ('281', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 16:27:03');
INSERT INTO `operate_log` VALUES ('282', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 16:27:26');
INSERT INTO `operate_log` VALUES ('283', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 16:31:27');
INSERT INTO `operate_log` VALUES ('284', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 16:33:32');
INSERT INTO `operate_log` VALUES ('285', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 16:40:19');
INSERT INTO `operate_log` VALUES ('286', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 16:45:55');
INSERT INTO `operate_log` VALUES ('287', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 16:49:10');
INSERT INTO `operate_log` VALUES ('288', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 19:31:40');
INSERT INTO `operate_log` VALUES ('289', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 19:46:07');
INSERT INTO `operate_log` VALUES ('290', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 20:04:12');
INSERT INTO `operate_log` VALUES ('291', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-26 20:04:12');
INSERT INTO `operate_log` VALUES ('292', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-26 20:04:14');
INSERT INTO `operate_log` VALUES ('293', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 20:08:05');
INSERT INTO `operate_log` VALUES ('294', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 20:08:58');
INSERT INTO `operate_log` VALUES ('295', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-26 20:08:58');
INSERT INTO `operate_log` VALUES ('296', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-26 20:09:00');
INSERT INTO `operate_log` VALUES ('297', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 20:17:38');
INSERT INTO `operate_log` VALUES ('298', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 20:17:55');
INSERT INTO `operate_log` VALUES ('299', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-26 20:17:55');
INSERT INTO `operate_log` VALUES ('300', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-26 20:17:56');
INSERT INTO `operate_log` VALUES ('301', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 20:18:59');
INSERT INTO `operate_log` VALUES ('302', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 20:19:08');
INSERT INTO `operate_log` VALUES ('303', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-26 20:19:09');
INSERT INTO `operate_log` VALUES ('304', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-26 20:19:10');
INSERT INTO `operate_log` VALUES ('305', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-26 20:19:39');
INSERT INTO `operate_log` VALUES ('306', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 20:20:04');
INSERT INTO `operate_log` VALUES ('307', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 20:20:10');
INSERT INTO `operate_log` VALUES ('308', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-26 20:20:10');
INSERT INTO `operate_log` VALUES ('309', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-26 20:20:11');
INSERT INTO `operate_log` VALUES ('310', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 20:23:22');
INSERT INTO `operate_log` VALUES ('311', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 20:23:35');
INSERT INTO `operate_log` VALUES ('312', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-26 20:23:35');
INSERT INTO `operate_log` VALUES ('313', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-26 20:23:36');
INSERT INTO `operate_log` VALUES ('314', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 20:24:20');
INSERT INTO `operate_log` VALUES ('315', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 20:27:14');
INSERT INTO `operate_log` VALUES ('316', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 20:27:28');
INSERT INTO `operate_log` VALUES ('317', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-26 20:27:28');
INSERT INTO `operate_log` VALUES ('318', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-26 20:27:30');
INSERT INTO `operate_log` VALUES ('319', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 20:29:15');
INSERT INTO `operate_log` VALUES ('320', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 20:29:32');
INSERT INTO `operate_log` VALUES ('321', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-26 20:29:32');
INSERT INTO `operate_log` VALUES ('322', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-26 20:29:33');
INSERT INTO `operate_log` VALUES ('323', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 20:30:21');
INSERT INTO `operate_log` VALUES ('324', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 20:30:28');
INSERT INTO `operate_log` VALUES ('325', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-26 20:30:28');
INSERT INTO `operate_log` VALUES ('326', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-26 20:30:30');
INSERT INTO `operate_log` VALUES ('327', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 20:30:59');
INSERT INTO `operate_log` VALUES ('328', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 20:31:25');
INSERT INTO `operate_log` VALUES ('329', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-26 20:31:25');
INSERT INTO `operate_log` VALUES ('330', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 20:31:34');
INSERT INTO `operate_log` VALUES ('331', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 20:31:45');
INSERT INTO `operate_log` VALUES ('332', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-26 20:31:45');
INSERT INTO `operate_log` VALUES ('333', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-26 20:31:47');
INSERT INTO `operate_log` VALUES ('334', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 20:32:54');
INSERT INTO `operate_log` VALUES ('335', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 20:33:09');
INSERT INTO `operate_log` VALUES ('336', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-26 20:33:09');
INSERT INTO `operate_log` VALUES ('337', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-26 20:33:11');
INSERT INTO `operate_log` VALUES ('338', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 20:33:43');
INSERT INTO `operate_log` VALUES ('339', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 20:38:24');
INSERT INTO `operate_log` VALUES ('340', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 20:38:41');
INSERT INTO `operate_log` VALUES ('341', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-26 20:38:41');
INSERT INTO `operate_log` VALUES ('342', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-26 20:38:44');
INSERT INTO `operate_log` VALUES ('343', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 20:42:05');
INSERT INTO `operate_log` VALUES ('344', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 20:42:17');
INSERT INTO `operate_log` VALUES ('345', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-26 20:42:17');
INSERT INTO `operate_log` VALUES ('346', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-26 20:42:18');
INSERT INTO `operate_log` VALUES ('347', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-26 20:42:25');
INSERT INTO `operate_log` VALUES ('348', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 20:45:44');
INSERT INTO `operate_log` VALUES ('349', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 20:45:51');
INSERT INTO `operate_log` VALUES ('350', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-26 20:45:51');
INSERT INTO `operate_log` VALUES ('351', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-26 20:45:52');
INSERT INTO `operate_log` VALUES ('352', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 20:50:11');
INSERT INTO `operate_log` VALUES ('353', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 20:54:00');
INSERT INTO `operate_log` VALUES ('354', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 20:54:30');
INSERT INTO `operate_log` VALUES ('355', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-26 20:54:30');
INSERT INTO `operate_log` VALUES ('356', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-26 20:54:32');
INSERT INTO `operate_log` VALUES ('357', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 20:56:59');
INSERT INTO `operate_log` VALUES ('358', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 20:58:21');
INSERT INTO `operate_log` VALUES ('359', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 20:58:47');
INSERT INTO `operate_log` VALUES ('360', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-26 20:58:47');
INSERT INTO `operate_log` VALUES ('361', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-26 20:58:49');
INSERT INTO `operate_log` VALUES ('362', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 21:00:25');
INSERT INTO `operate_log` VALUES ('363', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 21:00:43');
INSERT INTO `operate_log` VALUES ('364', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-26 21:00:43');
INSERT INTO `operate_log` VALUES ('365', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-26 21:00:47');
INSERT INTO `operate_log` VALUES ('366', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 21:03:40');
INSERT INTO `operate_log` VALUES ('367', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 21:04:06');
INSERT INTO `operate_log` VALUES ('368', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-26 21:04:06');
INSERT INTO `operate_log` VALUES ('369', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-26 21:04:07');
INSERT INTO `operate_log` VALUES ('370', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 21:11:11');
INSERT INTO `operate_log` VALUES ('371', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 21:11:31');
INSERT INTO `operate_log` VALUES ('372', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 21:11:55');
INSERT INTO `operate_log` VALUES ('373', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-26 21:11:55');
INSERT INTO `operate_log` VALUES ('374', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-26 21:11:58');
INSERT INTO `operate_log` VALUES ('375', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 21:12:43');
INSERT INTO `operate_log` VALUES ('376', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-26 21:12:43');
INSERT INTO `operate_log` VALUES ('377', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-26 21:12:45');
INSERT INTO `operate_log` VALUES ('378', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 21:14:01');
INSERT INTO `operate_log` VALUES ('379', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 21:14:39');
INSERT INTO `operate_log` VALUES ('380', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-26 21:14:39');
INSERT INTO `operate_log` VALUES ('381', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-26 21:14:41');
INSERT INTO `operate_log` VALUES ('382', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 21:16:09');
INSERT INTO `operate_log` VALUES ('383', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 21:16:32');
INSERT INTO `operate_log` VALUES ('384', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-26 21:16:32');
INSERT INTO `operate_log` VALUES ('385', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-26 21:16:34');
INSERT INTO `operate_log` VALUES ('386', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 21:19:09');
INSERT INTO `operate_log` VALUES ('387', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 21:20:19');
INSERT INTO `operate_log` VALUES ('388', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 21:20:37');
INSERT INTO `operate_log` VALUES ('389', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-26 21:20:37');
INSERT INTO `operate_log` VALUES ('390', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-26 21:20:38');
INSERT INTO `operate_log` VALUES ('391', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 21:22:08');
INSERT INTO `operate_log` VALUES ('392', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 21:22:45');
INSERT INTO `operate_log` VALUES ('393', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-26 21:22:45');
INSERT INTO `operate_log` VALUES ('394', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-26 21:22:47');
INSERT INTO `operate_log` VALUES ('395', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 21:27:04');
INSERT INTO `operate_log` VALUES ('396', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 21:27:22');
INSERT INTO `operate_log` VALUES ('397', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-26 21:27:22');
INSERT INTO `operate_log` VALUES ('398', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-26 21:27:23');
INSERT INTO `operate_log` VALUES ('399', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 21:32:21');
INSERT INTO `operate_log` VALUES ('400', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 21:32:41');
INSERT INTO `operate_log` VALUES ('401', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 21:36:54');
INSERT INTO `operate_log` VALUES ('402', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 21:38:55');
INSERT INTO `operate_log` VALUES ('403', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 21:45:32');
INSERT INTO `operate_log` VALUES ('404', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 21:45:41');
INSERT INTO `operate_log` VALUES ('405', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 21:58:18');
INSERT INTO `operate_log` VALUES ('406', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 21:59:09');
INSERT INTO `operate_log` VALUES ('407', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 22:02:00');
INSERT INTO `operate_log` VALUES ('408', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 22:05:38');
INSERT INTO `operate_log` VALUES ('409', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 22:07:15');
INSERT INTO `operate_log` VALUES ('410', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 22:08:12');
INSERT INTO `operate_log` VALUES ('411', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-26 22:08:12');
INSERT INTO `operate_log` VALUES ('412', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-26 22:08:14');
INSERT INTO `operate_log` VALUES ('413', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 22:10:52');
INSERT INTO `operate_log` VALUES ('414', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 22:12:01');
INSERT INTO `operate_log` VALUES ('415', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 22:13:04');
INSERT INTO `operate_log` VALUES ('416', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-26 22:13:04');
INSERT INTO `operate_log` VALUES ('417', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-26 22:13:06');
INSERT INTO `operate_log` VALUES ('418', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-26 22:13:11');
INSERT INTO `operate_log` VALUES ('419', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 22:16:33');
INSERT INTO `operate_log` VALUES ('420', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 22:52:49');
INSERT INTO `operate_log` VALUES ('421', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 22:53:19');
INSERT INTO `operate_log` VALUES ('422', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-26 22:56:42');
INSERT INTO `operate_log` VALUES ('423', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-27 09:24:47');
INSERT INTO `operate_log` VALUES ('424', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-27 09:28:34');
INSERT INTO `operate_log` VALUES ('425', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-27 09:39:01');
INSERT INTO `operate_log` VALUES ('426', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-27 09:58:25');
INSERT INTO `operate_log` VALUES ('427', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-27 10:38:07');
INSERT INTO `operate_log` VALUES ('428', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-27 10:39:55');
INSERT INTO `operate_log` VALUES ('429', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-27 11:11:13');
INSERT INTO `operate_log` VALUES ('430', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-27 15:30:37');
INSERT INTO `operate_log` VALUES ('431', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-27 15:32:17');
INSERT INTO `operate_log` VALUES ('432', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-27 15:36:15');
INSERT INTO `operate_log` VALUES ('433', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-27 16:21:01');
INSERT INTO `operate_log` VALUES ('434', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-27 16:21:06');
INSERT INTO `operate_log` VALUES ('435', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-27 17:33:21');
INSERT INTO `operate_log` VALUES ('436', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-27 17:33:42');
INSERT INTO `operate_log` VALUES ('437', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-27 17:33:43');
INSERT INTO `operate_log` VALUES ('438', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-29 10:11:37');
INSERT INTO `operate_log` VALUES ('439', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-29 10:11:57');
INSERT INTO `operate_log` VALUES ('440', '1', '更新', '杨文君', '执行的操作是：updateHr', '2019-09-29 16:28:21');
INSERT INTO `operate_log` VALUES ('441', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-29 16:29:23');
INSERT INTO `operate_log` VALUES ('442', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-29 16:29:30');
INSERT INTO `operate_log` VALUES ('443', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-29 16:29:30');
INSERT INTO `operate_log` VALUES ('444', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-29 16:29:36');
INSERT INTO `operate_log` VALUES ('445', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-29 16:29:40');
INSERT INTO `operate_log` VALUES ('446', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-29 16:29:40');
INSERT INTO `operate_log` VALUES ('447', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-29 16:29:42');
INSERT INTO `operate_log` VALUES ('448', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-29 16:47:24');
INSERT INTO `operate_log` VALUES ('449', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-29 16:49:55');
INSERT INTO `operate_log` VALUES ('450', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-29 16:53:23');
INSERT INTO `operate_log` VALUES ('451', '1', '更新', '杨文君', '执行的操作是：updateHr', '2019-09-29 17:02:39');
INSERT INTO `operate_log` VALUES ('452', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-29 17:09:04');
INSERT INTO `operate_log` VALUES ('453', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-29 17:22:36');
INSERT INTO `operate_log` VALUES ('454', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-29 17:22:56');
INSERT INTO `operate_log` VALUES ('455', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-29 17:22:56');
INSERT INTO `operate_log` VALUES ('456', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-29 17:22:58');
INSERT INTO `operate_log` VALUES ('457', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-29 17:23:17');
INSERT INTO `operate_log` VALUES ('458', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-29 17:23:45');
INSERT INTO `operate_log` VALUES ('459', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-29 17:23:46');
INSERT INTO `operate_log` VALUES ('460', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-29 17:23:47');
INSERT INTO `operate_log` VALUES ('461', '4', '查询', '沈梦磊', '执行的操作是：loadListBranch', '2019-09-29 21:52:35');
INSERT INTO `operate_log` VALUES ('462', '4', '查询', '沈梦磊', '执行的操作是：loadListBranch', '2019-09-29 21:53:05');
INSERT INTO `operate_log` VALUES ('463', '4', '查询', '沈梦磊', '执行的操作是：loadListDepart', '2019-09-29 21:53:05');
INSERT INTO `operate_log` VALUES ('464', '4', '查询', '沈梦磊', '执行的操作是：loadListDepart', '2019-09-29 21:53:07');
INSERT INTO `operate_log` VALUES ('465', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-29 21:57:38');
INSERT INTO `operate_log` VALUES ('466', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-29 21:58:06');
INSERT INTO `operate_log` VALUES ('467', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-29 21:58:06');
INSERT INTO `operate_log` VALUES ('468', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-29 21:58:08');
INSERT INTO `operate_log` VALUES ('469', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-29 22:03:27');
INSERT INTO `operate_log` VALUES ('470', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-29 22:04:04');
INSERT INTO `operate_log` VALUES ('471', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-29 22:04:04');
INSERT INTO `operate_log` VALUES ('472', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-29 22:04:06');
INSERT INTO `operate_log` VALUES ('473', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-29 22:06:58');
INSERT INTO `operate_log` VALUES ('474', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-29 22:07:26');
INSERT INTO `operate_log` VALUES ('475', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-29 22:07:26');
INSERT INTO `operate_log` VALUES ('476', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-29 22:07:27');
INSERT INTO `operate_log` VALUES ('477', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-29 22:24:26');
INSERT INTO `operate_log` VALUES ('478', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-29 22:24:29');
INSERT INTO `operate_log` VALUES ('479', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-29 22:25:06');
INSERT INTO `operate_log` VALUES ('480', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-29 22:27:01');
INSERT INTO `operate_log` VALUES ('481', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-29 22:27:01');
INSERT INTO `operate_log` VALUES ('482', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-09-29 22:27:03');
INSERT INTO `operate_log` VALUES ('483', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-29 22:36:21');
INSERT INTO `operate_log` VALUES ('484', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-29 22:36:35');
INSERT INTO `operate_log` VALUES ('485', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-29 22:37:04');
INSERT INTO `operate_log` VALUES ('486', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-29 22:37:23');
INSERT INTO `operate_log` VALUES ('487', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-29 22:44:31');
INSERT INTO `operate_log` VALUES ('488', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-29 22:45:35');
INSERT INTO `operate_log` VALUES ('489', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-29 22:45:49');
INSERT INTO `operate_log` VALUES ('490', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-29 22:47:44');
INSERT INTO `operate_log` VALUES ('491', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-29 22:49:29');
INSERT INTO `operate_log` VALUES ('492', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-29 22:50:37');
INSERT INTO `operate_log` VALUES ('493', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-29 22:54:31');
INSERT INTO `operate_log` VALUES ('494', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-29 22:54:35');
INSERT INTO `operate_log` VALUES ('495', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-09-29 22:57:12');
INSERT INTO `operate_log` VALUES ('496', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-10-03 01:32:25');
INSERT INTO `operate_log` VALUES ('497', '1', '删除', '杨文君', '执行的操作是：deleteFile', '2019-10-05 13:55:00');
INSERT INTO `operate_log` VALUES ('498', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-10-08 10:42:16');
INSERT INTO `operate_log` VALUES ('499', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-10-08 10:49:14');
INSERT INTO `operate_log` VALUES ('500', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDesk', '2019-10-08 14:43:56');
INSERT INTO `operate_log` VALUES ('501', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDesk', '2019-10-08 14:48:05');
INSERT INTO `operate_log` VALUES ('502', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDesk', '2019-10-08 14:50:43');
INSERT INTO `operate_log` VALUES ('503', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDesk', '2019-10-08 14:57:29');
INSERT INTO `operate_log` VALUES ('504', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-10-08 15:30:15');
INSERT INTO `operate_log` VALUES ('505', '1', '添加', '杨文君', '执行的操作是：addFile', '2019-10-08 16:26:57');
INSERT INTO `operate_log` VALUES ('506', '1', '添加', '杨文君', '执行的操作是：addFile', '2019-10-08 16:27:53');
INSERT INTO `operate_log` VALUES ('507', '1', '添加', '杨文君', '执行的操作是：addFile', '2019-10-08 16:36:56');
INSERT INTO `operate_log` VALUES ('508', '1', '添加', '杨文君', '执行的操作是：addFile', '2019-10-08 16:41:00');
INSERT INTO `operate_log` VALUES ('509', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDesk', '2019-10-08 16:48:01');
INSERT INTO `operate_log` VALUES ('510', '1', '添加', '杨文君', '执行的操作是：addFile', '2019-10-08 17:17:13');
INSERT INTO `operate_log` VALUES ('511', '1', '添加', '杨文君', '执行的操作是：addFile', '2019-10-08 17:24:53');
INSERT INTO `operate_log` VALUES ('512', '1', '添加', '杨文君', '执行的操作是：addFile', '2019-10-08 22:33:35');
INSERT INTO `operate_log` VALUES ('513', '1', '删除', '杨文君', '执行的操作是：deleteFile', '2019-10-08 23:22:22');
INSERT INTO `operate_log` VALUES ('514', '1', '删除', '杨文君', '执行的操作是：deleteFile', '2019-10-08 23:25:09');
INSERT INTO `operate_log` VALUES ('515', '1', '删除', '杨文君', '执行的操作是：deleteFile', '2019-10-09 00:05:19');
INSERT INTO `operate_log` VALUES ('516', '1', '删除', '杨文君', '执行的操作是：deleteFile', '2019-10-09 00:07:55');
INSERT INTO `operate_log` VALUES ('517', '1', '删除', '杨文君', '执行的操作是：deleteFile', '2019-10-09 00:12:21');
INSERT INTO `operate_log` VALUES ('518', '1', '删除', '杨文君', '执行的操作是：deleteFile', '2019-10-09 00:13:42');
INSERT INTO `operate_log` VALUES ('519', '1', '删除', '杨文君', '执行的操作是：deleteFile', '2019-10-09 00:15:15');
INSERT INTO `operate_log` VALUES ('520', '1', '删除', '杨文君', '执行的操作是：deleteFile', '2019-10-09 00:18:21');
INSERT INTO `operate_log` VALUES ('521', '1', '删除', '杨文君', '执行的操作是：deleteFile', '2019-10-09 00:19:04');
INSERT INTO `operate_log` VALUES ('522', '1', '删除', '杨文君', '执行的操作是：deleteFile', '2019-10-09 00:25:46');
INSERT INTO `operate_log` VALUES ('523', '1', '删除', '杨文君', '执行的操作是：deleteFile', '2019-10-09 00:32:45');
INSERT INTO `operate_log` VALUES ('524', '1', '添加', '杨文君', '执行的操作是：addFile', '2019-10-09 09:20:54');
INSERT INTO `operate_log` VALUES ('525', '1', '添加', '杨文君', '执行的操作是：addFile', '2019-10-09 09:23:41');
INSERT INTO `operate_log` VALUES ('526', '1', '添加', '杨文君', '执行的操作是：addFile', '2019-10-09 09:25:38');
INSERT INTO `operate_log` VALUES ('527', '1', '删除', '杨文君', '执行的操作是：deleteFile', '2019-10-09 09:33:25');
INSERT INTO `operate_log` VALUES ('528', '1', '添加', '杨文君', '执行的操作是：addFile', '2019-10-09 17:30:05');
INSERT INTO `operate_log` VALUES ('529', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDesk', '2019-10-09 23:42:40');
INSERT INTO `operate_log` VALUES ('530', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDesk', '2019-10-09 23:48:01');
INSERT INTO `operate_log` VALUES ('531', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDbHasFileId', '2019-10-09 23:48:09');
INSERT INTO `operate_log` VALUES ('532', '1', '添加', '杨文君', '执行的操作是：addFile', '2019-10-09 23:59:13');
INSERT INTO `operate_log` VALUES ('533', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDb', '2019-10-09 23:59:56');
INSERT INTO `operate_log` VALUES ('534', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDesk', '2019-10-10 00:04:23');
INSERT INTO `operate_log` VALUES ('535', '1', '添加', '杨文君', '执行的操作是：addFile', '2019-10-10 00:04:23');
INSERT INTO `operate_log` VALUES ('536', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDesk', '2019-10-10 00:09:13');
INSERT INTO `operate_log` VALUES ('537', '1', '添加', '杨文君', '执行的操作是：addFile', '2019-10-10 00:09:13');
INSERT INTO `operate_log` VALUES ('538', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDb', '2019-10-10 00:10:00');
INSERT INTO `operate_log` VALUES ('539', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDesk', '2019-10-10 00:13:38');
INSERT INTO `operate_log` VALUES ('540', '1', '添加', '杨文君', '执行的操作是：addFile', '2019-10-10 00:13:38');
INSERT INTO `operate_log` VALUES ('541', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDb', '2019-10-10 00:14:57');
INSERT INTO `operate_log` VALUES ('542', '1', '删除', '杨文君', '执行的操作是：deleteFile', '2019-10-10 00:16:52');
INSERT INTO `operate_log` VALUES ('543', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDesk', '2019-10-10 00:17:54');
INSERT INTO `operate_log` VALUES ('544', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDesk', '2019-10-10 00:22:00');
INSERT INTO `operate_log` VALUES ('545', '1', '添加', '杨文君', '执行的操作是：addFile', '2019-10-10 00:22:00');
INSERT INTO `operate_log` VALUES ('546', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDesk', '2019-10-10 00:25:30');
INSERT INTO `operate_log` VALUES ('547', '1', '添加', '杨文君', '执行的操作是：addFile', '2019-10-10 00:25:30');
INSERT INTO `operate_log` VALUES ('548', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDesk', '2019-10-10 00:29:36');
INSERT INTO `operate_log` VALUES ('549', '1', '添加', '杨文君', '执行的操作是：addFile', '2019-10-10 00:29:36');
INSERT INTO `operate_log` VALUES ('550', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDesk', '2019-10-10 00:31:40');
INSERT INTO `operate_log` VALUES ('551', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDesk', '2019-10-10 00:37:58');
INSERT INTO `operate_log` VALUES ('552', '1', '添加', '杨文君', '执行的操作是：addFile', '2019-10-10 00:37:58');
INSERT INTO `operate_log` VALUES ('553', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDb', '2019-10-10 00:38:02');
INSERT INTO `operate_log` VALUES ('554', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDesk', '2019-10-10 09:13:35');
INSERT INTO `operate_log` VALUES ('555', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDesk', '2019-10-10 09:38:47');
INSERT INTO `operate_log` VALUES ('556', '1', '添加', '杨文君', '执行的操作是：addFile', '2019-10-10 09:38:47');
INSERT INTO `operate_log` VALUES ('557', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDb', '2019-10-10 09:42:42');
INSERT INTO `operate_log` VALUES ('558', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDesk', '2019-10-10 09:44:47');
INSERT INTO `operate_log` VALUES ('559', '1', '添加', '杨文君', '执行的操作是：addFile', '2019-10-10 09:44:47');
INSERT INTO `operate_log` VALUES ('560', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDb', '2019-10-10 09:47:19');
INSERT INTO `operate_log` VALUES ('561', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDesk', '2019-10-10 09:48:26');
INSERT INTO `operate_log` VALUES ('562', '1', '添加', '杨文君', '执行的操作是：addFile', '2019-10-10 09:48:26');
INSERT INTO `operate_log` VALUES ('563', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDesk', '2019-10-10 09:51:49');
INSERT INTO `operate_log` VALUES ('564', '1', '添加', '杨文君', '执行的操作是：addFile', '2019-10-10 09:51:49');
INSERT INTO `operate_log` VALUES ('565', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDesk', '2019-10-10 09:56:29');
INSERT INTO `operate_log` VALUES ('566', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDesk', '2019-10-10 10:20:22');
INSERT INTO `operate_log` VALUES ('567', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDesk', '2019-10-10 10:32:57');
INSERT INTO `operate_log` VALUES ('568', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDesk', '2019-10-10 10:33:43');
INSERT INTO `operate_log` VALUES ('569', '1', '添加', '杨文君', '执行的操作是：addFile', '2019-10-10 10:33:43');
INSERT INTO `operate_log` VALUES ('570', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDesk', '2019-10-10 10:41:09');
INSERT INTO `operate_log` VALUES ('571', '1', '添加', '杨文君', '执行的操作是：addFile', '2019-10-10 10:41:09');
INSERT INTO `operate_log` VALUES ('572', '1', '添加', '杨文君', '执行的操作是：addFile', '2019-10-10 11:04:19');
INSERT INTO `operate_log` VALUES ('573', '1', '添加', '杨文君', '执行的操作是：addFile', '2019-10-10 11:07:19');
INSERT INTO `operate_log` VALUES ('574', '1', '添加', '杨文君', '执行的操作是：addFile', '2019-10-10 11:09:41');
INSERT INTO `operate_log` VALUES ('575', '1', '添加', '杨文君', '执行的操作是：addFile', '2019-10-10 11:10:52');
INSERT INTO `operate_log` VALUES ('576', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDesk', '2019-10-10 11:12:41');
INSERT INTO `operate_log` VALUES ('577', '1', '添加', '杨文君', '执行的操作是：addFile', '2019-10-10 11:12:41');
INSERT INTO `operate_log` VALUES ('578', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDesk', '2019-10-10 11:15:07');
INSERT INTO `operate_log` VALUES ('579', '1', '添加', '杨文君', '执行的操作是：addFile', '2019-10-10 11:15:07');
INSERT INTO `operate_log` VALUES ('580', '1', '添加', '杨文君', '执行的操作是：addFile', '2019-10-10 11:17:39');
INSERT INTO `operate_log` VALUES ('581', '1', '添加', '杨文君', '执行的操作是：addFile', '2019-10-10 11:20:31');
INSERT INTO `operate_log` VALUES ('582', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDesk', '2019-10-10 11:20:31');
INSERT INTO `operate_log` VALUES ('583', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDesk', '2019-10-10 14:17:08');
INSERT INTO `operate_log` VALUES ('584', '1', '添加', '杨文君', '执行的操作是：addFile', '2019-10-10 14:17:43');
INSERT INTO `operate_log` VALUES ('585', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDesk', '2019-10-10 14:17:43');
INSERT INTO `operate_log` VALUES ('586', '1', '添加', '杨文君', '执行的操作是：addFile', '2019-10-10 14:19:52');
INSERT INTO `operate_log` VALUES ('587', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDesk', '2019-10-10 14:19:52');
INSERT INTO `operate_log` VALUES ('588', '1', '添加', '杨文君', '执行的操作是：addFile', '2019-10-10 14:24:07');
INSERT INTO `operate_log` VALUES ('589', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDesk', '2019-10-10 14:24:07');
INSERT INTO `operate_log` VALUES ('590', '1', '添加', '杨文君', '执行的操作是：addFile', '2019-10-10 14:27:32');
INSERT INTO `operate_log` VALUES ('591', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDesk', '2019-10-10 14:27:32');
INSERT INTO `operate_log` VALUES ('592', '1', '添加', '杨文君', '执行的操作是：addFile', '2019-10-10 14:35:26');
INSERT INTO `operate_log` VALUES ('593', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDesk', '2019-10-10 14:35:26');
INSERT INTO `operate_log` VALUES ('594', '1', '添加', '杨文君', '执行的操作是：addFile', '2019-10-10 14:35:44');
INSERT INTO `operate_log` VALUES ('595', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDesk', '2019-10-10 14:56:13');
INSERT INTO `operate_log` VALUES ('596', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDbHasFileId', '2019-10-10 14:56:21');
INSERT INTO `operate_log` VALUES ('597', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDesk', '2019-10-10 14:58:57');
INSERT INTO `operate_log` VALUES ('598', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDesk', '2019-10-10 15:00:09');
INSERT INTO `operate_log` VALUES ('599', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDbHasFileId', '2019-10-10 15:00:12');
INSERT INTO `operate_log` VALUES ('600', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDesk', '2019-10-10 15:05:05');
INSERT INTO `operate_log` VALUES ('601', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDesk', '2019-10-10 15:06:41');
INSERT INTO `operate_log` VALUES ('602', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDesk', '2019-10-10 15:08:57');
INSERT INTO `operate_log` VALUES ('603', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDesk', '2019-10-10 15:36:20');
INSERT INTO `operate_log` VALUES ('604', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDesk', '2019-10-10 15:37:37');
INSERT INTO `operate_log` VALUES ('605', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDesk', '2019-10-10 15:39:18');
INSERT INTO `operate_log` VALUES ('606', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDesk', '2019-10-10 15:40:48');
INSERT INTO `operate_log` VALUES ('607', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDesk', '2019-10-10 15:41:54');
INSERT INTO `operate_log` VALUES ('608', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDesk', '2019-10-10 15:44:28');
INSERT INTO `operate_log` VALUES ('609', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDbHasFileId', '2019-10-10 15:44:43');
INSERT INTO `operate_log` VALUES ('610', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDesk', '2019-10-10 15:46:16');
INSERT INTO `operate_log` VALUES ('611', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDbHasFileId', '2019-10-10 15:46:20');
INSERT INTO `operate_log` VALUES ('612', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDesk', '2019-10-10 15:49:58');
INSERT INTO `operate_log` VALUES ('613', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDbHasFileId', '2019-10-10 15:50:12');
INSERT INTO `operate_log` VALUES ('614', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDesk', '2019-10-10 15:53:23');
INSERT INTO `operate_log` VALUES ('615', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDesk', '2019-10-10 15:55:11');
INSERT INTO `operate_log` VALUES ('616', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDbHasFileId', '2019-10-10 15:55:15');
INSERT INTO `operate_log` VALUES ('617', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDesk', '2019-10-10 15:57:49');
INSERT INTO `operate_log` VALUES ('618', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDbHasFileId', '2019-10-10 15:58:02');
INSERT INTO `operate_log` VALUES ('619', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDesk', '2019-10-10 16:00:00');
INSERT INTO `operate_log` VALUES ('620', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDesk', '2019-10-10 16:02:16');
INSERT INTO `operate_log` VALUES ('621', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDbHasFileId', '2019-10-10 16:02:22');
INSERT INTO `operate_log` VALUES ('622', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDesk', '2019-10-10 16:04:04');
INSERT INTO `operate_log` VALUES ('623', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDesk', '2019-10-10 16:06:24');
INSERT INTO `operate_log` VALUES ('624', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDesk', '2019-10-10 16:09:02');
INSERT INTO `operate_log` VALUES ('625', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDesk', '2019-10-10 16:37:52');
INSERT INTO `operate_log` VALUES ('626', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDesk', '2019-10-10 16:39:15');
INSERT INTO `operate_log` VALUES ('627', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDesk', '2019-10-10 16:40:41');
INSERT INTO `operate_log` VALUES ('628', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDesk', '2019-10-10 16:41:43');
INSERT INTO `operate_log` VALUES ('629', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDesk', '2019-10-10 16:44:36');
INSERT INTO `operate_log` VALUES ('630', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDesk', '2019-10-10 16:46:16');
INSERT INTO `operate_log` VALUES ('631', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDbHasFileId', '2019-10-10 16:46:18');
INSERT INTO `operate_log` VALUES ('632', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-10-10 20:58:34');
INSERT INTO `operate_log` VALUES ('633', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDesk', '2019-10-10 21:40:10');
INSERT INTO `operate_log` VALUES ('634', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDbHasFileId', '2019-10-10 21:40:13');
INSERT INTO `operate_log` VALUES ('635', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDesk', '2019-10-11 00:03:53');
INSERT INTO `operate_log` VALUES ('636', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDesk', '2019-10-11 00:06:07');
INSERT INTO `operate_log` VALUES ('637', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDesk', '2019-10-11 00:10:37');
INSERT INTO `operate_log` VALUES ('638', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDbHasFileId', '2019-10-11 00:11:00');
INSERT INTO `operate_log` VALUES ('639', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDesk', '2019-10-11 00:17:20');
INSERT INTO `operate_log` VALUES ('640', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDbHasFileId', '2019-10-11 00:17:22');
INSERT INTO `operate_log` VALUES ('641', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDesk', '2019-10-11 00:18:24');
INSERT INTO `operate_log` VALUES ('642', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDbHasFileId', '2019-10-11 00:18:31');
INSERT INTO `operate_log` VALUES ('643', '1', '删除', '杨文君', '执行的操作是：deleteFile', '2019-10-11 00:18:59');
INSERT INTO `operate_log` VALUES ('644', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDesk', '2019-10-11 00:23:09');
INSERT INTO `operate_log` VALUES ('645', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDbHasFileId', '2019-10-11 00:23:16');
INSERT INTO `operate_log` VALUES ('646', '1', '删除', '杨文君', '执行的操作是：deleteFile', '2019-10-11 00:30:30');
INSERT INTO `operate_log` VALUES ('647', '1', '更新', '杨文君', '执行的操作是：updateUser', '2019-10-11 00:45:08');
INSERT INTO `operate_log` VALUES ('648', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-10-11 00:48:54');
INSERT INTO `operate_log` VALUES ('649', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-10-11 00:48:55');
INSERT INTO `operate_log` VALUES ('650', '1', '查询', '杨文君', '执行的操作是：loadUserLoginLog', '2019-10-11 00:49:02');
INSERT INTO `operate_log` VALUES ('651', '1', '查询', '杨文君', '执行的操作是：loadUserLoginLog', '2019-10-11 00:49:06');
INSERT INTO `operate_log` VALUES ('652', '1', '查询', '杨文君', '执行的操作是：loadUserLoginLog', '2019-10-11 00:49:20');
INSERT INTO `operate_log` VALUES ('653', '1', '查询', '杨文君', '执行的操作是：loadUserLoginLog', '2019-10-11 00:49:29');
INSERT INTO `operate_log` VALUES ('654', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-10-11 09:20:57');
INSERT INTO `operate_log` VALUES ('655', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-10-11 09:30:07');
INSERT INTO `operate_log` VALUES ('656', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDesk', '2019-10-11 09:58:42');
INSERT INTO `operate_log` VALUES ('657', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDesk', '2019-10-11 10:00:53');
INSERT INTO `operate_log` VALUES ('658', '1', '添加', '杨文君', '执行的操作是：addAccessoryToDbHasFileId', '2019-10-11 10:00:55');
INSERT INTO `operate_log` VALUES ('659', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-10-11 10:33:14');
INSERT INTO `operate_log` VALUES ('660', '4', '查询', '沈梦磊', '执行的操作是：loadListBranch', '2019-10-11 10:33:59');
INSERT INTO `operate_log` VALUES ('661', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-10-11 12:27:10');
INSERT INTO `operate_log` VALUES ('662', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-10-11 12:27:13');
INSERT INTO `operate_log` VALUES ('663', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-10-11 14:52:56');
INSERT INTO `operate_log` VALUES ('664', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-10-11 14:53:01');
INSERT INTO `operate_log` VALUES ('665', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-10-11 14:53:01');
INSERT INTO `operate_log` VALUES ('666', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-10-11 14:53:03');
INSERT INTO `operate_log` VALUES ('667', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-10-11 14:58:05');
INSERT INTO `operate_log` VALUES ('668', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-10-11 14:58:09');
INSERT INTO `operate_log` VALUES ('669', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-10-11 14:58:12');
INSERT INTO `operate_log` VALUES ('670', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-10-11 14:58:12');
INSERT INTO `operate_log` VALUES ('671', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-10-11 14:58:15');
INSERT INTO `operate_log` VALUES ('672', '1', '统计', '杨文君', '执行的操作是：countSign', '2019-10-11 14:58:39');
INSERT INTO `operate_log` VALUES ('673', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-10-11 14:58:53');
INSERT INTO `operate_log` VALUES ('674', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-10-11 14:58:58');
INSERT INTO `operate_log` VALUES ('675', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-10-11 14:58:58');
INSERT INTO `operate_log` VALUES ('676', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-10-11 15:01:15');
INSERT INTO `operate_log` VALUES ('677', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-10-11 15:01:23');
INSERT INTO `operate_log` VALUES ('678', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-10-11 15:01:45');
INSERT INTO `operate_log` VALUES ('679', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-10-11 15:01:45');
INSERT INTO `operate_log` VALUES ('680', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-10-11 15:01:46');
INSERT INTO `operate_log` VALUES ('681', '1', '统计', '杨文君', '执行的操作是：countSign', '2019-10-11 15:01:49');
INSERT INTO `operate_log` VALUES ('682', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-10-11 15:04:40');
INSERT INTO `operate_log` VALUES ('683', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-10-11 15:09:01');
INSERT INTO `operate_log` VALUES ('684', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-10-11 15:10:42');
INSERT INTO `operate_log` VALUES ('685', '1', '添加', '杨文君', '执行的操作是：addRoleById', '2019-10-11 16:17:27');
INSERT INTO `operate_log` VALUES ('686', '1', '删除', '杨文君', '执行的操作是：deleteNote', '2019-10-11 16:17:34');
INSERT INTO `operate_log` VALUES ('687', '1', '添加', '杨文君', '执行的操作是：addRoleById', '2019-10-11 16:17:59');
INSERT INTO `operate_log` VALUES ('688', '1', '删除', '杨文君', '执行的操作是：deleteNote', '2019-10-11 16:18:41');
INSERT INTO `operate_log` VALUES ('689', '1', '查询', '杨文君', '执行的操作是：loadUserLoginLog', '2019-10-11 16:18:43');
INSERT INTO `operate_log` VALUES ('690', '1', '添加', '杨文君', '执行的操作是：addPowerById', '2019-10-11 16:19:04');
INSERT INTO `operate_log` VALUES ('691', '1', '查询', '杨文君', '执行的操作是：loadUserLoginLog', '2019-10-11 16:19:09');
INSERT INTO `operate_log` VALUES ('692', '1', '查询', '杨文君', '执行的操作是：loadUserLoginLog', '2019-10-11 16:19:20');
INSERT INTO `operate_log` VALUES ('697', '1', '查询', '杨文君', '执行的操作是：loadAllOperateLog', '2019-10-11 16:20:39');
INSERT INTO `operate_log` VALUES ('698', '1', '删除', '杨文君', '执行的操作是：deleteBatchExp', '2019-10-11 16:20:49');
INSERT INTO `operate_log` VALUES ('699', '1', '查询', '杨文君', '执行的操作是：loadAllOperateLog', '2019-10-11 16:20:49');
INSERT INTO `operate_log` VALUES ('700', '1', '更新', '杨文君', '执行的操作是：updateUser', '2019-10-11 16:22:16');
INSERT INTO `operate_log` VALUES ('701', '1', '更新', '杨文君', '执行的操作是：updateUser', '2019-10-11 16:22:28');
INSERT INTO `operate_log` VALUES ('702', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-10-11 16:22:50');
INSERT INTO `operate_log` VALUES ('703', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-10-11 16:26:00');
INSERT INTO `operate_log` VALUES ('704', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-10-11 16:27:15');
INSERT INTO `operate_log` VALUES ('705', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-10-11 16:28:09');
INSERT INTO `operate_log` VALUES ('706', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-10-11 16:28:48');
INSERT INTO `operate_log` VALUES ('707', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-10-11 16:28:48');
INSERT INTO `operate_log` VALUES ('708', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-10-11 16:28:50');
INSERT INTO `operate_log` VALUES ('709', '1', '查询', '杨文君', '执行的操作是：selectUsers', '2019-10-11 16:28:51');
INSERT INTO `operate_log` VALUES ('710', '1', '添加', '杨文君', '执行的操作是：addMessage', '2019-10-11 16:29:01');
INSERT INTO `operate_log` VALUES ('711', '1', '删除', '杨文君', '执行的操作是：deleteMessages', '2019-10-11 16:29:33');
INSERT INTO `operate_log` VALUES ('712', '4', '查询', '沈梦磊', '执行的操作是：loadListBranch', '2019-10-11 16:32:36');
INSERT INTO `operate_log` VALUES ('713', '4', '查询', '沈梦磊', '执行的操作是：loadListBranch', '2019-10-11 16:33:03');
INSERT INTO `operate_log` VALUES ('714', '4', '查询', '沈梦磊', '执行的操作是：loadListDepart', '2019-10-11 16:33:03');
INSERT INTO `operate_log` VALUES ('715', '4', '查询', '沈梦磊', '执行的操作是：loadListDepart', '2019-10-11 16:33:04');
INSERT INTO `operate_log` VALUES ('716', '4', '查询', '沈梦磊', '执行的操作是：selectUsers', '2019-10-11 16:33:06');
INSERT INTO `operate_log` VALUES ('717', '4', '查询', '沈梦磊', '执行的操作是：loadListBranch', '2019-10-11 16:34:38');
INSERT INTO `operate_log` VALUES ('718', '4', '查询', '沈梦磊', '执行的操作是：loadListDepart', '2019-10-11 16:34:38');
INSERT INTO `operate_log` VALUES ('719', '4', '查询', '沈梦磊', '执行的操作是：loadListDepart', '2019-10-11 16:34:40');
INSERT INTO `operate_log` VALUES ('720', '4', '查询', '沈梦磊', '执行的操作是：selectUsers', '2019-10-11 16:34:42');
INSERT INTO `operate_log` VALUES ('721', '4', '添加', '沈梦磊', '执行的操作是：addMessage', '2019-10-11 16:34:48');
INSERT INTO `operate_log` VALUES ('722', '4', '查询', '沈梦磊', '执行的操作是：loadListBranch', '2019-10-11 16:35:19');
INSERT INTO `operate_log` VALUES ('723', '4', '查询', '沈梦磊', '执行的操作是：loadListBranch', '2019-10-11 16:37:54');
INSERT INTO `operate_log` VALUES ('724', '4', '查询', '沈梦磊', '执行的操作是：loadListBranch', '2019-10-11 16:38:21');
INSERT INTO `operate_log` VALUES ('725', '4', '查询', '沈梦磊', '执行的操作是：loadListDepart', '2019-10-11 16:38:21');
INSERT INTO `operate_log` VALUES ('726', '4', '查询', '沈梦磊', '执行的操作是：loadListDepart', '2019-10-11 16:38:22');
INSERT INTO `operate_log` VALUES ('727', '4', '查询', '沈梦磊', '执行的操作是：selectUsers', '2019-10-11 16:38:23');
INSERT INTO `operate_log` VALUES ('728', '4', '添加', '沈梦磊', '执行的操作是：addMessage', '2019-10-11 16:38:36');
INSERT INTO `operate_log` VALUES ('729', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-10-11 16:44:03');
INSERT INTO `operate_log` VALUES ('730', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-10-11 16:44:30');
INSERT INTO `operate_log` VALUES ('731', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-10-11 16:44:30');
INSERT INTO `operate_log` VALUES ('732', '1', '查询', '杨文君', '执行的操作是：loadListDepart', '2019-10-11 16:44:32');
INSERT INTO `operate_log` VALUES ('733', '1', '统计', '杨文君', '执行的操作是：countSign', '2019-10-11 16:44:33');
INSERT INTO `operate_log` VALUES ('734', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-10-11 16:49:43');
INSERT INTO `operate_log` VALUES ('735', '1', '查询', '杨文君', '执行的操作是：loadListBranch', '2019-10-11 22:20:10');

-- ----------------------------
-- Table structure for pre_contract
-- ----------------------------
DROP TABLE IF EXISTS `pre_contract`;
CREATE TABLE `pre_contract` (
  `preContractId` int(11) NOT NULL AUTO_INCREMENT COMMENT '预约序号Id',
  `scheduleId` int(11) NOT NULL COMMENT '日程Id',
  `userId` varchar(50) NOT NULL COMMENT '预约人',
  PRIMARY KEY (`preContractId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pre_contract
-- ----------------------------
INSERT INTO `pre_contract` VALUES ('100', '100', 'string');
INSERT INTO `pre_contract` VALUES ('101', '106', 'fff');
INSERT INTO `pre_contract` VALUES ('102', '111', '454');
INSERT INTO `pre_contract` VALUES ('103', '114', '1');
INSERT INTO `pre_contract` VALUES ('104', '119', 'kjhk');

-- ----------------------------
-- Table structure for read_common_message
-- ----------------------------
DROP TABLE IF EXISTS `read_common_message`;
CREATE TABLE `read_common_message` (
  `readId` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号Id',
  `messageId` int(11) NOT NULL COMMENT '消息Id',
  `userId` varchar(50) NOT NULL COMMENT '消息读取者',
  PRIMARY KEY (`readId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of read_common_message
-- ----------------------------

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `roleId` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `roleName` varchar(50) NOT NULL COMMENT '角色名称',
  `roleDesc` varchar(50) DEFAULT NULL COMMENT '角色描述',
  PRIMARY KEY (`roleId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '管理员', '就是管理员啊');
INSERT INTO `role` VALUES ('2', '用户', '普普通通的用户');
INSERT INTO `role` VALUES ('93', '角色1', '角色描述1');
INSERT INTO `role` VALUES ('94', '角色2', '角色描述2');
INSERT INTO `role` VALUES ('95', '角色3', '角色描述3');
INSERT INTO `role` VALUES ('96', '角色4', '角色描述4');
INSERT INTO `role` VALUES ('97', '角色5', '角色描述5');
INSERT INTO `role` VALUES ('98', '角色6', '角色描述6');
INSERT INTO `role` VALUES ('99', '角色7', '角色描述7');

-- ----------------------------
-- Table structure for role_right
-- ----------------------------
DROP TABLE IF EXISTS `role_right`;
CREATE TABLE `role_right` (
  `roleRightId` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色权限id',
  `roleId` int(11) NOT NULL COMMENT '角色id',
  `nodeId` int(11) NOT NULL COMMENT '菜单节点id',
  PRIMARY KEY (`roleRightId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_right
-- ----------------------------
INSERT INTO `role_right` VALUES ('1', '1', '1');
INSERT INTO `role_right` VALUES ('2', '1', '2');
INSERT INTO `role_right` VALUES ('3', '1', '3');
INSERT INTO `role_right` VALUES ('4', '1', '4');
INSERT INTO `role_right` VALUES ('5', '1', '5');
INSERT INTO `role_right` VALUES ('6', '1', '6');
INSERT INTO `role_right` VALUES ('7', '1', '7');
INSERT INTO `role_right` VALUES ('8', '1', '8');
INSERT INTO `role_right` VALUES ('9', '1', '9');
INSERT INTO `role_right` VALUES ('10', '1', '10');
INSERT INTO `role_right` VALUES ('11', '1', '11');
INSERT INTO `role_right` VALUES ('12', '1', '12');
INSERT INTO `role_right` VALUES ('13', '1', '13');
INSERT INTO `role_right` VALUES ('14', '1', '14');
INSERT INTO `role_right` VALUES ('15', '1', '15');
INSERT INTO `role_right` VALUES ('16', '1', '16');
INSERT INTO `role_right` VALUES ('17', '1', '17');
INSERT INTO `role_right` VALUES ('18', '1', '18');
INSERT INTO `role_right` VALUES ('19', '1', '19');
INSERT INTO `role_right` VALUES ('20', '1', '20');
INSERT INTO `role_right` VALUES ('21', '1', '21');
INSERT INTO `role_right` VALUES ('22', '1', '22');
INSERT INTO `role_right` VALUES ('23', '1', '23');
INSERT INTO `role_right` VALUES ('24', '1', '24');
INSERT INTO `role_right` VALUES ('25', '1', '25');
INSERT INTO `role_right` VALUES ('26', '2', '3');
INSERT INTO `role_right` VALUES ('27', '2', '4');
INSERT INTO `role_right` VALUES ('28', '2', '5');
INSERT INTO `role_right` VALUES ('29', '2', '7');
INSERT INTO `role_right` VALUES ('30', '2', '11');
INSERT INTO `role_right` VALUES ('31', '2', '12');
INSERT INTO `role_right` VALUES ('32', '2', '13');
INSERT INTO `role_right` VALUES ('33', '2', '14');
INSERT INTO `role_right` VALUES ('34', '2', '15');
INSERT INTO `role_right` VALUES ('35', '2', '16');
INSERT INTO `role_right` VALUES ('36', '2', '17');
INSERT INTO `role_right` VALUES ('37', '2', '18');
INSERT INTO `role_right` VALUES ('38', '2', '23');
INSERT INTO `role_right` VALUES ('103', '93', '2');
INSERT INTO `role_right` VALUES ('104', '93', '8');
INSERT INTO `role_right` VALUES ('105', '93', '9');
INSERT INTO `role_right` VALUES ('106', '93', '10');

-- ----------------------------
-- Table structure for schedule
-- ----------------------------
DROP TABLE IF EXISTS `schedule`;
CREATE TABLE `schedule` (
  `scheduleId` int(11) NOT NULL AUTO_INCREMENT COMMENT '日程Id',
  `title` varchar(50) NOT NULL COMMENT '日程标题',
  `address` varchar(500) NOT NULL COMMENT '会议地址',
  `meetingId` int(11) NOT NULL COMMENT '会议类型',
  `beginTime` datetime NOT NULL COMMENT '日程开始时间',
  `endTime` datetime NOT NULL COMMENT '日程结束时间',
  `schContent` varchar(500) NOT NULL COMMENT '日程内容',
  `createUser` varchar(50) NOT NULL COMMENT '创建者',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `ifPrivate` varchar(1) NOT NULL COMMENT '是否私有（0:否；1：私有）',
  PRIMARY KEY (`scheduleId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of schedule
-- ----------------------------
INSERT INTO `schedule` VALUES ('1', '9.18日程', '昆山', '1', '2019-09-18 16:38:10', '2019-09-19 16:38:15', '测试一下啦啦啦啦啦啦啦啦啦啦啦啦啦啦', 'ywj', '2019-09-26 16:38:36', '0');
INSERT INTO `schedule` VALUES ('3', '9.30日程', '上海', '2', '2019-09-30 09:31:14', '2019-09-24 09:31:17', '测试一下啦啦啦啦啦啦啦啦啦啦啦啦啦啦', 'ywj', '2019-09-24 09:31:33', '0');
INSERT INTO `schedule` VALUES ('6', '9.24日程', '非洲', '4', '2019-09-24 00:00:00', '2019-09-26 00:00:00', '傻子婷', 'cyt', '2019-09-24 17:19:14', '0');
INSERT INTO `schedule` VALUES ('7', '10.2日程', '沈阳', '5', '2019-10-02 00:00:00', '2019-10-28 00:00:00', '傻子婷', 'lzt', '2019-10-01 17:29:41', '0');
INSERT INTO `schedule` VALUES ('8', '9.25日程', '苏州', '2', '2019-09-25 10:27:53', '2019-09-25 10:28:04', '嗯嗯', 'lzt', '2019-09-10 10:28:44', '0');
INSERT INTO `schedule` VALUES ('9', '9.27日程', '北京', '4', '2019-09-27 10:29:21', '2019-09-27 10:29:27', '哈哈', 'cyt', '2019-09-26 10:29:42', '0');
INSERT INTO `schedule` VALUES ('10', '9.25日程', '广州', '1', '2019-09-25 10:30:29', '2019-10-08 10:30:22', '嘻嘻', 'ywj', '2019-09-17 10:30:04', '0');

-- ----------------------------
-- Table structure for sys_fun
-- ----------------------------
DROP TABLE IF EXISTS `sys_fun`;
CREATE TABLE `sys_fun` (
  `nodeId` int(11) NOT NULL COMMENT '菜单节点id',
  `displayName` varchar(50) NOT NULL COMMENT '菜单名称',
  `nodeURL` varchar(50) DEFAULT NULL COMMENT '菜单连接地址',
  `path` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `component` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `displayOrder` int(11) NOT NULL COMMENT '菜单显示顺序',
  `parentNodeId` int(11) NOT NULL COMMENT '父节点id',
  PRIMARY KEY (`nodeId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_fun
-- ----------------------------
INSERT INTO `sys_fun` VALUES ('1', '所有', '/', null, null, '1', '1');
INSERT INTO `sys_fun` VALUES ('2', '人事管理', '/', '/home', 'Home', '2', '1');
INSERT INTO `sys_fun` VALUES ('3', '日程管理', '/', '/home', 'Home', '3', '1');
INSERT INTO `sys_fun` VALUES ('4', '文档管理', '/', '/home', 'Home', '4', '1');
INSERT INTO `sys_fun` VALUES ('5', '消息管理', '/', '/home', 'Home', '5', '1');
INSERT INTO `sys_fun` VALUES ('6', '系统管理', '/', '/home', 'Home', '6', '1');
INSERT INTO `sys_fun` VALUES ('7', '考勤系统', '/', '/home', 'Home', '7', '1');
INSERT INTO `sys_fun` VALUES ('8', '机构管理', '/home/branchmessage/**', '/person/mechanism/MechanismIndex', 'MechanismIndex', '1', '2');
INSERT INTO `sys_fun` VALUES ('9', '部门管理', '/home/departmessage/**', '/person/department/DepartmentIndex', 'DepartmentIndex', '2', '2');
INSERT INTO `sys_fun` VALUES ('10', '员工管理', '/home/usermessage/**', '/person/employee/EmployeeIndex', 'EmployeeIndex', '3', '2');
INSERT INTO `sys_fun` VALUES ('11', '我的日程', '/myschedule/**', '/schedule/myself/MyselfIndex', 'MyselfIndex', '1', '3');
INSERT INTO `sys_fun` VALUES ('12', '部门日程', '/myschedule/**', '/schedule/department/DepartmentIndex2', 'DepartmentIndex2', '2', '3');
INSERT INTO `sys_fun` VALUES ('13', '我的便签', '/mynote/**', '/schedule/note/NoteIndex', 'NoteIndex', '3', '3');
INSERT INTO `sys_fun` VALUES ('14', '文档管理', '/', '/file/file/FileTree', 'FileTree', '1', '4');
INSERT INTO `sys_fun` VALUES ('15', '回收站', '/', '/file/recycle_bin/RecycleBinIndex', 'RecycleBinIndex', '2', '4');
INSERT INTO `sys_fun` VALUES ('16', '文件搜索', '/', '/file/file_search/FileSearchIndex', 'FileSearchIndex', '3', '4');
INSERT INTO `sys_fun` VALUES ('17', '消息管理', '/message/**', '/news/news/NewsIndex', 'NewsIndex', '1', '5');
INSERT INTO `sys_fun` VALUES ('18', '信箱', '/message/**', '/news/mailbox/MailboxIndex', 'MailboxIndex', '2', '5');
INSERT INTO `sys_fun` VALUES ('19', '角色管理', '/system/loginlog/**', '/system/role/RoleIndex', 'RoleIndex', '1', '6');
INSERT INTO `sys_fun` VALUES ('20', '登录日志', '/system/loginlog/**', '/system/login_record/LoginRecordIndex', 'LoginRecordIndex', '2', '6');
INSERT INTO `sys_fun` VALUES ('21', '操作日志', '/system/operatelog/**', '/system/operation_record/OperationRecordIndex', 'OperationRecordIndex', '3', '6');
INSERT INTO `sys_fun` VALUES ('22', '菜单排序', '/menu/**', '/system/menu_sort/MenuSortIndex', 'MenuSortIndex', '4', '6');
INSERT INTO `sys_fun` VALUES ('23', '员工签到、签退', '/admin/**', '/attendance/attendance_card/AttendanceCardIndex', 'AttendanceCardIndex', '1', '7');
INSERT INTO `sys_fun` VALUES ('24', '考勤历史查询', '/admin/**', '/attendance/attendance_record/AttendanceRecordIndex', 'AttendanceRecordIndex', '2', '7');
INSERT INTO `sys_fun` VALUES ('25', '考勤统计', '/admin/**', '/attendance/attendance_statistics/AttendanceStatisticsIndex', 'AttendanceStatisticsIndex', '3', '7');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userId` int(11) NOT NULL COMMENT '用户唯一标识',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `chineseName` varchar(50) NOT NULL COMMENT '中文名',
  `departId` int(11) NOT NULL COMMENT '所在部门',
  `gender` varchar(10) NOT NULL COMMENT '性别',
  `roleId` int(11) NOT NULL COMMENT '用户角色',
  `userState` int(11) NOT NULL COMMENT '用户状态',
  PRIMARY KEY (`userId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'ywj', '$2a$10$2JG3SqNowI4PNyDpWCbonO9W7WBX0Kq/bZmrmVTcI2gWbxJUaCBj6', '杨文君', '40', 'Female', '1', '1');
INSERT INTO `user` VALUES ('2', 'sx', '$2a$10$7033HMyMGJ3CW2vOjxA78.GFIUV7dUmKOsazQII.nYvg.yqV.nyYO', '孙欣', '41', 'Female', '1', '1');
INSERT INTO `user` VALUES ('3', 'cyt', '$2a$10$7033HMyMGJ3CW2vOjxA78.GFIUV7dUmKOsazQII.nYvg.yqV.nyYO', '翠羽霆', '42', 'Female', '1', '1');
INSERT INTO `user` VALUES ('4', 'sml', '$2a$10$7033HMyMGJ3CW2vOjxA78.GFIUV7dUmKOsazQII.nYvg.yqV.nyYO', '沈梦磊', '40', 'Male', '2', '1');
INSERT INTO `user` VALUES ('5', 'lxy', '$2a$10$7033HMyMGJ3CW2vOjxA78.GFIUV7dUmKOsazQII.nYvg.yqV.nyYO', '刘翔宇', '44', 'Male', '2', '1');
INSERT INTO `user` VALUES ('6', 'frf', '$2a$10$7033HMyMGJ3CW2vOjxA78.GFIUV7dUmKOsazQII.nYvg.yqV.nyYO', '阿福', '45', 'Male', '2', '1');
INSERT INTO `user` VALUES ('7', 'lzt', '$2a$10$7033HMyMGJ3CW2vOjxA78.GFIUV7dUmKOsazQII.nYvg.yqV.nyYO', '小鹿', '46', 'Female', '1', '1');

-- ----------------------------
-- Table structure for user_state
-- ----------------------------
DROP TABLE IF EXISTS `user_state`;
CREATE TABLE `user_state` (
  `userStateId` int(11) NOT NULL COMMENT '1：正常状态；0：被屏蔽',
  `userStateName` varchar(50) NOT NULL,
  PRIMARY KEY (`userStateId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_state
-- ----------------------------
INSERT INTO `user_state` VALUES ('0', '被屏蔽');
INSERT INTO `user_state` VALUES ('1', '正常状态');

-- ----------------------------
-- Table structure for work_time
-- ----------------------------
DROP TABLE IF EXISTS `work_time`;
CREATE TABLE `work_time` (
  `workTimeId` int(11) NOT NULL AUTO_INCREMENT COMMENT '工作时间Id',
  `onDutyTime` varchar(50) NOT NULL COMMENT '上班时间',
  `offDutyTime` varchar(50) NOT NULL COMMENT '下班时间',
  PRIMARY KEY (`workTimeId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_time
-- ----------------------------
INSERT INTO `work_time` VALUES ('1', '08:00:00', '18:00:00');
