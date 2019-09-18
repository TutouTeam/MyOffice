

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `employee`
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `empId` bigint(20) DEFAULT NULL COMMENT '工号',
  `chineseName` varchar(50) DEFAULT NULL COMMENT '员工中文姓名',
  `gender` varchar(10) DEFAULT NULL COMMENT '性别',
  `grade` varchar(50) DEFAULT NULL COMMENT '员工级别（从指定列表中选择）',
  `hireDate` date DEFAULT NULL COMMENT '入职日期',
  `department` varchar(50) DEFAULT NULL COMMENT '部门（从指定列表中选择）',
  `legalEntity` varchar(50) DEFAULT NULL COMMENT 'UNKNOWN',
  `workingLocation` varchar(50) DEFAULT NULL COMMENT '工作地点',
  `teachingStartDate` date DEFAULT NULL COMMENT '培训开始日期',
  `phone` varchar(50) DEFAULT NULL COMMENT '电话号码',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `school` varchar(100) DEFAULT NULL COMMENT '毕业院校',
  `major` varchar(100) DEFAULT NULL COMMENT '所属专业',
  `degree` varchar(50) DEFAULT NULL COMMENT '学历',
  `graduationYear` varchar(10) DEFAULT NULL COMMENT '毕业年份',
  `cst` varchar(50) DEFAULT NULL COMMENT 'CST（从指定列表中选择）',
  `subCst` varchar(50) DEFAULT NULL COMMENT 'SubCST（从指定列表中选择）',
  `skillGroup` varchar(50) DEFAULT NULL,
  `skillSets` varchar(50) DEFAULT NULL,
  `leaveDate` date DEFAULT NULL COMMENT '离职时间',
  `terminationType` varchar(100) DEFAULT NULL COMMENT '离职类型',
  `terminationReason` varchar(255) DEFAULT NULL COMMENT '离职理由',
  `exitComments` varchar(255) DEFAULT NULL COMMENT 'Exit interview comments',
  `leavingAccount` varchar(100) DEFAULT NULL COMMENT 'Leaving Account',
  `formerId` varchar(20) DEFAULT NULL COMMENT '曾用员工ID',
  `birthday` date DEFAULT NULL COMMENT '展示请用MM-DD-YYYY',
  `createUser` bigint(20) DEFAULT NULL COMMENT '记录创建人',
  `createTime` datetime DEFAULT NULL COMMENT '记录创建时间',
  `updateUser` bigint(20) DEFAULT NULL COMMENT '记录更新人',
  `updateTime` datetime DEFAULT NULL COMMENT '记录更新时间',
  `isDeleted` varchar(1) DEFAULT '0' COMMENT '删除标志位（0：正常，1：删除）',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `workID_key` (`empId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4681 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('4645', '30231', '李彤', 'Male', 'X1', '2018-07-10', 'East', 'Capgemini', 'Kunshan', '2018-12-14', '18846436562', 'tong.a.li@capgemini.com', '黑龙江大学', '国贸', '本科', '2019', 'CST ERP', 'CST ERP', 'SG', 'SS', '2019-07-26', 'Voluntary', 'Better Pay/Rewards', 'Thanks.', 'LA', '30111', '1990-02-06', '1', '2019-08-01 09:49:26', '1', '2019-08-01 02:50:41', '1');
INSERT INTO `employee` VALUES ('4646', '30171', '孙志刚', 'Male', 'X1', '2019-07-18', 'North', 'Capgemini', 'Kunshan', '2018-11-14', '15189827779', 'zhigang.sun@capgemini.com', '南京信息工程大学', '软件工程', '本科', '2019', 'CST PMO', 'CST PMO\r\n', 'SG', 'SS', '2019-07-29', 'Voluntary', 'Better Pay/Rewards', 'Thanks.', 'LA', '30100', '1999-03-29', '1', '2019-08-01 09:49:26', '1', '2019-08-01 02:50:41', '1');
INSERT INTO `employee` VALUES ('4647', '32222', '王超', 'Male', 'C1', '2019-07-03', 'East', 'Capgemini', 'Shanghai', '2019-06-26', '13827642387', '29184@qq.com', '辽宁大学', '数学', '博士', '2011', 'CST SFDC', 'CST SFDC', 'SG', 'SS', null, null, null, null, null, null, '1990-04-05', '1', '2019-08-01 09:49:26', '1', '2019-08-01 02:50:41', '1');
INSERT INTO `employee` VALUES ('4648', '32112', '华斌', 'Male', 'C2', '2019-07-02', 'East', 'Capgemini', 'Shanghai', '2019-06-22', '15629839222', 'asfiug@163.com', '长春工业大学', '计算机', '博士', '2011', 'CST CSD', 'CST CSD', 'SG', 'SS', '2019-07-28', 'Voluntary', 'Others', '', '', '30023', '1989-02-26', '1', '2019-08-01 09:49:26', '1', '2019-08-01 02:50:41', '1');
INSERT INTO `employee` VALUES ('4649', '31211', '李渡', 'Male', 'C1', '2019-07-02', 'East', 'capgemini', 'Beijing', '2019-06-25', '13827642387', '29184@qq.com', '辽宁大学', '数学', '博士', '2013', 'CST SFDC', 'CST SFDC', 'SG', 'SS', null, null, null, null, null, null, '1990-05-31', '1', '2019-08-01 09:49:27', '1', '2019-08-01 02:50:41', '1');
INSERT INTO `employee` VALUES ('4650', '32330', '王伟', 'Male', 'C2', '2019-07-04', 'East', 'Capgemini', 'Shanghai', '2019-06-24', '15629839222', 'asfiug@163.com', '长春工业大学', '计算机', '本科', '2020', 'CST CSD', 'CST CSD', 'SG', 'SS', '2019-06-26', 'Voluntary', 'Others', '', '', '30012', '1999-06-27', '1', '2019-08-01 09:49:27', '1', '2019-08-01 02:50:41', '1');
INSERT INTO `employee` VALUES ('4651', '31410', '付丽耀', 'Female', 'C1', '2019-07-05', 'East', 'Capgemini', 'Guangzhou', '2019-06-28', '13827642387', '29184@qq.com', '辽宁大学', '计算机', '本科', '2020', 'CST SFDC', 'CST SFDC', 'SG', 'SS', null, null, null, null, null, null, '1998-04-05', '1', '2019-08-01 09:49:27', '1', '2019-08-01 02:50:41', '1');
INSERT INTO `employee` VALUES ('4652', '15154', '钱长江', 'Male', 'C2', '2019-07-06', 'East', 'Capgemini', 'Shanghai', '2019-06-26', '15629839222', 'asfiug@163.com', '长春工业大学', '计算机', '博士', '2011', 'CST CSD', 'CST CSD', 'SG', 'SS', '2019-06-19', 'Voluntary', 'Others', '', 'LA', '30090', '1969-12-27', '1', '2019-08-01 09:49:27', '1', '2019-08-01 02:50:41', '1');
INSERT INTO `employee` VALUES ('4653', '32356', '陆抒龄', 'Female', 'C1', '2019-07-02', 'East', 'Capgemini', 'Shanghai', '2019-06-25', '13827642387', '29184@qq.com', '大连名族学校', '软件工程', '本科', '2012', 'CST SFDC', 'CST SFDC', 'SG', 'SS', null, null, null, null, null, null, '1989-09-28', '1', '2019-08-01 09:49:27', '1', '2019-08-01 02:50:41', '1');
INSERT INTO `employee` VALUES ('4654', '33125', '陈美丹', 'Male', 'B1', '2019-07-05', 'North', 'Capgemini', 'Shanghai', '2019-06-28', '13827642387', '29184@qq.com', '北京大学', '软件工程', '硕士', '2012', 'CST SFDC', 'CST SFDC', 'SG', 'SS', null, null, null, null, null, null, '1989-01-08', '1', '2019-08-01 09:49:27', '1', '2019-08-01 02:50:41', '1');
INSERT INTO `employee` VALUES ('4655', '31111', '黄飞鸿', 'Male', 'C1', '2019-07-06', 'East', 'Capgemini', 'Kunshan', '2019-07-13', '13827642387', '29184@qq.com', '南昌航空大学', '软件工程', '本科', '2020', 'CST SFDC', 'CST SFDC', 'SG', 'SS', null, null, null, null, null, null, '1998-12-22', '1', '2019-08-01 09:49:27', '1', '2019-08-01 02:50:45', '1');
INSERT INTO `employee` VALUES ('4656', '33421', '李云飞', 'Male', 'C1', '2019-07-08', 'East', 'Capgemini', 'Shanghai', '2019-07-01', '13827642387', '29184@qq.com', '清华大学', '计算机', '本科', '2020', 'CST SFDC', 'CST SFDC', 'SG', 'SS', null, null, null, null, null, null, '1998-03-11', '1', '2019-08-01 09:49:27', '1', '2019-08-01 02:50:45', '1');
INSERT INTO `employee` VALUES ('4657', '34211', '张美丽', 'Female', 'C2', '2019-07-09', 'East', 'Capgemini', 'Kunshan', '2019-07-18', '14568676767', 'sad@qq.com', '北京大学', '计算机', '本科', '2020', 'CST ERP', 'CST ERP', 'SG', 'SS', null, null, null, null, null, null, '1998-08-03', '1', '2019-08-01 09:49:27', '1', '2019-08-01 02:50:45', '1');
INSERT INTO `employee` VALUES ('4658', '31888', '华佗', 'Male', 'X1', '2019-07-22', 'East', 'Capgemini', 'Kunshan', '2019-07-22', '18846436562', 'tong.a.li@capgemini.com', '南京信息工程学院', '计算机', '本科', '2020', 'CST Cloud', 'Testing', 'SG', 'SS', '2019-07-24', 'Voluntary', 'Better Pay/Rewards', 'Thanks.', 'LA', '30831', '1998-05-10', '1', '2019-08-01 09:49:27', '1', '2019-08-01 02:50:45', '1');
INSERT INTO `employee` VALUES ('4659', '31003', '袁欢', 'Female', 'X1', '2019-01-28', 'RDC', 'Capgemini', 'Shanghai', '2019-02-14', '13241231222', '4112412412@qq.com', '长春工业大学', '软件工程', '本科', '2020', 'CST ERP', 'CST ERP', null, null, '2019-07-29', 'Involuntary', 'Unsatisfactory Performance', null, null, '30123', '1998-07-12', '1', '2019-08-01 09:49:27', '1', '2019-08-01 02:50:45', '1');
INSERT INTO `employee` VALUES ('4673', '34211', '张美丽', 'Female', 'C2', '2019-07-09', 'East', 'Capgemini', 'Kunshan', '2019-07-18', '14568676767', 'sad@qq.com', '北京大学', '计算机', '本科', '2020', 'CST ERP', 'CST ERP', 'SG', 'SS', null, null, null, null, null, null, '1998-08-03', '1', '2019-08-01 02:50:49', '1', '2019-08-01 02:50:49', '0');
INSERT INTO `employee` VALUES ('4674', '31888', '华佗', 'Male', 'X1', '2019-07-22', 'East', 'Capgemini', 'Kunshan', '2019-07-22', '18846436562', 'tong.a.li@capgemini.com', '南京信息工程学院', '计算机', '本科', '2020', 'CST Cloud', 'Testing', 'SG', 'SS', '2019-07-24', 'Voluntary', 'Better Pay/Rewards', 'Thanks.', 'LA', '30831', '1998-05-10', '1', '2019-08-01 02:50:49', '1', '2019-08-01 02:50:49', '0');
INSERT INTO `employee` VALUES ('4675', '31003', '袁欢', 'Female', 'X1', '2019-01-28', 'RDC', 'Capgemini', 'Shanghai', '2019-02-14', '13241231222', '4112412412@qq.com', '长春工业大学', '软件工程', '本科', '2020', 'CST ERP', 'CST ERP', null, null, '2019-07-29', 'Involuntary', 'Unsatisfactory Performance', null, null, '30123', '1998-07-12', '1', '2019-08-01 02:50:49', '1', '2019-08-01 02:50:49', '0');
INSERT INTO `employee` VALUES ('4676', '30123', '延欢', 'Male', 'X2', '2018-07-06', 'North', 'Capgemini', 'Kunshan', '2018-12-10', '18846436560', 'tong.a.li@capgemini.com', '黑龙江大学', '国贸', '硕士', '2019', 'CST ERP', 'CST ERP', 'SG', 'SS', '2019-07-22', 'Voluntary', 'Better Pay/Rewards', 'Thanks.', 'LA', '30111', '1990-02-02', '1', '2019-08-01 04:43:31', '1', '2019-08-02 17:26:31', '1');
INSERT INTO `employee` VALUES ('4677', '30301', '李彤2', 'Male', 'X2', '2018-07-07', 'North', 'Capgemini', 'Kunshan', '2018-12-11', '18846436560', 'tong.a.li@capgemini.com', '黑龙江大学', '国贸', '硕士', '2019', 'CST ERP', 'CST ERP', 'SG', 'SS', '2019-07-23', 'Voluntary', 'Better Pay/Rewards', 'Thanks.', 'LA', '30111', '1990-02-03', '1', '2019-08-01 04:44:26', '1', '2019-08-01 05:04:33', '1');
INSERT INTO `employee` VALUES ('4678', '30302', '李彤3', 'Male', 'X2', '2018-07-07', 'North', 'Capgemini', 'Kunshan', '2018-12-11', '18846436560', 'tong.a.li@capgemini.com', '黑龙江大学', '国贸', '硕士', '2019', 'CST ERP', 'CST ERP', 'SG', 'SS', '2019-07-23', 'Voluntary', 'Better Pay/Rewards', 'Thanks.', 'LA', '30111', '1990-02-03', '1', '2019-08-01 04:44:26', '1', '2019-08-01 05:04:37', '1');
INSERT INTO `employee` VALUES ('4679', '30213', '李彤1', 'Male', 'X2', '2018-07-07', 'North', 'Capgemini', 'Kunshan', '2018-12-11', '18846436560', 'tong.a.li@capgemini.com', '黑龙江大学', '国贸', '硕士', '2019', 'CST ERP', 'CST ERP', 'SG', 'SS', '2019-07-23', 'Voluntary', 'Better Pay/Rewards', 'Thanks.', 'LA', '30111', '1990-02-03', '1', '2019-08-01 05:35:43', '1', '2019-08-01 05:35:58', '1');
INSERT INTO `employee` VALUES ('4680', '30172', '孙志刚1', 'Male', 'X1', '2019-07-18', 'North', 'Capgemini', 'Kunshan', '2018-11-14', '15189827779', 'zhigang.sun@capgemini.com', '南京信息工程大学', '软件工程', '本科', '2019', 'CST PMO', 'CST PMO\r\n', 'SG', 'SS', '2019-07-29', 'Voluntary', 'Better Pay/Rewards', 'Thanks.', 'LA', '30100', '1999-03-29', '1', '2019-08-01 05:35:43', '1', '2019-08-01 05:35:58', '1');

-- ----------------------------
-- Table structure for `employee_prize`
-- ----------------------------
DROP TABLE IF EXISTS `employee_prize`;
CREATE TABLE `employee_prize` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `empId` bigint(20) DEFAULT NULL COMMENT '工号',
  `prizeType` varchar(20) DEFAULT '' COMMENT '获奖类别',
  `prizeDetail` varchar(100) DEFAULT NULL COMMENT '得奖内容',
  `createUser` bigint(20) DEFAULT NULL COMMENT '记录创建人',
  `createTime` datetime DEFAULT NULL COMMENT '记录创建时间',
  `updateUser` bigint(20) DEFAULT NULL COMMENT '记录更新人',
  `updateTime` datetime DEFAULT NULL COMMENT '记录更新时间',
  `isDeleted` varchar(1) DEFAULT '0' COMMENT '删除标志位（0：正常，1：删除）',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `empId` (`empId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee_prize
-- ----------------------------
INSERT INTO `employee_prize` VALUES ('98', '32356', '奖学金', '积极表现，朝气蓬勃', '1', '2019-07-31 17:23:18', '1', '2019-08-01 02:50:41', '0');
INSERT INTO `employee_prize` VALUES ('99', '30171', '奖学金', '在此次培训中，个人表现十分优异', '1', '2019-07-31 17:25:28', '1', '2019-08-01 02:50:41', '0');
INSERT INTO `employee_prize` VALUES ('100', '32222', '奖学金', '表现优异', '1', '2019-07-31 17:26:24', '1', '2019-08-01 03:59:33', '0');
INSERT INTO `employee_prize` VALUES ('101', '32112', '雏鹰之星', 'xxxx', '1', '2019-07-31 17:27:53', '1', '2019-08-01 04:37:12', '1');
INSERT INTO `employee_prize` VALUES ('102', '32112', '雏鹰之星', '表现突出，个人表现优异', '1', '2019-07-31 17:28:25', '1', '2019-08-01 02:50:41', '0');
INSERT INTO `employee_prize` VALUES ('103', '32112', '奖学金', '在培训中获得了第一名', '1', '2019-07-31 17:29:00', '1', '2019-08-01 02:50:41', '0');
INSERT INTO `employee_prize` VALUES ('104', '33125', '雏鹰之星', '个人表现优异', '1', '2019-07-31 17:37:30', '1', '2019-08-01 02:50:41', '0');
INSERT INTO `employee_prize` VALUES ('105', '32356', '奖学金', '成绩优异，表现良好', '1', '2019-07-31 18:06:38', '1', '2019-08-01 02:50:41', '0');
INSERT INTO `employee_prize` VALUES ('107', '30231', '雏鹰之星', 'March 2019', '1', '2019-08-01 02:37:56', '1', '2019-08-01 02:50:41', '0');
INSERT INTO `employee_prize` VALUES ('108', '31211', '雏鹰之星', 'xxxxxxx', '1', '2019-08-01 03:03:18', '1', '2019-08-01 04:01:03', '1');
INSERT INTO `employee_prize` VALUES ('109', '30231', 'Project Angel', 'xxxx', '1', '2019-08-01 03:58:10', '1', '2019-08-01 04:00:58', '1');
INSERT INTO `employee_prize` VALUES ('110', '31211', 'Project Angel', 'xxx', '1', '2019-08-01 03:58:42', '1', '2019-08-01 04:00:55', '1');
INSERT INTO `employee_prize` VALUES ('111', '32112', '奖学金', 'xxxx', '1', '2019-08-01 03:59:41', '1', '2019-08-01 04:00:53', '1');
INSERT INTO `employee_prize` VALUES ('112', '31410', '雏鹰之星', 'xxx', '1', '2019-08-01 03:59:59', '1', '2019-08-01 04:00:52', '1');
INSERT INTO `employee_prize` VALUES ('113', '31888', '雏鹰之星', 'xxxx', '1', '2019-08-01 04:00:16', '1', '2019-08-01 04:00:48', '1');
INSERT INTO `employee_prize` VALUES ('114', '33421', 'Project Angel', 'xxxxx', '1', '2019-08-01 04:00:29', '1', '2019-08-01 04:00:42', '1');
INSERT INTO `employee_prize` VALUES ('115', '30231', '雏鹰之星', 'xxxxxxx', '1', '2019-08-01 04:31:48', '1', '2019-08-01 04:37:12', '1');
INSERT INTO `employee_prize` VALUES ('116', '30231', '雏鹰之星', 'xxxxx', '1', '2019-08-01 04:38:13', '1', '2019-08-01 04:45:23', '1');
INSERT INTO `employee_prize` VALUES ('117', '30231', 'CSR', 'xxx', '1', '2019-08-01 04:40:17', '1', '2019-08-01 04:45:23', '1');
INSERT INTO `employee_prize` VALUES ('118', '32112', 'Project Angel', 'xxxx', '1', '2019-08-01 04:45:15', '1', '2019-08-01 04:45:15', '0');
INSERT INTO `employee_prize` VALUES ('119', '30171', 'Project Angel', 'xxx', '26', '2019-08-01 04:49:19', '26', '2019-08-01 05:01:15', '1');
INSERT INTO `employee_prize` VALUES ('120', '30123', '雏鹰之星', '表现优异', '1', '2019-08-01 05:04:55', '1', '2019-08-02 17:26:31', '1');
INSERT INTO `employee_prize` VALUES ('121', '30231', '奖学金', '一等奖', '1', '2019-08-01 05:29:13', '1', '2019-08-01 05:29:29', '0');
INSERT INTO `employee_prize` VALUES ('122', '32112', '雏鹰之星', '三等奖', '27', '2019-08-01 05:32:41', '1', '2019-08-01 05:34:00', '1');

-- ----------------------------
-- Table structure for `growing_experience`
-- ----------------------------
DROP TABLE IF EXISTS `growing_experience`;
CREATE TABLE `growing_experience` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `empId` bigint(20) DEFAULT NULL COMMENT '工号',
  `growingType` varchar(50) DEFAULT NULL COMMENT '培训类别',
  `growingDetail` text COMMENT '培训经历详细信息',
  `createUser` bigint(20) DEFAULT NULL COMMENT '记录创建人',
  `createTime` datetime DEFAULT NULL COMMENT '记录创建时间',
  `updateUser` bigint(20) DEFAULT NULL COMMENT '记录更新人',
  `updateTime` datetime DEFAULT NULL COMMENT '记录更新时间',
  `isDeleted` varchar(1) DEFAULT '0' COMMENT '删除标志位（0：正常，1：删除）',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `empId` (`empId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of growing_experience
-- ----------------------------
INSERT INTO `growing_experience` VALUES ('37', '34211', '技术培训', '培训有关开发的技术的工作', '1', '2019-07-31 18:40:42', '1', '2019-08-01 03:05:36', '1');
INSERT INTO `growing_experience` VALUES ('38', '31111', 'PPT技能培训', '培训制作PPT的技巧', '1', '2019-07-31 18:42:47', '1', '2019-08-01 03:05:40', '1');
INSERT INTO `growing_experience` VALUES ('39', '31003', 'Excel技能训练', '培训员工使用EXCEL的技巧', '1', '2019-07-31 18:45:22', '1', '2019-08-01 02:50:45', '0');
INSERT INTO `growing_experience` VALUES ('40', '31211', '演讲培训', '培训学员演讲能力', '1', '2019-07-31 18:49:30', '1', '2019-08-01 02:50:41', '0');
INSERT INTO `growing_experience` VALUES ('43', '30231', 'JTP技术培训', '无', '1', '2019-08-01 09:00:53', '1', '2019-08-01 04:27:13', '0');
INSERT INTO `growing_experience` VALUES ('44', '30171', 'xx', 'xx', '1', '2019-08-01 03:59:09', '1', '2019-08-01 03:59:19', '1');
INSERT INTO `growing_experience` VALUES ('45', '31410', 'PPT技能培训', '培训员工PPT技能', '1', '2019-08-01 04:26:50', '1', '2019-08-01 04:26:50', '0');
INSERT INTO `growing_experience` VALUES ('46', '30123', '111', '111', '1', '2019-08-01 05:05:55', '1', '2019-08-02 17:26:31', '1');

-- ----------------------------
-- Table structure for `headmaster_talk`
-- ----------------------------
DROP TABLE IF EXISTS `headmaster_talk`;
CREATE TABLE `headmaster_talk` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `empId` bigint(20) DEFAULT NULL COMMENT '工号',
  `talkType` varchar(50) DEFAULT NULL COMMENT '谈话类型',
  `talkContent` text COMMENT '谈话内容',
  `headMaster` varchar(50) DEFAULT NULL COMMENT '谈话校长',
  `createUser` bigint(20) DEFAULT NULL COMMENT '记录创建人',
  `createTime` datetime DEFAULT NULL COMMENT '记录创建时间',
  `updateUser` bigint(20) DEFAULT NULL COMMENT '记录更新人',
  `updateTime` datetime DEFAULT NULL COMMENT '记录更新时间',
  `isDeleted` varchar(1) DEFAULT '0' COMMENT '删除标志位（0：正常，1：删除）',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `empId` (`empId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of headmaster_talk
-- ----------------------------
INSERT INTO `headmaster_talk` VALUES ('35', '31888', '职位意向', '希望做什么工作', 'Yolanda', '1', '2019-07-31 19:00:45', '1', '2019-08-01 02:50:45', '0');
INSERT INTO `headmaster_talk` VALUES ('36', '31888', '去留意向', '希望你留下', 'Diane', '1', '2019-07-31 19:01:28', '1', '2019-08-01 02:50:45', '0');
INSERT INTO `headmaster_talk` VALUES ('37', '32222', '心理问题', '最近心态不好，心情出现了问题，导致抑郁寡欢', 'Yolanda', '1', '2019-07-31 19:06:04', '1', '2019-08-01 02:50:41', '0');
INSERT INTO `headmaster_talk` VALUES ('38', '32356', '态度矫正', '工作量大，想要放弃，劝说一番', 'Danie', '1', '2019-07-31 19:08:44', '1', '2019-08-01 02:50:41', '0');
INSERT INTO `headmaster_talk` VALUES ('39', '32112', '心理问题', '心情抑郁', 'Danie', '1', '2019-08-01 03:42:52', '1', '2019-08-01 03:43:00', '1');
INSERT INTO `headmaster_talk` VALUES ('40', '33125', '深入沟通', '对未来充满了迷茫', 'Daisy', '1', '2019-08-01 04:03:41', '1', '2019-08-01 04:03:41', '0');
INSERT INTO `headmaster_talk` VALUES ('41', '30123', '111', '111', '111', '1', '2019-08-01 05:06:02', '1', '2019-08-02 17:26:31', '1');
INSERT INTO `headmaster_talk` VALUES ('42', '30231', 'regular当发生的办法是空间', '最近很累圣诞节发就后端开发设计哈空间', 'yolanda', '1', '2019-08-02 17:23:22', '1', '2019-08-02 17:25:51', '1');

-- ----------------------------
-- Table structure for `hr`
-- ----------------------------
DROP TABLE IF EXISTS `hr`;
CREATE TABLE `hr` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'hrID',
  `name` varchar(32) DEFAULT NULL COMMENT '姓名',
  `phone` char(11) DEFAULT NULL COMMENT '手机号码',
  `telephone` varchar(16) DEFAULT NULL COMMENT '住宅电话',
  `address` varchar(64) DEFAULT NULL COMMENT '联系地址',
  `enabled` tinyint(1) DEFAULT '1',
  `username` varchar(255) DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `userface` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=30232 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hr
-- ----------------------------
INSERT INTO `hr` VALUES ('1', 'Zhao, Yolanda', null, null, null, '1', 'admin', '$2a$10$N/U8KS6E2pvkXPAIAfcFNuJl8BfLsaJ6N.kyxur5z5kUbWGJ0/Z5K', null, null);
INSERT INTO `hr` VALUES ('14', 'Li, Daisy', null, null, null, '1', 'normal', '$2a$10$I2VF8Xn6MkveJzAKavp9V.15Jc4GQ983k2pW.4RqRKpHLSYYmAm9i', null, null);
INSERT INTO `hr` VALUES ('19', '罗', null, null, null, '1', 'Luo', '$2a$10$K0oxy7Jbepw9o3R6ZVJptu3HquIM5lyFsaPxPMxjgnIiM9aR7vjwm', null, null);
INSERT INTO `hr` VALUES ('23', '华', null, null, null, '1', 'huabin', '$2a$10$QSxfkuxau5.SnEQi08VyEOjFkIK2nUOVSbFzfVVuMnxLN1AQqK0tq', null, null);
INSERT INTO `hr` VALUES ('24', '杨可欣', null, null, null, '1', 'kexin.yang', '$2a$10$Ko87lf.AWu03zNgyMVYH4.EekVKUGcDwMFkbUUBvV8w.xHo6habTK', null, null);
INSERT INTO `hr` VALUES ('25', 'Shawn', null, null, null, '1', 'Shawn.chao', '$2a$10$bRz.IO3.5A9WKbqYR7EmS..C8.tqAuMR79b03wfhLv35hAr7P4lDK', null, null);
INSERT INTO `hr` VALUES ('28', 'TEST', null, null, null, '1', 'test', '$2a$10$T6GQcDjX5iNeQzTYXR/ZKuukYdxEz.XDCV27DdSc9lODn8NH6k/Mm', null, null);
INSERT INTO `hr` VALUES ('30231', '李彤', null, null, null, '1', 'tong.li', '$2a$10$zPA5UoEFrsts5WNyaQtuR.taVaT5IhojUgrvR8bC0/yhIMbq9rxVa', null, null);

-- ----------------------------
-- Table structure for `hr_role`
-- ----------------------------
DROP TABLE IF EXISTS `hr_role`;
CREATE TABLE `hr_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hrid` int(11) DEFAULT NULL,
  `rid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `rid` (`rid`) USING BTREE,
  KEY `hr_role_ibfk_1` (`hrid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hr_role
-- ----------------------------
INSERT INTO `hr_role` VALUES ('51', '14', '1');
INSERT INTO `hr_role` VALUES ('55', '19', '1');
INSERT INTO `hr_role` VALUES ('58', '22', '1');
INSERT INTO `hr_role` VALUES ('59', '1', '2');
INSERT INTO `hr_role` VALUES ('60', '23', '1');
INSERT INTO `hr_role` VALUES ('61', '24', '1');
INSERT INTO `hr_role` VALUES ('62', '25', '1');
INSERT INTO `hr_role` VALUES ('65', '28', '1');
INSERT INTO `hr_role` VALUES ('66', '30231', '3');

-- ----------------------------
-- Table structure for `menu`
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(64) DEFAULT NULL,
  `path` varchar(64) DEFAULT NULL,
  `component` varchar(64) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `iconCls` varchar(64) DEFAULT NULL,
  `keepAlive` tinyint(1) DEFAULT NULL,
  `requireAuth` tinyint(1) DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `parentId` (`parentId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '/', null, null, '所有', null, null, null, null, '1');
INSERT INTO `menu` VALUES ('2', '/', '/home', 'Home', '员工资料', 'fa fa-user-circle-o', null, '1', '1', '1');
INSERT INTO `menu` VALUES ('3', '/', '/home', 'Home', '人事管理', 'fa fa-address-card-o', null, '1', '1', '1');
INSERT INTO `menu` VALUES ('4', '/', '/home', 'Home', '薪资管理', 'fa fa-money', null, '1', '1', '1');
INSERT INTO `menu` VALUES ('5', '/', '/home', 'Home', '统计管理', 'fa fa-bar-chart', null, '1', '1', '1');
INSERT INTO `menu` VALUES ('6', '/', '/home', 'Home', '系统管理', 'fa fa-windows', null, '1', '1', '1');
INSERT INTO `menu` VALUES ('7', '/employee/basic/**', '/emp/basic', 'EmpBasic', '基本资料', null, null, '1', '2', '1');
INSERT INTO `menu` VALUES ('8', '/employee/advanced/**', '/emp/adv', 'EmpAdv', '高级资料', null, null, '1', '2', '0');
INSERT INTO `menu` VALUES ('9', '/employee/prize/**', '/emp/prize', 'EmpPrize', '获奖情况', null, null, '1', '2', '1');
INSERT INTO `menu` VALUES ('10', '/employee/experience/**', '/emp/learning', 'EmpLearning', '培训经历', null, null, '1', '2', '1');
INSERT INTO `menu` VALUES ('11', '/employee/project/**', '/emp/project', 'EmpProject', '项目经历', null, null, '1', '2', '1');
INSERT INTO `menu` VALUES ('12', '/employee/talk/**', '/emp/talking', 'EmpTalking', '校长访谈', null, null, '1', '2', '1');
INSERT INTO `menu` VALUES ('13', '/employee/admin/**', '/emp/admin', 'EmpAdmin', '用户管理', null, null, '1', '2', '1');
INSERT INTO `menu` VALUES ('14', '/employee/chart/**', '/emp/chart', 'EmpChart', '图表展示', null, null, '1', '2', '1');
INSERT INTO `menu` VALUES ('15', '/', '/home', 'home', '用户相关', 'fa fa-user-circle-o', null, '1', '1', '1');
INSERT INTO `menu` VALUES ('16', '/staff/baseInfo/**', './baseInfo', 'baseInfo', '个人资料', null, null, '1', '15', '1');
INSERT INTO `menu` VALUES ('17', '/staff/declaration/**', './declaration', 'declaration', '申报', null, null, '1', '15', '1');

-- ----------------------------
-- Table structure for `menu_role`
-- ----------------------------
DROP TABLE IF EXISTS `menu_role`;
CREATE TABLE `menu_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) DEFAULT NULL,
  `rid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `mid` (`mid`) USING BTREE,
  KEY `rid` (`rid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=310 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu_role
-- ----------------------------
INSERT INTO `menu_role` VALUES ('278', '1', '2');
INSERT INTO `menu_role` VALUES ('279', '2', '2');
INSERT INTO `menu_role` VALUES ('280', '3', '2');
INSERT INTO `menu_role` VALUES ('281', '4', '2');
INSERT INTO `menu_role` VALUES ('282', '5', '2');
INSERT INTO `menu_role` VALUES ('283', '6', '2');
INSERT INTO `menu_role` VALUES ('284', '7', '2');
INSERT INTO `menu_role` VALUES ('285', '8', '2');
INSERT INTO `menu_role` VALUES ('286', '9', '2');
INSERT INTO `menu_role` VALUES ('287', '10', '2');
INSERT INTO `menu_role` VALUES ('288', '11', '2');
INSERT INTO `menu_role` VALUES ('289', '12', '2');
INSERT INTO `menu_role` VALUES ('290', '13', '2');
INSERT INTO `menu_role` VALUES ('291', '1', '1');
INSERT INTO `menu_role` VALUES ('292', '2', '1');
INSERT INTO `menu_role` VALUES ('293', '3', '1');
INSERT INTO `menu_role` VALUES ('294', '4', '1');
INSERT INTO `menu_role` VALUES ('295', '5', '1');
INSERT INTO `menu_role` VALUES ('296', '6', '1');
INSERT INTO `menu_role` VALUES ('297', '7', '1');
INSERT INTO `menu_role` VALUES ('298', '8', '1');
INSERT INTO `menu_role` VALUES ('299', '9', '1');
INSERT INTO `menu_role` VALUES ('300', '10', '1');
INSERT INTO `menu_role` VALUES ('301', '11', '1');
INSERT INTO `menu_role` VALUES ('302', '12', '1');
INSERT INTO `menu_role` VALUES ('304', '14', '1');
INSERT INTO `menu_role` VALUES ('305', '14', '2');
INSERT INTO `menu_role` VALUES ('306', '15', '3');
INSERT INTO `menu_role` VALUES ('307', '16', '3');
INSERT INTO `menu_role` VALUES ('308', '17', '3');

-- ----------------------------
-- Table structure for `project_experience`
-- ----------------------------
DROP TABLE IF EXISTS `project_experience`;
CREATE TABLE `project_experience` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `empId` bigint(20) DEFAULT NULL COMMENT '工号',
  `account` varchar(50) DEFAULT NULL COMMENT '客户名称',
  `projectName` varchar(50) DEFAULT NULL COMMENT '项目名称',
  `projectManager` varchar(50) DEFAULT NULL COMMENT '项目经理',
  `joinTime` date DEFAULT NULL COMMENT '加入时间',
  `endTime` date DEFAULT NULL COMMENT '结束时间',
  `createUser` bigint(20) DEFAULT NULL COMMENT '记录创建人',
  `createTime` datetime DEFAULT NULL COMMENT '记录创建时间',
  `updateUser` bigint(20) DEFAULT NULL COMMENT '记录更新人',
  `updateTime` datetime DEFAULT NULL COMMENT '记录更新时间',
  `isDeleted` varchar(1) DEFAULT '0' COMMENT '删除标志位（0：正常，1：删除）',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `empId` (`empId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project_experience
-- ----------------------------
INSERT INTO `project_experience` VALUES ('36', '32222', 'Yolanda', 'JTP员工管理系统', '朱逸寅', '2019-07-13', '2019-07-30', '1', '2019-07-31 18:10:54', '1', '2019-08-01 02:50:41', '0');
INSERT INTO `project_experience` VALUES ('37', '31211', 'Yolanda', 'JTP项目管理系统', '朱逸寅', '2019-07-14', '2019-07-31', '1', '2019-07-31 18:11:33', '1', '2019-08-01 02:50:41', '0');
INSERT INTO `project_experience` VALUES ('38', '32356', '华为', '华为手机5G开发', '金泽萱', '2019-07-02', '2019-07-29', '1', '2019-07-31 18:22:21', '1', '2019-08-01 02:50:41', '0');
INSERT INTO `project_experience` VALUES ('39', '33125', '华为', '华为手机5G开发', '金泽萱', '2019-07-05', '2019-07-29', '1', '2019-07-31 18:26:03', '1', '2019-08-01 02:50:41', '0');
INSERT INTO `project_experience` VALUES ('40', '30231', '华斌', '自动化', '李煌', '2019-08-06', '2019-08-29', '1', '2019-08-01 09:00:30', '1', '2019-08-01 02:50:41', '0');
INSERT INTO `project_experience` VALUES ('41', '30123', '111', '111', '111', null, null, '1', '2019-08-01 05:05:46', '1', '2019-08-02 17:26:31', '1');
INSERT INTO `project_experience` VALUES ('42', '32330', '华为', '华为手机P50研发', '刘勇', '2019-07-03', '2019-07-30', '1', '2019-08-01 05:07:59', '1', '2019-08-01 05:08:45', '0');

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `nameZh` varchar(64) DEFAULT NULL COMMENT '角色名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'ROLE_user', '用户');
INSERT INTO `role` VALUES ('2', 'ROLE_admin', '管理员');
INSERT INTO `role` VALUES ('3', 'ROLE_staff', '员工');
