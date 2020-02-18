/*
 Navicat Premium Data Transfer

 Source Server         : cumt
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : 118.25.92.2:3306
 Source Schema         : cumtcdio

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 18/02/2020 12:35:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for achievement
-- ----------------------------
DROP TABLE IF EXISTS `achievement`;
CREATE TABLE `achievement`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '结果id',
  `course_id` int(11) NULL DEFAULT NULL COMMENT '课程id',
  `achievement_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '结果名称例如、商业计划书',
  `grade_sn` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年级',
  `dead_line` timestamp(0) NULL DEFAULT NULL COMMENT '截止时间',
  `time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发布时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk[course_id]achievement`(`course_id`) USING BTREE,
  CONSTRAINT `fk[course_id]achievement` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of achievement
-- ----------------------------
INSERT INTO `achievement` VALUES (22, 24, 'Axure 原型', '2016', '2019-07-30 16:00:00', '2019-07-23 15:57:59');
INSERT INTO `achievement` VALUES (23, 25, 'Axure原型', '2017', '2019-08-27 15:59:59', '2019-07-25 11:03:56');
INSERT INTO `achievement` VALUES (24, 25, '项目说明书', '2017', '2019-08-27 15:59:59', '2019-07-25 11:04:40');
INSERT INTO `achievement` VALUES (25, 25, '前端源代码', '2017', '2019-08-27 15:59:59', '2019-07-25 11:07:06');
INSERT INTO `achievement` VALUES (26, 25, '知识技能考核表', '2017', '2019-08-27 15:59:59', '2019-07-25 11:08:02');
INSERT INTO `achievement` VALUES (27, 25, '工作日志', '2017', '2019-08-27 15:59:59', '2019-07-25 11:08:24');

-- ----------------------------
-- Table structure for achievement_address
-- ----------------------------
DROP TABLE IF EXISTS `achievement_address`;
CREATE TABLE `achievement_address`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `achievement_id` int(11) NULL DEFAULT NULL COMMENT 'achievement结果id',
  `group_id` int(11) NULL DEFAULT NULL COMMENT '组别id',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '结果存储地址',
  `score` int(11) NULL DEFAULT NULL COMMENT '结果分数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk[achievement_id]achievement_address`(`achievement_id`) USING BTREE,
  INDEX `fk[group_id]achievement_address`(`group_id`) USING BTREE,
  CONSTRAINT `fk[achievement_id]achievement_address` FOREIGN KEY (`achievement_id`) REFERENCES `achievement` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk[group_id]achievement_address` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 130 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of achievement_address
-- ----------------------------
INSERT INTO `achievement_address` VALUES (36, 22, 18, 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/44fdea0a-a8d2-4b60-999e-dd836f6198c3.jpg', NULL);
INSERT INTO `achievement_address` VALUES (37, 22, 17, NULL, NULL);
INSERT INTO `achievement_address` VALUES (38, 22, 29, NULL, NULL);
INSERT INTO `achievement_address` VALUES (39, 22, 13, 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/e3a5bfd5-bda8-4d0f-b398-2faa7956a408.docx', NULL);
INSERT INTO `achievement_address` VALUES (40, 22, 14, NULL, NULL);
INSERT INTO `achievement_address` VALUES (41, 22, 19, NULL, NULL);
INSERT INTO `achievement_address` VALUES (42, 22, 20, NULL, NULL);
INSERT INTO `achievement_address` VALUES (43, 22, 15, NULL, NULL);
INSERT INTO `achievement_address` VALUES (44, 22, 24, NULL, NULL);
INSERT INTO `achievement_address` VALUES (45, 22, 23, NULL, NULL);
INSERT INTO `achievement_address` VALUES (46, 22, 12, 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/f6ef6cac-b30c-4664-8e0b-bd793a98035e.docx', NULL);
INSERT INTO `achievement_address` VALUES (47, 22, 22, NULL, NULL);
INSERT INTO `achievement_address` VALUES (48, 22, 21, NULL, NULL);
INSERT INTO `achievement_address` VALUES (49, 22, 16, NULL, NULL);
INSERT INTO `achievement_address` VALUES (50, 23, 35, NULL, NULL);
INSERT INTO `achievement_address` VALUES (51, 23, 49, NULL, NULL);
INSERT INTO `achievement_address` VALUES (52, 23, 33, 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/5e8bbe5d-dc51-43d2-8ae6-37c913f2c5d7.rp', NULL);
INSERT INTO `achievement_address` VALUES (53, 23, 51, NULL, NULL);
INSERT INTO `achievement_address` VALUES (54, 23, 112, NULL, NULL);
INSERT INTO `achievement_address` VALUES (55, 23, 34, NULL, NULL);
INSERT INTO `achievement_address` VALUES (56, 23, 37, NULL, NULL);
INSERT INTO `achievement_address` VALUES (57, 23, 74, NULL, NULL);
INSERT INTO `achievement_address` VALUES (58, 23, 92, NULL, NULL);
INSERT INTO `achievement_address` VALUES (59, 23, 80, NULL, NULL);
INSERT INTO `achievement_address` VALUES (60, 23, 30, NULL, NULL);
INSERT INTO `achievement_address` VALUES (61, 23, 43, NULL, NULL);
INSERT INTO `achievement_address` VALUES (62, 23, 38, NULL, NULL);
INSERT INTO `achievement_address` VALUES (63, 23, 36, NULL, NULL);
INSERT INTO `achievement_address` VALUES (64, 23, 50, NULL, NULL);
INSERT INTO `achievement_address` VALUES (65, 23, 48, NULL, NULL);
INSERT INTO `achievement_address` VALUES (66, 24, 35, NULL, NULL);
INSERT INTO `achievement_address` VALUES (67, 24, 49, NULL, NULL);
INSERT INTO `achievement_address` VALUES (68, 24, 33, 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/5eb43be1-d717-46c1-bc97-4d9d298a20a5.docx', NULL);
INSERT INTO `achievement_address` VALUES (69, 24, 51, NULL, NULL);
INSERT INTO `achievement_address` VALUES (70, 24, 112, NULL, NULL);
INSERT INTO `achievement_address` VALUES (71, 24, 34, NULL, NULL);
INSERT INTO `achievement_address` VALUES (72, 24, 37, NULL, NULL);
INSERT INTO `achievement_address` VALUES (73, 24, 74, NULL, NULL);
INSERT INTO `achievement_address` VALUES (74, 24, 92, NULL, NULL);
INSERT INTO `achievement_address` VALUES (75, 24, 80, NULL, NULL);
INSERT INTO `achievement_address` VALUES (76, 24, 30, NULL, NULL);
INSERT INTO `achievement_address` VALUES (77, 24, 43, NULL, NULL);
INSERT INTO `achievement_address` VALUES (78, 24, 38, NULL, NULL);
INSERT INTO `achievement_address` VALUES (79, 24, 36, NULL, NULL);
INSERT INTO `achievement_address` VALUES (80, 24, 50, NULL, NULL);
INSERT INTO `achievement_address` VALUES (81, 24, 48, NULL, NULL);
INSERT INTO `achievement_address` VALUES (82, 25, 35, NULL, NULL);
INSERT INTO `achievement_address` VALUES (83, 25, 49, NULL, NULL);
INSERT INTO `achievement_address` VALUES (84, 25, 33, NULL, NULL);
INSERT INTO `achievement_address` VALUES (85, 25, 51, NULL, NULL);
INSERT INTO `achievement_address` VALUES (86, 25, 112, NULL, NULL);
INSERT INTO `achievement_address` VALUES (87, 25, 34, NULL, NULL);
INSERT INTO `achievement_address` VALUES (88, 25, 37, NULL, NULL);
INSERT INTO `achievement_address` VALUES (89, 25, 74, NULL, NULL);
INSERT INTO `achievement_address` VALUES (90, 25, 92, NULL, NULL);
INSERT INTO `achievement_address` VALUES (91, 25, 80, NULL, NULL);
INSERT INTO `achievement_address` VALUES (92, 25, 30, NULL, NULL);
INSERT INTO `achievement_address` VALUES (93, 25, 43, NULL, NULL);
INSERT INTO `achievement_address` VALUES (94, 25, 38, NULL, NULL);
INSERT INTO `achievement_address` VALUES (95, 25, 36, NULL, NULL);
INSERT INTO `achievement_address` VALUES (96, 25, 50, NULL, NULL);
INSERT INTO `achievement_address` VALUES (97, 25, 48, NULL, NULL);
INSERT INTO `achievement_address` VALUES (98, 26, 35, NULL, NULL);
INSERT INTO `achievement_address` VALUES (99, 26, 49, NULL, NULL);
INSERT INTO `achievement_address` VALUES (100, 26, 33, 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/d64a1cb5-6dc5-40de-ba8f-f553758cf98c.docx', NULL);
INSERT INTO `achievement_address` VALUES (101, 26, 51, NULL, NULL);
INSERT INTO `achievement_address` VALUES (102, 26, 112, NULL, NULL);
INSERT INTO `achievement_address` VALUES (103, 26, 34, NULL, NULL);
INSERT INTO `achievement_address` VALUES (104, 26, 37, NULL, NULL);
INSERT INTO `achievement_address` VALUES (105, 26, 74, NULL, NULL);
INSERT INTO `achievement_address` VALUES (106, 26, 92, NULL, NULL);
INSERT INTO `achievement_address` VALUES (107, 26, 80, NULL, NULL);
INSERT INTO `achievement_address` VALUES (108, 26, 30, NULL, NULL);
INSERT INTO `achievement_address` VALUES (109, 26, 43, NULL, NULL);
INSERT INTO `achievement_address` VALUES (110, 26, 38, NULL, NULL);
INSERT INTO `achievement_address` VALUES (111, 26, 36, NULL, NULL);
INSERT INTO `achievement_address` VALUES (112, 26, 50, NULL, NULL);
INSERT INTO `achievement_address` VALUES (113, 26, 48, NULL, NULL);
INSERT INTO `achievement_address` VALUES (114, 27, 35, 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/25a2f685-1527-48eb-aeae-184ec4e0a630.docx', NULL);
INSERT INTO `achievement_address` VALUES (115, 27, 49, 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/78100569-1073-4852-bae8-7a997d500e2f.rar', NULL);
INSERT INTO `achievement_address` VALUES (116, 27, 33, 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/0ec081b0-4533-41d9-bdb4-b1d4b9026e20.docx', NULL);
INSERT INTO `achievement_address` VALUES (117, 27, 51, 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/41925ab7-e41f-48c0-b8dc-5f1ded0b8510.docx', NULL);
INSERT INTO `achievement_address` VALUES (118, 27, 112, 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/9cf802e5-25ee-4919-aa6c-5472e8b10731.docx', NULL);
INSERT INTO `achievement_address` VALUES (119, 27, 34, 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/a4d52d7c-f7c5-491f-a001-85aa55b4f1d1.doc', NULL);
INSERT INTO `achievement_address` VALUES (120, 27, 37, NULL, NULL);
INSERT INTO `achievement_address` VALUES (121, 27, 74, NULL, NULL);
INSERT INTO `achievement_address` VALUES (122, 27, 92, NULL, NULL);
INSERT INTO `achievement_address` VALUES (123, 27, 80, 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/d53091db-267f-4c40-9778-fc9879d68179.docx', NULL);
INSERT INTO `achievement_address` VALUES (124, 27, 30, 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/74f3a38e-8c69-4b94-b404-77bc2eed5fcb.docx', NULL);
INSERT INTO `achievement_address` VALUES (125, 27, 43, NULL, NULL);
INSERT INTO `achievement_address` VALUES (126, 27, 38, 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/083555dc-d2ed-420b-841f-2b5ea221d9d6.docx', NULL);
INSERT INTO `achievement_address` VALUES (127, 27, 36, NULL, NULL);
INSERT INTO `achievement_address` VALUES (128, 27, 50, 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/99ae8d67-01d8-463c-b1b1-516e243826cc.docx', NULL);
INSERT INTO `achievement_address` VALUES (129, 27, 48, NULL, NULL);

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '课程id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '课程名称',
  `type` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'C/D/I/O',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (24, '前端', 'C');
INSERT INTO `course` VALUES (25, '前端设计与开发', 'I');

-- ----------------------------
-- Table structure for course_grade
-- ----------------------------
DROP TABLE IF EXISTS `course_grade`;
CREATE TABLE `course_grade`  (
  `course_id` int(11) NOT NULL,
  `grade_sn` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `teacher_id` int(11) NOT NULL,
  PRIMARY KEY (`course_id`, `grade_sn`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course_grade
-- ----------------------------
INSERT INTO `course_grade` VALUES (25, '2017', 167);

-- ----------------------------
-- Table structure for grade
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grade_sn` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `grade_sn`(`grade_sn`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of grade
-- ----------------------------
INSERT INTO `grade` VALUES (1, '2016');
INSERT INTO `grade` VALUES (2, '2017');
INSERT INTO `grade` VALUES (3, '2018');

-- ----------------------------
-- Table structure for group
-- ----------------------------
DROP TABLE IF EXISTS `group`;
CREATE TABLE `group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_sn` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `group_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '项目名称',
  `grade_sn` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '小组年级',
  `group_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '项目小组的图片地址',
  `teacher` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '指导老师姓名',
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '小组项目概要',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk[group]grade_sn`(`grade_sn`) USING BTREE,
  CONSTRAINT `fk[group]grade_sn` FOREIGN KEY (`grade_sn`) REFERENCES `grade` (`grade_sn`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 113 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of group
-- ----------------------------
INSERT INTO `group` VALUES (12, '6', '校园移动微创客联盟', '2016', 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/cfca2d77-6887-4296-a0fd-79c803fdc391.jpg', '冯文龙', '校园移动微创客联盟以支持学生微创业为目的，创客把特色产品或服务加入到自己的创客店铺进行销售获得佣金。');
INSERT INTO `group` VALUES (13, '12', '桐桐AI教育', '2016', 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/9b160937-c278-4d0a-93d4-7cfebc801396.png', '孟现飞', '桐桐AI教育致力于通过AI+教育促进提升孩子成绩进步');
INSERT INTO `group` VALUES (14, '14', '闻道', '2016', 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/b9a12541-391a-4576-9086-b2894e803fbd.png', '张磊', '闻道提供的服务有专业词汇查询，社区和赏金与付费问答以供专业性问题的交流探讨，以及与专业相关的学习资料');
INSERT INTO `group` VALUES (15, '3', '校园邦绑帮棒', '2016', 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/f39a80be-03c2-41b3-b255-22f1b3a8695e.jpg', '肖开锋', '校园Bangs 校园服务平台');
INSERT INTO `group` VALUES (16, '9', 'Angel', '2016', 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/504f35e2-1169-4af9-9a25-02369fe0651b.jpg', '胡霞', '陪你把独自孤单变成勇敢，做你身边最好的心理帮手。');
INSERT INTO `group` VALUES (17, '10', '校园头条', '2016', 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/743fd4e4-562d-4ce6-9e35-801e5da1338b.jpg', '王辉', '校园头条WebApp是一个对校内外信息整合、发布、交流的互联网平台。');
INSERT INTO `group` VALUES (18, '1', '雾课堂', '2016', 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/7d681f30-e057-4f75-a98f-07b1522d8768.png', '张召浦', '  雾课堂主要针对电商同学收集、整理老师发布的课件、文档、试卷等，同时也提供精品课程的推荐等。');
INSERT INTO `group` VALUES (19, '15', '果然', '2016', 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/7f131e22-6ab3-4130-9ff1-27622a4b50a9.png', '王星', '果然是一个专门为“吃”打造的平台，“吃”是一种态度，一种对生活的热爱。');
INSERT INTO `group` VALUES (20, '2', 'FollowMe', '2016', 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/ac3e760f-cebb-44e2-bffe-48135af73ecd.png', '叶新凤', 'Follow Me旅游网针对大学生集旅行游记分享、个性化出游方案定制、特色社团拼团游为一体的旅游网');
INSERT INTO `group` VALUES (21, '8', '吃哆哆', '2016', 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/e7e5242d-14e4-4d47-8881-b6d01913df93.jpg', '贺超', '两尺见方，包罗万象');
INSERT INTO `group` VALUES (22, '7', '易搭美学', '2016', 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/dd2c31c1-a2ea-4c84-bc16-620f9fec2356.png', '杨明智', '追求美和个性的过程中，人们不知道什么适合自己或者什么场合需要怎样的穿搭。易搭美学让用户找到好的穿搭。');
INSERT INTO `group` VALUES (23, '5', 'Get', '2016', 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/10faab88-2449-4fc4-9d78-34e9f4972526.png', '张卫华', '    本项目是为了解决当今大学生，自我发现，自我管理，自我成就的需求问题。');
INSERT INTO `group` VALUES (24, '4', 'e同行', '2016', 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/6a1bbd45-8568-40be-a2cf-c3c5704aae08.jpg', '樊世清', '告别孤独出行，让出行更安全');
INSERT INTO `group` VALUES (29, '11', '路之家', '2016', 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/78afc8fb-095b-4303-a334-57f475e9b469.jpg', '王贺朝', '依托徐工平台优势产业，致力于促进MRO行业发展。');
INSERT INTO `group` VALUES (30, '4', '矿小厨', '2017', 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/0ccd2420-fef9-4fec-95ad-aa3a8c66d4c8.png', '张磊', '矿小厨，又名高校厨房，提出我布置精美厨房，你负责烧菜做饭，你们负责感情升温的目标，并正在为之所奋斗。');
INSERT INTO `group` VALUES (33, '11', '校园赛事通', '2017', 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/182c07f4-23d2-4356-985e-47935921b588.jpg', '王德鲁', '丰富人性化的设置为参赛者提供了更加便捷的线上途径，同时为发布者发布活动提供了更多样化的宣传');
INSERT INTO `group` VALUES (34, '14', '鸵鸵搭', '2017', 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/31afe60b-a0f3-4e6d-bf65-121cd9271628.jpg', '贺超', '鸵鸵搭是根据受众的已有服饰进行个性化搭配，将资源利用率提高，辅以推荐搭配同时还具有社交功能。');
INSERT INTO `group` VALUES (35, '1', '矿且有约', '2017', 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/a7fd0f37-d47f-43cd-a293-ae463db0ad34.png', '杨明智', '矿且有约，快来艾特你的小伙伴吧！');
INSERT INTO `group` VALUES (36, '7', 'U-get', '2017', 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/e45052e1-e5cd-4f93-aaa8-748fcb34cc24.PNG', '王贺朝', '该平台为大家提供大学生的日常生活视频分享以及各个高校超话社区，丰富大学生生活');
INSERT INTO `group` VALUES (37, '15', '惠农源', '2017', 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/626e3d77-7efa-485c-9941-f31071552e8a.png', '张卫华', '旨在帮助农民拓宽销售渠道，为蔬果种植提供参考；为消费者提供更优质农产品和亲身体验，绿色食品等定制服务');
INSERT INTO `group` VALUES (38, '6', '知知—微校园共享集市', '2017', 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/6ae44054-61b0-4399-a780-a7f4cda7c395.png', '冯文龙', '提高校园书籍的利用率，发扬校园的共享精神，开发“知知”，为学生提供共享闲置书本资源、技能的平台。');
INSERT INTO `group` VALUES (43, '5', 'Rings', '2017', 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/b1445882-6583-41eb-9b2b-b1a5cce12220.png', '孟现飞', '我们常常忘记自己的目标，Rings为我们提供了一个平台，让我们每天向成功更进一步');
INSERT INTO `group` VALUES (48, '9', '简墨', '2017', 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/2d8271fe-0692-4ec4-97cb-9676229d1ce4.png', '樊世清', '简墨小程序是一个校园云印共享平台，利用覆盖校区的终端进行自助打印，为全校师生提供打印复印等多项服务。');
INSERT INTO `group` VALUES (49, '10', '拼滴滴', '2017', 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/7c8da545-b213-42ce-a856-b49ef441d2bd.jpg', '王辉', '拼滴滴旨在帮助校内学生拼车更方便，更便宜。');
INSERT INTO `group` VALUES (50, '8', 'Tips', '2017', 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/2251b515-dc7d-46eb-8978-ea8b6d81709d.jpg', '冯春花', '大学生出行助手,城市文化推动者。提高大学生生活质量，推动城市文化向内延伸，向外拓展双向发展。');
INSERT INTO `group` VALUES (51, '12', '云留言 cloud message', '2017', 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/9e187b06-f6f8-4b83-ae31-09738da8ae44.jpg', '叶新凤', '该平台是以用户实时实地留言为依托，为用户提供一个分享所见所想，并且留住记忆的平台。');
INSERT INTO `group` VALUES (74, '16', '洋葱', '2017', 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/16fd7bb3-3db4-48d3-bc1b-84769bcd16f5.png', '刘玥', '作为一个在线语言学习平台，帮助有英语学习需求的大学生提高英语水平 ');
INSERT INTO `group` VALUES (80, '3', 'CUMThing', '2017', 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/0ead95b9-d4cc-4998-863f-2255969d8b0c.png', '肖开锋', '此信息整合平台包括活动、志愿、头条、周边。组织可通过平台发布信息。个人可游览信息和购买矿大周边。');
INSERT INTO `group` VALUES (92, '2', 'story', '2017', 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/d4d10d1c-d572-41a6-bb79-1a58b1ae6b96.jpeg', '张召浦', '缓解孤独感与压力，分享与倾听故事。');
INSERT INTO `group` VALUES (112, '13', '矿工', '2017', 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/268c2ca9-5897-4c11-a8e3-a348f391363e.jpg', '胡霞', '旨在为时间不够充裕的大学生提供协同工作的兼职新方式的一款面向矿大学生的具有“拼工作”特色的兼职平台。');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由路径 ‘/home/:id’',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件名字',
  `keep_alive` tinyint(1) NULL DEFAULT NULL,
  `require_auth` tinyint(1) NULL DEFAULT NULL,
  `parent_id` int(11) NULL DEFAULT NULL,
  `enabled` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, '/', 'Login', 0, 0, 0, 1);
INSERT INTO `menu` VALUES (2, '/home', 'Home', 0, 1, 0, 1);
INSERT INTO `menu` VALUES (3, '/show/:id', 'Show', 0, 1, 2, 1);
INSERT INTO `menu` VALUES (4, '/show/:id/:index', 'Edit', 0, 1, 2, 1);
INSERT INTO `menu` VALUES (5, '/cdio', 'CumtCDIO', 0, 1, 2, 1);
INSERT INTO `menu` VALUES (6, '/cdio/group/:grade/:sn', 'groupInfo', 0, 1, 2, 1);
INSERT INTO `menu` VALUES (7, '/cdio/group/insert', 'groupInsert', 0, 1, 2, 1);
INSERT INTO `menu` VALUES (8, '/cdio/group/processManage', 'processManage', 0, 1, 2, 1);
INSERT INTO `menu` VALUES (9, '/slide', 'Slide', 0, 1, 2, 1);
INSERT INTO `menu` VALUES (12, '/cdio/admin', 'admin', 0, 1, 2, 1);
INSERT INTO `menu` VALUES (14, '/course/manage', 'CourseManage', 0, 1, 2, 1);
INSERT INTO `menu` VALUES (15, '/info/student', 'StudentInfo', 0, 1, 2, 1);
INSERT INTO `menu` VALUES (16, '/info/teacher', 'TeacherInfo', 0, 1, 2, 1);
INSERT INTO `menu` VALUES (17, '/info/complete', 'CompleteUserInfo', 0, 1, 2, 1);

-- ----------------------------
-- Table structure for menu_role
-- ----------------------------
DROP TABLE IF EXISTS `menu_role`;
CREATE TABLE `menu_role`  (
  `m_id` int(11) NULL DEFAULT NULL,
  `r_id` int(11) NULL DEFAULT NULL,
  INDEX `fk[m_id]menu_role`(`m_id`) USING BTREE,
  INDEX `fk[r_id]menu_role`(`r_id`) USING BTREE,
  CONSTRAINT `fk[m_id]menu_role` FOREIGN KEY (`m_id`) REFERENCES `menu` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk[r_id]menu_role` FOREIGN KEY (`r_id`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu_role
-- ----------------------------
INSERT INTO `menu_role` VALUES (1, 1);
INSERT INTO `menu_role` VALUES (2, 1);
INSERT INTO `menu_role` VALUES (3, 1);
INSERT INTO `menu_role` VALUES (4, 1);
INSERT INTO `menu_role` VALUES (5, 1);
INSERT INTO `menu_role` VALUES (6, 1);
INSERT INTO `menu_role` VALUES (7, 1);
INSERT INTO `menu_role` VALUES (8, 1);
INSERT INTO `menu_role` VALUES (9, 1);
INSERT INTO `menu_role` VALUES (1, 2);
INSERT INTO `menu_role` VALUES (2, 2);
INSERT INTO `menu_role` VALUES (5, 2);
INSERT INTO `menu_role` VALUES (6, 2);
INSERT INTO `menu_role` VALUES (7, 2);
INSERT INTO `menu_role` VALUES (8, 2);
INSERT INTO `menu_role` VALUES (12, 1);
INSERT INTO `menu_role` VALUES (14, 1);
INSERT INTO `menu_role` VALUES (14, 3);
INSERT INTO `menu_role` VALUES (15, 1);
INSERT INTO `menu_role` VALUES (16, 1);
INSERT INTO `menu_role` VALUES (17, 2);
INSERT INTO `menu_role` VALUES (17, 1);
INSERT INTO `menu_role` VALUES (17, 3);
INSERT INTO `menu_role` VALUES (1, 3);
INSERT INTO `menu_role` VALUES (2, 3);
INSERT INTO `menu_role` VALUES (1, 4);
INSERT INTO `menu_role` VALUES (2, 4);
INSERT INTO `menu_role` VALUES (3, 4);
INSERT INTO `menu_role` VALUES (4, 4);
INSERT INTO `menu_role` VALUES (9, 4);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_type` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `role_type`(`role_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 'admin');
INSERT INTO `role` VALUES (4, 'show');
INSERT INTO `role` VALUES (2, 'student');
INSERT INTO `role` VALUES (3, 'teacher');

-- ----------------------------
-- Table structure for routes
-- ----------------------------
DROP TABLE IF EXISTS `routes`;
CREATE TABLE `routes`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `parent_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of routes
-- ----------------------------
INSERT INTO `routes` VALUES (1, '轮播图', NULL, 'el-icon-picture', 0);
INSERT INTO `routes` VALUES (2, '文章管理', NULL, 'el-icon-document', 0);
INSERT INTO `routes` VALUES (3, 'CUMT-CDIO', NULL, 'el-icon-info', 0);
INSERT INTO `routes` VALUES (4, '轮播图', '/slide', NULL, 1);
INSERT INTO `routes` VALUES (5, '通知', '/show/0', NULL, 2);
INSERT INTO `routes` VALUES (6, '新闻', '/show/1', NULL, 2);
INSERT INTO `routes` VALUES (7, '师生风采', '/show/2', NULL, 2);
INSERT INTO `routes` VALUES (8, '专业信息', '/show/3', NULL, 2);
INSERT INTO `routes` VALUES (9, '项目沙龙', '/show/4', NULL, 2);
INSERT INTO `routes` VALUES (10, 'CDIO管理', '/cdio', NULL, 3);
INSERT INTO `routes` VALUES (11, 'admin', '/cdio/admin', NULL, 3);
INSERT INTO `routes` VALUES (12, '课程管理', '', 'el-icon-menu', 0);
INSERT INTO `routes` VALUES (13, '教师课程管理', '/course/manage', NULL, 12);
INSERT INTO `routes` VALUES (14, '信息查询', NULL, 'el-icon-tickets', 0);
INSERT INTO `routes` VALUES (15, '学生基本信息', '/info/student', NULL, 14);
INSERT INTO `routes` VALUES (16, '教师基本信息', '/info/teacher', NULL, 14);
INSERT INTO `routes` VALUES (17, '人才培养模式', '/show/5', NULL, 2);

-- ----------------------------
-- Table structure for routes_role
-- ----------------------------
DROP TABLE IF EXISTS `routes_role`;
CREATE TABLE `routes_role`  (
  `routes_id` int(11) NOT NULL,
  `role_id` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of routes_role
-- ----------------------------
INSERT INTO `routes_role` VALUES (1, 1);
INSERT INTO `routes_role` VALUES (2, 1);
INSERT INTO `routes_role` VALUES (3, 1);
INSERT INTO `routes_role` VALUES (4, 1);
INSERT INTO `routes_role` VALUES (5, 1);
INSERT INTO `routes_role` VALUES (6, 1);
INSERT INTO `routes_role` VALUES (7, 1);
INSERT INTO `routes_role` VALUES (8, 1);
INSERT INTO `routes_role` VALUES (9, 1);
INSERT INTO `routes_role` VALUES (10, 1);
INSERT INTO `routes_role` VALUES (3, 2);
INSERT INTO `routes_role` VALUES (10, 2);
INSERT INTO `routes_role` VALUES (11, 1);
INSERT INTO `routes_role` VALUES (12, 1);
INSERT INTO `routes_role` VALUES (13, 1);
INSERT INTO `routes_role` VALUES (14, 1);
INSERT INTO `routes_role` VALUES (15, 1);
INSERT INTO `routes_role` VALUES (16, 1);
INSERT INTO `routes_role` VALUES (13, 3);
INSERT INTO `routes_role` VALUES (12, 3);
INSERT INTO `routes_role` VALUES (1, 4);
INSERT INTO `routes_role` VALUES (2, 4);
INSERT INTO `routes_role` VALUES (4, 4);
INSERT INTO `routes_role` VALUES (5, 4);
INSERT INTO `routes_role` VALUES (6, 4);
INSERT INTO `routes_role` VALUES (7, 4);
INSERT INTO `routes_role` VALUES (8, 4);
INSERT INTO `routes_role` VALUES (9, 4);
INSERT INTO `routes_role` VALUES (17, 1);
INSERT INTO `routes_role` VALUES (17, 4);

-- ----------------------------
-- Table structure for show
-- ----------------------------
DROP TABLE IF EXISTS `show`;
CREATE TABLE `show`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文章标题',
  `type` int(10) NULL DEFAULT NULL COMMENT '类型 通知0、新闻1、师生风采2、专业信息3、项目沙龙4、人才培养模式5',
  `html_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'iframe对应的地址',
  `date_time` datetime(0) NULL DEFAULT NULL COMMENT '时间',
  `summary` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文章概要（简要说明是干什么的）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of show
-- ----------------------------
INSERT INTO `show` VALUES (20, '管理学院庆祝建校110周年系列活动：第九届全国大学生电子商务“创新、创意及创业”挑战赛中国矿业大学选拔赛成功举行', 1, 'http://show-1257444045.cos.ap-shanghai.myqcloud.com/f3b466af-5845-4cf5-9c79-50f976afd64f.html', '2019-04-26 00:00:00', '2019年4月21日,第九届全国大学生电子商务“创新、创业及创意”挑战赛（以下简称“三创赛”）中国矿业大学选拔赛在博学四号楼举行。来自全校10逾个专业的71支参赛队、近350名学生在比赛中展示了创新意识、创意思维、创业能力及团队协同实战精神。');
INSERT INTO `show` VALUES (21, '《高等工程教育研究》刊文报道电子商务专业EC-CDIO人才培养模式', 1, 'http://show-1257444045.cos.ap-shanghai.myqcloud.com/08131667-7ffc-473c-930e-b91155874163.html', '2019-04-26 00:00:00', '2019年1月，《高等工程教育研究》刊出由我院教师张磊、王辉、冯文龙和孟现飞合作撰写的《EC-CDIO电子商务人才培养模式的构建》学术论文。');
INSERT INTO `show` VALUES (22, '2018年暑期电子商务专业认识实习活动纪实', 4, 'http://show-1257444045.cos.ap-shanghai.myqcloud.com/737fd3b9-ec31-44a3-aec3-3d6e7ed83bc2.html', '2019-04-26 00:00:00', '为对电子商务专业有一个初步全面的认知了解， 2018年暑假期间管理学院电商与数据科学系组织2017级全体电商系的学生踏上长达十天的电子商务认识实习旅程。电商与数据科学系的王辉老师、王贺朝老师、冯文龙老师与胡霞老师四位老师更是随队前行，全程作陪，为同学们的生活与学习提供大力支持。');
INSERT INTO `show` VALUES (32, '电子商务专业发展战略论坛系列讲座', 0, 'http://show-1257444045.cos.ap-shanghai.myqcloud.com/d43f3dfd-ca45-41de-a8e7-f2e5dc38dee3.html', '2019-04-27 00:00:00', '2019年4月28日，电子商务与数据科学系将举办管理学院110周年系列纪念活动之电子商务专业发展战略论坛系列讲座，西安交通大学李琪教授、重庆大学邵兵家教授、厦门大学教授彭丽芳将共同出席本次讲座。');
INSERT INTO `show` VALUES (34, '以行促知，行知相长—管理学院电子商务专业暑期实习汇报展示报告会', 4, 'http://show-1257444045.cos.ap-shanghai.myqcloud.com/1ee3c943-6450-45a3-a72d-dffc152a00c3.html', '2019-04-27 04:23:10', '9月15日下午14：00，为总结实习经验，加强校企联系，检验实习成果，并评选优秀团体，由我院电子商务与数据科学系举办的2018中国矿业大学电子商务与数据科学专业暑期实习汇报展示报告会在管理学院B117顺利召开，参与本次会议的有学校教务部领导，管理学院领导，电子商务与数据科学系部分教师、实习企业代表，电商2017全体同学和电商2016、电商2015优秀实习代表。');
INSERT INTO `show` VALUES (35, '2017级EC-CDIO项目选题结果', 3, 'http://show-1257444045.cos.ap-shanghai.myqcloud.com/887c1793-c15a-4145-8710-1d59b96423d0.html', '2019-04-27 00:00:00', '为进一步提高人才培养质量，保障2017级EC-CDIO项目的顺利推进，3月29日晚上，电子商务专业在B-108室召开EC-CDIO选题论证会。');
INSERT INTO `show` VALUES (36, '理论实践相融合，科学创新精管理 ——走近冯文龙老师', 2, 'http://show-1257444045.cos.ap-shanghai.myqcloud.com/c714f0e5-6b02-40fd-af24-c86c92b71d82.html', '2019-04-27 00:00:00', '冯文龙，男，1992年入党，2015年初从中国矿业大学管理学院能源经济与管理研究所重新回到中国矿业大学管理学院电子商务系开展教学工作。主讲《管理信息系统》和《EXCEL数据分析与决策》课程。目前正在进行《EXCEL数据分析与决策》课程的微课开发研究和《企业经营与决策沙盘模拟》课程研究与建设以及《管理信息系统》课程教学改革与研究工作。教学过程中，与中国矿业大学管理学院同事一起共同探讨课程教学改革与建设，探索新形势下电子商务发展与电子商务人才培养。');
INSERT INTO `show` VALUES (37, '电子商务与数据科学系  专业建设与学生发展大会暨2018级新生见面会', 1, 'http://show-1257444045.cos.ap-shanghai.myqcloud.com/f1c26c6e-13d2-498c-90f1-33d95bc043ad.html', '2019-05-24 00:00:00', '5月18日，管理学院电子商务专业建设与学生发展大会暨2018级新生见面会于博2-C302举行。');
INSERT INTO `show` VALUES (38, '概述', 5, 'http://show-1257444045.cos.ap-shanghai.myqcloud.com/d5695df7-1aca-48a2-8236-121ca00888fc.html', '2019-05-31 00:00:00', '这是概述');
INSERT INTO `show` VALUES (39, '培养目标', 5, 'http://show-1257444045.cos.ap-shanghai.myqcloud.com/b090f007-b9af-4c60-9ca5-65e292ac9af8.html', '2019-05-31 00:00:00', '培养目标概述');
INSERT INTO `show` VALUES (40, '专业模块和课程体系', 5, 'http://show-1257444045.cos.ap-shanghai.myqcloud.com/2e86db0d-8c5f-4269-bd09-52f16c38d9a6.html', '2019-05-31 00:00:00', '专业模块和课程体系');
INSERT INTO `show` VALUES (41, '项目实践和课程管理', 5, 'http://show-1257444045.cos.ap-shanghai.myqcloud.com/ea8a06d4-7987-4115-a899-f826c908e890.html', '2019-05-31 00:00:00', '项目实践和课程管理');
INSERT INTO `show` VALUES (42, '考评和保障体系', 5, 'http://show-1257444045.cos.ap-shanghai.myqcloud.com/b2f29a46-a749-4e7b-8b76-5e299d08a4d2.html', '2019-05-31 00:00:00', '考评和保障体系');
INSERT INTO `show` VALUES (45, '电子商务专业举办专业发展战略研讨会', 1, 'http://show-1257444045.cos.ap-shanghai.myqcloud.com/fb1cd462-0833-43b4-8a0f-ab2152c6e915.html', '2019-06-03 00:00:00', '专业于4月28日组织召开由西安交通大学李琪教授、厦门大学彭丽芳教授和重庆大学邵兵家教授参加的专业发展战略论坛');
INSERT INTO `show` VALUES (47, '电子商务学子在第九届大学生电子商务“创新、创意及创业”挑战赛江苏赛区选拔赛上斩获佳绩', 1, 'http://show-1257444045.cos.ap-shanghai.myqcloud.com/9a2d0bf9-a4a6-44e1-8145-123e421cb352.html', '2019-06-27 01:04:04', '电子商务与数据科学系学生团队最终取得了1项特等奖、1项二等奖、2项三等奖的优异成绩，在获奖数量和获奖质量上均名列参赛院校前茅。');
INSERT INTO `show` VALUES (48, '管理学院主办第三届江苏省电子商务专业建设研讨会', 1, 'http://show-1257444045.cos.ap-shanghai.myqcloud.com/5992f9d4-ddb7-4f2f-8667-0a98cd19eb35.html', '2019-06-27 01:07:18', '6月15日下午15:00，由管理学院主办的第三届江苏省电子商务专业建设研讨会在徐州中汇国际会议中心顺利召开，来自中国矿业大学、东南大学、江南大学等省内60余所院校的电子商务专家学者参加研讨。');

-- ----------------------------
-- Table structure for slide
-- ----------------------------
DROP TABLE IF EXISTS `slide`;
CREATE TABLE `slide`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '轮播图描述',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图片地址',
  `article_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '对应的文章地址',
  `deleted` int(1) NULL DEFAULT 0 COMMENT '1不可用，0可用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of slide
-- ----------------------------
INSERT INTO `slide` VALUES (1, '三创赛选拔通知', 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/aa32284c-6eac-4154-a4d6-0fe381f16f3c.png', 'http://www.cumtcdio.cn/details.html?showId=20', 0);
INSERT INTO `slide` VALUES (2, '新闻3', 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/cf1ff472-12c2-4f80-9657-9032184f5267.jpg', 'http://www.cumtcdio.cn/details.html?showId=37', 0);
INSERT INTO `slide` VALUES (3, '三创赛', 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/aaae6a71-baa7-4e68-9f5c-811e62646319.jpg', 'http://www.cumtcdio.cn/details.html?showId=22', 0);

-- ----------------------------
-- Table structure for task
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NULL DEFAULT NULL COMMENT '对应课程名称',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务标题',
  `requires` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '要求',
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `grade_sn` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年级',
  `time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '任务发布的时间',
  `dead_line` timestamp(0) NULL DEFAULT NULL COMMENT '任务截止时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk[couse_id]task`(`course_id`) USING BTREE,
  CONSTRAINT `fk[couse_id]task` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task` VALUES (17, 24, '前端界面 - 任务', '截图表示', '前端界面截图', '2016', '2019-07-23 15:58:49', '2019-07-31 20:42:26');
INSERT INTO `task` VALUES (18, 25, '中期检查表', '中期检查', '填写并上传任务指南附件3之“中期检查表”', '2017', '2019-07-25 11:16:35', '2019-08-31 19:30:35');
INSERT INTO `task` VALUES (19, 25, '7月工作日志', '2019年7月工作日志', '填写并上传7月Word版工作日志', '2017', '2019-07-25 11:19:06', '2019-08-31 19:30:43');
INSERT INTO `task` VALUES (20, 25, '8月工作日志', '2019年8月工作日志', '填写并上传8月Word版工作日志', '2017', '2019-07-25 11:20:15', '2019-08-31 19:30:47');

-- ----------------------------
-- Table structure for task_result
-- ----------------------------
DROP TABLE IF EXISTS `task_result`;
CREATE TABLE `task_result`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NULL DEFAULT NULL,
  `status` int(1) NULL DEFAULT 0 COMMENT '任务完成状态',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `score` int(11) NULL DEFAULT NULL,
  `task_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 107 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of task_result
-- ----------------------------
INSERT INTO `task_result` VALUES (45, 18, 0, NULL, NULL, 17);
INSERT INTO `task_result` VALUES (46, 17, 0, NULL, NULL, 17);
INSERT INTO `task_result` VALUES (47, 29, 0, NULL, NULL, 17);
INSERT INTO `task_result` VALUES (48, 13, 0, 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/a1c114a5-4524-4445-b20b-55016caab01b.docx', NULL, 17);
INSERT INTO `task_result` VALUES (49, 14, 0, NULL, NULL, 17);
INSERT INTO `task_result` VALUES (50, 19, 0, NULL, NULL, 17);
INSERT INTO `task_result` VALUES (51, 20, 0, NULL, NULL, 17);
INSERT INTO `task_result` VALUES (52, 15, 0, NULL, NULL, 17);
INSERT INTO `task_result` VALUES (53, 24, 0, NULL, NULL, 17);
INSERT INTO `task_result` VALUES (54, 23, 0, NULL, NULL, 17);
INSERT INTO `task_result` VALUES (55, 12, 0, 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/e1429010-3ccc-43da-a6aa-4f1f26279c21.zip', NULL, 17);
INSERT INTO `task_result` VALUES (56, 22, 0, NULL, NULL, 17);
INSERT INTO `task_result` VALUES (57, 21, 0, NULL, NULL, 17);
INSERT INTO `task_result` VALUES (58, 16, 0, NULL, NULL, 17);
INSERT INTO `task_result` VALUES (59, 35, 0, 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/a24a9fbe-44be-4cae-bf41-eaad97470239.docx', NULL, 18);
INSERT INTO `task_result` VALUES (60, 49, 0, 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/f8487a9b-edda-4cb1-863d-a68fb68317dd.docx', NULL, 18);
INSERT INTO `task_result` VALUES (61, 33, 0, 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/81232bab-e92e-401b-96e2-00e9fbbf0f80.docx', NULL, 18);
INSERT INTO `task_result` VALUES (62, 51, 0, 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/baae8031-b40b-4a8b-8620-2803ef0ba3d9.docx', NULL, 18);
INSERT INTO `task_result` VALUES (63, 112, 0, 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/4b73148c-30b3-471d-a3a8-7205cd31a2ad.docx', NULL, 18);
INSERT INTO `task_result` VALUES (64, 34, 0, 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/1a7e131a-90c8-4c13-b9b8-aa613def4a73.docx', NULL, 18);
INSERT INTO `task_result` VALUES (65, 37, 0, 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/e875ab6b-1b36-4b00-811a-3789f25ee71a.docx', NULL, 18);
INSERT INTO `task_result` VALUES (66, 74, 0, 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/ac8e1d28-004b-4001-a2cc-e6a05fc463e4.docx', NULL, 18);
INSERT INTO `task_result` VALUES (67, 92, 0, 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/732680fc-e306-4926-8650-1a8fce7012f9.docx', NULL, 18);
INSERT INTO `task_result` VALUES (68, 80, 0, 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/48c38059-88f4-4560-8300-0c064103f869.docx', NULL, 18);
INSERT INTO `task_result` VALUES (69, 30, 0, 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/90d65672-f6b5-4a05-8ffe-b9f8b014f6af.docx', NULL, 18);
INSERT INTO `task_result` VALUES (70, 43, 0, 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/ab09c94e-0e83-420d-8a64-bb7ab97bb9b5.docx', NULL, 18);
INSERT INTO `task_result` VALUES (71, 38, 0, 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/e3c2c3c5-69e8-40a2-90f8-e40d34ec2a95.docx', NULL, 18);
INSERT INTO `task_result` VALUES (72, 36, 0, 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/9b944288-3026-49c9-9505-2e1dfa9ca4f9.docx', NULL, 18);
INSERT INTO `task_result` VALUES (73, 50, 0, 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/b7639889-349b-4315-a24f-5d0c041fe629.docx', NULL, 18);
INSERT INTO `task_result` VALUES (74, 48, 0, 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/44b592c3-1cbe-4209-986b-5fce1c953f48.docx', NULL, 18);
INSERT INTO `task_result` VALUES (75, 35, 0, 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/b33f92d3-fd1d-4da5-b756-57bc2e8fd97a.docx', NULL, 19);
INSERT INTO `task_result` VALUES (76, 49, 0, 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/533b5b2e-6c3d-43ef-83dc-d84b6905b9f3.rar', NULL, 19);
INSERT INTO `task_result` VALUES (77, 33, 0, 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/508e35cd-7455-4646-bbde-b310ecc54c0b.docx', NULL, 19);
INSERT INTO `task_result` VALUES (78, 51, 0, 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/afcacf71-883e-4bad-8215-80c5abb4a0e2.docx', NULL, 19);
INSERT INTO `task_result` VALUES (79, 112, 0, 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/332c66d5-7823-44a8-80f3-172bdebc5fa3.docx', NULL, 19);
INSERT INTO `task_result` VALUES (80, 34, 0, NULL, NULL, 19);
INSERT INTO `task_result` VALUES (81, 37, 0, 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/4a9a8397-075d-4721-b81e-b605f4671be8.zip', NULL, 19);
INSERT INTO `task_result` VALUES (82, 74, 0, 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/08b457c8-0bcc-4f99-a137-931a18c79d5a.docx', NULL, 19);
INSERT INTO `task_result` VALUES (83, 92, 0, 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/7fb1686d-7502-42a2-a4b7-1fd7418539bb.doc', NULL, 19);
INSERT INTO `task_result` VALUES (84, 80, 0, 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/4dbb5457-b938-4cde-b0ed-83c7480666ea.docx', NULL, 19);
INSERT INTO `task_result` VALUES (85, 30, 0, NULL, NULL, 19);
INSERT INTO `task_result` VALUES (86, 43, 0, 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/46c94106-f8c8-4dce-bade-a21f927e4844.docx', NULL, 19);
INSERT INTO `task_result` VALUES (87, 38, 0, NULL, NULL, 19);
INSERT INTO `task_result` VALUES (88, 36, 0, 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/14d7d145-f628-42ad-95f0-5612eae7ed51.rar', NULL, 19);
INSERT INTO `task_result` VALUES (89, 50, 0, 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/d0f2ee81-196a-495c-87b2-f1c521160b9f.docx', NULL, 19);
INSERT INTO `task_result` VALUES (90, 48, 0, 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/f2a76ca0-a33d-46cd-b014-8dc5124328d0.zip', NULL, 19);
INSERT INTO `task_result` VALUES (91, 35, 0, NULL, NULL, 20);
INSERT INTO `task_result` VALUES (92, 49, 0, NULL, NULL, 20);
INSERT INTO `task_result` VALUES (93, 33, 0, NULL, NULL, 20);
INSERT INTO `task_result` VALUES (94, 51, 0, NULL, NULL, 20);
INSERT INTO `task_result` VALUES (95, 112, 0, 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/15bfd14f-82b8-4318-bcbf-a43016a0a119.docx', NULL, 20);
INSERT INTO `task_result` VALUES (96, 34, 0, NULL, NULL, 20);
INSERT INTO `task_result` VALUES (97, 37, 0, NULL, NULL, 20);
INSERT INTO `task_result` VALUES (98, 74, 0, NULL, NULL, 20);
INSERT INTO `task_result` VALUES (99, 92, 0, NULL, NULL, 20);
INSERT INTO `task_result` VALUES (100, 80, 0, NULL, NULL, 20);
INSERT INTO `task_result` VALUES (101, 30, 0, NULL, NULL, 20);
INSERT INTO `task_result` VALUES (102, 43, 0, NULL, NULL, 20);
INSERT INTO `task_result` VALUES (103, 38, 0, 'http://slide-1257444045.cos.ap-shanghai.myqcloud.com/c4a31ca5-5093-4fd7-91d2-4a247f69dbf5.docx', NULL, 20);
INSERT INTO `task_result` VALUES (104, 36, 0, NULL, NULL, 20);
INSERT INTO `task_result` VALUES (105, 50, 0, NULL, NULL, 20);
INSERT INTO `task_result` VALUES (106, 48, 0, NULL, NULL, 20);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '学号或者工号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `real_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `group_id` int(11) NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `state` int(4) NULL DEFAULT 1 COMMENT '状态',
  `is_teacher` bit(1) NULL DEFAULT b'0' COMMENT '是否为老师：0不是、1是',
  `qq_number` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'qq号',
  `family_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '家庭住址',
  `wx_number` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '微信号',
  `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk[user]group_id`(`group_id`) USING BTREE,
  INDEX `username`(`username`) USING BTREE,
  CONSTRAINT `fk[user]group_id` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 210 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '$2a$10$HbkjjtxITlKPISIRgdQJPen5uWmr9/svrwam52L.t5yxY1DL732gq', 'ADMIM', NULL, '13212311231', 1, b'0', '243', '4231', '4123', '241@214321');
INSERT INTO `user` VALUES (6, 'showadmin', '$2a$10$7fp4Hp4v.e1tdusE19MBaerFbNdxhmN8J3UlmvIfExftjUIBKAC12', 'show', NULL, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (9, '09163598', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '杨书安', 22, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (10, '09163588', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '宋如意', 21, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (11, '09163584', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '李彩英', 15, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (12, '09163577', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '何梦瑶', 14, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (13, '09163576', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '王钰', 22, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (14, '09163570', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '肖慈斌', 18, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (15, '09163569', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '王强兵', 21, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (16, '09163567', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '徐龙', 20, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (17, '09163563', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '陈志朗', 22, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (18, '09163550', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '张悦倩', 21, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (19, '09163541', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '张斌', 19, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (20, '09163540', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '宗远哲', 16, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (21, '09163539', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '刘伦', 24, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (22, '09163534', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '霍炳桥', 17, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (23, '09163506', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '张楠', 13, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (24, '09163505', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '王则傲', 20, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (25, '09163500', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '李永祺', NULL, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (26, '09163499', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '单晨星', 18, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (27, '09163496', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '王池', 24, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (28, '09163495', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '张巧瑜', 13, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (29, '09163494', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '詹汶燕', NULL, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (30, '09163493', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '姚灏', 15, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (31, '09163491', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '金莉君', 20, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (32, '09163490', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '赵倩倩', 29, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (33, '09133629', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '曹新明', 92, '18852132909', 1, b'0', '1055198268', '松1A4071', 'cxm1055198268', 'cxm1055198268@163.com');
INSERT INTO `user` VALUES (34, '09163769', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '陈长龙', 13, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (35, '09163766', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '陈尧', 23, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (36, '09163765', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '冯潇潇', 12, '13092321001', 1, b'0', '283570872', '山西省高平市', '', '283570872@qq.com');
INSERT INTO `user` VALUES (37, '09163757', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '陈文静', 17, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (38, '09163755', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '虞蕾', 17, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (39, '09163656', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '冯东昆', 12, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (40, '09163655', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '胡志勇', 17, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (41, '09163654', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '孙建权', 29, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (42, '09163652', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '熊枭', 14, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (43, '09163650', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '杨柳风', 14, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (44, '09163649', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '殷增科', 21, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (45, '09163647', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '马鸿飞', 15, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (46, '09163646', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '张璇', 19, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (47, '09163638', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '黄梅英', NULL, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (48, '09163636', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '罗卉卉', 20, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (49, '09163635', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '盛琪', 18, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (50, '09163634', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '徐茂萱', 24, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (51, '09163626', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '施皓铭', 18, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (52, '09163624', '$2a$10$lvEfceO4AfXRgxj3M9sCjevOBGOECoGsgWeaG.dh.4Z.iuW4Rk.5W', '甘郡', 13, '15205208075', 1, b'0', '1531626375', '安徽省太湖县', '', '1531626375@qq.com');
INSERT INTO `user` VALUES (53, '09163621', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '黄志航', 21, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (54, '09163620', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '陈昕', 24, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (55, '09163615', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '冯桑楠', 23, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (56, '09163610', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '苏诗霞', 13, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (57, '09163604', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '赵雪', 16, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (58, '09163602', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '丘启君', 12, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (59, '09163743', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '刘洪辰', 29, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (60, '09163741', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '张荣建', 29, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (61, '09163738', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '陈怡星', 23, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (62, '09163729', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '余玉龙', 19, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (63, '09163727', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '农丽香', 14, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (64, '09163720', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '杨晓', 23, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (65, '09163714', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '王泽昊', NULL, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (66, '09163709', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '琚飞龙', 22, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (67, '09163706', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '黄永峰', 20, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (68, '09163696', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '孙瑞雪', 12, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (69, '09163686', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '陈帆', 12, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (70, '09163685', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '程亮', 23, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (71, '09163684', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '朱建华', 16, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (72, '09163683', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '饶耿', 19, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (73, '09163682', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '郝晨阳', 17, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (74, '09163677', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '吕明坤', 15, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (75, '09163676', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '武力', 18, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (76, '09163669', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '陈舟', 29, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (77, '09163668', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '胡廷', 22, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (78, '05162017', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '王凯', 16, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (79, '05161924', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '武汇文', 15, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (81, '09163509', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '余嘉豪', 30, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (82, '09173163', '$2a$10$UVBJ3One3EWR3WY/0IzMgOR6lqm6cR4mP8eVVyFcw4dpiVUeKHkSa', '朱盛雪', 74, '13013986033', 1, b'0', '1214026613', '竹二', '', '13013986033@163.com');
INSERT INTO `user` VALUES (83, '09173170', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '朱琳', 43, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (84, '09173177', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '薛文龙', 51, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (85, '09173183', '$2a$10$6CVy4AlPCJMyOJ9BF4iHKe/7OXMEkRqY5.CkYn5VDFkbk8erksUfG', '李敏婷', 80, '13828055083', 1, b'0', '2457579818@qq.com', '广东省鹤山市龙口镇金岗圩金富路6-1号', 'Li24579818', '13828055083@163.com');
INSERT INTO `user` VALUES (86, '09173186', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '杨艳茹', NULL, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (87, '09173204', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '梁颖聪', 48, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (88, '09173218', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '陈雨杰', 112, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (89, '09173219', '$2a$10$CoP9Hm6CRim0crn1zctPXeCUaSLS5/JIc1.up4G7Nt44/gxJQUXbq', '周月霞', 92, '15605203569', 1, b'0', '2532759512', '中国矿业大学', '', '2532759512@qq.com');
INSERT INTO `user` VALUES (90, '09173226', '$2a$10$ccgD/6CLtxXSC2ouwy9bXO9sFbY.NeqfHOki3v5vI.Rjr5pr0zYUm', '刘洁', 38, '13685105796', 1, b'0', '1084150809', '江苏省徐州市', '', '1084150809@qq.com');
INSERT INTO `user` VALUES (91, '09173227', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '李相锈', 35, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (92, '09173230', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '武祎洁', 92, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (93, '09173231', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '辛鑫', 36, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (94, '09173235', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '杨超', 48, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (95, '09173239', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '冀振杰', 50, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (96, '09173243', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '李仁常', 33, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (97, '09173251', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '朱钰', 30, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (98, '09173252', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '朱雨倩', 49, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (99, '09173256', '$2a$10$Xo36iEGgM6onuYcsRh9Eyedhve1jxN49vzGwyV7v17QN46uETBMpO', '王焕力', 34, '15695259123', 1, b'0', '1647677710', '竹二A2152', 'whl19990913whl', '1647677710@qq.com');
INSERT INTO `user` VALUES (100, '09173260', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '陈默妍', 74, '15695169179', 1, b'0', '863370526', '竹二', '', '863370526@qq.com');
INSERT INTO `user` VALUES (101, '09173264', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '马丹', 37, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (102, '09173266', '$2a$10$opRijeZ5pbcukOHvhfAUDu5csLQsgeirPnWR3/kimM7c8cwVxISFu', '唐灏文', 38, '13536664092', 1, b'0', '864756787', '佛三三水', 'tang13674056565', '864756787@qq.com');
INSERT INTO `user` VALUES (103, '09173268', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '卢大佐', 34, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (104, '09173272', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '任祥', 50, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (105, '09173273', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '冯朝阳', 33, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (106, '09173277', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '杨桂玲', 36, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (107, NULL, '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '李炳灿', NULL, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (108, '09173278', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '班钰瑶', 74, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (109, '09173286', '$2a$10$ttI8fs76/GcNGLnISmn89ec5ntbv1VHzF/RBMGfDqbytRrLJBdYoy', '李欣咏', 92, '18354156070', 1, b'0', '852542352', '山东省济南市历城区郭店街道', '18354156070', '852542352@qq.com');
INSERT INTO `user` VALUES (110, '09173287', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '李晓莹', 33, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (111, '09173291', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '古丽尼哥尔', 49, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (112, '09173297', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '黄锦涛', 51, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (113, '09173305', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '兰天', 37, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (114, '09173306', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '李树林', 33, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (115, '09173314', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '俞笑婷', 74, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (116, '09173316', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '王敏瑶', 43, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (117, '09173318', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '张萌', 51, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (118, '09173320', '$2a$10$Kk.KLxiBTf6EF7Ou37qULeCo3fkBFDPBy89/nrn12LBKLonFAEgCW', '王楠', 36, '17851143136', 1, b'0', '862350856', '中国矿业大学南湖校区竹苑二号楼A3012', 'wxid_yma3mkbnoeh822', '862350856@qq.com');
INSERT INTO `user` VALUES (119, '09173321', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '马敏', 37, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (120, '09173322', '$2a$10$AU46IXMAenTUawMBapMmFeSyNr2PE//aeXs4OFWQbL9oIh9JUNuVe', '刘佳', 80, '17851141580', 1, b'0', '1360798544', '中国矿业大学南湖校区竹二A3012', '', '1360798544@qq.com');
INSERT INTO `user` VALUES (121, '09173329', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '杨晨旭', 80, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (122, '09173330', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '杨拯', 37, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (123, '09173337', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '高山福', 30, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (124, '09173341', '$2a$10$ihKaEvyBymHzo4rG07fV.OeUjvKLvQrlEs7/wGQa3g0/m4NGYgB/.', '季璇', 80, '13003529522', 1, b'0', '1013330945', '江苏省淮安市淮安区', 'onepigoba', '1013330945@qq.com');
INSERT INTO `user` VALUES (125, '09173343', '$2a$10$yCqf92Exe75mM4OJj4PzqOSLQqGF1AFPvnsjBxhHSE1TBT.QQGSYa', '俞婷', 38, '15162127939', 1, b'0', '925898044', '浙江省杭州市萧山区', 'Aurora15267055395', '925898044@qq.com');
INSERT INTO `user` VALUES (126, '09173360', '$2a$10$GBfcnZSsRwJvwzOh8z926uYv9ihOFBL2ycRbReYsnjG3Ivp/CcThS', '郑梓亮', 49, '17851147791', 1, b'0', '979839525', '中国矿业大学南湖校区松一B3071', '979839525', '979839525@qq.comqq.com');
INSERT INTO `user` VALUES (127, '09173361', '$2a$10$OqSd45.3ZFhsjX112nrzm.gauFd5TGo5JxClte9kG9lfWGkKQQ6si', '高林榕欣', 43, '15695253978', 1, b'0', '1021806835', '中国矿业大学南湖校区', '', '1021806835@qq.com');
INSERT INTO `user` VALUES (128, '09173366', '$2a$10$POW9cqmmimryLpUl3SImd.F5At4CwzTo1gEU7CWfOQ04l0IK8VSR2', '王秀宇', 48, '15105202038', 1, b'0', '946917651', '松一B3071', 'wxy999946917651', '946917651@qq.com');
INSERT INTO `user` VALUES (129, '09173367', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '刘孝晨', 51, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (130, '09173371', '$2a$10$MqA6epV/ZZhc/ynoarHltu5nqVZ9aCXFUsbkW0rlTus3.5DpZDuqy', '陆嘉倩', 49, '15605200955', 1, b'0', '347059205', '徐州市中国矿业大学', '15605200955', '347059205@qq.com');
INSERT INTO `user` VALUES (131, '09173372', '$2a$10$DTnA1m.yl3jzpcnnMeCc9uSCoZE6z.m76Lqjf7ww3I9l07QHnnHoW', '陆颖', 112, '15605207529', 1, b'0', '1607334193', '中国矿业大学南湖校区', 'LY22CX', '1607334193@qq.com');
INSERT INTO `user` VALUES (132, '09173380', '$2a$10$bRCilmoCWOXwJSGmoIQHPOc0HryqWY1tXX9sEXqiup50XVfSXFs7e', '陈肖', 34, '13852096872', 1, b'0', '736101311', '竹二A3032', '', '736101311@qq.com');
INSERT INTO `user` VALUES (133, '09173381', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '尉梦佳', 112, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (134, '09173382', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '褚秦玥', 43, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (135, '09173384', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '刘颖', 37, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (136, '09173390', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '赵欣', 92, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (137, '09173391', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '刘程辉', 48, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (138, '09173393', '$2a$10$rLscXq8tSVcmjfDD94EtpePvskr3yMT1n4y3l9SjA5H0RLh4rSouu', '曾梦琪', 49, '18473477925', 1, b'0', '2099033419@qq.com', '湖南省衡阳市衡阳县金兰镇向阳街111号', 'zmq18473477925', '2099033419@qq.com');
INSERT INTO `user` VALUES (139, '09173398', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '张强', 112, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (140, '09173399', '$2a$10$/TSg8Ix4civRnOeiMojfdeZBDrHYExaIhg4b6YZINXDNzLy1DacAq', '叶家鹏', 35, '15605226337', 1, b'0', '1102725724', '四川省邛崃市桑园镇中田村20组32号', 'yjp18181921638', '1102725724@qq.com');
INSERT INTO `user` VALUES (141, '09173400', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '王佳文', 50, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (142, '09173402', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '汤童馨', 36, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (143, '09173407', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '荣恩萍', 38, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (144, '09173422', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '巫杰', NULL, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (145, '09173428', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '李志磊', 30, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (146, '09173438', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '农雨婷', 80, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (147, '09173471', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '黄苧瑨', 34, '15695160928', 1, b'0', '573048230', '竹二A3042', 'Huangnj818', '573048230@qq.com');
INSERT INTO `user` VALUES (148, '09173475', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '王然', 51, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (149, '09173478', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '张诗琪', 38, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (150, '09173486', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '吴维', 35, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (151, '09173499', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '薛雅芝', 43, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (152, '09173500', '$2a$10$qDewtzDMqGQuZQ1CEAMISugajrwdaIl7jFjzbv.Bx/JqlGZBRcD/G', '胡思思', 34, '15695256906', 1, b'0', '774675990', '竹二A3121', '', '774675990@qq.com');
INSERT INTO `user` VALUES (153, '09173505', '$2a$10$NK5g6/zHYRu1bHjvSJtGOuTw42yhYs2XgQ94cjqjgYFkJMAvOLc/S', '陈莉', 36, '17851146034', 1, b'0', '2656057012@qq.com', '安徽省六安市金安区东三十铺东都一号', '13731975541', '2656057012@qq.com');
INSERT INTO `user` VALUES (154, '09173507', '$2a$10$5hpliapNRW76tfk21WmkNuO3rdilPkhQz5beTETtMBwvqwiSKVgHm', '林心茹', 48, '17851143896', 1, b'0', '479890516', '竹2A3121', 'lxr479890516', '479890516@qq.com');
INSERT INTO `user` VALUES (155, '09173511', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '杨洁', 35, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (156, '09173512', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '史勇轩', 30, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (157, '09173516', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '邝琪辉', 35, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (158, '09173518', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '段本乐', 33, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (159, '09173567', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '马浩', 50, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (160, '1409', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '王贺朝', NULL, NULL, 1, b'1', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (161, '3559', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '李新春', NULL, NULL, 1, b'1', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (162, '3512', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '王星', NULL, NULL, 1, b'1', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (163, '5851', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '刘全龙', NULL, NULL, 1, b'1', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (164, '5329', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '陈克贵', NULL, NULL, 1, b'1', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (165, '4396', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '胡霞', NULL, NULL, 1, b'1', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (166, '0316', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '冯文龙', NULL, NULL, 1, b'1', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (167, '4571', '$2a$10$i9IKxSstVgIIzsBHQy4ZeOjfRE4MoAW84Pyqz0/Oe/EZSP1ar2/uW', '张召浦', NULL, '18626026751', 1, b'1', '2785321', '中国矿业大学管理学院', '', 'curryfatty@gmail.com');
INSERT INTO `user` VALUES (168, '4190', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '孟现飞', NULL, NULL, 1, b'1', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (169, '1081', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '聂锐', NULL, NULL, 1, b'1', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (170, '4392', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '贺超', NULL, NULL, 1, b'1', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (171, '1824', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '杨彤', NULL, NULL, 1, b'1', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (172, '4397', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '叶新凤', NULL, NULL, 1, b'1', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (173, '1431', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '王建军', NULL, NULL, 1, b'1', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (174, '0285', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '樊世清', NULL, NULL, 1, b'1', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (175, '3899', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '冯春花', NULL, NULL, 1, b'1', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (176, '4047', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '肖开锋', NULL, NULL, 1, b'1', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (177, '3510', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '王辉', NULL, NULL, 1, b'1', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (178, '4761', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '刘玥', NULL, NULL, 1, b'1', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (179, '4276', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '王德鲁', NULL, NULL, 1, b'1', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (180, '3644', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '曹庆仁', NULL, NULL, 1, b'1', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (181, '4569', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '杨明智', NULL, NULL, 1, b'1', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (182, '4784', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '张磊', NULL, NULL, 1, b'1', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (183, '4384', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '张卫华', NULL, NULL, 1, b'1', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (208, '09153612', '$2a$10$iWKsZgT2..sfgim45FFDDO7cggXYhdFb9E8opaTHqknzSyF7K/xwS', '杨彬', NULL, NULL, 1, b'0', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (209, '16174797', '$2a$10$fMAcRdfNHvDMLw0ayttgl.FW6qglFSud/la026/6tg99.ght8tXw.', '李炳灿', 112, '13063510255', 1, b'0', '', '中国矿业大学', 'LBC651709268', '651709268@qq.com');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (1, 1);
INSERT INTO `user_role` VALUES (6, 4);
INSERT INTO `user_role` VALUES (9, 2);
INSERT INTO `user_role` VALUES (10, 2);
INSERT INTO `user_role` VALUES (11, 2);
INSERT INTO `user_role` VALUES (12, 2);
INSERT INTO `user_role` VALUES (13, 2);
INSERT INTO `user_role` VALUES (14, 2);
INSERT INTO `user_role` VALUES (15, 2);
INSERT INTO `user_role` VALUES (16, 2);
INSERT INTO `user_role` VALUES (17, 2);
INSERT INTO `user_role` VALUES (18, 2);
INSERT INTO `user_role` VALUES (19, 2);
INSERT INTO `user_role` VALUES (20, 2);
INSERT INTO `user_role` VALUES (21, 2);
INSERT INTO `user_role` VALUES (22, 2);
INSERT INTO `user_role` VALUES (23, 2);
INSERT INTO `user_role` VALUES (24, 2);
INSERT INTO `user_role` VALUES (25, 2);
INSERT INTO `user_role` VALUES (26, 2);
INSERT INTO `user_role` VALUES (27, 2);
INSERT INTO `user_role` VALUES (28, 2);
INSERT INTO `user_role` VALUES (29, 2);
INSERT INTO `user_role` VALUES (30, 2);
INSERT INTO `user_role` VALUES (31, 2);
INSERT INTO `user_role` VALUES (32, 2);
INSERT INTO `user_role` VALUES (33, 2);
INSERT INTO `user_role` VALUES (34, 2);
INSERT INTO `user_role` VALUES (35, 2);
INSERT INTO `user_role` VALUES (36, 2);
INSERT INTO `user_role` VALUES (37, 2);
INSERT INTO `user_role` VALUES (38, 2);
INSERT INTO `user_role` VALUES (39, 2);
INSERT INTO `user_role` VALUES (40, 2);
INSERT INTO `user_role` VALUES (41, 2);
INSERT INTO `user_role` VALUES (42, 2);
INSERT INTO `user_role` VALUES (43, 2);
INSERT INTO `user_role` VALUES (44, 2);
INSERT INTO `user_role` VALUES (45, 2);
INSERT INTO `user_role` VALUES (46, 2);
INSERT INTO `user_role` VALUES (47, 2);
INSERT INTO `user_role` VALUES (48, 2);
INSERT INTO `user_role` VALUES (49, 2);
INSERT INTO `user_role` VALUES (50, 2);
INSERT INTO `user_role` VALUES (51, 2);
INSERT INTO `user_role` VALUES (52, 2);
INSERT INTO `user_role` VALUES (53, 2);
INSERT INTO `user_role` VALUES (54, 2);
INSERT INTO `user_role` VALUES (55, 2);
INSERT INTO `user_role` VALUES (56, 2);
INSERT INTO `user_role` VALUES (57, 2);
INSERT INTO `user_role` VALUES (58, 2);
INSERT INTO `user_role` VALUES (59, 2);
INSERT INTO `user_role` VALUES (60, 2);
INSERT INTO `user_role` VALUES (61, 2);
INSERT INTO `user_role` VALUES (62, 2);
INSERT INTO `user_role` VALUES (63, 2);
INSERT INTO `user_role` VALUES (64, 2);
INSERT INTO `user_role` VALUES (65, 2);
INSERT INTO `user_role` VALUES (66, 2);
INSERT INTO `user_role` VALUES (67, 2);
INSERT INTO `user_role` VALUES (68, 2);
INSERT INTO `user_role` VALUES (69, 2);
INSERT INTO `user_role` VALUES (70, 2);
INSERT INTO `user_role` VALUES (71, 2);
INSERT INTO `user_role` VALUES (72, 2);
INSERT INTO `user_role` VALUES (73, 2);
INSERT INTO `user_role` VALUES (74, 2);
INSERT INTO `user_role` VALUES (75, 2);
INSERT INTO `user_role` VALUES (76, 2);
INSERT INTO `user_role` VALUES (77, 2);
INSERT INTO `user_role` VALUES (78, 2);
INSERT INTO `user_role` VALUES (79, 2);
INSERT INTO `user_role` VALUES (81, 2);
INSERT INTO `user_role` VALUES (82, 2);
INSERT INTO `user_role` VALUES (83, 2);
INSERT INTO `user_role` VALUES (84, 2);
INSERT INTO `user_role` VALUES (85, 2);
INSERT INTO `user_role` VALUES (86, 2);
INSERT INTO `user_role` VALUES (87, 2);
INSERT INTO `user_role` VALUES (88, 2);
INSERT INTO `user_role` VALUES (89, 2);
INSERT INTO `user_role` VALUES (90, 2);
INSERT INTO `user_role` VALUES (91, 2);
INSERT INTO `user_role` VALUES (92, 2);
INSERT INTO `user_role` VALUES (93, 2);
INSERT INTO `user_role` VALUES (94, 2);
INSERT INTO `user_role` VALUES (95, 2);
INSERT INTO `user_role` VALUES (96, 2);
INSERT INTO `user_role` VALUES (97, 2);
INSERT INTO `user_role` VALUES (98, 2);
INSERT INTO `user_role` VALUES (99, 2);
INSERT INTO `user_role` VALUES (100, 2);
INSERT INTO `user_role` VALUES (101, 2);
INSERT INTO `user_role` VALUES (102, 2);
INSERT INTO `user_role` VALUES (103, 2);
INSERT INTO `user_role` VALUES (104, 2);
INSERT INTO `user_role` VALUES (105, 2);
INSERT INTO `user_role` VALUES (106, 2);
INSERT INTO `user_role` VALUES (107, 2);
INSERT INTO `user_role` VALUES (108, 2);
INSERT INTO `user_role` VALUES (109, 2);
INSERT INTO `user_role` VALUES (110, 2);
INSERT INTO `user_role` VALUES (111, 2);
INSERT INTO `user_role` VALUES (112, 2);
INSERT INTO `user_role` VALUES (113, 2);
INSERT INTO `user_role` VALUES (114, 2);
INSERT INTO `user_role` VALUES (115, 2);
INSERT INTO `user_role` VALUES (116, 2);
INSERT INTO `user_role` VALUES (117, 2);
INSERT INTO `user_role` VALUES (118, 2);
INSERT INTO `user_role` VALUES (119, 2);
INSERT INTO `user_role` VALUES (120, 2);
INSERT INTO `user_role` VALUES (121, 2);
INSERT INTO `user_role` VALUES (122, 2);
INSERT INTO `user_role` VALUES (123, 2);
INSERT INTO `user_role` VALUES (124, 2);
INSERT INTO `user_role` VALUES (125, 2);
INSERT INTO `user_role` VALUES (126, 2);
INSERT INTO `user_role` VALUES (127, 2);
INSERT INTO `user_role` VALUES (128, 2);
INSERT INTO `user_role` VALUES (129, 2);
INSERT INTO `user_role` VALUES (130, 2);
INSERT INTO `user_role` VALUES (131, 2);
INSERT INTO `user_role` VALUES (132, 2);
INSERT INTO `user_role` VALUES (133, 2);
INSERT INTO `user_role` VALUES (134, 2);
INSERT INTO `user_role` VALUES (135, 2);
INSERT INTO `user_role` VALUES (136, 2);
INSERT INTO `user_role` VALUES (137, 2);
INSERT INTO `user_role` VALUES (138, 2);
INSERT INTO `user_role` VALUES (139, 2);
INSERT INTO `user_role` VALUES (140, 2);
INSERT INTO `user_role` VALUES (141, 2);
INSERT INTO `user_role` VALUES (142, 2);
INSERT INTO `user_role` VALUES (143, 2);
INSERT INTO `user_role` VALUES (144, 2);
INSERT INTO `user_role` VALUES (145, 2);
INSERT INTO `user_role` VALUES (146, 2);
INSERT INTO `user_role` VALUES (147, 2);
INSERT INTO `user_role` VALUES (148, 2);
INSERT INTO `user_role` VALUES (149, 2);
INSERT INTO `user_role` VALUES (150, 2);
INSERT INTO `user_role` VALUES (151, 2);
INSERT INTO `user_role` VALUES (152, 2);
INSERT INTO `user_role` VALUES (153, 2);
INSERT INTO `user_role` VALUES (154, 2);
INSERT INTO `user_role` VALUES (155, 2);
INSERT INTO `user_role` VALUES (156, 2);
INSERT INTO `user_role` VALUES (157, 2);
INSERT INTO `user_role` VALUES (158, 2);
INSERT INTO `user_role` VALUES (159, 2);
INSERT INTO `user_role` VALUES (160, 3);
INSERT INTO `user_role` VALUES (161, 3);
INSERT INTO `user_role` VALUES (162, 3);
INSERT INTO `user_role` VALUES (163, 3);
INSERT INTO `user_role` VALUES (164, 3);
INSERT INTO `user_role` VALUES (165, 3);
INSERT INTO `user_role` VALUES (166, 3);
INSERT INTO `user_role` VALUES (167, 3);
INSERT INTO `user_role` VALUES (168, 3);
INSERT INTO `user_role` VALUES (169, 3);
INSERT INTO `user_role` VALUES (170, 3);
INSERT INTO `user_role` VALUES (171, 3);
INSERT INTO `user_role` VALUES (172, 3);
INSERT INTO `user_role` VALUES (173, 3);
INSERT INTO `user_role` VALUES (174, 3);
INSERT INTO `user_role` VALUES (175, 3);
INSERT INTO `user_role` VALUES (176, 3);
INSERT INTO `user_role` VALUES (177, 3);
INSERT INTO `user_role` VALUES (178, 3);
INSERT INTO `user_role` VALUES (179, 3);
INSERT INTO `user_role` VALUES (180, 3);
INSERT INTO `user_role` VALUES (181, 3);
INSERT INTO `user_role` VALUES (182, 3);
INSERT INTO `user_role` VALUES (183, 3);
INSERT INTO `user_role` VALUES (208, 2);
INSERT INTO `user_role` VALUES (209, 2);

SET FOREIGN_KEY_CHECKS = 1;
