/*
 Navicat Premium Data Transfer

 Source Server         : BYSJ
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : localhost:3306
 Source Schema         : vue-stu-manager

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 10/05/2024 20:12:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for class_course
-- ----------------------------
DROP TABLE IF EXISTS `class_course`;
CREATE TABLE `class_course`  (
  `class_course_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `course_id` int(11) NULL DEFAULT NULL COMMENT '课程id',
  `class_id` int(11) NULL DEFAULT NULL COMMENT '班级id',
  `course_year` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '年份',
  `type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '学期：0：春季学期 1：秋季学期',
  `teacher_id` int(11) NULL DEFAULT NULL COMMENT '教师id',
  PRIMARY KEY (`class_course_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 315 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of class_course
-- ----------------------------
INSERT INTO `class_course` VALUES (3, 6, 1, '2021', '1', 1);
INSERT INTO `class_course` VALUES (22, 6, 17, '2024', '0', 1);
INSERT INTO `class_course` VALUES (23, 8, 1, '2024', '0', 14);
INSERT INTO `class_course` VALUES (24, 8, 14, '2024', '0', 14);
INSERT INTO `class_course` VALUES (25, 8, 16, '2024', '0', 14);
INSERT INTO `class_course` VALUES (26, 8, 17, '2024', '0', 14);
INSERT INTO `class_course` VALUES (27, 8, 12, '2024', '0', 14);
INSERT INTO `class_course` VALUES (33, 11, 19, '2024', '0', 15);
INSERT INTO `class_course` VALUES (35, 6, 17, '2023', '1', 1);
INSERT INTO `class_course` VALUES (45, 11, 19, '2023', '1', 15);
INSERT INTO `class_course` VALUES (46, 12, 19, '2023', '1', 16);
INSERT INTO `class_course` VALUES (68, 2, 1, '2022', '1', 3);
INSERT INTO `class_course` VALUES (73, 2, 2, '2022', '1', 3);
INSERT INTO `class_course` VALUES (78, 2, 21, '2022', '1', 3);
INSERT INTO `class_course` VALUES (108, 11, 1, '2024', '0', 8);
INSERT INTO `class_course` VALUES (109, 16, 1, '2024', '0', 2);
INSERT INTO `class_course` VALUES (110, 19, 1, '2024', '0', 28);
INSERT INTO `class_course` VALUES (111, 11, 2, '2024', '0', 8);
INSERT INTO `class_course` VALUES (112, 16, 2, '2024', '0', 2);
INSERT INTO `class_course` VALUES (113, 19, 2, '2024', '0', 28);
INSERT INTO `class_course` VALUES (114, 11, 21, '2024', '0', 8);
INSERT INTO `class_course` VALUES (115, 16, 21, '2024', '0', 2);
INSERT INTO `class_course` VALUES (116, 19, 21, '2024', '0', 28);
INSERT INTO `class_course` VALUES (117, 11, 9, '2023', '0', 8);
INSERT INTO `class_course` VALUES (118, 16, 9, '2023', '0', 2);
INSERT INTO `class_course` VALUES (119, 19, 9, '2023', '0', 28);
INSERT INTO `class_course` VALUES (120, 11, 11, '2023', '0', 8);
INSERT INTO `class_course` VALUES (121, 16, 11, '2023', '0', 2);
INSERT INTO `class_course` VALUES (122, 19, 11, '2023', '0', 28);
INSERT INTO `class_course` VALUES (123, 11, 12, '2023', '0', 8);
INSERT INTO `class_course` VALUES (124, 16, 12, '2023', '0', 2);
INSERT INTO `class_course` VALUES (125, 19, 12, '2023', '0', 28);
INSERT INTO `class_course` VALUES (126, 11, 3, '2024', '0', 8);
INSERT INTO `class_course` VALUES (127, 16, 3, '2024', '0', 2);
INSERT INTO `class_course` VALUES (128, 19, 3, '2024', '0', 28);
INSERT INTO `class_course` VALUES (129, 11, 4, '2024', '0', 8);
INSERT INTO `class_course` VALUES (130, 16, 4, '2024', '0', 2);
INSERT INTO `class_course` VALUES (131, 19, 4, '2024', '0', 28);
INSERT INTO `class_course` VALUES (132, 4, 1, '2023', '0', 32);
INSERT INTO `class_course` VALUES (133, 7, 1, '2023', '0', 30);
INSERT INTO `class_course` VALUES (134, 18, 1, '2023', '0', 2);
INSERT INTO `class_course` VALUES (135, 20, 1, '2023', '0', 16);
INSERT INTO `class_course` VALUES (136, 4, 2, '2023', '0', 32);
INSERT INTO `class_course` VALUES (137, 7, 2, '2023', '0', 30);
INSERT INTO `class_course` VALUES (138, 18, 2, '2023', '0', 2);
INSERT INTO `class_course` VALUES (139, 20, 2, '2023', '0', 16);
INSERT INTO `class_course` VALUES (140, 4, 21, '2023', '0', 32);
INSERT INTO `class_course` VALUES (141, 7, 21, '2023', '0', 30);
INSERT INTO `class_course` VALUES (142, 18, 21, '2023', '0', 2);
INSERT INTO `class_course` VALUES (143, 20, 21, '2023', '0', 16);
INSERT INTO `class_course` VALUES (144, 5, 1, '2023', '1', 31);
INSERT INTO `class_course` VALUES (145, 12, 1, '2023', '1', 16);
INSERT INTO `class_course` VALUES (146, 14, 1, '2023', '1', 8);
INSERT INTO `class_course` VALUES (147, 17, 1, '2023', '1', 29);
INSERT INTO `class_course` VALUES (148, 5, 2, '2023', '1', 31);
INSERT INTO `class_course` VALUES (149, 12, 2, '2023', '1', 16);
INSERT INTO `class_course` VALUES (150, 14, 2, '2023', '1', 8);
INSERT INTO `class_course` VALUES (151, 17, 2, '2023', '1', 29);
INSERT INTO `class_course` VALUES (152, 5, 21, '2023', '1', 31);
INSERT INTO `class_course` VALUES (153, 12, 21, '2023', '1', 16);
INSERT INTO `class_course` VALUES (154, 14, 21, '2023', '1', 8);
INSERT INTO `class_course` VALUES (155, 17, 21, '2023', '1', 29);
INSERT INTO `class_course` VALUES (156, 20, 9, '2022', '1', 16);
INSERT INTO `class_course` VALUES (157, 21, 9, '2022', '1', 16);
INSERT INTO `class_course` VALUES (158, 22, 9, '2022', '1', 32);
INSERT INTO `class_course` VALUES (159, 23, 9, '2022', '1', 30);
INSERT INTO `class_course` VALUES (160, 14, 9, '2022', '1', 8);
INSERT INTO `class_course` VALUES (161, 15, 9, '2022', '1', 8);
INSERT INTO `class_course` VALUES (162, 20, 9, '2022', '1', 16);
INSERT INTO `class_course` VALUES (163, 14, 11, '2022', '0', 8);
INSERT INTO `class_course` VALUES (164, 20, 11, '2022', '0', 16);
INSERT INTO `class_course` VALUES (165, 21, 11, '2022', '0', 16);
INSERT INTO `class_course` VALUES (166, 24, 11, '2022', '0', 9);
INSERT INTO `class_course` VALUES (167, 26, 11, '2022', '0', 20);
INSERT INTO `class_course` VALUES (168, 14, 12, '2022', '0', 8);
INSERT INTO `class_course` VALUES (169, 20, 12, '2022', '0', 16);
INSERT INTO `class_course` VALUES (170, 21, 12, '2022', '0', 16);
INSERT INTO `class_course` VALUES (171, 24, 12, '2022', '0', 9);
INSERT INTO `class_course` VALUES (172, 26, 12, '2022', '0', 20);
INSERT INTO `class_course` VALUES (173, 7, 11, '2022', '1', 30);
INSERT INTO `class_course` VALUES (174, 15, 11, '2022', '1', 8);
INSERT INTO `class_course` VALUES (175, 18, 11, '2022', '1', 2);
INSERT INTO `class_course` VALUES (176, 25, 11, '2022', '1', 20);
INSERT INTO `class_course` VALUES (177, 7, 12, '2022', '1', 30);
INSERT INTO `class_course` VALUES (178, 15, 12, '2022', '1', 8);
INSERT INTO `class_course` VALUES (179, 18, 12, '2022', '1', 2);
INSERT INTO `class_course` VALUES (180, 25, 12, '2022', '1', 20);
INSERT INTO `class_course` VALUES (181, 9, 11, '2022', '1', 19);
INSERT INTO `class_course` VALUES (182, 10, 11, '2022', '1', 9);
INSERT INTO `class_course` VALUES (183, 9, 12, '2022', '1', 19);
INSERT INTO `class_course` VALUES (184, 10, 12, '2022', '1', 9);
INSERT INTO `class_course` VALUES (185, 7, 3, '2023', '0', 30);
INSERT INTO `class_course` VALUES (186, 17, 3, '2023', '0', 29);
INSERT INTO `class_course` VALUES (187, 20, 3, '2023', '0', 16);
INSERT INTO `class_course` VALUES (188, 28, 3, '2023', '0', 3);
INSERT INTO `class_course` VALUES (189, 29, 3, '2023', '0', 31);
INSERT INTO `class_course` VALUES (190, 14, 3, '2023', '0', 8);
INSERT INTO `class_course` VALUES (191, 7, 4, '2023', '0', 30);
INSERT INTO `class_course` VALUES (192, 14, 4, '2023', '0', 8);
INSERT INTO `class_course` VALUES (193, 17, 4, '2023', '0', 29);
INSERT INTO `class_course` VALUES (194, 20, 4, '2023', '0', 16);
INSERT INTO `class_course` VALUES (195, 28, 4, '2023', '0', 3);
INSERT INTO `class_course` VALUES (196, 29, 4, '2023', '0', 31);
INSERT INTO `class_course` VALUES (197, 12, 3, '2023', '1', 16);
INSERT INTO `class_course` VALUES (198, 15, 3, '2023', '1', 8);
INSERT INTO `class_course` VALUES (199, 18, 3, '2023', '1', 2);
INSERT INTO `class_course` VALUES (200, 27, 3, '2023', '1', 29);
INSERT INTO `class_course` VALUES (201, 12, 4, '2023', '1', 16);
INSERT INTO `class_course` VALUES (202, 15, 4, '2023', '1', 8);
INSERT INTO `class_course` VALUES (203, 18, 4, '2023', '1', 2);
INSERT INTO `class_course` VALUES (204, 27, 4, '2023', '1', 29);
INSERT INTO `class_course` VALUES (205, 11, 5, '2023', '1', 8);
INSERT INTO `class_course` VALUES (206, 12, 5, '2023', '1', 16);
INSERT INTO `class_course` VALUES (207, 15, 5, '2023', '1', 8);
INSERT INTO `class_course` VALUES (208, 30, 5, '2023', '1', 7);
INSERT INTO `class_course` VALUES (209, 31, 5, '2023', '1', 7);
INSERT INTO `class_course` VALUES (210, 11, 6, '2023', '1', 8);
INSERT INTO `class_course` VALUES (211, 12, 6, '2023', '1', 16);
INSERT INTO `class_course` VALUES (212, 15, 6, '2023', '1', 8);
INSERT INTO `class_course` VALUES (213, 30, 6, '2023', '1', 7);
INSERT INTO `class_course` VALUES (214, 31, 6, '2023', '1', 7);
INSERT INTO `class_course` VALUES (215, 14, 5, '2024', '0', 8);
INSERT INTO `class_course` VALUES (216, 18, 5, '2024', '0', 2);
INSERT INTO `class_course` VALUES (217, 20, 5, '2024', '0', 16);
INSERT INTO `class_course` VALUES (218, 21, 5, '2024', '0', 16);
INSERT INTO `class_course` VALUES (219, 32, 5, '2024', '0', 18);
INSERT INTO `class_course` VALUES (220, 29, 5, '2024', '0', 31);
INSERT INTO `class_course` VALUES (227, 14, 6, '2024', '0', 8);
INSERT INTO `class_course` VALUES (228, 18, 6, '2024', '0', 2);
INSERT INTO `class_course` VALUES (229, 20, 6, '2024', '0', 16);
INSERT INTO `class_course` VALUES (230, 21, 6, '2024', '0', 16);
INSERT INTO `class_course` VALUES (231, 29, 6, '2024', '0', 31);
INSERT INTO `class_course` VALUES (232, 32, 6, '2024', '0', 18);
INSERT INTO `class_course` VALUES (233, 27, 5, '2024', '0', 29);
INSERT INTO `class_course` VALUES (234, 27, 6, '2024', '0', 29);
INSERT INTO `class_course` VALUES (235, 5, 7, '2023', '1', 31);
INSERT INTO `class_course` VALUES (236, 14, 7, '2023', '1', 8);
INSERT INTO `class_course` VALUES (237, 15, 7, '2023', '1', 8);
INSERT INTO `class_course` VALUES (238, 20, 7, '2023', '1', 16);
INSERT INTO `class_course` VALUES (239, 21, 7, '2023', '1', 16);
INSERT INTO `class_course` VALUES (240, 33, 7, '2023', '1', 21);
INSERT INTO `class_course` VALUES (241, 5, 8, '2023', '1', 31);
INSERT INTO `class_course` VALUES (242, 14, 8, '2023', '1', 8);
INSERT INTO `class_course` VALUES (243, 15, 8, '2023', '1', 8);
INSERT INTO `class_course` VALUES (244, 20, 8, '2023', '1', 16);
INSERT INTO `class_course` VALUES (245, 21, 8, '2023', '1', 16);
INSERT INTO `class_course` VALUES (246, 33, 8, '2023', '1', 21);
INSERT INTO `class_course` VALUES (247, 11, 7, '2024', '0', 8);
INSERT INTO `class_course` VALUES (248, 34, 7, '2024', '0', 22);
INSERT INTO `class_course` VALUES (249, 18, 7, '2024', '0', 2);
INSERT INTO `class_course` VALUES (250, 11, 8, '2024', '0', 8);
INSERT INTO `class_course` VALUES (251, 18, 8, '2024', '0', 2);
INSERT INTO `class_course` VALUES (252, 34, 8, '2024', '0', 22);
INSERT INTO `class_course` VALUES (253, 9, 13, '2023', '1', 19);
INSERT INTO `class_course` VALUES (254, 10, 13, '2023', '1', 9);
INSERT INTO `class_course` VALUES (259, 9, 14, '2023', '1', 19);
INSERT INTO `class_course` VALUES (260, 10, 14, '2023', '1', 9);
INSERT INTO `class_course` VALUES (261, 11, 14, '2023', '1', 8);
INSERT INTO `class_course` VALUES (262, 12, 14, '2023', '1', 16);
INSERT INTO `class_course` VALUES (263, 14, 14, '2023', '1', 8);
INSERT INTO `class_course` VALUES (265, 37, 14, '2023', '1', 23);
INSERT INTO `class_course` VALUES (266, 37, 13, '2023', '1', 23);
INSERT INTO `class_course` VALUES (267, 15, 13, '2024', '0', 8);
INSERT INTO `class_course` VALUES (268, 18, 13, '2024', '0', 2);
INSERT INTO `class_course` VALUES (269, 21, 13, '2024', '0', 16);
INSERT INTO `class_course` VALUES (270, 35, 13, '2024', '0', 19);
INSERT INTO `class_course` VALUES (271, 36, 13, '2024', '0', 23);
INSERT INTO `class_course` VALUES (277, 15, 14, '2024', '0', 8);
INSERT INTO `class_course` VALUES (278, 18, 14, '2024', '0', 2);
INSERT INTO `class_course` VALUES (279, 21, 14, '2024', '0', 16);
INSERT INTO `class_course` VALUES (280, 35, 14, '2024', '0', 19);
INSERT INTO `class_course` VALUES (281, 36, 14, '2024', '0', 23);
INSERT INTO `class_course` VALUES (282, 9, 16, '2023', '1', 19);
INSERT INTO `class_course` VALUES (283, 14, 16, '2023', '1', 8);
INSERT INTO `class_course` VALUES (284, 15, 16, '2023', '1', 8);
INSERT INTO `class_course` VALUES (285, 20, 16, '2023', '1', 16);
INSERT INTO `class_course` VALUES (286, 39, 16, '2023', '1', 24);
INSERT INTO `class_course` VALUES (287, 40, 16, '2023', '1', 15);
INSERT INTO `class_course` VALUES (288, 10, 16, '2024', '0', 9);
INSERT INTO `class_course` VALUES (289, 11, 16, '2024', '0', 8);
INSERT INTO `class_course` VALUES (290, 12, 16, '2024', '0', 16);
INSERT INTO `class_course` VALUES (291, 37, 16, '2024', '0', 23);
INSERT INTO `class_course` VALUES (292, 38, 16, '2024', '0', 24);
INSERT INTO `class_course` VALUES (293, 11, 13, '2023', '1', 8);
INSERT INTO `class_course` VALUES (294, 12, 13, '2023', '1', 16);
INSERT INTO `class_course` VALUES (295, 14, 13, '2023', '1', 8);
INSERT INTO `class_course` VALUES (296, 41, 13, '2023', '1', 33);
INSERT INTO `class_course` VALUES (297, 43, 13, '2023', '1', 25);
INSERT INTO `class_course` VALUES (298, 11, 17, '2023', '1', 8);
INSERT INTO `class_course` VALUES (299, 12, 17, '2023', '1', 16);
INSERT INTO `class_course` VALUES (300, 41, 17, '2023', '1', 33);
INSERT INTO `class_course` VALUES (301, 43, 17, '2023', '1', 25);
INSERT INTO `class_course` VALUES (302, 15, 17, '2023', '1', 8);
INSERT INTO `class_course` VALUES (303, 14, 17, '2024', '0', 8);
INSERT INTO `class_course` VALUES (304, 42, 17, '2024', '0', 33);
INSERT INTO `class_course` VALUES (305, 44, 17, '2024', '0', 25);
INSERT INTO `class_course` VALUES (306, 10, 18, '2023', '1', 9);
INSERT INTO `class_course` VALUES (307, 11, 18, '2023', '1', 8);
INSERT INTO `class_course` VALUES (308, 14, 18, '2023', '1', 8);
INSERT INTO `class_course` VALUES (309, 45, 18, '2023', '1', 34);
INSERT INTO `class_course` VALUES (310, 47, 18, '2023', '1', 35);
INSERT INTO `class_course` VALUES (311, 15, 18, '2024', '0', 8);
INSERT INTO `class_course` VALUES (312, 46, 18, '2024', '0', 34);
INSERT INTO `class_course` VALUES (313, 48, 18, '2024', '0', 35);
INSERT INTO `class_course` VALUES (314, 12, 18, '2024', '0', 16);

-- ----------------------------
-- Table structure for course_teacher
-- ----------------------------
DROP TABLE IF EXISTS `course_teacher`;
CREATE TABLE `course_teacher`  (
  `course_teacher_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `teacher_id` int(11) NULL DEFAULT NULL COMMENT '教师id',
  `course_id` int(11) NULL DEFAULT NULL COMMENT '课程id',
  PRIMARY KEY (`course_teacher_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course_teacher
-- ----------------------------
INSERT INTO `course_teacher` VALUES (3, 3, 2);
INSERT INTO `course_teacher` VALUES (7, 1, 6);
INSERT INTO `course_teacher` VALUES (8, 14, 8);
INSERT INTO `course_teacher` VALUES (21, 28, 19);
INSERT INTO `course_teacher` VALUES (22, 2, 16);
INSERT INTO `course_teacher` VALUES (23, 2, 18);
INSERT INTO `course_teacher` VALUES (24, 8, 15);
INSERT INTO `course_teacher` VALUES (25, 8, 14);
INSERT INTO `course_teacher` VALUES (26, 8, 11);
INSERT INTO `course_teacher` VALUES (27, 32, 1);
INSERT INTO `course_teacher` VALUES (28, 16, 20);
INSERT INTO `course_teacher` VALUES (29, 16, 12);
INSERT INTO `course_teacher` VALUES (30, 32, 4);
INSERT INTO `course_teacher` VALUES (31, 31, 5);
INSERT INTO `course_teacher` VALUES (32, 30, 7);
INSERT INTO `course_teacher` VALUES (33, 29, 17);
INSERT INTO `course_teacher` VALUES (34, 32, 22);
INSERT INTO `course_teacher` VALUES (35, 16, 21);
INSERT INTO `course_teacher` VALUES (36, 30, 23);
INSERT INTO `course_teacher` VALUES (37, 9, 10);
INSERT INTO `course_teacher` VALUES (38, 20, 26);
INSERT INTO `course_teacher` VALUES (39, 20, 25);
INSERT INTO `course_teacher` VALUES (40, 9, 24);
INSERT INTO `course_teacher` VALUES (41, 19, 9);
INSERT INTO `course_teacher` VALUES (42, 29, 27);
INSERT INTO `course_teacher` VALUES (43, 31, 29);
INSERT INTO `course_teacher` VALUES (45, 3, 28);
INSERT INTO `course_teacher` VALUES (46, 7, 30);
INSERT INTO `course_teacher` VALUES (47, 7, 31);
INSERT INTO `course_teacher` VALUES (48, 18, 32);
INSERT INTO `course_teacher` VALUES (49, 21, 33);
INSERT INTO `course_teacher` VALUES (50, 22, 34);
INSERT INTO `course_teacher` VALUES (51, 19, 35);
INSERT INTO `course_teacher` VALUES (52, 23, 36);
INSERT INTO `course_teacher` VALUES (53, 23, 37);
INSERT INTO `course_teacher` VALUES (54, 24, 38);
INSERT INTO `course_teacher` VALUES (55, 24, 39);
INSERT INTO `course_teacher` VALUES (56, 15, 40);
INSERT INTO `course_teacher` VALUES (57, 25, 43);
INSERT INTO `course_teacher` VALUES (58, 25, 44);
INSERT INTO `course_teacher` VALUES (59, 33, 41);
INSERT INTO `course_teacher` VALUES (60, 33, 42);
INSERT INTO `course_teacher` VALUES (61, 35, 47);
INSERT INTO `course_teacher` VALUES (62, 35, 48);
INSERT INTO `course_teacher` VALUES (63, 34, 45);
INSERT INTO `course_teacher` VALUES (64, 34, 46);

-- ----------------------------
-- Table structure for record_feedback
-- ----------------------------
DROP TABLE IF EXISTS `record_feedback`;
CREATE TABLE `record_feedback`  (
  `record_feedback_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '反馈记录id',
  `student_id` int(11) NULL DEFAULT NULL COMMENT '学生id',
  `record_id` int(11) NULL DEFAULT NULL COMMENT '记录id',
  `type` int(11) NULL DEFAULT NULL COMMENT '反馈类型',
  `status` int(11) NULL DEFAULT NULL COMMENT '反馈状态',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `student_feedback` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '学生反馈信息',
  `admin_feedback` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '管理员反馈信息',
  PRIMARY KEY (`record_feedback_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of record_feedback
-- ----------------------------
INSERT INTO `record_feedback` VALUES (15, 67, 7, 1, 2, '2024-04-21 20:51:39', '2024-04-21 20:57:39', NULL, NULL);
INSERT INTO `record_feedback` VALUES (16, 1, 7, 1, 1, '2024-04-22 20:55:26', '2024-04-22 21:02:30', NULL, NULL);
INSERT INTO `record_feedback` VALUES (18, 1, 7, 1, 2, '2024-04-27 18:52:57', '2024-04-29 00:21:15', NULL, NULL);
INSERT INTO `record_feedback` VALUES (19, 1, 6, 0, 1, '2024-04-28 19:07:40', '2024-05-05 13:18:41', NULL, NULL);
INSERT INTO `record_feedback` VALUES (28, 1, 14, 0, 0, '2024-05-01 19:36:53', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for record_student
-- ----------------------------
DROP TABLE IF EXISTS `record_student`;
CREATE TABLE `record_student`  (
  `record_student_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `student_id` int(11) NULL DEFAULT NULL COMMENT '学生id',
  `record_id` int(11) NULL DEFAULT NULL COMMENT '记录id',
  PRIMARY KEY (`record_student_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of record_student
-- ----------------------------
INSERT INTO `record_student` VALUES (7, 1, 5);
INSERT INTO `record_student` VALUES (8, 2, 5);
INSERT INTO `record_student` VALUES (9, 1, 2);
INSERT INTO `record_student` VALUES (10, 4, 5);
INSERT INTO `record_student` VALUES (11, 18, 5);
INSERT INTO `record_student` VALUES (12, 45, 5);
INSERT INTO `record_student` VALUES (13, 67, 4);
INSERT INTO `record_student` VALUES (14, 67, 5);
INSERT INTO `record_student` VALUES (15, 1, 6);
INSERT INTO `record_student` VALUES (16, 2, 2);
INSERT INTO `record_student` VALUES (17, 3, 2);
INSERT INTO `record_student` VALUES (18, 2, 6);
INSERT INTO `record_student` VALUES (19, 1, 7);
INSERT INTO `record_student` VALUES (20, 1, 15);
INSERT INTO `record_student` VALUES (21, 1, 14);
INSERT INTO `record_student` VALUES (22, 1, 6);

-- ----------------------------
-- Table structure for school_class
-- ----------------------------
DROP TABLE IF EXISTS `school_class`;
CREATE TABLE `school_class`  (
  `class_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '班级id',
  `major_id` int(11) NULL DEFAULT NULL COMMENT '专业id',
  `class_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '班级名称',
  `class_year` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '学年',
  `order_num` int(11) NULL DEFAULT NULL COMMENT '序号',
  PRIMARY KEY (`class_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of school_class
-- ----------------------------
INSERT INTO `school_class` VALUES (1, 1, '软件工程1班', '2020', 17);
INSERT INTO `school_class` VALUES (2, 1, '软件工程2班', '2020', 18);
INSERT INTO `school_class` VALUES (3, 2, '计算机科学与技术2班', '2020', 16);
INSERT INTO `school_class` VALUES (4, 2, '计算机科学与技术1班', '2020', 15);
INSERT INTO `school_class` VALUES (5, 3, '机械设计制造及其自动化2班', '2022', 4);
INSERT INTO `school_class` VALUES (6, 3, '机械设计制造及其自动化1班', '2022', 3);
INSERT INTO `school_class` VALUES (7, 4, '测控技术与仪器1班', '2022', 1);
INSERT INTO `school_class` VALUES (8, 4, '测控技术与仪器2班', '2022', 2);
INSERT INTO `school_class` VALUES (9, 5, '信息与计算科学1班', '2019', 7);
INSERT INTO `school_class` VALUES (11, 6, '金融数学2班', '2019', 6);
INSERT INTO `school_class` VALUES (12, 6, '金融数学1班', '2019', 5);
INSERT INTO `school_class` VALUES (13, 7, '会计学2班', '2021', 12);
INSERT INTO `school_class` VALUES (14, 7, '会计学1班', '2021', 11);
INSERT INTO `school_class` VALUES (16, 8, '审计学1班', '2021', 13);
INSERT INTO `school_class` VALUES (17, 9, '行政管理1班', '2023', 9);
INSERT INTO `school_class` VALUES (18, 10, '旅游管理1班', '2023', 10);
INSERT INTO `school_class` VALUES (21, 1, '软件工程3班', '2020', 19);

-- ----------------------------
-- Table structure for school_college
-- ----------------------------
DROP TABLE IF EXISTS `school_college`;
CREATE TABLE `school_college`  (
  `college_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '学院id',
  `college_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '学院名称',
  `order_num` int(11) NULL DEFAULT NULL COMMENT '序号',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`college_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of school_college
-- ----------------------------
INSERT INTO `school_college` VALUES (1, '应用技术学院', 1, '2024-04-06 17:47:36');
INSERT INTO `school_college` VALUES (2, '机械工程学院', 2, '2024-04-06 17:48:41');
INSERT INTO `school_college` VALUES (3, '理学院', 3, '2024-04-06 17:51:15');
INSERT INTO `school_college` VALUES (4, '会计学院', 4, '2024-04-06 18:02:15');
INSERT INTO `school_college` VALUES (5, '管理学院', 5, '2024-04-06 18:04:26');

-- ----------------------------
-- Table structure for school_course
-- ----------------------------
DROP TABLE IF EXISTS `school_course`;
CREATE TABLE `school_course`  (
  `course_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '课程id',
  `course_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '课程名称',
  `course_desc` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  `credit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '1' COMMENT '学分',
  `duration` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0.5' COMMENT '学时',
  PRIMARY KEY (`course_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of school_course
-- ----------------------------
INSERT INTO `school_course` VALUES (4, '数据结构与算法', '算法', '2', '32');
INSERT INTO `school_course` VALUES (5, '系统分析与设计', '理论（2.0）-实验（1.0）', '3', '48');
INSERT INTO `school_course` VALUES (7, '大数据处理技术', '大数据处理技术 理论（2.0）-实验（1.0）', '3', '48');
INSERT INTO `school_course` VALUES (9, '会计学', '会计学', '3', '48');
INSERT INTO `school_course` VALUES (10, '经济学', '经济学', '3', '48');
INSERT INTO `school_course` VALUES (11, '形势与政策', '形势与政策', '1', '16');
INSERT INTO `school_course` VALUES (12, '线性代数', '线性代数', '2', '32');
INSERT INTO `school_course` VALUES (14, '马克思主义基本原理', '马克思主义基本原理 理论（2.0）', '2', '32');
INSERT INTO `school_course` VALUES (15, '社会主义发展史', '社会主义发展史 理论（2.0）', '2', '32');
INSERT INTO `school_course` VALUES (16, '就业指导', '就业指导 理论（1.0）', '1', '16');
INSERT INTO `school_course` VALUES (17, '人工智能导论', '人工智能导论 理论（4.0）-实验（2.0）', '6', '72');
INSERT INTO `school_course` VALUES (18, '创新创业实践课程', '创新创业实践课程 实验（1.0）', '1', '16');
INSERT INTO `school_course` VALUES (19, '毕业实习与毕业设计（论文）', '毕业实习与毕业设计（论文） 实验（15.0）', '15', '240');
INSERT INTO `school_course` VALUES (20, '概率与数理统计', '概率与数理统计 理论（2.0）', '2', '32');
INSERT INTO `school_course` VALUES (21, '高等代数', '高等代数', '3', '48');
INSERT INTO `school_course` VALUES (22, '算法分析与设计', '算法分析与设计 理论（2.0）-实验（1.0）', '3', '48');
INSERT INTO `school_course` VALUES (23, '大数据算法设计与实现', '大数据算法设计与实现 理论（3.0）-实验（1.0)', '4', '64');
INSERT INTO `school_course` VALUES (24, '数理金融', '数理金融', '2', '32');
INSERT INTO `school_course` VALUES (25, '金融衍生产品定价', '金融衍生产品定价 理论（1.0）', '1', '16');
INSERT INTO `school_course` VALUES (26, 'SAS软件与R技术', 'SAS软件与R技术 实验（2.0）', '2', '32');
INSERT INTO `school_course` VALUES (27, '机器人技术基础', '机器人技术基础', '2', '32');
INSERT INTO `school_course` VALUES (28, '数据库原理及应用', '数据库原理及应用 理论（2.0）-实验（1.0）', '3', '48');
INSERT INTO `school_course` VALUES (29, '汇编语言程序设计', '汇编语言程序设计 实验（2.0）', '2', '32');
INSERT INTO `school_course` VALUES (30, '机械设计基础', '机械设计基础 理论（2.0）', '2', '32');
INSERT INTO `school_course` VALUES (31, '机械制图', '机械制图 实验（2.0）', '2', '32');
INSERT INTO `school_course` VALUES (32, '机械系统建模与模拟', '机械系统建模与模拟 实验（3.0）', '3', '48');
INSERT INTO `school_course` VALUES (33, '传感器原理及应用', '传感器原理及应用', '3', '48');
INSERT INTO `school_course` VALUES (34, '测控技术与仪器专业实验', '测控技术与仪器专业实验 实验（2.0）', '2', '32');
INSERT INTO `school_course` VALUES (35, '会计软件应用', '会计软件应用 实验（2.0）', '2', '32');
INSERT INTO `school_course` VALUES (36, '中级财务会计', '中级财务会计', '3', '48');
INSERT INTO `school_course` VALUES (37, '财务管理', '财务管理', '2', '32');
INSERT INTO `school_course` VALUES (38, '审计实务', '审计实务', '3', '48');
INSERT INTO `school_course` VALUES (39, '审计学基础', '审计学基础', '2', '32');
INSERT INTO `school_course` VALUES (40, '审计学', '审计学', '3', '48');
INSERT INTO `school_course` VALUES (41, '政治学管理', '政治学管理', '3', '48');
INSERT INTO `school_course` VALUES (42, '行政学原理', '行政学原理', '2', '32');
INSERT INTO `school_course` VALUES (43, '人力资源开发与管理', '人力资源开发与管理', '2', '32');
INSERT INTO `school_course` VALUES (44, '人力资源管理实务', '人力资源管理实务', '2', '32');
INSERT INTO `school_course` VALUES (45, '旅游概论', '旅游概论', '1', '16');
INSERT INTO `school_course` VALUES (46, '旅游政策与法规', '旅游政策与法规', '2', '32');
INSERT INTO `school_course` VALUES (47, '旅游经营与管理', '旅游经营与管理', '3', '48');
INSERT INTO `school_course` VALUES (48, '旅游策划理论与实务', '旅游策划理论与实务', '3', '48');

-- ----------------------------
-- Table structure for school_major
-- ----------------------------
DROP TABLE IF EXISTS `school_major`;
CREATE TABLE `school_major`  (
  `major_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '专业id',
  `college_id` int(11) NULL DEFAULT NULL COMMENT '学院id',
  `major_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '专业名称',
  `order_num` int(11) NULL DEFAULT NULL COMMENT '序号',
  PRIMARY KEY (`major_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of school_major
-- ----------------------------
INSERT INTO `school_major` VALUES (1, 1, '软件工程', 1);
INSERT INTO `school_major` VALUES (2, 1, '计算机科学与技术', 2);
INSERT INTO `school_major` VALUES (3, 2, '机械设计制造及其自动化', 3);
INSERT INTO `school_major` VALUES (4, 2, '测控技术与仪器', 4);
INSERT INTO `school_major` VALUES (5, 3, '信息与计算科学', 5);
INSERT INTO `school_major` VALUES (6, 3, '金融数学', 6);
INSERT INTO `school_major` VALUES (7, 4, '会计学', 7);
INSERT INTO `school_major` VALUES (8, 4, '审计学', 8);
INSERT INTO `school_major` VALUES (9, 5, '行政管理', 9);
INSERT INTO `school_major` VALUES (10, 5, '旅游管理', 10);

-- ----------------------------
-- Table structure for school_student
-- ----------------------------
DROP TABLE IF EXISTS `school_student`;
CREATE TABLE `school_student`  (
  `stu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '学生id',
  `class_id` int(11) NULL DEFAULT NULL COMMENT '班级id',
  `stu_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '学生姓名',
  `sex` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT ' 性别 0：男 1：女',
  `phone` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '电话',
  `into_time` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '入学时间',
  `stu_num` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '学号',
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '密码',
  PRIMARY KEY (`stu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 529 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of school_student
-- ----------------------------
INSERT INTO `school_student` VALUES (1, 17, '肖俊', '0', '15213415772', '2023-09', '12308120124', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (2, 17, '雷林骏', '0', '13108987136', '2023-09', '12308120123', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (3, 17, '王嘉伟', '0', '19923573480', '2023-09', '12308120122', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (4, 17, '胡丙林', '0', '18996129493', '2023-09', '12308120121', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (5, 17, '王德林', '0', '17772318134', '2023-09', '12308120120', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (6, 17, '彭韩毅', '0', '13696401495', '2023-09', '12308120119', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (7, 17, '程玉婷', '1', '18117414360', '2023-09', '12308120118', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (8, 17, '陈靖渝', '0', '17623565725', '2023-09', '12308120117', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (9, 17, '蒋鹏', '0', '18883345615', '2023-09', '12308120116', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (10, 17, '景玉亮', '0', '17823782386', '2023-09', '12308120115', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (11, 17, '胡温馨', '1', '13272507479', '2023-09', '12308120111', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (12, 17, '蒋千', '0', '18290382141', '2023-09', '12308120110', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (13, 17, '周华', '0', '18302334194', '2023-09', '12308120109', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (14, 17, '叶倩', '1', '15703066754', '2023-09', '12308120108', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (15, 17, '余旺', '0', '18223257784', '2023-09', '12308120107', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (16, 17, '徐丹栗', '1', '18725930254', '2023-09', '12308120106', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (17, 17, '董志国', '0', '18203050498', '2023-09', '12308120105', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (18, 17, '李治江', '0', '19922343408', '2023-09', '12308120114', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (19, 17, '钱楚焓', '1', '17623062674', '2023-09', '12308120113', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (20, 17, '何诗蒨', '1', '15723027826', '2023-09', '12308120112', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (21, 17, '刘春伶', '1', '18725729695', '2023-09', '12308120104', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (22, 17, '吴沁玲', '1', '18375874017', '2023-09', '12308120103', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (23, 17, '江楠', '0', '17265691142', '2023-09', '12308120102', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (24, 17, '张冬梅', '1', '18324117266', '2023-09', '12308120101', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (25, 18, '温俊豪', '0', '15683488409', '2023-09', '12308130122', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (26, 18, '安荣强', '0', '18223519001', '2023-09', '12308130121', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (27, 18, '江雅茹', '1', '18983039707', '2023-09', '12308130120', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (28, 18, '彭婧雯', '1', '18723006563', '2023-09', '12308130119', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (29, 18, '黄英杰', '0', '18375870563', '2023-09', '12308130118', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (30, 18, '黄丽利', '1', '18323676824', '2023-09', '12308130117', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (31, 18, '贺奇', '0', '17815006215', '2023-09', '12308130116', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (32, 18, '钟定胜', '0', '13028388806', '2023-09', '12308130115', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (33, 18, '刘杰', '0', '15375861306', '2023-09', '12308130114', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (34, 18, '袁伟平', '0', '18723004798', '2023-09', '12308130113', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (35, 18, '王雯豪', '0', '13883810462', '2023-09', '12308130112', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (36, 18, '焦瀚', '0', '18290565960', '2023-09', '12308130111', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (37, 18, '邓文婷', '1', '15823228774', '2023-09', '12308130110', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (38, 18, '陈姝杉', '1', '17823515491', '2023-09', '12308130109', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (39, 18, '鲜财磊', '0', '17702388014', '2023-09', '12308130108', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (40, 18, '李雨珈', '1', '13896289863', '2023-09', '12308130107', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (41, 18, '黄家齐', '0', '15683889087', '2023-09', '12308130106', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (42, 18, '谢思楹', '1', '15086982817', '2023-09', '12308130105', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (43, 18, '游丰硕', '0', '15808018312', '2023-09', '12308130104', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (44, 18, '吴鸿斌', '0', '15215149965', '2023-09', '12308130103', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (45, 18, '刘骐玮', '0', '17830282295', '2023-09', '12308130102', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (46, 18, '杜育键', '0', '17823397376', '2023-09', '12308130101', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (137, 14, '谢亦欣', '1', '17830282295', '2021-09', '12102050120', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (138, 14, '罗涵', '1', '17823397376', '2021-09', '12102050119', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (139, 14, '陈银治', '1', '18983370013', '2021-09', '12102050118', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (140, 14, '肖军', '0', '18725651493', '2021-09', '12102050117', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (141, 14, '金峪竹', '1', '15310228409', '2021-09', '12102050116', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (142, 14, '朋怡', '1', '13983393714', '2021-09', '12102050115', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (143, 14, '贺蜀清', '0', '13030414238', '2021-09', '12102050114', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (144, 14, '冯巧渝', '1', '17823891930', '2021-09', '12102050113', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (145, 14, '涂彩莹', '1', '18375870376', '2021-09', '12102050112', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (146, 14, '谢欣', '1', '15823012372', '2021-09', '12102050111', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (147, 14, '余得智', '0', '17815047006', '2021-09', '12102050110', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (148, 14, '江楠', '0', '13290004143', '2021-09', '12102050109', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (149, 14, '翁晓雨', '1', '13708341404', '2021-09', '12102050108', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (150, 14, '胡龙生', '1', '18223141716', '2021-09', '12102050107', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (151, 14, '彭家欣', '1', '15736088611', '2021-09', '12102050106', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (152, 14, '张子越', '1', '13028391738', '2021-09', '12102050105', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (153, 14, '吴洁', '1', '15215011137', '2021-09', '12102050104', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (154, 14, '沈胜兰', '1', '13028391821', '2021-09', '12102050103', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (155, 14, '周雅萱', '1', '15086831532', '2021-09', '12102050102', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (156, 14, '夏丹妮', '1', '17623831453', '2021-09', '12102050101', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (157, 13, '任海琳', '1', '13637829746', '2021-09', '12102050226', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (158, 13, '周程彬', '0', '15823687716', '2021-09', '12102050225', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (159, 13, '陈馨莹', '1', '18623120085', '2021-09', '12102050224', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (160, 13, '穆彦辰', '0', '13637984483', '2021-09', '12102050223', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (161, 13, '谭佳欣', '1', '16808263104', '2021-09', '12102050222', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (162, 13, '周萍', '1', '18996486298', '2021-09', '12102050221', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (163, 13, '丁太洁', '1', '15825907161', '2021-09', '12102050220', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (164, 13, '江柯锐', '1', '18323382556', '2021-09', '12102050219', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (165, 13, '何运泽', '0', '18725855110', '2021-09', '12102050218', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (166, 13, '杨乐佳', '0', '18581149937', '2021-09', '12102050217', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (167, 13, '吴丹', '1', '18723008100', '2021-09', '12102050216', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (168, 13, '童庭轩', '1', '13594693605', '2021-09', '12102050215', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (169, 13, '程薪颖', '1', '13678412748', '2021-09', '12102050214', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (170, 13, '向珂', '1', '13629775283', '2021-09', '12102050213', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (171, 13, '甘羽锐', '1', '17823897913', '2021-09', '12102050212', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (172, 13, '项金飞', '1', '17623616331', '2021-09', '12102050211', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (173, 13, '龚雨欣', '1', '18223452120', '2021-09', '12102050210', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (174, 13, '任雪微', '1', '15923007240', '2021-09', '12102050209', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (175, 13, '孟龙', '0', '17323990165', '2021-09', '12102050208', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (176, 13, '卢馥祺', '1', '17830282295', '2021-09', '12102050207', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (177, 13, '吴长昊', '0', '17767367054', '2021-09', '12102050206', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (178, 13, '缪前进', '0', '13032377821', '2021-09', '12102050205', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (179, 13, '陈雄', '0', '18290591522', '2021-09', '12102050204', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (180, 13, '刘思雨', '1', '15702378011', '2021-09', '12102050203', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (181, 13, '徐凌峰', '1', '18183030193', '2021-09', '12102050202', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (182, 13, '曾俊', '0', '18523043696', '2021-09', '12102050201', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (183, 16, '田涵驰', '0', '15696219949', '2021-09', '12102060121', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (184, 16, '黄滟菁', '1', '19922201163', '2021-09', '12102060120', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (185, 16, '王冰洁', '1', '19923798281', '2021-09', '12102060119', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (186, 16, '王宥杰', '0', '15202356769', '2021-09', '12102060118', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (187, 16, '吴思思', '1', '18323421603', '2021-09', '12102060117', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (188, 16, '唐于雯', '1', '15178818710', '2021-09', '12102060116', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (189, 16, '张思媛', '1', '17823969140', '2021-09', '12102060115', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (190, 16, '李欢', '1', '18223518552', '2021-09', '12102060124', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (191, 16, '王颖', '1', '18623298927', '2021-09', '12102060123', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (192, 16, '王亚林', '1', '17783301291', '2021-09', '12102060122', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (193, 16, '楚伟萍', '1', '17320321251', '2021-09', '12102060114', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (194, 16, '王化媚', '1', '13883949593', '2021-09', '12102060113', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (195, 16, '吴俊豪', '0', '17815089082', '2021-09', '12102060112', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (196, 16, '何静', '1', '13635483370', '2021-09', '12102060111', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (197, 16, '徐鑫悅', '1', '13883410711', '2021-09', '12102060110', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (198, 16, '周璇', '1', '18931680909', '2021-09', '12102060109', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (199, 16, '邓雅文', '1', '17631236602', '2021-09', '12102060108', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (200, 16, '周佳炜', '0', '15223012551', '2021-09', '12102060125', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (201, 16, '李思勤', '1', '15222314860', '2021-09', '12102060126', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (202, 16, '杨蕊妮', '1', '15723637550', '2021-09', '12102060127', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (203, 16, '王思优', '1', '13368199249', '2021-09', '12102060107', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (204, 16, '尹艳兵', '0', '19923279528', '2021-09', '12102060106', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (205, 16, '陈美均', '1', '17623431765', '2021-09', '12102060105', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (206, 16, '王杰', '0', '15023641060', '2021-09', '12102060104', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (207, 16, '何希', '1', '15086841892', '2021-09', '12102060103', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (208, 16, '林堃', '0', '13365218768', '2021-09', '12102060102', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (209, 16, '袁梓敬', '0', '15826119728', '2021-09', '12102060101', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (210, 9, '王静萌', '1', '18323272946', '2019-09', '11901110136', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (211, 9, '周俊杰', '0', '19942398324', '2019-09', '11901110135', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (212, 9, '徐裕富', '0', '15730675659', '2019-09', '11901110133', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (213, 9, '张享琳', '1', '18883844411', '2019-09', '11901110134', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (214, 9, '张明杭', '0', '13436020073', '2019-09', '11901110132', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (215, 9, '程凡舰', '0', '17300273710', '2019-09', '11901110131', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (216, 9, '李英杰', '0', '19122375742', '2019-09', '11901110130', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (217, 9, '赵均荣', '0', '19112628657', '2019-09', '11901110129', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (218, 9, '刘恒', '0', '19122595913', '2019-09', '11901110128', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (219, 9, '危天意', '0', '13272670344', '2019-09', '11901110127', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (220, 9, '郭清滟', '1', '15213003512', '2019-09', '11901110126', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (221, 9, '杨舟', '0', '16808132177', '2019-09', '11901110125', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (222, 9, '张庆琳', '1', '13389639651', '2019-09', '11901110124', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (223, 9, '郑云津', '0', '15023304274', '2019-09', '11901110123', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (224, 9, '丁小琴', '1', '15523282497', '2019-09', '11901110122', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (225, 9, '陈婕', '1', '17383100041', '2019-09', '11901110121', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (226, 9, '康嘉奇', '0', '13883354495', '2019-09', '11901110120', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (227, 9, '刘凤', '1', '13272951456', '2019-09', '11901110119', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (228, 9, '刘渝莉', '1', '17602329307', '2019-09', '11901110118', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (229, 9, '向荣龙', '0', '17815185056', '2019-09', '11901110117', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (230, 9, '刘美彤', '1', '13274018291', '2019-09', '11901110116', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (231, 9, '杨茜', '1', '18306070968', '2019-09', '11901110115', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (232, 9, '代鑫', '0', '19112325374', '2019-09', '11901110114', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (233, 9, '周泽霖', '0', '17823147126', '2019-09', '11901110113', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (234, 9, '刘爽', '0', '15025481052', '2019-09', '11901110112', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (235, 9, '贾詹钰', '0', '18512321661', '2019-09', '11901110111', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (236, 9, '吴智悅', '0', '17830707970', '2019-09', '11901110110', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (237, 9, '何俊杰', '0', '13640522940', '2019-09', '11901110109', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (238, 9, '童欣', '0', '15723536174', '2019-09', '11901110108', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (239, 9, '陈楠', '0', '15025561527', '2019-09', '11901110107', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (240, 9, '黄浚翔', '0', '17602354906', '2019-09', '11901110106', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (241, 9, '傅韵竹', '1', '19923897830', '2019-09', '11901110105', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (242, 9, '马俊伟', '0', '17784457811', '2019-09', '11901110104', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (243, 9, '吴陶', '0', '18702386516', '2019-09', '11901110103', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (244, 9, '袁怡', '1', '15213277722', '2019-09', '11901110102', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (245, 12, '刘文奇', '0', '18580657827', '2019-09', '91901130123', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (246, 12, '朱宇涵', '0', '17726296376', '2019-09', '91901130122', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (247, 9, '王兆宇', '0', '15023855429', '2019-09', '11901110101', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (248, 12, '何虹剑', '0', '18223345572', '2019-09', '91901130121', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (249, 12, '喻泓睿', '0', '15922858354', '2019-09', '91901130120', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (250, 12, '陈强', '0', '19923922518', '2019-09', '91901130119', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (251, 12, '刘彦钦', '0', '13340375161', '2019-09', '91901130118', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (252, 12, '蒋淳西', '0', '13206197601', '2019-09', '91901130117', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (253, 12, '秦嘉山', '0', '15730454644', '2019-09', '91901130116', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (254, 12, '胡真雨', '1', '19923407772', '2019-09', '91901130115', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (255, 12, '吴洋', '0', '17384046101', '2019-09', '91901130114', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (256, 12, '史清怡', '1', '18723420017', '2019-09', '91901130113', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (257, 12, '李佳骏', '0', '13983096598', '2019-09', '91901130112', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (258, 12, '史莹鑫', '1', '19302324767', '2019-09', '91901130111', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (259, 12, '陈瑞', '0', '17815333514', '2019-09', '91901130110', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (260, 12, '王雪', '1', '19123349151', '2019-09', '91901130109', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (261, 12, '吕茂玲', '1', '15213054734', '2019-09', '91901130108', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (262, 12, '梁圳', '0', '19115154249', '2019-09', '91901130107', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (263, 12, '刘妍敏', '1', '13272532700', '2019-09', '91901130106', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (264, 12, '莫佳俊', '0', '19123386737', '2019-09', '91901130105', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (265, 12, '谭秀玲', '1', '15736660846', '2019-09', '91901130104', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (266, 12, '邱海望', '0', '18375783875', '2019-09', '91901130103', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (267, 12, '朱家豪', '0', '17265038741', '2019-09', '91901130102', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (268, 12, '刘淇', '1', '17623334025', '2019-09', '91901130101', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (269, 11, '余隽然', '0', '15523409536', '2019-09', '91901130220', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (270, 11, '邱锐', '1', '15084424412', '2019-09', '91901130219', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (271, 11, '涂浩然', '0', '18983856309', '2019-09', '91901130218', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (272, 11, '丁成凯', '0', '18716320669', '2019-09', '91901130217', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (273, 11, '文子元', '0', '18680889046', '2019-09', '91901130216', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (274, 11, '龙瑞琪', '1', '19922704041', '2019-09', '91901130215', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (275, 11, '王维维', '1', '18166379786', '2019-09', '91901130214', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (276, 11, '余玉鹏', '0', '18580213898', '2019-09', '91901130213', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (277, 11, '郭婷婷', '1', '15223257241', '2019-09', '91901130212', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (278, 11, '石亚霖', '0', '15870579563', '2019-09', '91901130211', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (279, 11, '王露', '1', '17772315751', '2019-09', '91901130210', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (280, 11, '刘春利', '1', '15696263852', '2019-09', '91901130209', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (281, 11, '李金泽', '0', '13098763264', '2019-09', '91901130208', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (282, 11, '陈佳禾', '0', '15696728445', '2019-09', '91901130207', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (283, 11, '唐沁', '0', '13022347866', '2019-09', '91901130206', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (284, 11, '唐林灿', '0', '18983906947', '2019-09', '91901130205', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (285, 11, '刘佳', '1', '15023027649', '2019-09', '91901130204', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (286, 11, '汪峻浩', '0', '15823836192', '2019-09', '91901130203', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (287, 11, '肖天易', '0', '19923897830', '2019-09', '91901130202', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (288, 11, '唐木生', '0', '17784457811', '2019-09', '91901130201', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (289, 6, '龙璇', '1', '13167918498', '2022-09', '12207730126', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (290, 6, '周极鹏', '0', '15086852137', '2022-09', '12207730125', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (291, 6, '冯飞', '0', '17623055413', '2022-09', '12207730124', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (292, 6, '卢莹静', '1', '13594290289', '2022-09', '12207730123', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (293, 6, '袁海峰', '0', '18580564380', '2022-09', '12207730122', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (294, 6, '胡文鑫', '0', '18512300573', '2022-09', '12207730121', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (295, 6, '史鑫睿', '1', '15736140262', '2022-09', '12207730120', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (296, 6, '程佳俊', '0', '16623160110', '2022-09', '12207730119', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (297, 6, '李果', '0', '15683050360', '2022-09', '12207730118', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (298, 6, '袁琳', '1', '13325576892', '2022-09', '12207730117', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (299, 6, '孙睿', '0', '15223026763', '2022-09', '12207730116', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (300, 6, '陶进杰', '0', '15328312645', '2022-09', '12207730115', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (301, 6, '黄磊', '0', '18925612100', '2022-09', '12207730114', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (302, 6, '孙思静', '1', '13594038170', '2022-09', '12207730113', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (303, 6, '高明慧', '1', '18983723374', '2022-09', '12207730112', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (304, 6, '何小龙', '0', '15823544860', '2022-09', '12207730111', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (305, 6, '陈咏连', '1', '15215267588', '2022-09', '12207730110', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (306, 6, '袁鹏举', '0', '16372502718', '2022-09', '12207730109', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (307, 6, '张佳玥', '1', '18123475288', '2022-09', '12207730108', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (308, 6, '李华', '0', '15320475520', '2022-09', '12207730107', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (309, 6, '朱世杰', '0', '13290005842', '2022-09', '12207730106', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (310, 6, '谢世杰', '0', '18716479157', '2022-09', '12207730105', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (311, 6, '冉苏', '0', '18166535667', '2022-09', '12207730104', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (312, 6, '张腾骏', '0', '19923209411', '2022-09', '12207730103', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (313, 6, '安佳雪', '1', '17898432106', '2022-09', '12207730102', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (314, 6, '文海翔', '0', '13272660906', '2022-09', '12207730101', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (315, 7, '魏利', '0', '16623023128', '2022-09', '12207740126', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (316, 7, '张涣璋', '0', '15736233267', '2022-09', '12207740125', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (317, 7, '李文倩', '1', '16851526612', '2022-09', '12207740124', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (318, 7, '蒲凤莲', '1', '15730112915', '2022-09', '12207740123', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (319, 5, '袁祥超', '0', '17830843654', '2022-09', '12207730223', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (320, 5, '刘旭（大）', '0', '17502360096', '2022-09', '12207730222', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (321, 5, '万嘉豪', '0', '13101062050', '2022-09', '12207730221', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (322, 5, '蒲恒廷', '0', '15310653205', '2022-09', '12207730220', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (323, 5, '刘宇航', '0', '17265686227', '2022-09', '12207730219', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (324, 5, '邹洋', '0', '19115484598', '2022-09', '12207730218', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (325, 5, '杨鑫宇', '1', '15213706426', '2022-09', '12207730217', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (326, 5, '陈静怡', '1', '18533230875', '2022-09', '12207730216', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (327, 5, '何家凯', '0', '17823421125', '2022-09', '12207730215', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (328, 5, '周财福', '0', '17623618221', '2022-09', '12207730214', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (329, 5, '胡开平', '0', '13648389736', '2022-09', '12207730213', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (330, 5, '石浩', '0', '13627602970', '2022-09', '12207730212', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (331, 5, '周中维', '0', '15123654712', '2022-09', '12207730211', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (332, 5, '曾中越', '0', '15736148696', '2022-09', '12207730210', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (333, 5, '杨鑫', '0', '13101227619', '2022-09', '12207730209', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (334, 5, '李卫威', '0', '18702365181', '2022-09', '12207730208', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (335, 5, '吴倩', '1', '18702356647', '2022-09', '12207730207', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (336, 5, '李荧', '0', '18725923084', '2022-09', '12207730206', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (337, 5, '王豪', '0', '13368330542', '2022-09', '12207730205', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (338, 5, '邓富元', '0', '19122514636', '2022-09', '12207730204', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (339, 5, '张孝贤', '0', '13042357834', '2022-09', '12207730203', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (340, 5, '廖苯钧', '0', '17623007973', '2022-09', '12207730202', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (341, 5, '李茜茜', '1', '17830114729', '2022-09', '12207730201', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (342, 7, '龙翔', '0', '17784075048', '2022-09', '12207740122', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (343, 7, '刘果', '0', '18884179168', '2022-09', '12207740121', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (344, 7, '李涛', '0', '15213415772', '2022-09', '12207740120', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (345, 7, '杨俊杰', '0', '15310419930', '2022-09', '12207740119', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (346, 7, '吴发艮', '0', '15086892048', '2022-09', '12207740118', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (347, 7, '方浏臣', '0', '15730114318', '2022-09', '12207740117', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (348, 7, '刘浩林', '0', '17384772234', '2022-09', '12207740116', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (349, 7, '邱星怡', '1', '13896138162', '2022-09', '12207740115', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (350, 7, '朱荣松', '0', '15025498017', '2022-09', '12207740114', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (351, 7, '赖佳雯', '1', '15823356331', '2022-09', '12207740113', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (352, 7, '周俊伟', '0', '13110125941', '2022-09', '12207740112', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (353, 7, '伍艺', '0', '18883918262', '2022-09', '12207740111', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (354, 7, '唐可', '1', '17815071792', '2022-09', '12207740110', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (355, 7, '吴泽华', '0', '15723295237', '2022-09', '12207740109', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (356, 7, '刘春霖', '0', '13628401324', '2022-09', '12207740108', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (357, 7, '金奇', '0', '18502368848', '2022-09', '12207740107', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (358, 7, '王清海', '0', '17384771855', '2022-09', '12207740106', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (359, 7, '郑玟', '1', '13752936047', '2022-09', '12207740105', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (360, 7, '闫文铧', '0', '15213228396', '2022-09', '12207740104', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (361, 7, '袁海', '0', '15923764197', '2022-09', '12207740103', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (362, 7, '周玉洁', '1', '13668406946', '2022-09', '12207740102', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (363, 7, '代宜洪', '0', '13983818986', '2022-09', '12207740101', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (364, 8, '陈如翔', '0', '17823588337', '2022-09', '12207740226', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (365, 8, '张颖', '1', '15320461046', '2022-09', '12207740225', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (366, 8, '冯毅', '0', '15123350658', '2022-09', '12207740224', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (367, 8, '余俊沿', '0', '13452494312', '2022-09', '12207740223', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (368, 8, '汪芙蓉', '1', '15523532138', '2022-09', '12207740222', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (369, 8, '戴玲', '1', '18083060907', '2022-09', '12207740221', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (370, 8, '王丽娟', '1', '13640541137', '2022-09', '12207740220', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (371, 8, '谢苗', '1', '15683264508', '2022-09', '12207740219', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (372, 8, '丁文龙', '0', '13452494312', '2022-09', '12207740218', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (373, 8, '李楠星', '0', '15523532138', '2022-09', '12207740217', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (374, 8, '李文雯', '1', '18083060907', '2022-09', '12207740216', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (375, 8, '刘秋豪', '0', '13640541137', '2022-09', '12207740215', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (376, 8, '蒋登琦', '0', '15683264508', '2022-09', '12207740214', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (377, 8, '周玉祥', '0', '17848611907', '2022-09', '12207740213', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (378, 8, '朱虹', '0', '19923195025', '2022-09', '12207740212', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (379, 8, '陈兴', '0', '19946831857', '2022-09', '12207740211', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (380, 8, '张艺川', '0', '17726689244', '2022-09', '12207740210', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (381, 8, '邓贵元', '0', '19123969822', '2022-09', '12207740209', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (382, 8, '李政', '0', '13594446709', '2022-09', '12207740208', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (383, 8, '陈浩', '0', '18923374606', '2022-09', '12207740207', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (384, 8, '李佳', '0', '13223349437', '2022-09', '12207740206', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (385, 8, '汪圆佳', '0', '13110172053', '2022-09', '12207740205', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (386, 8, '王好', '0', '13658524312', '2022-09', '12207740204', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (387, 8, '江坭蔓', '1', '19123349437', '2022-09', '12207740203', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (388, 8, '何泽静', '1', '17602361744', '2022-09', '12207740202', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (389, 8, '龙浩', '0', '19923374606', '2022-09', '12207740201', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (390, 1, '周华勇', '0', '15730175850', '2020-09', '92021380101', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (391, 1, '王鑫', '0', '17323808690', '2020-09', '92021380102', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (392, 1, '谢杰作', '0', '17623199167', '2020-09', '92021380103', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (393, 1, '赵容', '1', '13251318664', '2020-09', '92021380104', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (394, 1, '贺本隆', '0', '13272664961', '2020-09', '92021380105', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (395, 1, '唐怡', '1', '19112624590', '2020-09', '92021380106', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (396, 1, '程笛', '0', '15123971427', '2020-09', '92021380107', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (397, 1, '胡晓迪', '1', '19923841892', '2020-09', '92021380108', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (398, 1, '李义清', '0', '19923841892', '2020-09', '92021380109', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (399, 1, '彭昱珲', '0', '19923841892', '2020-09', '92021380110', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (400, 1, '李强', '0', '18996381437', '2020-09', '92021380111', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (401, 1, '青小雨', '1', '17725158844', '2020-09', '92021380112', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (402, 1, '谢友财', '0', '17623837877', '2020-09', '92021380113', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (403, 1, '何理', '1', '15730209056', '2020-09', '92021380114', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (404, 1, '杨秋龙', '0', '19123386604', '2020-09', '92021380115', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (405, 1, '刘崇颖', '1', '15322268452', '2020-09', '92021380116', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (406, 1, '骆小玲', '1', '15922954508', '2020-09', '92021380117', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (407, 1, '曾益', '1', '18580637026', '2020-09', '92021380118', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (408, 1, '郭帅', '0', '17823421716', '2020-09', '92021380119', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (409, 1, '秦开冰', '0', '15856027648', '2020-09', '92021380120', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (410, 1, '夏川奥', '0', '15310032359', '2020-09', '92021380121', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (411, 1, '蒋代龙', '0', '15922833975', '2020-09', '92021380122', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (412, 1, '张均波', '0', '19823454356', '2020-09', '92021380123', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (413, 1, '王垒', '0', '15823249894', '2020-09', '92021380124', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (414, 1, '张玉琴', '1', '15923006029', '2020-09', '92021380125', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (415, 1, '刘青松', '0', '17782165752', '2020-09', '92021380126', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (416, 1, '陈晓婧', '1', '15523532138', '2020-09', '92021380127', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (417, 2, '陶雪梅', '1', '13140292628', '2020-09', '92021380201', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (418, 2, '黄旭', '0', '17784393331', '2020-09', '92021380202', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (419, 2, '陈彪', '0', '15223130807', '2020-09', '92021380203', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (420, 2, '刘卓言', '0', '13320231439', '2020-09', '92021380204', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (421, 2, '朱玉秋', '1', '13512348242', '2020-09', '92021380205', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (422, 2, '张嘉欣', '0', '18223039964', '2020-09', '92021380206', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (423, 2, '奚志宏', '0', '15310930656', '2020-09', '92021380207', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (424, 2, '谭万伦', '1', '19942218208', '2020-09', '92021380208', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (425, 2, '张磊', '0', '13108941073', '2020-09', '92021380209', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (426, 2, '李怡贤', '1', '17764820400', '2020-09', '9202138010', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (427, 2, '钱楚焓', '1', '13140283380', '2020-09', '92021380211', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (428, 2, '沈祖山', '0', '17347799826', '2020-09', '92021380212', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (429, 2, '肖萍', '1', '17388217005', '2020-09', '92021380213', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO `school_student` VALUES (430, 2, '汤紫淇', '0', '15330454064', '2020-09', '92021380214', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (431, 2, '刘陆凤', '1', '19942268279', '2020-09', '92021380215', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (432, 2, '杨云鹏', '0', '18225491706', '2020-09', '92021380216', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (433, 2, '王啸天', '0', '17623187596', '2020-09', '92021380217', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (434, 2, '张霖', '0', '17623591031', '2020-09', '92021380218', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (435, 2, '魏宇航', '0', '17347820662', '2020-09', '92021380219', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (436, 2, '何俊豪', '0', '19123349145', '2020-09', '92021380220', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (437, 2, '翁家颖', '1', '13032321138', '2020-09', '92021380221', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (438, 2, '黄培林', '1', '13114099023', '2020-09', '92021380222', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (439, 2, '周虹吉', '0', '15213396989', '2020-09', '92021380223', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (440, 2, '翁明霞', '1', '19123108943', '2020-09', '92021380224', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (441, 2, '刘露', '1', '13011931686', '2020-09', '92021380225', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (442, 2, '曹思雨', '0', '17623165034', '2020-09', '92021380226', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (443, 2, '罗言', '0', '19123108168', '2020-09', '92021380227', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (444, 2, '段嘉欣', '1', '13032321698', '2020-09', '92021380228', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (445, 2, '刘婷婷', '1', '18323285779', '2020-09', '92021380229', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (446, 2, '张娜', '1', '13608309914', '2020-09', '92021380230', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (447, 2, '冉辉', '0', '13983019734', '2020-09', '92021380231', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (448, 21, '谢世坤', '0', '13983019734', '2020-09', '92021380301', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (449, 21, '屈金凤', '1', '18223032818', '2020-09', '92021380302', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (450, 21, '李重骄', '0', '16729010926', '2020-09', ' 92021380303', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (451, 21, '徐贵廷', '0', '16608342188', '2020-09', ' 92021380304', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (452, 21, '唐爽', '0', '13310260933', '2020-09', ' 92021380305', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (453, 21, '桑乙淞', '0', '17749913531', '2020-09', ' 92021380306', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (454, 21, '夏倩', '1', '15683007447', '2020-09', ' 92021380307', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (455, 21, '刘晏励', '1', '18323206083', '2020-09', ' 92021380308', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (456, 21, '谭丝竹', '1', '13251475203', '2020-09', ' 92021380309', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (457, 21, '罗德浩', '0', '19112358005', '2020-09', ' 92021380310', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (458, 21, '任航', '0', '19123349404', '2020-09', ' 92021380311', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (459, 21, '谭臻憬', '1', '15213225255', '2020-09', ' 92021380312', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (460, 21, '左乐', '0', '13077639981', '2020-09', ' 92021380313', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (461, 21, '聂宇帆', '0', '17623577026', '2020-09', ' 92021380314', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (462, 21, '周姝含', '1', '13002335857', '2020-09', ' 92021380315', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (463, 21, '谢婉莹', '1', '15823318458', '2020-09', ' 92021380316', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (464, 21, '杨胜洁', '1', '15520129702', '2020-09', ' 92021380317', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (465, 21, '任敏', '1', '17774998337', '2020-09', ' 92021380318', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (466, 21, '胡一曼', '1', '15736052231', '2020-09', ' 92021380319', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (467, 21, '李开杨', '1', '15736052231', '2020-09', ' 92021380320', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (468, 21, '蒋梓濠', '0', '15922905563', '2020-09', ' 92021380321', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (469, 21, '徐思洋', '0', '17383073268', '2020-09', ' 92021380322', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (470, 21, '段佳豪', '0', '17383073268', '2020-09', ' 92021380323', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (471, 21, '张元洁', '1', '18323081910', '2020-09', ' 92021380324', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (472, 4, '夏梦岭', '1', '17825158844', '2022-09', '92021410101', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (473, 4, '张枭', '0', '17623637877', '2022-09', '92021410102', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (474, 4, '何帅', '0', '15730208056', '2022-09', '92021410103', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (475, 4, '马庆', '1', '19123586604', '2022-09', '92021410104', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (476, 4, '吕梦娇', '1', '15322668452', '2022-09', '92021410105', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (477, 4, '刘帅', '0', '15922954508', '2022-09', '92021410106', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (478, 4, '梁隆莉', '1', '18580637026', '2022-09', '92021410107', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (479, 4, '王秘', '0', '17823421716', '2022-09', '92021410108', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (480, 4, '陈庚', '0', '15856027648', '2022-09', '92021410109', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (481, 4, '陈银', '0', '15310032359', '2022-09', '92021410110', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (482, 4, '王慧', '1', '15922833975', '2022-09', '92021410111', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (483, 4, '李锐敏', '1', '19823454356', '2022-09', '92021410112', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (484, 4, '邱小娟', '1', '15823249894', '2022-09', '92021410113', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (485, 4, '王帅', '0', '15923006029', '2022-09', '92021410114', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (486, 4, '蒋萱', '1', '17782165752', '2022-09', '92021410115', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (487, 4, '向城', '0', '13140292628', '2022-09', '92021410116', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (488, 4, '李泽维', '0', '17784393331', '2022-09', '92021410117', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (489, 4, '张有力', '0', '15223130807', '2022-09', '92021410118', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (490, 4, '张国龙', '0', '13320231439', '2022-09', '92021410119', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (491, 4, '李健', '0', '13512348242', '2022-09', '92021410120', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (492, 4, '欧阳雅婷', '1', '18223039964', '2022-09', '92021410121', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (493, 4, '赵玉娇', '1', '15310930656', '2022-09', '92021410122', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (494, 4, '邱章宇', '0', '19942218208', '2022-09', '92021410124', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (495, 4, '谢永豪', '0', '13108941073', '2022-09', '92021410125', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (496, 4, '周海洋', '0', '17764820400', '2022-09', '92021410126', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (497, 4, '何姝琦', '1', '13140283380', '2022-09', '92021410127', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (498, 4, '王霞', '1', '17347799826', '2022-09', '92021410128', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (499, 4, '徐文燕', '1', '17388217005', '2022-09', '92021410129', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (500, 3, '丁美琳', '1', '15330454064', '2022-09', '92021410202', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (501, 4, '贺明悦', '1', '19942268279', '2022-09', '92021410123', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (502, 3, '郑皓榕', '0', '18225491706', '2022-09', '92021410201', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (503, 3, '罗圣龙', '0', '17623187596', '2022-09', '92021410203', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (504, 3, '邓亚庭', '1', '17623591031', '2022-09', '92021410204', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (505, 3, '易丹丹', '1', '17347820662', '2022-09', '92021410205', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (506, 3, '盛理嘉', '0', '19123349145', '2022-09', '92021410206', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (507, 3, '王林', '0', '13032321138', '2022-09', '92021410207', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (508, 3, '夏琳傑', '1', '13114099023', '2022-09', '92021410208', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (509, 3, '许琳彦', '0', '15213396989', '2022-09', '92021410209', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (510, 3, '车臣', '0', '19123108943', '2022-09', '92021410210', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (511, 3, '冉茂民', '0', '13011931686', '2022-09', '92021410211', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (512, 3, '陈靖渝', '0', '17623165034', '2022-09', '92021410212', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (513, 3, '向永豪', '0', '19123108168', '2022-09', '92021410213', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (514, 3, '刘小容', '1', '13032321698', '2022-09', '92021410214', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (515, 3, '蒲逸炜', '1', '18323285779', '2022-09', '92021410215', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (516, 3, '邓正毅', '0', '13608309914', '2022-09', '92021410216', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (517, 3, '刘志鹏', '0', '13983019734', '2022-09', '92021410217', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (518, 3, '林伟', '0', '18223032818', '2022-09', '92021410218', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (519, 3, '蔡豪', '0', '16729010926', '2022-09', '92021410219', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (520, 3, '姚灿', '0', '15025498017', '2022-09', '92021410220', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (521, 3, '文天', '0', '15823356831', '2022-09', '92021410221', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (522, 3, '罗芳琴', '1', '13110125941', '2022-09', '92021410222', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (523, 3, '邹真莉', '1', '18883918262', '2022-09', '92021410223', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (524, 3, '石俊笃', '0', '17815071792', '2022-09', '92021410224', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (525, 3, '侯旭', '0', '15723295237', '2022-09', '92021410225', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (526, 3, '曾云镐', '0', '13628401324', '2022-09', '92021410226', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (527, 3, '余威翼', '0', '18502368848', '2022-09', '92021410227', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_student` VALUES (528, 3, '陈文迪', '0', '17384771855', '2022-09', '92021410228', 'f379eaf3c831b04de153469d1bec345e');

-- ----------------------------
-- Table structure for school_teacher
-- ----------------------------
DROP TABLE IF EXISTS `school_teacher`;
CREATE TABLE `school_teacher`  (
  `teacher_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '教师id',
  `teacher_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '教师姓名',
  `sex` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '性别',
  `phone` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '电话',
  `teacher_num` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '编号',
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '密码',
  PRIMARY KEY (`teacher_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of school_teacher
-- ----------------------------
INSERT INTO `school_teacher` VALUES (2, '张瑶', '1', '13028349915', '2020001', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_teacher` VALUES (3, '李旺', '0', '19946831857', '2023001', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_teacher` VALUES (7, '李先航', '0', '19802720019', '2018001', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_teacher` VALUES (8, '赵柳', '1', '17623199167', '2020002', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_teacher` VALUES (9, '孙丽丽', '1', '14564646546', '2021006', '202cb962ac59075b964b07152d234b70');
INSERT INTO `school_teacher` VALUES (12, '唐茜', '1', '15338457608', '2020008', '123456');
INSERT INTO `school_teacher` VALUES (15, '陈静一', '1', '13826310801', '2024001', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_teacher` VALUES (16, '吴军', '0', '15223384592', '2018010', 'f379eaf3c831b04de153469d1bec345e');
INSERT INTO `school_teacher` VALUES (18, '刘桂森', '0', '17784393331', '2018008', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO `school_teacher` VALUES (19, '黄雅婷', '1', '17851320809', '2023003', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO `school_teacher` VALUES (20, '黄浩', '0', '13030414238', '2029005', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO `school_teacher` VALUES (21, '万先智', '0', '15086831532', '2020012', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO `school_teacher` VALUES (22, '李海明', '0', '18375870563', '2020014', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO `school_teacher` VALUES (23, '林郁', '1', '13028391738', '2019018', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO `school_teacher` VALUES (24, '阮湖心', '1', '18008357600', '2021013', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO `school_teacher` VALUES (25, '汤鑫宇', '0', '13272507479', '2018016', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO `school_teacher` VALUES (26, '李海明', '0', '15703066754', '2023008', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO `school_teacher` VALUES (27, '黎厚文', '0', '17265691142', '2022004', '00c66aaf5f2c3f49946f15c1ad2ea0d3');
INSERT INTO `school_teacher` VALUES (28, '曾文涛', '0', '18290382141', '2019020', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO `school_teacher` VALUES (29, '张楠', '0', '18883345615', '2018006', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO `school_teacher` VALUES (30, '李小龙', '0', '13696801695', '2021008', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO `school_teacher` VALUES (31, '万星宇', '0', '17702388018', '2020016', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO `school_teacher` VALUES (32, '马小川', '0', '19130256602', '2024005', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO `school_teacher` VALUES (33, '李怡', '1', '18806145633', '2023015', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO `school_teacher` VALUES (34, '洪辉', '0', '15831182358', '2023018', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO `school_teacher` VALUES (35, '王琳', '1', '16677930168', '2022020', 'e10adc3949ba59abbe56e057f20f883e');

-- ----------------------------
-- Table structure for stu_points
-- ----------------------------
DROP TABLE IF EXISTS `stu_points`;
CREATE TABLE `stu_points`  (
  `point_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `stu_id` int(11) NULL DEFAULT NULL COMMENT '学生id',
  `course_id` int(11) NULL DEFAULT NULL COMMENT '课程id',
  `class_id` int(11) NULL DEFAULT NULL COMMENT '班级id',
  `point` decimal(18, 2) NULL DEFAULT NULL COMMENT '成绩',
  PRIMARY KEY (`point_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stu_points
-- ----------------------------
INSERT INTO `stu_points` VALUES (13, 1, 1, 1, 90.00);
INSERT INTO `stu_points` VALUES (14, 2, 1, 1, 85.00);
INSERT INTO `stu_points` VALUES (15, 45, 1, 1, 98.00);
INSERT INTO `stu_points` VALUES (16, 46, 1, 1, 99.00);
INSERT INTO `stu_points` VALUES (17, 67, 1, 1, 98.00);
INSERT INTO `stu_points` VALUES (18, 67, 2, 1, 80.00);

-- ----------------------------
-- Table structure for stu_role
-- ----------------------------
DROP TABLE IF EXISTS `stu_role`;
CREATE TABLE `stu_role`  (
  `stu_role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '学生角色id',
  `stu_id` int(11) NULL DEFAULT NULL COMMENT '学生id',
  `role_id` int(11) NULL DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`stu_role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1109 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stu_role
-- ----------------------------
INSERT INTO `stu_role` VALUES (3, 3, 2);
INSERT INTO `stu_role` VALUES (4, 4, 2);
INSERT INTO `stu_role` VALUES (8, 1, 2);
INSERT INTO `stu_role` VALUES (9, 2, 2);
INSERT INTO `stu_role` VALUES (10, 17, 2);
INSERT INTO `stu_role` VALUES (11, 18, 2);
INSERT INTO `stu_role` VALUES (40, 47, 2);
INSERT INTO `stu_role` VALUES (41, 48, 2);
INSERT INTO `stu_role` VALUES (42, 49, 2);
INSERT INTO `stu_role` VALUES (43, 50, 2);
INSERT INTO `stu_role` VALUES (44, 51, 2);
INSERT INTO `stu_role` VALUES (45, 52, 2);
INSERT INTO `stu_role` VALUES (46, 53, 2);
INSERT INTO `stu_role` VALUES (47, 54, 2);
INSERT INTO `stu_role` VALUES (48, 55, 2);
INSERT INTO `stu_role` VALUES (49, 56, 2);
INSERT INTO `stu_role` VALUES (50, 57, 2);
INSERT INTO `stu_role` VALUES (51, 58, 2);
INSERT INTO `stu_role` VALUES (52, 59, 2);
INSERT INTO `stu_role` VALUES (53, 60, 2);
INSERT INTO `stu_role` VALUES (54, 61, 2);
INSERT INTO `stu_role` VALUES (55, 62, 2);
INSERT INTO `stu_role` VALUES (56, 63, 2);
INSERT INTO `stu_role` VALUES (57, 64, 2);
INSERT INTO `stu_role` VALUES (58, 65, 2);
INSERT INTO `stu_role` VALUES (59, 66, 2);
INSERT INTO `stu_role` VALUES (60, 67, 2);
INSERT INTO `stu_role` VALUES (85, 91, 2);
INSERT INTO `stu_role` VALUES (86, 90, 2);
INSERT INTO `stu_role` VALUES (87, 89, 2);
INSERT INTO `stu_role` VALUES (88, 88, 2);
INSERT INTO `stu_role` VALUES (89, 84, 2);
INSERT INTO `stu_role` VALUES (90, 83, 2);
INSERT INTO `stu_role` VALUES (91, 82, 2);
INSERT INTO `stu_role` VALUES (92, 81, 2);
INSERT INTO `stu_role` VALUES (93, 80, 2);
INSERT INTO `stu_role` VALUES (94, 79, 2);
INSERT INTO `stu_role` VALUES (95, 78, 2);
INSERT INTO `stu_role` VALUES (96, 87, 2);
INSERT INTO `stu_role` VALUES (97, 86, 2);
INSERT INTO `stu_role` VALUES (98, 85, 2);
INSERT INTO `stu_role` VALUES (99, 77, 2);
INSERT INTO `stu_role` VALUES (100, 76, 2);
INSERT INTO `stu_role` VALUES (101, 75, 2);
INSERT INTO `stu_role` VALUES (102, 74, 2);
INSERT INTO `stu_role` VALUES (103, 73, 2);
INSERT INTO `stu_role` VALUES (104, 72, 2);
INSERT INTO `stu_role` VALUES (105, 71, 2);
INSERT INTO `stu_role` VALUES (106, 70, 2);
INSERT INTO `stu_role` VALUES (107, 69, 2);
INSERT INTO `stu_role` VALUES (108, 68, 2);
INSERT INTO `stu_role` VALUES (109, 92, 2);
INSERT INTO `stu_role` VALUES (110, 93, 2);
INSERT INTO `stu_role` VALUES (111, 94, 2);
INSERT INTO `stu_role` VALUES (112, 95, 2);
INSERT INTO `stu_role` VALUES (113, 96, 2);
INSERT INTO `stu_role` VALUES (114, 97, 2);
INSERT INTO `stu_role` VALUES (115, 98, 2);
INSERT INTO `stu_role` VALUES (116, 99, 2);
INSERT INTO `stu_role` VALUES (117, 100, 2);
INSERT INTO `stu_role` VALUES (118, 101, 2);
INSERT INTO `stu_role` VALUES (119, 102, 2);
INSERT INTO `stu_role` VALUES (120, 103, 2);
INSERT INTO `stu_role` VALUES (121, 104, 2);
INSERT INTO `stu_role` VALUES (122, 105, 2);
INSERT INTO `stu_role` VALUES (123, 106, 2);
INSERT INTO `stu_role` VALUES (124, 107, 2);
INSERT INTO `stu_role` VALUES (125, 108, 2);
INSERT INTO `stu_role` VALUES (126, 109, 2);
INSERT INTO `stu_role` VALUES (127, 110, 2);
INSERT INTO `stu_role` VALUES (128, 111, 2);
INSERT INTO `stu_role` VALUES (129, 112, 2);
INSERT INTO `stu_role` VALUES (130, 113, 2);
INSERT INTO `stu_role` VALUES (131, 114, 2);
INSERT INTO `stu_role` VALUES (132, 115, 2);
INSERT INTO `stu_role` VALUES (133, 116, 2);
INSERT INTO `stu_role` VALUES (134, 117, 2);
INSERT INTO `stu_role` VALUES (135, 118, 2);
INSERT INTO `stu_role` VALUES (136, 119, 2);
INSERT INTO `stu_role` VALUES (137, 120, 2);
INSERT INTO `stu_role` VALUES (138, 121, 2);
INSERT INTO `stu_role` VALUES (139, 122, 2);
INSERT INTO `stu_role` VALUES (140, 123, 2);
INSERT INTO `stu_role` VALUES (141, 124, 2);
INSERT INTO `stu_role` VALUES (142, 125, 2);
INSERT INTO `stu_role` VALUES (143, 126, 2);
INSERT INTO `stu_role` VALUES (144, 127, 2);
INSERT INTO `stu_role` VALUES (145, 128, 2);
INSERT INTO `stu_role` VALUES (146, 129, 2);
INSERT INTO `stu_role` VALUES (147, 130, 2);
INSERT INTO `stu_role` VALUES (148, 131, 2);
INSERT INTO `stu_role` VALUES (149, 132, 2);
INSERT INTO `stu_role` VALUES (150, 133, 2);
INSERT INTO `stu_role` VALUES (151, 134, 2);
INSERT INTO `stu_role` VALUES (152, 135, 2);
INSERT INTO `stu_role` VALUES (153, 136, 2);
INSERT INTO `stu_role` VALUES (154, 46, 2);
INSERT INTO `stu_role` VALUES (155, 45, 2);
INSERT INTO `stu_role` VALUES (156, 44, 2);
INSERT INTO `stu_role` VALUES (157, 43, 2);
INSERT INTO `stu_role` VALUES (158, 42, 2);
INSERT INTO `stu_role` VALUES (159, 41, 2);
INSERT INTO `stu_role` VALUES (160, 40, 2);
INSERT INTO `stu_role` VALUES (161, 39, 2);
INSERT INTO `stu_role` VALUES (162, 38, 2);
INSERT INTO `stu_role` VALUES (163, 37, 2);
INSERT INTO `stu_role` VALUES (164, 36, 2);
INSERT INTO `stu_role` VALUES (165, 35, 2);
INSERT INTO `stu_role` VALUES (166, 34, 2);
INSERT INTO `stu_role` VALUES (167, 33, 2);
INSERT INTO `stu_role` VALUES (168, 32, 2);
INSERT INTO `stu_role` VALUES (169, 31, 2);
INSERT INTO `stu_role` VALUES (170, 30, 2);
INSERT INTO `stu_role` VALUES (171, 29, 2);
INSERT INTO `stu_role` VALUES (172, 28, 2);
INSERT INTO `stu_role` VALUES (173, 27, 2);
INSERT INTO `stu_role` VALUES (174, 26, 2);
INSERT INTO `stu_role` VALUES (175, 25, 2);
INSERT INTO `stu_role` VALUES (196, 156, 2);
INSERT INTO `stu_role` VALUES (197, 155, 2);
INSERT INTO `stu_role` VALUES (198, 154, 2);
INSERT INTO `stu_role` VALUES (199, 153, 2);
INSERT INTO `stu_role` VALUES (200, 152, 2);
INSERT INTO `stu_role` VALUES (201, 151, 2);
INSERT INTO `stu_role` VALUES (202, 150, 2);
INSERT INTO `stu_role` VALUES (204, 149, 2);
INSERT INTO `stu_role` VALUES (205, 148, 2);
INSERT INTO `stu_role` VALUES (206, 147, 2);
INSERT INTO `stu_role` VALUES (207, 146, 2);
INSERT INTO `stu_role` VALUES (208, 145, 2);
INSERT INTO `stu_role` VALUES (209, 144, 2);
INSERT INTO `stu_role` VALUES (210, 143, 2);
INSERT INTO `stu_role` VALUES (211, 142, 2);
INSERT INTO `stu_role` VALUES (212, 141, 2);
INSERT INTO `stu_role` VALUES (213, 140, 2);
INSERT INTO `stu_role` VALUES (214, 139, 2);
INSERT INTO `stu_role` VALUES (215, 138, 2);
INSERT INTO `stu_role` VALUES (216, 137, 2);
INSERT INTO `stu_role` VALUES (257, 182, 2);
INSERT INTO `stu_role` VALUES (258, 181, 2);
INSERT INTO `stu_role` VALUES (259, 180, 2);
INSERT INTO `stu_role` VALUES (260, 179, 2);
INSERT INTO `stu_role` VALUES (261, 178, 2);
INSERT INTO `stu_role` VALUES (262, 177, 2);
INSERT INTO `stu_role` VALUES (265, 176, 2);
INSERT INTO `stu_role` VALUES (266, 175, 2);
INSERT INTO `stu_role` VALUES (267, 174, 2);
INSERT INTO `stu_role` VALUES (268, 173, 2);
INSERT INTO `stu_role` VALUES (269, 172, 2);
INSERT INTO `stu_role` VALUES (270, 171, 2);
INSERT INTO `stu_role` VALUES (271, 170, 2);
INSERT INTO `stu_role` VALUES (272, 169, 2);
INSERT INTO `stu_role` VALUES (273, 168, 2);
INSERT INTO `stu_role` VALUES (274, 167, 2);
INSERT INTO `stu_role` VALUES (275, 166, 2);
INSERT INTO `stu_role` VALUES (276, 165, 2);
INSERT INTO `stu_role` VALUES (277, 164, 2);
INSERT INTO `stu_role` VALUES (278, 163, 2);
INSERT INTO `stu_role` VALUES (279, 162, 2);
INSERT INTO `stu_role` VALUES (280, 161, 2);
INSERT INTO `stu_role` VALUES (281, 160, 2);
INSERT INTO `stu_role` VALUES (282, 159, 2);
INSERT INTO `stu_role` VALUES (283, 158, 2);
INSERT INTO `stu_role` VALUES (284, 157, 2);
INSERT INTO `stu_role` VALUES (306, 209, 2);
INSERT INTO `stu_role` VALUES (307, 208, 2);
INSERT INTO `stu_role` VALUES (308, 207, 2);
INSERT INTO `stu_role` VALUES (309, 206, 2);
INSERT INTO `stu_role` VALUES (310, 205, 2);
INSERT INTO `stu_role` VALUES (311, 204, 2);
INSERT INTO `stu_role` VALUES (312, 203, 2);
INSERT INTO `stu_role` VALUES (313, 199, 2);
INSERT INTO `stu_role` VALUES (314, 198, 2);
INSERT INTO `stu_role` VALUES (315, 197, 2);
INSERT INTO `stu_role` VALUES (316, 196, 2);
INSERT INTO `stu_role` VALUES (317, 195, 2);
INSERT INTO `stu_role` VALUES (318, 194, 2);
INSERT INTO `stu_role` VALUES (319, 193, 2);
INSERT INTO `stu_role` VALUES (320, 189, 2);
INSERT INTO `stu_role` VALUES (321, 188, 2);
INSERT INTO `stu_role` VALUES (323, 186, 2);
INSERT INTO `stu_role` VALUES (324, 187, 2);
INSERT INTO `stu_role` VALUES (325, 185, 2);
INSERT INTO `stu_role` VALUES (326, 184, 2);
INSERT INTO `stu_role` VALUES (327, 183, 2);
INSERT INTO `stu_role` VALUES (328, 192, 2);
INSERT INTO `stu_role` VALUES (329, 191, 2);
INSERT INTO `stu_role` VALUES (330, 190, 2);
INSERT INTO `stu_role` VALUES (337, 200, 2);
INSERT INTO `stu_role` VALUES (338, 201, 2);
INSERT INTO `stu_role` VALUES (339, 202, 2);
INSERT INTO `stu_role` VALUES (396, 247, 2);
INSERT INTO `stu_role` VALUES (397, 244, 2);
INSERT INTO `stu_role` VALUES (398, 243, 2);
INSERT INTO `stu_role` VALUES (399, 242, 2);
INSERT INTO `stu_role` VALUES (400, 241, 2);
INSERT INTO `stu_role` VALUES (401, 240, 2);
INSERT INTO `stu_role` VALUES (402, 239, 2);
INSERT INTO `stu_role` VALUES (403, 238, 2);
INSERT INTO `stu_role` VALUES (404, 237, 2);
INSERT INTO `stu_role` VALUES (405, 236, 2);
INSERT INTO `stu_role` VALUES (406, 235, 2);
INSERT INTO `stu_role` VALUES (407, 234, 2);
INSERT INTO `stu_role` VALUES (408, 233, 2);
INSERT INTO `stu_role` VALUES (409, 232, 2);
INSERT INTO `stu_role` VALUES (410, 231, 2);
INSERT INTO `stu_role` VALUES (411, 230, 2);
INSERT INTO `stu_role` VALUES (412, 229, 2);
INSERT INTO `stu_role` VALUES (413, 228, 2);
INSERT INTO `stu_role` VALUES (414, 227, 2);
INSERT INTO `stu_role` VALUES (415, 226, 2);
INSERT INTO `stu_role` VALUES (416, 225, 2);
INSERT INTO `stu_role` VALUES (417, 224, 2);
INSERT INTO `stu_role` VALUES (418, 223, 2);
INSERT INTO `stu_role` VALUES (419, 222, 2);
INSERT INTO `stu_role` VALUES (420, 221, 2);
INSERT INTO `stu_role` VALUES (421, 220, 2);
INSERT INTO `stu_role` VALUES (422, 219, 2);
INSERT INTO `stu_role` VALUES (423, 218, 2);
INSERT INTO `stu_role` VALUES (424, 217, 2);
INSERT INTO `stu_role` VALUES (425, 216, 2);
INSERT INTO `stu_role` VALUES (426, 215, 2);
INSERT INTO `stu_role` VALUES (427, 214, 2);
INSERT INTO `stu_role` VALUES (428, 213, 2);
INSERT INTO `stu_role` VALUES (429, 212, 2);
INSERT INTO `stu_role` VALUES (430, 211, 2);
INSERT INTO `stu_role` VALUES (431, 210, 2);
INSERT INTO `stu_role` VALUES (485, 268, 2);
INSERT INTO `stu_role` VALUES (486, 267, 2);
INSERT INTO `stu_role` VALUES (487, 266, 2);
INSERT INTO `stu_role` VALUES (488, 265, 2);
INSERT INTO `stu_role` VALUES (489, 264, 2);
INSERT INTO `stu_role` VALUES (490, 263, 2);
INSERT INTO `stu_role` VALUES (491, 262, 2);
INSERT INTO `stu_role` VALUES (492, 261, 2);
INSERT INTO `stu_role` VALUES (493, 260, 2);
INSERT INTO `stu_role` VALUES (494, 259, 2);
INSERT INTO `stu_role` VALUES (495, 258, 2);
INSERT INTO `stu_role` VALUES (496, 257, 2);
INSERT INTO `stu_role` VALUES (497, 256, 2);
INSERT INTO `stu_role` VALUES (498, 255, 2);
INSERT INTO `stu_role` VALUES (499, 254, 2);
INSERT INTO `stu_role` VALUES (500, 253, 2);
INSERT INTO `stu_role` VALUES (501, 252, 2);
INSERT INTO `stu_role` VALUES (502, 251, 2);
INSERT INTO `stu_role` VALUES (503, 250, 2);
INSERT INTO `stu_role` VALUES (504, 249, 2);
INSERT INTO `stu_role` VALUES (505, 248, 2);
INSERT INTO `stu_role` VALUES (506, 246, 2);
INSERT INTO `stu_role` VALUES (507, 245, 2);
INSERT INTO `stu_role` VALUES (508, 288, 2);
INSERT INTO `stu_role` VALUES (509, 287, 2);
INSERT INTO `stu_role` VALUES (510, 286, 2);
INSERT INTO `stu_role` VALUES (511, 285, 2);
INSERT INTO `stu_role` VALUES (512, 284, 2);
INSERT INTO `stu_role` VALUES (513, 283, 2);
INSERT INTO `stu_role` VALUES (514, 282, 2);
INSERT INTO `stu_role` VALUES (515, 281, 2);
INSERT INTO `stu_role` VALUES (516, 280, 2);
INSERT INTO `stu_role` VALUES (517, 279, 2);
INSERT INTO `stu_role` VALUES (518, 278, 2);
INSERT INTO `stu_role` VALUES (519, 277, 2);
INSERT INTO `stu_role` VALUES (520, 276, 2);
INSERT INTO `stu_role` VALUES (521, 275, 2);
INSERT INTO `stu_role` VALUES (522, 274, 2);
INSERT INTO `stu_role` VALUES (523, 273, 2);
INSERT INTO `stu_role` VALUES (524, 272, 2);
INSERT INTO `stu_role` VALUES (525, 271, 2);
INSERT INTO `stu_role` VALUES (526, 270, 2);
INSERT INTO `stu_role` VALUES (527, 269, 2);
INSERT INTO `stu_role` VALUES (608, 314, 2);
INSERT INTO `stu_role` VALUES (609, 313, 2);
INSERT INTO `stu_role` VALUES (610, 312, 2);
INSERT INTO `stu_role` VALUES (611, 311, 2);
INSERT INTO `stu_role` VALUES (612, 310, 2);
INSERT INTO `stu_role` VALUES (613, 309, 2);
INSERT INTO `stu_role` VALUES (614, 308, 2);
INSERT INTO `stu_role` VALUES (615, 307, 2);
INSERT INTO `stu_role` VALUES (616, 306, 2);
INSERT INTO `stu_role` VALUES (617, 305, 2);
INSERT INTO `stu_role` VALUES (618, 304, 2);
INSERT INTO `stu_role` VALUES (619, 303, 2);
INSERT INTO `stu_role` VALUES (620, 302, 2);
INSERT INTO `stu_role` VALUES (621, 301, 2);
INSERT INTO `stu_role` VALUES (622, 300, 2);
INSERT INTO `stu_role` VALUES (623, 299, 2);
INSERT INTO `stu_role` VALUES (624, 298, 2);
INSERT INTO `stu_role` VALUES (625, 297, 2);
INSERT INTO `stu_role` VALUES (626, 296, 2);
INSERT INTO `stu_role` VALUES (627, 295, 2);
INSERT INTO `stu_role` VALUES (628, 294, 2);
INSERT INTO `stu_role` VALUES (629, 293, 2);
INSERT INTO `stu_role` VALUES (630, 292, 2);
INSERT INTO `stu_role` VALUES (631, 291, 2);
INSERT INTO `stu_role` VALUES (632, 290, 2);
INSERT INTO `stu_role` VALUES (633, 289, 2);
INSERT INTO `stu_role` VALUES (634, 341, 2);
INSERT INTO `stu_role` VALUES (635, 340, 2);
INSERT INTO `stu_role` VALUES (636, 339, 2);
INSERT INTO `stu_role` VALUES (637, 338, 2);
INSERT INTO `stu_role` VALUES (638, 337, 2);
INSERT INTO `stu_role` VALUES (639, 336, 2);
INSERT INTO `stu_role` VALUES (640, 335, 2);
INSERT INTO `stu_role` VALUES (641, 334, 2);
INSERT INTO `stu_role` VALUES (642, 333, 2);
INSERT INTO `stu_role` VALUES (643, 332, 2);
INSERT INTO `stu_role` VALUES (644, 331, 2);
INSERT INTO `stu_role` VALUES (645, 330, 2);
INSERT INTO `stu_role` VALUES (646, 329, 2);
INSERT INTO `stu_role` VALUES (647, 328, 2);
INSERT INTO `stu_role` VALUES (648, 327, 2);
INSERT INTO `stu_role` VALUES (649, 326, 2);
INSERT INTO `stu_role` VALUES (650, 325, 2);
INSERT INTO `stu_role` VALUES (651, 324, 2);
INSERT INTO `stu_role` VALUES (652, 323, 2);
INSERT INTO `stu_role` VALUES (653, 322, 2);
INSERT INTO `stu_role` VALUES (654, 321, 2);
INSERT INTO `stu_role` VALUES (655, 320, 2);
INSERT INTO `stu_role` VALUES (656, 319, 2);
INSERT INTO `stu_role` VALUES (740, 363, 2);
INSERT INTO `stu_role` VALUES (741, 362, 2);
INSERT INTO `stu_role` VALUES (742, 361, 2);
INSERT INTO `stu_role` VALUES (743, 360, 2);
INSERT INTO `stu_role` VALUES (744, 359, 2);
INSERT INTO `stu_role` VALUES (745, 358, 2);
INSERT INTO `stu_role` VALUES (746, 357, 2);
INSERT INTO `stu_role` VALUES (747, 356, 2);
INSERT INTO `stu_role` VALUES (748, 355, 2);
INSERT INTO `stu_role` VALUES (749, 354, 2);
INSERT INTO `stu_role` VALUES (750, 353, 2);
INSERT INTO `stu_role` VALUES (751, 352, 2);
INSERT INTO `stu_role` VALUES (752, 351, 2);
INSERT INTO `stu_role` VALUES (753, 350, 2);
INSERT INTO `stu_role` VALUES (754, 349, 2);
INSERT INTO `stu_role` VALUES (755, 348, 2);
INSERT INTO `stu_role` VALUES (756, 347, 2);
INSERT INTO `stu_role` VALUES (757, 346, 2);
INSERT INTO `stu_role` VALUES (758, 345, 2);
INSERT INTO `stu_role` VALUES (759, 344, 2);
INSERT INTO `stu_role` VALUES (760, 343, 2);
INSERT INTO `stu_role` VALUES (761, 342, 2);
INSERT INTO `stu_role` VALUES (762, 318, 2);
INSERT INTO `stu_role` VALUES (763, 317, 2);
INSERT INTO `stu_role` VALUES (764, 316, 2);
INSERT INTO `stu_role` VALUES (765, 315, 2);
INSERT INTO `stu_role` VALUES (766, 389, 2);
INSERT INTO `stu_role` VALUES (767, 388, 2);
INSERT INTO `stu_role` VALUES (768, 387, 2);
INSERT INTO `stu_role` VALUES (769, 386, 2);
INSERT INTO `stu_role` VALUES (770, 385, 2);
INSERT INTO `stu_role` VALUES (771, 384, 2);
INSERT INTO `stu_role` VALUES (772, 383, 2);
INSERT INTO `stu_role` VALUES (773, 382, 2);
INSERT INTO `stu_role` VALUES (774, 381, 2);
INSERT INTO `stu_role` VALUES (775, 380, 2);
INSERT INTO `stu_role` VALUES (776, 379, 2);
INSERT INTO `stu_role` VALUES (777, 378, 2);
INSERT INTO `stu_role` VALUES (778, 377, 2);
INSERT INTO `stu_role` VALUES (779, 376, 2);
INSERT INTO `stu_role` VALUES (780, 375, 2);
INSERT INTO `stu_role` VALUES (781, 374, 2);
INSERT INTO `stu_role` VALUES (782, 373, 2);
INSERT INTO `stu_role` VALUES (783, 372, 2);
INSERT INTO `stu_role` VALUES (784, 371, 2);
INSERT INTO `stu_role` VALUES (785, 370, 2);
INSERT INTO `stu_role` VALUES (786, 369, 2);
INSERT INTO `stu_role` VALUES (787, 368, 2);
INSERT INTO `stu_role` VALUES (788, 367, 2);
INSERT INTO `stu_role` VALUES (789, 366, 2);
INSERT INTO `stu_role` VALUES (790, 365, 2);
INSERT INTO `stu_role` VALUES (791, 364, 2);
INSERT INTO `stu_role` VALUES (819, 390, 2);
INSERT INTO `stu_role` VALUES (820, 391, 2);
INSERT INTO `stu_role` VALUES (821, 392, 2);
INSERT INTO `stu_role` VALUES (823, 393, 2);
INSERT INTO `stu_role` VALUES (824, 394, 2);
INSERT INTO `stu_role` VALUES (825, 395, 2);
INSERT INTO `stu_role` VALUES (826, 396, 2);
INSERT INTO `stu_role` VALUES (827, 397, 2);
INSERT INTO `stu_role` VALUES (828, 398, 2);
INSERT INTO `stu_role` VALUES (829, 399, 2);
INSERT INTO `stu_role` VALUES (830, 400, 2);
INSERT INTO `stu_role` VALUES (831, 401, 2);
INSERT INTO `stu_role` VALUES (832, 402, 2);
INSERT INTO `stu_role` VALUES (833, 403, 2);
INSERT INTO `stu_role` VALUES (834, 404, 2);
INSERT INTO `stu_role` VALUES (835, 405, 2);
INSERT INTO `stu_role` VALUES (836, 406, 2);
INSERT INTO `stu_role` VALUES (838, 408, 2);
INSERT INTO `stu_role` VALUES (839, 409, 2);
INSERT INTO `stu_role` VALUES (840, 407, 2);
INSERT INTO `stu_role` VALUES (841, 410, 2);
INSERT INTO `stu_role` VALUES (842, 411, 2);
INSERT INTO `stu_role` VALUES (843, 412, 2);
INSERT INTO `stu_role` VALUES (844, 413, 2);
INSERT INTO `stu_role` VALUES (846, 415, 2);
INSERT INTO `stu_role` VALUES (847, 416, 2);
INSERT INTO `stu_role` VALUES (848, 414, 2);
INSERT INTO `stu_role` VALUES (880, 417, 2);
INSERT INTO `stu_role` VALUES (881, 418, 2);
INSERT INTO `stu_role` VALUES (883, 419, 2);
INSERT INTO `stu_role` VALUES (884, 420, 2);
INSERT INTO `stu_role` VALUES (885, 421, 2);
INSERT INTO `stu_role` VALUES (886, 422, 2);
INSERT INTO `stu_role` VALUES (887, 423, 2);
INSERT INTO `stu_role` VALUES (888, 424, 2);
INSERT INTO `stu_role` VALUES (889, 425, 2);
INSERT INTO `stu_role` VALUES (890, 426, 2);
INSERT INTO `stu_role` VALUES (891, 427, 2);
INSERT INTO `stu_role` VALUES (892, 428, 2);
INSERT INTO `stu_role` VALUES (893, 429, 2);
INSERT INTO `stu_role` VALUES (894, 430, 2);
INSERT INTO `stu_role` VALUES (895, 431, 2);
INSERT INTO `stu_role` VALUES (896, 432, 2);
INSERT INTO `stu_role` VALUES (897, 433, 2);
INSERT INTO `stu_role` VALUES (898, 434, 2);
INSERT INTO `stu_role` VALUES (899, 435, 2);
INSERT INTO `stu_role` VALUES (900, 436, 2);
INSERT INTO `stu_role` VALUES (903, 440, 2);
INSERT INTO `stu_role` VALUES (904, 437, 2);
INSERT INTO `stu_role` VALUES (905, 441, 2);
INSERT INTO `stu_role` VALUES (907, 438, 2);
INSERT INTO `stu_role` VALUES (908, 439, 2);
INSERT INTO `stu_role` VALUES (909, 442, 2);
INSERT INTO `stu_role` VALUES (910, 443, 2);
INSERT INTO `stu_role` VALUES (911, 444, 2);
INSERT INTO `stu_role` VALUES (912, 445, 2);
INSERT INTO `stu_role` VALUES (913, 446, 2);
INSERT INTO `stu_role` VALUES (914, 447, 2);
INSERT INTO `stu_role` VALUES (939, 448, 2);
INSERT INTO `stu_role` VALUES (941, 449, 2);
INSERT INTO `stu_role` VALUES (942, 450, 2);
INSERT INTO `stu_role` VALUES (943, 451, 2);
INSERT INTO `stu_role` VALUES (944, 452, 2);
INSERT INTO `stu_role` VALUES (945, 453, 2);
INSERT INTO `stu_role` VALUES (946, 454, 2);
INSERT INTO `stu_role` VALUES (947, 455, 2);
INSERT INTO `stu_role` VALUES (948, 456, 2);
INSERT INTO `stu_role` VALUES (949, 457, 2);
INSERT INTO `stu_role` VALUES (950, 458, 2);
INSERT INTO `stu_role` VALUES (951, 459, 2);
INSERT INTO `stu_role` VALUES (952, 460, 2);
INSERT INTO `stu_role` VALUES (953, 461, 2);
INSERT INTO `stu_role` VALUES (954, 462, 2);
INSERT INTO `stu_role` VALUES (955, 463, 2);
INSERT INTO `stu_role` VALUES (956, 464, 2);
INSERT INTO `stu_role` VALUES (957, 465, 2);
INSERT INTO `stu_role` VALUES (958, 466, 2);
INSERT INTO `stu_role` VALUES (959, 467, 2);
INSERT INTO `stu_role` VALUES (960, 468, 2);
INSERT INTO `stu_role` VALUES (961, 469, 2);
INSERT INTO `stu_role` VALUES (963, 470, 2);
INSERT INTO `stu_role` VALUES (964, 471, 2);
INSERT INTO `stu_role` VALUES (1022, 472, 2);
INSERT INTO `stu_role` VALUES (1023, 473, 2);
INSERT INTO `stu_role` VALUES (1024, 474, 2);
INSERT INTO `stu_role` VALUES (1025, 475, 2);
INSERT INTO `stu_role` VALUES (1026, 476, 2);
INSERT INTO `stu_role` VALUES (1027, 477, 2);
INSERT INTO `stu_role` VALUES (1028, 478, 2);
INSERT INTO `stu_role` VALUES (1029, 479, 2);
INSERT INTO `stu_role` VALUES (1030, 480, 2);
INSERT INTO `stu_role` VALUES (1031, 481, 2);
INSERT INTO `stu_role` VALUES (1032, 482, 2);
INSERT INTO `stu_role` VALUES (1033, 483, 2);
INSERT INTO `stu_role` VALUES (1034, 484, 2);
INSERT INTO `stu_role` VALUES (1035, 485, 2);
INSERT INTO `stu_role` VALUES (1036, 486, 2);
INSERT INTO `stu_role` VALUES (1037, 487, 2);
INSERT INTO `stu_role` VALUES (1038, 488, 2);
INSERT INTO `stu_role` VALUES (1039, 489, 2);
INSERT INTO `stu_role` VALUES (1040, 490, 2);
INSERT INTO `stu_role` VALUES (1041, 491, 2);
INSERT INTO `stu_role` VALUES (1042, 492, 2);
INSERT INTO `stu_role` VALUES (1043, 493, 2);
INSERT INTO `stu_role` VALUES (1045, 494, 2);
INSERT INTO `stu_role` VALUES (1046, 495, 2);
INSERT INTO `stu_role` VALUES (1047, 496, 2);
INSERT INTO `stu_role` VALUES (1048, 497, 2);
INSERT INTO `stu_role` VALUES (1049, 498, 2);
INSERT INTO `stu_role` VALUES (1050, 499, 2);
INSERT INTO `stu_role` VALUES (1052, 501, 2);
INSERT INTO `stu_role` VALUES (1054, 502, 2);
INSERT INTO `stu_role` VALUES (1056, 500, 2);
INSERT INTO `stu_role` VALUES (1083, 503, 2);
INSERT INTO `stu_role` VALUES (1084, 504, 2);
INSERT INTO `stu_role` VALUES (1085, 505, 2);
INSERT INTO `stu_role` VALUES (1086, 506, 2);
INSERT INTO `stu_role` VALUES (1087, 507, 2);
INSERT INTO `stu_role` VALUES (1088, 508, 2);
INSERT INTO `stu_role` VALUES (1089, 509, 2);
INSERT INTO `stu_role` VALUES (1090, 510, 2);
INSERT INTO `stu_role` VALUES (1091, 511, 2);
INSERT INTO `stu_role` VALUES (1092, 512, 2);
INSERT INTO `stu_role` VALUES (1093, 513, 2);
INSERT INTO `stu_role` VALUES (1094, 514, 2);
INSERT INTO `stu_role` VALUES (1095, 515, 2);
INSERT INTO `stu_role` VALUES (1096, 516, 2);
INSERT INTO `stu_role` VALUES (1097, 517, 2);
INSERT INTO `stu_role` VALUES (1098, 518, 2);
INSERT INTO `stu_role` VALUES (1099, 519, 2);
INSERT INTO `stu_role` VALUES (1100, 520, 2);
INSERT INTO `stu_role` VALUES (1101, 521, 2);
INSERT INTO `stu_role` VALUES (1102, 522, 2);
INSERT INTO `stu_role` VALUES (1103, 523, 2);
INSERT INTO `stu_role` VALUES (1104, 524, 2);
INSERT INTO `stu_role` VALUES (1105, 525, 2);
INSERT INTO `stu_role` VALUES (1106, 526, 2);
INSERT INTO `stu_role` VALUES (1107, 527, 2);
INSERT INTO `stu_role` VALUES (1108, 528, 2);

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单id',
  `parent_id` int(11) NULL DEFAULT NULL COMMENT '父级菜单id',
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '菜单名称',
  `code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '权限字段',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '路由name',
  `path` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '路由path',
  `url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '组件路径',
  `type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '类型(0 目录 1菜单，2按钮)',
  `icon` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '菜单图标',
  `parent_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '上级菜单名称',
  `order_num` int(11) NULL DEFAULT NULL COMMENT '序号',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 77 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, 0, '系统管理', 'sys:system:index', 'system', '/system', '', '0', 'el-icon-setting', '顶级菜单', 1, '2024-04-01 16:42:15', '2024-04-01 17:15:43');
INSERT INTO `sys_menu` VALUES (2, 1, '用户管理', 'sys:sysUserList:index', 'sysUserList', '/sysUserList', '/system/sysUserList', '1', 'el-icon-s-check', '系统管理', 2, '2024-04-01 17:15:38', '2024-04-01 18:16:20');
INSERT INTO `sys_menu` VALUES (3, 1, '角色管理', 'sys:sysRoleList:index', 'sysRoleList', '/sysRoleList', '/system/sysRoleList', '1', 'el-icon-document-copy', '系统管理', 3, '2024-04-02 16:51:49', '2024-04-02 18:16:59');
INSERT INTO `sys_menu` VALUES (4, 1, '菜单管理', 'sys:sysMenuList:index', 'sysMenuList', '/sysMenuList', '/system/sysMenuList', '1', 'tree', '系统管理', 4, '2024-04-02 18:18:01', '2024-04-02 18:20:01');
INSERT INTO `sys_menu` VALUES (5, 0, '学院管理', 'sys:college:index', 'college', '/college', '', '0', 'el-icon-office-building', '顶级菜单', 2, '2024-04-02 19:18:56', '2024-04-30 19:14:19');
INSERT INTO `sys_menu` VALUES (6, 5, '学院管理', 'sys:collegeList:index', 'collegeList', '/collegeList', '/college/collegeList', '1', 'table', '学院管理', 1, '2024-04-03 18:21:10', '2024-04-30 19:15:16');
INSERT INTO `sys_menu` VALUES (7, 5, '专业管理', 'sys:majorList:index', 'majorList', '/majorList', '/college/majorList', '1', 'tree', '学院管理', 2, '2024-04-03 18:22:10', '2024-04-30 19:18:48');
INSERT INTO `sys_menu` VALUES (8, 5, '班级管理', 'sys:classList:index', 'classList', '/classList', '/college/classList', '1', 'tree', '学院管理', 3, '2024-04-03 18:23:05', '2024-04-30 19:18:58');
INSERT INTO `sys_menu` VALUES (9, 0, '学生管理', 'sys:stuRoot:index', 'stuRoot', '/stuRoot', '', '0', 'el-icon-user', '顶级菜单', 3, '2024-04-05 18:24:23', '2024-04-28 16:22:16');
INSERT INTO `sys_menu` VALUES (10, 9, '学生列表', 'sys:stuList:index', 'stuList', '/stuList', '/student/stuList', '1', 'table', '学生管理', 1, '2024-04-05 18:25:22', '2022-04-20 18:25:35');
INSERT INTO `sys_menu` VALUES (11, 0, '教师管理', 'sys:teacherRoot:index', 'teacherRoot', '/teacherRoot', '', '0', 'el-icon-user-solid', '顶级菜单', 4, '2024-04-07 18:26:25', '2024-04-28 16:22:04');
INSERT INTO `sys_menu` VALUES (12, 11, '教师列表', 'sys:teacherList:index', 'teacherList', '/teacherList', '/teacher/teacherList', '1', 'table', '教师管理', 1, '2024-04-07 18:27:18', '2022-04-21 18:51:37');
INSERT INTO `sys_menu` VALUES (13, 0, '课程管理', 'sys:courseRoot:index', 'courseRoot', '/courseRoot', '', '0', 'el-icon-date', '顶级菜单', 6, '2024-04-10 18:28:28', '2024-04-28 16:26:26');
INSERT INTO `sys_menu` VALUES (14, 13, '课程列表', 'sys:courseList:index', 'courseList', '/courseList', '/course/courseList', '1', 'table', '课程管理', 1, '2024-04-10 18:29:30', NULL);
INSERT INTO `sys_menu` VALUES (15, 13, '开课管理', 'sys:setCourse:index', 'setCourse', '/setCourse', '/course/setCourse', '1', 'table', '课程管理', 2, '2024-04-10 18:30:26', NULL);
INSERT INTO `sys_menu` VALUES (16, 2, '新增', 'sys:sysUserList:add', '', '', '', '2', '', '用户管理', 1, '2024-04-01 18:31:19', NULL);
INSERT INTO `sys_menu` VALUES (17, 2, '编辑', 'sys:sysUserList:edit', '', '', '', '2', '', '用户管理', 2, '2024-04-01 18:31:41', NULL);
INSERT INTO `sys_menu` VALUES (18, 2, '删除', 'sys:sysUserList:delete', '', '', '', '2', '', '用户管理', 3, '2024-04-01 18:32:05', NULL);
INSERT INTO `sys_menu` VALUES (19, 3, '新增', 'sys:sysRoleList:add', '', '', '', '2', '', '角色管理', 1, '2024-04-02 19:13:02', NULL);
INSERT INTO `sys_menu` VALUES (20, 3, '编辑', 'sys:sysRoleList:edit', '', '', '', '2', '', '角色管理', 2, '2024-04-02 19:13:24', NULL);
INSERT INTO `sys_menu` VALUES (21, 3, '删除', 'sys:sysRoleList:delete', '', '', '', '2', '', '角色管理', 3, '2024-04-02 19:13:47', NULL);
INSERT INTO `sys_menu` VALUES (22, 3, '分配权限', 'sys:sysRoleList:assignRole', '', '', '', '2', '', '角色管理', 4, '2024-04-02 19:14:15', NULL);
INSERT INTO `sys_menu` VALUES (23, 4, '新增', 'sys:sysMenuList:add', '', '', '', '2', '', '菜单管理', 1, '2024-04-02 19:14:39', NULL);
INSERT INTO `sys_menu` VALUES (24, 4, '编辑', 'sys:sysMenuList:edit', '', '', '', '2', '', '菜单管理', 2, '2024-04-02 19:14:58', NULL);
INSERT INTO `sys_menu` VALUES (25, 4, '删除', 'sys:sysMenuList:delete', '', '', '', '2', '', '菜单管理', 3, '2024-04-02 19:15:16', NULL);
INSERT INTO `sys_menu` VALUES (26, 6, '新增', 'sys:collegeList:add', '', '', '', '2', '', '学院管理', 1, '2024-04-03 19:15:47', '2024-04-30 19:14:28');
INSERT INTO `sys_menu` VALUES (27, 6, '编辑', 'sys:collegeList:edit', '', '', '', '2', '', '学院管理', 2, '2024-04-03 19:18:26', '2024-04-30 19:14:35');
INSERT INTO `sys_menu` VALUES (28, 6, '删除', 'sys:collegeList:delete', '', '', '', '2', '', '学院管理', 3, '2024-04-03 19:18:50', '2024-04-30 19:14:41');
INSERT INTO `sys_menu` VALUES (29, 7, '新增', 'sys:majorList:add', '', '', '', '2', '', '专业管理', 1, '2024-04-03 19:19:12', NULL);
INSERT INTO `sys_menu` VALUES (30, 7, '编辑', 'sys:majorList:edit', '', '', '', '2', '', '专业管理', 2, '2024-04-03 19:19:32', NULL);
INSERT INTO `sys_menu` VALUES (31, 7, '删除', 'sys:majorList:delete', '', '', '', '2', '', '专业管理', 3, '2024-04-03 19:19:59', NULL);
INSERT INTO `sys_menu` VALUES (32, 8, '新增', 'sys:classList:add', '', '', '', '2', '', '班级管理', 1, '2024-04-03 19:20:21', NULL);
INSERT INTO `sys_menu` VALUES (33, 8, '编辑', 'sys:classList:edit', '', '', '', '2', '', '班级管理', 2, '2024-04-03 19:20:42', NULL);
INSERT INTO `sys_menu` VALUES (34, 8, '删除', 'sys:classList:delete', '', '', '', '2', '', '班级管理', 3, '2024-04-03 19:21:02', NULL);
INSERT INTO `sys_menu` VALUES (35, 10, '新增', 'sys:stuList:add', '', '', '', '2', '', '学生列表', 1, '2024-04-05 19:21:26', NULL);
INSERT INTO `sys_menu` VALUES (36, 10, '编辑', 'sys:stuList:edit', '', '', '', '2', '', '学生列表', 2, '2024-04-05 19:21:44', NULL);
INSERT INTO `sys_menu` VALUES (37, 10, '删除', 'sys:stuList:delete', '', '', '', '2', '', '学生列表', 3, '2024-04-05 19:22:03', NULL);
INSERT INTO `sys_menu` VALUES (38, 12, '新增', 'sys:teacherList:add', '', '', '', '2', '', '教师列表', 1, '2024-04-07 19:22:23', NULL);
INSERT INTO `sys_menu` VALUES (39, 12, '编辑', 'sys:teacherList:edit', '', '', '', '2', '', '教师列表', 2, '2024-04-07 19:22:39', NULL);
INSERT INTO `sys_menu` VALUES (40, 12, '删除', 'sys:teacherList:delete', '', '', '', '2', '', '教师列表', 3, '2024-04-07 19:22:58', NULL);
INSERT INTO `sys_menu` VALUES (41, 14, '新增', 'sys:courseList:add', '', '', '', '2', '', '课程列表', 1, '2024-04-10 19:23:44', NULL);
INSERT INTO `sys_menu` VALUES (42, 14, '编辑', 'sys:courseList:edit', '', '', '', '2', '', '课程列表', 2, '2024-04-10 19:24:01', NULL);
INSERT INTO `sys_menu` VALUES (43, 14, '删除', 'sys:courseList:delete', '', '', '', '2', '', '课程列表', 3, '2024-04-10 19:24:16', NULL);
INSERT INTO `sys_menu` VALUES (44, 14, '分配教师', 'sys:courseList:assignTeacher', '', '', '', '2', '', '课程列表', 4, '2024-04-10 19:24:42', NULL);
INSERT INTO `sys_menu` VALUES (45, 14, '解除教师', 'sys:courseList:removeTeacher', '', '', '', '2', '', '课程列表', 6, '2024-04-10 19:26:31', NULL);
INSERT INTO `sys_menu` VALUES (46, 15, '分配课程', 'sys:setCourse:assignCourse', '', '', '', '2', '', '开课管理', 1, '2024-04-10 19:27:22', NULL);
INSERT INTO `sys_menu` VALUES (47, 13, '我的课程', 'sys:myCourse:index', 'myCourse', '/myCourse', '/course/myCourse', '1', 'table', '课程管理', 3, '2024-04-11 20:14:15', NULL);
INSERT INTO `sys_menu` VALUES (48, 13, '我的授课', 'sys:myTeacher:index', 'myTeacher', '/myTeacher', '/course/myTeacher', '1', 'table', '课程管理', 5, '2024-04-12 12:38:50', NULL);
INSERT INTO `sys_menu` VALUES (49, 10, '重置密码', 'sys:stuList:reset', '', '', '', '2', '', '学生列表', 4, '2024-04-14 12:04:30', NULL);
INSERT INTO `sys_menu` VALUES (50, 12, '重置密码', 'sys:teacherList:reset', '', '', '', '2', '', '教师列表', 4, '2024-04-14 12:05:16', NULL);
INSERT INTO `sys_menu` VALUES (51, 15, '删除', 'sys:setCourse:delete', '', '', '', '2', '', '开课管理', 2, '2024-04-14 12:09:35', NULL);
INSERT INTO `sys_menu` VALUES (52, 0, '公告管理', 'sys:sysNoticeRoot:index', 'sysNoticeRoot', '/sysNoticeRoot', '', '0', 'el-icon-edit-outline', '顶级菜单', 8, '2024-04-14 17:22:46', '2024-04-28 16:23:02');
INSERT INTO `sys_menu` VALUES (53, 52, '公告列表', 'sys:sysNotice:index', 'sysNotice', '/sysNotice', '/notice/sysNotice', '1', 'table', '公告管理', 1, '2024-04-14 17:23:57', NULL);
INSERT INTO `sys_menu` VALUES (54, 53, '新增', 'sys:sysNotice:add', '', '', '', '2', '', '公告列表', 1, '2024-04-14 17:24:20', NULL);
INSERT INTO `sys_menu` VALUES (55, 53, '编辑', 'sys:sysNotice:edit', '', '', '', '2', '', '公告列表', 2, '2024-04-14 17:24:36', NULL);
INSERT INTO `sys_menu` VALUES (56, 53, '删除', 'sys:sysNotice:delete', '', '', '', '2', '', '公告列表', 3, '2024-04-14 17:24:53', NULL);
INSERT INTO `sys_menu` VALUES (57, 53, '查看', 'sys:sysNotice:look', '', '', '', '2', '', '公告列表', 4, '2024-04-14 17:25:35', NULL);
INSERT INTO `sys_menu` VALUES (58, 10, '导入学生', 'sys:stu:import', '', '', '', '2', '', '学生列表', 5, '2024-04-16 19:34:07', NULL);
INSERT INTO `sys_menu` VALUES (59, 10, '导出学生', 'sys:stu:export', '', '', '', '2', '', '学生列表', 6, '2024-04-16 19:34:31', NULL);
INSERT INTO `sys_menu` VALUES (60, 0, '奖惩管理', 'sys:sysRecord:index', 'sysRecordRoot', '/sysRecordRoot', '', '0', 'el-icon-collection', '顶级菜单', 7, '2024-04-13 16:10:39', '2024-04-21 15:44:19');
INSERT INTO `sys_menu` VALUES (61, 60, '荣誉列表', 'sys:sysReward:index', 'sysRewardList', '/sysRewardList', '/record/sysRewardList', '1', 'el-icon-medal-1', '奖惩管理', 1, '2024-04-13 16:14:54', '2024-05-01 14:41:55');
INSERT INTO `sys_menu` VALUES (62, 60, '违纪列表', 'sys:sysPunish:index', 'sysPunish', '/sysPunishList', '/record/sysPunishList', '1', 'el-icon-document-delete', '奖惩管理', 2, '2024-04-13 16:19:10', '2024-04-28 16:29:17');
INSERT INTO `sys_menu` VALUES (63, 61, '新增', 'sys:sysReward:add', '', '', '', '2', '', '奖励管理', 1, '2024-04-13 16:32:05', NULL);
INSERT INTO `sys_menu` VALUES (64, 61, '编辑', 'sys:sysReward:edit', '', '', '', '2', '', '奖励管理', 2, '2024-04-13 16:32:54', NULL);
INSERT INTO `sys_menu` VALUES (65, 61, '删除', 'sys:sysReward:delete', '', '', '', '2', '', '奖励管理', 3, '2024-04-13 16:33:19', NULL);
INSERT INTO `sys_menu` VALUES (66, 61, '查看', 'sys:sysReward:look', '', '', '', '2', '', '奖励管理', 4, '2024-04-13 16:33:34', NULL);
INSERT INTO `sys_menu` VALUES (67, 61, '分配学生', 'sys:sysReward:assignStudent', '', '', '', '2', '', '奖励列表', 5, '2024-04-13 23:02:28', NULL);
INSERT INTO `sys_menu` VALUES (68, 75, '我的荣誉', 'sys:myReward:index', 'myReward', '/myReward', '/info/myReward', '1', 'el-icon-medal', '个人中心', 2, '2024-04-14 16:57:19', '2024-05-01 14:41:01');
INSERT INTO `sys_menu` VALUES (69, 75, '我的违纪', 'sys:myPunish:index', 'myPunish', '/myPunish', '/info/myPunish', '1', 'el-icon-s-release', '个人中心', 3, '2024-04-18 00:16:31', '2024-04-29 00:15:51');
INSERT INTO `sys_menu` VALUES (70, 60, '反馈处理', 'sys:sysFeedback:index', 'sysFeedback', '/sysFeedback', '/record/sysFeedback', '1', 'el-icon-finished', '奖惩管理', 6, '2024-04-19 23:57:48', '2024-04-28 16:30:18');
INSERT INTO `sys_menu` VALUES (71, 75, '我的反馈', 'sys:sysFeedback:look', 'myFeedback', '/myFeedback', '/info/myFeedback', '1', 'el-icon-message', '个人中心', 4, '2024-04-20 00:34:26', '2024-04-28 16:35:27');
INSERT INTO `sys_menu` VALUES (72, 70, '通过', 'sys:sysFeedback:approve', '', '', '', '2', '', '反馈处理', 1, '2024-04-20 00:41:57', NULL);
INSERT INTO `sys_menu` VALUES (73, 70, '拒绝', 'sys:sysFeedback:reject', '', '', '', '2', '', '反馈处理', 2, '2024-04-20 00:42:14', NULL);
INSERT INTO `sys_menu` VALUES (74, 71, '反馈', 'sys:sysFeedback:apply', '', '', '', '2', '', '我的反馈', 1, '2024-04-20 14:02:37', '2024-04-20 14:42:59');
INSERT INTO `sys_menu` VALUES (75, 0, '个人中心', 'sys:sysInfo:index', 'sysInfo', '/sysInfo', '', '0', 'el-icon-s-custom', '顶级菜单', 9, '2024-04-20 15:52:24', '2024-04-28 16:30:58');
INSERT INTO `sys_menu` VALUES (76, 75, '个人信息', 'sys:myInfo:index', 'myInfo', '/myInfo', '/info/myInfo', '1', 'el-icon-user', '个人中心', 1, '2024-04-21 15:46:52', '2024-04-28 16:31:13');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '标题',
  `notice_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '内容',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (2, '毕业答辩安排', '学校定于第14周（5月27-6月2日）各学院进行毕业设计（论文）答辩。', '2024-04-14 22:06:00');
INSERT INTO `sys_notice` VALUES (3, '图书馆搬迁通知', '弘远楼两江图书馆暂时闭馆，新图书馆开放时间另行通知。', '2024-04-18 22:06:00');
INSERT INTO `sys_notice` VALUES (4, '5.1放假通知', '离校期间注意安全', '2024-04-25 17:45:10');

-- ----------------------------
-- Table structure for sys_record
-- ----------------------------
DROP TABLE IF EXISTS `sys_record`;
CREATE TABLE `sys_record`  (
  `record_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '标题',
  `type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '记录类型 0：奖励 1：惩罚',
  `sub_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '子类型 001：奖学金 002：证书 003：竞赛 004：创新创业项目 005：其他',
  `year` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '年份',
  `record_content` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '内容',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`record_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_record
-- ----------------------------
INSERT INTO `sys_record` VALUES (2, '院系三等奖学金', '0', '奖学金', '2023', '院系三等奖学金', '2022-04-24 22:06:00');
INSERT INTO `sys_record` VALUES (4, '全国计算机竞赛一等奖', '0', '竞赛', '2022', '2022全国计算机竞赛，北京举办', '2024-04-13 19:03:09');
INSERT INTO `sys_record` VALUES (5, '校三好学生', '0', '证书', '2022', '2023年学校三好学生', '2024-04-13 20:07:27');
INSERT INTO `sys_record` VALUES (6, '院系一等奖学金', '0', '奖学金', '2024', '院系一等奖学金', '2024-04-14 16:50:41');
INSERT INTO `sys_record` VALUES (7, '计算机课程旷课', '1', '旷课', '2024', '2024春季计算机课程旷课违纪', '2024-04-18 00:17:39');
INSERT INTO `sys_record` VALUES (12, '计算机考试舞弊', '1', '舞弊', '2024', '计算机考试现场作弊', '2024-04-18 00:28:44');
INSERT INTO `sys_record` VALUES (13, '校级一等奖学金', '0', '奖学金', '2024', '校级一等奖学金', '2024-04-29 00:13:43');
INSERT INTO `sys_record` VALUES (14, '校级二等奖学金', '0', '奖学金', '2024', '校级一等奖学金', '2024-04-29 00:14:29');
INSERT INTO `sys_record` VALUES (15, '寝室发现大功率电器', '1', '警告', '2024', '寝室发现大功率违纪电器，经提醒，仍未处理', '2024-05-01 17:47:38');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `role_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '角色名称',
  `role_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '角色类型 1：系统用户  2：学生 3：教师',
  `remark` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '系统管理员', '1', '系统管理员', '2024-04-03 19:18:03', '2024-04-03 19:22:05');
INSERT INTO `sys_role` VALUES (2, '学生角色', '2', '学生使用', '2024-04-03 19:22:23', NULL);
INSERT INTO `sys_role` VALUES (3, '教师', '3', '教师', '2024-04-03 18:14:35', NULL);
INSERT INTO `sys_role` VALUES (10, '普通管理员', '1', '普通管理员', '2024-04-16 13:25:26', NULL);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` int(11) NULL DEFAULT NULL COMMENT '角色id',
  `menu_id` int(11) NULL DEFAULT NULL COMMENT '菜单id',
  PRIMARY KEY (`role_menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1076 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (860, 2, 47);
INSERT INTO `sys_role_menu` VALUES (861, 2, 57);
INSERT INTO `sys_role_menu` VALUES (862, 2, 75);
INSERT INTO `sys_role_menu` VALUES (863, 2, 76);
INSERT INTO `sys_role_menu` VALUES (864, 2, 68);
INSERT INTO `sys_role_menu` VALUES (865, 2, 69);
INSERT INTO `sys_role_menu` VALUES (866, 2, 71);
INSERT INTO `sys_role_menu` VALUES (867, 2, 74);
INSERT INTO `sys_role_menu` VALUES (868, 2, 13);
INSERT INTO `sys_role_menu` VALUES (869, 2, 52);
INSERT INTO `sys_role_menu` VALUES (870, 2, 53);
INSERT INTO `sys_role_menu` VALUES (941, 3, 48);
INSERT INTO `sys_role_menu` VALUES (942, 3, 57);
INSERT INTO `sys_role_menu` VALUES (943, 3, 76);
INSERT INTO `sys_role_menu` VALUES (944, 3, 13);
INSERT INTO `sys_role_menu` VALUES (945, 3, 52);
INSERT INTO `sys_role_menu` VALUES (946, 3, 53);
INSERT INTO `sys_role_menu` VALUES (947, 3, 75);
INSERT INTO `sys_role_menu` VALUES (950, 10, 5);
INSERT INTO `sys_role_menu` VALUES (951, 10, 6);
INSERT INTO `sys_role_menu` VALUES (952, 10, 26);
INSERT INTO `sys_role_menu` VALUES (953, 10, 27);
INSERT INTO `sys_role_menu` VALUES (954, 10, 28);
INSERT INTO `sys_role_menu` VALUES (955, 10, 7);
INSERT INTO `sys_role_menu` VALUES (956, 10, 29);
INSERT INTO `sys_role_menu` VALUES (957, 10, 30);
INSERT INTO `sys_role_menu` VALUES (958, 10, 31);
INSERT INTO `sys_role_menu` VALUES (959, 10, 8);
INSERT INTO `sys_role_menu` VALUES (960, 10, 32);
INSERT INTO `sys_role_menu` VALUES (961, 10, 33);
INSERT INTO `sys_role_menu` VALUES (962, 10, 34);
INSERT INTO `sys_role_menu` VALUES (963, 10, 9);
INSERT INTO `sys_role_menu` VALUES (964, 10, 10);
INSERT INTO `sys_role_menu` VALUES (965, 10, 35);
INSERT INTO `sys_role_menu` VALUES (966, 10, 36);
INSERT INTO `sys_role_menu` VALUES (967, 10, 37);
INSERT INTO `sys_role_menu` VALUES (968, 10, 49);
INSERT INTO `sys_role_menu` VALUES (969, 10, 58);
INSERT INTO `sys_role_menu` VALUES (970, 10, 59);
INSERT INTO `sys_role_menu` VALUES (971, 10, 11);
INSERT INTO `sys_role_menu` VALUES (972, 10, 12);
INSERT INTO `sys_role_menu` VALUES (973, 10, 38);
INSERT INTO `sys_role_menu` VALUES (974, 10, 39);
INSERT INTO `sys_role_menu` VALUES (975, 10, 40);
INSERT INTO `sys_role_menu` VALUES (976, 10, 50);
INSERT INTO `sys_role_menu` VALUES (977, 10, 14);
INSERT INTO `sys_role_menu` VALUES (978, 10, 41);
INSERT INTO `sys_role_menu` VALUES (979, 10, 42);
INSERT INTO `sys_role_menu` VALUES (980, 10, 43);
INSERT INTO `sys_role_menu` VALUES (981, 10, 44);
INSERT INTO `sys_role_menu` VALUES (982, 10, 45);
INSERT INTO `sys_role_menu` VALUES (983, 10, 15);
INSERT INTO `sys_role_menu` VALUES (984, 10, 46);
INSERT INTO `sys_role_menu` VALUES (985, 10, 51);
INSERT INTO `sys_role_menu` VALUES (986, 10, 60);
INSERT INTO `sys_role_menu` VALUES (987, 10, 61);
INSERT INTO `sys_role_menu` VALUES (988, 10, 63);
INSERT INTO `sys_role_menu` VALUES (989, 10, 64);
INSERT INTO `sys_role_menu` VALUES (990, 10, 65);
INSERT INTO `sys_role_menu` VALUES (991, 10, 66);
INSERT INTO `sys_role_menu` VALUES (992, 10, 67);
INSERT INTO `sys_role_menu` VALUES (993, 10, 62);
INSERT INTO `sys_role_menu` VALUES (994, 10, 70);
INSERT INTO `sys_role_menu` VALUES (995, 10, 72);
INSERT INTO `sys_role_menu` VALUES (996, 10, 73);
INSERT INTO `sys_role_menu` VALUES (997, 10, 52);
INSERT INTO `sys_role_menu` VALUES (998, 10, 53);
INSERT INTO `sys_role_menu` VALUES (999, 10, 54);
INSERT INTO `sys_role_menu` VALUES (1000, 10, 55);
INSERT INTO `sys_role_menu` VALUES (1001, 10, 56);
INSERT INTO `sys_role_menu` VALUES (1002, 10, 57);
INSERT INTO `sys_role_menu` VALUES (1003, 10, 76);
INSERT INTO `sys_role_menu` VALUES (1004, 10, 13);
INSERT INTO `sys_role_menu` VALUES (1005, 10, 75);
INSERT INTO `sys_role_menu` VALUES (1006, 1, 1);
INSERT INTO `sys_role_menu` VALUES (1007, 1, 2);
INSERT INTO `sys_role_menu` VALUES (1008, 1, 16);
INSERT INTO `sys_role_menu` VALUES (1009, 1, 17);
INSERT INTO `sys_role_menu` VALUES (1010, 1, 18);
INSERT INTO `sys_role_menu` VALUES (1011, 1, 3);
INSERT INTO `sys_role_menu` VALUES (1012, 1, 19);
INSERT INTO `sys_role_menu` VALUES (1013, 1, 20);
INSERT INTO `sys_role_menu` VALUES (1014, 1, 21);
INSERT INTO `sys_role_menu` VALUES (1015, 1, 22);
INSERT INTO `sys_role_menu` VALUES (1016, 1, 4);
INSERT INTO `sys_role_menu` VALUES (1017, 1, 23);
INSERT INTO `sys_role_menu` VALUES (1018, 1, 24);
INSERT INTO `sys_role_menu` VALUES (1019, 1, 25);
INSERT INTO `sys_role_menu` VALUES (1020, 1, 5);
INSERT INTO `sys_role_menu` VALUES (1021, 1, 6);
INSERT INTO `sys_role_menu` VALUES (1022, 1, 26);
INSERT INTO `sys_role_menu` VALUES (1023, 1, 27);
INSERT INTO `sys_role_menu` VALUES (1024, 1, 28);
INSERT INTO `sys_role_menu` VALUES (1025, 1, 7);
INSERT INTO `sys_role_menu` VALUES (1026, 1, 29);
INSERT INTO `sys_role_menu` VALUES (1027, 1, 30);
INSERT INTO `sys_role_menu` VALUES (1028, 1, 31);
INSERT INTO `sys_role_menu` VALUES (1029, 1, 8);
INSERT INTO `sys_role_menu` VALUES (1030, 1, 32);
INSERT INTO `sys_role_menu` VALUES (1031, 1, 33);
INSERT INTO `sys_role_menu` VALUES (1032, 1, 34);
INSERT INTO `sys_role_menu` VALUES (1033, 1, 9);
INSERT INTO `sys_role_menu` VALUES (1034, 1, 10);
INSERT INTO `sys_role_menu` VALUES (1035, 1, 35);
INSERT INTO `sys_role_menu` VALUES (1036, 1, 36);
INSERT INTO `sys_role_menu` VALUES (1037, 1, 37);
INSERT INTO `sys_role_menu` VALUES (1038, 1, 49);
INSERT INTO `sys_role_menu` VALUES (1039, 1, 58);
INSERT INTO `sys_role_menu` VALUES (1040, 1, 59);
INSERT INTO `sys_role_menu` VALUES (1041, 1, 11);
INSERT INTO `sys_role_menu` VALUES (1042, 1, 12);
INSERT INTO `sys_role_menu` VALUES (1043, 1, 38);
INSERT INTO `sys_role_menu` VALUES (1044, 1, 39);
INSERT INTO `sys_role_menu` VALUES (1045, 1, 40);
INSERT INTO `sys_role_menu` VALUES (1046, 1, 50);
INSERT INTO `sys_role_menu` VALUES (1047, 1, 14);
INSERT INTO `sys_role_menu` VALUES (1048, 1, 41);
INSERT INTO `sys_role_menu` VALUES (1049, 1, 42);
INSERT INTO `sys_role_menu` VALUES (1050, 1, 43);
INSERT INTO `sys_role_menu` VALUES (1051, 1, 44);
INSERT INTO `sys_role_menu` VALUES (1052, 1, 45);
INSERT INTO `sys_role_menu` VALUES (1053, 1, 15);
INSERT INTO `sys_role_menu` VALUES (1054, 1, 46);
INSERT INTO `sys_role_menu` VALUES (1055, 1, 51);
INSERT INTO `sys_role_menu` VALUES (1056, 1, 60);
INSERT INTO `sys_role_menu` VALUES (1057, 1, 61);
INSERT INTO `sys_role_menu` VALUES (1058, 1, 63);
INSERT INTO `sys_role_menu` VALUES (1059, 1, 64);
INSERT INTO `sys_role_menu` VALUES (1060, 1, 65);
INSERT INTO `sys_role_menu` VALUES (1061, 1, 66);
INSERT INTO `sys_role_menu` VALUES (1062, 1, 67);
INSERT INTO `sys_role_menu` VALUES (1063, 1, 62);
INSERT INTO `sys_role_menu` VALUES (1064, 1, 70);
INSERT INTO `sys_role_menu` VALUES (1065, 1, 72);
INSERT INTO `sys_role_menu` VALUES (1066, 1, 73);
INSERT INTO `sys_role_menu` VALUES (1067, 1, 52);
INSERT INTO `sys_role_menu` VALUES (1068, 1, 53);
INSERT INTO `sys_role_menu` VALUES (1069, 1, 54);
INSERT INTO `sys_role_menu` VALUES (1070, 1, 55);
INSERT INTO `sys_role_menu` VALUES (1071, 1, 56);
INSERT INTO `sys_role_menu` VALUES (1072, 1, 57);
INSERT INTO `sys_role_menu` VALUES (1073, 1, 76);
INSERT INTO `sys_role_menu` VALUES (1074, 1, 13);
INSERT INTO `sys_role_menu` VALUES (1075, 1, 75);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '登录账户',
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '登录密码',
  `nick_name` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '姓名',
  `phone` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '用户电话',
  `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '邮箱',
  `sex` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '0:男 1：女',
  `is_admin` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否为超级管理员 1：是 0：否',
  `is_account_non_expired` tinyint(4) NULL DEFAULT NULL COMMENT '帐户是否过期(1 未过期，0已过期)',
  `is_account_non_locked` tinyint(4) NULL DEFAULT NULL COMMENT '帐户是否被锁定(1 未锁定，0已锁定)',
  `is_credentials_non_expired` tinyint(4) NULL DEFAULT NULL COMMENT '密码是否过期(1 未过期，0已过期)',
  `is_enabled` tinyint(4) NULL DEFAULT NULL COMMENT '帐户是否可用(1 可用，0 删除用户)',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'ld', 'd41d8cd98f00b204e9800998ecf8427e', '李丹', '18687116223', '', '0', '0', 1, 1, 1, 1, '2024-04-01 15:28:57', '2024-05-07 14:57:24');
INSERT INTO `sys_user` VALUES (4, 'zh', 'd41d8cd98f00b204e9800998ecf8427e', '张虹', '13693213688', '', '1', '0', 1, 1, 1, 1, '2024-04-01 15:30:04', '2024-05-07 14:57:06');
INSERT INTO `sys_user` VALUES (6, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 'admin', '18787171962', '3501754007@qq.com', '0', '1', 1, 1, 1, 1, '2024-04-01 15:31:58', '2024-05-07 15:10:04');
INSERT INTO `sys_user` VALUES (7, 'admin1', '202cb962ac59075b964b07152d234b70', 'admin1', '14564645631', '', '0', '0', 1, 1, 1, 1, '2024-04-01 15:33:57', '2024-04-01 15:34:10');
INSERT INTO `sys_user` VALUES (10, 'xiaowu', 'e10adc3949ba59abbe56e057f20f883e', '小吴', '13568903122', '163537802@qq.com', '0', '0', 1, 1, 1, 1, '2024-04-16 13:27:54', '2024-05-07 14:59:41');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `role_id` int(11) NULL DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`user_role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (6, 7, 1);
INSERT INTO `sys_user_role` VALUES (7, 8, 1);
INSERT INTO `sys_user_role` VALUES (13, 4, 10);
INSERT INTO `sys_user_role` VALUES (14, 1, 10);
INSERT INTO `sys_user_role` VALUES (18, 10, 10);
INSERT INTO `sys_user_role` VALUES (19, 6, 1);

-- ----------------------------
-- Table structure for teacher_role
-- ----------------------------
DROP TABLE IF EXISTS `teacher_role`;
CREATE TABLE `teacher_role`  (
  `teacher_role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `teacher_id` int(11) NULL DEFAULT NULL COMMENT '教师id',
  `role_id` int(11) NULL DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`teacher_role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher_role
-- ----------------------------
INSERT INTO `teacher_role` VALUES (14, 12, 3);
INSERT INTO `teacher_role` VALUES (18, 2, 3);
INSERT INTO `teacher_role` VALUES (19, 3, 3);
INSERT INTO `teacher_role` VALUES (21, 8, 3);
INSERT INTO `teacher_role` VALUES (26, 16, 3);
INSERT INTO `teacher_role` VALUES (27, 18, 3);
INSERT INTO `teacher_role` VALUES (28, 9, 3);
INSERT INTO `teacher_role` VALUES (29, 7, 3);
INSERT INTO `teacher_role` VALUES (30, 15, 3);
INSERT INTO `teacher_role` VALUES (31, 19, 3);
INSERT INTO `teacher_role` VALUES (32, 20, 3);
INSERT INTO `teacher_role` VALUES (33, 21, 3);
INSERT INTO `teacher_role` VALUES (34, 22, 3);
INSERT INTO `teacher_role` VALUES (35, 23, 3);
INSERT INTO `teacher_role` VALUES (36, 24, 3);
INSERT INTO `teacher_role` VALUES (37, 25, 3);
INSERT INTO `teacher_role` VALUES (38, 26, 3);
INSERT INTO `teacher_role` VALUES (39, 27, 3);
INSERT INTO `teacher_role` VALUES (40, 28, 3);
INSERT INTO `teacher_role` VALUES (41, 29, 3);
INSERT INTO `teacher_role` VALUES (42, 30, 3);
INSERT INTO `teacher_role` VALUES (43, 31, 3);
INSERT INTO `teacher_role` VALUES (44, 32, 3);
INSERT INTO `teacher_role` VALUES (45, 33, 3);
INSERT INTO `teacher_role` VALUES (46, 34, 3);
INSERT INTO `teacher_role` VALUES (47, 35, 3);

SET FOREIGN_KEY_CHECKS = 1;
