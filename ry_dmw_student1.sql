/*
 Navicat Premium Dump SQL

 Source Server         : mysqlzdx
 Source Server Type    : MySQL
 Source Server Version : 80039 (8.0.39)
 Source Host           : localhost:3306
 Source Schema         : ry_dmw_student

 Target Server Type    : MySQL
 Target Server Version : 80039 (8.0.39)
 File Encoding         : 65001

 Date: 04/10/2025 23:30:31
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dmw_interview
-- ----------------------------
DROP TABLE IF EXISTS `dmw_interview`;
CREATE TABLE `dmw_interview`  (
  `interview_id` bigint NOT NULL AUTO_INCREMENT COMMENT '约谈ID',
  `student_id` bigint NOT NULL COMMENT '关联学生ID',
  `interview_time` datetime NULL DEFAULT NULL COMMENT '约谈时间',
  `location` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '约谈地点 (字典 dmw_interview_location)',
  `participants` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参与人员',
  `recorder` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '记录人',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '记录内容',
  `attachment_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '附件URL',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`interview_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 116 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '六困生-约谈记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dmw_interview
-- ----------------------------
INSERT INTO `dmw_interview` VALUES (109, 109, '2025-08-07 00:00:00', '2', 'sx1111', 'sx', 'fdscvv', 'http://localhost:8080/profile/upload/2025/08/31/郑东旭个人资料_20250831173057A001.zip', '', '2025-08-31 17:30:58', 'dmwxinli', '2025-10-04 16:14:21', '');
INSERT INTO `dmw_interview` VALUES (110, 107, '2025-08-06 00:00:00', '2', 'cds', 'cdfsxbv', 'dscfvc', 'http://localhost:8080/profile/upload/2025/08/31/郑东旭个人资料_20250831173108A002.zip', '', '2025-08-31 17:31:09', '', NULL, '');
INSERT INTO `dmw_interview` VALUES (111, 109, '2025-08-03 00:00:00', '4', 'dcs', 'cdsfv', 'fdvdfv', 'http://localhost:8080/profile/upload/2025/08/31/郑东旭个人资料_20250831173120A003.zip', '', '2025-08-31 17:31:21', '', NULL, '');
INSERT INTO `dmw_interview` VALUES (112, 110, '2025-10-04 00:00:00', '2', 'zdx', 'xxx', 'dexcswcxs', 'http://localhost:8080/profile/upload/2025/10/04/郑东旭个人资料_20251004074933A001.zip', '', '2025-10-04 07:49:39', '', NULL, '');
INSERT INTO `dmw_interview` VALUES (113, 110, '2025-10-05 00:00:00', '2', 'sd', 'ds', 'd', 'http://localhost:8080/profile/upload/2025/10/04/郑东旭个人资料_20251004125912A001.zip', 'dmwxinli', '2025-10-04 12:59:14', '', NULL, '');
INSERT INTO `dmw_interview` VALUES (114, 111, '2025-10-04 00:00:00', '2', '12', '5255', '252552', 'http://localhost:8080/profile/upload/2025/10/04/郑东旭个人资料_20251004130928A001.zip', 'dmwxinli', '2025-10-04 13:10:00', NULL, NULL, '');
INSERT INTO `dmw_interview` VALUES (115, 111, '2025-10-09 00:00:00', '3', 'sxsx', 'dcdccd', 'cddcd', '', '301', '2025-10-04 13:11:17', NULL, NULL, '');

-- ----------------------------
-- Table structure for dmw_status_log
-- ----------------------------
DROP TABLE IF EXISTS `dmw_status_log`;
CREATE TABLE `dmw_status_log`  (
  `log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `student_id` bigint NOT NULL COMMENT '学生ID',
  `student_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '学生姓名',
  `previous_status` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '变更前状态',
  `current_status` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '变更后状态',
  `reason` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '变更原因',
  `start_date` date NULL DEFAULT NULL COMMENT '开始日期',
  `end_date` date NULL DEFAULT NULL COMMENT '预计结束日期',
  `actual_end_date` date NULL DEFAULT NULL COMMENT '实际结束日期',
  `attachment_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '附件URL',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 107 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '学生状态变更日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dmw_status_log
-- ----------------------------
INSERT INTO `dmw_status_log` VALUES (100, 104, '李四', '01', '02', '生病', '2025-07-29', '2025-08-08', NULL, NULL, 'admin', '2025-07-29 18:35:58');
INSERT INTO `dmw_status_log` VALUES (101, 104, '李四', '02', '01', '在读咯', '2025-07-08', NULL, NULL, NULL, 'admin', '2025-07-29 18:45:40');
INSERT INTO `dmw_status_log` VALUES (102, 105, '学生名301', '01', '03', '休学咯', '2025-07-30', '2025-08-01', NULL, NULL, 'admin', '2025-07-29 18:45:58');
INSERT INTO `dmw_status_log` VALUES (103, 106, '301学生2', '01', '03', '301休学', '2025-07-29', '2025-07-31', NULL, NULL, 'admin', '2025-07-29 18:51:48');
INSERT INTO `dmw_status_log` VALUES (104, 107, '2年级学生姓名', '01', '02', 'jbhn', '2025-07-09', '2025-08-14', NULL, NULL, 'admin', '2025-08-31 17:11:55');
INSERT INTO `dmw_status_log` VALUES (105, 107, '2年级学生姓名', '02', '01', 'yf', '2026-08-31', NULL, NULL, NULL, 'admin', '2025-08-31 17:12:16');
INSERT INTO `dmw_status_log` VALUES (106, 112, '张三', '01', '02', '实习生', '2025-10-01', '2025-10-10', NULL, NULL, 'dmwxinli', '2025-10-04 19:24:26');

-- ----------------------------
-- Table structure for dmw_student
-- ----------------------------
DROP TABLE IF EXISTS `dmw_student`;
CREATE TABLE `dmw_student`  (
  `student_id` bigint NOT NULL AUTO_INCREMENT COMMENT '学生ID',
  `student_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '学生姓名',
  `id_card_no` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '身份证号',
  `dept_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '学部类型 (1=小学部 2=初中部)',
  `grade_id` bigint NULL DEFAULT NULL COMMENT '年级ID',
  `class_id` bigint NULL DEFAULT NULL COMMENT '班级ID',
  `gender` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '性别 (0=男 1=女 2=未知)',
  `is_only_child` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '是否独生 (Y=是 N=否)',
  `health_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '身体状况 (字典 dmw_health_status)',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '家庭地址',
  `family_structure` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '家庭结构 (字典 dmw_family_structure)',
  `family_atmosphere` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '家庭氛围 (字典 dmw_family_atmosphere)',
  `economic_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '经济情况 (字典 dmw_economic_status)',
  `parent_occupation` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '父母职业',
  `foster_left_behind` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '寄养和留守经历 (Y=是 N=否)',
  `self_harm_history` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '自伤自残史 (字典 dmw_self_harm_history)',
  `hardship_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '六困生类型 (字典 dmw_hardship_type)',
  `student_details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '学生详细情况说明',
  `countermeasures` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '应对措施',
  `teacher_report_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '教师上报信息',
  `student_status` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '01' COMMENT '学生状态 (01=正常 02=请长假 03=休学 04=毕业 05=转学)',
  `current_status_reason` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '当前状态原因（请假/休学）',
  `report_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '上报状态 (0=草稿 1=已上报)',
  `last_record_time` datetime NULL DEFAULT NULL COMMENT '最近一次记录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志 (0=存在 2=删除)',
  PRIMARY KEY (`student_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 113 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '六困生-学生信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dmw_student
-- ----------------------------
INSERT INTO `dmw_student` VALUES (100, '张三', '330225200204203610', '2', 4, 5, '0', 'Y', '1', '2', '2', '2', '1', '2', 'Y', '2', '5', '2', '2', '3', '02', '', '1', '2025-07-23 00:00:00', '', '2025-07-19 10:30:54', '', '2025-07-21 16:32:19', '44', '');
INSERT INTO `dmw_student` VALUES (104, '李四', '2', '1', 2, 5, '0', 'N', '1', '', '1', '1', '1', '', 'N', '0', '1', NULL, NULL, NULL, '01', '', '0', NULL, '', '2025-07-22 15:21:45', 'admin', '2025-07-30 17:24:45', '', '2');
INSERT INTO `dmw_student` VALUES (105, '学生名301', '302202', '1', 3, 1, '0', 'N', '1', '', '2', '1', '1', '', 'N', '0', '2', NULL, NULL, NULL, '03', '', '0', NULL, '', '2025-07-22 15:54:35', '', NULL, '', '2');
INSERT INTO `dmw_student` VALUES (106, '301学生2', '330225200204203666', '1', 9, 8, '0', 'Y', '1', '', '1', '2', '2', '', 'N', '1', '4', NULL, '曾多次', NULL, '03', '301休学', '0', NULL, '', '2025-07-22 16:10:01', 'dmwxinli', '2025-10-04 19:23:56', '', '0');
INSERT INTO `dmw_student` VALUES (107, '2年级学生姓名', '333', '1', 4, 2, '1', 'Y', '1', '', '1', '1', '1', '', 'N', '1', '2', NULL, NULL, NULL, '01', '', '0', NULL, '', '2025-07-30 17:17:43', 'dmwxinli', '2025-07-30 18:43:38', '', '0');
INSERT INTO `dmw_student` VALUES (108, 'ewfsdc', '3sd2356132', '1', 1, 2, '0', 'N', '1', '', '2', '2', '3', '', 'N', '2', '1', NULL, NULL, NULL, '01', '', '0', NULL, '', '2025-08-31 17:07:47', '', NULL, '', '2');
INSERT INTO `dmw_student` VALUES (109, 'dsc', '330552200205368980', '1', 3, 2, '0', 'N', '1', '', '2', '2', '2', '', 'Y', '1', '2', NULL, NULL, NULL, '01', '', '0', NULL, '', '2025-08-31 17:10:38', '', NULL, '', '0');
INSERT INTO `dmw_student` VALUES (110, '1', '330225200204203666', '1', 3, 1, '0', 'Y', '1', '', '2', '2', '1', '', 'Y', '0', '2', NULL, NULL, NULL, '01', '', '0', NULL, '', '2025-10-04 07:39:30', '', NULL, '', '2');
INSERT INTO `dmw_student` VALUES (111, '十月四日', '330225200202303623', '1', 5, 1, '0', 'Y', '1', '', '1', '1', '2', '', 'Y', '0', '4', NULL, NULL, NULL, '01', '', '0', NULL, '', '2025-10-04 13:08:53', 'dmwxinli', '2025-10-04 19:57:49', '', '0');
INSERT INTO `dmw_student` VALUES (112, '张三', '330225200204203610', '2', 1, 2, '0', 'Y', '1', '', '1', '2', '1', '', 'Y', '0', '5', NULL, NULL, NULL, '02', '实习生', '0', NULL, '', '2025-10-04 16:07:24', 'dmwxinli', '2025-10-04 19:24:26', '', '0');

-- ----------------------------
-- Table structure for dmw_student_log
-- ----------------------------
DROP TABLE IF EXISTS `dmw_student_log`;
CREATE TABLE `dmw_student_log`  (
  `log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `student_id` bigint NOT NULL COMMENT '学生ID',
  `change_field` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '变更字段',
  `previous_value` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '变更前内容',
  `current_value` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '变更后内容',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '学生信息变更日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of dmw_student_log
-- ----------------------------
INSERT INTO `dmw_student_log` VALUES (1, 106, 'hardship_type', '1', '4', 'dmwxinli', '2025-10-04 19:23:56');
INSERT INTO `dmw_student_log` VALUES (2, 112, 'hardship_type', '3', '5', 'dmwxinli', '2025-10-04 19:24:06');
INSERT INTO `dmw_student_log` VALUES (3, 112, 'student_status', '01', '02', 'dmwxinli', '2025-10-04 19:24:26');

-- ----------------------------
-- Table structure for dmw_teacher_class
-- ----------------------------
DROP TABLE IF EXISTS `dmw_teacher_class`;
CREATE TABLE `dmw_teacher_class`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` bigint NOT NULL COMMENT '教师用户ID (关联sys_user)',
  `grade_id` int NOT NULL COMMENT '年级ID',
  `class_id` int NOT NULL COMMENT '班级ID',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_user_grade_class`(`user_id` ASC, `grade_id` ASC, `class_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '教师任教班级关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dmw_teacher_class
-- ----------------------------
INSERT INTO `dmw_teacher_class` VALUES (100, 100, 3, 1, '', '2025-07-22 14:49:18', '', '2025-10-04 20:58:52', '');
INSERT INTO `dmw_teacher_class` VALUES (101, 101, 3, 2, '', '2025-07-22 14:49:31', '', NULL, '');

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'dmw_student', '六困生-学生信息表', NULL, NULL, 'DmwStudent', 'crud', 'element-plus', 'com.ruoyi.dmw', 'dmw', 'student', '六困生-学生信息', 'zdx', '0', '/', '{\"parentMenuId\":1}', 'admin', '2025-07-17 17:55:42', '', '2025-07-17 18:04:41', NULL);
INSERT INTO `gen_table` VALUES (2, 'dmw_interview', '六困生-约谈记录表', NULL, NULL, 'DmwInterview', 'crud', 'element-plus', 'com.ruoyi.dmw', 'dmw', 'interview', '六困生-约谈记录', 'zdx', '0', '/', '{}', 'admin', '2025-07-19 13:44:24', '', '2025-07-19 13:45:54', NULL);
INSERT INTO `gen_table` VALUES (3, 'dmw_teacher_class', '教师任教班级关联表', NULL, NULL, 'DmwTeacherClass', 'crud', 'element-plus', 'com.ruoyi.dmw', 'dmw', 'teach', '教师任教管理', 'ruoyi', '0', '/', '{\"parentMenuId\":2000}', 'admin', '2025-07-22 14:27:44', '', '2025-07-22 15:02:14', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, 1, 'student_id', '学生ID', 'bigint', 'Long', 'studentId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-07-17 17:55:42', '', '2025-07-17 18:04:41');
INSERT INTO `gen_table_column` VALUES (2, 1, 'student_name', '学生姓名', 'varchar(30)', 'String', 'studentName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2025-07-17 17:55:42', '', '2025-07-17 18:04:41');
INSERT INTO `gen_table_column` VALUES (3, 1, 'id_card_no', '身份证号', 'varchar(18)', 'String', 'idCardNo', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2025-07-17 17:55:42', '', '2025-07-17 18:04:41');
INSERT INTO `gen_table_column` VALUES (4, 1, 'dept_type', '学部类型 (1=小学部 2=初中部)', 'char(1)', 'String', 'deptType', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', 'dmw_dept_type', 4, 'admin', '2025-07-17 17:55:42', '', '2025-07-17 18:04:41');
INSERT INTO `gen_table_column` VALUES (5, 1, 'grade_id', '年级ID', 'bigint', 'Long', 'gradeId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2025-07-17 17:55:42', '', '2025-07-17 18:04:41');
INSERT INTO `gen_table_column` VALUES (6, 1, 'class_id', '班级ID', 'bigint', 'Long', 'classId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2025-07-17 17:55:42', '', '2025-07-17 18:04:41');
INSERT INTO `gen_table_column` VALUES (7, 1, 'gender', '性别 (0=男 1=女 2=未知)', 'char(1)', 'String', 'gender', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', 'sys_user_sex', 7, 'admin', '2025-07-17 17:55:42', '', '2025-07-17 18:04:41');
INSERT INTO `gen_table_column` VALUES (8, 1, 'is_only_child', '是否独生 (Y=是 N=否)', 'char(1)', 'String', 'isOnlyChild', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', 'dmw_yes_no', 8, 'admin', '2025-07-17 17:55:42', '', '2025-07-17 18:04:41');
INSERT INTO `gen_table_column` VALUES (9, 1, 'health_status', '身体状况 (字典 dmw_health_status)', 'char(1)', 'String', 'healthStatus', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', 'dmw_health_status', 9, 'admin', '2025-07-17 17:55:42', '', '2025-07-17 18:04:41');
INSERT INTO `gen_table_column` VALUES (10, 1, 'address', '家庭地址', 'varchar(255)', 'String', 'address', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2025-07-17 17:55:42', '', '2025-07-17 18:04:41');
INSERT INTO `gen_table_column` VALUES (11, 1, 'family_structure', '家庭结构 (字典 dmw_family_structure)', 'char(1)', 'String', 'familyStructure', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', 'dmw_family_structure', 11, 'admin', '2025-07-17 17:55:42', '', '2025-07-17 18:04:41');
INSERT INTO `gen_table_column` VALUES (12, 1, 'family_atmosphere', '家庭氛围 (字典 dmw_family_atmosphere)', 'char(1)', 'String', 'familyAtmosphere', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', 'dmw_family_atmosphere', 12, 'admin', '2025-07-17 17:55:42', '', '2025-07-17 18:04:41');
INSERT INTO `gen_table_column` VALUES (13, 1, 'economic_status', '经济情况 (字典 dmw_economic_status)', 'char(1)', 'String', 'economicStatus', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', 'dmw_economic_status', 13, 'admin', '2025-07-17 17:55:42', '', '2025-07-17 18:04:41');
INSERT INTO `gen_table_column` VALUES (14, 1, 'parent_occupation', '父母职业', 'varchar(100)', 'String', 'parentOccupation', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 14, 'admin', '2025-07-17 17:55:42', '', '2025-07-17 18:04:41');
INSERT INTO `gen_table_column` VALUES (15, 1, 'foster_left_behind', '寄养和留守经历 (Y=是 N=否)', 'char(1)', 'String', 'fosterLeftBehind', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', 'dmw_yes_no', 15, 'admin', '2025-07-17 17:55:42', '', '2025-07-17 18:04:41');
INSERT INTO `gen_table_column` VALUES (16, 1, 'self_harm_history', '自伤自残史 (字典 dmw_self_harm_history)', 'char(1)', 'String', 'selfHarmHistory', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', 'dmw_self_harm_history', 16, 'admin', '2025-07-17 17:55:42', '', '2025-07-17 18:04:41');
INSERT INTO `gen_table_column` VALUES (17, 1, 'hardship_type', '六困生类型 (字典 dmw_hardship_type)', 'char(1)', 'String', 'hardshipType', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', 'dmw_hardship_type', 17, 'admin', '2025-07-17 17:55:42', '', '2025-07-17 18:04:41');
INSERT INTO `gen_table_column` VALUES (18, 1, 'student_details', '学生详细情况说明', 'text', 'String', 'studentDetails', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 18, 'admin', '2025-07-17 17:55:42', '', '2025-07-17 18:04:41');
INSERT INTO `gen_table_column` VALUES (19, 1, 'countermeasures', '应对措施', 'text', 'String', 'countermeasures', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 19, 'admin', '2025-07-17 17:55:42', '', '2025-07-17 18:04:41');
INSERT INTO `gen_table_column` VALUES (20, 1, 'teacher_report_info', '教师上报信息', 'text', 'String', 'teacherReportInfo', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 20, 'admin', '2025-07-17 17:55:42', '', '2025-07-17 18:04:41');
INSERT INTO `gen_table_column` VALUES (21, 1, 'student_status', '学生状态 (01=正常 02=请长假 03=休学 04=毕业 05=转学)', 'char(2)', 'String', 'studentStatus', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', 'dmw_student_status', 21, 'admin', '2025-07-17 17:55:42', '', '2025-07-17 18:04:41');
INSERT INTO `gen_table_column` VALUES (22, 1, 'report_status', '上报状态 (0=草稿 1=已上报)', 'char(1)', 'String', 'reportStatus', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', 'dmw_report_status', 22, 'admin', '2025-07-17 17:55:42', '', '2025-07-17 18:04:41');
INSERT INTO `gen_table_column` VALUES (23, 1, 'last_record_time', '最近一次记录时间', 'datetime', 'Date', 'lastRecordTime', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 23, 'admin', '2025-07-17 17:55:42', '', '2025-07-17 18:04:41');
INSERT INTO `gen_table_column` VALUES (24, 1, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 24, 'admin', '2025-07-17 17:55:42', '', '2025-07-17 18:04:41');
INSERT INTO `gen_table_column` VALUES (25, 1, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 25, 'admin', '2025-07-17 17:55:42', '', '2025-07-17 18:04:41');
INSERT INTO `gen_table_column` VALUES (26, 1, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 26, 'admin', '2025-07-17 17:55:42', '', '2025-07-17 18:04:41');
INSERT INTO `gen_table_column` VALUES (27, 1, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 27, 'admin', '2025-07-17 17:55:42', '', '2025-07-17 18:04:41');
INSERT INTO `gen_table_column` VALUES (28, 1, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 28, 'admin', '2025-07-17 17:55:42', '', '2025-07-17 18:04:41');
INSERT INTO `gen_table_column` VALUES (29, 1, 'del_flag', '删除标志 (0=存在 2=删除)', 'char(1)', 'String', 'delFlag', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 29, 'admin', '2025-07-17 17:55:42', '', '2025-07-17 18:04:41');
INSERT INTO `gen_table_column` VALUES (30, 2, 'interview_id', '约谈ID', 'bigint', 'Long', 'interviewId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-07-19 13:44:24', '', '2025-07-19 13:45:54');
INSERT INTO `gen_table_column` VALUES (31, 2, 'student_id', '关联学生ID', 'bigint', 'Long', 'studentId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-07-19 13:44:24', '', '2025-07-19 13:45:54');
INSERT INTO `gen_table_column` VALUES (32, 2, 'interview_time', '约谈时间', 'datetime', 'Date', 'interviewTime', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 3, 'admin', '2025-07-19 13:44:24', '', '2025-07-19 13:45:54');
INSERT INTO `gen_table_column` VALUES (33, 2, 'location', '约谈地点 (字典 dmw_interview_location)', 'varchar(100)', 'String', 'location', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', 'dmw_interview_location', 4, 'admin', '2025-07-19 13:44:24', '', '2025-07-19 13:45:54');
INSERT INTO `gen_table_column` VALUES (34, 2, 'participants', '参与人员', 'varchar(255)', 'String', 'participants', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2025-07-19 13:44:24', '', '2025-07-19 13:45:54');
INSERT INTO `gen_table_column` VALUES (35, 2, 'recorder', '记录人', 'varchar(64)', 'String', 'recorder', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2025-07-19 13:44:24', '', '2025-07-19 13:45:54');
INSERT INTO `gen_table_column` VALUES (36, 2, 'content', '记录内容', 'text', 'String', 'content', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 7, 'admin', '2025-07-19 13:44:24', '', '2025-07-19 13:45:54');
INSERT INTO `gen_table_column` VALUES (37, 2, 'attachment_url', '附件URL', 'varchar(255)', 'String', 'attachmentUrl', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2025-07-19 13:44:24', '', '2025-07-19 13:45:54');
INSERT INTO `gen_table_column` VALUES (38, 2, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2025-07-19 13:44:24', '', '2025-07-19 13:45:54');
INSERT INTO `gen_table_column` VALUES (39, 2, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2025-07-19 13:44:24', '', '2025-07-19 13:45:54');
INSERT INTO `gen_table_column` VALUES (40, 2, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2025-07-19 13:44:24', '', '2025-07-19 13:45:54');
INSERT INTO `gen_table_column` VALUES (41, 2, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2025-07-19 13:44:24', '', '2025-07-19 13:45:54');
INSERT INTO `gen_table_column` VALUES (42, 2, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 13, 'admin', '2025-07-19 13:44:24', '', '2025-07-19 13:45:54');
INSERT INTO `gen_table_column` VALUES (43, 3, 'id', '主键ID', 'bigint', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-07-22 14:27:44', '', '2025-07-22 15:02:14');
INSERT INTO `gen_table_column` VALUES (44, 3, 'user_id', '教师用户ID (关联sys_user)', 'bigint', 'Long', 'userId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-07-22 14:27:44', '', '2025-07-22 15:02:14');
INSERT INTO `gen_table_column` VALUES (45, 3, 'grade_id', '年级ID', 'int', 'Long', 'gradeId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2025-07-22 14:27:44', '', '2025-07-22 15:02:14');
INSERT INTO `gen_table_column` VALUES (46, 3, 'class_id', '班级ID', 'int', 'Long', 'classId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2025-07-22 14:27:44', '', '2025-07-22 15:02:14');
INSERT INTO `gen_table_column` VALUES (47, 3, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 5, 'admin', '2025-07-22 14:27:44', '', '2025-07-22 15:02:14');
INSERT INTO `gen_table_column` VALUES (48, 3, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 6, 'admin', '2025-07-22 14:27:44', '', '2025-07-22 15:02:14');
INSERT INTO `gen_table_column` VALUES (49, 3, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2025-07-22 14:27:44', '', '2025-07-22 15:02:14');
INSERT INTO `gen_table_column` VALUES (50, 3, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2025-07-22 14:27:44', '', '2025-07-22 15:02:14');
INSERT INTO `gen_table_column` VALUES (51, 3, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 9, 'admin', '2025-07-22 14:27:44', '', '2025-07-22 15:02:14');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '日历信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '已触发的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '暂停的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '调度器状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name` ASC, `job_name` ASC, `job_group` ASC) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2025-07-17 13:18:18', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2025-07-17 13:18:18', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2025-07-17 13:18:18', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2025-07-17 13:18:18', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2025-07-17 13:18:18', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2025-07-17 13:18:18', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');
INSERT INTO `sys_config` VALUES (7, '用户管理-初始密码修改策略', 'sys.account.initPasswordModify', '1', 'Y', 'admin', '2025-07-17 13:18:18', '', NULL, '0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (8, '用户管理-账号密码更新周期', 'sys.account.passwordValidateDays', '0', 'Y', 'admin', '2025-07-17 13:18:18', '', NULL, '密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-07-17 13:18:17', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-07-17 13:18:17', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-07-17 13:18:17', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-07-17 13:18:17', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-07-17 13:18:17', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-07-17 13:18:17', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-07-17 13:18:17', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-07-17 13:18:17', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-07-17 13:18:17', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-07-17 13:18:17', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1038 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2025-07-17 13:18:17', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2025-07-17 13:18:17', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2025-07-17 13:18:17', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2025-07-17 13:18:17', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2025-07-17 13:18:17', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2025-07-17 13:18:17', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2025-07-17 13:18:17', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2025-07-17 13:18:17', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2025-07-17 13:18:17', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2025-07-17 13:18:17', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2025-07-17 13:18:17', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2025-07-17 13:18:17', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2025-07-17 13:18:17', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2025-07-17 13:18:17', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2025-07-17 13:18:17', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2025-07-17 13:18:17', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2025-07-17 13:18:17', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-07-17 13:18:17', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-07-17 13:18:17', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-07-17 13:18:17', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-07-17 13:18:17', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2025-07-17 13:18:17', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-07-17 13:18:17', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-07-17 13:18:17', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-07-17 13:18:17', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-07-17 13:18:17', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-07-17 13:18:17', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2025-07-17 13:18:17', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2025-07-17 13:18:17', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (1001, 1, '小学部', '1', 'dmw_dept_type', '', '', 'Y', '0', 'admin', '2025-07-17 17:51:25', 'admin', '2025-07-17 17:51:25', '小学部');
INSERT INTO `sys_dict_data` VALUES (1002, 2, '初中部', '2', 'dmw_dept_type', '', '', 'N', '0', 'admin', '2025-07-17 17:51:25', 'admin', '2025-07-17 17:51:25', '初中部');
INSERT INTO `sys_dict_data` VALUES (1003, 1, '良好', '1', 'dmw_health_status', 'primary', '', 'Y', '0', 'admin', '2025-07-17 17:51:25', 'admin', '2025-07-17 17:51:25', '身体状况良好');
INSERT INTO `sys_dict_data` VALUES (1004, 2, '差', '2', 'dmw_health_status', 'danger', '', 'N', '0', 'admin', '2025-07-17 17:51:25', 'admin', '2025-07-17 17:51:25', '身体状况差');
INSERT INTO `sys_dict_data` VALUES (1005, 1, '完整', '1', 'dmw_family_structure', '', '', 'Y', '0', 'admin', '2025-07-17 17:51:25', 'admin', '2025-07-17 17:51:25', '家庭结构完整');
INSERT INTO `sys_dict_data` VALUES (1006, 2, '单亲', '2', 'dmw_family_structure', '', '', 'N', '0', 'admin', '2025-07-17 17:51:25', 'admin', '2025-07-17 17:51:25', '家庭结构单亲');
INSERT INTO `sys_dict_data` VALUES (1007, 3, '重组', '3', 'dmw_family_structure', '', '', 'N', '0', 'admin', '2025-07-17 17:51:25', 'admin', '2025-07-17 17:51:25', '家庭结构重组');
INSERT INTO `sys_dict_data` VALUES (1008, 4, '孤儿', '4', 'dmw_family_structure', '', '', 'N', '0', 'admin', '2025-07-17 17:51:25', 'admin', '2025-07-17 17:51:25', '孤儿');
INSERT INTO `sys_dict_data` VALUES (1009, 1, '权威', '1', 'dmw_family_atmosphere', '', '', 'Y', '0', 'admin', '2025-07-17 17:51:25', 'admin', '2025-07-17 17:51:25', '家庭氛围权威');
INSERT INTO `sys_dict_data` VALUES (1010, 2, '民主', '2', 'dmw_family_atmosphere', '', '', 'N', '0', 'admin', '2025-07-17 17:51:25', 'admin', '2025-07-17 17:51:25', '家庭氛围民主');
INSERT INTO `sys_dict_data` VALUES (1011, 3, '放纵', '3', 'dmw_family_atmosphere', '', '', 'N', '0', 'admin', '2025-07-17 17:51:25', 'admin', '2025-07-17 17:51:25', '家庭氛围放纵');
INSERT INTO `sys_dict_data` VALUES (1012, 4, '其它', '4', 'dmw_family_atmosphere', '', '', 'N', '0', 'admin', '2025-07-17 17:51:25', 'admin', '2025-07-17 17:51:25', '家庭氛围其它');
INSERT INTO `sys_dict_data` VALUES (1013, 1, '不佳', '1', 'dmw_economic_status', 'danger', '', 'Y', '0', 'admin', '2025-07-17 17:51:25', 'admin', '2025-07-17 17:51:25', '经济情况不佳');
INSERT INTO `sys_dict_data` VALUES (1014, 2, '一般', '2', 'dmw_economic_status', 'warning', '', 'N', '0', 'admin', '2025-07-17 17:51:25', 'admin', '2025-07-17 17:51:25', '经济情况一般');
INSERT INTO `sys_dict_data` VALUES (1015, 3, '好', '3', 'dmw_economic_status', 'primary', '', 'N', '0', 'admin', '2025-07-17 17:51:25', 'admin', '2025-07-17 17:51:25', '经济情况好');
INSERT INTO `sys_dict_data` VALUES (1016, 1, '无', '0', 'dmw_self_harm_history', 'primary', '', 'Y', '0', 'admin', '2025-07-17 17:51:25', 'admin', '2025-07-17 17:51:25', '无自伤自残史');
INSERT INTO `sys_dict_data` VALUES (1017, 2, '有且未接受干预', '1', 'dmw_self_harm_history', 'danger', '', 'N', '0', 'admin', '2025-07-17 17:51:25', 'admin', '2025-07-17 17:51:25', '有且未接受干预');
INSERT INTO `sys_dict_data` VALUES (1018, 3, '有且已接受干预', '2', 'dmw_self_harm_history', 'warning', '', 'N', '0', 'admin', '2025-07-17 17:51:25', 'admin', '2025-07-17 17:51:25', '有且已接受干预');
INSERT INTO `sys_dict_data` VALUES (1019, 1, '特困生', '1', 'dmw_hardship_type', '', '', 'N', '0', 'admin', '2025-07-17 17:51:25', 'admin', '2025-07-17 17:51:25', '经济困难生');
INSERT INTO `sys_dict_data` VALUES (1020, 2, '学困生', '2', 'dmw_hardship_type', '', '', 'N', '0', 'admin', '2025-07-17 17:51:25', 'admin', '2025-07-17 17:51:25', '学习困难生');
INSERT INTO `sys_dict_data` VALUES (1021, 3, '心困生', '3', 'dmw_hardship_type', '', '', 'N', '0', 'admin', '2025-07-17 17:51:25', 'admin', '2025-07-17 17:51:25', '心理问题生');
INSERT INTO `sys_dict_data` VALUES (1022, 4, '德困生', '4', 'dmw_hardship_type', '', '', 'N', '0', 'admin', '2025-07-17 17:51:25', 'admin', '2025-07-17 17:51:25', '品德问题生');
INSERT INTO `sys_dict_data` VALUES (1023, 5, '身困生', '5', 'dmw_hardship_type', '', '', 'N', '0', 'admin', '2025-07-17 17:51:25', 'admin', '2025-07-17 17:51:25', '身体问题生');
INSERT INTO `sys_dict_data` VALUES (1024, 6, '境困生', '6', 'dmw_hardship_type', '', '', 'N', '0', 'admin', '2025-07-17 17:51:25', 'admin', '2025-07-17 17:51:25', '环境问题生');
INSERT INTO `sys_dict_data` VALUES (1025, 1, '正常', '01', 'dmw_student_status', 'primary', '', 'Y', '0', 'admin', '2025-07-17 17:51:25', 'admin', '2025-07-17 17:51:25', '正常在校');
INSERT INTO `sys_dict_data` VALUES (1026, 2, '请长假', '02', 'dmw_student_status', 'warning', '', 'N', '0', 'admin', '2025-07-17 17:51:25', 'admin', '2025-07-17 17:51:25', '长期请假');
INSERT INTO `sys_dict_data` VALUES (1027, 3, '休学', '03', 'dmw_student_status', 'danger', '', 'N', '0', 'admin', '2025-07-17 17:51:25', 'admin', '2025-07-17 17:51:25', '休学');
INSERT INTO `sys_dict_data` VALUES (1028, 4, '毕业', '04', 'dmw_student_status', 'info', '', 'N', '0', 'admin', '2025-07-17 17:51:25', 'admin', '2025-07-17 17:51:25', '已毕业');
INSERT INTO `sys_dict_data` VALUES (1029, 5, '转学', '05', 'dmw_student_status', 'info', '', 'N', '0', 'admin', '2025-07-17 17:51:25', 'admin', '2025-07-17 17:51:25', '已转学');
INSERT INTO `sys_dict_data` VALUES (1030, 1, '草稿', '0', 'dmw_report_status', 'warning', '', 'Y', '0', 'admin', '2025-07-17 17:51:25', 'admin', '2025-07-17 17:51:25', '信息未上报');
INSERT INTO `sys_dict_data` VALUES (1031, 2, '已上报', '1', 'dmw_report_status', 'primary', '', 'N', '0', 'admin', '2025-07-17 17:51:25', 'admin', '2025-07-17 17:51:25', '信息已上报');
INSERT INTO `sys_dict_data` VALUES (1032, 1, '是', 'Y', 'dmw_yes_no', '', '', 'Y', '0', 'admin', '2025-07-17 17:51:25', 'admin', '2025-07-17 17:51:25', '是');
INSERT INTO `sys_dict_data` VALUES (1033, 2, '否', 'N', 'dmw_yes_no', '', '', 'N', '0', 'admin', '2025-07-17 17:51:25', 'admin', '2025-07-17 17:51:25', '否');
INSERT INTO `sys_dict_data` VALUES (1034, 1, '家', '1', 'dmw_interview_location', '', '', 'Y', '0', 'admin', '2025-07-19 13:43:25', 'admin', '2025-07-19 13:43:25', '家');
INSERT INTO `sys_dict_data` VALUES (1035, 2, '学校', '2', 'dmw_interview_location', '', '', 'N', '0', 'admin', '2025-07-19 13:43:25', 'admin', '2025-07-19 13:43:25', '学校');
INSERT INTO `sys_dict_data` VALUES (1036, 3, '线上', '3', 'dmw_interview_location', '', '', 'N', '0', 'admin', '2025-07-19 13:43:25', 'admin', '2025-07-19 13:43:25', '线上');
INSERT INTO `sys_dict_data` VALUES (1037, 4, '其它', '4', 'dmw_interview_location', '', '', 'N', '0', 'admin', '2025-07-19 13:43:25', 'admin', '2025-07-19 13:43:25', '其它');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 112 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2025-07-17 13:18:17', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2025-07-17 13:18:17', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2025-07-17 13:18:17', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2025-07-17 13:18:17', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2025-07-17 13:18:17', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2025-07-17 13:18:17', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2025-07-17 13:18:17', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2025-07-17 13:18:17', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2025-07-17 13:18:17', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2025-07-17 13:18:17', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (101, '学部类型', 'dmw_dept_type', '0', 'admin', '2025-07-17 17:51:25', 'admin', '2025-07-17 17:51:25', '学部类型列表');
INSERT INTO `sys_dict_type` VALUES (102, '身体状况', 'dmw_health_status', '0', 'admin', '2025-07-17 17:51:25', 'admin', '2025-07-17 17:51:25', '身体状况列表');
INSERT INTO `sys_dict_type` VALUES (103, '家庭结构', 'dmw_family_structure', '0', 'admin', '2025-07-17 17:51:25', 'admin', '2025-07-17 17:51:25', '家庭结构列表');
INSERT INTO `sys_dict_type` VALUES (104, '家庭氛围', 'dmw_family_atmosphere', '0', 'admin', '2025-07-17 17:51:25', 'admin', '2025-07-17 17:51:25', '家庭氛围列表');
INSERT INTO `sys_dict_type` VALUES (105, '经济情况', 'dmw_economic_status', '0', 'admin', '2025-07-17 17:51:25', 'admin', '2025-07-17 17:51:25', '经济情况列表');
INSERT INTO `sys_dict_type` VALUES (106, '自伤自残史', 'dmw_self_harm_history', '0', 'admin', '2025-07-17 17:51:25', 'admin', '2025-07-17 17:51:25', '自伤自残史列表');
INSERT INTO `sys_dict_type` VALUES (107, '六困生类型', 'dmw_hardship_type', '0', 'admin', '2025-07-17 17:51:25', 'admin', '2025-07-17 17:51:25', '六困生类型列表');
INSERT INTO `sys_dict_type` VALUES (108, '学生状态', 'dmw_student_status', '0', 'admin', '2025-07-17 17:51:25', 'admin', '2025-07-17 17:51:25', '学生当前状态列表');
INSERT INTO `sys_dict_type` VALUES (109, '上报状态', 'dmw_report_status', '0', 'admin', '2025-07-17 17:51:25', 'admin', '2025-07-17 17:51:25', '上报状态列表');
INSERT INTO `sys_dict_type` VALUES (110, '是否选项', 'dmw_yes_no', '0', 'admin', '2025-07-17 17:51:25', 'admin', '2025-07-17 17:51:25', '通用是否选项');
INSERT INTO `sys_dict_type` VALUES (111, '约谈地点', 'dmw_interview_location', '0', 'admin', '2025-07-19 13:43:25', 'admin', '2025-07-19 13:43:25', '约谈地点列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2025-07-17 13:18:18', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2025-07-17 13:18:18', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2025-07-17 13:18:18', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 153 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-07-17 13:22:04');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-07-17 17:52:24');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-07-19 10:14:31');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-07-19 12:34:01');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-07-19 13:43:55');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-07-19 16:17:04');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-07-20 13:51:08');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-07-21 16:30:51');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-07-22 14:27:21');
INSERT INTO `sys_logininfor` VALUES (109, '301', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-22 15:14:17');
INSERT INTO `sys_logininfor` VALUES (110, '302', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-22 15:15:49');
INSERT INTO `sys_logininfor` VALUES (111, '302', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-07-22 15:22:08');
INSERT INTO `sys_logininfor` VALUES (112, '301', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-22 15:22:47');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-07-29 17:11:47');
INSERT INTO `sys_logininfor` VALUES (114, '301', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-29 17:20:03');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-07-29 18:17:39');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-07-30 17:14:04');
INSERT INTO `sys_logininfor` VALUES (117, 'dmwxinli', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '用户不存在/密码错误', '2025-07-30 18:33:57');
INSERT INTO `sys_logininfor` VALUES (118, 'dmwxinli', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '用户不存在/密码错误', '2025-07-30 18:34:16');
INSERT INTO `sys_logininfor` VALUES (119, 'dmwxinli', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-30 18:34:23');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2025-08-31 16:01:11');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-08-31 16:01:15');
INSERT INTO `sys_logininfor` VALUES (122, '301', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-08-31 16:25:18');
INSERT INTO `sys_logininfor` VALUES (123, 'psychologist', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '用户不存在/密码错误', '2025-08-31 17:43:05');
INSERT INTO `sys_logininfor` VALUES (124, 'psychologist', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '用户不存在/密码错误', '2025-08-31 17:43:13');
INSERT INTO `sys_logininfor` VALUES (125, 'psychologist', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '用户不存在/密码错误', '2025-08-31 17:43:26');
INSERT INTO `sys_logininfor` VALUES (126, 'dmwxinli', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-08-31 17:43:57');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-10-01 08:51:21');
INSERT INTO `sys_logininfor` VALUES (128, '301', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-10-01 08:53:43');
INSERT INTO `sys_logininfor` VALUES (129, '301', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-10-01 08:54:24');
INSERT INTO `sys_logininfor` VALUES (130, 'dmwxinli', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-10-01 08:55:25');
INSERT INTO `sys_logininfor` VALUES (131, 'dmwxinli', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-10-04 07:25:12');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-10-04 07:28:58');
INSERT INTO `sys_logininfor` VALUES (133, 'dmwxinli', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-10-04 07:30:22');
INSERT INTO `sys_logininfor` VALUES (134, 'dmwxinli', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-10-04 07:30:36');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2025-10-04 07:38:27');
INSERT INTO `sys_logininfor` VALUES (136, '301', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-10-04 07:38:39');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-10-04 12:58:23');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-10-04 12:58:29');
INSERT INTO `sys_logininfor` VALUES (139, 'dmwxinli', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-10-04 12:58:43');
INSERT INTO `sys_logininfor` VALUES (140, '301', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-10-04 12:59:31');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '验证码错误', '2025-10-04 14:08:38');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-10-04 14:08:45');
INSERT INTO `sys_logininfor` VALUES (143, 'dmwxinli', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-10-04 15:49:54');
INSERT INTO `sys_logininfor` VALUES (144, '301', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-10-04 16:15:02');
INSERT INTO `sys_logininfor` VALUES (145, 'dmwxinli', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-10-04 17:23:22');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2025-10-04 18:15:39');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-10-04 18:15:43');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-10-04 18:20:30');
INSERT INTO `sys_logininfor` VALUES (149, 'dmwxinli', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-10-04 19:52:00');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-10-04 20:19:22');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2025-10-04 20:27:37');
INSERT INTO `sys_logininfor` VALUES (152, '301', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-10-04 20:27:51');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `route_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '路由名称',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2022 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2025-07-17 13:18:17', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2025-07-17 13:18:17', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2025-07-17 13:18:17', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 4, 'http://ruoyi.vip', NULL, '', '', 0, 0, 'M', '0', '0', '', 'guide', 'admin', '2025-07-17 13:18:17', '', NULL, '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2025-07-17 13:18:17', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2025-07-17 13:18:17', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2025-07-17 13:18:17', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2025-07-17 13:18:17', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2025-07-17 13:18:17', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2025-07-17 13:18:17', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2025-07-17 13:18:17', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2025-07-17 13:18:17', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2025-07-17 13:18:17', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2025-07-17 13:18:17', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2025-07-17 13:18:17', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2025-07-17 13:18:17', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2025-07-17 13:18:17', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2025-07-17 13:18:17', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2025-07-17 13:18:17', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2025-07-17 13:18:17', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2025-07-17 13:18:17', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2025-07-17 13:18:17', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2025-07-17 13:18:17', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2025-07-17 13:18:17', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2025-07-17 13:18:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2025-07-17 13:18:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2025-07-17 13:18:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2025-07-17 13:18:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2025-07-17 13:18:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2025-07-17 13:18:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2025-07-17 13:18:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2025-07-17 13:18:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2025-07-17 13:18:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2025-07-17 13:18:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2025-07-17 13:18:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2025-07-17 13:18:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2025-07-17 13:18:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2025-07-17 13:18:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2025-07-17 13:18:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2025-07-17 13:18:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2025-07-17 13:18:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2025-07-17 13:18:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2025-07-17 13:18:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2025-07-17 13:18:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2025-07-17 13:18:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2025-07-17 13:18:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2025-07-17 13:18:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2025-07-17 13:18:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2025-07-17 13:18:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2025-07-17 13:18:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2025-07-17 13:18:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2025-07-17 13:18:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2025-07-17 13:18:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2025-07-17 13:18:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2025-07-17 13:18:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2025-07-17 13:18:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2025-07-17 13:18:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2025-07-17 13:18:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2025-07-17 13:18:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2025-07-17 13:18:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2025-07-17 13:18:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2025-07-17 13:18:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2025-07-17 13:18:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2025-07-17 13:18:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2025-07-17 13:18:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2025-07-17 13:18:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2025-07-17 13:18:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2025-07-17 13:18:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2025-07-17 13:18:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2025-07-17 13:18:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2025-07-17 13:18:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2025-07-17 13:18:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2025-07-17 13:18:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2025-07-17 13:18:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2025-07-17 13:18:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2025-07-17 13:18:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2025-07-17 13:18:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2025-07-17 13:18:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2025-07-17 13:18:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2025-07-17 13:18:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2025-07-17 13:18:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2025-07-17 13:18:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2025-07-17 13:18:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2025-07-17 13:18:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2025-07-17 13:18:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '学生工作管理', 0, 1, 'dmw', NULL, NULL, '', 1, 0, 'M', '0', '0', NULL, 'button', 'admin', '2025-07-19 10:24:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2001, '学生信息管理', 2000, 1, 'student', 'dmw/student/index', NULL, '', 1, 0, 'C', '0', '0', 'dmw:student:list', '#', 'admin', '2025-07-19 10:25:46', 'admin', '2025-07-22 15:44:15', '');
INSERT INTO `sys_menu` VALUES (2002, '六困生-约谈记录', 2000, 1, 'interview', 'dmw/interview/index', NULL, '', 1, 0, 'C', '0', '0', 'dmw:interview:list', '#', 'admin', '2025-07-19 16:37:42', 'admin', '2025-07-19 16:40:17', '六困生-约谈记录菜单');
INSERT INTO `sys_menu` VALUES (2003, '六困生-约谈记录查询', 2002, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'dmw:interview:query', '#', 'admin', '2025-07-19 16:37:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2004, '六困生-约谈记录新增', 2002, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'dmw:interview:add', '#', 'admin', '2025-07-19 16:37:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2005, '六困生-约谈记录修改', 2002, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'dmw:interview:edit', '#', 'admin', '2025-07-19 16:37:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2006, '六困生-约谈记录删除', 2002, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'dmw:interview:remove', '#', 'admin', '2025-07-19 16:37:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2007, '六困生-约谈记录导出', 2002, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'dmw:interview:export', '#', 'admin', '2025-07-19 16:37:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2008, '教师任教管理', 2000, 1, 'teach', 'dmw/teach/index', NULL, '', 1, 0, 'C', '0', '0', 'dmw:teach:list', '#', 'admin', '2025-07-22 14:37:44', '', NULL, '教师任教管理菜单');
INSERT INTO `sys_menu` VALUES (2009, '教师任教管理查询', 2008, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'dmw:teach:query', '#', 'admin', '2025-07-22 14:37:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2010, '教师任教管理新增', 2008, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'dmw:teach:add', '#', 'admin', '2025-07-22 14:37:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2011, '教师任教管理修改', 2008, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'dmw:teach:edit', '#', 'admin', '2025-07-22 14:37:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2012, '教师任教管理删除', 2008, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'dmw:teach:remove', '#', 'admin', '2025-07-22 14:37:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2013, '教师任教管理导出', 2008, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'dmw:teach:export', '#', 'admin', '2025-07-22 14:37:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2014, '学生信息管理查询', 2001, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'dmw:student:query', '#', 'admin', '2025-07-22 15:46:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2015, '新增', 2001, 2, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'dmw:student:add', '#', 'admin', '2025-07-22 15:48:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2016, '修改', 2001, 3, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'dmw:student:edit', '#', 'admin', '2025-07-22 15:51:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2017, '删除', 2001, 4, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'dmw:student:remove', '#', 'admin', '2025-07-22 15:52:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2018, '导出', 2001, 5, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'dmw:student:export', '#', 'admin', '2025-07-22 15:53:10', 'admin', '2025-07-22 15:55:10', '');
INSERT INTO `sys_menu` VALUES (2019, '导入', 2001, 6, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'dmw:student:import', '#', 'admin', '2025-07-22 15:53:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2020, '历史档案', 2000, 1, 'archive', 'dmw/archive/index', NULL, '', 1, 0, 'C', '0', '0', 'dmw:student:list', '#', 'admin', '2025-07-30 17:15:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2021, '数据分析仪表盘', 2000, 4, 'dashboard', 'dmw/dashboard', NULL, '', 1, 0, 'C', '0', '0', '', '#', 'admin', '2025-08-31 17:41:21', 'admin', '2025-08-31 17:41:57', '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2025-07-17 13:18:18', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2025-07-17 13:18:18', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 217 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"dmw_student\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-17 17:55:43', 116);
INSERT INTO `sys_oper_log` VALUES (101, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"student\",\"className\":\"DmwStudent\",\"columns\":[{\"capJavaField\":\"StudentId\",\"columnComment\":\"学生ID\",\"columnId\":1,\"columnName\":\"student_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-07-17 17:55:42\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"studentId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"StudentName\",\"columnComment\":\"学生姓名\",\"columnId\":2,\"columnName\":\"student_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2025-07-17 17:55:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"studentName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"IdCardNo\",\"columnComment\":\"身份证号\",\"columnId\":3,\"columnName\":\"id_card_no\",\"columnType\":\"varchar(18)\",\"createBy\":\"admin\",\"createTime\":\"2025-07-17 17:55:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"idCardNo\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DeptType\",\"columnComment\":\"学部类型 (1=小学部 2=初中部)\",\"columnId\":4,\"columnName\":\"dept_type\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2025-07-17 17:55:42\",\"dictType\":\"dmw_dept_type\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isLis', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-17 18:04:41', 65);
INSERT INTO `sys_oper_log` VALUES (102, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"dmw_student\"}', NULL, 0, NULL, '2025-07-19 10:14:46', 234);
INSERT INTO `sys_oper_log` VALUES (103, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"学生工作管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"dmw\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-19 10:24:15', 103);
INSERT INTO `sys_oper_log` VALUES (104, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"dmw/student/indexx\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"学生信息管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"student\",\"perms\":\"dmw:student:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-19 10:25:46', 7);
INSERT INTO `sys_oper_log` VALUES (105, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"dmw/student/index\",\"createTime\":\"2025-07-19 10:25:46\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"学生信息管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"student\",\"perms\":\"dmw:student:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-19 10:28:00', 8);
INSERT INTO `sys_oper_log` VALUES (106, '六困生-学生信息', 1, 'com.ruoyi.dmw.controller.DmwStudentController.add()', 'POST', 1, 'admin', '研发部门', '/dmw/student', '127.0.0.1', '内网IP', '{\"address\":\"2\",\"classId\":2,\"countermeasures\":\"2\",\"createTime\":\"2025-07-19 10:30:53\",\"delFlag\":\"\",\"deptType\":\"1\",\"economicStatus\":\"1\",\"familyAtmosphere\":\"2\",\"familyStructure\":\"2\",\"fosterLeftBehind\":\"Y\",\"gender\":\"0\",\"gradeId\":2,\"hardshipType\":\"5\",\"healthStatus\":\"1\",\"idCardNo\":\"330225200204203610\",\"isOnlyChild\":\"Y\",\"lastRecordTime\":\"2025-07-23\",\"params\":{},\"parentOccupation\":\"2\",\"remark\":\"44\",\"reportStatus\":\"0\",\"selfHarmHistory\":\"2\",\"studentDetails\":\"2\",\"studentId\":100,\"studentName\":\"张三\",\"studentStatus\":\"02\",\"teacherReportInfo\":\"3\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-19 10:30:53', 21);
INSERT INTO `sys_oper_log` VALUES (107, '字典类型', 9, 'com.ruoyi.web.controller.system.SysDictTypeController.refreshCache()', 'DELETE', 1, 'admin', '研发部门', '/system/dict/type/refreshCache', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-19 12:40:20', 29);
INSERT INTO `sys_oper_log` VALUES (108, '六困生-学生信息', 1, 'com.ruoyi.dmw.controller.DmwStudentController.add()', 'POST', 1, 'admin', '研发部门', '/dmw/student', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-07-19 12:53:39\",\"params\":{},\"studentId\":101,\"studentName\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-19 12:53:39', 5);
INSERT INTO `sys_oper_log` VALUES (109, '六困生-学生信息', 2, 'com.ruoyi.dmw.controller.DmwStudentController.edit()', 'PUT', 1, 'admin', '研发部门', '/dmw/student', '127.0.0.1', '内网IP', '{\"address\":\"2\",\"classId\":2,\"countermeasures\":\"2\",\"createBy\":\"\",\"createTime\":\"2025-07-19 10:30:54\",\"delFlag\":\"\",\"deptType\":\"1\",\"economicStatus\":\"1\",\"familyAtmosphere\":\"2\",\"familyStructure\":\"2\",\"fosterLeftBehind\":\"Y\",\"gender\":\"0\",\"gradeId\":2,\"hardshipType\":\"5\",\"healthStatus\":\"1\",\"idCardNo\":\"330225200204203610\",\"isOnlyChild\":\"Y\",\"lastRecordTime\":\"2025-07-23\",\"params\":{},\"parentOccupation\":\"2\",\"remark\":\"44\",\"reportStatus\":\"0\",\"selfHarmHistory\":\"2\",\"studentDetails\":\"2\",\"studentId\":100,\"studentName\":\"张三\",\"studentStatus\":\"02\",\"teacherReportInfo\":\"3\",\"updateBy\":\"\",\"updateTime\":\"2025-07-19 12:53:49\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-19 12:53:49', 6);
INSERT INTO `sys_oper_log` VALUES (110, '六困生-学生信息', 1, 'com.ruoyi.dmw.controller.DmwStudentController.add()', 'POST', 1, 'admin', '研发部门', '/dmw/student', '127.0.0.1', '内网IP', '{\"classId\":1,\"createTime\":\"2025-07-19 13:02:43\",\"deptType\":\"1\",\"economicStatus\":\"1\",\"familyAtmosphere\":\"2\",\"familyStructure\":\"1\",\"fosterLeftBehind\":\"N\",\"gender\":\"0\",\"gradeId\":6,\"hardshipType\":\"2\",\"healthStatus\":\"2\",\"idCardNo\":\"330225200204203610\",\"isOnlyChild\":\"N\",\"params\":{},\"reportStatus\":\"1\",\"selfHarmHistory\":\"1\",\"studentId\":102,\"studentName\":\"张三\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-19 13:02:43', 5);
INSERT INTO `sys_oper_log` VALUES (111, '六困生-学生信息', 2, 'com.ruoyi.dmw.controller.DmwStudentController.edit()', 'PUT', 1, 'admin', '研发部门', '/dmw/student', '127.0.0.1', '内网IP', '{\"address\":\"2\",\"classId\":5,\"countermeasures\":\"2\",\"createBy\":\"\",\"createTime\":\"2025-07-19 10:30:54\",\"delFlag\":\"\",\"deptType\":\"2\",\"economicStatus\":\"1\",\"familyAtmosphere\":\"2\",\"familyStructure\":\"2\",\"fosterLeftBehind\":\"Y\",\"gender\":\"0\",\"gradeId\":4,\"hardshipType\":\"5\",\"healthStatus\":\"1\",\"idCardNo\":\"330225200204203610\",\"isOnlyChild\":\"Y\",\"lastRecordTime\":\"2025-07-23\",\"params\":{},\"parentOccupation\":\"2\",\"remark\":\"44\",\"reportStatus\":\"1\",\"selfHarmHistory\":\"2\",\"studentDetails\":\"2\",\"studentId\":100,\"studentName\":\"张三\",\"studentStatus\":\"02\",\"teacherReportInfo\":\"3\",\"updateBy\":\"\",\"updateTime\":\"2025-07-19 13:14:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-19 13:14:00', 5);
INSERT INTO `sys_oper_log` VALUES (112, '字典类型', 9, 'com.ruoyi.web.controller.system.SysDictTypeController.refreshCache()', 'DELETE', 1, 'admin', '研发部门', '/system/dict/type/refreshCache', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-19 13:44:03', 15);
INSERT INTO `sys_oper_log` VALUES (113, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"dmw_interview\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-19 13:44:24', 66);
INSERT INTO `sys_oper_log` VALUES (114, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"interview\",\"className\":\"DmwInterview\",\"columns\":[{\"capJavaField\":\"InterviewId\",\"columnComment\":\"约谈ID\",\"columnId\":30,\"columnName\":\"interview_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-07-19 13:44:24\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"interviewId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"StudentId\",\"columnComment\":\"关联学生ID\",\"columnId\":31,\"columnName\":\"student_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-07-19 13:44:24\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"studentId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"InterviewTime\",\"columnComment\":\"约谈时间\",\"columnId\":32,\"columnName\":\"interview_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2025-07-19 13:44:24\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"interviewTime\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Location\",\"columnComment\":\"约谈地点 (字典 dmw_interview_location)\",\"columnId\":33,\"columnName\":\"location\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-07-19 13:44:24\",\"dictType\":\"dmw_interview_location\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-19 13:45:54', 49);
INSERT INTO `sys_oper_log` VALUES (115, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"dmw_interview\"}', NULL, 0, NULL, '2025-07-19 16:24:35', 248);
INSERT INTO `sys_oper_log` VALUES (116, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"dmw/interview/index\",\"createTime\":\"2025-07-19 16:37:42\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"六困生-约谈记录\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"interview\",\"perms\":\"dmw:interview:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-19 16:40:17', 24);
INSERT INTO `sys_oper_log` VALUES (117, '六困生-约谈记录', 1, 'com.ruoyi.dmw.controller.DmwInterviewController.add()', 'POST', 1, 'admin', '研发部门', '/dmw/interview', '127.0.0.1', '内网IP', '{\"attachmentUrl\":\"是\",\"content\":\"学术思想\",\"createTime\":\"2025-07-19 16:41:08\",\"interviewId\":100,\"interviewTime\":\"2025-07-08\",\"location\":\"3\",\"params\":{},\"participants\":\"张三\",\"recorder\":\"记录人\",\"remark\":\"是\",\"studentId\":22}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-19 16:41:08', 18);
INSERT INTO `sys_oper_log` VALUES (118, '六困生-学生信息', 2, 'com.ruoyi.dmw.controller.DmwStudentController.edit()', 'PUT', 1, 'admin', '研发部门', '/dmw/student', '127.0.0.1', '内网IP', '{\"address\":\"2\",\"classId\":5,\"countermeasures\":\"2\",\"createBy\":\"\",\"createTime\":\"2025-07-19 10:30:54\",\"delFlag\":\"\",\"deptType\":\"2\",\"economicStatus\":\"1\",\"familyAtmosphere\":\"2\",\"familyStructure\":\"2\",\"fosterLeftBehind\":\"Y\",\"gender\":\"0\",\"gradeId\":4,\"hardshipType\":\"5\",\"healthStatus\":\"1\",\"idCardNo\":\"330225200204203610\",\"isOnlyChild\":\"Y\",\"lastRecordTime\":\"2025-07-23\",\"params\":{},\"parentOccupation\":\"2\",\"remark\":\"44\",\"reportStatus\":\"1\",\"selfHarmHistory\":\"2\",\"studentDetails\":\"2\",\"studentId\":100,\"studentName\":\"张三\",\"studentStatus\":\"02\",\"teacherReportInfo\":\"3\",\"updateBy\":\"\",\"updateTime\":\"2025-07-21 16:32:19\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-21 16:32:19', 23);
INSERT INTO `sys_oper_log` VALUES (119, '六困生-学生信息', 1, 'com.ruoyi.dmw.controller.DmwStudentController.add()', 'POST', 1, 'admin', '研发部门', '/dmw/student', '127.0.0.1', '内网IP', '{\"classId\":2,\"createTime\":\"2025-07-21 16:32:45\",\"deptType\":\"1\",\"economicStatus\":\"2\",\"familyAtmosphere\":\"1\",\"familyStructure\":\"2\",\"fosterLeftBehind\":\"N\",\"gender\":\"0\",\"gradeId\":1,\"hardshipType\":\"1\",\"healthStatus\":\"1\",\"idCardNo\":\"333\",\"isOnlyChild\":\"N\",\"params\":{},\"reportStatus\":\"0\",\"selfHarmHistory\":\"0\",\"studentId\":103,\"studentName\":\"张三3\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-21 16:32:45', 7);
INSERT INTO `sys_oper_log` VALUES (120, '六困生-学生信息', 3, 'com.ruoyi.dmw.controller.DmwStudentController.remove()', 'DELETE', 1, 'admin', '研发部门', '/dmw/student/103', '127.0.0.1', '内网IP', '[103]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-21 16:32:53', 6);
INSERT INTO `sys_oper_log` VALUES (121, '六困生-约谈记录', 1, 'com.ruoyi.dmw.controller.DmwInterviewController.add()', 'POST', 1, 'admin', '研发部门', '/dmw/interview', '127.0.0.1', '内网IP', '{\"content\":\"33\",\"createTime\":\"2025-07-21 16:33:07\",\"interviewId\":101,\"interviewTime\":\"2025-07-01\",\"location\":\"1\",\"params\":{},\"participants\":\"3\",\"recorder\":\"3\",\"studentId\":102}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-21 16:33:07', 8);
INSERT INTO `sys_oper_log` VALUES (122, '六困生-约谈记录', 1, 'com.ruoyi.dmw.controller.DmwInterviewController.add()', 'POST', 1, 'admin', '研发部门', '/dmw/interview', '127.0.0.1', '内网IP', '{\"content\":\"认同感\",\"createTime\":\"2025-07-21 16:40:28\",\"interviewId\":102,\"interviewTime\":\"2025-07-10\",\"location\":\"2\",\"params\":{},\"participants\":\"提供\",\"recorder\":\"弱覆盖\",\"studentId\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-21 16:40:28', 102);
INSERT INTO `sys_oper_log` VALUES (123, '六困生-约谈记录', 1, 'com.ruoyi.dmw.controller.DmwInterviewController.add()', 'POST', 1, 'admin', '研发部门', '/dmw/interview', '127.0.0.1', '内网IP', '{\"content\":\"111\",\"createTime\":\"2025-07-21 16:40:55\",\"interviewId\":103,\"interviewTime\":\"2025-07-19\",\"location\":\"2\",\"params\":{},\"participants\":\"共同\",\"recorder\":\"提供\",\"studentId\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-21 16:40:55', 4);
INSERT INTO `sys_oper_log` VALUES (124, '六困生-学生信息', 3, 'com.ruoyi.dmw.controller.DmwStudentController.remove()', 'DELETE', 1, 'admin', '研发部门', '/dmw/student/102', '127.0.0.1', '内网IP', '[102]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-21 17:07:08', 13);
INSERT INTO `sys_oper_log` VALUES (125, '六困生-约谈记录', 1, 'com.ruoyi.dmw.controller.DmwInterviewController.add()', 'POST', 1, 'admin', '研发部门', '/dmw/interview', '127.0.0.1', '内网IP', '{\"attachmentUrl\":\"http://localhost:8080/profile/upload/2025/07/21/D_20250721171636A001.zip\",\"content\":\"地产市场的VS\",\"createTime\":\"2025-07-21 17:16:52\",\"interviewId\":104,\"interviewTime\":\"2025-07-08\",\"location\":\"2\",\"params\":{},\"participants\":\"人2\",\"recorder\":\"人23\",\"studentId\":100,\"studentName\":\"张三\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-21 17:16:52', 98);
INSERT INTO `sys_oper_log` VALUES (126, '六困生-约谈记录', 1, 'com.ruoyi.dmw.controller.DmwInterviewController.add()', 'POST', 1, 'admin', '研发部门', '/dmw/interview', '127.0.0.1', '内网IP', '{\"attachmentUrl\":\"http://localhost:8080/profile/upload/2025/07/21/D_20250721173231A001.zip\",\"content\":\"7\",\"createTime\":\"2025-07-21 17:32:39\",\"interviewId\":105,\"interviewTime\":\"2025-07-08\",\"location\":\"2\",\"params\":{},\"participants\":\"说\",\"recorder\":\"6\",\"studentId\":100,\"studentName\":\"张三\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-21 17:32:39', 98);
INSERT INTO `sys_oper_log` VALUES (127, '六困生-约谈记录', 1, 'com.ruoyi.dmw.controller.DmwInterviewController.add()', 'POST', 1, 'admin', '研发部门', '/dmw/interview', '127.0.0.1', '内网IP', '{\"attachmentUrl\":\"http://localhost:8080/profile/upload/2025/07/21/D_20250721174120A001.zip\",\"createTime\":\"2025-07-21 17:41:22\",\"interviewId\":106,\"interviewTime\":\"2025-07-26\",\"location\":\"2\",\"params\":{},\"studentId\":100,\"studentName\":\"张三\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-21 17:41:23', 98);
INSERT INTO `sys_oper_log` VALUES (128, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"dmw_teacher_class\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-22 14:27:44', 62);
INSERT INTO `sys_oper_log` VALUES (129, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"teach\",\"className\":\"DmwTeacherClass\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键ID\",\"columnId\":43,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-07-22 14:27:44\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"教师用户ID (关联sys_user)\",\"columnId\":44,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-07-22 14:27:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"GradeId\",\"columnComment\":\"年级ID\",\"columnId\":45,\"columnName\":\"grade_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-07-22 14:27:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"gradeId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ClassId\",\"columnComment\":\"班级ID\",\"columnId\":46,\"columnName\":\"class_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-07-22 14:27:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"classId\",\"ja', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-22 14:35:24', 37);
INSERT INTO `sys_oper_log` VALUES (130, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"dmw_teacher_class\"}', NULL, 0, NULL, '2025-07-22 14:35:28', 185);
INSERT INTO `sys_oper_log` VALUES (131, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013],\"params\":{},\"roleId\":100,\"roleKey\":\"headteacher\",\"roleName\":\"班主任\",\"roleSort\":0,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-22 14:43:20', 18);
INSERT INTO `sys_oper_log` VALUES (132, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.dataScope()', 'PUT', 1, 'admin', '研发部门', '/system/role/dataScope', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-07-22 14:43:20\",\"dataScope\":\"5\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"params\":{},\"roleId\":100,\"roleKey\":\"headteacher\",\"roleName\":\"班主任\",\"roleSort\":0,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-22 14:46:59', 7);
INSERT INTO `sys_oper_log` VALUES (133, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"301班主任昵称\",\"params\":{},\"postIds\":[],\"roleIds\":[100],\"status\":\"0\",\"userId\":100,\"userName\":\"301\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-22 14:48:10', 77);
INSERT INTO `sys_oper_log` VALUES (134, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"302班主任昵称\",\"params\":{},\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userId\":101,\"userName\":\"302\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-22 14:48:35', 67);
INSERT INTO `sys_oper_log` VALUES (135, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-07-22 14:48:35\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"302班主任昵称\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[100],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":101,\"userName\":\"302\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-22 14:48:59', 11);
INSERT INTO `sys_oper_log` VALUES (136, '教师任教管理', 1, 'com.ruoyi.system.controller.DmwTeacherClassController.add()', 'POST', 1, 'admin', '研发部门', '/dmw/teach', '127.0.0.1', '内网IP', '{\"classId\":1,\"createTime\":\"2025-07-22 14:49:17\",\"gradeId\":3,\"id\":100,\"params\":{},\"userId\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-22 14:49:17', 8);
INSERT INTO `sys_oper_log` VALUES (137, '教师任教管理', 1, 'com.ruoyi.system.controller.DmwTeacherClassController.add()', 'POST', 1, 'admin', '研发部门', '/dmw/teach', '127.0.0.1', '内网IP', '{\"classId\":2,\"createTime\":\"2025-07-22 14:49:30\",\"gradeId\":3,\"id\":101,\"params\":{},\"userId\":101}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-22 14:49:30', 4);
INSERT INTO `sys_oper_log` VALUES (138, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"teach\",\"className\":\"DmwTeacherClass\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键ID\",\"columnId\":43,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-07-22 14:27:44\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2025-07-22 14:35:24\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"教师用户ID (关联sys_user)\",\"columnId\":44,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-07-22 14:27:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2025-07-22 14:35:24\",\"usableColumn\":false},{\"capJavaField\":\"GradeId\",\"columnComment\":\"年级ID\",\"columnId\":45,\"columnName\":\"grade_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-07-22 14:27:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"gradeId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2025-07-22 14:35:24\",\"usableColumn\":false},{\"capJavaField\":\"ClassId\",\"columnComment\":\"班级ID\",\"columnId\":46,\"columnName\":\"class_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-07-22 14:27:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncre', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-22 15:02:14', 36);
INSERT INTO `sys_oper_log` VALUES (139, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"dmw_teacher_class\"}', NULL, 0, NULL, '2025-07-22 15:02:27', 59);
INSERT INTO `sys_oper_log` VALUES (140, '六困生-学生信息', 1, 'com.ruoyi.dmw.controller.DmwStudentController.add()', 'POST', 1, 'admin', '研发部门', '/dmw/student', '127.0.0.1', '内网IP', '{\"classId\":2,\"createTime\":\"2025-07-22 15:21:44\",\"deptType\":\"1\",\"economicStatus\":\"1\",\"familyAtmosphere\":\"1\",\"familyStructure\":\"1\",\"fosterLeftBehind\":\"N\",\"gender\":\"0\",\"gradeId\":3,\"hardshipType\":\"1\",\"healthStatus\":\"1\",\"idCardNo\":\"2\",\"isOnlyChild\":\"N\",\"params\":{},\"reportStatus\":\"0\",\"selfHarmHistory\":\"0\",\"studentId\":104,\"studentName\":\"李四\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-22 15:21:44', 20);
INSERT INTO `sys_oper_log` VALUES (141, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.dataScope()', 'PUT', 1, 'admin', '研发部门', '/system/role/dataScope', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-07-22 14:43:20\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"params\":{},\"roleId\":100,\"roleKey\":\"headteacher\",\"roleName\":\"班主任\",\"roleSort\":0,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-22 15:28:17', 22);
INSERT INTO `sys_oper_log` VALUES (142, '六困生-学生信息', 3, 'com.ruoyi.dmw.controller.DmwStudentController.remove()', 'DELETE', 1, 'admin', '研发部门', '/dmw/student/101', '127.0.0.1', '内网IP', '[101]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-22 15:31:38', 13);
INSERT INTO `sys_oper_log` VALUES (143, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"dmw/student/index\",\"createTime\":\"2025-07-19 10:25:46\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"学生信息管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"student\",\"perms\":\"dmw:student:list,dmw:student:add,dmw:student:edit,dmw:student:remove,dmw:student:export,\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-22 15:41:43', 16);
INSERT INTO `sys_oper_log` VALUES (144, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"dmw/student/index\",\"createTime\":\"2025-07-19 10:25:46\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"学生信息管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"student\",\"perms\":\"dmw:student:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-22 15:44:15', 6);
INSERT INTO `sys_oper_log` VALUES (145, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"学生信息管理查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2001,\"perms\":\"dmw:student:query\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-22 15:46:07', 6);
INSERT INTO `sys_oper_log` VALUES (146, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"新增\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2001,\"perms\":\"dmw:student:add\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-22 15:48:41', 6);
INSERT INTO `sys_oper_log` VALUES (147, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2001,\"perms\":\"dmw:student:edit\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-22 15:51:58', 7);
INSERT INTO `sys_oper_log` VALUES (148, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"删除\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2001,\"perms\":\"dmw:student:remove\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-22 15:52:35', 5);
INSERT INTO `sys_oper_log` VALUES (149, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"导出\",\"menuType\":\"F\",\"orderNum\":5,\"params\":{},\"parentId\":2001,\"perms\":\"dmw:student:expoort\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-22 15:53:10', 5);
INSERT INTO `sys_oper_log` VALUES (150, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"导入\",\"menuType\":\"F\",\"orderNum\":6,\"params\":{},\"parentId\":2001,\"perms\":\"dmw:student:import\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-22 15:53:38', 5);
INSERT INTO `sys_oper_log` VALUES (151, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-07-22 14:43:20\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001,2014,2015,2016,2017,2018,2019,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013],\"params\":{},\"roleId\":100,\"roleKey\":\"headteacher\",\"roleName\":\"班主任\",\"roleSort\":0,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-22 15:53:49', 25);
INSERT INTO `sys_oper_log` VALUES (152, '六困生-学生信息', 1, 'com.ruoyi.dmw.controller.DmwStudentController.add()', 'POST', 1, '301', NULL, '/dmw/student', '127.0.0.1', '内网IP', '{\"classId\":1,\"createTime\":\"2025-07-22 15:54:34\",\"deptType\":\"1\",\"economicStatus\":\"1\",\"familyAtmosphere\":\"1\",\"familyStructure\":\"2\",\"fosterLeftBehind\":\"N\",\"gender\":\"0\",\"gradeId\":3,\"hardshipType\":\"2\",\"healthStatus\":\"1\",\"idCardNo\":\"302202\",\"isOnlyChild\":\"N\",\"params\":{},\"reportStatus\":\"0\",\"selfHarmHistory\":\"0\",\"studentId\":105,\"studentName\":\"学生名301\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-22 15:54:34', 16);
INSERT INTO `sys_oper_log` VALUES (153, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-07-22 15:53:10\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2018,\"menuName\":\"导出\",\"menuType\":\"F\",\"orderNum\":5,\"params\":{},\"parentId\":2001,\"path\":\"\",\"perms\":\"dmw:student:export\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-22 15:55:10', 7);
INSERT INTO `sys_oper_log` VALUES (154, '六困生-学生信息', 1, 'com.ruoyi.dmw.controller.DmwStudentController.add()', 'POST', 1, '301', NULL, '/dmw/student', '127.0.0.1', '内网IP', '{\"classId\":1,\"createTime\":\"2025-07-22 16:10:01\",\"deptType\":\"1\",\"economicStatus\":\"2\",\"familyAtmosphere\":\"1\",\"familyStructure\":\"1\",\"fosterLeftBehind\":\"N\",\"gender\":\"0\",\"gradeId\":3,\"hardshipType\":\"1\",\"healthStatus\":\"1\",\"idCardNo\":\"3\",\"isOnlyChild\":\"N\",\"params\":{},\"selfHarmHistory\":\"1\",\"studentId\":106,\"studentName\":\"301学生2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-22 16:10:01', 109);
INSERT INTO `sys_oper_log` VALUES (155, '六困生-学生信息', 5, 'com.ruoyi.dmw.controller.DmwStudentController.export()', 'POST', 1, 'admin', '研发部门', '/dmw/student/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-07-22 16:18:35', 857);
INSERT INTO `sys_oper_log` VALUES (156, '学生状态变更', 2, 'com.ruoyi.dmw.controller.DmwStudentController.changeStatus()', 'POST', 1, 'admin', '研发部门', '/dmw/student/changeStatus', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"currentStatus\":\"02\",\"endDate\":\"2025-08-08\",\"logId\":100,\"params\":{},\"previousStatus\":\"01\",\"reason\":\"生病\",\"startDate\":\"2025-07-29\",\"studentId\":104,\"studentName\":\"李四\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-29 18:35:58', 36);
INSERT INTO `sys_oper_log` VALUES (157, '学生状态变更', 2, 'com.ruoyi.dmw.controller.DmwStudentController.changeStatus()', 'POST', 1, 'admin', '研发部门', '/dmw/student/changeStatus', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"currentStatus\":\"01\",\"logId\":101,\"params\":{},\"previousStatus\":\"02\",\"reason\":\"在读咯\",\"startDate\":\"2025-07-08\",\"studentId\":104,\"studentName\":\"李四\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-29 18:45:40', 113);
INSERT INTO `sys_oper_log` VALUES (158, '学生状态变更', 2, 'com.ruoyi.dmw.controller.DmwStudentController.changeStatus()', 'POST', 1, 'admin', '研发部门', '/dmw/student/changeStatus', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"currentStatus\":\"03\",\"endDate\":\"2025-08-01\",\"logId\":102,\"params\":{},\"previousStatus\":\"01\",\"reason\":\"休学咯\",\"startDate\":\"2025-07-30\",\"studentId\":105,\"studentName\":\"学生名301\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-29 18:45:58', 9);
INSERT INTO `sys_oper_log` VALUES (159, '学生状态变更', 2, 'com.ruoyi.dmw.controller.DmwStudentController.changeStatus()', 'POST', 1, 'admin', '研发部门', '/dmw/student/changeStatus', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"currentStatus\":\"03\",\"endDate\":\"2025-07-31\",\"logId\":103,\"params\":{},\"previousStatus\":\"01\",\"reason\":\"301休学\",\"startDate\":\"2025-07-29\",\"studentId\":106,\"studentName\":\"301学生2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-29 18:51:48', 123);
INSERT INTO `sys_oper_log` VALUES (160, '六困生-学生信息', 3, 'com.ruoyi.dmw.controller.DmwStudentController.remove()', 'DELETE', 1, 'admin', '研发部门', '/dmw/student/105', '127.0.0.1', '内网IP', '[105]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-29 18:51:58', 5);
INSERT INTO `sys_oper_log` VALUES (161, '六困生-学生信息', 3, 'com.ruoyi.dmw.controller.DmwStudentController.remove()', 'DELETE', 1, 'admin', '研发部门', '/dmw/student/104', '127.0.0.1', '内网IP', '[104]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-29 18:52:02', 4);
INSERT INTO `sys_oper_log` VALUES (162, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"dmw/archive/index\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"历史档案\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"archive\",\"perms\":\"dmw:student:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-30 17:15:42', 21);
INSERT INTO `sys_oper_log` VALUES (163, '六困生-学生信息', 1, 'com.ruoyi.dmw.controller.DmwStudentController.add()', 'POST', 1, 'admin', '研发部门', '/dmw/student', '127.0.0.1', '内网IP', '{\"classId\":1,\"createTime\":\"2025-07-30 17:17:43\",\"deptType\":\"1\",\"economicStatus\":\"1\",\"familyAtmosphere\":\"1\",\"familyStructure\":\"1\",\"fosterLeftBehind\":\"N\",\"gender\":\"1\",\"gradeId\":2,\"hardshipType\":\"2\",\"healthStatus\":\"1\",\"idCardNo\":\"333\",\"isOnlyChild\":\"Y\",\"params\":{},\"selfHarmHistory\":\"1\",\"studentId\":107,\"studentName\":\"2年级学生姓名\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-30 17:17:43', 14);
INSERT INTO `sys_oper_log` VALUES (164, '六困生-学生信息', 3, 'com.ruoyi.dmw.controller.DmwStudentController.remove()', 'DELETE', 1, 'admin', '研发部门', '/dmw/student/107', '127.0.0.1', '内网IP', '[107]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-30 17:17:49', 5);
INSERT INTO `sys_oper_log` VALUES (165, '学生档案恢复', 2, 'com.ruoyi.dmw.controller.DmwStudentController.restore()', 'PUT', 1, 'admin', '研发部门', '/dmw/student/restore', '127.0.0.1', '内网IP', '{\"classId\":2,\"currentStatusReason\":\"\",\"delFlag\":\"0\",\"gradeId\":3,\"params\":{},\"studentId\":107,\"studentName\":\"2年级学生姓名\",\"studentStatus\":\"01\",\"updateBy\":\"admin\",\"updateTime\":\"2025-07-30 17:18:15\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-30 17:18:15', 5);
INSERT INTO `sys_oper_log` VALUES (166, '学生档案恢复', 2, 'com.ruoyi.dmw.controller.DmwStudentController.restore()', 'PUT', 1, 'admin', '研发部门', '/dmw/student/restore', '127.0.0.1', '内网IP', '{\"classId\":6,\"currentStatusReason\":\"\",\"delFlag\":\"0\",\"gradeId\":2,\"params\":{},\"studentId\":104,\"studentName\":\"李四\",\"studentStatus\":\"01\",\"updateBy\":\"admin\",\"updateTime\":\"2025-07-30 17:18:43\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-30 17:18:43', 5);
INSERT INTO `sys_oper_log` VALUES (167, '学生档案恢复', 2, 'com.ruoyi.dmw.controller.DmwStudentController.restore()', 'PUT', 1, 'admin', '研发部门', '/dmw/student/restore', '127.0.0.1', '内网IP', '{\"classId\":5,\"currentStatusReason\":\"\",\"delFlag\":\"0\",\"gradeId\":2,\"params\":{},\"studentId\":104,\"studentName\":\"李四\",\"studentStatus\":\"01\",\"updateBy\":\"admin\",\"updateTime\":\"2025-07-30 17:24:44\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-30 17:24:44', 25);
INSERT INTO `sys_oper_log` VALUES (168, '六困生-学生信息', 3, 'com.ruoyi.dmw.controller.DmwStudentController.remove()', 'DELETE', 1, 'admin', '研发部门', '/dmw/student/104', '127.0.0.1', '内网IP', '[104]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-30 17:25:36', 6);
INSERT INTO `sys_oper_log` VALUES (169, '全员升级', 2, 'com.ruoyi.dmw.controller.DmwStudentController.upgradeAll()', 'POST', 1, 'admin', '研发部门', '/dmw/student/upgradeAll', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-30 17:40:23', 20);
INSERT INTO `sys_oper_log` VALUES (170, '学生档案恢复', 2, 'com.ruoyi.dmw.controller.DmwStudentController.restore()', 'PUT', 1, 'admin', '研发部门', '/dmw/student/restore', '127.0.0.1', '内网IP', '{\"classId\":2,\"currentStatusReason\":\"\",\"delFlag\":\"0\",\"gradeId\":2,\"params\":{},\"studentId\":107,\"studentName\":\"2年级学生姓名\",\"studentStatus\":\"01\",\"updateBy\":\"admin\",\"updateTime\":\"2025-07-30 17:42:06\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-30 17:42:06', 18);
INSERT INTO `sys_oper_log` VALUES (171, '全员升级', 2, 'com.ruoyi.dmw.controller.DmwStudentController.upgradeAll()', 'POST', 1, 'admin', '研发部门', '/dmw/student/upgradeAll', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-30 17:48:28', 10);
INSERT INTO `sys_oper_log` VALUES (172, '全员升级', 2, 'com.ruoyi.dmw.controller.DmwStudentController.upgradeAll()', 'POST', 1, 'admin', '研发部门', '/dmw/student/upgradeAll', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"code\":200,\"data\":1}', 0, NULL, '2025-07-30 17:50:43', 15);
INSERT INTO `sys_oper_log` VALUES (173, '全员升级', 2, 'com.ruoyi.dmw.controller.DmwStudentController.upgradeAll()', 'POST', 1, 'admin', '研发部门', '/dmw/student/upgradeAll', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"code\":200,\"data\":1}', 0, NULL, '2025-07-30 17:53:08', 21);
INSERT INTO `sys_oper_log` VALUES (174, '全员升级', 2, 'com.ruoyi.dmw.controller.DmwStudentController.upgradeAll()', 'POST', 1, 'admin', '研发部门', '/dmw/student/upgradeAll', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"code\":200,\"data\":1}', 0, NULL, '2025-07-30 17:54:05', 7);
INSERT INTO `sys_oper_log` VALUES (175, '全员升级', 2, 'com.ruoyi.dmw.controller.DmwStudentController.upgradeAll()', 'POST', 1, 'admin', '研发部门', '/dmw/student/upgradeAll', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"code\":200,\"data\":1}', 0, NULL, '2025-07-30 17:56:50', 7);
INSERT INTO `sys_oper_log` VALUES (176, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,2000,2001,2014,2015,2016,2017,2018,2019,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2020],\"params\":{},\"roleId\":101,\"roleKey\":\"psychologist\",\"roleName\":\"心理管理员\",\"roleSort\":2,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-30 18:31:28', 23);
INSERT INTO `sys_oper_log` VALUES (177, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"张洁\",\"params\":{},\"postIds\":[],\"roleIds\":[101],\"status\":\"0\",\"userId\":102,\"userName\":\"dmwxinli\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-30 18:33:30', 74);
INSERT INTO `sys_oper_log` VALUES (178, '六困生-学生信息', 2, 'com.ruoyi.dmw.controller.DmwStudentController.edit()', 'PUT', 1, 'dmwxinli', NULL, '/dmw/student', '127.0.0.1', '内网IP', '{\"address\":\"\",\"classId\":1,\"createBy\":\"\",\"createTime\":\"2025-07-22 16:10:01\",\"currentStatusReason\":\"301休学\",\"delFlag\":\"0\",\"deptType\":\"1\",\"economicStatus\":\"2\",\"familyAtmosphere\":\"1\",\"familyStructure\":\"1\",\"fosterLeftBehind\":\"N\",\"gender\":\"0\",\"gradeId\":3,\"hardshipType\":\"1\",\"healthStatus\":\"1\",\"idCardNo\":\"3\",\"isOnlyChild\":\"Y\",\"params\":{},\"parentOccupation\":\"\",\"remark\":\"\",\"reportStatus\":\"0\",\"selfHarmHistory\":\"1\",\"studentId\":106,\"studentName\":\"301学生2\",\"studentStatus\":\"03\",\"updateBy\":\"\",\"updateTime\":\"2025-07-30 18:43:29\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-30 18:43:30', 27);
INSERT INTO `sys_oper_log` VALUES (179, '学生档案恢复', 2, 'com.ruoyi.dmw.controller.DmwStudentController.restore()', 'PUT', 1, 'dmwxinli', NULL, '/dmw/student/restore', '127.0.0.1', '内网IP', '{\"classId\":2,\"currentStatusReason\":\"\",\"delFlag\":\"0\",\"gradeId\":2,\"params\":{},\"studentId\":107,\"studentName\":\"2年级学生姓名\",\"studentStatus\":\"01\",\"updateBy\":\"dmwxinli\",\"updateTime\":\"2025-07-30 18:43:38\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-30 18:43:38', 5);
INSERT INTO `sys_oper_log` VALUES (180, '六困生-学生信息', 1, 'com.ruoyi.dmw.controller.DmwStudentController.add()', 'POST', 1, 'admin', '研发部门', '/dmw/student', '127.0.0.1', '内网IP', '{\"classId\":2,\"createTime\":\"2025-08-31 17:07:47\",\"deptType\":\"1\",\"economicStatus\":\"3\",\"familyAtmosphere\":\"2\",\"familyStructure\":\"2\",\"fosterLeftBehind\":\"N\",\"gender\":\"0\",\"gradeId\":1,\"hardshipType\":\"1\",\"healthStatus\":\"1\",\"idCardNo\":\"3sd2356132\",\"isOnlyChild\":\"N\",\"params\":{},\"selfHarmHistory\":\"2\",\"studentId\":108,\"studentName\":\"ewfsdc\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-08-31 17:07:47', 116);
INSERT INTO `sys_oper_log` VALUES (181, '六困生-学生信息', 1, 'com.ruoyi.dmw.controller.DmwStudentController.add()', 'POST', 1, 'admin', '研发部门', '/dmw/student', '127.0.0.1', '内网IP', '{\"classId\":2,\"createTime\":\"2025-08-31 17:10:38\",\"deptType\":\"1\",\"economicStatus\":\"2\",\"familyAtmosphere\":\"2\",\"familyStructure\":\"2\",\"fosterLeftBehind\":\"Y\",\"gender\":\"0\",\"gradeId\":1,\"hardshipType\":\"2\",\"healthStatus\":\"1\",\"idCardNo\":\"330552200205368980\",\"isOnlyChild\":\"N\",\"params\":{},\"selfHarmHistory\":\"1\",\"studentId\":109,\"studentName\":\"dsc\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-08-31 17:10:38', 6);
INSERT INTO `sys_oper_log` VALUES (182, '六困生-约谈记录', 1, 'com.ruoyi.dmw.controller.DmwInterviewController.add()', 'POST', 1, 'admin', '研发部门', '/dmw/interview', '127.0.0.1', '内网IP', '{\"attachmentUrl\":\"http://localhost:8080/profile/upload/2025/08/31/郑东旭个人资料_20250831171104A001.zip\",\"content\":\"jmgbk\",\"createTime\":\"2025-08-31 17:11:05\",\"interviewId\":107,\"interviewTime\":\"2025-08-20\",\"location\":\"3\",\"params\":{},\"participants\":\"iigy\",\"recorder\":\"kjhgj\",\"studentId\":107,\"studentName\":\"2年级学生姓名\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-08-31 17:11:05', 10);
INSERT INTO `sys_oper_log` VALUES (183, '学生状态变更', 2, 'com.ruoyi.dmw.controller.DmwStudentController.changeStatus()', 'POST', 1, 'admin', '研发部门', '/dmw/student/changeStatus', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"currentStatus\":\"02\",\"endDate\":\"2025-08-14\",\"logId\":104,\"params\":{},\"previousStatus\":\"01\",\"reason\":\"jbhn\",\"startDate\":\"2025-07-09\",\"studentId\":107,\"studentName\":\"2年级学生姓名\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-08-31 17:11:55', 29);
INSERT INTO `sys_oper_log` VALUES (184, '学生状态变更', 2, 'com.ruoyi.dmw.controller.DmwStudentController.changeStatus()', 'POST', 1, 'admin', '研发部门', '/dmw/student/changeStatus', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"currentStatus\":\"01\",\"logId\":105,\"params\":{},\"previousStatus\":\"02\",\"reason\":\"yf\",\"startDate\":\"2026-08-31\",\"studentId\":107,\"studentName\":\"2年级学生姓名\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-08-31 17:12:16', 9);
INSERT INTO `sys_oper_log` VALUES (185, '六困生-约谈记录', 1, 'com.ruoyi.dmw.controller.DmwInterviewController.add()', 'POST', 1, 'admin', '研发部门', '/dmw/interview', '127.0.0.1', '内网IP', '{\"attachmentUrl\":\"http://localhost:8080/profile/upload/2025/08/31/郑东旭个人资料_20250831171706A001.zip\",\"content\":\"rge\",\"createTime\":\"2025-08-31 17:17:07\",\"interviewId\":108,\"interviewTime\":\"2025-08-07\",\"location\":\"2\",\"params\":{},\"participants\":\"egr\",\"recorder\":\"erf\",\"studentId\":108,\"studentName\":\"ewfsdc\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-08-31 17:17:07', 101);
INSERT INTO `sys_oper_log` VALUES (186, '六困生-约谈记录', 3, 'com.ruoyi.dmw.controller.DmwInterviewController.remove()', 'DELETE', 1, 'admin', '研发部门', '/dmw/interview/100,101,102,103,104,105,106,107,108', '127.0.0.1', '内网IP', '[100,101,102,103,104,105,106,107,108]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-08-31 17:30:32', 16);
INSERT INTO `sys_oper_log` VALUES (187, '六困生-学生信息', 3, 'com.ruoyi.dmw.controller.DmwStudentController.remove()', 'DELETE', 1, 'admin', '研发部门', '/dmw/student/108', '127.0.0.1', '内网IP', '[108]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-08-31 17:30:45', 5);
INSERT INTO `sys_oper_log` VALUES (188, '六困生-约谈记录', 1, 'com.ruoyi.dmw.controller.DmwInterviewController.add()', 'POST', 1, 'admin', '研发部门', '/dmw/interview', '127.0.0.1', '内网IP', '{\"attachmentUrl\":\"http://localhost:8080/profile/upload/2025/08/31/郑东旭个人资料_20250831173057A001.zip\",\"content\":\"fdscvv\",\"createTime\":\"2025-08-31 17:30:57\",\"interviewId\":109,\"interviewTime\":\"2025-08-07\",\"location\":\"2\",\"params\":{},\"participants\":\"sx\",\"recorder\":\"sx\",\"studentId\":109,\"studentName\":\"dsc\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-08-31 17:30:58', 16);
INSERT INTO `sys_oper_log` VALUES (189, '六困生-约谈记录', 1, 'com.ruoyi.dmw.controller.DmwInterviewController.add()', 'POST', 1, 'admin', '研发部门', '/dmw/interview', '127.0.0.1', '内网IP', '{\"attachmentUrl\":\"http://localhost:8080/profile/upload/2025/08/31/郑东旭个人资料_20250831173108A002.zip\",\"content\":\"dscfvc\",\"createTime\":\"2025-08-31 17:31:09\",\"interviewId\":110,\"interviewTime\":\"2025-08-06\",\"location\":\"2\",\"params\":{},\"participants\":\"cds\",\"recorder\":\"cdfsxbv\",\"studentId\":107,\"studentName\":\"2年级学生姓名\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-08-31 17:31:09', 6);
INSERT INTO `sys_oper_log` VALUES (190, '六困生-约谈记录', 1, 'com.ruoyi.dmw.controller.DmwInterviewController.add()', 'POST', 1, 'admin', '研发部门', '/dmw/interview', '127.0.0.1', '内网IP', '{\"attachmentUrl\":\"http://localhost:8080/profile/upload/2025/08/31/郑东旭个人资料_20250831173120A003.zip\",\"content\":\"fdvdfv\",\"createTime\":\"2025-08-31 17:31:21\",\"interviewId\":111,\"interviewTime\":\"2025-08-03\",\"location\":\"4\",\"params\":{},\"participants\":\"dcs\",\"recorder\":\"cdsfv\",\"studentId\":109,\"studentName\":\"dsc\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-08-31 17:31:21', 5);
INSERT INTO `sys_oper_log` VALUES (191, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"dmw/dashboard\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"数据分析仪表盘\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2000,\"path\":\"dmw/dashboard\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-08-31 17:41:21', 103);
INSERT INTO `sys_oper_log` VALUES (192, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"dmw/dashboard\",\"createTime\":\"2025-08-31 17:41:21\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2021,\"menuName\":\"数据分析仪表盘\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2000,\"path\":\"dashboard\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-08-31 17:41:57', 8);
INSERT INTO `sys_oper_log` VALUES (193, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-07-22 14:43:20\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001,2014,2015,2016,2017,2018,2019,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2021],\"params\":{},\"roleId\":100,\"roleKey\":\"headteacher\",\"roleName\":\"班主任\",\"roleSort\":0,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-08-31 17:42:23', 30);
INSERT INTO `sys_oper_log` VALUES (194, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-07-30 18:31:28\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,2000,2001,2014,2015,2016,2017,2018,2019,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2020,2021],\"params\":{},\"roleId\":101,\"roleKey\":\"psychologist\",\"roleName\":\"心理管理员\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-08-31 17:42:36', 14);
INSERT INTO `sys_oper_log` VALUES (195, '六困生-学生信息', 1, 'com.ruoyi.dmw.controller.DmwStudentController.add()', 'POST', 1, '301', NULL, '/dmw/student', '127.0.0.1', '内网IP', '{\"classId\":1,\"createTime\":\"2025-10-04 07:39:29\",\"deptType\":\"1\",\"economicStatus\":\"1\",\"familyAtmosphere\":\"2\",\"familyStructure\":\"2\",\"fosterLeftBehind\":\"Y\",\"gender\":\"0\",\"gradeId\":3,\"hardshipType\":\"2\",\"healthStatus\":\"1\",\"idCardNo\":\"330225200204203666\",\"isOnlyChild\":\"Y\",\"params\":{},\"selfHarmHistory\":\"0\",\"studentId\":110,\"studentName\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-04 07:39:29', 26);
INSERT INTO `sys_oper_log` VALUES (196, '六困生-约谈记录', 1, 'com.ruoyi.dmw.controller.DmwInterviewController.add()', 'POST', 1, 'dmwxinli', NULL, '/dmw/interview', '127.0.0.1', '内网IP', '{\"attachmentUrl\":\"http://localhost:8080/profile/upload/2025/10/04/郑东旭个人资料_20251004074933A001.zip\",\"content\":\"dexcswcxs\",\"createTime\":\"2025-10-04 07:49:39\",\"interviewId\":112,\"interviewTime\":\"2025-10-04\",\"location\":\"2\",\"params\":{},\"participants\":\"zdx\",\"recorder\":\"xxx\",\"studentId\":110,\"studentName\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-04 07:49:39', 10);
INSERT INTO `sys_oper_log` VALUES (197, '六困生-约谈记录', 1, 'com.ruoyi.dmw.controller.DmwInterviewController.add()', 'POST', 1, 'dmwxinli', NULL, '/dmw/interview', '127.0.0.1', '内网IP', '{\"attachmentUrl\":\"http://localhost:8080/profile/upload/2025/10/04/郑东旭个人资料_20251004125912A001.zip\",\"content\":\"d\",\"createBy\":\"dmwxinli\",\"createTime\":\"2025-10-04 12:59:14\",\"interviewId\":113,\"interviewTime\":\"2025-10-05\",\"location\":\"2\",\"params\":{},\"participants\":\"sd\",\"recorder\":\"ds\",\"studentId\":110,\"studentName\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-04 12:59:14', 18);
INSERT INTO `sys_oper_log` VALUES (198, '六困生-学生信息', 3, 'com.ruoyi.dmw.controller.DmwStudentController.remove()', 'DELETE', 1, 'dmwxinli', NULL, '/dmw/student/110', '127.0.0.1', '内网IP', '[110]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-04 13:08:05', 12);
INSERT INTO `sys_oper_log` VALUES (199, '六困生-学生信息', 1, 'com.ruoyi.dmw.controller.DmwStudentController.add()', 'POST', 1, 'dmwxinli', NULL, '/dmw/student', '127.0.0.1', '内网IP', '{\"classId\":1,\"createTime\":\"2025-10-04 13:08:53\",\"deptType\":\"1\",\"economicStatus\":\"2\",\"familyAtmosphere\":\"1\",\"familyStructure\":\"1\",\"fosterLeftBehind\":\"Y\",\"gender\":\"0\",\"gradeId\":3,\"hardshipType\":\"4\",\"healthStatus\":\"1\",\"idCardNo\":\"330225200202303623\",\"isOnlyChild\":\"Y\",\"params\":{},\"selfHarmHistory\":\"0\",\"studentId\":111,\"studentName\":\"十月四日\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-04 13:08:53', 19);
INSERT INTO `sys_oper_log` VALUES (200, '六困生-约谈记录', 1, 'com.ruoyi.dmw.controller.DmwInterviewController.add()', 'POST', 1, 'dmwxinli', NULL, '/dmw/interview', '127.0.0.1', '内网IP', '{\"attachmentUrl\":\"http://localhost:8080/profile/upload/2025/10/04/郑东旭个人资料_20251004130928A001.zip\",\"content\":\"252552\",\"createBy\":\"dmwxinli\",\"createTime\":\"2025-10-04 13:09:59\",\"interviewId\":114,\"interviewTime\":\"2025-10-04\",\"location\":\"2\",\"params\":{},\"participants\":\"12\",\"recorder\":\"5255\",\"studentId\":111,\"studentName\":\"十月四日\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-04 13:09:59', 11);
INSERT INTO `sys_oper_log` VALUES (201, '六困生-约谈记录', 1, 'com.ruoyi.dmw.controller.DmwInterviewController.add()', 'POST', 1, '301', NULL, '/dmw/interview', '127.0.0.1', '内网IP', '{\"content\":\"cddcd\",\"createBy\":\"301\",\"createTime\":\"2025-10-04 13:11:16\",\"interviewId\":115,\"interviewTime\":\"2025-10-09\",\"location\":\"3\",\"params\":{},\"participants\":\"sxsx\",\"recorder\":\"dcdccd\",\"studentId\":111,\"studentName\":\"十月四日\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-04 13:11:16', 6);
INSERT INTO `sys_oper_log` VALUES (202, '六困生-学生信息', 1, 'com.ruoyi.dmw.controller.DmwStudentController.add()', 'POST', 1, 'dmwxinli', NULL, '/dmw/student', '127.0.0.1', '内网IP', '{\"classId\":2,\"createTime\":\"2025-10-04 16:07:24\",\"deptType\":\"2\",\"economicStatus\":\"1\",\"familyAtmosphere\":\"2\",\"familyStructure\":\"1\",\"fosterLeftBehind\":\"Y\",\"gender\":\"0\",\"gradeId\":1,\"hardshipType\":\"1\",\"healthStatus\":\"1\",\"idCardNo\":\"330225200204203610\",\"isOnlyChild\":\"Y\",\"params\":{},\"selfHarmHistory\":\"0\",\"studentId\":112,\"studentName\":\"张三\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-04 16:07:24', 7);
INSERT INTO `sys_oper_log` VALUES (203, '六困生-约谈记录', 2, 'com.ruoyi.dmw.controller.DmwInterviewController.edit()', 'PUT', 1, 'dmwxinli', NULL, '/dmw/interview', '127.0.0.1', '内网IP', '{\"attachmentUrl\":\"http://localhost:8080/profile/upload/2025/08/31/郑东旭个人资料_20250831173057A001.zip\",\"content\":\"fdscvv\",\"createBy\":\"\",\"createTime\":\"2025-08-31 17:30:58\",\"interviewId\":109,\"interviewTime\":\"2025-08-07\",\"location\":\"2\",\"params\":{},\"participants\":\"sx1111\",\"recorder\":\"sx\",\"remark\":\"\",\"studentId\":109,\"studentName\":\"dsc\",\"updateBy\":\"dmwxinli\",\"updateTime\":\"2025-10-04 16:14:20\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-04 16:14:20', 5);
INSERT INTO `sys_oper_log` VALUES (204, '六困生-学生信息', 2, 'com.ruoyi.dmw.controller.DmwStudentController.edit()', 'PUT', 1, 'dmwxinli', NULL, '/dmw/student', '127.0.0.1', '内网IP', '{\"address\":\"\",\"classId\":8,\"createBy\":\"\",\"createTime\":\"2025-07-22 16:10:01\",\"currentStatusReason\":\"301休学\",\"delFlag\":\"0\",\"deptType\":\"1\",\"economicStatus\":\"2\",\"familyAtmosphere\":\"1\",\"familyStructure\":\"1\",\"fosterLeftBehind\":\"N\",\"gender\":\"0\",\"gradeId\":9,\"hardshipType\":\"1\",\"healthStatus\":\"1\",\"idCardNo\":\"330225200204203666\",\"isOnlyChild\":\"Y\",\"params\":{},\"parentOccupation\":\"\",\"remark\":\"\",\"reportStatus\":\"0\",\"selfHarmHistory\":\"1\",\"studentId\":106,\"studentName\":\"301学生2\",\"studentStatus\":\"03\",\"updateBy\":\"\",\"updateTime\":\"2025-10-04 16:20:24\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-04 16:20:24', 6);
INSERT INTO `sys_oper_log` VALUES (205, '六困生-学生信息', 2, 'com.ruoyi.dmw.controller.DmwStudentController.edit()', 'PUT', 1, 'dmwxinli', NULL, '/dmw/student', '127.0.0.1', '内网IP', '{\"address\":\"\",\"classId\":8,\"createBy\":\"\",\"createTime\":\"2025-07-22 16:10:01\",\"currentStatusReason\":\"301休学\",\"delFlag\":\"0\",\"deptType\":\"1\",\"economicStatus\":\"2\",\"familyAtmosphere\":\"2\",\"familyStructure\":\"1\",\"fosterLeftBehind\":\"N\",\"gender\":\"0\",\"gradeId\":9,\"hardshipType\":\"1\",\"healthStatus\":\"1\",\"idCardNo\":\"330225200204203666\",\"isOnlyChild\":\"Y\",\"params\":{},\"parentOccupation\":\"\",\"remark\":\"\",\"reportStatus\":\"0\",\"selfHarmHistory\":\"1\",\"studentId\":106,\"studentName\":\"301学生2\",\"studentStatus\":\"03\",\"updateBy\":\"\",\"updateTime\":\"2025-10-04 16:23:13\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-04 16:23:13', 5);
INSERT INTO `sys_oper_log` VALUES (206, '六困生-学生信息', 2, 'com.ruoyi.dmw.controller.DmwStudentController.edit()', 'PUT', 1, 'dmwxinli', NULL, '/dmw/student', '127.0.0.1', '内网IP', '{\"address\":\"\",\"classId\":8,\"countermeasures\":\"曾多次\",\"createBy\":\"\",\"createTime\":\"2025-07-22 16:10:01\",\"currentStatusReason\":\"301休学\",\"delFlag\":\"0\",\"deptType\":\"1\",\"economicStatus\":\"2\",\"familyAtmosphere\":\"2\",\"familyStructure\":\"1\",\"fosterLeftBehind\":\"N\",\"gender\":\"0\",\"gradeId\":9,\"hardshipType\":\"1\",\"healthStatus\":\"1\",\"idCardNo\":\"330225200204203666\",\"isOnlyChild\":\"Y\",\"params\":{},\"parentOccupation\":\"\",\"remark\":\"\",\"reportStatus\":\"0\",\"selfHarmHistory\":\"1\",\"studentId\":106,\"studentName\":\"301学生2\",\"studentStatus\":\"03\",\"updateBy\":\"\",\"updateTime\":\"2025-10-04 16:23:40\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-04 16:23:40', 5);
INSERT INTO `sys_oper_log` VALUES (207, '六困生-学生信息', 2, 'com.ruoyi.dmw.controller.DmwStudentController.edit()', 'PUT', 1, 'dmwxinli', NULL, '/dmw/student', '127.0.0.1', '内网IP', '{\"address\":\"\",\"classId\":2,\"createBy\":\"\",\"createTime\":\"2025-10-04 16:07:24\",\"currentStatusReason\":\"\",\"delFlag\":\"0\",\"deptType\":\"2\",\"economicStatus\":\"1\",\"familyAtmosphere\":\"2\",\"familyStructure\":\"1\",\"fosterLeftBehind\":\"Y\",\"gender\":\"0\",\"gradeId\":1,\"hardshipType\":\"3\",\"healthStatus\":\"1\",\"idCardNo\":\"330225200204203610\",\"isOnlyChild\":\"Y\",\"params\":{},\"parentOccupation\":\"\",\"remark\":\"\",\"reportStatus\":\"0\",\"selfHarmHistory\":\"0\",\"studentId\":112,\"studentName\":\"张三\",\"studentStatus\":\"01\",\"updateBy\":\"\",\"updateTime\":\"2025-10-04 18:26:57\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-04 18:26:57', 21);
INSERT INTO `sys_oper_log` VALUES (208, '六困生-学生信息', 2, 'com.ruoyi.dmw.controller.DmwStudentController.edit()', 'PUT', 1, 'dmwxinli', NULL, '/dmw/student', '127.0.0.1', '内网IP', '{\"address\":\"\",\"classId\":8,\"countermeasures\":\"曾多次\",\"createBy\":\"\",\"createTime\":\"2025-07-22 16:10:01\",\"currentStatusReason\":\"301休学\",\"delFlag\":\"0\",\"deptType\":\"1\",\"economicStatus\":\"2\",\"familyAtmosphere\":\"2\",\"familyStructure\":\"1\",\"fosterLeftBehind\":\"N\",\"gender\":\"0\",\"gradeId\":9,\"hardshipType\":\"4\",\"healthStatus\":\"1\",\"idCardNo\":\"330225200204203666\",\"isOnlyChild\":\"Y\",\"params\":{},\"parentOccupation\":\"\",\"remark\":\"\",\"reportStatus\":\"0\",\"selfHarmHistory\":\"1\",\"studentId\":106,\"studentName\":\"301学生2\",\"studentStatus\":\"03\",\"updateBy\":\"dmwxinli\",\"updateTime\":\"2025-10-04 19:23:56\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-04 19:23:56', 125);
INSERT INTO `sys_oper_log` VALUES (209, '六困生-学生信息', 2, 'com.ruoyi.dmw.controller.DmwStudentController.edit()', 'PUT', 1, 'dmwxinli', NULL, '/dmw/student', '127.0.0.1', '内网IP', '{\"address\":\"\",\"classId\":2,\"createBy\":\"\",\"createTime\":\"2025-10-04 16:07:24\",\"currentStatusReason\":\"\",\"delFlag\":\"0\",\"deptType\":\"2\",\"economicStatus\":\"1\",\"familyAtmosphere\":\"2\",\"familyStructure\":\"1\",\"fosterLeftBehind\":\"Y\",\"gender\":\"0\",\"gradeId\":1,\"hardshipType\":\"5\",\"healthStatus\":\"1\",\"idCardNo\":\"330225200204203610\",\"isOnlyChild\":\"Y\",\"params\":{},\"parentOccupation\":\"\",\"remark\":\"\",\"reportStatus\":\"0\",\"selfHarmHistory\":\"0\",\"studentId\":112,\"studentName\":\"张三\",\"studentStatus\":\"01\",\"updateBy\":\"dmwxinli\",\"updateTime\":\"2025-10-04 19:24:06\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-04 19:24:06', 14);
INSERT INTO `sys_oper_log` VALUES (210, '学生状态变更', 2, 'com.ruoyi.dmw.controller.DmwStudentController.changeStatus()', 'POST', 1, 'dmwxinli', NULL, '/dmw/student/changeStatus', '127.0.0.1', '内网IP', '{\"createBy\":\"dmwxinli\",\"currentStatus\":\"02\",\"endDate\":\"2025-10-10\",\"logId\":106,\"params\":{},\"previousStatus\":\"01\",\"reason\":\"实习生\",\"startDate\":\"2025-10-01\",\"studentId\":112,\"studentName\":\"张三\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-04 19:24:26', 24);
INSERT INTO `sys_oper_log` VALUES (211, '全员升级', 2, 'com.ruoyi.dmw.controller.DmwStudentController.upgradeAll()', 'POST', 1, 'dmwxinli', NULL, '/dmw/student/upgradeAll', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"code\":200,\"data\":3}', 0, NULL, '2025-10-04 19:53:47', 21);
INSERT INTO `sys_oper_log` VALUES (212, '全员升级', 2, 'com.ruoyi.dmw.controller.DmwStudentController.upgradeAll()', 'POST', 1, 'dmwxinli', NULL, '/dmw/student/upgradeAll', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"code\":200,\"data\":3}', 0, NULL, '2025-10-04 19:54:26', 5);
INSERT INTO `sys_oper_log` VALUES (213, '六困生-学生信息', 2, 'com.ruoyi.dmw.controller.DmwStudentController.edit()', 'PUT', 1, 'dmwxinli', NULL, '/dmw/student', '127.0.0.1', '内网IP', '{\"address\":\"\",\"classId\":1,\"createBy\":\"\",\"createTime\":\"2025-10-04 13:08:53\",\"currentStatusReason\":\"\",\"delFlag\":\"0\",\"deptType\":\"1\",\"economicStatus\":\"2\",\"familyAtmosphere\":\"1\",\"familyStructure\":\"1\",\"fosterLeftBehind\":\"Y\",\"gender\":\"0\",\"gradeId\":5,\"hardshipType\":\"4\",\"healthStatus\":\"1\",\"idCardNo\":\"330225200202303623\",\"isOnlyChild\":\"Y\",\"params\":{},\"parentOccupation\":\"\",\"remark\":\"\",\"reportStatus\":\"0\",\"selfHarmHistory\":\"0\",\"studentId\":111,\"studentName\":\"十月四日\",\"studentStatus\":\"01\",\"updateBy\":\"dmwxinli\",\"updateTime\":\"2025-10-04 19:57:49\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-04 19:57:49', 19);
INSERT INTO `sys_oper_log` VALUES (214, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-07-22 14:43:20\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001,2014,2015,2016,2017,2018,2019,2002,2003,2004,2005,2006,2007],\"params\":{},\"roleId\":100,\"roleKey\":\"headteacher\",\"roleName\":\"班主任\",\"roleSort\":0,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-04 20:19:57', 27);
INSERT INTO `sys_oper_log` VALUES (215, '教师任教管理', 2, 'com.ruoyi.dmw.controller.DmwTeacherClassController.edit()', 'PUT', 1, 'dmwxinli', NULL, '/dmw/teach', '127.0.0.1', '内网IP', '{\"classId\":1,\"gradeId\":5,\"id\":100,\"params\":{},\"updateTime\":\"2025-10-04 20:58:33\",\"userId\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-04 20:58:34', 19);
INSERT INTO `sys_oper_log` VALUES (216, '教师任教管理', 2, 'com.ruoyi.dmw.controller.DmwTeacherClassController.edit()', 'PUT', 1, 'dmwxinli', NULL, '/dmw/teach', '127.0.0.1', '内网IP', '{\"classId\":1,\"gradeId\":3,\"id\":100,\"params\":{},\"updateTime\":\"2025-10-04 20:58:52\",\"userId\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-04 20:58:52', 5);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2025-07-17 13:18:17', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2025-07-17 13:18:17', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2025-07-17 13:18:17', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2025-07-17 13:18:17', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2025-07-17 13:18:17', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2025-07-17 13:18:17', '', NULL, '普通角色');
INSERT INTO `sys_role` VALUES (100, '班主任', 'headteacher', 0, '1', 1, 1, '0', '0', 'admin', '2025-07-22 14:43:20', 'admin', '2025-10-04 20:19:57', NULL);
INSERT INTO `sys_role` VALUES (101, '心理管理员', 'psychologist', 2, '1', 1, 1, '0', '0', 'admin', '2025-07-30 18:31:28', 'admin', '2025-08-31 17:42:36', NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 117);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);
INSERT INTO `sys_role_menu` VALUES (100, 2000);
INSERT INTO `sys_role_menu` VALUES (100, 2001);
INSERT INTO `sys_role_menu` VALUES (100, 2002);
INSERT INTO `sys_role_menu` VALUES (100, 2003);
INSERT INTO `sys_role_menu` VALUES (100, 2004);
INSERT INTO `sys_role_menu` VALUES (100, 2005);
INSERT INTO `sys_role_menu` VALUES (100, 2006);
INSERT INTO `sys_role_menu` VALUES (100, 2007);
INSERT INTO `sys_role_menu` VALUES (100, 2014);
INSERT INTO `sys_role_menu` VALUES (100, 2015);
INSERT INTO `sys_role_menu` VALUES (100, 2016);
INSERT INTO `sys_role_menu` VALUES (100, 2017);
INSERT INTO `sys_role_menu` VALUES (100, 2018);
INSERT INTO `sys_role_menu` VALUES (100, 2019);
INSERT INTO `sys_role_menu` VALUES (101, 1);
INSERT INTO `sys_role_menu` VALUES (101, 100);
INSERT INTO `sys_role_menu` VALUES (101, 1000);
INSERT INTO `sys_role_menu` VALUES (101, 1001);
INSERT INTO `sys_role_menu` VALUES (101, 1002);
INSERT INTO `sys_role_menu` VALUES (101, 1003);
INSERT INTO `sys_role_menu` VALUES (101, 1004);
INSERT INTO `sys_role_menu` VALUES (101, 1005);
INSERT INTO `sys_role_menu` VALUES (101, 1006);
INSERT INTO `sys_role_menu` VALUES (101, 2000);
INSERT INTO `sys_role_menu` VALUES (101, 2001);
INSERT INTO `sys_role_menu` VALUES (101, 2002);
INSERT INTO `sys_role_menu` VALUES (101, 2003);
INSERT INTO `sys_role_menu` VALUES (101, 2004);
INSERT INTO `sys_role_menu` VALUES (101, 2005);
INSERT INTO `sys_role_menu` VALUES (101, 2006);
INSERT INTO `sys_role_menu` VALUES (101, 2007);
INSERT INTO `sys_role_menu` VALUES (101, 2008);
INSERT INTO `sys_role_menu` VALUES (101, 2009);
INSERT INTO `sys_role_menu` VALUES (101, 2010);
INSERT INTO `sys_role_menu` VALUES (101, 2011);
INSERT INTO `sys_role_menu` VALUES (101, 2012);
INSERT INTO `sys_role_menu` VALUES (101, 2013);
INSERT INTO `sys_role_menu` VALUES (101, 2014);
INSERT INTO `sys_role_menu` VALUES (101, 2015);
INSERT INTO `sys_role_menu` VALUES (101, 2016);
INSERT INTO `sys_role_menu` VALUES (101, 2017);
INSERT INTO `sys_role_menu` VALUES (101, 2018);
INSERT INTO `sys_role_menu` VALUES (101, 2019);
INSERT INTO `sys_role_menu` VALUES (101, 2020);
INSERT INTO `sys_role_menu` VALUES (101, 2021);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '账号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `pwd_update_date` datetime NULL DEFAULT NULL COMMENT '密码最后更新时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2025-10-04 20:19:22', '2025-07-17 13:18:17', 'admin', '2025-07-17 13:18:17', '', '2025-10-04 20:19:22', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2025-07-17 13:18:17', '2025-07-17 13:18:17', 'admin', '2025-07-17 13:18:17', '', NULL, '测试员');
INSERT INTO `sys_user` VALUES (100, NULL, '301', '301班主任昵称', '00', '', '', '0', '', '$2a$10$YlfokPm5g2ZPakD1J/tqluX/XzkxiQ4FRdDQ3hz3dNobFSRDxyW1e', '0', '0', '127.0.0.1', '2025-10-04 20:27:51', NULL, 'admin', '2025-07-22 14:48:10', '', '2025-10-04 20:27:51', NULL);
INSERT INTO `sys_user` VALUES (101, NULL, '302', '302班主任昵称', '00', '', '', '0', '', '$2a$10$PcCBODz7e.8BSGpn/ElZheelKS.//z6q1T3CqzWsCqFTRVN0Ubv7e', '0', '0', '127.0.0.1', '2025-07-22 15:15:49', NULL, 'admin', '2025-07-22 14:48:35', 'admin', '2025-07-22 15:15:49', NULL);
INSERT INTO `sys_user` VALUES (102, NULL, 'dmwxinli', '张洁', '00', '', '', '0', '', '$2a$10$HRkzR/DdaQEvGgEOID9psOuCshD.iT5WlyOEQujIDOynNWn9BUwA2', '0', '0', '127.0.0.1', '2025-10-04 19:52:01', NULL, 'admin', '2025-07-30 18:33:30', '', '2025-10-04 19:52:00', NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (100, 100);
INSERT INTO `sys_user_role` VALUES (101, 100);
INSERT INTO `sys_user_role` VALUES (102, 101);

SET FOREIGN_KEY_CHECKS = 1;
