/*
 Navicat Premium Data Transfer

 Source Server         : test
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : localhost:3306
 Source Schema         : ssm_pms

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 13/05/2022 13:38:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `d_id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `d_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门名称',
  `d_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `d_isdel` int NULL DEFAULT NULL COMMENT '可用状态，0不可用，1可用',
  PRIMARY KEY (`d_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES (10, '财务部', '组织公司资产资金、成本费用、收入往来、退税纳税等财务核算和财务管理工作', 1);
INSERT INTO `department` VALUES (11, '市场部', '组织市场调查和研究，掌握市场供求信息和行业动态，不定期编制市场动态分析报告，为公司经营决策提供依据。', 1);
INSERT INTO `department` VALUES (13, '行政部', '负责公司日常行政后勤管理、党务及工、青、妇群众团体管理工作。', 1);
INSERT INTO `department` VALUES (14, '人事部', '负责公司人力资源管理与开发。', 1);
INSERT INTO `department` VALUES (16, '开发部', '负责产品设计研发、技术开发等。', 1);
INSERT INTO `department` VALUES (19, '营销部', '产品销售、业务洽谈。', 1);
INSERT INTO `department` VALUES (20, '售后服务部', '负责客户维护、提供产品售后服务。', 1);
INSERT INTO `department` VALUES (21, '设计部', '负责产品设计实现。', 1);
INSERT INTO `department` VALUES (22, '测试维护部', '负责产品测试、检查，维护产品质量。', 1);
INSERT INTO `department` VALUES (26, '总裁部门', '大佬', 0);
INSERT INTO `department` VALUES (27, '111', '11', 0);
INSERT INTO `department` VALUES (28, '哈哈哈', 'aaa', 0);
INSERT INTO `department` VALUES (29, '1', '@@', 0);
INSERT INTO `department` VALUES (30, '1', '1', 0);

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`  (
  `e_id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `e_account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工号',
  `e_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `e_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '员工姓名',
  `e_idcard` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号码',
  `e_sex` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `e_dagree` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学历',
  `e_birthday` date NULL DEFAULT NULL COMMENT '生日',
  `e_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `e_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `e_hometown` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '住址',
  `e_rank` int NULL DEFAULT NULL COMMENT '职称，外键',
  `e_head_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `e_urgent_person` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人',
  `e_urgent_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人方式',
  `p_id` int NULL DEFAULT NULL COMMENT '岗位id，外键',
  `d_id` int NULL DEFAULT NULL COMMENT '部门id，外键',
  `e_base_pay` double(11, 2) NULL DEFAULT NULL COMMENT '基本工资',
  `e_isdel` int NULL DEFAULT NULL COMMENT '是否在职，0离职，1在职',
  `e_entry_time` date NULL DEFAULT NULL COMMENT '入职时间',
  `e_leave_time` date NULL DEFAULT NULL COMMENT '离职时间',
  PRIMARY KEY (`e_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES (11, '1840611203', 'E10ADC3949BA59ABBE56E057F20F883E', '陈鑫', '440681199609065212', '男', '本科', '1999-04-13', '1437950849@qq.com', '17628614888', '四川成都电子科大成都学院', 30, '/ssm_pms/img/head/2022-05-07556.2403457988574.PNG', '他的爸爸', '15512345678', 8, 22, 7500.00, 1, '2015-05-08', '2018-07-12');
INSERT INTO `employee` VALUES (12, '18081302', 'E10ADC3949BA59ABBE56E057F20F883E', '丘佳倩', '445222199703294545', '女', '本科', '1997-03-29', '17876253646@qq.com', '17628614888', '四川成都电子科大成都学院', 32, '/ssm_pms/img/head/2022-04-18180.4553807998368.jpg', 'mami', '15512345678', 9, 22, 7000.00, 1, '2015-04-22', NULL);
INSERT INTO `employee` VALUES (13, '18080809', 'E10ADC3949BA59ABBE56E057F20F883E', '刘文晴', '441882201808080000', '女', '本科', '1998-01-01', 'venki@foxmail.com', '17628614888', '四川成都电子科大成都学院', 31, '/ssm_pms/img/head/2022-04-18838.5527791471401.jpg', '刘文晴', '15512345678', 9, 21, 7000.00, 1, '2015-05-28', NULL);
INSERT INTO `employee` VALUES (14, '18081001', 'E10ADC3949BA59ABBE56E057F20F883E', '刘宇', '441623199610181286', '男', '本科', '1996-10-18', '953215743@qq.com', '17628614888', '四川成都电子科大成都学院', 31, '/ssm_pms/img/head/2022-04-18325.76247624255484.PNG', '刘彬', '15512345678', 10, 16, 8000.00, 1, '2015-04-29', NULL);
INSERT INTO `employee` VALUES (15, '18080810', 'E10ADC3949BA59ABBE56E057F20F883E', '张杨洋', '441882201808090001', '男', '本科', '1998-08-01', 'zhangsan@qq.com', '17628614888', '四川成都电子科大成都学院', 28, '/ssm_pms/img/head/2022-04-18635.3660179982204.jpg', '张三', '15512345678', 24, 16, 8000.00, 1, '2015-05-19', NULL);
INSERT INTO `employee` VALUES (16, '18080811', 'E10ADC3949BA59ABBE56E057F20F883E', '李林峰', '441882201808110002', '男', '本科', '1999-02-01', 'lilinfeng@qq.com', '17628614888', '四川成都电子科大成都学院', 32, '/ssm_pms/img/head/2022-04-18595.3005150137055.PNG', '李四', '15512345678', 24, 22, 6500.00, 1, '2015-05-08', NULL);
INSERT INTO `employee` VALUES (17, '18081002', 'E10ADC3949BA59ABBE56E057F20F883E', '罗航', '442524199407062088', '男', '本科', '1994-07-06', 'luohang0706@163.com', '17628614888', '四川成都电子科大成都学院', 28, '/ssm_pms/img/head/2022-04-18452.33975241911753.PNG', '罗彬', '15512345678', 19, 19, 6000.00, 1, '2015-05-12', NULL);
INSERT INTO `employee` VALUES (18, '18080812', 'E10ADC3949BA59ABBE56E057F20F883E', '王洋', '441882201808120003', '男', '本科', '1999-05-01', 'wangyang@qq.com', '17628614888', '四川成都电子科大成都学院', 28, '/ssm_pms/img/head/2022-04-18977.7491304856408.PNG', '王五', '15512345678', 16, 11, 6000.00, 1, '2015-05-08', NULL);
INSERT INTO `employee` VALUES (19, '18022101', 'E10ADC3949BA59ABBE56E057F20F883E', '杨候紫', '445222199302271345', '女', '研究生', '1993-02-27', '17876254635@qq.com', '17628614888', '四川成都电子科大成都学院', 31, '/ssm_pms/img/head/2022-04-18206.89076360988312.PNG', '小丘', '15512345678', 20, 14, 10000.00, 1, '2015-05-12', NULL);
INSERT INTO `employee` VALUES (20, '18080813', 'E10ADC3949BA59ABBE56E057F20F883E', '钱亦兴', '441882201808130004', '男', '本科', '1998-04-01', 'qianyixing@qq.com', '17628614888', '四川成都电子科大成都学院', 28, '/ssm_pms/img/head/2019-09-24926.6591178493358.png', '钱六', '15512345678', 21, 14, 5000.00, 1, '2015-05-08', NULL);
INSERT INTO `employee` VALUES (21, '14071501', 'E10ADC3949BA59ABBE56E057F20F883E', '张曌', '341568199104011688', '男', '硕士', '1991-04-01', 'zhangzhao0401@hotmail.com', '17628614888', '四川成都电子科大成都学院', 28, '/ssm_pms/img/head/2022-04-18513.9567810932742.jpg', '张庆延', '15512345678', 34, 13, 20000.00, 1, '2015-05-23', NULL);
INSERT INTO `employee` VALUES (22, '18080814', 'E10ADC3949BA59ABBE56E057F20F883E', '赵敏', '441882201808140004', '女', '本科', '1997-09-13', 'zhaomin@qq.com', '17628614888', '四川成都电子科大成都学院', 28, '/ssm_pms/img/head/2019-09-24926.6591178493358.png', '赵乾', '15512345678', 12, 10, 6300.00, 1, '2015-05-08', NULL);
INSERT INTO `employee` VALUES (24, '18051205', 'E10ADC3949BA59ABBE56E057F20F883E', '张小迪', '445222199505051212', '女', '本科', '1995-05-05', '17876254611@qq.com', '17628614888', '四川成都电子科大成都学院', 28, '/ssm_pms/img/head/2022-04-18301.80646919988294.jpg', '小巴', '15512345678', 37, 20, 5000.00, 1, '2015-05-11', NULL);
INSERT INTO `employee` VALUES (25, '17040811', 'E10ADC3949BA59ABBE56E057F20F883E', '何菲', '385416199512228130', '女', '大专', '1995-12-22', '168561694@qq.com', '17628614888', '四川成都电子科大成都学院', 28, '/ssm_pms/img/head/2022-04-18341.5676009710816.PNG', '何英平', '15512345678', 37, 20, 5000.00, 1, '2015-05-08', NULL);
INSERT INTO `employee` VALUES (26, '18080911', 'E10ADC3949BA59ABBE56E057F20F883E', '倪妮', '445111199407051234', '女', '本科', '1994-07-05', '1978835852@qq.com', '17628614888', '四川成都电子科大成都学院', 28, '/ssm_pms/img/head/2022-04-18240.6250041619612.jpg', '倪好', '15512345678', 14, 10, 3500.00, 1, '2015-04-01', NULL);
INSERT INTO `employee` VALUES (27, '16012304', 'E10ADC3949BA59ABBE56E057F20F883E', '莫建轩', '440536199002261413', '男', '博士', '1990-02-26', '743421331@qq.com', '17628614888', '四川成都电子科大成都学院', 32, '/ssm_pms/img/head/2022-04-18149.7446222584725.PNG', '莫正言', '15512345678', 11, 16, 18000.00, 1, '2015-05-08', NULL);
INSERT INTO `employee` VALUES (28, '18081113', 'E10ADC3949BA59ABBE56E057F20F883E', '邓小伦', '441221199005124567', '男', '本科', '1990-05-10', '145852145@qq.com', '17628614888', '四川成都电子科大成都学院', 30, '/ssm_pms/img/head/2022-04-18266.8130001888309.PNG', '邓伦', '15512345678', 11, 22, 6000.00, 1, '2015-05-08', NULL);
INSERT INTO `employee` VALUES (29, '15090302', 'E10ADC3949BA59ABBE56E057F20F883E', '林哼哼', '440689977652301568', '女', '本科', '1997-08-31', '126456@163.com', '17628614888', '四川成都电子科大成都学院', 28, '/ssm_pms/img/head/2019-09-24926.6591178493358.png', '张三', '15512345678', 34, 13, 4560.00, 1, '2015-04-17', NULL);
INSERT INTO `employee` VALUES (30, '17032802', 'E10ADC3949BA59ABBE56E057F20F883E', '吴婷', '442531199511010305', '女', '本科', '1995-11-01', '15654913@qq.com', '17628614888', '四川成都电子科大成都学院', 28, '/ssm_pms/img/head/2022-04-18485.4824453657809.jpg', '吴泉峰', '15512345678', 22, 14, 6500.00, 1, '2015-05-09', NULL);
INSERT INTO `employee` VALUES (31, '16031208', 'E10ADC3949BA59ABBE56E057F20F883E', '张庭', '452012369852034565', '男', '本科', '1981-04-22', '413546546@qq.com', '17628614888', '四川成都电子科大成都学院', 28, '/ssm_pms/img/head/2022-04-18564.5312619145789.jpg', '王琦', '15512345678', 16, 11, 14200.00, 1, '2015-05-08', NULL);
INSERT INTO `employee` VALUES (32, '18081301', 'E10ADC3949BA59ABBE56E057F20F883E', '谢斐', '44521119970810458x', '女', '大专', '1997-08-10', 'xiefei@163.com', '17628614888', '四川成都电子科大成都学院', 30, '/ssm_pms/img/head/2019-09-24926.6591178493358.png', '谢绵', '15512345678', 37, 20, 3000.00, 1, '2015-05-20', NULL);
INSERT INTO `employee` VALUES (33, '15081302', 'E10ADC3949BA59ABBE56E057F20F883E', '王七一', '445222199006070711', '男', '研究生', '1990-06-04', '17876256455@qq.com', '17628614888', '四川成都电子科大成都学院', 32, '/ssm_pms/img/head/2022-04-18439.1364788750305.jpg', '梦梦', '15512345678', 10, 21, 11000.00, 1, '2015-04-15', NULL);
INSERT INTO `employee` VALUES (34, '18071902', 'E10ADC3949BA59ABBE56E057F20F883E', '林逸', '440685511926357021', '女', '本科', '2000-12-01', 'ida@qq.com', '17628614888', '四川成都电子科大成都学院', 28, '/ssm_pms/img/head/2022-04-18597.8057544820441.jpg', '艾达', '15512345678', 21, 14, 4300.00, 1, '2015-04-12', NULL);
INSERT INTO `employee` VALUES (35, '18080214', 'E10ADC3949BA59ABBE56E057F20F883E', '赵鑫', '445112199507112323', '男', '本科', '1995-07-11', 'zhaoxin@163.com', '17628614888', '四川成都电子科大成都学院', 32, '/ssm_pms/img/head/2022-04-18451.0423385766256.jpg', '赵伟', '15512345678', 10, 16, 4000.00, 1, '2015-05-08', NULL);
INSERT INTO `employee` VALUES (36, '14101202', 'E10ADC3949BA59ABBE56E057F20F883E', '张汉良', '446581197910319025', '男', '硕士', '1979-10-31', '123544@163.com', '17628614888', '四川成都电子科大成都学院', 32, '/ssm_pms/img/head/2019-09-24926.6591178493358.png', '梁培珊', '15512345678', 11, 16, 16500.00, 1, '2015-04-06', NULL);
INSERT INTO `employee` VALUES (38, '15090205', 'E10ADC3949BA59ABBE56E057F20F883E', '杨凌云', '441594199303084235', '男', '硕士', '1993-03-08', '561896796@qq.com', '17628614888', '四川成都电子科大成都学院', 28, '/ssm_pms/img/head/2022-04-18708.857630772319.jpg', '杨帆', '15512345678', 13, 10, 14000.00, 1, '2015-05-12', NULL);
INSERT INTO `employee` VALUES (39, '18081006', 'E10ADC3949BA59ABBE56E057F20F883E', '孟琪琪', '445331199412104562', '女', '本科', '1994-12-10', '359883586@qq.com', '17628614888', '四川成都电子科大成都学院', 31, '/ssm_pms/img/head/2022-04-18835.5697616070377.png', '孟江', '15512345678', 9, 22, 4000.00, 1, '2015-05-08', NULL);
INSERT INTO `employee` VALUES (40, '17090333', 'E10ADC3949BA59ABBE56E057F20F883E', '梁漂亮', '442653310258950126', '女', '本科', '1990-08-12', 'lbeautiful@163.com', '17628614888', '四川成都电子科大成都学院', 32, '/ssm_pms/img/head/2022-04-18700.88768185129.PNG', '梁帅气', '15512345678', 9, 21, 6500.00, 0, '2015-05-25', '2022-05-08');
INSERT INTO `employee` VALUES (41, '11091202', 'E10ADC3949BA59ABBE56E057F20F883E', '李丽海', '445222198908162233', '女', '大专', '1989-08-15', '13876625460@qq.com', '17628614888', '四川成都电子科大成都学院', 28, '/ssm_pms/img/head/2019-09-24926.6591178493358.png', '米丽', '15512345678', 19, 19, 5000.00, 0, '2015-04-30', '2022-05-08');
INSERT INTO `employee` VALUES (42, '18081008', 'E10ADC3949BA59ABBE56E057F20F883E', '吴蕾', '44133119950815123x', '女', '本科', '1995-08-15', 'wulei123@163.com', '17628614888', '四川成都电子科大成都学院', 28, '/ssm_pms/img/head/2022-04-18613.8050268572154.jpg', '吴斌', '15512345678', 17, 11, 3000.00, 1, '2015-05-10', '2018-08-13');
INSERT INTO `employee` VALUES (43, '08080122', 'E10ADC3949BA59ABBE56E057F20F883E', '豪豪', '445222201506171706', '男', '幼儿园', '1990-02-01', '17876252525@qq.com', '17628614888', '四川成都电子科大成都学院', 28, '/ssm_pms/img/head/2022-04-18491.23676563335107.PNG', 'hismom', '15512345678', 37, 20, 1000.00, 1, '2015-05-08', '2018-08-13');
INSERT INTO `employee` VALUES (44, '05010122', 'E10ADC3949BA59ABBE56E057F20F883E', '姚期智', '445222198903032211', '男', '博士', '1989-03-03', '17025513212@qq.com', '17628614888', '四川成都电子科大成都学院', 31, '/ssm_pms/img/head/2022-04-18136.1628632859948.jpg', 'Alice', '15512345678', 11, 21, 40000.00, 1, '2015-05-05', '2018-08-13');
INSERT INTO `employee` VALUES (45, '1840611201', 'E10ADC3949BA59ABBE56E057F20F883E', 'cx', '511623199900001111', '男', '本科', '1999-04-01', '123@qq.com', '17622223333', '四川广安', 32, '/ssm_pms/img/head/2022-05-05977.069702160907.jpg', 'cc', '11762222444', 11, 10, 39990.00, 1, '2022-03-04', NULL);
INSERT INTO `employee` VALUES (46, '1840611202', '25D55AD283AA400AF464C76D713C07AD', '吴尚青', '511555199801012222', '男', '本科', '1998-01-01', '123@qq.com', '19934221234', '四川那南充', 32, '/ssm_pms/img/head/2022-04-20879.6612605472377.jpg', 'cx', '17628612222', 19, 21, 2999.00, 1, '2020-04-01', NULL);
INSERT INTO `employee` VALUES (47, '1840611204', 'E10ADC3949BA59ABBE56E057F20F883E', 'zz', '511623199805147777', '男', '本科', '1998-05-14', '123@qq.com', '19900008888', '电子科技大学成都学院', 33, '/ssm_pms/img/head/defalut.jpg', 'dad', '19900008888', 37, 22, 3999.00, 1, '2022-05-07', NULL);
INSERT INTO `employee` VALUES (48, '1840611205', 'E10ADC3949BA59ABBE56E057F20F883E', 'dd', '511623199805147777', '男', '本科', '1998-05-14', '123456@qq.com', '19909090000', '123', 28, '/ssm_pms/img/head/defalut.jpg', 'mom', '15567890988', 37, 22, 3999.00, 0, '2022-05-07', '2022-05-08');
INSERT INTO `employee` VALUES (49, '001', 'E10ADC3949BA59ABBE56E057F20F883E', '陈鑫', '511623199805147777', '男', '本科', '1998-05-14', '123@qq.com', '12344333333', '444', 30, '/ssm_pms/img/head/defalut.jpg', '3333', '17628614898', 11, 26, 9999.00, 0, '2021-05-07', '2022-05-07');
INSERT INTO `employee` VALUES (50, '001', 'E10ADC3949BA59ABBE56E057F20F883E', 'chenxin', '511623199912120000', '男', '本科', '1999-12-12', '12333@qq.com', '17789899999', '1', 33, '/ssm_pms/img/head/2022-05-08768.3155220996521.jpg', '1111', '17628614898', 13, 10, 9999.00, 0, '2022-05-08', '2022-05-08');

-- ----------------------------
-- Table structure for key_value
-- ----------------------------
DROP TABLE IF EXISTS `key_value`;
CREATE TABLE `key_value`  (
  `kv_id` int NOT NULL AUTO_INCREMENT,
  `kv_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '键',
  `kv_value` double(11, 0) NULL DEFAULT NULL COMMENT '值',
  PRIMARY KEY (`kv_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of key_value
-- ----------------------------
INSERT INTO `key_value` VALUES (1, 'food_pay', 200);
INSERT INTO `key_value` VALUES (2, 'traffic_pay', 200);
INSERT INTO `key_value` VALUES (3, 'late_buckle_pay', -20);
INSERT INTO `key_value` VALUES (4, 'early_buckle_pay', -20);
INSERT INTO `key_value` VALUES (5, 'missionallowance', 50);
INSERT INTO `key_value` VALUES (6, 'full_attendance_pay', 100);

-- ----------------------------
-- Table structure for monthly_attendance
-- ----------------------------
DROP TABLE IF EXISTS `monthly_attendance`;
CREATE TABLE `monthly_attendance`  (
  `ma_id` int NOT NULL AUTO_INCREMENT,
  `e_id` int NULL DEFAULT NULL COMMENT '员工id,外键',
  `attendance_time` date NULL DEFAULT NULL COMMENT '某年某月的出勤情况',
  `sick_leave_num` int NULL DEFAULT NULL COMMENT '病假天数',
  `overtime_hour` double(11, 2) NULL DEFAULT NULL COMMENT '平时加班小时',
  `weekend_hour` double(11, 2) NULL DEFAULT NULL COMMENT '周末加班小时',
  `holiday_hour` double(11, 2) NULL DEFAULT NULL COMMENT '节假日加班小时',
  `late_num` int NULL DEFAULT NULL COMMENT '迟到次数',
  `early_num` int NULL DEFAULT NULL COMMENT '早退次数',
  `absence_num` int NULL DEFAULT NULL COMMENT '缺勤天数',
  `business_travel_num` int NULL DEFAULT NULL COMMENT '出差天数',
  `compassionate_leave_num` int NULL DEFAULT NULL COMMENT '事假天数',
  PRIMARY KEY (`ma_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of monthly_attendance
-- ----------------------------
INSERT INTO `monthly_attendance` VALUES (1, 38, '2019-08-01', 0, 1.00, 1.00, 2.00, 0, 1, 1, 1, 1);
INSERT INTO `monthly_attendance` VALUES (2, 16, '2019-08-02', 0, 1.00, 1.00, 2.00, 0, 1, 1, 1, 1);
INSERT INTO `monthly_attendance` VALUES (3, 43, '2019-08-03', 0, 1.00, 1.00, 2.00, 0, 1, 1, 1, 1);
INSERT INTO `monthly_attendance` VALUES (4, 21, '2019-08-04', 0, 1.00, 1.00, 2.00, 0, 1, 1, 1, 1);
INSERT INTO `monthly_attendance` VALUES (5, 27, '2019-08-05', 0, 1.00, 1.00, 2.00, 0, 1, 1, 1, 1);
INSERT INTO `monthly_attendance` VALUES (6, 36, '2019-08-06', 0, 1.00, 1.00, 2.00, 0, 1, 1, 1, 1);
INSERT INTO `monthly_attendance` VALUES (7, 15, '2019-08-07', 0, 1.00, 1.00, 2.00, 0, 1, 1, 1, 1);
INSERT INTO `monthly_attendance` VALUES (8, 42, '2019-08-08', 0, 1.00, 1.00, 2.00, 0, 1, 1, 1, 1);
INSERT INTO `monthly_attendance` VALUES (9, 20, '2019-08-09', 0, 1.00, 1.00, 2.00, 0, 1, 1, 1, 1);
INSERT INTO `monthly_attendance` VALUES (10, 26, '2019-08-10', 0, 1.00, 1.00, 2.00, 0, 1, 1, 1, 1);
INSERT INTO `monthly_attendance` VALUES (11, 35, '2019-08-11', 0, 1.00, 1.00, 2.00, 0, 1, 1, 1, 1);
INSERT INTO `monthly_attendance` VALUES (12, 14, '2019-08-12', 0, 1.00, 1.00, 2.00, 0, 1, 1, 1, 1);
INSERT INTO `monthly_attendance` VALUES (13, 31, '2019-08-13', 0, 1.00, 1.00, 2.00, 0, 1, 1, 1, 1);
INSERT INTO `monthly_attendance` VALUES (14, 41, '2019-08-14', 0, 1.00, 1.00, 2.00, 0, 1, 1, 1, 1);
INSERT INTO `monthly_attendance` VALUES (15, 19, '2019-08-15', 0, 1.00, 1.00, 2.00, 0, 1, 1, 1, 1);
INSERT INTO `monthly_attendance` VALUES (16, 25, '2019-08-16', 0, 1.00, 1.00, 2.00, 0, 1, 1, 1, 1);
INSERT INTO `monthly_attendance` VALUES (17, 34, '2019-08-17', 0, 1.00, 1.00, 2.00, 0, 1, 1, 1, 1);
INSERT INTO `monthly_attendance` VALUES (18, 13, '2019-08-18', 0, 1.00, 1.00, 2.00, 0, 1, 1, 1, 1);
INSERT INTO `monthly_attendance` VALUES (19, 30, '2019-08-19', 0, 1.00, 1.00, 2.00, 0, 1, 1, 1, 1);
INSERT INTO `monthly_attendance` VALUES (20, 40, '2019-08-20', 0, 1.00, 1.00, 2.00, 0, 1, 1, 1, 1);
INSERT INTO `monthly_attendance` VALUES (21, 18, '2019-08-21', 0, 1.00, 1.00, 2.00, 0, 1, 1, 1, 1);
INSERT INTO `monthly_attendance` VALUES (22, 24, '2019-08-22', 0, 1.00, 1.00, 2.00, 0, 1, 1, 1, 1);
INSERT INTO `monthly_attendance` VALUES (23, 33, '2019-08-23', 0, 1.00, 1.00, 2.00, 0, 1, 1, 1, 1);
INSERT INTO `monthly_attendance` VALUES (24, 12, '2019-08-24', 0, 1.00, 1.00, 2.00, 0, 1, 1, 1, 1);
INSERT INTO `monthly_attendance` VALUES (25, 29, '2019-08-25', 0, 1.00, 1.00, 2.00, 0, 1, 1, 1, 1);
INSERT INTO `monthly_attendance` VALUES (26, 39, '2019-08-26', 0, 1.00, 1.00, 2.00, 0, 1, 1, 1, 1);
INSERT INTO `monthly_attendance` VALUES (27, 17, '2019-08-27', 0, 1.00, 1.00, 2.00, 0, 1, 1, 1, 1);
INSERT INTO `monthly_attendance` VALUES (28, 44, '2019-08-28', 0, 1.00, 1.00, 2.00, 0, 1, 1, 1, 1);
INSERT INTO `monthly_attendance` VALUES (29, 22, '2019-08-29', 0, 1.00, 1.00, 2.00, 0, 1, 1, 1, 1);
INSERT INTO `monthly_attendance` VALUES (30, 32, '2019-08-30', 0, 1.00, 1.00, 2.00, 0, 1, 1, 1, 1);
INSERT INTO `monthly_attendance` VALUES (31, 11, '2019-08-31', 0, 1.00, 1.00, 2.00, 0, 1, 1, 1, 1);
INSERT INTO `monthly_attendance` VALUES (32, 28, '2019-08-31', 0, 1.00, 1.00, 2.00, 0, 1, 1, 1, 1);
INSERT INTO `monthly_attendance` VALUES (33, 45, '2022-03-01', 0, 1.00, 1.00, 1.00, 1, 1, 1, 1, 1);

-- ----------------------------
-- Table structure for position
-- ----------------------------
DROP TABLE IF EXISTS `position`;
CREATE TABLE `position`  (
  `p_id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `p_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '岗位名称',
  `p_duty` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '岗位描述',
  `p_post_pay` double(11, 2) NULL DEFAULT NULL COMMENT '岗位补贴',
  `p_isdel` int NULL DEFAULT NULL COMMENT '是否可用，0不可用，1可用',
  PRIMARY KEY (`p_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of position
-- ----------------------------
INSERT INTO `position` VALUES (8, '配置管理员', '负责最后的编译及提交到中心服务器', 200.00, 1);
INSERT INTO `position` VALUES (9, 'QA', '负责软件测试及产品中测', 300.00, 1);
INSERT INTO `position` VALUES (10, 'RD', '负责软件设计及实施', 500.00, 1);
INSERT INTO `position` VALUES (11, '项目经理', '负责整体项目规划', 800.00, 1);
INSERT INTO `position` VALUES (12, '财务总监', '负责整个财务的运作和公司的财务管理', 300.00, 1);
INSERT INTO `position` VALUES (13, '财务经理', '负责公司的整个财务经营状况', 200.00, 1);
INSERT INTO `position` VALUES (14, '会计', '负责总账和业务往来帐', 100.00, 1);
INSERT INTO `position` VALUES (15, '出纳', '负责现金日记账和银行往来帐', 100.00, 1);
INSERT INTO `position` VALUES (16, '市场部经理', '全面负责市场部门的业务及人员管理', 699.00, 1);
INSERT INTO `position` VALUES (17, '市场调研人员', '负责市场调研计划的制定及实施', 200.00, 1);
INSERT INTO `position` VALUES (18, '市场推广制作人员', '制定年度推广计划', 200.00, 1);
INSERT INTO `position` VALUES (19, '营销人员', '负责对公司产品价值实现过程中各销售环节实行管理、监督、协调、服务', 260.00, 1);
INSERT INTO `position` VALUES (20, '人事部经理', '负责公司人力资源工作的规划，建立、执行招聘、培训、考勤、劳动纪律等人事程序或规章制度', 500.00, 1);
INSERT INTO `position` VALUES (21, '人事专员', '负责招聘及办理入职手续，负责人事档案的管理、保管、用工合同的签订', 200.00, 1);
INSERT INTO `position` VALUES (22, '薪酬福利专员', '负责福利社保工资', 100.00, 1);
INSERT INTO `position` VALUES (23, '培训经理', '负责计划新人培训及员工学习', 300.00, 1);
INSERT INTO `position` VALUES (24, '培训师', '负责实施新人培训及员工学习', 280.00, 1);
INSERT INTO `position` VALUES (34, '行政部总监', '对行政部工作全面负责、组织安排协调本部门职责范围内的工作', 600.00, 1);
INSERT INTO `position` VALUES (35, '行政专员', '协助做好公司公司日常行政事务的组织协调工作', 200.00, 1);
INSERT INTO `position` VALUES (36, '售后服务经理', '全面主持售后服务工作，完善售后服务各部门的规章管理制度', 500.00, 1);
INSERT INTO `position` VALUES (37, '售后接待', '接待请求售后的客户，处理售后，听取客户意见并向上级汇报', 299.00, 1);

-- ----------------------------
-- Table structure for rank_bonus
-- ----------------------------
DROP TABLE IF EXISTS `rank_bonus`;
CREATE TABLE `rank_bonus`  (
  `rb_id` int NOT NULL AUTO_INCREMENT,
  `rank_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职称名称',
  `rb_bonus` int NULL DEFAULT NULL COMMENT '奖金',
  PRIMARY KEY (`rb_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of rank_bonus
-- ----------------------------
INSERT INTO `rank_bonus` VALUES (28, '无', 0);
INSERT INTO `rank_bonus` VALUES (30, '初级人员', 500);
INSERT INTO `rank_bonus` VALUES (31, '中级人员', 800);
INSERT INTO `rank_bonus` VALUES (32, '高级人员', 1000);
INSERT INTO `rank_bonus` VALUES (33, '高高级人员', 2000);

-- ----------------------------
-- Table structure for salary
-- ----------------------------
DROP TABLE IF EXISTS `salary`;
CREATE TABLE `salary`  (
  `s_id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `e_id` int NULL DEFAULT NULL COMMENT '员工id',
  `d_id` int NULL DEFAULT NULL COMMENT '部门ID',
  `s_time` date NULL DEFAULT NULL COMMENT '时间某年某月',
  `s_state` int NULL DEFAULT NULL COMMENT '状态0暂存，1已发',
  `base_pay` double(11, 2) NULL DEFAULT NULL COMMENT '基本工资',
  `food_pay` double(11, 2) NULL DEFAULT NULL COMMENT '餐饮补贴',
  `post_pay` double(11, 2) NULL DEFAULT NULL COMMENT '岗位补贴',
  `working_year_pay` double(11, 2) NULL DEFAULT NULL COMMENT '工龄奖金',
  `rank_pay` double(11, 2) NULL DEFAULT NULL COMMENT '职称奖金',
  `traffic_pay` double(11, 2) NULL DEFAULT NULL COMMENT '交通补贴',
  `persion_pay` double(11, 2) NULL DEFAULT NULL COMMENT '养老保险',
  `medical_pay` double(11, 2) NULL DEFAULT NULL COMMENT '医疗保险',
  `unemployment_pay` double(11, 2) NULL DEFAULT NULL COMMENT '失业保险',
  `injury_pay` double(11, 2) NULL DEFAULT NULL COMMENT '工伤保险',
  `birth_pay` double(11, 2) NULL DEFAULT NULL COMMENT '生育保险',
  `housing_pay` double(11, 2) NULL DEFAULT NULL COMMENT '住房公积金',
  `late_pay` double(11, 2) NULL DEFAULT NULL COMMENT '迟到罚金',
  `early_pay` double(11, 2) NULL DEFAULT NULL COMMENT '早退罚金',
  `overtime_pay` double(11, 2) NULL DEFAULT NULL COMMENT '加班奖金',
  `sick_pay` double(11, 2) NULL DEFAULT NULL COMMENT '病假扣额',
  `thing_pay` double(11, 2) NULL DEFAULT NULL COMMENT '事假扣额',
  `business_travel_pay` double(11, 2) NULL DEFAULT NULL COMMENT '出差补贴',
  `full_attendance_pay` double(11, 2) NULL DEFAULT NULL COMMENT '全勤奖',
  `rissue_pay` double(11, 2) NULL DEFAULT NULL COMMENT '补发金额',
  `individual_income_tax` double(11, 2) NULL DEFAULT NULL COMMENT '个人所得税',
  `should_pay` double(11, 2) NULL DEFAULT NULL COMMENT '应发工资',
  `actual_pay` double(11, 2) NULL DEFAULT NULL COMMENT '实发工资',
  PRIMARY KEY (`s_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 96 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of salary
-- ----------------------------
INSERT INTO `salary` VALUES (1, 11, 22, '2019-09-01', 1, 7500.00, 200.00, 200.00, 400.00, 500.00, 200.00, -600.00, -160.00, -75.00, 0.00, 0.00, -600.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -301.50, 9000.00, 7263.50);
INSERT INTO `salary` VALUES (2, 12, 22, '2019-09-01', 0, 7000.00, 200.00, 300.00, 400.00, 1000.00, 200.00, -560.00, -150.00, -70.00, 0.00, 0.00, -560.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -321.00, 9100.00, 7439.00);
INSERT INTO `salary` VALUES (3, 13, 21, '2019-09-01', 0, 7000.00, 200.00, 300.00, 400.00, 800.00, 200.00, -560.00, -150.00, -70.00, 0.00, 0.00, -560.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -301.00, 8900.00, 7259.00);
INSERT INTO `salary` VALUES (4, 14, 16, '2019-09-01', 0, 8000.00, 200.00, 500.00, 400.00, 800.00, 200.00, -640.00, -170.00, -80.00, 0.00, 0.00, -640.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -459.00, 10100.00, 8111.00);
INSERT INTO `salary` VALUES (5, 15, 16, '2019-09-01', 0, 8000.00, 200.00, 280.00, 400.00, 0.00, 200.00, -640.00, -170.00, -80.00, 0.00, 0.00, -640.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -300.00, 9080.00, 7250.00);
INSERT INTO `salary` VALUES (6, 16, 22, '2019-09-01', 0, 6500.00, 200.00, 280.00, 400.00, 1000.00, 200.00, -520.00, -140.00, -65.00, 0.00, 0.00, -520.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -278.50, 8580.00, 7056.50);
INSERT INTO `salary` VALUES (7, 17, 19, '2019-09-01', 0, 6000.00, 200.00, 260.00, 400.00, 0.00, 200.00, -480.00, -130.00, -60.00, 0.00, 0.00, -480.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -136.00, 7060.00, 5774.00);
INSERT INTO `salary` VALUES (8, 18, 11, '2019-09-01', 0, 6000.00, 200.00, 699.00, 400.00, 0.00, 200.00, -480.00, -130.00, -60.00, 0.00, 0.00, -480.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -179.90, 7499.00, 6169.10);
INSERT INTO `salary` VALUES (9, 19, 14, '2019-09-01', 0, 10000.00, 200.00, 500.00, 400.00, 800.00, 200.00, -800.00, -210.00, -100.00, 0.00, 0.00, -800.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -783.00, 12100.00, 9407.00);
INSERT INTO `salary` VALUES (10, 20, 14, '2019-09-01', 0, 5000.00, 200.00, 200.00, 400.00, 0.00, 200.00, -400.00, -110.00, -50.00, 0.00, 0.00, -400.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -49.00, 6000.00, 4991.00);
INSERT INTO `salary` VALUES (11, 21, 13, '2019-09-01', 0, 20000.00, 200.00, 600.00, 400.00, 0.00, 200.00, -1600.00, -410.00, -200.00, 0.00, 0.00, -1600.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -2517.50, 21400.00, 15072.50);
INSERT INTO `salary` VALUES (12, 22, 10, '2019-09-01', 0, 6300.00, 200.00, 300.00, 400.00, 0.00, 200.00, -504.00, -136.00, -63.00, 0.00, 0.00, -504.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -164.30, 7400.00, 6028.70);
INSERT INTO `salary` VALUES (13, 24, 20, '2019-09-01', 0, 5000.00, 200.00, 299.00, 400.00, 0.00, 200.00, -400.00, -110.00, -50.00, 0.00, 0.00, -400.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -58.90, 6099.00, 5080.10);
INSERT INTO `salary` VALUES (14, 25, 20, '2019-09-01', 0, 5000.00, 200.00, 299.00, 400.00, 0.00, 200.00, -400.00, -110.00, -50.00, 0.00, 0.00, -400.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -58.90, 6099.00, 5080.10);
INSERT INTO `salary` VALUES (15, 26, 10, '2019-09-01', 0, 3500.00, 200.00, 100.00, 400.00, 0.00, 200.00, -280.00, -80.00, -35.00, 0.00, 0.00, -280.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -6.75, 4400.00, 3718.25);
INSERT INTO `salary` VALUES (16, 27, 16, '2019-09-01', 0, 18000.00, 200.00, 800.00, 400.00, 1000.00, 200.00, -1440.00, -370.00, -180.00, 0.00, 0.00, -1440.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -2412.50, 20600.00, 14757.50);
INSERT INTO `salary` VALUES (17, 28, 22, '2019-09-01', 0, 6000.00, 200.00, 800.00, 400.00, 500.00, 200.00, -480.00, -130.00, -60.00, 0.00, 0.00, -480.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -240.00, 8100.00, 6710.00);
INSERT INTO `salary` VALUES (18, 29, 13, '2019-09-01', 0, 4560.00, 200.00, 600.00, 400.00, 0.00, 200.00, -364.80, -101.20, -45.60, 0.00, 0.00, -364.80, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -53.36, 5960.00, 5030.24);
INSERT INTO `salary` VALUES (19, 30, 14, '2019-09-01', 0, 6500.00, 200.00, 100.00, 400.00, 0.00, 200.00, -520.00, -140.00, -65.00, 0.00, 0.00, -520.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -160.50, 7400.00, 5994.50);
INSERT INTO `salary` VALUES (20, 31, 11, '2019-09-01', 0, 14200.00, 200.00, 699.00, 400.00, 0.00, 200.00, -1136.00, -294.00, -142.00, 0.00, 0.00, -1136.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -1367.75, 15699.00, 11623.25);
INSERT INTO `salary` VALUES (21, 32, 20, '2019-09-01', 0, 3000.00, 200.00, 299.00, 400.00, 500.00, 200.00, -240.00, -70.00, -30.00, 0.00, 0.00, -240.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -15.57, 4599.00, 4003.43);
INSERT INTO `salary` VALUES (22, 33, 21, '2019-09-01', 0, 11000.00, 200.00, 500.00, 400.00, 1000.00, 200.00, -880.00, -230.00, -110.00, 0.00, 0.00, -880.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -985.00, 13300.00, 10215.00);
INSERT INTO `salary` VALUES (23, 34, 14, '2019-09-01', 0, 4300.00, 200.00, 200.00, 400.00, 0.00, 200.00, -344.00, -96.00, -43.00, 0.00, 0.00, -344.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -29.19, 5300.00, 4443.81);
INSERT INTO `salary` VALUES (24, 35, 16, '2019-09-01', 0, 4000.00, 200.00, 500.00, 400.00, 1000.00, 200.00, -320.00, -90.00, -40.00, 0.00, 0.00, -320.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -98.00, 6300.00, 5432.00);
INSERT INTO `salary` VALUES (25, 36, 16, '2019-09-01', 0, 16500.00, 200.00, 800.00, 400.00, 1000.00, 200.00, -1320.00, -340.00, -165.00, 0.00, 0.00, -1320.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -2108.75, 19100.00, 13846.25);
INSERT INTO `salary` VALUES (26, 38, 10, '2019-09-01', 0, 14000.00, 200.00, 200.00, 400.00, 0.00, 200.00, -1120.00, -290.00, -140.00, 0.00, 0.00, -1120.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -1211.00, 15000.00, 11119.00);
INSERT INTO `salary` VALUES (27, 39, 22, '2019-09-01', 0, 4000.00, 200.00, 300.00, 400.00, 800.00, 200.00, -320.00, -90.00, -40.00, 0.00, 0.00, -320.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -58.00, 5900.00, 5072.00);
INSERT INTO `salary` VALUES (28, 40, 21, '2019-09-01', 0, 6500.00, 200.00, 300.00, 400.00, 100.00, 200.00, -520.00, -140.00, -65.00, 0.00, 0.00, -520.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -190.50, 7700.00, 6264.50);
INSERT INTO `salary` VALUES (29, 41, 19, '2019-09-01', 0, 5000.00, 200.00, 260.00, 400.00, 0.00, 200.00, -400.00, -110.00, -50.00, 0.00, 0.00, -400.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -55.00, 6060.00, 5045.00);
INSERT INTO `salary` VALUES (30, 42, 11, '2019-09-01', 0, 3000.00, 200.00, 200.00, 400.00, 0.00, 200.00, -240.00, -70.00, -30.00, 0.00, 0.00, -240.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 4000.00, 3420.00);
INSERT INTO `salary` VALUES (31, 43, 20, '2019-09-01', 0, 1000.00, 200.00, 299.00, 400.00, 0.00, 200.00, -80.00, -30.00, -10.00, 0.00, 0.00, -80.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2099.00, 1899.00);
INSERT INTO `salary` VALUES (32, 44, 21, '2019-09-01', 0, 40000.00, 200.00, 800.00, 400.00, 800.00, 200.00, -3200.00, -810.00, -400.00, 0.00, 0.00, -3200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -6817.50, 42400.00, 27972.50);
INSERT INTO `salary` VALUES (33, 45, 10, '2022-02-01', 1, 39990.00, 200.00, 800.00, 0.00, 1000.00, 200.00, -3199.20, -809.80, -399.90, 0.00, 0.00, -3199.20, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -6765.48, 42190.00, 27816.43);
INSERT INTO `salary` VALUES (34, 11, 22, '2022-02-01', 1, 7500.00, 200.00, 200.00, 600.00, 500.00, 200.00, -600.00, -160.00, -75.00, 0.00, 0.00, -600.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -321.50, 9200.00, 7443.50);
INSERT INTO `salary` VALUES (35, 12, 22, '2022-02-01', 1, 7000.00, 200.00, 300.00, 600.00, 1000.00, 200.00, -560.00, -150.00, -70.00, 0.00, 0.00, -560.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -341.00, 9300.00, 7619.00);
INSERT INTO `salary` VALUES (36, 13, 21, '2022-02-01', 1, 7000.00, 200.00, 300.00, 600.00, 800.00, 200.00, -560.00, -150.00, -70.00, 0.00, 0.00, -560.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -321.00, 9100.00, 7439.00);
INSERT INTO `salary` VALUES (37, 14, 16, '2022-02-01', 1, 8000.00, 200.00, 500.00, 600.00, 800.00, 200.00, -640.00, -170.00, -80.00, 0.00, 0.00, -640.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -499.00, 10300.00, 8271.00);
INSERT INTO `salary` VALUES (38, 15, 16, '2022-02-01', 1, 8000.00, 200.00, 280.00, 600.00, 0.00, 200.00, -640.00, -170.00, -80.00, 0.00, 0.00, -640.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -320.00, 9280.00, 7430.00);
INSERT INTO `salary` VALUES (39, 16, 22, '2022-02-01', 1, 6500.00, 200.00, 280.00, 600.00, 1000.00, 200.00, -520.00, -140.00, -65.00, 0.00, 0.00, -520.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -298.50, 8780.00, 7236.50);
INSERT INTO `salary` VALUES (40, 17, 19, '2022-02-01', 1, 6000.00, 200.00, 260.00, 600.00, 0.00, 200.00, -480.00, -130.00, -60.00, 0.00, 0.00, -480.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -156.00, 7260.00, 5954.00);
INSERT INTO `salary` VALUES (41, 18, 11, '2022-02-01', 1, 6000.00, 200.00, 699.00, 600.00, 0.00, 200.00, -480.00, -130.00, -60.00, 0.00, 0.00, -480.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -199.90, 7699.00, 6349.10);
INSERT INTO `salary` VALUES (42, 18, 11, '2022-02-01', 1, 6000.00, 200.00, 699.00, 600.00, 0.00, 200.00, -480.00, -130.00, -60.00, 0.00, 0.00, -480.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -199.90, 7699.00, 6349.10);
INSERT INTO `salary` VALUES (43, 19, 14, '2022-02-01', 0, 10000.00, 200.00, 500.00, 600.00, 800.00, 200.00, -800.00, -210.00, -100.00, 0.00, 0.00, -800.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -823.00, 12300.00, 9567.00);
INSERT INTO `salary` VALUES (44, 19, 14, '2022-02-01', 0, 10000.00, 200.00, 500.00, 600.00, 800.00, 200.00, -800.00, -210.00, -100.00, 0.00, 0.00, -800.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -823.00, 12300.00, 9567.00);
INSERT INTO `salary` VALUES (45, 20, 14, '2022-02-01', 0, 5000.00, 200.00, 200.00, 600.00, 0.00, 200.00, -400.00, -110.00, -50.00, 0.00, 0.00, -400.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -69.00, 6200.00, 5171.00);
INSERT INTO `salary` VALUES (46, 20, 14, '2022-02-01', 0, 5000.00, 200.00, 200.00, 600.00, 0.00, 200.00, -400.00, -110.00, -50.00, 0.00, 0.00, -400.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -69.00, 6200.00, 5171.00);
INSERT INTO `salary` VALUES (47, 21, 13, '2022-02-01', 0, 20000.00, 200.00, 600.00, 600.00, 0.00, 200.00, -1600.00, -410.00, -200.00, 0.00, 0.00, -1600.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -2567.50, 21600.00, 15222.50);
INSERT INTO `salary` VALUES (48, 21, 13, '2022-02-01', 0, 20000.00, 200.00, 600.00, 600.00, 0.00, 200.00, -1600.00, -410.00, -200.00, 0.00, 0.00, -1600.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -2567.50, 21600.00, 15222.50);
INSERT INTO `salary` VALUES (49, 22, 10, '2022-02-01', 0, 6300.00, 200.00, 300.00, 600.00, 0.00, 200.00, -504.00, -136.00, -63.00, 0.00, 0.00, -504.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -184.30, 7600.00, 6208.70);
INSERT INTO `salary` VALUES (50, 22, 10, '2022-02-01', 0, 6300.00, 200.00, 300.00, 600.00, 0.00, 200.00, -504.00, -136.00, -63.00, 0.00, 0.00, -504.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -184.30, 7600.00, 6208.70);
INSERT INTO `salary` VALUES (51, 24, 20, '2022-02-01', 0, 5000.00, 200.00, 299.00, 600.00, 0.00, 200.00, -400.00, -110.00, -50.00, 0.00, 0.00, -400.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -78.90, 6299.00, 5260.10);
INSERT INTO `salary` VALUES (52, 24, 20, '2022-02-01', 0, 5000.00, 200.00, 299.00, 600.00, 0.00, 200.00, -400.00, -110.00, -50.00, 0.00, 0.00, -400.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -78.90, 6299.00, 5260.10);
INSERT INTO `salary` VALUES (53, 25, 20, '2022-02-01', 0, 5000.00, 200.00, 299.00, 600.00, 0.00, 200.00, -400.00, -110.00, -50.00, 0.00, 0.00, -400.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -78.90, 6299.00, 5260.10);
INSERT INTO `salary` VALUES (54, 25, 20, '2022-02-01', 0, 5000.00, 200.00, 299.00, 600.00, 0.00, 200.00, -400.00, -110.00, -50.00, 0.00, 0.00, -400.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -78.90, 6299.00, 5260.10);
INSERT INTO `salary` VALUES (55, 26, 10, '2022-02-01', 0, 3500.00, 200.00, 100.00, 600.00, 0.00, 200.00, -280.00, -80.00, -35.00, 0.00, 0.00, -280.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -12.75, 4600.00, 3912.25);
INSERT INTO `salary` VALUES (56, 26, 10, '2022-02-01', 0, 3500.00, 200.00, 100.00, 600.00, 0.00, 200.00, -280.00, -80.00, -35.00, 0.00, 0.00, -280.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -12.75, 4600.00, 3912.25);
INSERT INTO `salary` VALUES (57, 27, 16, '2022-02-01', 0, 18000.00, 200.00, 800.00, 600.00, 1000.00, 200.00, -1440.00, -370.00, -180.00, 0.00, 0.00, -1440.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -2462.50, 20800.00, 14907.50);
INSERT INTO `salary` VALUES (58, 27, 16, '2022-02-01', 0, 18000.00, 200.00, 800.00, 600.00, 1000.00, 200.00, -1440.00, -370.00, -180.00, 0.00, 0.00, -1440.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -2462.50, 20800.00, 14907.50);
INSERT INTO `salary` VALUES (59, 28, 22, '2022-02-01', 0, 6000.00, 200.00, 800.00, 600.00, 500.00, 200.00, -480.00, -130.00, -60.00, 0.00, 0.00, -480.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -260.00, 8300.00, 6890.00);
INSERT INTO `salary` VALUES (60, 28, 22, '2022-02-01', 0, 6000.00, 200.00, 800.00, 600.00, 500.00, 200.00, -480.00, -130.00, -60.00, 0.00, 0.00, -480.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -260.00, 8300.00, 6890.00);
INSERT INTO `salary` VALUES (61, 29, 13, '2022-02-01', 0, 4560.00, 200.00, 600.00, 600.00, 0.00, 200.00, -364.80, -101.20, -45.60, 0.00, 0.00, -364.80, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -73.36, 6160.00, 5210.24);
INSERT INTO `salary` VALUES (62, 29, 13, '2022-02-01', 0, 4560.00, 200.00, 600.00, 600.00, 0.00, 200.00, -364.80, -101.20, -45.60, 0.00, 0.00, -364.80, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -73.36, 6160.00, 5210.24);
INSERT INTO `salary` VALUES (63, 30, 14, '2022-02-01', 0, 6500.00, 200.00, 100.00, 600.00, 0.00, 200.00, -520.00, -140.00, -65.00, 0.00, 0.00, -520.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -180.50, 7600.00, 6174.50);
INSERT INTO `salary` VALUES (64, 30, 14, '2022-02-01', 0, 6500.00, 200.00, 100.00, 600.00, 0.00, 200.00, -520.00, -140.00, -65.00, 0.00, 0.00, -520.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -180.50, 7600.00, 6174.50);
INSERT INTO `salary` VALUES (65, 31, 11, '2022-02-01', 0, 14200.00, 200.00, 699.00, 600.00, 0.00, 200.00, -1136.00, -294.00, -142.00, 0.00, 0.00, -1136.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -1417.75, 15899.00, 11773.25);
INSERT INTO `salary` VALUES (66, 31, 11, '2022-02-01', 0, 14200.00, 200.00, 699.00, 600.00, 0.00, 200.00, -1136.00, -294.00, -142.00, 0.00, 0.00, -1136.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -1417.75, 15899.00, 11773.25);
INSERT INTO `salary` VALUES (67, 32, 20, '2022-02-01', 0, 3000.00, 200.00, 299.00, 600.00, 500.00, 200.00, -240.00, -70.00, -30.00, 0.00, 0.00, -240.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -21.57, 4799.00, 4197.43);
INSERT INTO `salary` VALUES (68, 32, 20, '2022-02-01', 0, 3000.00, 200.00, 299.00, 600.00, 500.00, 200.00, -240.00, -70.00, -30.00, 0.00, 0.00, -240.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -21.57, 4799.00, 4197.43);
INSERT INTO `salary` VALUES (69, 33, 21, '2022-02-01', 0, 11000.00, 200.00, 500.00, 600.00, 1000.00, 200.00, -880.00, -230.00, -110.00, 0.00, 0.00, -880.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -1025.00, 13500.00, 10375.00);
INSERT INTO `salary` VALUES (70, 33, 21, '2022-02-01', 0, 11000.00, 200.00, 500.00, 600.00, 1000.00, 200.00, -880.00, -230.00, -110.00, 0.00, 0.00, -880.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -1025.00, 13500.00, 10375.00);
INSERT INTO `salary` VALUES (71, 34, 14, '2022-02-01', 0, 4300.00, 200.00, 200.00, 600.00, 0.00, 200.00, -344.00, -96.00, -43.00, 0.00, 0.00, -344.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -35.19, 5500.00, 4637.81);
INSERT INTO `salary` VALUES (72, 34, 14, '2022-02-01', 0, 4300.00, 200.00, 200.00, 600.00, 0.00, 200.00, -344.00, -96.00, -43.00, 0.00, 0.00, -344.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -35.19, 5500.00, 4637.81);
INSERT INTO `salary` VALUES (73, 35, 16, '2022-02-01', 0, 4000.00, 200.00, 500.00, 600.00, 1000.00, 200.00, -320.00, -90.00, -40.00, 0.00, 0.00, -320.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -118.00, 6500.00, 5612.00);
INSERT INTO `salary` VALUES (74, 35, 16, '2022-02-01', 0, 4000.00, 200.00, 500.00, 600.00, 1000.00, 200.00, -320.00, -90.00, -40.00, 0.00, 0.00, -320.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -118.00, 6500.00, 5612.00);
INSERT INTO `salary` VALUES (75, 36, 16, '2022-02-01', 0, 16500.00, 200.00, 800.00, 600.00, 1000.00, 200.00, -1320.00, -340.00, -165.00, 0.00, 0.00, -1320.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -2158.75, 19300.00, 13996.25);
INSERT INTO `salary` VALUES (76, 36, 16, '2022-02-01', 0, 16500.00, 200.00, 800.00, 600.00, 1000.00, 200.00, -1320.00, -340.00, -165.00, 0.00, 0.00, -1320.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -2158.75, 19300.00, 13996.25);
INSERT INTO `salary` VALUES (77, 38, 10, '2022-02-01', 0, 14000.00, 200.00, 200.00, 600.00, 0.00, 200.00, -1120.00, -290.00, -140.00, 0.00, 0.00, -1120.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -1252.50, 15200.00, 11277.50);
INSERT INTO `salary` VALUES (78, 38, 10, '2022-02-01', 0, 14000.00, 200.00, 200.00, 600.00, 0.00, 200.00, -1120.00, -290.00, -140.00, 0.00, 0.00, -1120.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -1252.50, 15200.00, 11277.50);
INSERT INTO `salary` VALUES (79, 39, 22, '2022-02-01', 0, 4000.00, 200.00, 300.00, 600.00, 800.00, 200.00, -320.00, -90.00, -40.00, 0.00, 0.00, -320.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -78.00, 6100.00, 5252.00);
INSERT INTO `salary` VALUES (80, 39, 22, '2022-02-01', 0, 4000.00, 200.00, 300.00, 600.00, 800.00, 200.00, -320.00, -90.00, -40.00, 0.00, 0.00, -320.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -78.00, 6100.00, 5252.00);
INSERT INTO `salary` VALUES (81, 40, 21, '2022-02-01', 0, 6500.00, 200.00, 300.00, 600.00, 1000.00, 200.00, -520.00, -140.00, -65.00, 0.00, 0.00, -520.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -300.50, 8800.00, 7254.50);
INSERT INTO `salary` VALUES (82, 40, 21, '2022-02-01', 0, 6500.00, 200.00, 300.00, 600.00, 1000.00, 200.00, -520.00, -140.00, -65.00, 0.00, 0.00, -520.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -300.50, 8800.00, 7254.50);
INSERT INTO `salary` VALUES (83, 41, 19, '2022-02-01', 0, 5000.00, 200.00, 260.00, 600.00, 0.00, 200.00, -400.00, -110.00, -50.00, 0.00, 0.00, -400.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -75.00, 6260.00, 5225.00);
INSERT INTO `salary` VALUES (84, 41, 19, '2022-02-01', 0, 5000.00, 200.00, 260.00, 600.00, 0.00, 200.00, -400.00, -110.00, -50.00, 0.00, 0.00, -400.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -75.00, 6260.00, 5225.00);
INSERT INTO `salary` VALUES (85, 42, 11, '2022-02-01', 0, 3000.00, 200.00, 200.00, 600.00, 0.00, 200.00, -240.00, -70.00, -30.00, 0.00, 0.00, -240.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -3.60, 4200.00, 3616.40);
INSERT INTO `salary` VALUES (86, 42, 11, '2022-02-01', 0, 3000.00, 200.00, 200.00, 600.00, 0.00, 200.00, -240.00, -70.00, -30.00, 0.00, 0.00, -240.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -3.60, 4200.00, 3616.40);
INSERT INTO `salary` VALUES (87, 43, 20, '2022-02-01', 0, 1000.00, 200.00, 299.00, 600.00, 0.00, 200.00, -80.00, -30.00, -10.00, 0.00, 0.00, -80.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2299.00, 2099.00);
INSERT INTO `salary` VALUES (88, 43, 20, '2022-02-01', 0, 1000.00, 200.00, 299.00, 600.00, 0.00, 200.00, -80.00, -30.00, -10.00, 0.00, 0.00, -80.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2299.00, 2099.00);
INSERT INTO `salary` VALUES (89, 44, 21, '2022-02-01', 0, 40000.00, 200.00, 800.00, 600.00, 800.00, 200.00, -3200.00, -810.00, -400.00, 0.00, 0.00, -3200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -6867.50, 42600.00, 28122.50);
INSERT INTO `salary` VALUES (90, 44, 21, '2022-02-01', 0, 40000.00, 200.00, 800.00, 600.00, 800.00, 200.00, -3200.00, -810.00, -400.00, 0.00, 0.00, -3200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -6867.50, 42600.00, 28122.50);
INSERT INTO `salary` VALUES (91, 46, 21, '2022-02-01', 0, 2999.00, 200.00, 260.00, 100.00, 1000.00, 200.00, -239.92, -69.98, -29.99, 0.00, 0.00, -239.92, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -20.38, 4759.00, 4158.81);
INSERT INTO `salary` VALUES (92, 46, 21, '2022-02-01', 0, 2999.00, 200.00, 260.00, 100.00, 1000.00, 200.00, -239.92, -69.98, -29.99, 0.00, 0.00, -239.92, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -20.38, 4759.00, 4158.81);
INSERT INTO `salary` VALUES (93, 45, 10, '2019-09-01', 0, 39990.00, 200.00, 800.00, 0.00, 1000.00, 200.00, -3199.20, -809.80, -399.90, 0.00, 0.00, -3199.20, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -6765.48, 42190.00, 27816.43);
INSERT INTO `salary` VALUES (94, 46, 21, '2019-09-01', 0, 2999.00, 200.00, 260.00, 0.00, 1000.00, 200.00, -239.92, -69.98, -29.99, 0.00, 0.00, -239.92, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -17.38, 4659.00, 4061.81);
INSERT INTO `salary` VALUES (95, 47, 22, '2019-09-01', 0, 3999.00, 200.00, 299.00, 0.00, 2000.00, 200.00, -319.92, -89.98, -39.99, 0.00, 0.00, -319.92, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -137.82, 6698.00, 5790.37);

-- ----------------------------
-- Table structure for system_manager
-- ----------------------------
DROP TABLE IF EXISTS `system_manager`;
CREATE TABLE `system_manager`  (
  `sm_id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sm_account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账号',
  `sm_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  PRIMARY KEY (`sm_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_manager
-- ----------------------------
INSERT INTO `system_manager` VALUES (1, 'admin', 'E10ADC3949BA59ABBE56E057F20F883E');

-- ----------------------------
-- Table structure for working_years_bonus
-- ----------------------------
DROP TABLE IF EXISTS `working_years_bonus`;
CREATE TABLE `working_years_bonus`  (
  `wyb_id` int NOT NULL AUTO_INCREMENT COMMENT '工龄表主键',
  `wyb_year` int NULL DEFAULT NULL COMMENT '年份\r\n',
  `wyb_bonus` double(11, 2) NULL DEFAULT NULL COMMENT '奖金',
  PRIMARY KEY (`wyb_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of working_years_bonus
-- ----------------------------
INSERT INTO `working_years_bonus` VALUES (2, 0, 0.00);
INSERT INTO `working_years_bonus` VALUES (3, 1, 100.00);
INSERT INTO `working_years_bonus` VALUES (4, 2, 200.00);
INSERT INTO `working_years_bonus` VALUES (5, 3, 300.00);
INSERT INTO `working_years_bonus` VALUES (6, 4, 400.00);
INSERT INTO `working_years_bonus` VALUES (7, 5, 500.00);
INSERT INTO `working_years_bonus` VALUES (8, 6, 600.00);
INSERT INTO `working_years_bonus` VALUES (9, 7, 700.00);

SET FOREIGN_KEY_CHECKS = 1;
