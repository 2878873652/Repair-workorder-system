/*
 Navicat Premium Dump SQL

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 80022 (8.0.22)
 Source Host           : localhost:3306
 Source Schema         : residential_order_cos

 Target Server Type    : MySQL
 Target Server Version : 80022 (8.0.22)
 File Encoding         : 65001

 Date: 24/08/2025 20:09:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for building_info
-- ----------------------------
DROP TABLE IF EXISTS `building_info`;
CREATE TABLE `building_info`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '楼宇名称',
  `address` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '楼宇地址',
  `street` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '街道',
  `community` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '社区',
  `usage_area` decimal(10, 2) NULL DEFAULT NULL COMMENT '总使用面积(m²)',
  `surface_area` decimal(10, 2) NULL DEFAULT NULL COMMENT '总建筑面积(m²)',
  `type` tinyint NULL DEFAULT NULL COMMENT '类别 1.平房 2.多层楼 3.高层楼 4.简易楼',
  `rooms` int NULL DEFAULT NULL COMMENT '间数',
  `units` int NULL DEFAULT NULL COMMENT '单元数',
  `layers` int NULL DEFAULT NULL COMMENT '层数',
  `images` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '图片',
  `create_date` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '楼宇管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of building_info
-- ----------------------------
INSERT INTO `building_info` VALUES (1, '鸿博家园一期A区23栋', '北京市朝阳区小红门鸿博家园一期A区23栋', '小红门', '鸿博家园一期社区', 2958.20, 3399.00, 2, 204, 10, 10, 'SA1744457268101.png', '2025-03-16 18:00:46');
INSERT INTO `building_info` VALUES (2, '鸿博家园一期A区24栋', '北京市朝阳区小红门鸿博家园一期A区24栋', '小红门', '鸿博家园一期社区', 12124.70, 13140.20, 3, 728, 20, 15, 'SA1744457257132.jpg', '2025-03-16 18:21:32');

-- ----------------------------
-- Table structure for bulletin_info
-- ----------------------------
DROP TABLE IF EXISTS `bulletin_info`;
CREATE TABLE `bulletin_info`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '内容',
  `date` datetime NULL DEFAULT NULL COMMENT '公告时间',
  `rack_up` tinyint NULL DEFAULT NULL COMMENT '上下架（0.下架 1.发布）',
  `type` tinyint NULL DEFAULT NULL COMMENT '消息类型',
  `publisher` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '发布人',
  `images` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '公告信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bulletin_info
-- ----------------------------
INSERT INTO `bulletin_info` VALUES (1, 'ApplemaylabeliOS18artificialintelligencefeaturesasabetapreview,signalingAppleisstillplayingcatch-up', 'While Apple is seen as being behind right now, with the disastrous rollouts of AI overviews in Google Search this past week, perhaps more companies could benefit from taking it slowly and using beta labels judiciously …\n\nApple is expected to adopt a multi-pronged approach, where some AI requests will be handled locally on device and other’s will be kicked off to Apple’s cloud infrastructure for processing.\n\nOn a task by task basis, code running locally will determine whether the device can handle the request or whether it needs to be relayed to the Apple backend. On-device handling may only be available for newer Apple devices, like the latest one or two generations of iPhone, iPad and Mac. Apple is also said to be preparing a special miniaturized on-device model intended for the Apple Watch.', '2025-03-27 21:47:36', 1, NULL, '樊可', 'SA1716817655179.png');

-- ----------------------------
-- Table structure for complaint_info
-- ----------------------------
DROP TABLE IF EXISTS `complaint_info`;
CREATE TABLE `complaint_info`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int NULL DEFAULT NULL COMMENT '用户ID',
  `order_id` int NULL DEFAULT NULL COMMENT '订单ID',
  `create_date` datetime NULL DEFAULT NULL COMMENT '投诉时间',
  `staff_id` int NULL DEFAULT NULL COMMENT '所属员工',
  `content` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '投诉内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态（0.未处理 1.已处理）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '投诉记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of complaint_info
-- ----------------------------
INSERT INTO `complaint_info` VALUES (2, 1, 2, '2025-01-01 12:16:08', 1, '服务不好！！', '1');
INSERT INTO `complaint_info` VALUES (3, 1, 1, '2025-01-25 21:19:59', 3, '服务态度不好', '0');
INSERT INTO `complaint_info` VALUES (5, 1, 7, '2025-04-13 10:05:50', 1, '废物一个', '0');
INSERT INTO `complaint_info` VALUES (6, 1, 8, '2025-08-22 19:56:45', 4, '顶针一号服务很差！@！！！！', '0');

-- ----------------------------
-- Table structure for device_info
-- ----------------------------
DROP TABLE IF EXISTS `device_info`;
CREATE TABLE `device_info`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备编号',
  `device_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备名称',
  `device_charge` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系方式',
  `content` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备备注',
  `images` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备图片',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备状态（0.废弃 1.正常 2.维修保养中）',
  `create_date` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备类型',
  `address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '设备管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of device_info
-- ----------------------------
INSERT INTO `device_info` VALUES (1, 'DEV-1738844420795', '清洗机-01', '樊可', '15010399301', '清洗机', 'SA1744454578548.jpg', '1', '2025-03-06 20:20:25', '清洗机', '清洗剂厂房');

-- ----------------------------
-- Table structure for evaluate_info
-- ----------------------------
DROP TABLE IF EXISTS `evaluate_info`;
CREATE TABLE `evaluate_info`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` int NULL DEFAULT NULL COMMENT '所属订单',
  `user_id` int NULL DEFAULT NULL COMMENT '评价用户',
  `content` varchar(600) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '评价内容',
  `score` decimal(10, 2) NULL DEFAULT NULL COMMENT '评价分数',
  `create_date` datetime NULL DEFAULT NULL COMMENT '评价时间',
  `images` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '评价图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '订单评价' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of evaluate_info
-- ----------------------------
INSERT INTO `evaluate_info` VALUES (4, 1, 1, '好！！！！', 5.00, '2023-12-31 21:10:24', 'SA1704028222799.jpg');
INSERT INTO `evaluate_info` VALUES (6, 7, 1, '服务很好！房屋地址： 北京市朝阳区小红门鸿 ...', 5.00, '2025-04-13 09:52:48', 'SA1744509165159.jpg');

-- ----------------------------
-- Table structure for houses_info
-- ----------------------------
DROP TABLE IF EXISTS `houses_info`;
CREATE TABLE `houses_info`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `address` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '房屋地址',
  `building_id` int NULL DEFAULT NULL COMMENT '所属楼宇',
  `number` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '号',
  `floor` tinyint NULL DEFAULT NULL COMMENT '层',
  `usage_area` decimal(10, 2) NULL DEFAULT NULL COMMENT '使用面积(m²)',
  `surface_area` decimal(10, 2) NULL DEFAULT NULL COMMENT '建筑面积(m²)',
  `nature` tinyint NULL DEFAULT NULL COMMENT '性质 1.住宅楼房 2.社区用处',
  `rooms` tinyint NULL DEFAULT NULL COMMENT '间数',
  `buyer` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '购房人姓名',
  `staff_id` int NULL DEFAULT NULL COMMENT '物业工作人员',
  `owner_id` int NULL DEFAULT NULL COMMENT '业主ID',
  `create_date` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '房屋管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of houses_info
-- ----------------------------
INSERT INTO `houses_info` VALUES (1, '北京市朝阳区小红门鸿博家园一期A区23栋三单元602室', 1, '602', 6, 272.54, 291.71, 1, 4, '樊可', 3, 1, '2025-03-16 22:39:32');
INSERT INTO `houses_info` VALUES (2, '北京市朝阳区小红门鸿博家园一期A区23栋三单元601室', 1, '601', 6, 254.68, 275.31, 1, 4, '樊可', NULL, 1, '2025-03-17 08:47:59');
INSERT INTO `houses_info` VALUES (3, '北京市朝阳区小红门鸿博家园一期A区23栋三单元801室', 1, '801', 8, 106.50, 123.20, 1, 3, '孙笑川', 3, 2, '2025-03-20 10:51:59');

-- ----------------------------
-- Table structure for owner_info
-- ----------------------------
DROP TABLE IF EXISTS `owner_info`;
CREATE TABLE `owner_info`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '编号',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '业主姓名',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号码',
  `id_number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '身份证号',
  `create_date` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `images` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '照片',
  `user_id` bigint NULL DEFAULT NULL COMMENT '所属账户',
  `email` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '业主管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of owner_info
-- ----------------------------
INSERT INTO `owner_info` VALUES (1, NULL, '樊可', '15010399201', '14270220000827xxxxx', '2025-03-16 21:59:14', 'SA1744463195766.png', 14, 'fan1ke2ke@gmail,com');
INSERT INTO `owner_info` VALUES (2, NULL, '孙笑川', '15010000000', '142702000008277888', '2025-03-17 11:35:39', 'SA1647744654734.jpg', NULL, NULL);
INSERT INTO `owner_info` VALUES (3, 'OWN-1744512851795', '张三', '15010399301', '111131243523523', '2025-04-13 10:54:11', NULL, 17, 'fan1ke@gmailc.om');

-- ----------------------------
-- Table structure for repair_info
-- ----------------------------
DROP TABLE IF EXISTS `repair_info`;
CREATE TABLE `repair_info`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '订单编号',
  `user_id` int NULL DEFAULT NULL COMMENT '所属用户',
  `houses_id` int NULL DEFAULT NULL COMMENT '房屋',
  `content` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '内容',
  `images` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '图片',
  `repair_status` tinyint NULL DEFAULT NULL COMMENT '维修状态 0.未派修 1.已派修 2.已完成',
  `worker` int NULL DEFAULT NULL COMMENT '工作人员',
  `create_date` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `repair_type` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '维修类型（1.上下水管道 2.落水管 3.水箱 4.天线 5.供电线路 6.通讯线路 7.照明 8.供气线路 9.消防设施）',
  `total_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '维修金额',
  `pay_date` datetime NULL DEFAULT NULL COMMENT '缴费时间',
  `request_no` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '申请单号',
  `repair_level` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '维修等级（1.急 2.重 3.轻 4.缓）',
  `repair_date` datetime NULL DEFAULT NULL COMMENT '维修时间',
  `device_id` int NULL DEFAULT NULL COMMENT '维修设备',
  `type` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '类型（1.房屋 2.设施）',
  `repair_fix_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '设施维修类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '维修上报' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of repair_info
-- ----------------------------
INSERT INTO `repair_info` VALUES (1, 'ORD-1654212556', 1, 1, '我家的水管坏了，一直在放水，堵不住，求帮助😭😭', 'SA1647500959501.jpg', 2, 1, '2025-03-17 20:20:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL);
INSERT INTO `repair_info` VALUES (2, 'ORD-1647650404705', 1, 2, '约了朋友在家吃火锅，电磁炉上烧的水还没有开，啪一声，跳闸了，很是扫兴。手机好端端的充着电，啪一声，又跳闸了，很是无奈。什么事情都没有做，啪一声，又跳闸了，估计大家也是一脸懵。为什么配电箱里的开关总是跳闸', NULL, 2, 1, '2025-03-19 08:40:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL);
INSERT INTO `repair_info` VALUES (3, 'ORD-1692533910262', 1, 2, '房间漏水！！！', NULL, 2, 1, '2025-03-31 20:18:30', '1', 20.00, '2025-03-31 20:18:30', NULL, NULL, NULL, NULL, '1', NULL);
INSERT INTO `repair_info` VALUES (4, 'ORD-1692534056491', 1, 2, '房间漏水！！！', NULL, 2, 1, '2025-03-31 20:20:56', '1', 10.00, '2025-03-31 20:20:56', NULL, NULL, NULL, NULL, '1', NULL);
INSERT INTO `repair_info` VALUES (7, 'ORD-1744478341383', 1, 1, '上下水管道 坏了！！！！', 'SA1744478328255.jpg', 2, 1, '2025-04-13 01:19:01', '1', 2.00, '2025-04-13 03:23:21', 'REQ-1744483591418', '3', NULL, 1, '1', NULL);
INSERT INTO `repair_info` VALUES (8, 'ORD-1755786430709', 1, 1, '下水道堵住了', 'SA1755786429436.jpg', 3, 4, '2025-08-21 22:27:10', '2', 100.00, '2025-08-22 19:54:31', NULL, '4', '2025-08-22 19:56:05', NULL, '1', NULL);
INSERT INTO `repair_info` VALUES (9, 'ORD-1755929081753', 1, NULL, '三号楼有车违停堵路了', 'SA1755929080545.jpg', 3, 4, '2025-08-23 14:04:41', NULL, NULL, NULL, NULL, '2', '2025-08-23 18:01:01', NULL, '2', '道路设施');
INSERT INTO `repair_info` VALUES (10, 'ORD-1755929386183', 1, NULL, '十一号楼三单元的六楼的灯不亮了', 'SA1755929384986.png', 0, NULL, '2025-08-23 14:09:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '照明系统');

-- ----------------------------
-- Table structure for safety_inspection
-- ----------------------------
DROP TABLE IF EXISTS `safety_inspection`;
CREATE TABLE `safety_inspection`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `staff_id` int NULL DEFAULT NULL COMMENT '员工编号',
  `station_name` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '站点名称',
  `check_type` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '检查类型（1.早 2.中 3.晚）',
  `check_date` datetime NULL DEFAULT NULL COMMENT '检查时间',
  `images` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '打卡图片',
  `content` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '问题内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '安全巡检' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of safety_inspection
-- ----------------------------
INSERT INTO `safety_inspection` VALUES (1, 1, '三号楼一单元灭火器检查', '2', '2025-03-13 21:30:33', 'SA1743168095622.jpg', '三号楼一单元灭火器检查');
INSERT INTO `safety_inspection` VALUES (2, 2, '二号楼一单元灭火器检查', '1', '2025-03-28 21:22:47', 'SA1743168166613.png', '二号楼一单元灭火器检查');
INSERT INTO `safety_inspection` VALUES (3, 4, '二号楼一单元灭火器检查', '1', '2025-08-22 20:44:52', 'SA1755866691869.png', '二号楼一单元灭火器检查');

-- ----------------------------
-- Table structure for t_dept
-- ----------------------------
DROP TABLE IF EXISTS `t_dept`;
CREATE TABLE `t_dept`  (
  `DEPT_ID` bigint NOT NULL AUTO_INCREMENT COMMENT '部门ID',
  `PARENT_ID` bigint NOT NULL COMMENT '上级部门ID',
  `DEPT_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '部门名称',
  `ORDER_NUM` double(20, 0) NULL DEFAULT NULL COMMENT '排序',
  `CREATE_TIME` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `MODIFY_TIME` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`DEPT_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_dept
-- ----------------------------
INSERT INTO `t_dept` VALUES (1, 0, '开发部', 1, '2018-01-04 15:42:26', '2019-01-05 21:08:27');
INSERT INTO `t_dept` VALUES (2, 1, '开发一部', 1, '2018-01-04 15:42:34', '2019-01-18 00:59:37');
INSERT INTO `t_dept` VALUES (3, 1, '开发二部', 2, '2018-01-04 15:42:29', '2019-01-05 14:09:39');
INSERT INTO `t_dept` VALUES (4, 0, '市场部', 2, '2018-01-04 15:42:36', '2019-01-23 06:27:56');
INSERT INTO `t_dept` VALUES (5, 0, '人事部', 3, '2018-01-04 15:42:32', '2019-01-23 06:27:59');
INSERT INTO `t_dept` VALUES (6, 0, '测试部', 4, '2018-01-04 15:42:38', '2019-01-17 08:15:47');

-- ----------------------------
-- Table structure for t_dict
-- ----------------------------
DROP TABLE IF EXISTS `t_dict`;
CREATE TABLE `t_dict`  (
  `DICT_ID` bigint NOT NULL AUTO_INCREMENT COMMENT '字典ID',
  `KEYY` bigint NOT NULL COMMENT '键',
  `VALUEE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '值',
  `FIELD_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字段名称',
  `TABLE_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表名',
  PRIMARY KEY (`DICT_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_dict
-- ----------------------------
INSERT INTO `t_dict` VALUES (1, 0, '男', 'ssex', 't_user');
INSERT INTO `t_dict` VALUES (2, 1, '女', 'ssex', 't_user');
INSERT INTO `t_dict` VALUES (3, 2, '保密', 'ssex', 't_user');
INSERT INTO `t_dict` VALUES (4, 1, '有效', 'status', 't_user');
INSERT INTO `t_dict` VALUES (5, 0, '锁定', 'status', 't_user');
INSERT INTO `t_dict` VALUES (6, 0, '菜单', 'type', 't_menu');
INSERT INTO `t_dict` VALUES (7, 1, '按钮', 'type', 't_menu');
INSERT INTO `t_dict` VALUES (30, 0, '正常', 'status', 't_job');
INSERT INTO `t_dict` VALUES (31, 1, '暂停', 'status', 't_job');
INSERT INTO `t_dict` VALUES (32, 0, '成功', 'status', 't_job_log');
INSERT INTO `t_dict` VALUES (33, 1, '失败', 'status', 't_job_log');

-- ----------------------------
-- Table structure for t_job
-- ----------------------------
DROP TABLE IF EXISTS `t_job`;
CREATE TABLE `t_job`  (
  `JOB_ID` bigint NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `BEAN_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'spring bean名称',
  `METHOD_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '方法名',
  `PARAMS` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数',
  `CRON_EXPRESSION` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'cron表达式',
  `STATUS` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务状态  0：正常  1：暂停',
  `REMARK` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `CREATE_TIME` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`JOB_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_job
-- ----------------------------
INSERT INTO `t_job` VALUES (1, 'testTask', 'test', 'mrbird', '0/1 * * * * ?1', '1', '有参任务调度测试', '2018-02-24 16:26:14');
INSERT INTO `t_job` VALUES (2, 'testTask', 'test1', NULL, '0/10 * * * * ?', '1', '无参任务调度测试', '2018-02-24 17:06:23');
INSERT INTO `t_job` VALUES (3, 'testTask', 'test', 'hello world', '0/1 * * * * ?', '1', '有参任务调度测试,每隔一秒触发', '2018-02-26 09:28:26');
INSERT INTO `t_job` VALUES (11, 'testTask', 'test2', NULL, '0/5 * * * * ?', '1', '测试异常', '2018-02-26 11:15:30');

-- ----------------------------
-- Table structure for t_job_log
-- ----------------------------
DROP TABLE IF EXISTS `t_job_log`;
CREATE TABLE `t_job_log`  (
  `LOG_ID` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `JOB_ID` bigint NOT NULL COMMENT '任务id',
  `BEAN_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'spring bean名称',
  `METHOD_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '方法名',
  `PARAMS` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数',
  `STATUS` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `ERROR` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '失败信息',
  `TIMES` decimal(11, 0) NULL DEFAULT NULL COMMENT '耗时(单位：毫秒)',
  `CREATE_TIME` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`LOG_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2502 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_job_log
-- ----------------------------
INSERT INTO `t_job_log` VALUES (2450, 3, 'testTask', 'test', 'hello world', '0', NULL, 2, '2018-03-20 15:31:52');
INSERT INTO `t_job_log` VALUES (2451, 3, 'testTask', 'test', 'hello world', '0', NULL, 0, '2018-03-20 15:31:53');
INSERT INTO `t_job_log` VALUES (2452, 3, 'testTask', 'test', 'hello world', '0', NULL, 2, '2018-03-20 15:31:54');
INSERT INTO `t_job_log` VALUES (2453, 3, 'testTask', 'test', 'hello world', '0', NULL, 1, '2018-03-20 15:31:55');
INSERT INTO `t_job_log` VALUES (2454, 3, 'testTask', 'test', 'hello world', '0', NULL, 0, '2018-03-20 15:31:56');
INSERT INTO `t_job_log` VALUES (2455, 3, 'testTask', 'test', 'hello world', '0', NULL, 1, '2018-03-20 15:31:57');
INSERT INTO `t_job_log` VALUES (2456, 3, 'testTask', 'test', 'hello world', '0', NULL, 1, '2018-03-20 15:31:59');
INSERT INTO `t_job_log` VALUES (2457, 3, 'testTask', 'test', 'hello world', '0', NULL, 1, '2018-03-20 15:31:59');
INSERT INTO `t_job_log` VALUES (2458, 3, 'testTask', 'test', 'hello world', '0', NULL, 1, '2018-03-20 15:32:00');
INSERT INTO `t_job_log` VALUES (2459, 3, 'testTask', 'test', 'hello world', '0', NULL, 0, '2018-03-20 15:32:01');
INSERT INTO `t_job_log` VALUES (2460, 3, 'testTask', 'test', 'hello world', '0', NULL, 5, '2018-03-20 15:32:02');
INSERT INTO `t_job_log` VALUES (2461, 3, 'testTask', 'test', 'hello world', '0', NULL, 1, '2018-03-20 15:32:03');
INSERT INTO `t_job_log` VALUES (2462, 3, 'testTask', 'test', 'hello world', '0', NULL, 1, '2018-03-20 15:32:04');
INSERT INTO `t_job_log` VALUES (2463, 3, 'testTask', 'test', 'hello world', '0', NULL, 1, '2018-03-20 15:32:05');
INSERT INTO `t_job_log` VALUES (2464, 3, 'testTask', 'test', 'hello world', '0', NULL, 1, '2018-03-20 15:32:06');
INSERT INTO `t_job_log` VALUES (2465, 11, 'testTask', 'test2', NULL, '1', 'java.lang.NoSuchMethodException: cc.mrbird.job.task.TestTask.test2()', 0, '2018-03-20 15:32:26');
INSERT INTO `t_job_log` VALUES (2466, 2, 'testTask', 'test1', NULL, '0', NULL, 1, '2018-04-02 15:26:40');
INSERT INTO `t_job_log` VALUES (2467, 2, 'testTask', 'test1', NULL, '0', NULL, 1, '2018-04-02 15:26:50');
INSERT INTO `t_job_log` VALUES (2468, 2, 'testTask', 'test1', NULL, '0', NULL, 1, '2018-04-02 15:27:20');
INSERT INTO `t_job_log` VALUES (2469, 2, 'testTask', 'test1', NULL, '0', NULL, 3, '2018-04-02 17:29:20');
INSERT INTO `t_job_log` VALUES (2476, 1, 'testTask', 'test', 'mrbird', '0', NULL, 1, '2019-01-06 08:25:00');
INSERT INTO `t_job_log` VALUES (2477, 11, 'testTask', 'test2', NULL, '1', 'java.lang.NoSuchMethodException: cc.mrbird.febs.job.task.TestTask.test2()', 0, '2019-01-06 08:25:25');
INSERT INTO `t_job_log` VALUES (2478, 1, 'testTask', 'test', 'mrbird', '0', NULL, 1, '2019-01-06 08:40:15');
INSERT INTO `t_job_log` VALUES (2479, 1, 'testTask', 'test', 'mrbird', '0', NULL, 1, '2019-01-06 08:40:15');
INSERT INTO `t_job_log` VALUES (2480, 1, 'testTask', 'test', 'mrbird', '0', NULL, 1, '2019-01-06 08:40:15');
INSERT INTO `t_job_log` VALUES (2481, 1, 'testTask', 'test', 'mrbird', '0', NULL, 1, '2019-01-06 08:40:15');
INSERT INTO `t_job_log` VALUES (2482, 1, 'testTask', 'test', 'mrbird', '0', NULL, 0, '2019-01-06 08:40:15');
INSERT INTO `t_job_log` VALUES (2483, 1, 'testTask', 'test', 'mrbird', '0', NULL, 1, '2019-01-06 08:40:15');
INSERT INTO `t_job_log` VALUES (2484, 1, 'testTask', 'test', 'mrbird', '0', NULL, 0, '2019-01-06 08:40:15');
INSERT INTO `t_job_log` VALUES (2485, 1, 'testTask', 'test', 'mrbird', '0', NULL, 0, '2019-01-06 08:40:15');
INSERT INTO `t_job_log` VALUES (2486, 1, 'testTask', 'test', 'mrbird', '0', NULL, 0, '2019-01-06 08:40:15');
INSERT INTO `t_job_log` VALUES (2487, 1, 'testTask', 'test', 'mrbird', '0', NULL, 0, '2019-01-06 08:40:15');
INSERT INTO `t_job_log` VALUES (2488, 1, 'testTask', 'test', 'mrbird', '0', NULL, 1, '2019-01-06 08:40:16');
INSERT INTO `t_job_log` VALUES (2489, 1, 'testTask', 'test', 'mrbird', '0', NULL, 0, '2019-01-06 08:40:17');
INSERT INTO `t_job_log` VALUES (2490, 1, 'testTask', 'test', 'mrbird', '0', NULL, 1, '2019-01-06 08:40:18');
INSERT INTO `t_job_log` VALUES (2491, 1, 'testTask', 'test', 'mrbird', '0', NULL, 0, '2019-01-06 08:40:19');
INSERT INTO `t_job_log` VALUES (2492, 1, 'testTask', 'test', 'mrbird', '0', NULL, 1, '2019-01-06 08:40:20');
INSERT INTO `t_job_log` VALUES (2493, 1, 'testTask', 'test', 'mrbird', '0', NULL, 0, '2019-01-06 08:40:21');
INSERT INTO `t_job_log` VALUES (2494, 1, 'testTask', 'test', 'mrbird', '0', NULL, 0, '2019-01-06 08:40:22');
INSERT INTO `t_job_log` VALUES (2495, 11, 'testTask', 'test2', NULL, '1', 'java.lang.NoSuchMethodException: cc.mrbird.febs.job.task.TestTask.test2()', 2, '2019-01-06 08:40:36');
INSERT INTO `t_job_log` VALUES (2496, 11, 'testTask', 'test2', NULL, '1', 'java.lang.NoSuchMethodException: cc.mrbird.febs.job.task.TestTask.test2()', 0, '2019-01-06 08:40:36');
INSERT INTO `t_job_log` VALUES (2497, 11, 'testTask', 'test2', NULL, '1', 'java.lang.NoSuchMethodException: cc.mrbird.febs.job.task.TestTask.test2()', 1, '2019-01-06 08:40:40');
INSERT INTO `t_job_log` VALUES (2498, 2, 'testTask', 'test1', NULL, '0', NULL, 1, '2019-01-06 11:36:20');
INSERT INTO `t_job_log` VALUES (2499, 1, 'testTask', 'test', 'mrbird', '0', NULL, 30, '2019-01-22 05:41:01');
INSERT INTO `t_job_log` VALUES (2500, 1, 'testTask', 'test', 'mrbird', '0', NULL, 9, '2019-01-23 06:28:58');
INSERT INTO `t_job_log` VALUES (2501, 1, 'testTask', 'test', 'mrbird', '0', NULL, 12, '2019-01-24 05:39:59');

-- ----------------------------
-- Table structure for t_log
-- ----------------------------
DROP TABLE IF EXISTS `t_log`;
CREATE TABLE `t_log`  (
  `ID` bigint NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `USERNAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作用户',
  `OPERATION` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '操作内容',
  `TIME` decimal(11, 0) NULL DEFAULT NULL COMMENT '耗时',
  `METHOD` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '操作方法',
  `PARAMS` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '方法参数',
  `IP` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作者IP',
  `CREATE_TIME` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `location` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作地点',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1900 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_log
-- ----------------------------
INSERT INTO `t_log` VALUES (1815, 'mrbird', '删除用户', 301, 'cc.mrbird.febs.system.controller.UserController.deleteUsers()', ' userIds: \"11\"', '127.0.0.1', '2019-01-23 06:26:43', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1816, 'mrbird', '修改菜单/按钮', 170, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=2, parentId=0, menuName=系统监控, path=/monitor, component=PageView, perms=null, icon=dashboard, type=0, orderNum=2.0, createTime=null, modifyTime=Wed Jan 23 14:27:12 CST 2019, createTimeFrom=null, createTimeTo=null)\"', '127.0.0.1', '2019-01-23 06:27:13', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1817, 'mrbird', '修改部门', 90, 'cc.mrbird.febs.system.controller.DeptController.updateDept()', ' dept: \"Dept(deptId=4, parentId=0, deptName=市场部, orderNum=2.0, createTime=null, modifyTime=Wed Jan 23 14:27:55 CST 2019, createTimeFrom=null, createTimeTo=null)\"', '127.0.0.1', '2019-01-23 06:27:56', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1818, 'mrbird', '修改部门', 596, 'cc.mrbird.febs.system.controller.DeptController.updateDept()', ' dept: \"Dept(deptId=5, parentId=0, deptName=人事部, orderNum=3.0, createTime=null, modifyTime=Wed Jan 23 14:27:59 CST 2019, createTimeFrom=null, createTimeTo=null)\"', '127.0.0.1', '2019-01-23 06:28:00', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1819, 'mrbird', '执行定时任务', 146, 'cc.mrbird.febs.job.controller.JobController.runJob()', ' jobId: \"1\"', '127.0.0.1', '2019-01-23 06:28:58', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1820, 'mrbird', '新增菜单/按钮', 160, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=130, parentId=3, menuName=导出Excel, path=null, component=null, perms=user:export, icon=null, type=1, orderNum=null, createTime=Wed Jan 23 14:35:15 CST 2019, modifyTime=null, createTimeFrom=null, createTimeTo=null)\"', '127.0.0.1', '2019-01-23 06:35:16', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1821, 'mrbird', '新增菜单/按钮', 255, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=131, parentId=4, menuName=导出Excel, path=null, component=null, perms=role:export, icon=null, type=1, orderNum=null, createTime=Wed Jan 23 14:35:36 CST 2019, modifyTime=null, createTimeFrom=null, createTimeTo=null)\"', '127.0.0.1', '2019-01-23 06:35:36', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1822, 'mrbird', '新增菜单/按钮', 172, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=132, parentId=5, menuName=导出Excel, path=null, component=null, perms=menu:export, icon=null, type=1, orderNum=null, createTime=Wed Jan 23 14:36:04 CST 2019, modifyTime=null, createTimeFrom=null, createTimeTo=null)\"', '127.0.0.1', '2019-01-23 06:36:05', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1823, 'mrbird', '新增菜单/按钮', 188, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=133, parentId=6, menuName=导出Excel, path=null, component=null, perms=dept:export, icon=null, type=1, orderNum=null, createTime=Wed Jan 23 14:36:24 CST 2019, modifyTime=null, createTimeFrom=null, createTimeTo=null)\"', '127.0.0.1', '2019-01-23 06:36:25', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1824, 'mrbird', '新增菜单/按钮', 186, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=134, parentId=64, menuName=导出Excel, path=null, component=null, perms=dict:export, icon=null, type=1, orderNum=null, createTime=Wed Jan 23 14:36:43 CST 2019, modifyTime=null, createTimeFrom=null, createTimeTo=null)\"', '127.0.0.1', '2019-01-23 06:36:44', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1825, 'mrbird', '新增菜单/按钮', 160, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=135, parentId=3, menuName=密码重置, path=null, component=null, perms=user:reset, icon=null, type=1, orderNum=null, createTime=Wed Jan 23 14:36:59 CST 2019, modifyTime=null, createTimeFrom=null, createTimeTo=null)\"', '127.0.0.1', '2019-01-23 06:37:00', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1826, 'mrbird', '新增菜单/按钮', 181, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=136, parentId=10, menuName=导出Excel, path=null, component=null, perms=log:export, icon=null, type=1, orderNum=null, createTime=Wed Jan 23 14:37:26 CST 2019, modifyTime=null, createTimeFrom=null, createTimeTo=null)\"', '127.0.0.1', '2019-01-23 06:37:27', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1827, 'mrbird', '新增菜单/按钮', 146, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=137, parentId=102, menuName=导出Excel, path=null, component=null, perms=job:export, icon=null, type=1, orderNum=null, createTime=Wed Jan 23 14:37:59 CST 2019, modifyTime=null, createTimeFrom=null, createTimeTo=null)\"', '127.0.0.1', '2019-01-23 06:37:59', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1828, 'mrbird', '新增菜单/按钮', 164, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=138, parentId=109, menuName=导出Excel, path=null, component=null, perms=jobLog:export, icon=null, type=1, orderNum=null, createTime=Wed Jan 23 14:38:32 CST 2019, modifyTime=null, createTimeFrom=null, createTimeTo=null)\"', '127.0.0.1', '2019-01-23 06:38:33', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1829, 'mrbird', '修改角色', 3132, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=管理员, remark=管理员, createTime=null, modifyTime=Wed Jan 23 14:45:28 CST 2019, createTimeFrom=null, createTimeTo=null, menuId=1,3,11,12,13,4,14,15,16,5,17,18,19,6,20,21,22,64,65,66,67,2,8,23,10,24,113,121,122,124,123,125,101,102,103,104,105,106,107,108,109,110,58,59,61,81,82,83,127,128,129,130,135,131,132,133,134,136,137,138)\"', '127.0.0.1', '2019-01-23 06:45:32', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1830, 'mrbird', '修改角色', 1730, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=2, roleName=注册用户, remark=只可查看不可操作, createTime=null, modifyTime=Wed Jan 23 15:31:07 CST 2019, createTimeFrom=null, createTimeTo=null, menuId=3,1,4,5,6,64,2,8,10,113,121,122,124,123,125,101,102,109,58,59,61,81,82,83,127,128,129)\"', '127.0.0.1', '2019-01-23 07:31:09', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1831, 'mrbird', '修改角色', 1997, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=2, roleName=注册用户, remark=可查看，新增，导出, createTime=null, modifyTime=Wed Jan 23 15:32:20 CST 2019, createTimeFrom=null, createTimeTo=null, menuId=3,1,4,5,6,64,2,8,10,113,121,122,124,123,125,101,102,109,58,59,61,81,82,83,127,128,129,130,14,17,132,20,133,65,134,136,103,137,138)\"', '127.0.0.1', '2019-01-23 07:32:22', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1832, 'mrbird', '新增角色', 1428, 'cc.mrbird.febs.system.controller.RoleController.addRole()', ' role: \"Role(roleId=72, roleName=普通用户, remark=只可查看，好可怜哦, createTime=Wed Jan 23 15:33:20 CST 2019, modifyTime=null, createTimeFrom=null, createTimeTo=null, menuId=1,3,4,5,6,64,2,8,10,113,121,122,124,123,127,101,102,109,58,59,61,81,82,83,128,129)\"', '127.0.0.1', '2019-01-23 07:33:22', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1833, 'mrbird', '新增用户', 338, 'cc.mrbird.febs.system.controller.UserController.addUser()', ' user: \"User(userId=12, username=jack, password=552649f10640385d0728a80a4242893e, deptId=6, deptName=null, email=jack@hotmail.com, mobile=null, status=1, createTime=Wed Jan 23 15:34:05 CST 2019, modifyTime=null, lastLoginTime=null, ssex=0, description=null, avatar=default.jpg, roleId=72, roleName=null, sortField=null, sortOrder=null, createTimeFrom=null, createTimeTo=null, id=null)\"', '127.0.0.1', '2019-01-23 07:34:06', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1834, 'mrbird', '修改角色', 2160, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=2, roleName=注册用户, remark=可查看，新增，导出, createTime=null, modifyTime=Wed Jan 23 15:37:08 CST 2019, createTimeFrom=null, createTimeTo=null, menuId=3,1,4,5,6,64,2,8,10,113,121,122,124,123,125,101,102,109,58,59,61,81,82,83,127,128,129,130,14,17,132,20,133,65,134,136,103,137,138,131)\"', '127.0.0.1', '2019-01-23 07:37:11', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1835, 'mrbird', '新增角色', 169, 'cc.mrbird.febs.system.controller.RoleController.addRole()', ' role: \"Role(roleId=73, roleName=测试xss, remark=<style>body{background:red !important}</style>, createTime=Wed Jan 23 15:47:04 CST 2019, modifyTime=null, createTimeFrom=null, createTimeTo=null, menuId=1,3)\"', '127.0.0.1', '2019-01-23 07:47:04', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1836, 'mrbird', '删除角色', 54, 'cc.mrbird.febs.system.controller.RoleController.deleteRoles()', ' roleIds: \"73\"', '218.104.237.213', '2019-01-24 03:03:41', '中国|华东|福建省|福州市|联通');
INSERT INTO `t_log` VALUES (1837, 'mrbird', '修改用户', 39, 'cc.mrbird.febs.system.controller.UserController.updateUser()', ' user: \"User(userId=12, username=jack, password=null, deptId=6, deptName=null, email=jack@hotmail.com, mobile=null, status=1, createTime=null, modifyTime=Thu Jan 24 11:08:00 CST 2019, lastLoginTime=null, ssex=0, description=null, avatar=null, roleId=72, roleName=null, sortField=null, sortOrder=null, createTimeFrom=null, createTimeTo=null, id=null)\"', '218.104.237.213', '2019-01-24 03:08:01', '中国|华东|福建省|福州市|联通');
INSERT INTO `t_log` VALUES (1838, 'mrbird', '执行定时任务', 41, 'cc.mrbird.febs.job.controller.JobController.runJob()', ' jobId: \"1\"', '218.104.237.213', '2019-01-24 05:39:59', '中国|华东|福建省|福州市|联通');
INSERT INTO `t_log` VALUES (1839, 'mrbird', '新增菜单/按钮', 10, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=139, parentId=0, menuName=系统管理, path=/manage, component=PageView, perms=null, icon=appstore, type=0, orderNum=6.0, createTime=Sun Mar 30 18:44:04 CST 2025, modifyTime=null, createTimeFrom=null, createTimeTo=null)\"', '127.0.0.1', '2025-03-30 18:44:05', '');
INSERT INTO `t_log` VALUES (1840, 'mrbird', '新增菜单/按钮', 8, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=140, parentId=139, menuName=楼宇管理, path=/manage/building, component=manage/building/Building, perms=null, icon=file-word, type=0, orderNum=1.0, createTime=Sun Mar 30 18:44:45 CST 2025, modifyTime=null, createTimeFrom=null, createTimeTo=null)\"', '127.0.0.1', '2025-03-30 18:44:45', '');
INSERT INTO `t_log` VALUES (1841, 'mrbird', '新增菜单/按钮', 7, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=141, parentId=139, menuName=公告管理, path=/manage/bulletin, component=manage/bulletin/Bulletin, perms=null, icon=solution, type=0, orderNum=2.0, createTime=Sun Mar 30 18:46:59 CST 2025, modifyTime=null, createTimeFrom=null, createTimeTo=null)\"', '127.0.0.1', '2025-03-30 18:47:00', '');
INSERT INTO `t_log` VALUES (1842, 'mrbird', '新增菜单/按钮', 5, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=142, parentId=139, menuName=出入库记录, path=/manage/details, component=manage/details/Details, perms=null, icon=upload, type=0, orderNum=3.0, createTime=Sun Mar 30 18:47:45 CST 2025, modifyTime=null, createTimeFrom=null, createTimeTo=null)\"', '127.0.0.1', '2025-03-30 18:47:46', '');
INSERT INTO `t_log` VALUES (1843, 'mrbird', '新增菜单/按钮', 5, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=143, parentId=139, menuName=设备管理, path=/manage/device, component=manage/device/Device, perms=null, icon=database, type=0, orderNum=4.0, createTime=Sun Mar 30 18:49:10 CST 2025, modifyTime=null, createTimeFrom=null, createTimeTo=null)\"', '127.0.0.1', '2025-03-30 18:49:10', '');
INSERT INTO `t_log` VALUES (1844, 'mrbird', '新增菜单/按钮', 8, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=144, parentId=139, menuName=申请记录, path=/manage/goods, component=manage/goods/Goods, perms=null, icon=printer, type=0, orderNum=5.0, createTime=Sun Mar 30 18:50:21 CST 2025, modifyTime=null, createTimeFrom=null, createTimeTo=null)\"', '127.0.0.1', '2025-03-30 18:50:21', '');
INSERT INTO `t_log` VALUES (1845, 'mrbird', '新增菜单/按钮', 5, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=145, parentId=139, menuName=房屋管理, path=/manage/houses, component=manage/houses/Houses, perms=null, icon=usb, type=0, orderNum=6.0, createTime=Sun Mar 30 18:51:04 CST 2025, modifyTime=null, createTimeFrom=null, createTimeTo=null)\"', '127.0.0.1', '2025-03-30 18:51:04', '');
INSERT INTO `t_log` VALUES (1846, 'mrbird', '新增菜单/按钮', 8, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=146, parentId=139, menuName=维修工单, path=/manage/repair, component=manage/repair/Repair, perms=null, icon=tool, type=0, orderNum=7.0, createTime=Sun Mar 30 18:51:49 CST 2025, modifyTime=null, createTimeFrom=null, createTimeTo=null)\"', '127.0.0.1', '2025-03-30 18:51:50', '');
INSERT INTO `t_log` VALUES (1847, 'mrbird', '新增菜单/按钮', 6, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=147, parentId=139, menuName=设施检查, path=/manage/inspection, component=manage/inspection/Inspection, perms=null, icon=fork, type=0, orderNum=8.0, createTime=Sun Mar 30 18:52:41 CST 2025, modifyTime=null, createTimeFrom=null, createTimeTo=null)\"', '127.0.0.1', '2025-03-30 18:52:42', '');
INSERT INTO `t_log` VALUES (1848, 'mrbird', '新增菜单/按钮', 6, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=148, parentId=139, menuName=业主管理, path=/manage/owner, component=manage/owner/Owner, perms=null, icon=team, type=0, orderNum=9.0, createTime=Sun Mar 30 18:53:14 CST 2025, modifyTime=null, createTimeFrom=null, createTimeTo=null)\"', '127.0.0.1', '2025-03-30 18:53:14', '');
INSERT INTO `t_log` VALUES (1849, 'mrbird', '新增菜单/按钮', 6, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=149, parentId=139, menuName=采购申请, path=/manage/rurchase, component=manage/rurchase/Rurchase, perms=null, icon=barcode, type=0, orderNum=11.0, createTime=Sun Mar 30 18:53:49 CST 2025, modifyTime=null, createTimeFrom=null, createTimeTo=null)\"', '127.0.0.1', '2025-03-30 18:53:49', '');
INSERT INTO `t_log` VALUES (1850, 'mrbird', '新增菜单/按钮', 5, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=150, parentId=139, menuName=库房管理, path=/manage/stock, component=manage/stock/Stock, perms=null, icon=qrcode, type=0, orderNum=12.0, createTime=Sun Mar 30 18:54:24 CST 2025, modifyTime=null, createTimeFrom=null, createTimeTo=null)\"', '127.0.0.1', '2025-03-30 18:54:24', '');
INSERT INTO `t_log` VALUES (1851, 'mrbird', '新增菜单/按钮', 5, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=151, parentId=139, menuName=出库记录, path=/manage/stockout, component=manage/stockout/Stockout, perms=null, icon=read, type=0, orderNum=13.0, createTime=Sun Mar 30 18:54:57 CST 2025, modifyTime=null, createTimeFrom=null, createTimeTo=null)\"', '127.0.0.1', '2025-03-30 18:54:57', '');
INSERT INTO `t_log` VALUES (1852, 'mrbird', '新增菜单/按钮', 5, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=152, parentId=139, menuName=入库记录, path=/manage/stockput, component=manage/stockput/Stockput, perms=null, icon=switcher, type=0, orderNum=14.0, createTime=Sun Mar 30 18:55:27 CST 2025, modifyTime=null, createTimeFrom=null, createTimeTo=null)\"', '127.0.0.1', '2025-03-30 18:55:28', '');
INSERT INTO `t_log` VALUES (1853, 'mrbird', '新增菜单/按钮', 6, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=153, parentId=139, menuName=物品类型, path=/manage/type, component=manage/type/Type, perms=null, icon=database, type=0, orderNum=14.0, createTime=Sun Mar 30 18:56:07 CST 2025, modifyTime=null, createTimeFrom=null, createTimeTo=null)\"', '127.0.0.1', '2025-03-30 18:56:07', '');
INSERT INTO `t_log` VALUES (1854, 'mrbird', '新增菜单/按钮', 5, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=154, parentId=139, menuName=员工管理, path=/manage/worker, component=manage/worker/Worker, perms=null, icon=deployment-unit, type=0, orderNum=15.0, createTime=Sun Mar 30 18:56:33 CST 2025, modifyTime=null, createTimeFrom=null, createTimeTo=null)\"', '127.0.0.1', '2025-03-30 18:56:33', '');
INSERT INTO `t_log` VALUES (1855, 'mrbird', '新增角色', 39, 'cc.mrbird.febs.system.controller.RoleController.addRole()', ' role: \"Role(roleId=74, roleName=超级管理员, remark=, createTime=Sun Mar 30 18:56:59 CST 2025, modifyTime=null, createTimeFrom=null, createTimeTo=null, menuId=139,140,141,142,143,144,146,145,147,148,149,150,151,152,153,154)\"', '127.0.0.1', '2025-03-30 18:56:59', '');
INSERT INTO `t_log` VALUES (1856, 'mrbird', '新增用户', 18, 'cc.mrbird.febs.system.controller.UserController.addUser()', ' user: \"User(userId=13, username=admin, password=3ee4a28b103216fa2d140d1979297910, deptId=null, deptName=null, email=null, mobile=null, status=1, createTime=Sun Mar 30 18:57:10 CST 2025, modifyTime=null, lastLoginTime=null, ssex=2, description=null, avatar=default.jpg, roleId=74, roleName=null, sortField=null, sortOrder=null, createTimeFrom=null, createTimeTo=null, id=null)\"', '127.0.0.1', '2025-03-30 18:57:11', '');
INSERT INTO `t_log` VALUES (1857, 'mrbird', '新增菜单/按钮', 10, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=155, parentId=139, menuName=投诉管理, path=/manage/complaint, component=manage/complaint/Complaint, perms=null, icon=filter, type=0, orderNum=2.0, createTime=Mon Mar 31 23:16:21 CST 2025, modifyTime=null, createTimeFrom=null, createTimeTo=null)\"', '127.0.0.1', '2025-03-31 23:16:22', '');
INSERT INTO `t_log` VALUES (1858, 'mrbird', '新增菜单/按钮', 5, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=156, parentId=139, menuName=工单评价, path=/manage/evaluate, component=manage/evaluate/Evaluate, perms=null, icon=phone, type=0, orderNum=2.0, createTime=Mon Mar 31 23:16:53 CST 2025, modifyTime=null, createTimeFrom=null, createTimeTo=null)\"', '127.0.0.1', '2025-03-31 23:16:54', '');
INSERT INTO `t_log` VALUES (1859, 'mrbird', '修改角色', 67, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=74, roleName=超级管理员, remark=, createTime=null, modifyTime=Mon Mar 31 23:17:00 CST 2025, createTimeFrom=null, createTimeTo=null, menuId=139,140,141,142,143,144,146,145,147,148,149,150,151,152,153,154,155,156)\"', '127.0.0.1', '2025-03-31 23:17:00', '');
INSERT INTO `t_log` VALUES (1860, 'mrbird', '新增菜单/按钮', 5, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=157, parentId=0, menuName=系统业务, path=/user, component=PageView, perms=null, icon=pushpin, type=0, orderNum=7.0, createTime=Mon Mar 31 23:18:11 CST 2025, modifyTime=null, createTimeFrom=null, createTimeTo=null)\"', '127.0.0.1', '2025-03-31 23:18:12', '');
INSERT INTO `t_log` VALUES (1861, 'mrbird', '新增菜单/按钮', 6, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=158, parentId=157, menuName=我的房屋, path=/user/houses, component=user/houses/Houses, perms=null, icon=copyright, type=0, orderNum=1.0, createTime=Mon Mar 31 23:18:46 CST 2025, modifyTime=null, createTimeFrom=null, createTimeTo=null)\"', '127.0.0.1', '2025-03-31 23:18:47', '');
INSERT INTO `t_log` VALUES (1862, 'mrbird', '新增菜单/按钮', 4, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=159, parentId=157, menuName=维修工单, path=/user/repair, component=user/repair/Repair, perms=null, icon=layout, type=0, orderNum=2.0, createTime=Mon Mar 31 23:19:33 CST 2025, modifyTime=null, createTimeFrom=null, createTimeTo=null)\"', '127.0.0.1', '2025-03-31 23:19:33', '');
INSERT INTO `t_log` VALUES (1863, 'mrbird', '新增菜单/按钮', 5, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=160, parentId=157, menuName=工单评价, path=/user/evaluate, component=user/evaluate/Evaluate, perms=null, icon=printer, type=0, orderNum=3.0, createTime=Mon Mar 31 23:20:07 CST 2025, modifyTime=null, createTimeFrom=null, createTimeTo=null)\"', '127.0.0.1', '2025-03-31 23:20:08', '');
INSERT INTO `t_log` VALUES (1864, 'mrbird', '新增菜单/按钮', 8, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=161, parentId=157, menuName=投诉记录, path=/user/complaint, component=user/complaint/Complaint, perms=null, icon=select, type=0, orderNum=4.0, createTime=Mon Mar 31 23:20:38 CST 2025, modifyTime=null, createTimeFrom=null, createTimeTo=null)\"', '127.0.0.1', '2025-03-31 23:20:39', '');
INSERT INTO `t_log` VALUES (1865, 'mrbird', '新增菜单/按钮', 6, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=162, parentId=157, menuName=支付成功, path=/user/pay, component=user/pay/Pay, perms=null, icon=fire, type=0, orderNum=5.0, createTime=Mon Mar 31 23:21:18 CST 2025, modifyTime=null, createTimeFrom=null, createTimeTo=null)\"', '127.0.0.1', '2025-03-31 23:21:18', '');
INSERT INTO `t_log` VALUES (1866, 'mrbird', '新增角色', 19, 'cc.mrbird.febs.system.controller.RoleController.addRole()', ' role: \"Role(roleId=75, roleName=业主, remark=, createTime=Mon Mar 31 23:22:11 CST 2025, modifyTime=null, createTimeFrom=null, createTimeTo=null, menuId=157,158,159,160,161,162)\"', '127.0.0.1', '2025-03-31 23:22:12', '');
INSERT INTO `t_log` VALUES (1867, 'mrbird', '新增菜单/按钮', 8, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=163, parentId=157, menuName=业主信息, path=/user/personal, component=user/personal/Personal, perms=null, icon=user, type=0, orderNum=1.0, createTime=Mon Mar 31 23:23:33 CST 2025, modifyTime=null, createTimeFrom=null, createTimeTo=null)\"', '127.0.0.1', '2025-03-31 23:23:34', '');
INSERT INTO `t_log` VALUES (1868, 'mrbird', '修改角色', 25, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=75, roleName=业主, remark=, createTime=null, modifyTime=Mon Mar 31 23:23:43 CST 2025, createTimeFrom=null, createTimeTo=null, menuId=157,158,159,160,161,162,163)\"', '127.0.0.1', '2025-03-31 23:23:43', '');
INSERT INTO `t_log` VALUES (1869, 'mrbird', '新增菜单/按钮', 4, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=164, parentId=0, menuName=维修业务, path=/user, component=PageView, perms=null, icon=link, type=0, orderNum=8.0, createTime=Mon Mar 31 23:25:21 CST 2025, modifyTime=null, createTimeFrom=null, createTimeTo=null)\"', '127.0.0.1', '2025-03-31 23:25:21', '');
INSERT INTO `t_log` VALUES (1870, 'mrbird', '修改菜单/按钮', 10, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=164, parentId=0, menuName=维修业务, path=/staff, component=PageView, perms=null, icon=link, type=0, orderNum=8.0, createTime=null, modifyTime=Mon Mar 31 23:26:28 CST 2025, createTimeFrom=null, createTimeTo=null)\"', '127.0.0.1', '2025-03-31 23:26:29', '');
INSERT INTO `t_log` VALUES (1871, 'mrbird', '新增菜单/按钮', 5, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=165, parentId=164, menuName=个人信息, path=/staff/personal, component=staff/personal/Personal, perms=null, icon=user, type=0, orderNum=1.0, createTime=Mon Mar 31 23:27:03 CST 2025, modifyTime=null, createTimeFrom=null, createTimeTo=null)\"', '127.0.0.1', '2025-03-31 23:27:04', '');
INSERT INTO `t_log` VALUES (1872, 'mrbird', '新增菜单/按钮', 4, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=166, parentId=0, menuName=投诉记录, path=/staff/complaint, component=staff/complaint/Complaint, perms=null, icon=solution, type=0, orderNum=2.0, createTime=Mon Mar 31 23:27:35 CST 2025, modifyTime=null, createTimeFrom=null, createTimeTo=null)\"', '127.0.0.1', '2025-03-31 23:27:35', '');
INSERT INTO `t_log` VALUES (1873, 'mrbird', '修改菜单/按钮', 9, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=166, parentId=164, menuName=投诉记录, path=/staff/complaint, component=staff/complaint/Complaint, perms=null, icon=solution, type=0, orderNum=2.0, createTime=null, modifyTime=Mon Mar 31 23:27:41 CST 2025, createTimeFrom=null, createTimeTo=null)\"', '127.0.0.1', '2025-03-31 23:27:42', '');
INSERT INTO `t_log` VALUES (1874, 'mrbird', '新增菜单/按钮', 4, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=167, parentId=164, menuName=工单评价, path=/staff/evaluate, component=staff/evaluate/Evaluate, perms=null, icon=like, type=0, orderNum=3.0, createTime=Mon Mar 31 23:28:08 CST 2025, modifyTime=null, createTimeFrom=null, createTimeTo=null)\"', '127.0.0.1', '2025-03-31 23:28:08', '');
INSERT INTO `t_log` VALUES (1875, 'mrbird', '新增菜单/按钮', 5, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=168, parentId=164, menuName=我的工单, path=/staff/repair, component=staff/repair/Repair, perms=null, icon=exception, type=0, orderNum=4.0, createTime=Mon Mar 31 23:28:42 CST 2025, modifyTime=null, createTimeFrom=null, createTimeTo=null)\"', '127.0.0.1', '2025-03-31 23:28:43', '');
INSERT INTO `t_log` VALUES (1876, 'mrbird', '新增菜单/按钮', 6, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=169, parentId=164, menuName=设施巡检, path=/staff/inspection, component=staff/inspection/Inspection, perms=null, icon=build, type=0, orderNum=5.0, createTime=Mon Mar 31 23:29:09 CST 2025, modifyTime=null, createTimeFrom=null, createTimeTo=null)\"', '127.0.0.1', '2025-03-31 23:29:10', '');
INSERT INTO `t_log` VALUES (1877, 'mrbird', '新增角色', 16, 'cc.mrbird.febs.system.controller.RoleController.addRole()', ' role: \"Role(roleId=76, roleName=维修工, remark=, createTime=Mon Mar 31 23:29:26 CST 2025, modifyTime=null, createTimeFrom=null, createTimeTo=null, menuId=164,165,166,167,168,169)\"', '127.0.0.1', '2025-03-31 23:29:26', '');
INSERT INTO `t_log` VALUES (1878, 'mrbird', '新增用户', 22, 'cc.mrbird.febs.system.controller.UserController.addUser()', ' user: \"User(userId=14, username=fank, password=19706f85f729c34626ae29c29d55cac5, deptId=null, deptName=null, email=null, mobile=null, status=1, createTime=Tue Apr 01 07:55:19 CST 2025, modifyTime=null, lastLoginTime=null, ssex=2, description=null, avatar=default.jpg, roleId=75, roleName=null, sortField=null, sortOrder=null, createTimeFrom=null, createTimeTo=null, id=null)\"', '127.0.0.1', '2025-04-01 07:55:20', '');
INSERT INTO `t_log` VALUES (1879, 'mrbird', '新增用户', 14, 'cc.mrbird.febs.system.controller.UserController.addUser()', ' user: \"User(userId=15, username=fkkk, password=5fd41b097acb41c642139202bb04df6e, deptId=null, deptName=null, email=null, mobile=null, status=1, createTime=Tue Apr 01 07:55:31 CST 2025, modifyTime=null, lastLoginTime=null, ssex=2, description=null, avatar=default.jpg, roleId=76, roleName=null, sortField=null, sortOrder=null, createTimeFrom=null, createTimeTo=null, id=null)\"', '127.0.0.1', '2025-04-01 07:55:32', '');
INSERT INTO `t_log` VALUES (1880, 'mrbird', '新增菜单/按钮', 11, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=170, parentId=139, menuName=房屋看板, path=/user/dashboard, component=user/dashboard/Dashboard, perms=null, icon=laptop, type=0, orderNum=0.0, createTime=Sat Apr 12 18:57:46 CST 2025, modifyTime=null, createTimeFrom=null, createTimeTo=null)\"', '127.0.0.1', '2025-04-12 18:57:47', '');
INSERT INTO `t_log` VALUES (1881, 'mrbird', '修改菜单/按钮', 10, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=170, parentId=157, menuName=房屋看板, path=/user/dashboard, component=user/dashboard/Houses, perms=null, icon=laptop, type=0, orderNum=0.0, createTime=null, modifyTime=Sat Apr 12 18:58:19 CST 2025, createTimeFrom=null, createTimeTo=null)\"', '127.0.0.1', '2025-04-12 18:58:20', '');
INSERT INTO `t_log` VALUES (1882, 'mrbird', '修改角色', 53, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=75, roleName=业主, remark=, createTime=null, modifyTime=Sat Apr 12 18:58:31 CST 2025, createTimeFrom=null, createTimeTo=null, menuId=157,158,159,160,161,162,163,170)\"', '127.0.0.1', '2025-04-12 18:58:32', '');
INSERT INTO `t_log` VALUES (1883, 'mrbird', '新增菜单/按钮', 10, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=171, parentId=0, menuName=库房采购, path=/purchase, component=PageView, perms=null, icon=pushpin, type=0, orderNum=9.0, createTime=Sun Apr 13 01:27:53 CST 2025, modifyTime=null, createTimeFrom=null, createTimeTo=null)\"', '127.0.0.1', '2025-04-13 01:27:53', '');
INSERT INTO `t_log` VALUES (1884, 'mrbird', '新增菜单/按钮', 7, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=172, parentId=171, menuName=采购入库, path=/purchase/request, component=purchase/request/Request, perms=null, icon=flag, type=0, orderNum=1.0, createTime=Sun Apr 13 01:28:58 CST 2025, modifyTime=null, createTimeFrom=null, createTimeTo=null)\"', '127.0.0.1', '2025-04-13 01:28:59', '');
INSERT INTO `t_log` VALUES (1885, 'mrbird', '新增菜单/按钮', 7, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=173, parentId=171, menuName=采购入库, path=/purchase/rurchase, component=purchase/rurchase/Rurchase, perms=null, icon=printer, type=0, orderNum=2.0, createTime=Sun Apr 13 01:29:39 CST 2025, modifyTime=null, createTimeFrom=null, createTimeTo=null)\"', '127.0.0.1', '2025-04-13 01:29:39', '');
INSERT INTO `t_log` VALUES (1886, 'mrbird', '修改菜单/按钮', 13, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=172, parentId=171, menuName=库房入库, path=/purchase/request, component=purchase/request/Request, perms=null, icon=flag, type=0, orderNum=1.0, createTime=null, modifyTime=Sun Apr 13 01:29:58 CST 2025, createTimeFrom=null, createTimeTo=null)\"', '127.0.0.1', '2025-04-13 01:29:58', '');
INSERT INTO `t_log` VALUES (1887, 'mrbird', '修改角色', 73, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=74, roleName=超级管理员, remark=, createTime=null, modifyTime=Sun Apr 13 01:30:08 CST 2025, createTimeFrom=null, createTimeTo=null, menuId=139,140,141,142,143,144,146,145,147,148,149,150,151,152,153,154,155,156,171,172,173)\"', '127.0.0.1', '2025-04-13 01:30:09', '');
INSERT INTO `t_log` VALUES (1888, 'mrbird', '删除菜单/按钮', 25, 'cc.mrbird.febs.system.controller.MenuController.deleteMenus()', ' menuIds: \"171\"', '127.0.0.1', '2025-08-21 21:16:54', '');
INSERT INTO `t_log` VALUES (1889, 'mrbird', '删除菜单/按钮', 30, 'cc.mrbird.febs.system.controller.MenuController.deleteMenus()', ' menuIds: \"152,151,153,150,149,144,142,143\"', '127.0.0.1', '2025-08-21 21:17:43', '');
INSERT INTO `t_log` VALUES (1890, 'mrbird', '修改菜单/按钮', 19, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=157, parentId=0, menuName=系统服务, path=/user, component=PageView, perms=null, icon=pushpin, type=0, orderNum=7.0, createTime=null, modifyTime=Fri Aug 22 19:31:50 CST 2025, createTimeFrom=null, createTimeTo=null)\"', '127.0.0.1', '2025-08-22 19:31:50', '');
INSERT INTO `t_log` VALUES (1891, 'mrbird', '修改菜单/按钮', 19, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=164, parentId=0, menuName=系统服务, path=/staff, component=PageView, perms=null, icon=link, type=0, orderNum=8.0, createTime=null, modifyTime=Fri Aug 22 19:31:55 CST 2025, createTimeFrom=null, createTimeTo=null)\"', '127.0.0.1', '2025-08-22 19:31:55', '');
INSERT INTO `t_log` VALUES (1892, 'mrbird', '新增菜单/按钮', 11, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=174, parentId=157, menuName=设施保修, path=/user/repair2, component=user/repair2/Repair, perms=null, icon=barcode, type=0, orderNum=2.0, createTime=Fri Aug 22 20:58:06 CST 2025, modifyTime=null, createTimeFrom=null, createTimeTo=null)\"', '127.0.0.1', '2025-08-22 20:58:07', '');
INSERT INTO `t_log` VALUES (1893, 'mrbird', '修改角色', 52, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=75, roleName=业主, remark=, createTime=null, modifyTime=Fri Aug 22 20:58:13 CST 2025, createTimeFrom=null, createTimeTo=null, menuId=157,158,159,160,161,162,163,170,174)\"', '127.0.0.1', '2025-08-22 20:58:13', '');
INSERT INTO `t_log` VALUES (1894, 'mrbird', '修改菜单/按钮', 19, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=174, parentId=157, menuName=设施保修, path=/user/facility, component=user/facility/Facility, perms=null, icon=barcode, type=0, orderNum=2.0, createTime=null, modifyTime=Fri Aug 22 21:00:34 CST 2025, createTimeFrom=null, createTimeTo=null)\"', '127.0.0.1', '2025-08-22 21:00:35', '');
INSERT INTO `t_log` VALUES (1895, 'mrbird', '新增菜单/按钮', 5, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=175, parentId=139, menuName=设施保修, path=/manage/facility, component=manage/facility/Facility, perms=null, icon=schedule, type=0, orderNum=8.0, createTime=Fri Aug 22 21:01:32 CST 2025, modifyTime=null, createTimeFrom=null, createTimeTo=null)\"', '127.0.0.1', '2025-08-22 21:01:32', '');
INSERT INTO `t_log` VALUES (1896, 'mrbird', '新增菜单/按钮', 5, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=176, parentId=0, menuName=设施保修, path=/staff/facility, component=staff/facility/Facility, perms=null, icon=sound, type=0, orderNum=3.0, createTime=Fri Aug 22 21:02:52 CST 2025, modifyTime=null, createTimeFrom=null, createTimeTo=null)\"', '127.0.0.1', '2025-08-22 21:02:53', '');
INSERT INTO `t_log` VALUES (1897, 'mrbird', '修改角色', 65, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=74, roleName=超级管理员, remark=, createTime=null, modifyTime=Fri Aug 22 21:03:00 CST 2025, createTimeFrom=null, createTimeTo=null, menuId=139,140,141,142,143,144,146,145,147,148,149,150,151,152,153,154,155,156,171,172,173,175)\"', '127.0.0.1', '2025-08-22 21:03:01', '');
INSERT INTO `t_log` VALUES (1898, 'mrbird', '修改菜单/按钮', 8, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=176, parentId=164, menuName=设施保修, path=/staff/facility, component=staff/facility/Facility, perms=null, icon=sound, type=0, orderNum=3.0, createTime=null, modifyTime=Fri Aug 22 21:03:20 CST 2025, createTimeFrom=null, createTimeTo=null)\"', '127.0.0.1', '2025-08-22 21:03:20', '');
INSERT INTO `t_log` VALUES (1899, 'mrbird', '修改角色', 31, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=76, roleName=维修工, remark=, createTime=null, modifyTime=Fri Aug 22 21:03:26 CST 2025, createTimeFrom=null, createTimeTo=null, menuId=164,165,166,167,168,169,176)\"', '127.0.0.1', '2025-08-22 21:03:26', '');

-- ----------------------------
-- Table structure for t_login_log
-- ----------------------------
DROP TABLE IF EXISTS `t_login_log`;
CREATE TABLE `t_login_log`  (
  `USERNAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `LOGIN_TIME` datetime NOT NULL COMMENT '登录时间',
  `LOCATION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录地点',
  `IP` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP地址'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_login_log
-- ----------------------------
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-12 03:18:33', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-10 03:18:33', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-09 03:18:33', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-11 03:18:33', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-12 04:23:45', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-15 03:31:18', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-15 03:36:28', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-15 06:05:36', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-15 08:44:39', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-15 09:02:42', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('scott', '2019-01-15 09:24:21', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('scott', '2019-01-15 09:25:16', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-15 10:14:20', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('scott', '2019-01-15 10:48:59', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-14 11:02:04', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('scott', '2019-01-13 11:02:04', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-15 11:02:04', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-16 01:20:24', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-16 02:25:47', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-16 03:25:11', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-16 03:44:23', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-16 05:44:05', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-16 05:51:12', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('scott', '2019-01-16 05:51:21', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-16 05:54:03', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-16 06:18:57', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-16 06:31:19', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-16 07:32:02', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-17 01:10:42', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-17 02:21:12', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-17 06:07:00', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-17 06:45:24', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-17 06:46:40', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-17 06:54:23', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-17 06:54:53', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-17 06:55:38', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-17 07:38:37', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-17 07:39:14', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-17 07:40:48', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-17 07:41:41', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('scott', '2019-01-17 07:42:53', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('scott', '2019-01-17 07:43:39', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-17 08:13:29', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-17 08:39:56', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-17 09:26:19', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-17 09:26:58', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-17 09:30:15', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbirdd', '2019-01-17 10:31:40', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('jack', '2019-01-17 10:41:14', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('abcd', '2019-01-17 10:47:48', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('abcd', '2019-01-17 10:48:06', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('abcd', '2019-01-17 10:48:44', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('abcd', '2019-01-17 10:51:35', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('wuyouzhugu', '2019-01-17 10:54:56', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-17 10:56:53', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-17 10:59:15', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-17 10:59:53', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-17 11:01:54', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-17 11:08:43', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-17 11:12:55', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-17 11:13:21', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-18 00:56:15', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-18 01:21:54', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-18 01:33:06', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-18 02:03:32', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-18 02:27:12', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-18 02:36:26', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-18 02:41:49', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-18 02:53:12', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-18 02:56:00', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-18 03:00:35', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-18 05:36:02', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-18 05:57:39', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-18 06:50:27', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-18 07:09:37', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-18 08:57:02', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-18 09:00:06', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-19 01:13:17', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-19 01:14:42', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-19 01:50:38', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-19 02:05:44', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-19 02:06:52', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-19 02:11:47', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-19 02:12:13', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-19 02:12:27', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-19 02:33:21', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-19 02:40:19', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-21 03:05:20', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-21 03:16:03', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-21 05:43:32', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-21 05:44:20', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-21 06:47:04', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-21 06:49:51', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-21 07:48:30', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-21 07:50:34', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-21 07:55:22', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-21 07:57:39', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-21 08:35:07', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-21 08:58:37', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-21 11:05:26', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-22 00:47:44', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-22 01:02:23', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-22 01:38:19', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-22 02:39:18', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-22 05:39:47', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-22 05:44:25', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-22 06:04:18', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-22 06:04:34', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-22 06:13:00', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-22 06:13:17', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('scott', '2019-01-22 06:13:43', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('scott', '2019-01-22 06:14:41', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('scott', '2019-01-22 06:15:10', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('hello', '2019-01-22 06:15:48', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('hello', '2019-01-22 06:17:19', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('hello', '2019-01-22 06:18:39', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-22 06:19:03', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-22 06:20:48', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-22 07:04:26', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-22 07:06:07', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-22 07:06:57', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-22 08:37:28', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-22 10:29:50', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-23 00:50:47', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-23 01:51:42', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-23 02:58:49', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-23 06:11:14', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('scott', '2019-01-23 06:46:30', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-23 06:48:25', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('scott', '2019-01-23 06:51:20', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-23 07:30:25', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('scott', '2019-01-23 07:34:28', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('jack', '2019-01-23 07:35:56', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-23 07:36:46', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-24 01:30:13', '中国|华东|福建省|福州市|联通', '218.104.237.213');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-24 01:42:03', '中国|华东|福建省|福州市|联通', '218.104.237.213');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-24 01:48:10', '中国|华东|福建省|福州市|联通', '218.104.237.213');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-24 01:50:12', '中国|华东|福建省|福州市|联通', '218.104.237.213');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-24 01:50:28', '中国|华东|福建省|福州市|联通', '218.104.237.213');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-24 02:57:48', '中国|华东|福建省|福州市|联通', '218.104.237.213');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-24 03:02:53', '中国|华东|福建省|福州市|联通', '218.104.237.213');
INSERT INTO `t_login_log` VALUES ('scott', '2019-01-24 03:14:51', '中国|华东|福建省|厦门市|电信', '120.36.172.239');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-24 03:41:10', '中国|华东|福建省|福州市|联通', '218.104.237.213');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-24 05:38:30', '中国|华东|福建省|福州市|联通', '218.104.237.213');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-24 08:50:44', '中国|华东|福建省|福州市|联通', '218.104.237.213');
INSERT INTO `t_login_log` VALUES ('jack', '2019-01-24 08:52:03', '中国|华东|福建省|福州市|联通', '218.104.237.213');
INSERT INTO `t_login_log` VALUES ('scott', '2019-01-24 08:52:31', '中国|华东|福建省|福州市|联通', '218.104.237.213');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-24 11:12:33', '中国|华东|福建省|福州市|联通', '218.104.237.213');
INSERT INTO `t_login_log` VALUES ('scott', '2019-01-24 11:24:04', '中国|华东|福建省|福州市|联通', '218.104.237.213');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-24 11:47:56', '中国|华东|福建省|福州市|电信', '27.155.195.27');
INSERT INTO `t_login_log` VALUES ('scott', '2019-01-24 11:48:28', '中国|华东|福建省|福州市|电信', '27.155.195.27');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-28 01:53:06', '中国|华东|福建省|福州市|联通', '218.104.237.213');
INSERT INTO `t_login_log` VALUES ('mrbird', '2019-01-28 01:53:58', '中国|华东|福建省|福州市|联通', '218.104.237.213');
INSERT INTO `t_login_log` VALUES ('scott', '2019-01-28 01:54:09', '中国|华东|福建省|福州市|联通', '218.104.237.213');
INSERT INTO `t_login_log` VALUES ('mrbird', '2025-03-30 18:43:16', '', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('admin', '2025-03-30 18:57:17', '', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2025-03-31 23:10:40', '', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('admin', '2025-04-01 07:54:23', '', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2025-04-01 07:54:33', '', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('admin', '2025-04-01 07:56:26', '', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('fank', '2025-04-01 08:23:26', '', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('admin', '2025-04-01 23:22:14', '', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('fank', '2025-04-01 23:50:29', '', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('fank', '2025-04-02 07:59:52', '', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('fank', '2025-04-02 17:59:48', '', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('fank', '2025-04-02 19:59:11', '', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('admin', '2025-04-12 18:09:07', '', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('fank', '2025-04-12 18:47:32', '', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2025-04-12 18:54:49', '', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('fank', '2025-04-12 18:58:38', '', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2025-04-12 19:00:00', '', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('admin', '2025-04-12 19:03:09', '', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('fank', '2025-04-12 19:27:58', '', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('fank', '2025-04-12 20:31:04', '', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('fank', '2025-04-12 22:41:33', '', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('fank', '2025-04-12 23:42:59', '', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('admin', '2025-04-12 23:44:33', '', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('admin', '2025-04-13 00:47:32', '', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('fank', '2025-04-13 00:47:55', '', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('fank', '2025-04-13 00:48:15', '', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('fank', '2025-04-13 00:48:28', '', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('admin', '2025-04-13 01:12:50', '', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('fank', '2025-04-13 01:17:08', '', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('admin', '2025-04-13 01:19:43', '', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2025-04-13 01:21:49', '', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('admin', '2025-04-13 01:30:14', '', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2025-04-13 01:31:05', '', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('fkkk', '2025-04-13 01:31:56', '', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('fkkk', '2025-04-13 01:45:26', '', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('admin', '2025-04-13 01:45:32', '', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('admin', '2025-04-13 01:51:41', '', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('fkkk', '2025-04-13 01:51:53', '', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('admin', '2025-04-13 02:34:17', '', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('fkkk', '2025-04-13 02:53:16', '', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('admin', '2025-04-13 03:01:00', '', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('admin', '2025-04-13 03:04:40', '', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('fank', '2025-04-13 03:04:46', '', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('admin', '2025-04-13 03:23:30', '', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('fank', '2025-04-13 03:30:02', '', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('fank', '2025-04-13 09:23:27', '', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('fkkk', '2025-04-13 10:08:24', '', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('admin', '2025-04-13 10:08:43', '', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('顶针一号', '2025-04-13 10:52:38', '', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('admin', '2025-04-13 10:52:53', '', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('张三', '2025-04-13 10:55:09', '', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('admin', '2025-08-09 21:05:19', '', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('fank', '2025-08-09 21:09:04', '', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('fkkk', '2025-08-09 21:10:21', '', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('fank', '2025-08-21 21:09:26', '', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('admin', '2025-08-21 21:11:53', '', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2025-08-21 21:12:22', '', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('admin', '2025-08-21 21:18:04', '', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('fank', '2025-08-21 21:36:12', '', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('fank', '2025-08-22 19:29:35', '', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2025-08-22 19:31:09', '', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('admin', '2025-08-22 19:33:05', '', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('顶针一号', '2025-08-22 19:35:14', '', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('fank', '2025-08-22 19:39:15', '', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('admin', '2025-08-22 20:02:26', '', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('顶针一号', '2025-08-22 20:10:45', '', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2025-08-22 20:56:15', '', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('fank', '2025-08-22 21:03:32', '', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('fank', '2025-08-23 13:43:31', '', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('admin', '2025-08-23 17:36:54', '', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('顶针一号', '2025-08-23 17:53:33', '', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('mrbird', '2025-08-23 18:08:13', '', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('admin', '2025-08-23 18:09:14', '', '127.0.0.1');

-- ----------------------------
-- Table structure for t_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu`  (
  `MENU_ID` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单/按钮ID',
  `PARENT_ID` bigint NOT NULL COMMENT '上级菜单ID',
  `MENU_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单/按钮名称',
  `PATH` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对应路由path',
  `COMPONENT` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对应路由组件component',
  `PERMS` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `ICON` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `TYPE` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型 0菜单 1按钮',
  `ORDER_NUM` double(20, 0) NULL DEFAULT NULL COMMENT '排序',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `MODIFY_TIME` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`MENU_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 177 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_menu
-- ----------------------------
INSERT INTO `t_menu` VALUES (1, 0, '系统管理', '/system', 'PageView', NULL, 'appstore-o', '0', 1, '2017-12-27 16:39:07', '2019-01-05 11:13:14');
INSERT INTO `t_menu` VALUES (2, 0, '系统监控', '/monitor', 'PageView', NULL, 'dashboard', '0', 2, '2017-12-27 16:45:51', '2019-01-23 06:27:12');
INSERT INTO `t_menu` VALUES (3, 1, '用户管理', '/system/user', 'system/user/User', 'user:view', '', '0', 1, '2017-12-27 16:47:13', '2019-01-22 06:45:55');
INSERT INTO `t_menu` VALUES (4, 1, '角色管理', '/system/role', 'system/role/Role', 'role:view', '', '0', 2, '2017-12-27 16:48:09', '2018-04-25 09:01:12');
INSERT INTO `t_menu` VALUES (5, 1, '菜单管理', '/system/menu', 'system/menu/Menu', 'menu:view', '', '0', 3, '2017-12-27 16:48:57', '2018-04-25 09:01:30');
INSERT INTO `t_menu` VALUES (6, 1, '部门管理', '/system/dept', 'system/dept/Dept', 'dept:view', '', '0', 4, '2017-12-27 16:57:33', '2018-04-25 09:01:40');
INSERT INTO `t_menu` VALUES (8, 2, '在线用户', '/monitor/online', 'monitor/Online', 'user:online', '', '0', 1, '2017-12-27 16:59:33', '2018-04-25 09:02:04');
INSERT INTO `t_menu` VALUES (10, 2, '系统日志', '/monitor/systemlog', 'monitor/SystemLog', 'log:view', '', '0', 2, '2017-12-27 17:00:50', '2018-04-25 09:02:18');
INSERT INTO `t_menu` VALUES (11, 3, '新增用户', '', '', 'user:add', NULL, '1', NULL, '2017-12-27 17:02:58', NULL);
INSERT INTO `t_menu` VALUES (12, 3, '修改用户', '', '', 'user:update', NULL, '1', NULL, '2017-12-27 17:04:07', NULL);
INSERT INTO `t_menu` VALUES (13, 3, '删除用户', '', '', 'user:delete', NULL, '1', NULL, '2017-12-27 17:04:58', NULL);
INSERT INTO `t_menu` VALUES (14, 4, '新增角色', '', '', 'role:add', NULL, '1', NULL, '2017-12-27 17:06:38', NULL);
INSERT INTO `t_menu` VALUES (15, 4, '修改角色', '', '', 'role:update', NULL, '1', NULL, '2017-12-27 17:06:38', NULL);
INSERT INTO `t_menu` VALUES (16, 4, '删除角色', '', '', 'role:delete', NULL, '1', NULL, '2017-12-27 17:06:38', NULL);
INSERT INTO `t_menu` VALUES (17, 5, '新增菜单', '', '', 'menu:add', NULL, '1', NULL, '2017-12-27 17:08:02', NULL);
INSERT INTO `t_menu` VALUES (18, 5, '修改菜单', '', '', 'menu:update', NULL, '1', NULL, '2017-12-27 17:08:02', NULL);
INSERT INTO `t_menu` VALUES (19, 5, '删除菜单', '', '', 'menu:delete', NULL, '1', NULL, '2017-12-27 17:08:02', NULL);
INSERT INTO `t_menu` VALUES (20, 6, '新增部门', '', '', 'dept:add', NULL, '1', NULL, '2017-12-27 17:09:24', NULL);
INSERT INTO `t_menu` VALUES (21, 6, '修改部门', '', '', 'dept:update', NULL, '1', NULL, '2017-12-27 17:09:24', NULL);
INSERT INTO `t_menu` VALUES (22, 6, '删除部门', '', '', 'dept:delete', NULL, '1', NULL, '2017-12-27 17:09:24', NULL);
INSERT INTO `t_menu` VALUES (23, 8, '踢出用户', '', '', 'user:kickout', NULL, '1', NULL, '2017-12-27 17:11:13', NULL);
INSERT INTO `t_menu` VALUES (24, 10, '删除日志', '', '', 'log:delete', NULL, '1', NULL, '2017-12-27 17:11:45', NULL);
INSERT INTO `t_menu` VALUES (58, 0, '网络资源', '/web', 'PageView', NULL, 'compass', '0', 4, '2018-01-12 15:28:48', '2018-01-22 19:49:26');
INSERT INTO `t_menu` VALUES (59, 58, '天气查询', '/web/weather', 'web/Weather', 'weather:view', '', '0', 1, '2018-01-12 15:40:02', '2019-01-22 05:43:19');
INSERT INTO `t_menu` VALUES (61, 58, '每日一文', '/web/dailyArticle', 'web/DailyArticle', 'article:view', '', '0', 2, '2018-01-15 17:17:14', '2019-01-22 05:43:27');
INSERT INTO `t_menu` VALUES (64, 1, '字典管理', '/system/dict', 'system/dict/Dict', 'dict:view', '', '0', 5, '2018-01-18 10:38:25', '2018-04-25 09:01:50');
INSERT INTO `t_menu` VALUES (65, 64, '新增字典', '', '', 'dict:add', NULL, '1', NULL, '2018-01-18 19:10:08', NULL);
INSERT INTO `t_menu` VALUES (66, 64, '修改字典', '', '', 'dict:update', NULL, '1', NULL, '2018-01-18 19:10:27', NULL);
INSERT INTO `t_menu` VALUES (67, 64, '删除字典', '', '', 'dict:delete', NULL, '1', NULL, '2018-01-18 19:10:47', NULL);
INSERT INTO `t_menu` VALUES (81, 58, '影视资讯', '/web/movie', 'EmptyPageView', NULL, NULL, '0', 3, '2018-01-22 14:12:59', '2019-01-22 05:43:35');
INSERT INTO `t_menu` VALUES (82, 81, '正在热映', '/web/movie/hot', 'web/MovieHot', 'movie:hot', '', '0', 1, '2018-01-22 14:13:47', '2019-01-22 05:43:52');
INSERT INTO `t_menu` VALUES (83, 81, '即将上映', '/web/movie/coming', 'web/MovieComing', 'movie:coming', '', '0', 2, '2018-01-22 14:14:36', '2019-01-22 05:43:58');
INSERT INTO `t_menu` VALUES (101, 0, '任务调度', '/job', 'PageView', NULL, 'clock-circle-o', '0', 3, '2018-01-11 15:52:57', NULL);
INSERT INTO `t_menu` VALUES (102, 101, '定时任务', '/job/job', 'quartz/job/Job', 'job:view', '', '0', 1, '2018-02-24 15:53:53', '2019-01-22 05:42:50');
INSERT INTO `t_menu` VALUES (103, 102, '新增任务', '', '', 'job:add', NULL, '1', NULL, '2018-02-24 15:55:10', NULL);
INSERT INTO `t_menu` VALUES (104, 102, '修改任务', '', '', 'job:update', NULL, '1', NULL, '2018-02-24 15:55:53', NULL);
INSERT INTO `t_menu` VALUES (105, 102, '删除任务', '', '', 'job:delete', NULL, '1', NULL, '2018-02-24 15:56:18', NULL);
INSERT INTO `t_menu` VALUES (106, 102, '暂停任务', '', '', 'job:pause', NULL, '1', NULL, '2018-02-24 15:57:08', NULL);
INSERT INTO `t_menu` VALUES (107, 102, '恢复任务', '', '', 'job:resume', NULL, '1', NULL, '2018-02-24 15:58:21', NULL);
INSERT INTO `t_menu` VALUES (108, 102, '立即执行任务', '', '', 'job:run', NULL, '1', NULL, '2018-02-24 15:59:45', NULL);
INSERT INTO `t_menu` VALUES (109, 101, '调度日志', '/job/log', 'quartz/log/JobLog', 'jobLog:view', '', '0', 2, '2018-02-24 16:00:45', '2019-01-22 05:42:59');
INSERT INTO `t_menu` VALUES (110, 109, '删除日志', '', '', 'jobLog:delete', NULL, '1', NULL, '2018-02-24 16:01:21', NULL);
INSERT INTO `t_menu` VALUES (113, 2, 'Redis监控', '/monitor/redis/info', 'monitor/RedisInfo', 'redis:view', '', '0', 3, '2018-06-28 14:29:42', NULL);
INSERT INTO `t_menu` VALUES (121, 2, '请求追踪', '/monitor/httptrace', 'monitor/Httptrace', NULL, NULL, '0', 4, '2019-01-18 02:30:29', NULL);
INSERT INTO `t_menu` VALUES (122, 2, '系统信息', '/monitor/system', 'EmptyPageView', NULL, NULL, '0', 5, '2019-01-18 02:31:48', '2019-01-18 02:39:46');
INSERT INTO `t_menu` VALUES (123, 122, 'Tomcat信息', '/monitor/system/tomcatinfo', 'monitor/TomcatInfo', NULL, NULL, '0', 2, '2019-01-18 02:32:53', '2019-01-18 02:46:57');
INSERT INTO `t_menu` VALUES (124, 122, 'JVM信息', '/monitor/system/jvminfo', 'monitor/JvmInfo', NULL, NULL, '0', 1, '2019-01-18 02:33:30', '2019-01-18 02:46:51');
INSERT INTO `t_menu` VALUES (127, 122, '服务器信息', '/monitor/system/info', 'monitor/SystemInfo', NULL, NULL, '0', 3, '2019-01-21 07:53:43', '2019-01-21 07:57:00');
INSERT INTO `t_menu` VALUES (128, 0, '其他模块', '/others', 'PageView', NULL, 'coffee', '0', 5, '2019-01-22 06:49:59', '2019-01-22 06:50:13');
INSERT INTO `t_menu` VALUES (129, 128, '导入导出', '/others/excel', 'others/Excel', NULL, NULL, '0', 1, '2019-01-22 06:51:36', '2019-01-22 07:06:45');
INSERT INTO `t_menu` VALUES (130, 3, '导出Excel', NULL, NULL, 'user:export', NULL, '1', NULL, '2019-01-23 06:35:16', NULL);
INSERT INTO `t_menu` VALUES (131, 4, '导出Excel', NULL, NULL, 'role:export', NULL, '1', NULL, '2019-01-23 06:35:36', NULL);
INSERT INTO `t_menu` VALUES (132, 5, '导出Excel', NULL, NULL, 'menu:export', NULL, '1', NULL, '2019-01-23 06:36:05', NULL);
INSERT INTO `t_menu` VALUES (133, 6, '导出Excel', NULL, NULL, 'dept:export', NULL, '1', NULL, '2019-01-23 06:36:25', NULL);
INSERT INTO `t_menu` VALUES (134, 64, '导出Excel', NULL, NULL, 'dict:export', NULL, '1', NULL, '2019-01-23 06:36:43', NULL);
INSERT INTO `t_menu` VALUES (135, 3, '密码重置', NULL, NULL, 'user:reset', NULL, '1', NULL, '2019-01-23 06:37:00', NULL);
INSERT INTO `t_menu` VALUES (136, 10, '导出Excel', NULL, NULL, 'log:export', NULL, '1', NULL, '2019-01-23 06:37:27', NULL);
INSERT INTO `t_menu` VALUES (137, 102, '导出Excel', NULL, NULL, 'job:export', NULL, '1', NULL, '2019-01-23 06:37:59', NULL);
INSERT INTO `t_menu` VALUES (138, 109, '导出Excel', NULL, NULL, 'jobLog:export', NULL, '1', NULL, '2019-01-23 06:38:32', NULL);
INSERT INTO `t_menu` VALUES (139, 0, '系统管理', '/manage', 'PageView', NULL, 'appstore', '0', 6, '2025-03-30 18:44:05', NULL);
INSERT INTO `t_menu` VALUES (140, 139, '楼宇管理', '/manage/building', 'manage/building/Building', NULL, 'file-word', '0', 1, '2025-03-30 18:44:45', NULL);
INSERT INTO `t_menu` VALUES (141, 139, '公告管理', '/manage/bulletin', 'manage/bulletin/Bulletin', NULL, 'solution', '0', 2, '2025-03-30 18:47:00', NULL);
INSERT INTO `t_menu` VALUES (145, 139, '房屋管理', '/manage/houses', 'manage/houses/Houses', NULL, 'usb', '0', 6, '2025-03-30 18:51:04', NULL);
INSERT INTO `t_menu` VALUES (146, 139, '维修工单', '/manage/repair', 'manage/repair/Repair', NULL, 'tool', '0', 7, '2025-03-30 18:51:50', NULL);
INSERT INTO `t_menu` VALUES (147, 139, '设施检查', '/manage/inspection', 'manage/inspection/Inspection', NULL, 'fork', '0', 8, '2025-03-30 18:52:42', NULL);
INSERT INTO `t_menu` VALUES (148, 139, '业主管理', '/manage/owner', 'manage/owner/Owner', NULL, 'team', '0', 9, '2025-03-30 18:53:14', NULL);
INSERT INTO `t_menu` VALUES (154, 139, '员工管理', '/manage/worker', 'manage/worker/Worker', NULL, 'deployment-unit', '0', 15, '2025-03-30 18:56:33', NULL);
INSERT INTO `t_menu` VALUES (155, 139, '投诉管理', '/manage/complaint', 'manage/complaint/Complaint', NULL, 'filter', '0', 2, '2025-03-31 23:16:22', NULL);
INSERT INTO `t_menu` VALUES (156, 139, '工单评价', '/manage/evaluate', 'manage/evaluate/Evaluate', NULL, 'phone', '0', 2, '2025-03-31 23:16:54', NULL);
INSERT INTO `t_menu` VALUES (157, 0, '系统服务', '/user', 'PageView', NULL, 'pushpin', '0', 7, '2025-03-31 23:18:12', '2025-08-22 19:31:50');
INSERT INTO `t_menu` VALUES (158, 157, '我的房屋', '/user/houses', 'user/houses/Houses', NULL, 'copyright', '0', 1, '2025-03-31 23:18:47', NULL);
INSERT INTO `t_menu` VALUES (159, 157, '维修工单', '/user/repair', 'user/repair/Repair', NULL, 'layout', '0', 2, '2025-03-31 23:19:33', NULL);
INSERT INTO `t_menu` VALUES (160, 157, '工单评价', '/user/evaluate', 'user/evaluate/Evaluate', NULL, 'printer', '0', 3, '2025-03-31 23:20:08', NULL);
INSERT INTO `t_menu` VALUES (161, 157, '投诉记录', '/user/complaint', 'user/complaint/Complaint', NULL, 'select', '0', 4, '2025-03-31 23:20:39', NULL);
INSERT INTO `t_menu` VALUES (162, 157, '支付成功', '/user/pay', 'user/pay/Pay', NULL, 'fire', '0', 5, '2025-03-31 23:21:18', NULL);
INSERT INTO `t_menu` VALUES (163, 157, '业主信息', '/user/personal', 'user/personal/Personal', NULL, 'user', '0', 1, '2025-03-31 23:23:34', NULL);
INSERT INTO `t_menu` VALUES (164, 0, '系统服务', '/staff', 'PageView', NULL, 'link', '0', 8, '2025-03-31 23:25:21', '2025-08-22 19:31:55');
INSERT INTO `t_menu` VALUES (165, 164, '个人信息', '/staff/personal', 'staff/personal/Personal', NULL, 'user', '0', 1, '2025-03-31 23:27:04', NULL);
INSERT INTO `t_menu` VALUES (166, 164, '投诉记录', '/staff/complaint', 'staff/complaint/Complaint', NULL, 'solution', '0', 2, '2025-03-31 23:27:35', '2025-03-31 23:27:42');
INSERT INTO `t_menu` VALUES (167, 164, '工单评价', '/staff/evaluate', 'staff/evaluate/Evaluate', NULL, 'like', '0', 3, '2025-03-31 23:28:08', NULL);
INSERT INTO `t_menu` VALUES (168, 164, '我的工单', '/staff/repair', 'staff/repair/Repair', NULL, 'exception', '0', 4, '2025-03-31 23:28:43', NULL);
INSERT INTO `t_menu` VALUES (169, 164, '设施巡检', '/staff/inspection', 'staff/inspection/Inspection', NULL, 'build', '0', 5, '2025-03-31 23:29:10', NULL);
INSERT INTO `t_menu` VALUES (170, 157, '房屋看板', '/user/dashboard', 'user/dashboard/Houses', NULL, 'laptop', '0', 0, '2025-04-12 18:57:46', '2025-04-12 18:58:20');
INSERT INTO `t_menu` VALUES (174, 157, '设施保修', '/user/facility', 'user/facility/Facility', NULL, 'barcode', '0', 2, '2025-08-22 20:58:07', '2025-08-22 21:00:35');
INSERT INTO `t_menu` VALUES (175, 139, '设施保修', '/manage/facility', 'manage/facility/Facility', NULL, 'schedule', '0', 8, '2025-08-22 21:01:32', NULL);
INSERT INTO `t_menu` VALUES (176, 164, '设施保修', '/staff/facility', 'staff/facility/Facility', NULL, 'sound', '0', 3, '2025-08-22 21:02:53', '2025-08-22 21:03:20');

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role`  (
  `ROLE_ID` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `ROLE_NAME` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `REMARK` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色描述',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `MODIFY_TIME` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`ROLE_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 77 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES (1, '管理员', '管理员', '2017-12-27 16:23:11', '2019-01-23 06:45:29');
INSERT INTO `t_role` VALUES (2, '注册用户', '可查看，新增，导出', '2019-01-04 14:11:28', '2019-01-23 07:37:08');
INSERT INTO `t_role` VALUES (72, '普通用户', '只可查看，好可怜哦', '2019-01-23 07:33:20', NULL);
INSERT INTO `t_role` VALUES (74, '超级管理员', '', '2025-03-30 18:56:59', '2025-08-22 21:03:01');
INSERT INTO `t_role` VALUES (75, '业主', '', '2025-03-31 23:22:12', '2025-08-22 20:58:13');
INSERT INTO `t_role` VALUES (76, '维修工', '', '2025-03-31 23:29:26', '2025-08-22 21:03:26');

-- ----------------------------
-- Table structure for t_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_role_menu`;
CREATE TABLE `t_role_menu`  (
  `ROLE_ID` bigint NOT NULL,
  `MENU_ID` bigint NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_role_menu
-- ----------------------------
INSERT INTO `t_role_menu` VALUES (1, 1);
INSERT INTO `t_role_menu` VALUES (1, 3);
INSERT INTO `t_role_menu` VALUES (1, 11);
INSERT INTO `t_role_menu` VALUES (1, 12);
INSERT INTO `t_role_menu` VALUES (1, 13);
INSERT INTO `t_role_menu` VALUES (1, 4);
INSERT INTO `t_role_menu` VALUES (1, 14);
INSERT INTO `t_role_menu` VALUES (1, 15);
INSERT INTO `t_role_menu` VALUES (1, 16);
INSERT INTO `t_role_menu` VALUES (1, 5);
INSERT INTO `t_role_menu` VALUES (1, 17);
INSERT INTO `t_role_menu` VALUES (1, 18);
INSERT INTO `t_role_menu` VALUES (1, 19);
INSERT INTO `t_role_menu` VALUES (1, 6);
INSERT INTO `t_role_menu` VALUES (1, 20);
INSERT INTO `t_role_menu` VALUES (1, 21);
INSERT INTO `t_role_menu` VALUES (1, 22);
INSERT INTO `t_role_menu` VALUES (1, 64);
INSERT INTO `t_role_menu` VALUES (1, 65);
INSERT INTO `t_role_menu` VALUES (1, 66);
INSERT INTO `t_role_menu` VALUES (1, 67);
INSERT INTO `t_role_menu` VALUES (1, 2);
INSERT INTO `t_role_menu` VALUES (1, 8);
INSERT INTO `t_role_menu` VALUES (1, 23);
INSERT INTO `t_role_menu` VALUES (1, 10);
INSERT INTO `t_role_menu` VALUES (1, 24);
INSERT INTO `t_role_menu` VALUES (1, 113);
INSERT INTO `t_role_menu` VALUES (1, 121);
INSERT INTO `t_role_menu` VALUES (1, 122);
INSERT INTO `t_role_menu` VALUES (1, 124);
INSERT INTO `t_role_menu` VALUES (1, 123);
INSERT INTO `t_role_menu` VALUES (1, 125);
INSERT INTO `t_role_menu` VALUES (1, 101);
INSERT INTO `t_role_menu` VALUES (1, 102);
INSERT INTO `t_role_menu` VALUES (1, 103);
INSERT INTO `t_role_menu` VALUES (1, 104);
INSERT INTO `t_role_menu` VALUES (1, 105);
INSERT INTO `t_role_menu` VALUES (1, 106);
INSERT INTO `t_role_menu` VALUES (1, 107);
INSERT INTO `t_role_menu` VALUES (1, 108);
INSERT INTO `t_role_menu` VALUES (1, 109);
INSERT INTO `t_role_menu` VALUES (1, 110);
INSERT INTO `t_role_menu` VALUES (1, 58);
INSERT INTO `t_role_menu` VALUES (1, 59);
INSERT INTO `t_role_menu` VALUES (1, 61);
INSERT INTO `t_role_menu` VALUES (1, 81);
INSERT INTO `t_role_menu` VALUES (1, 82);
INSERT INTO `t_role_menu` VALUES (1, 83);
INSERT INTO `t_role_menu` VALUES (1, 127);
INSERT INTO `t_role_menu` VALUES (1, 128);
INSERT INTO `t_role_menu` VALUES (1, 129);
INSERT INTO `t_role_menu` VALUES (1, 130);
INSERT INTO `t_role_menu` VALUES (1, 135);
INSERT INTO `t_role_menu` VALUES (1, 131);
INSERT INTO `t_role_menu` VALUES (1, 132);
INSERT INTO `t_role_menu` VALUES (1, 133);
INSERT INTO `t_role_menu` VALUES (1, 134);
INSERT INTO `t_role_menu` VALUES (1, 136);
INSERT INTO `t_role_menu` VALUES (1, 137);
INSERT INTO `t_role_menu` VALUES (1, 138);
INSERT INTO `t_role_menu` VALUES (72, 1);
INSERT INTO `t_role_menu` VALUES (72, 3);
INSERT INTO `t_role_menu` VALUES (72, 4);
INSERT INTO `t_role_menu` VALUES (72, 5);
INSERT INTO `t_role_menu` VALUES (72, 6);
INSERT INTO `t_role_menu` VALUES (72, 64);
INSERT INTO `t_role_menu` VALUES (72, 2);
INSERT INTO `t_role_menu` VALUES (72, 8);
INSERT INTO `t_role_menu` VALUES (72, 10);
INSERT INTO `t_role_menu` VALUES (72, 113);
INSERT INTO `t_role_menu` VALUES (72, 121);
INSERT INTO `t_role_menu` VALUES (72, 122);
INSERT INTO `t_role_menu` VALUES (72, 124);
INSERT INTO `t_role_menu` VALUES (72, 123);
INSERT INTO `t_role_menu` VALUES (72, 127);
INSERT INTO `t_role_menu` VALUES (72, 101);
INSERT INTO `t_role_menu` VALUES (72, 102);
INSERT INTO `t_role_menu` VALUES (72, 109);
INSERT INTO `t_role_menu` VALUES (72, 58);
INSERT INTO `t_role_menu` VALUES (72, 59);
INSERT INTO `t_role_menu` VALUES (72, 61);
INSERT INTO `t_role_menu` VALUES (72, 81);
INSERT INTO `t_role_menu` VALUES (72, 82);
INSERT INTO `t_role_menu` VALUES (72, 83);
INSERT INTO `t_role_menu` VALUES (72, 128);
INSERT INTO `t_role_menu` VALUES (72, 129);
INSERT INTO `t_role_menu` VALUES (2, 3);
INSERT INTO `t_role_menu` VALUES (2, 1);
INSERT INTO `t_role_menu` VALUES (2, 4);
INSERT INTO `t_role_menu` VALUES (2, 5);
INSERT INTO `t_role_menu` VALUES (2, 6);
INSERT INTO `t_role_menu` VALUES (2, 64);
INSERT INTO `t_role_menu` VALUES (2, 2);
INSERT INTO `t_role_menu` VALUES (2, 8);
INSERT INTO `t_role_menu` VALUES (2, 10);
INSERT INTO `t_role_menu` VALUES (2, 113);
INSERT INTO `t_role_menu` VALUES (2, 121);
INSERT INTO `t_role_menu` VALUES (2, 122);
INSERT INTO `t_role_menu` VALUES (2, 124);
INSERT INTO `t_role_menu` VALUES (2, 123);
INSERT INTO `t_role_menu` VALUES (2, 125);
INSERT INTO `t_role_menu` VALUES (2, 101);
INSERT INTO `t_role_menu` VALUES (2, 102);
INSERT INTO `t_role_menu` VALUES (2, 109);
INSERT INTO `t_role_menu` VALUES (2, 58);
INSERT INTO `t_role_menu` VALUES (2, 59);
INSERT INTO `t_role_menu` VALUES (2, 61);
INSERT INTO `t_role_menu` VALUES (2, 81);
INSERT INTO `t_role_menu` VALUES (2, 82);
INSERT INTO `t_role_menu` VALUES (2, 83);
INSERT INTO `t_role_menu` VALUES (2, 127);
INSERT INTO `t_role_menu` VALUES (2, 128);
INSERT INTO `t_role_menu` VALUES (2, 129);
INSERT INTO `t_role_menu` VALUES (2, 130);
INSERT INTO `t_role_menu` VALUES (2, 14);
INSERT INTO `t_role_menu` VALUES (2, 17);
INSERT INTO `t_role_menu` VALUES (2, 132);
INSERT INTO `t_role_menu` VALUES (2, 20);
INSERT INTO `t_role_menu` VALUES (2, 133);
INSERT INTO `t_role_menu` VALUES (2, 65);
INSERT INTO `t_role_menu` VALUES (2, 134);
INSERT INTO `t_role_menu` VALUES (2, 136);
INSERT INTO `t_role_menu` VALUES (2, 103);
INSERT INTO `t_role_menu` VALUES (2, 137);
INSERT INTO `t_role_menu` VALUES (2, 138);
INSERT INTO `t_role_menu` VALUES (2, 131);
INSERT INTO `t_role_menu` VALUES (75, 157);
INSERT INTO `t_role_menu` VALUES (75, 158);
INSERT INTO `t_role_menu` VALUES (75, 159);
INSERT INTO `t_role_menu` VALUES (75, 160);
INSERT INTO `t_role_menu` VALUES (75, 161);
INSERT INTO `t_role_menu` VALUES (75, 162);
INSERT INTO `t_role_menu` VALUES (75, 163);
INSERT INTO `t_role_menu` VALUES (75, 170);
INSERT INTO `t_role_menu` VALUES (75, 174);
INSERT INTO `t_role_menu` VALUES (74, 139);
INSERT INTO `t_role_menu` VALUES (74, 140);
INSERT INTO `t_role_menu` VALUES (74, 141);
INSERT INTO `t_role_menu` VALUES (74, 142);
INSERT INTO `t_role_menu` VALUES (74, 143);
INSERT INTO `t_role_menu` VALUES (74, 144);
INSERT INTO `t_role_menu` VALUES (74, 146);
INSERT INTO `t_role_menu` VALUES (74, 145);
INSERT INTO `t_role_menu` VALUES (74, 147);
INSERT INTO `t_role_menu` VALUES (74, 148);
INSERT INTO `t_role_menu` VALUES (74, 149);
INSERT INTO `t_role_menu` VALUES (74, 150);
INSERT INTO `t_role_menu` VALUES (74, 151);
INSERT INTO `t_role_menu` VALUES (74, 152);
INSERT INTO `t_role_menu` VALUES (74, 153);
INSERT INTO `t_role_menu` VALUES (74, 154);
INSERT INTO `t_role_menu` VALUES (74, 155);
INSERT INTO `t_role_menu` VALUES (74, 156);
INSERT INTO `t_role_menu` VALUES (74, 171);
INSERT INTO `t_role_menu` VALUES (74, 172);
INSERT INTO `t_role_menu` VALUES (74, 173);
INSERT INTO `t_role_menu` VALUES (74, 175);
INSERT INTO `t_role_menu` VALUES (76, 164);
INSERT INTO `t_role_menu` VALUES (76, 165);
INSERT INTO `t_role_menu` VALUES (76, 166);
INSERT INTO `t_role_menu` VALUES (76, 167);
INSERT INTO `t_role_menu` VALUES (76, 168);
INSERT INTO `t_role_menu` VALUES (76, 169);
INSERT INTO `t_role_menu` VALUES (76, 176);

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `USER_ID` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `USERNAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `PASSWORD` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `DEPT_ID` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `EMAIL` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `MOBILE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `STATUS` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态 0锁定 1有效',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `MODIFY_TIME` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `LAST_LOGIN_TIME` datetime NULL DEFAULT NULL COMMENT '最近访问时间',
  `SSEX` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别 0男 1女 2保密',
  `DESCRIPTION` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `AVATAR` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户头像',
  PRIMARY KEY (`USER_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, 'mrbird', '94f860c4bbfeb2f49c84e321fdda4b07', 1, 'mrbird123@hotmail.com', '13455533233', '1', '2017-12-27 15:47:19', '2019-01-17 02:34:19', '2025-08-23 18:08:13', '2', '我是帅比作者。', 'ubnKSIfAJTxIgXOKlciN.png');
INSERT INTO `t_user` VALUES (2, 'scott', '7b44a5363e3fd52435beb472e1d2b91f', 6, 'scott@qq.com', '15134627380', '1', '2017-12-29 16:16:39', '2019-01-18 00:59:09', '2019-01-28 01:54:09', '0', '我是scott，嗯嗯', 'jZUIxmJycoymBprLOUbT.png');
INSERT INTO `t_user` VALUES (12, 'jack', '552649f10640385d0728a80a4242893e', 6, 'jack@hotmail.com', NULL, '1', '2019-01-23 07:34:05', '2019-01-24 03:08:01', '2019-01-24 08:52:03', '0', NULL, 'default.jpg');
INSERT INTO `t_user` VALUES (13, 'admin', '3ee4a28b103216fa2d140d1979297910', NULL, NULL, NULL, '1', '2025-03-30 18:57:11', NULL, '2025-08-23 18:09:14', '2', NULL, 'default.jpg');
INSERT INTO `t_user` VALUES (14, 'fank', '19706f85f729c34626ae29c29d55cac5', NULL, NULL, NULL, '1', '2025-04-01 07:55:20', NULL, '2025-08-23 13:43:31', '2', NULL, 'default.jpg');
INSERT INTO `t_user` VALUES (15, 'fkkk', '5fd41b097acb41c642139202bb04df6e', NULL, NULL, NULL, '1', '2025-04-01 07:55:32', NULL, '2025-08-09 21:10:21', '2', NULL, 'default.jpg');
INSERT INTO `t_user` VALUES (16, '顶针一号', 'b7c0d31287ce525e1838b0598e99a98a', NULL, NULL, NULL, '1', '2025-04-13 10:52:31', NULL, '2025-08-23 17:53:33', '2', '注册用户', 'default.jpg');
INSERT INTO `t_user` VALUES (17, '张三', 'c7c29942e04af6d9ff61b4c8d10cbbd5', NULL, NULL, NULL, '1', '2025-04-13 10:54:12', NULL, '2025-04-13 10:55:09', '2', '注册用户', 'default.jpg');

-- ----------------------------
-- Table structure for t_user_config
-- ----------------------------
DROP TABLE IF EXISTS `t_user_config`;
CREATE TABLE `t_user_config`  (
  `USER_ID` bigint NOT NULL COMMENT '用户ID',
  `THEME` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统主题 dark暗色风格，light明亮风格',
  `LAYOUT` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统布局 side侧边栏，head顶部栏',
  `MULTI_PAGE` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '页面风格 1多标签页 0单页',
  `FIX_SIDERBAR` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '页面滚动是否固定侧边栏 1固定 0不固定',
  `FIX_HEADER` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '页面滚动是否固定顶栏 1固定 0不固定',
  `COLOR` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主题颜色 RGB值',
  PRIMARY KEY (`USER_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_user_config
-- ----------------------------
INSERT INTO `t_user_config` VALUES (1, 'light', 'side', '1', '1', '1', 'rgb(24, 144, 255)');
INSERT INTO `t_user_config` VALUES (2, 'light', 'head', '0', '1', '1', 'rgb(24, 144, 255)');
INSERT INTO `t_user_config` VALUES (12, 'dark', 'side', '1', '1', '1', 'rgb(66, 185, 131)');
INSERT INTO `t_user_config` VALUES (13, 'dark', 'side', '0', '1', '1', 'rgb(66, 185, 131)');
INSERT INTO `t_user_config` VALUES (14, 'light', 'side', '0', '1', '1', 'rgb(66, 185, 131)');
INSERT INTO `t_user_config` VALUES (15, 'light', 'side', '0', '1', '1', 'rgb(66, 185, 131)');
INSERT INTO `t_user_config` VALUES (16, 'light', 'side', '0', '1', '1', 'rgb(66, 185, 131)');
INSERT INTO `t_user_config` VALUES (17, 'light', 'side', '0', '1', '1', 'rgb(66, 185, 131)');

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role`  (
  `USER_ID` bigint NOT NULL COMMENT '用户ID',
  `ROLE_ID` bigint NOT NULL COMMENT '角色ID'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES (1, 1);
INSERT INTO `t_user_role` VALUES (2, 2);
INSERT INTO `t_user_role` VALUES (12, 72);
INSERT INTO `t_user_role` VALUES (13, 74);
INSERT INTO `t_user_role` VALUES (14, 75);
INSERT INTO `t_user_role` VALUES (15, 76);
INSERT INTO `t_user_role` VALUES (16, 76);
INSERT INTO `t_user_role` VALUES (17, 75);

-- ----------------------------
-- Table structure for worker_info
-- ----------------------------
DROP TABLE IF EXISTS `worker_info`;
CREATE TABLE `worker_info`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '姓名',
  `phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系方式',
  `image` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '照片',
  `type` tinyint NULL DEFAULT NULL COMMENT '人员类型 1.物业管理员 2.维修人员 3.抄表员 4.保洁人员',
  `create_date` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `user_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '工作人员管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of worker_info
-- ----------------------------
INSERT INTO `worker_info` VALUES (1, '赵铁柱', '15010399301', 'SA1744477989737.jpg', 2, '2025-03-16 19:16:04', 15);
INSERT INTO `worker_info` VALUES (2, '张狗蛋', '15015001245', 'SA1744478008582.jpg', 2, '2025-03-16 19:28:33', NULL);
INSERT INTO `worker_info` VALUES (3, '肖战', '15010333333', 'SA1647441378576.jpg', 1, '2025-03-16 22:36:19', NULL);
INSERT INTO `worker_info` VALUES (4, '顶针一号', '15010399301', 'SA1744512748067.jpg', 2, '2025-04-13 10:52:30', 16);

SET FOREIGN_KEY_CHECKS = 1;
