/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : localhost:3306
 Source Schema         : exam

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 20/08/2020 10:39:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tp_class
-- ----------------------------
DROP TABLE IF EXISTS `tp_class`;
CREATE TABLE `tp_class`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `className` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '班级名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tp_class
-- ----------------------------
INSERT INTO `tp_class` VALUES (1, '18计网一班');
INSERT INTO `tp_class` VALUES (7, '17计网一班');
INSERT INTO `tp_class` VALUES (8, '16计网一班');
INSERT INTO `tp_class` VALUES (15, '18计网二班');
INSERT INTO `tp_class` VALUES (16, '18计网三班');
INSERT INTO `tp_class` VALUES (17, '18计网四班');
INSERT INTO `tp_class` VALUES (18, '17计网s班');
INSERT INTO `tp_class` VALUES (19, '17计网四班');
INSERT INTO `tp_class` VALUES (21, '18计网五班');

-- ----------------------------
-- Table structure for tp_course
-- ----------------------------
DROP TABLE IF EXISTS `tp_course`;
CREATE TABLE `tp_course`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `courseName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '科目名称',
  `belongTeacherId` tinyint UNSIGNED NULL DEFAULT 0 COMMENT '所属老师',
  `belongClassId` tinyint NULL DEFAULT NULL COMMENT '所在班级',
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tp_course
-- ----------------------------
INSERT INTO `tp_course` VALUES (3, '软件工程', 10, 1, '/static/home/images/courseLogo/1597643178.jpg');
INSERT INTO `tp_course` VALUES (4, 'PHP动态网页设计', 11, 1, '/static/home/images/courseLogo/1597643321.jpg');
INSERT INTO `tp_course` VALUES (5, '手机APP开发', 12, 1, '/static/home/images/courseLogo/1597643620.jpg');
INSERT INTO `tp_course` VALUES (6, '智能园区系统集成', 13, 1, '/static/home/images/courseLogo/1597643750.jpg');

-- ----------------------------
-- Table structure for tp_course_paper
-- ----------------------------
DROP TABLE IF EXISTS `tp_course_paper`;
CREATE TABLE `tp_course_paper`  (
  `courseId` int NOT NULL COMMENT '科目表的id',
  `paperId` int NOT NULL COMMENT '试卷的id',
  PRIMARY KEY (`courseId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tp_course_paper
-- ----------------------------

-- ----------------------------
-- Table structure for tp_grade
-- ----------------------------
DROP TABLE IF EXISTS `tp_grade`;
CREATE TABLE `tp_grade`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `studentId` int NOT NULL COMMENT '所属学生',
  `singleScore` int NOT NULL COMMENT '单选题分数',
  `multipleScore` int NOT NULL COMMENT '多选题分数',
  `judgmentScore` int NOT NULL COMMENT '判断题分数',
  `questionErr` int NULL DEFAULT 0 COMMENT '错题数量',
  `totalTime` int NOT NULL COMMENT '总用时间',
  `totalScore` int NOT NULL COMMENT '总分数',
  `belongPaperId` int NOT NULL COMMENT '所属试卷',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 72 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '成绩单\r\n' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tp_grade
-- ----------------------------
INSERT INTO `tp_grade` VALUES (67, 184020110, 40, 36, 20, 0, 46, 96, 22);
INSERT INTO `tp_grade` VALUES (68, 184020110, 10, 5, 9, 0, 1, 24, 22);
INSERT INTO `tp_grade` VALUES (69, 184020110, 10, 5, 9, 0, 1, 24, 22);
INSERT INTO `tp_grade` VALUES (70, 184020110, 10, 5, 9, 0, 1, 24, 22);
INSERT INTO `tp_grade` VALUES (71, 184020110, 0, 0, 1, 0, 1, 1, 22);
INSERT INTO `tp_grade` VALUES (72, 184020116, 30, 20, 30, 0, 5, 100, 23);

-- ----------------------------
-- Table structure for tp_judgment
-- ----------------------------
DROP TABLE IF EXISTS `tp_judgment`;
CREATE TABLE `tp_judgment`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '题目',
  `optionTrue` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '正确的选项',
  `score` int NOT NULL COMMENT '题目的分数',
  `belongPaperId` int NOT NULL COMMENT '试卷的id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 76 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tp_judgment
-- ----------------------------
INSERT INTO `tp_judgment` VALUES (1, '开发软件就是编写程序。', 'false', 1, 22);
INSERT INTO `tp_judgment` VALUES (2, '系统测试的主要方法是白盒法，主要进行功能测试、性能测试、安全性测试及可靠性等 测试。', 'false', 1, 22);
INSERT INTO `tp_judgment` VALUES (3, '编程序时应尽可能利用硬件特点以提高程序效率.', 'false', 1, 22);
INSERT INTO `tp_judgment` VALUES (4, '软件需求分析的任务是建立软件模块结构图。 ', 'false', 1, 22);
INSERT INTO `tp_judgment` VALUES (5, '尽可能使用高级语言编写程序', 'true', 1, 22);
INSERT INTO `tp_judgment` VALUES (6, '以结构化分析方法建立的系统模型就是数据流图。', 'false', 1, 22);
INSERT INTO `tp_judgment` VALUES (7, '进行总体设计时加强模块间的联系。', 'false', 1, 22);
INSERT INTO `tp_judgment` VALUES (8, '编码时尽量多用全局变量。', 'false', 1, 22);
INSERT INTO `tp_judgment` VALUES (9, '用CASE环境或程序自动生成工具来自动生成一部分程序。', 'true', 1, 22);
INSERT INTO `tp_judgment` VALUES (10, '软件测试是要发现软件中的所有错误。', 'false', 1, 22);
INSERT INTO `tp_judgment` VALUES (11, 'Warnier方法也是一种面向数据结构的设计方法,其逻辑更严格.()', 'false', 1, 22);
INSERT INTO `tp_judgment` VALUES (12, 'PAD图在设置了五种基本控制结构后,还允许递归调用. () ', 'false', 1, 22);
INSERT INTO `tp_judgment` VALUES (13, '为了加快软件维护作业的进度,应尽可能增加维护人员的数目.() ', 'false', 1, 22);
INSERT INTO `tp_judgment` VALUES (14, '为了加快软件维护作业的进度,应尽可能增加维护人员的数目.() ', 'false', 1, 22);
INSERT INTO `tp_judgment` VALUES (15, '完成测试作业后,为了缩短源程序的长度应删除程序中的注解.()', 'false', 1, 22);
INSERT INTO `tp_judgment` VALUES (16, '系统结构图是精确表达程序结构的图形表示法.因此,有时也可以将系统结构图当作系统流程图使用.()', 'false', 1, 22);
INSERT INTO `tp_judgment` VALUES (17, '在程序调试时,找出错误的位置和性质比改正该错误更难.()', 'true', 1, 22);
INSERT INTO `tp_judgment` VALUES (18, '以对象,类,继承和通信为基础的面向对象设计方法(OOD)也是常见的软件概要设计方法之一.()', 'true', 1, 22);
INSERT INTO `tp_judgment` VALUES (19, '软件系统中所有的信息流都可以认为是事务流', 'false', 1, 22);
INSERT INTO `tp_judgment` VALUES (20, '软件系统中所有的信息流都可以认为是变换流', 'false', 1, 22);
INSERT INTO `tp_judgment` VALUES (21, '事务分析和变换分析的设计步骤是基本相似的', 'false', 1, 22);
INSERT INTO `tp_judgment` VALUES (22, '因计算机硬件和软件环境的变化而作出的修改软件的过程称为因计算机硬件和软件环境的变化而作出的修改软件的过程称为完善性维护（）', 'true', 1, 22);
INSERT INTO `tp_judgment` VALUES (23, '为了提高软件的可维护性，在编码阶段应注意养成好的程序设计风格', 'true', 1, 22);
INSERT INTO `tp_judgment` VALUES (24, '软件详细设计的主要任务是确定每个模块的功能', 'false', 1, 22);
INSERT INTO `tp_judgment` VALUES (25, '对象实现了数据和操作的结合，使数据和操作封装于对象的统一体中。()', 'true', 1, 22);
INSERT INTO `tp_judgment` VALUES (26, '为了提高软件的可维护性，在编码阶段应注意文档的副作用', 'false', 1, 22);
INSERT INTO `tp_judgment` VALUES (27, '软件详细设计的主要任务是确定每个模块的编程', 'false', 1, 22);
INSERT INTO `tp_judgment` VALUES (28, 'Jackson图中，模块框之间若有直线连接，表示它们之间存在链接关系', 'false', 1, 22);
INSERT INTO `tp_judgment` VALUES (29, ' 需求分析最终结果是产生需求规格说明书', 'true', 1, 22);
INSERT INTO `tp_judgment` VALUES (30, '软件测试的目的是发现软件的错误', 'true', 1, 22);
INSERT INTO `tp_judgment` VALUES (31, '当使用 POST 方法时，变量显示在 URL 中。（    ）', 'false', 1, 23);
INSERT INTO `tp_judgment` VALUES (32, '在 PHP 中，既可以使用单引号 ( \' \' ) 也可以使用双引号 ( \" \" )来包围字符串。（    ）', 'true', 1, 23);
INSERT INTO `tp_judgment` VALUES (33, '包含文件必须使用文件后缀 \".inc\"。（    ）', 'false', 1, 23);
INSERT INTO `tp_judgment` VALUES (34, 'PHP 允许我们直接通过脚本来发送电子邮件？（    ）', 'true', 1, 23);
INSERT INTO `tp_judgment` VALUES (35, 'PHP 可以在 Microsoft Windows IIS (Internet Information Server) 上运行？（    ）', 'true', 1, 23);
INSERT INTO `tp_judgment` VALUES (36, '在 PHP 5 中，在默认情况下 mysql 支持是启用的？（    ）', 'false', 1, 23);
INSERT INTO `tp_judgment` VALUES (37, 'PHP 指的是Personal Hypertext Processor？（    ）', 'true', 1, 23);
INSERT INTO `tp_judgment` VALUES (38, '在 PHP 中，添加注释的正确方法是/*…*/ ？（    ）', 'true', 1, 23);
INSERT INTO `tp_judgment` VALUES (39, 'PHP 服务器脚本由<script>...</script> 分隔符包围？（    ）', 'false', 1, 23);
INSERT INTO `tp_judgment` VALUES (40, 'PHP 服务器脚本由<?php…?> 分隔符包围？（    ）', 'true', 1, 23);
INSERT INTO `tp_judgment` VALUES (41, 'PHP 服务器脚本由<&>...</&>分隔符包围？（    ）', 'false', 1, 23);
INSERT INTO `tp_judgment` VALUES (42, '给 $count 变量加 1 的正确方法是++count？（    ）', 'false', 1, 23);
INSERT INTO `tp_judgment` VALUES (43, '给 $count 变量加 1 的正确方法是$count++; ？（    ）', 'true', 1, 23);
INSERT INTO `tp_judgment` VALUES (44, '给 $count 变量加 1 的正确方法是$count =+1 ？（    ）', 'false', 1, 23);
INSERT INTO `tp_judgment` VALUES (45, 'PHP 指的是Personal Home Page ？（    ）', 'false', 1, 23);
INSERT INTO `tp_judgment` VALUES (46, 'select---用来查看数据（    ）', 'true', 1, 23);
INSERT INTO `tp_judgment` VALUES (47, 'delete---用来添加数据（    ）', 'false', 1, 23);
INSERT INTO `tp_judgment` VALUES (48, 'update---用来删除数据（    ）', 'false', 1, 23);
INSERT INTO `tp_judgment` VALUES (49, 'insert---用来修改数据（    ）', 'false', 1, 23);
INSERT INTO `tp_judgment` VALUES (50, 'mysql中的groupby语句的功能是分组？（    ）', 'true', 1, 23);
INSERT INTO `tp_judgment` VALUES (51, 'mysql中的groupby语句的功能是模糊查询？（    ）', 'false', 1, 23);
INSERT INTO `tp_judgment` VALUES (52, '判断某类中是否存在指定的方法应该选择interface_exists函数?（    ）', 'false', 1, 23);
INSERT INTO `tp_judgment` VALUES (53, '判断某类中是否存在指定的方法应该选择method_exists函数?（    ）', 'true', 1, 23);
INSERT INTO `tp_judgment` VALUES (54, '判断某类中是否存在指定的方法应该选择class_exists函数?（    ）', 'false', 1, 23);
INSERT INTO `tp_judgment` VALUES (55, 'Cookie是PHP的会话控制技术?（    ）', 'false', 1, 23);
INSERT INTO `tp_judgment` VALUES (56, 'Session是PHP的会话控制技术?（    ）', 'true', 1, 23);
INSERT INTO `tp_judgment` VALUES (57, 'PHP字符串连接运算符是 . ?（    ）', 'true', 1, 23);
INSERT INTO `tp_judgment` VALUES (58, 'PHP字符串连接运算符是# ?（    ）', 'false', 1, 23);
INSERT INTO `tp_judgment` VALUES (59, 'PHP字符串连接运算符是* ?（    ）', 'false', 1, 23);
INSERT INTO `tp_judgment` VALUES (60, 'or是正确的逻辑或运算符号?（    ）', 'true', 1, 23);
INSERT INTO `tp_judgment` VALUES (61, 'of是正确的逻辑或运算符号?（    ）', 'false', 1, 23);
INSERT INTO `tp_judgment` VALUES (62, 'dw是正确的逻辑或运算符号?（    ）', 'false', 1, 23);
INSERT INTO `tp_judgment` VALUES (63, 'ok是正确的逻辑或运算符号?（    ）', 'false', 1, 23);
INSERT INTO `tp_judgment` VALUES (64, 'dp是正确的逻辑或运算符号?（    ）', 'false', 1, 23);
INSERT INTO `tp_judgment` VALUES (65, 'wo是正确的逻辑或运算符号?（    ）', 'false', 1, 23);
INSERT INTO `tp_judgment` VALUES (66, '字符串定界符用<<<符号表示？（    ）', 'true', 1, 23);
INSERT INTO `tp_judgment` VALUES (67, '字符串定界符用<<符号表示？（    ）', 'false', 1, 23);
INSERT INTO `tp_judgment` VALUES (68, '字符串定界符用<符号表示？（    ）', 'false', 1, 23);
INSERT INTO `tp_judgment` VALUES (69, 'php中readfile()函数用于读取整个文件?（    ）', 'true', 1, 23);
INSERT INTO `tp_judgment` VALUES (70, 'php中fread()函数用于读取整个文件?（    ）', 'false', 1, 23);
INSERT INTO `tp_judgment` VALUES (76, 'equals()和equalsIgnoreCase()的作用完全一样', 'false', 1, 38);
INSERT INTO `tp_judgment` VALUES (77, 'StringTokenizer用于把字符数组分解成可独立使用的单词', 'true', 1, 38);
INSERT INTO `tp_judgment` VALUES (78, 'StringBuffer deleteCharAt(int index)表示删除索引index-1处的字符', 'false', 1, 38);
INSERT INTO `tp_judgment` VALUES (79, 'String trim()表示删除字符串前方的空格', 'false', 1, 38);
INSERT INTO `tp_judgment` VALUES (80, 'StringBuffer reverse()是将字符串倒序', 'true', 1, 38);
INSERT INTO `tp_judgment` VALUES (81, 'valueOf(double t)是把字符串转化为double型 ', 'false', 1, 38);
INSERT INTO `tp_judgment` VALUES (82, '几乎所有的界面操作都会触发事件', 'true', 1, 38);
INSERT INTO `tp_judgment` VALUES (83, 'Java程序中，一个类可以实现多个接口', 'true', 1, 38);
INSERT INTO `tp_judgment` VALUES (84, 'Java支持类的单继承', 'true', 1, 38);
INSERT INTO `tp_judgment` VALUES (85, '类和对象的关系是抽象和具体的关系', 'true', 1, 38);
INSERT INTO `tp_judgment` VALUES (86, '在Java语言中，用final修饰的类，也可以被继承', 'false', 1, 38);
INSERT INTO `tp_judgment` VALUES (87, '类中定义的非静态变量，只能通过类的对象引用', 'false', 1, 38);
INSERT INTO `tp_judgment` VALUES (88, 'indexOf()方法是从字符串的第一个字符开始检索', 'true', 1, 38);
INSERT INTO `tp_judgment` VALUES (89, 'Java中，方法重载机制，允许在一个类中定义多个同名的方法', 'true', 1, 38);
INSERT INTO `tp_judgment` VALUES (90, 'Java中定义的静态方法，不能访问该类的非静态成员变量', 'true', 1, 38);
INSERT INTO `tp_judgment` VALUES (91, 'Java程序中，一个源文件中只能有一个公共接口定义', 'false', 1, 38);
INSERT INTO `tp_judgment` VALUES (92, 'Java中，不同的包中可以有同名的类。', 'true', 1, 38);
INSERT INTO `tp_judgment` VALUES (93, 'Java中，用final修饰的方法不能被重写', 'true', 1, 38);
INSERT INTO `tp_judgment` VALUES (94, 'Java程序中不区分大小写字母。', 'false', 1, 38);
INSERT INTO `tp_judgment` VALUES (95, '在运行字节码文件时，使用java命令，一定要给出字节码文件的扩展名.class', 'false', 1, 38);
INSERT INTO `tp_judgment` VALUES (96, '在运行字节码文件时，使用java命令，一定要给出字节码文件的扩展名.class', 'false', 1, 38);
INSERT INTO `tp_judgment` VALUES (97, '方法重载要求方法名称必须相同', 'false', 1, 38);
INSERT INTO `tp_judgment` VALUES (98, '一个方法在所属的类中可以被重载多次', 'true', 1, 38);
INSERT INTO `tp_judgment` VALUES (99, '一个方法在所属的类中只能被重载一次', 'false', 1, 38);
INSERT INTO `tp_judgment` VALUES (100, 'java中用8位来表示一个字符的', 'false', 1, 38);
INSERT INTO `tp_judgment` VALUES (101, '在for循环中，不能使用break语句跳出循环。', 'false', 1, 38);
INSERT INTO `tp_judgment` VALUES (102, 'char+byte的运算结果是int型的数据。', 'true', 1, 38);
INSERT INTO `tp_judgment` VALUES (103, 'char+byte的运算结果是int型的数据', 'true', 1, 38);
INSERT INTO `tp_judgment` VALUES (104, 'java中，数组必须先声明，然后才能使用。', 'true', 1, 38);
INSERT INTO `tp_judgment` VALUES (105, 'if语句可以没有else语句对应', 'true', 1, 38);
INSERT INTO `tp_judgment` VALUES (106, '“云”使用了数据多副本容错、比使用本地计算机可靠。( )', 'true', 1, 39);
INSERT INTO `tp_judgment` VALUES (107, '云计算是由一系列可以动态升级和虚拟化的资源所组成的，这些资源被所有云计算的用户共享并且可以方便地通过网络访问，用户无须掌握云计算的技术，只需要按照个人或者团体的需要租赁云计算的资源。(  ) ', 'true', 1, 39);
INSERT INTO `tp_judgment` VALUES (108, 'SaaS是一种基于互联网提供软件服务的应用模式。( )', 'true', 1, 39);
INSERT INTO `tp_judgment` VALUES (109, '并行计算是指同时使用多种计算资源解决计算问题的过程，其主要目的是快速解决大型且复杂的计算问题。( )', 'true', 1, 39);
INSERT INTO `tp_judgment` VALUES (110, 'Google Chrome，又称Google浏览器，是一个由Google（谷歌）公司开发的开放原始码网页浏览器。(  )', 'true', 1, 39);
INSERT INTO `tp_judgment` VALUES (111, '网格计算是分布式计算的一种，是分布式计算封装。(  )', 'false', 1, 39);
INSERT INTO `tp_judgment` VALUES (112, '. Bigtable是一个分布式多维映射表，表中的数据通过一个行关键字（Row Key）、一个列关键字（Column Key）以及一个时间戳（Time Stamp）进行索引。( ) ', 'true', 1, 39);
INSERT INTO `tp_judgment` VALUES (113, 'GFS将容错的任务交给文件系统完成，利用软件的方法解决系统可靠性问题，使存储成本成倍下降。(  )', 'true', 1, 39);
INSERT INTO `tp_judgment` VALUES (114, 'Bigtable需要对存储在其中的数据做解析。(  )', 'false', 1, 39);
INSERT INTO `tp_judgment` VALUES (115, '为了减少访问开销，提高客户访问效率，Bigtable使用了缓存（Cache）和刷新（Refresh)技术。(  )', 'false', 1, 39);
INSERT INTO `tp_judgment` VALUES (116, 'Google设计的提供粗粒度锁服务的一个文件系统，它基于紧耦合分布式系统，解决了分布的一致性问题。(  )', 'false', 1, 39);
INSERT INTO `tp_judgment` VALUES (117, '云计算提供了最可靠、最安全的数据存储中心，用户不用再担心数据丢失、病毒入侵个人电脑的麻烦，用户也不用进行安全防护。(  ) ', 'false', 1, 39);
INSERT INTO `tp_judgment` VALUES (118, 'MapReduce编程模型只适合非结构化的海量数据搜索、挖掘、分析与机器智能学习等。(  )', 'false', 1, 39);
INSERT INTO `tp_judgment` VALUES (119, '在Bigtable中Chubby选取并保证同一时间只有两个服务器，一个是主服务器，一个是备份服务器。(  ) ', 'false', 1, 39);
INSERT INTO `tp_judgment` VALUES (120, 'Pig是一个基于Hadoop的大规模数据存储平台。(  )', 'false', 1, 39);
INSERT INTO `tp_judgment` VALUES (121, '每个数据中心的PNUTS结构由两部分构成，即Master和Chunk Server。(  )', 'false', 1, 39);
INSERT INTO `tp_judgment` VALUES (122, 'Aneka是一个软件平台和在云端开发分布式应用程序的框架。它按需利用台式机和服务器或数据中心异构网络的计算资源。(  )', 'true', 1, 39);
INSERT INTO `tp_judgment` VALUES (123, 'Pig是一个基于Hadoop的大规模数据分析平台，它提供的SQL-LIKE语言叫Pig Latin，该语言的编译器会把类SQL的数据分析请求转换为一系列经过优化处理的MapReduce运算。(  )', 'true', 1, 39);
INSERT INTO `tp_judgment` VALUES (124, 'HBase基于Hadoop Distributed File System，是一个开源的，基于列存储模型的分布式数据库。(  )', 'true', 1, 39);
INSERT INTO `tp_judgment` VALUES (125, '适合用 MapReduce 来处理的数据集(或任务)有一个基本要求: 待处理的数据集可以分解成许多小的数据集，而且每一个小数据集都可以完全并行地进行处理。(  )', 'true', 1, 39);

-- ----------------------------
-- Table structure for tp_multiple
-- ----------------------------
DROP TABLE IF EXISTS `tp_multiple`;
CREATE TABLE `tp_multiple`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '题目',
  `option` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '选项使用json保存',
  `optionTrue` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '正确选项 json保存',
  `score` int NOT NULL COMMENT '分数',
  `belongPaperId` int NOT NULL COMMENT '所属试卷',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 69 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tp_multiple
-- ----------------------------
INSERT INTO `tp_multiple` VALUES (11, '软件危机产生的主要原因是（ ）。 ', '{\"A\":\"\\u8f6f\\u4ef6\\u672c\\u8eab\\u7684\\u7279\\u70b9\\u2002\",\"B\":\"\\u7528\\u6237\\u4f7f\\u7528\\u4e0d\\u5f53\",\"C\":\"\\u786c\\u4ef6\\u53ef\\u9760\\u6027\\u5dee\",\"D\":\"\\u7f3a\\u4e4f\\u597d\\u7684\\u5f00\\u53d1\\u65b9\\u6cd5\\u548c\\u624b\\u6bb5\"}', '[\"A\",\"D\"]', 1, 22);
INSERT INTO `tp_multiple` VALUES (12, '以下说法中正确的是（）', '{\"A\":\"\\u5feb\\u901f\\u539f\\u578b\\u601d\\u60f3\\u662f\\u5728\\u7814\\u7a76\\u6982\\u8981\\u8bbe\\u8ba1\\u9636\\u6bb5\\u7684\\u65b9\\u6cd5\\u548c\\u6280\\u672f\\u4e2d\\u4ea7\\u751f\\u7684\",\"B\":\"\\u63a2\\u7d22\\u578b\\u548c\\u5b9e\\u9a8c\\u578b\\u5feb\\u901f\\u539f\\u578b\\u91c7\\u7528\\u7684\\u662f\\u629b\\u5f03\\u7b56\\u7565\",\"C\":\"\\u6f14\\u5316\\u578b\\u5feb\\u901f\\u539f\\u578b\\u91c7\\u7528\\u9644\\u52a0\\u7b56\\u7565\",\"D\":\"\\u5feb\\u901f\\u539f\\u578b\\u662f\\u5229\\u7528\\u539f\\u578b\\u8f85\\u52a9\\u8f6f\\u4ef6\\u5f00\\u53d1\\u7684\\u4e00\\u79cd\\u65b0\\u601d\\u60f3\\u2002\"}', '[\"B\",\"C\",\"D\"]', 1, 22);
INSERT INTO `tp_multiple` VALUES (13, '下列叙述中，（）是不正确的。', '{\"A\":\"\\u8f6f\\u4ef6\\u7cfb\\u7edf\\u4e2d\\u6240\\u6709\\u7684\\u4fe1\\u606f\\u6d41\\u90fd\\u53ef\\u4ee5\\u8ba4\\u4e3a\\u662f\\u4e8b\\u7269\\u6d41\",\"B\":\"\\u8f6f\\u4ef6\\u7cfb\\u7edf\\u4e2d\\u6240\\u6709\\u7684\\u4fe1\\u606f\\u6d41\\u90fd\\u53ef\\u4ee5\\u8ba4\\u4e3a\\u662f\\u53d8\\u6362\\u6d41\",\"C\":\"\\u4e8b\\u52a1\\u5206\\u6790\\u548c\\u53d8\\u6362\\u5206\\u6790\\u7684\\u8bbe\\u8ba1\\u6b65\\u9aa4\\u662f\\u57fa\\u672c\\u76f8\\u4f3c\\u7684\",\"D\":\"\\u4e8b\\u52a1\\u5206\\u6790\\u548c\\u53d8\\u6362\\u5206\\u6790\\u7684\\u8bbe\\u8ba1\\u6b65\\u9aa4\\u5b8c\\u5168\\u4e0d\\u540c\"}', '[\"A\",\"B\",\"D\"]', 1, 22);
INSERT INTO `tp_multiple` VALUES (14, '在程序的描述和分析中，下列哪个不是用以指明数据来源、数据流向和数据处理的辅助图形（）。', '{\"A\":\"\\u7011\\u5e03\\u6a21\\u578b\\u2002\",\"B\":\"\\u6570\\u636e\\u6d41\\u56fe\",\"C\":\"\\u6570\\u636e\\u7ed3\\u6784\\u56fe\\u2002\",\"D\":\"\\u4e1a\\u52a1\\u56fe\"}', '[\"A\",\"C\",\"D\"]', 1, 22);
INSERT INTO `tp_multiple` VALUES (15, '软件维护是保证软件正常、有效的重要手段，而软件的下述特性中（）有利于软件的维护', '{\"A\":\"\\u53ef\\u6d4b\\u8bd5\\u6027\\u2002\",\"B\":\"\\u53ef\\u7406\\u89e3\\u6027\\u2002\",\"C\":\"\\u53ef\\u4fee\\u6539\\u6027\",\"D\":\"\\u53ef\\u79fb\\u690d\\u6027\"}', '[\"A\",\"C\",\"D\",\"B\"]', 1, 22);
INSERT INTO `tp_multiple` VALUES (16, '软件需求规格说明书的内容包括对（）的描述。', '{\"A\":\"\\u4e3b\\u8981\\u529f\\u80fd\",\"B\":\"\\u7b97\\u6cd5\\u7684\\u8be6\\u7ec6\\u8fc7\\u7a0b\\u2002\",\"C\":\"\\u7528\\u6237\\u754c\\u9762\\u53ca\\u8fd0\\u884c\\u73af\\u5883\\u2002\",\"D\":\"\\u8f6f\\u4ef6\\u7684\\u6027\\u80fd\"}', '[\"A\",\"C\",\"D\"]', 1, 22);
INSERT INTO `tp_multiple` VALUES (17, '下列说法正确的是（）', '{\"A\":\"\\u53d8\\u6362\\u578b\\u7684DFD\\u662f\\u7531\\u8f93\\u5165\\u3001\\u53d8\\u6362\\uff08\\u6216\\u79f0\\u5904\\u7406\\uff09\\u548c\\u8f93\\u51fa\\u4e09\\u90e8\\u5206\\u7ec4\\u6210\",\"B\":\"\\u53d8\\u6362\\u578b\\u6570\\u636e\\u5904\\u7406\\u7684\\u5de5\\u4f5c\\u8fc7\\u7a0b\\u4e00\\u822c\\u5206\\u4e3a\\u4e09\\u6b65\\uff1a\\u5904\\u7406\\u6570\\u636e\\u3001\\u53d8\\u6362\\u6570\\u636e\\u548c\\u518d\\u5904\\u7406\\u6570\\u636e\",\"C\":\"\\u53d8\\u6362\\u8f93\\u5165\\u7aef\\u7684\\u6570\\u636e\\u6d41\\u4e3a\\u7cfb\\u7edf\\u7684\\u903b\\u8f91\\u8f93\\u5165\\uff0c\\u5b83\\u5c06\\u5916\\u90e8\\u5f62\\u5f0f\\u7684\\u6570\\u636e\\u53d8\\u6362\\u6210\\u5185\\u90e8\\u5f62\\u5f0f\\uff0c\\u9001\\u7ed9\\u4e3b\\u52a0\\u5de5\\u3002\",\"D\":\"\\u53d8\\u6362\\u8f93\\u51fa\\u7aef\\u4e3a\\u903b\\u8f91\\u8f93\\u51fa\\uff0c\\u5b83\\u628a\\u4e3b\\u52a0\\u5de5\\u4ea7\\u751f\\u7684\\u6570\\u636e\\u7684\\u5185\\u90e8\\u5f62\\u5f0f\\u8f6c\\u6362\\u6210\\u5916\\u90e8\\u5f62\\u5f0f\\u540e\\u7269\\u7406\\u8f93\\u51fa\\u3002\"}', '[\"A\",\"C\",\"D\"]', 1, 22);
INSERT INTO `tp_multiple` VALUES (18, '以下说法正确的是（）。', '{\"A\":\"\\u9762\\u5411\\u5bf9\\u8c61\\u65b9\\u6cd5\\u4e0d\\u4ec5\\u652f\\u6301\\u8fc7\\u7a0b\\u62bd\\u8c61\\uff0c\\u800c\\u4e14\\u652f\\u6301\\u6570\\u636e\\u62bd\\u8c61\\u2002\",\"B\":\"\\u67d0\\u4e9b\\u9762\\u5411\\u5bf9\\u8c61\\u7684\\u7a0b\\u5e8f\\u8bbe\\u8ba1\\u8bed\\u8a00\\u8fd8\\u652f\\u6301\\u53c2\\u6570\\u5316\\u62bd\\u8c61\\u2002\",\"C\":\"\\u4fe1\\u606f\\u9690\\u85cf\\u901a\\u8fc7\\u5bf9\\u8c61\\u7684\\u5c01\\u88c5\\u6027\\u6765\\u5b9e\\u73b0\",\"D\":\"\\u5728\\u9762\\u5411\\u5bf9\\u8c61\\u65b9\\u6cd5\\u4e2d\\uff0c\\u7c7b\\u662f\\u6700\\u57fa\\u672c\\u7684\\u6a21\\u5757\"}', '[\"A\",\"C\",\"B\"]', 1, 22);
INSERT INTO `tp_multiple` VALUES (19, '在程序设计过程中，要为程序调试做好准备，主要体现在（）', '{\"A\":\"\\u91c7\\u7528\\u6a21\\u5757\\u5316\\u3001\\u7ed3\\u6784\\u5316\\u7684\\u8bbe\\u8ba1\\u65b9\\u6cd5\\u8bbe\\u8ba1\\u7a0b\\u5e8f\\u2002\",\"B\":\"\\u7f16\\u5199\\u7a0b\\u5e8f\\u65f6\\u8981\\u4e3a\\u8c03\\u8bd5\\u63d0\\u4f9b\\u8db3\\u591f\\u7684\\u7075\\u6d3b\\u6027\",\"C\":\"\\u6839\\u636e\\u7a0b\\u5e8f\\u8c03\\u8bd5\\u7684\\u9700\\u8981\\uff0c\\u8981\\u9009\\u62e9\\u5e76\\u5b89\\u6392\\u9002\\u5f53\\u7684\\u4e2d\\u95f4\\u7ed3\\u679c\\u8f93\\u51fa\\u548c\\u5fc5\\u8981\\u7684\\u65ad\\u70b9\",\"D\":\"\\u4ee5\\u4e0a\\u7b54\\u6848\\u90fd\\u4e0d\\u6b63\\u786e\"}', '[\"A\",\"B\",\"C\"]', 1, 22);
INSERT INTO `tp_multiple` VALUES (20, '对象间的关系可以有哪几种关系（）。', '{\"A\":\"\\u4e00\\u5bf9\\u591a\\u5173\\u7cfb\",\"B\":\"\\u4e00\\u822c-\\u7279\\u6b8a\\u5173\\u7cfb\\u2002\",\"C\":\"\\u6574\\u4f53-\\u90e8\\u5206\\u5173\\u7cfb\",\"D\":\"\\u6574\\u4f53-\\u7279\\u6b8a\\u5173\\u7cfb\"}', '[\"B\",\"C\"]', 1, 22);
INSERT INTO `tp_multiple` VALUES (21, '软件工程包括软件开发技术和软件工程管理。属于软件工程管理内容的是（）。', '{\"A\":\"\\u8f6f\\u4ef6\\u5de5\\u5177\",\"B\":\"\\u8f6f\\u4ef6\\u5de5\\u7a0b\\u73af\\u5883\",\"C\":\"\\u5f00\\u53d1\\u65b9\\u6cd5\",\"D\":\" \\u8f6f\\u4ef6\\u5de5\\u7a0b\\u7ecf\\u6d4e\\u5b66\"}', '[\"D\"]', 1, 22);
INSERT INTO `tp_multiple` VALUES (22, '瀑布模型的存在问题是（）', '{\"A\":\"\\u7528\\u6237\\u5bb9\\u6613\\u53c2\\u4e0e\\u5f00\\u53d1 \",\"B\":\"\\u7f3a\\u4e4f\\u7075\\u6d3b\\u6027\",\"C\":\"\\u7528\\u6237\\u4e0e\\u5f00\\u53d1\\u8005\\u6613\\u6c9f\\u901a \",\"D\":\"\\u9002\\u7528\\u53ef\\u53d8\\u9700\\u6c42\"}', '[\"B\"]', 1, 22);
INSERT INTO `tp_multiple` VALUES (23, '开发软件所需高成本和产品的低质量之间有着尖锐的矛盾，这种现象称做', '{\"A\":\"\\u8f6f\\u4ef6\\u5de5\\u7a0b \",\"B\":\"\\u8f6f\\u4ef6\\u5468\\u671f\",\"C\":\"\\u8f6f\\u4ef6\\u5371\\u673a\",\"D\":\"\\u8f6f\\u4ef6\\u4ea7\\u751f\"}', '[\"C\"]', 1, 22);
INSERT INTO `tp_multiple` VALUES (24, '数据耦合、公共耦合、标记耦合、控制耦合的耦合性从低到高的顺序是（）', '{\"A\":\"\\u6570\\u636e\\u3001\\u516c\\u5171\\u3001\\u6807\\u8bb0\\u3001\\u63a7\\u5236    \",\"B\":\"\\u6570\\u636e\\u3001\\u6807\\u8bb0\\u3001\\u63a7\\u5236\\u3001\\u516c\\u5171\",\"C\":\"\\u63a7\\u5236\\u3001\\u6570\\u636e\\u3001\\u6807\\u8bb0\\u3001\\u516c\\u5171     \",\"D\":\"\\u63a7\\u5236\\u3001\\u6570\\u636e\\u3001\\u516c\\u5171\\u3001\\u6807\\u8bb0\"}', '[\"B\"]', 1, 22);
INSERT INTO `tp_multiple` VALUES (25, '在SD方法中全面指导模块划分的最重要的原则是()', '{\"A\":\"\\u7a0b\\u5e8f\\u6a21\\u5757\\u5316\",\"B\":\"\\u6a21\\u5757\\u9ad8\\u5185\\u805a\",\"C\":\"\\u6a21\\u5757\\u4f4e\\u8026\\u5408\",\"D\":\"\\u6a21\\u5757\\u72ec\\u7acb\\u6027\"}', '[\"D\"]', 1, 22);
INSERT INTO `tp_multiple` VALUES (26, '软件测试的目的是（）。', '{\"A\":\"\\u8bc4\\u4ef7\\u8f6f\\u4ef6\\u7684\\u8d28\\u91cf\",\"B\":\"\\u53d1\\u73b0\\u8f6f\\u4ef6\\u7684\\u9519\\u8bef\",\"C\":\"\\u627e\\u51fa\\u8f6f\\u4ef6\\u7684\\u6240\\u6709\\u9519\\u8bef \",\"D\":\"\\u8bc1\\u660e\\u8f6f\\u4ef6\\u662f\\u6b63\\u786e\\u7684\"}', '[\"B\"]', 1, 22);
INSERT INTO `tp_multiple` VALUES (27, '在设计测试用例时，（）是用得最多的一种黑盒测试方法。', '{\"A\":\"\\u7b49\\u4ef7\\u7c7b\\u5212\\u5206\",\"B\":\"\\u8fb9\\u754c\\u503c\\u5206\\u6790 \",\"C\":\"\\u56e0\\u679c\\u56fe\",\"D\":\"\\u5224\\u5b9a\\u8868\"}', '[\"A\"]', 1, 22);
INSERT INTO `tp_multiple` VALUES (28, '需求分析最终结果是产生()。', '{\"A\":\"\\u9879\\u76ee\\u5f00\\u53d1\\u8ba1\\u5212\",\"B\":\"\\u9700\\u6c42\\u89c4\\u683c\\u8bf4\\u660e\\u4e66\",\"C\":\"\\u8bbe\\u8ba1\\u8bf4\\u660e\\u4e66 \",\"D\":\"\\u53ef\\u884c\\u6027\\u5206\\u6790\\u62a5\\u544a\"}', '[\"B\"]', 1, 22);
INSERT INTO `tp_multiple` VALUES (29, 'Jackson图中，模块框之间若有直线连接，表示它们之间存在()。', '{\"A\":\"\\u8c03\\u7528\\u5173\\u7cfb\",\"B\":\"\\u7ec4\\u6210\\u5173\\u7cfb \",\"C\":\"\\u7ec4\\u6210\\u5173\\u7cfb \",\"D\":\"\\u987a\\u5e8f\\u6267\\u884c\\u5173\\u7cfb\"}', '[\"B\"]', 1, 22);
INSERT INTO `tp_multiple` VALUES (30, '软件详细设计的主要任务是确定每个模块的()。', '{\"A\":\"\\u529f\\u80fd  \",\"B\":\"\\u5916\\u90e8\\u63a5\\u53e3 \",\"C\":\"\\u7b97\\u6cd5\\u548c\\u4f7f\\u7528\\u7684\\u6570\\u636e\\u7ed3\\u6784\",\"D\":\"\\u7f16\\u7a0b\"}', '[\"C\"]', 1, 22);
INSERT INTO `tp_multiple` VALUES (31, '为了提高软件的可维护性，在编码阶段应注意（）', '{\"A\":\"\\u4fdd\\u5b58\\u6d4b\\u8bd5\\u7528\\u4f8b\\u548c\\u6570\\u636e  \",\"B\":\"\\u63d0\\u9ad8\\u6a21\\u5757\\u7684\\u72ec\\u7acb\\u6027\",\"C\":\"\\u6587\\u6863\\u7684\\u526f\\u4f5c\\u7528\",\"D\":\"\\u517b\\u6210\\u597d\\u7684\\u7a0b\\u5e8f\\u8bbe\\u8ba1\\u98ce\\u683c\"}', '[\"D\"]', 1, 22);
INSERT INTO `tp_multiple` VALUES (32, '设年利率为i，现存入p元，若计复利，n年后可得钱数为（）', '{\"A\":\"p\\ufe61(1+i\\ufe61n)  \",\"B\":\"p\\ufe61(i+1)n\",\"C\":\"p\\ufe61(1+i)\\ufe61n  \",\"D\":\"p\\ufe61(i+n)\"}', '[\"B\"]', 1, 22);
INSERT INTO `tp_multiple` VALUES (33, '在考察系统的一些涉及时序和改变的状态时，要用动态模型来表示。动态模型着重于系统的控制逻辑，它包括两个图：一个是事件追踪图，另一个是（）。', '{\"A\":\"\\u72b6\\u6001\\u56fe \",\"B\":\"\\u6570\\u636e\\u6d41\\u56fe  \",\"C\":\" \\u7cfb\\u7edf\\u7ed3\\u6784\\u56fe \",\"D\":\"\\u65f6\\u5e8f\\u56fe\"}', '[\"A\"]', 1, 22);
INSERT INTO `tp_multiple` VALUES (34, '对象实现了数据和操作的结合，使数据和操作()于对象的统一体中。', '{\"A\":\"\\u7ed3\\u5408\",\"B\":\"\\u9690\\u85cf  \",\"C\":\"\\u5c01\\u88c5\",\"D\":\" \\u62bd\\u8c61\"}', '[\"C\"]', 1, 22);
INSERT INTO `tp_multiple` VALUES (35, '软件详细设计的主要任务是确定每个模块的()。', '{\"A\":\" \\u7b97\\u6cd5\\u548c\\u4f7f\\u7528\\u7684\\u6570\\u636e\\u7ed3\\u6784\",\"B\":\"\\u5916\\u90e8\\u63a5\\u53e3 \",\"C\":\"\\u529f\\u80fd \",\"D\":\"\\u7f16\\u7a0b\"}', '[\"A\"]', 1, 22);
INSERT INTO `tp_multiple` VALUES (36, ' 软件结构图中，模块框之间若有直线连接，表示它们之间存在()。', '{\"A\":\"\\u8c03\\u7528\\u5173\\u7cfb\",\"B\":\"\\u7ec4\\u6210\\u5173\\u7cfb\",\"C\":\"\\u94fe\\u63a5\\u5173\\u7cfb\",\"D\":\"\\u987a\\u5e8f\\u6267\\u884c\\u5173\\u7cfb\"}', '[\"A\"]', 1, 22);
INSERT INTO `tp_multiple` VALUES (37, '需求分析最终结果是产生()。', '{\"A\":\"\\u9879\\u76ee\\u5f00\\u53d1\\u8ba1\\u5212 \",\"B\":\"\\u9700\\u6c42\\u89c4\\u683c\\u8bf4\\u660e\\u4e66\",\"C\":\"\\u8bbe\\u8ba1\\u8bf4\\u660e\\u4e66  \",\"D\":\"\\u53ef\\u884c\\u6027\\u5206\\u6790\\u62a5\\u544a\"}', '[\"B\"]', 1, 22);
INSERT INTO `tp_multiple` VALUES (38, '在详细设计阶段，经常采用的工具有()。', '{\"A\":\"PAD   \",\"B\":\"SA    \",\"C\":\"SC     \",\"D\":\"DFD\"}', '[\"A\"]', 1, 22);
INSERT INTO `tp_multiple` VALUES (39, '因计算机硬件和软件环境的变化而作出的修改软件的过程称为()', '{\"A\":\"\\u6559\\u6b63\\u6027\\u7ef4\\u62a4 \",\"B\":\"\\u9002\\u5e94\\u6027\\u7ef4\\u62a4\",\"C\":\"\\u5b8c\\u5584\\u6027\\u7ef4\\u62a4\",\"D\":\"\\u9884\\u9632\\u6027\\u7ef4\\u62a4\"}', '[\"C\"]', 1, 22);
INSERT INTO `tp_multiple` VALUES (40, '为了提高软件的可维护性，在编码阶段应注意()', '{\"A\":\"\\u4fdd\\u5b58\\u6d4b\\u8bd5\\u7528\\u4f8b\\u548c\\u6570\\u636e \",\"B\":\"\\u63d0\\u9ad8\\u6a21\\u5757\\u7684\\u72ec\\u7acb\\u6027\",\"C\":\"\\u6587\\u6863\\u7684\\u526f\\u4f5c\\u7528\",\"D\":\"\\u517b\\u6210\\u597d\\u7684\\u7a0b\\u5e8f\\u8bbe\\u8ba1\\u98ce\\u683c\"}', '[\"D\"]', 1, 22);
INSERT INTO `tp_multiple` VALUES (41, 'PHP的BASE64编码中包含以下哪些?（    ）', '{\"A\":\"0-9\\u7684\\u6570\\u5b57\",\"B\":\"\\u82f1\\u6587\\u5b57\\u6bcd\",\"C\":\"+\",\"D\":\"#\"}', '[\"A\",\"B\",\"C\"]', 1, 23);
INSERT INTO `tp_multiple` VALUES (42, 'mysql的混合日期时间类型有？（    ）', '{\"A\":\"date\",\"B\":\"datetime\",\"C\":\"timestamp\",\"D\":\"time\"}', '[\"B\",\"C\"]', 1, 23);
INSERT INTO `tp_multiple` VALUES (43, '下列哪些属于mysql的连接类型?（    ）', '{\"D\":\"\\u4ea4\\u53c9\\u8fde\\u63a5\",\"C\":\"\\u81ea\\u8fde\\u63a5\",\"B\":\"\\u5916\\u8fde\\u63a5\",\"A\":\"\\u5185\\u8fde\\u63a5\"}', '[\"A\",\"B\",\"C\",\"D\"]', 1, 23);
INSERT INTO `tp_multiple` VALUES (44, 'PHP的逻辑与运算有哪两种符号表示?（    ）', '{\"D\":\"||\",\"C\":\"or\",\"B\":\"and\",\"A\":\"&&\"}', '[\"A\",\"B\"]', 1, 23);
INSERT INTO `tp_multiple` VALUES (45, 'PHP类中的变量,也可以称为？（    ）', '{\"A\":\"\\u5c5e\\u6027\",\"B\":\"\\u6570\\u636e\\u6210\\u5458\",\"C\":\"\\u65b9\\u6cd5\",\"D\":\"\\u5b50\\u7c7b\"}', '[\"A\",\"B\"]', 1, 23);
INSERT INTO `tp_multiple` VALUES (46, 'PHP中跟文件指针操作有关的函数有？（    ）', '{\"A\":\"feof()\",\"B\":\"rewind()\",\"C\":\"ftell()\",\"D\":\"fseek()\"}', '[\"A\",\"B\",\"C\",\"D\"]', 1, 23);
INSERT INTO `tp_multiple` VALUES (47, '以下哪些属于smarty中要求建立的文件目录?（    ）', '{\"A\":\"cache\",\"B\":\"configs\",\"C\":\"php\",\"D\":\"mysql\"}', '[\"A\"]', 1, 23);
INSERT INTO `tp_multiple` VALUES (48, '以下哪些属于PHP自带的预定义变量?（    ）', '{\"A\":\"$_POST\",\"B\":\"$_GET\",\"C\":\"$_SERVER\",\"D\":\"$_SESSION\"}', '[\"A\",\"B\",\"C\",\"D\"]', 1, 23);
INSERT INTO `tp_multiple` VALUES (49, '正则表达式中行定位符有？（    ）', '{\"A\":\"^\",\"B\":\"$\",\"C\":\"@\",\"D\":\"!\"}', '[\"A\",\"B\"]', 1, 23);
INSERT INTO `tp_multiple` VALUES (50, '以下哪些属于正则表达式中的预定义字符?（    ）', '{\"D\":\"\\/\",\"C\":\"*\",\"B\":\"+\",\"A\":\"?\"}', '[\"A\",\"B\",\"C\"]', 1, 23);
INSERT INTO `tp_multiple` VALUES (69, '下面关于Java中异常处理try块的说法正确的是(    )? ', '{\"A\":\"try\\u5757\\u540e\\u901a\\u5e38\\u5e94\\u6709\\u4e00\\u4e2acatch\\u2002\\u5757\\uff0c\\u7528\\u6765\\u5904\\u7406try\\u5757\\u4e2d\\u629b\\u51fa\\u7684\\u5f02\\u5e38\",\"B\":\"catch\\u2002\\u5757\\u540e\\u5fc5\\u987b\\u6709finally\\u5757\\u3002\",\"C\":\"\\u53ef\\u80fd\\u629b\\u51fa\\u5f02\\u5e38\\u7684\\u65b9\\u6cd5\\u8c03\\u7528\\u5e94\\u653e\\u5728try\\u5757\\u4e2d\\u3002\",\"D\":\"\\u5bf9\\u629b\\u51fa\\u7684\\u5f02\\u5e38\\u7684\\u5904\\u7406\\u5fc5\\u987b\\u653e\\u5728try\\u5757\\u4e2d\"}', '[\"A\",\"B\"]', 1, 38);
INSERT INTO `tp_multiple` VALUES (70, '下面哪些关键字能用来控制对类成员的访问(  )？ ', '{\"A\":\"public\",\"B\":\"protected\",\"C\":\"private\\u2002\\u2002\",\"D\":\"default\"}', '[\"A\",\"B\",\"C\"]', 1, 38);
INSERT INTO `tp_multiple` VALUES (71, '线程对象的生命周期中,通常经历下面哪些状态（     ）。 ', '{\"A\":\"\\u65b0\\u5efa\",\"B\":\"\\u8fd0\\u884c\",\"C\":\"\\u5c31\\u7eea\",\"D\":\"\\u6b7b\\u4ea1\"}', '[\"A\",\"C\",\"B\",\"D\"]', 1, 38);
INSERT INTO `tp_multiple` VALUES (72, '下面关于进程、线程的说法正确的是()。', '{\"A\":\"\\u8fdb\\u7a0b\\u662f\\u7a0b\\u5e8f\\u7684\\u4e00\\u6b21\\u52a8\\u6001\\u6267\\u884c\\u8fc7\\u7a0b\\u3002\\u4e00\\u4e2a\\u8fdb\\u7a0b\\u5728\\u5176\\u6267\\u884c\\u8fc7\\u7a0b\\u4e2d\\uff0c\\u53ef\\u4ee5\\u4ea7\\u751f\\u591a\\u4e2a\\u7ebf\\u7a0b\\u2014\\u2014\\u591a\\u7ebf\\u7a0b\\uff0c\\u5f62\\u6210\\u591a\\u6761\\u6267\\u884c\\u7ebf\\u7d22\\u3002\",\"B\":\"\\u7ebf\\u7a0b\\u662f\\u6bd4\\u8fdb\\u7a0b\\u66f4\\u5c0f\\u7684\\u6267\\u884c\\u5355\\u4f4d\\uff0c\\u662f\\u5728\\u4e00\\u4e2a\\u8fdb\\u7a0b\\u4e2d\\u72ec\\u7acb\\u7684\\u63a7\\u5236\\u6d41\\uff0c\\u5373\\u7a0b\\u5e8f\\u5185\\u90e8\\u7684\\u63a7\\u5236\\u6d41\\u3002\\u7ebf\\u7a0b\\u672c\\u8eab\\u4e0d\\u80fd\\u81ea\\u52a8\\u8fd0\\u884c\\uff0c\\u6816\\u8eab\\u4e8e\\u67d0\\u4e2a\\u8fdb\\u7a0b\\u4e4b\\u4e2d\\uff0c\\u7531\\u8fdb\\u7a0b\\u542f\\u52a8\\u6267\\u884c\\u3002\",\"C\":\"Java\\u591a\\u7ebf\\u7a0b\\u7684\\u8fd0\\u884c\\u4e0e\\u5e73\\u53f0\\u76f8\\u5173\\u3002\",\"D\":\"\\u5bf9\\u4e8e\\u5355\\u5904\\u7406\\u5668\\u7cfb\\u7edf\\uff0c\\u591a\\u4e2a\\u7ebf\\u7a0b\\u5206\\u65f6\\u95f4\\u7247\\u83b7\\u53d6CPU\\u6216\\u5176\\u4ed6\\u7cfb\\u7edf\\u8d44\\u6e90\\u6765\\u8fd0\\u884c\\u3002\\u5bf9\\u4e8e\\u591a\\u5904\\u7406\\u5668\\u7cfb\\u7edf\\uff0c\\u7ebf\\u7a0b\\u53ef\\u4ee5\\u5206\\u914d\\u5230\\u591a\\u4e2a\\u5904\\u7406\\u5668\\u4e2d\\uff0c\\u4ece\\u800c\\u771f\\u6b63\\u7684\\u5e76\\u53d1\\u6267\\u884c\\u591a\\u4efb\\u52a1\\u3002\"}', '[\"A\",\"B\",\"C\",\"D\"]', 1, 38);
INSERT INTO `tp_multiple` VALUES (73, '下面关于外部类和内部类成员的相互访问的规则中，正确的选项是(   )。 ', '{\"A\":\"\\u5185\\u90e8\\u7c7b\\u53ef\\u4ee5\\u76f4\\u63a5\\u8bbf\\u95ee\\u5916\\u90e8\\u7c7b\\u7684\\u6210\\u5458\",\"B\":\"\\u5916\\u90e8\\u7c7b\\u53ef\\u4ee5\\u76f4\\u63a5\\u8bbf\\u95ee\\u5185\\u90e8\\u7c7b\\u7684\\u6210\\u5458\\u2002\",\"C\":\"\\u5916\\u90e8\\u7c7b\\u4e0d\\u80fd\\u8bbf\\u95ee\\u5185\\u90e8\\u7c7b\\u7684\\u6210\\u5458\\u2002\",\"D\":\"\\u5916\\u90e8\\u7c7b\\u53ef\\u901a\\u8fc7\\u521b\\u5efa\\u5185\\u90e8\\u7c7b\\u7684\\u5b9e\\u4f8b\\u6765\\u8bbf\\u95ee\\u5185\\u90e8\\u7c7b\\u7684\\u6210\\u5458\"}', '[\"A\",\"D\"]', 1, 38);
INSERT INTO `tp_multiple` VALUES (74, '类B是一个抽象类，类C是类B的非抽象子类，下列创建对象x1的语句中正确的是(   )。', '{\"A\":\"B\\u2002x1=\\u2002new\\u2002B(\\u2002);\",\"B\":\"B\\u2002x1=\\u2002new\\u2002C(\\u2002);\\u2002\",\"C\":\"C\\u2002x1=new\\u2002C(\\u2002);\\u2002\\u2002\\u2002\\u2002\\u2002\\u2002\\u2002\\u2002\\u2002\",\"D\":\"C\\u2002x1=\\u2002new\\u2002B(\\u2002);\"}', '[\"B\",\"C\"]', 1, 38);
INSERT INTO `tp_multiple` VALUES (75, '下面关于java中输入/输出流的说法正确的是(    )。', '{\"A\":\"FileInputStream\\u4e0eFileOutputStream\\u7c7b\\u7528\\u8bfb\\u3001\\u5199\\u5b57\\u8282\\u6d41\\u3002\",\"B\":\"Reader\\u4e0eWriter\\u7c7b\\u7528\\u6765\\u8bfb\\u3001\\u5199\\u5b57\\u7b26\\u6d41\\u3002\",\"C\":\"RandomAccessFile\\u65e2\\u53ef\\u4ee5\\u7528\\u6765\\u8bfb\\u6587\\u4ef6\\uff0c\\u4e5f\\u53ef\\u4ee5\\u7528\\u6765\\u5199\\u6587\\u4ef6\\u3002\",\"D\":\"File\\u7c7b\\u7528\\u6765\\u5904\\u7406\\u4e0e\\u6587\\u4ef6\\u76f8\\u5173\\u7684\\u64cd\\u4f5c\"}', '[\"D\",\"C\",\"B\",\"A\"]', 1, 38);
INSERT INTO `tp_multiple` VALUES (76, '下面说法正确的是(   )。 ', '{\"A\":\"final\\u2002\\u53ef\\u4fee\\u9970\\u7c7b\\u3001\\u5c5e\\u6027(\\u53d8\\u91cf)\\u3001\\u65b9\\u6cd5\\u3002\",\"B\":\"abstract\\u53ef\\u4fee\\u9970\\u7c7b\\u3001\\u65b9\\u6cd5\\u3002\",\"C\":\"\\u62bd\\u8c61\\u65b9\\u6cd5\\u53ea\\u6709\\u65b9\\u6cd5\\u5934\\uff0c\\u6ca1\\u6709\\u65b9\\u6cd5\\u4f53\\u3002\",\"D\":\"\\u5173\\u952e\\u5b57final\\u548cabstract\\u4e0d\\u80fd\\u540c\\u65f6\\u4f7f\\u7528\\u3002\"}', '[\"A\",\"B\",\"C\",\"D\"]', 1, 38);
INSERT INTO `tp_multiple` VALUES (77, '定义如下的二维数组b，下面的说法正确的是(  ）; ', '{\"A\":\"b.length\\u7684\\u503c\\u662f3\\u3002\",\"B\":\"b[1].length\\u7684\\u503c\\u662f3\\u3002\",\"C\":\"b[1][1]\\u7684\\u503c\\u662f5\\u3002\",\"D\":\"\\u4e8c\\u7ef4\\u6570\\u7ec4b\\u7684\\u7b2c\\u4e00\\u884c\\u67093\\u4e2a\\u5143\\u7d20\"}', '[\"A\",\"C\",\"D\"]', 1, 38);
INSERT INTO `tp_multiple` VALUES (78, '关于BufferedReader类的readLine()方法，以下说法正确的是（   ）。', '{\"A\":\"\\u65b9\\u6cd5readLine()\\u6bcf\\u6b21\\u8bfb\\u53d6\\u4e00\\u884c\\u6570\\u636e\\u3002\",\"B\":\"\\u65b9\\u6cd5readLine()\\u6bcf\\u6b21\\u8bfb\\u53d6\\u4e00\\u4e2a\\u5b57\\u8282\\u3002\",\"C\":\"\\u8be5\\u65b9\\u6cd5\\u53ef\\u80fd\\u629b\\u51faIOException\\u5f02\\u5e38\\uff0c\\u8c03\\u7528\\u8be5\\u65b9\\u6cd5\\u65f6\\u901a\\u5e38\\u5e94\\u5c06\\u5b83\\u653e\\u5230try\\u5757\\u4e2d\\uff0c\\u5e76\\u901a\\u8fc7catch\\u5757\\u5904\\u7406\\u5f02\\u5e38\\u3002\",\"D\":\"\\u5982\\u679c\\u8bfb\\u5230\\u6d41\\u7684\\u672b\\u5c3e\\uff0c\\u8be5\\u65b9\\u6cd5\\u8fd4\\u56de\\u7684\\u7ed3\\u679c\\u4e3anull\\u3002\"}', '[\"A\",\"C\",\"D\"]', 1, 38);
INSERT INTO `tp_multiple` VALUES (79, '云计算技术的层次结构中包含（）下层', '{\"A\":\"\\u7269\\u529b\\u8d44\\u6e90\\u5c42\",\"B\":\"\\u8d44\\u6e90\\u6c60\\u5c42\\u2002\",\"C\":\"\\u7ba1\\u7406\\u4e2d\\u95f4\\u4ef6\",\"D\":\"SOA\\u6784\\u5efa\\u5c42\"}', '[\"A\",\"B\",\"C\",\"D\"]', 1, 39);
INSERT INTO `tp_multiple` VALUES (80, '云计算的特点是', '{\"A\":\"\\u5927\\u89c4\\u6a21\",\"B\":\"\\u5e73\\u6ed1\\u6269\\u5c55\",\"C\":\"\\u8d44\\u6e90\\u5171\\u4eab\",\"D\":\"\\u52a8\\u6001\\u5206\\u914d\"}', '[\"A\",\"B\",\"C\",\"D\"]', 1, 39);
INSERT INTO `tp_multiple` VALUES (81, '下面选项属于Amazon提供的云计算服务是', '{\"A\":\"\\u5f39\\u6027\\u4e91\\u8ba1\\u7b97EC2\",\"B\":\"\\u7b80\\u5355\\u5b58\\u50a8\\u670d\\u52a1S3\",\"C\":\"\\u7b80\\u5355\\u961f\\u5217\\u670d\\u52a1SQS\",\"D\":\"Net\\u670d\\u52a1\"}', '[\"C\",\"B\",\"A\"]', 1, 39);
INSERT INTO `tp_multiple` VALUES (82, '云计算按照服务类型大致可分为以下类', '{\"A\":\"IaaS\",\"B\":\"PaaS\",\"C\":\"SaaS\",\"D\":\"SaaS\"}', '[\"A\",\"B\",\"C\"]', 1, 39);
INSERT INTO `tp_multiple` VALUES (83, '下面选项属于Amazon提供的云计算服务是', '{\"A\":\"\\u5f39\\u6027\\u4e91\\u8ba1\\u7b97EC2\",\"B\":\"\\u7b80\\u5355\\u5b58\\u50a8\\u670d\\u52a1S3\",\"C\":\"\\u7b80\\u5355\\u961f\\u5217\\u670d\\u52a1SQS\",\"D\":\"Net\\u670d\\u52a1\"}', '[\"A\",\"B\",\"C\"]', 1, 39);
INSERT INTO `tp_multiple` VALUES (84, '主流的服务器虚拟化技术包括', '{\"A\":\"VirtualBox\",\"B\":\"KVM\\u2002\",\"C\":\"Xen\",\"D\":\"Hyper-V\"}', '[\"B\",\"C\",\"D\"]', 1, 39);
INSERT INTO `tp_multiple` VALUES (85, 'NIST云计算参考架构中的主要参与者包括', '{\"A\":\"\\u4e91\\u8ba1\\u7b97\\u6d88\\u8d39\\u8005\\u2002\",\"B\":\"\\u4e91\\u8ba1\\u7b97\\u63d0\\u4f9b\\u8005\",\"C\":\"\\u4e91\\u8ba1\\u7b97\\u5ba1\\u8ba1\\u8005\\u2002\",\"D\":\"\\u4e91\\u8ba1\\u7b97\\u4ee3\\u7406\"}', '[\"A\",\"B\",\"C\",\"D\"]', 1, 39);
INSERT INTO `tp_multiple` VALUES (86, '虚拟机包含一批离散的文件，主要有', '{\"A\":\"\\u914d\\u7f6e\\u6587\\u4ef6\",\"B\":\"\\u865a\\u62df\\u78c1\\u76d8\\u6587\\u4ef6\",\"C\":\"\\u865a\\u62df\\u7f51\\u5361\\u6587\\u4ef6\",\"D\":\"\\u65e5\\u5fd7\\u6587\\u4ef6\"}', '[\"D\",\"B\",\"A\"]', 1, 39);
INSERT INTO `tp_multiple` VALUES (87, '存储虚拟化包括', '{\"A\":\"\\u78c1\\u76d8\\u865a\\u62df\\u5316\",\"B\":\"\\u5757\\u865a\\u62df\\u5316\",\"C\":\"\\u78c1\\u5e26\\/\\u78c1\\u5e26\\u673a\\/\\u78c1\\u5e26\\u5e93\\u865a\\u62df\\u5316\",\"D\":\"\\u6587\\u4ef6\\u7cfb\\u7edf\\u865a\\u62df\\u5316\"}', '[\"A\",\"B\",\"C\",\"D\"]', 1, 39);
INSERT INTO `tp_multiple` VALUES (88, '云计算使得企业可以通过互联网从超大数据中心获得', '{\"A\":\"\\u8ba1\\u7b97\\u80fd\\u529b\",\"B\":\"\\u5b58\\u50a8\\u7a7a\\u95f4\",\"C\":\"\\u8f6f\\u4ef6\\u5e94\\u7528\",\"D\":\"\\u670d\\u52a1\"}', '[\"A\",\"D\",\"B\",\"C\"]', 1, 39);
INSERT INTO `tp_multiple` VALUES (89, '大数据的多样性体现在包括', '{\"A\":\"\\u7ed3\\u6784\\u5316\\u6570\\u636e\",\"B\":\"\\u534a\\u7ed3\\u6784\\u5316\\u6570\\u636e\",\"C\":\"\\u975e\\u7ed3\\u6784\\u5316\\u6570\\u636e\",\"D\":\"\\u6570\\u636e\\u6765\\u6e90\\u591a\\u6837\"}', '[\"A\",\"B\",\"C\",\"D\"]', 1, 39);
INSERT INTO `tp_multiple` VALUES (90, '不属于开源系统的是', '{\"A\":\"GFS\\u6587\\u4ef6\\u7cfb\\u7edf\",\"B\":\"HDFS\\u6587\\u4ef6\\u7cfb\\u7edf\",\"C\":\"HBase\\u6570\\u636e\\u7ba1\\u7406\\u6280\\u672f\",\"D\":\"BigTable\\u6570\\u636e\\u7ba1\\u7406\\u6280\\u672f\"}', '[\"A\",\"D\"]', 1, 39);
INSERT INTO `tp_multiple` VALUES (91, '云数据中心的特征', '{\"A\":\"\\u9ad8\\u8bbe\\u5907\\u5229\\u7528\\u7387\",\"B\":\"\\u9ad8\\u53ef\\u7528\\u6027\",\"C\":\"\\u7eff\\u8272\\u8282\\u80fd\",\"D\":\"\\u4eba\\u5de5\\u5316\\u7ba1\\u7406\"}', '[\"A\",\"B\",\"C\"]', 1, 39);
INSERT INTO `tp_multiple` VALUES (92, 'H3C CAS系统中将虚拟机转换为模板的方法有', '{\"A\":\"\\u514b\\u9686\\u4e3a\\u6a21\\u677f\",\"B\":\"\\u590d\\u5236\\u4e3a\\u6a21\\u677f\",\"C\":\"\\u8f6c\\u6362\\u4e3a\\u6a21\\u677f\",\"D\":\"\\u5e03\\u7f72\\u4e3a\\u6a21\\u7248\"}', '[\"A\",\"C\"]', 1, 39);
INSERT INTO `tp_multiple` VALUES (93, '对虚拟化技术的理解正确的选项是', '{\"A\":\"\\u865a\\u62df\\u5316\\u662f\\u8d44\\u6e90\\u7684\\u903b\\u8f91\\u8868\\u793a\\uff0c\\u5b83\\u4e0d\\u53d7\\u7269\\u7406\\u9650\\u5236\\u7684\\u7ea6\\u675f\",\"B\":\"\\u8d44\\u6e90\\u53ef\\u4ee5\\u662f\\u5404\\u79cd\\u786c\\u4ef6\\u8d44\\u6e90\",\"C\":\"\\u865a\\u62df\\u5316\\u5c42\\u9690\\u85cf\\u4e86\\u66ff\\u4ee3\\u8d44\\u6e90\\u5982\\u4f55\\u8f6c\\u6362\\u6210\\u771f\\u6b63\\u8d44\\u6e90\\u7684\\u5185\\u90e8\\u7ec6\\u8282\",\"D\":\"\\u5bf9\\u4f7f\\u7528\\u865a\\u62df\\u5316\\u8d44\\u6e90\\u7684\\u4eba\\uff0c\\u5c31\\u5982\\u771f\\u5b9e\\u7684\\u8d44\\u6e90\\u540c\\u6837\\u7684\\u8bbf\\u95ee\\u65b9\\u5f0f\"}', '[\"A\",\"B\",\"C\",\"D\"]', 1, 39);
INSERT INTO `tp_multiple` VALUES (94, '在云计算中，虚拟层主要包括', '{\"A\":\"\\u670d\\u52a1\\u5668\\u865a\\u62df\\u5316\",\"B\":\"\\u5b58\\u50a8\\u865a\\u62df\\u5316\",\"C\":\"\\u7f51\\u7edc\\u865a\\u62df\\u5316\",\"D\":\"\\u684c\\u9762\\u865a\\u62df\\u5316\"}', '[\"B\",\"C\",\"D\"]', 1, 39);
INSERT INTO `tp_multiple` VALUES (95, '云平台层的功能有哪些？', '{\"A\":\"\\u5f00\\u53d1\\u73af\\u5883\",\"B\":\"\\u8fd0\\u884c\\u65f6\\u73af\\u5883\",\"C\":\"\\u8fd0\\u8425\\u73af\\u5883\",\"D\":\"\\u6d4b\\u8bd5\\u73af\\u5883\"}', '[\"A\",\"B\"]', 1, 39);
INSERT INTO `tp_multiple` VALUES (96, '云计算体系结构中的安全管理包括', '{\"A\":\"\\u8eab\\u4efd\\u8ba4\\u8bc1\",\"B\":\"\\u8bbf\\u95ee\\u6388\\u6743\",\"C\":\"\\u5b89\\u5168\\u5ba1\\u8ba1\",\"D\":\"\\u76d1\\u89c6\\u7edf\\u8ba1\"}', '[\"A\",\"B\",\"C\"]', 1, 39);
INSERT INTO `tp_multiple` VALUES (97, 'H3Cloud 高可靠性技术（HA）提供的功能包括', '{\"A\":\"\\u81ea\\u52a8\\u4fa6\\u6d4b\\u7269\\u7406\\u670d\\u52a1\\u5668\\u5931\\u6548\",\"B\":\"\\u81ea\\u52a8\\u4fa6\\u6d4b\\u7269\\u7406\\u7f51\\u7edc\\u5931\\u6548\",\"C\":\"\\u667a\\u80fd\\u9009\\u62e9\\u7269\\u7406\\u670d\\u52a1\\u5668\",\"D\":\"\\u81ea\\u52a8\\u4fa6\\u6d4b\\u865a\\u62df\\u673a\\u5931\\u6548\"}', '[\"A\",\"C\",\"D\"]', 1, 39);
INSERT INTO `tp_multiple` VALUES (98, '目前，选用开源的虚拟化产品组建虚拟化平台，构建基于硬件的虚拟化层，可以选用', '{\"A\":\"Xen\",\"B\":\"VMware\",\"C\":\"Hyper-v\",\"D\":\"Citrix\\u2002\"}', '[\"A\",\"D\"]', 1, 39);
INSERT INTO `tp_multiple` VALUES (99, '以下属于大数据处理结果展示方式的选项是', '{\"A\":\"\\u6807\\u7b7e\\u4e91\",\"B\":\"\\u805a\\u7c7b\\u56fe\",\"C\":\"\\u70ed\\u56fe\",\"D\":\"\\u7a7a\\u95f4\\u4fe1\\u606f\\u6d41\"}', '[\"A\",\"B\",\"C\"]', 1, 39);
INSERT INTO `tp_multiple` VALUES (100, '可伸缩性包括', '{\"A\":\"\\u529f\\u80fd\\u7684\\u4f38\\u7f29\",\"B\":\"\\u5bb9\\u91cf\\u7684\\u6269\\u5c55\",\"C\":\"\\u6027\\u80fd\\u7684\\u6269\\u5c55\",\"D\":\"\\u7cfb\\u7edf\\u7684\\u4f38\\u7f29\"}', '[\"A\",\"B\",\"C\",\"D\"]', 1, 39);
INSERT INTO `tp_multiple` VALUES (101, '未来云计算服务面向那些客户？', '{\"A\":\"\\u4e2a\\u4eba\\u2002\",\"B\":\"\\u4f01\\u4e1a\",\"C\":\"\\u653f\\u5e9c\",\"D\":\"\\u6559\\u80b2\"}', '[\"A\",\"B\",\"D\",\"C\"]', 1, 39);
INSERT INTO `tp_multiple` VALUES (102, '云计算可理解为', '{\"A\":\"\\u88ab\\u5c01\\u88c5\\u6210\\u4e00\\u4e2a\\u62bd\\u8c61\\u7684\\u5b9e\\u4f53\\u2002\",\"B\":\"\\u63d0\\u4f9b\\u4e0d\\u540c\\u7684\\u670d\\u52a1\\u6c34\\u5e73\\u7ed9\\u5916\\u90e8\\u7528\\u6237\\u4f7f\\u7528\",\"C\":\"\\u7531\\u89c4\\u6a21\\u5316\\u5e26\\u6765\\u7684\\u7ecf\\u6d4e\\u6027\",\"D\":\"\\u670d\\u52a1\\u53ef\\u4ee5\\u88ab\\u52a8\\u6001\\u914d\\u7f6e\"}', '[\"A\",\"B\",\"C\",\"D\"]', 1, 39);
INSERT INTO `tp_multiple` VALUES (103, '云计算体系结构中，最关键的两层是', '{\"A\":\"\\u7269\\u529b\\u8d44\\u6e90\\u5c42\",\"B\":\"\\u8d44\\u6e90\\u6c60\\u5c42\",\"C\":\"\\u7ba1\\u7406\\u4e2d\\u95f4\\u4ef6\",\"D\":\"SOA\\u6784\\u5efa\\u5c42\"}', '[\"C\",\"B\"]', 1, 39);
INSERT INTO `tp_multiple` VALUES (104, '云计算的优势体现在以下哪几个方面', '{\"A\":\"\\u8bbe\\u5907\\u6570\\u91cf\",\"B\":\"\\u8bbe\\u5907\\u6210\\u672c\",\"C\":\"\\u7ba1\\u7406\\u6210\\u672c\",\"D\":\"\\u8fd0\\u7ef4\\u6210\\u672c\"}', '[\"A\",\"D\",\"C\",\"B\"]', 1, 39);
INSERT INTO `tp_multiple` VALUES (105, 'Linux在企业中的应用 ', '{\"A\":\"linux\\u4f5c\\u4e3aInternet\\u7f51\\u7edc\\u670d\\u52a1\\u671f\\u7684\\u5e94\\u7528\",\"B\":\"linux\\u4f5c\\u4e3a\\u4e2d\\u5c0f\\u4f01\\u4e1a\\u5185\\u90e8\\u670d\\u52a1\\u5668\\u7684\\u5e94\\u7528\",\"C\":\"linux\\u4f5c\\u4e3a\\u684c\\u9762\\u73af\\u5883\\u7684\\u5e94\\u7528\",\"D\":\"Linux\\u4f5c\\u4e3a\\u8f6f\\u4ef6\\u5f00\\u53d1\\u73af\\u5883\\u7684\\u5e94\\u7528\"}', '[\"A\",\"D\",\"B\"]', 1, 39);
INSERT INTO `tp_multiple` VALUES (106, '云架构包含以下哪些?', '{\"A\":\"\\u57fa\\u7840\\u8bbe\\u65bd\\u5c42\",\"B\":\"\\u670d\\u52a1\\u5c42\",\"C\":\"\\u5e94\\u7528\\u5c42\",\"D\":\"\\u5e73\\u53f0\\u5c42\"}', '[\"A\",\"C\",\"D\"]', 1, 39);
INSERT INTO `tp_multiple` VALUES (107, '基于平台服务，这种“云”计算形式把开发环境或者运行平台也作为一种服务给用户提供。用户可以把自己的应用运行在提供者的基础设施中，例如（）等公司提供这种形式的服务', '{\"A\":\"Sunv\",\"B\":\"Amazon.com\",\"C\":\"YahooPipes\",\"D\":\"Salesforce.com\"}', '[\"C\",\"D\"]', 1, 39);
INSERT INTO `tp_multiple` VALUES (108, '硬盘种类分为哪几种', '{\"A\":\"\\u56fa\\u6001\\u786c\\u76d8\",\"B\":\"\\u79fb\\u52a8\\u786c\\u76d8\",\"C\":\"\\u5149\\u76d8\",\"D\":\"\\u673a\\u68b0\\u786c\\u76d8\"}', '[\"D\",\"B\",\"A\"]', 1, 39);

-- ----------------------------
-- Table structure for tp_news
-- ----------------------------
DROP TABLE IF EXISTS `tp_news`;
CREATE TABLE `tp_news`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `createTime` int NOT NULL COMMENT '时间戳',
  `author` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '作者 \r\n',
  `belongCourseId` int NULL DEFAULT NULL COMMENT '所属课程',
  `click` int NULL DEFAULT 0 COMMENT '点击量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tp_news
-- ----------------------------
INSERT INTO `tp_news` VALUES (4, '2020PHP考试题大全【PHP基础部分】 ', '<p style=\"border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"font-weight: 700; border: 0px; margin: 0px; padding: 0px;\">1、PHP语言的一大优势是跨平台，什么是跨平台？</span></p><p style=\"border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">PHP的运行环境最优搭配为Apache+MySQL+PHP，此运行环境可以在不同操作系统（例如windows、Linux等）上配置，不受操作系统的限制，所以叫跨平台</span></p><p style=\"border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"font-weight: 700; border: 0px; margin: 0px; padding: 0px;\">2、WEB开发中数据提交方式有几种？有什么区别？百度使用哪种方式？</span></p><p style=\"border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"font-weight: 700; border: 0px; margin: 0px; padding: 0px;\">Get与post两种方式</span></p><p style=\"border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">区别：</span></p><p style=\"border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">（1）url可见性：get 方式url参数可见，post 不可见</span></p><p style=\"border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">（2）可缓存性：get 方式是可以缓存的，post 方式不可以缓存。</span></p><p style=\"border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">（3）传输数据大小：get一般传输数据大小不超过2k-4k（根据浏览器不同，限制不一样，但相差不大）；post 请求传输数据的大小根据php.ini 配置文件设定，也可以无限大。</span></p><p style=\"border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">（4）数据传输上：get 方式通过url地址栏拼接参数进行传输，post 方式通过body体进行传输。</span></p><p style=\"border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">建议：</span></p><p style=\"border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">1、get式安全性较Post式要差些包含机密信息建议用Post数据提交式；</span></p><p style=\"border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">2、做数据查询建议用Get式；做数据添加、修改或删除建议用Post方式；</span></p><p style=\"border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">百度使用的get方式，因为可以从它的URL中看出</span></p><p style=\"border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">3、掌握PHP的哪些框架、模板引擎、系统等</span></p><p style=\"border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">框架：框架有很多，例如CI、Yii、Laravel等等，咱们学过的是thinkphp</span></p><p style=\"border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">模板引擎：也有很多，在课本中有，咱们学过的是smarty</span></p><p style=\"border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">系统：有很多，例如：康盛的产品（uchome、supesite、discuzX等），帝国系统、DEDE（织梦）、ecshop等，咱们学过的是DEDECMS、Ecshop</span></p><p><br/></p>', 1597824319, '梁展', 4, 0);
INSERT INTO `tp_news` VALUES (5, 'Java知识点相关文章收集', '<p><span style=\"color: rgb(77, 77, 77); font-family: &quot;Microsoft YaHei&quot;, &quot;SF Pro Display&quot;, Roboto, Noto, Arial, &quot;PingFang SC&quot;, sans-serif; font-size: 18px; font-variant-ligatures: common-ligatures; background-color: rgb(255, 255, 255);\">1）</span><a href=\"http://www.cnblogs.com/dolphin0520/p/3920373.html%20%E5%8E%9F%E6%96%87%E9%93%BE%E6%8E%A5\" style=\"box-sizing: border-box; outline: none; margin: 0px; padding: 0px; text-decoration-line: none; cursor: pointer; font-family: &quot;Microsoft YaHei&quot;, &quot;SF Pro Display&quot;, Roboto, Noto, Arial, &quot;PingFang SC&quot;, sans-serif; background-color: rgb(255, 255, 255); color: rgb(103, 149, 181); overflow-wrap: break-word; font-size: 18px; font-variant-ligatures: common-ligatures; white-space: normal;\">Java并发编程：volatile关键字解析</a><br/><span style=\"color: rgb(77, 77, 77); font-family: &quot;Microsoft YaHei&quot;, &quot;SF Pro Display&quot;, Roboto, Noto, Arial, &quot;PingFang SC&quot;, sans-serif; font-size: 18px; font-variant-ligatures: common-ligatures; background-color: rgb(255, 255, 255);\">（2）</span><a href=\"http://www.importnew.com/26613.html\" style=\"box-sizing: border-box; outline: none; margin: 0px; padding: 0px; text-decoration-line: none; cursor: pointer; font-family: &quot;Microsoft YaHei&quot;, &quot;SF Pro Display&quot;, Roboto, Noto, Arial, &quot;PingFang SC&quot;, sans-serif; background-color: rgb(255, 255, 255); color: rgb(103, 149, 181); overflow-wrap: break-word; font-size: 18px; font-variant-ligatures: common-ligatures; white-space: normal;\">Java中的异常</a><br/><span style=\"color: rgb(77, 77, 77); font-family: &quot;Microsoft YaHei&quot;, &quot;SF Pro Display&quot;, Roboto, Noto, Arial, &quot;PingFang SC&quot;, sans-serif; font-size: 18px; font-variant-ligatures: common-ligatures; background-color: rgb(255, 255, 255);\">（3）</span><a href=\"https://blog.csdn.net/suifeng3051/article/details/52611310\" style=\"box-sizing: border-box; outline: none; margin: 0px; padding: 0px; text-decoration-line: none; cursor: pointer; font-family: &quot;Microsoft YaHei&quot;, &quot;SF Pro Display&quot;, Roboto, Noto, Arial, &quot;PingFang SC&quot;, sans-serif; background-color: rgb(255, 255, 255); color: rgb(103, 149, 181); overflow-wrap: break-word; font-size: 18px; font-variant-ligatures: common-ligatures; white-space: normal;\">Java内存模型</a><br/><span style=\"color: rgb(77, 77, 77); font-family: &quot;Microsoft YaHei&quot;, &quot;SF Pro Display&quot;, Roboto, Noto, Arial, &quot;PingFang SC&quot;, sans-serif; font-size: 18px; font-variant-ligatures: common-ligatures; background-color: rgb(255, 255, 255);\">（4）</span><a href=\"https://www.cnblogs.com/bughui/p/7422214.html\" style=\"box-sizing: border-box; outline: none; margin: 0px; padding: 0px; text-decoration-line: none; cursor: pointer; font-family: &quot;Microsoft YaHei&quot;, &quot;SF Pro Display&quot;, Roboto, Noto, Arial, &quot;PingFang SC&quot;, sans-serif; background-color: rgb(255, 255, 255); color: rgb(103, 149, 181); overflow-wrap: break-word; font-size: 18px; font-variant-ligatures: common-ligatures; white-space: normal;\">并发与并行</a><br/><span style=\"color: rgb(77, 77, 77); font-family: &quot;Microsoft YaHei&quot;, &quot;SF Pro Display&quot;, Roboto, Noto, Arial, &quot;PingFang SC&quot;, sans-serif; font-size: 18px; font-variant-ligatures: common-ligatures; background-color: rgb(255, 255, 255);\">并行是我们物理时空观下的同时执行，而并发则是操作系统用线程这个模型抽象之后站在线程的视角上看到的“同时”执行（时间片轮转后的）</span><br/><span style=\"color: rgb(77, 77, 77); font-family: &quot;Microsoft YaHei&quot;, &quot;SF Pro Display&quot;, Roboto, Noto, Arial, &quot;PingFang SC&quot;, sans-serif; font-size: 18px; font-variant-ligatures: common-ligatures; background-color: rgb(255, 255, 255);\">（5）同步与异步</span><br/><span style=\"color: rgb(77, 77, 77); font-family: &quot;Microsoft YaHei&quot;, &quot;SF Pro Display&quot;, Roboto, Noto, Arial, &quot;PingFang SC&quot;, sans-serif; font-size: 18px; font-variant-ligatures: common-ligatures; background-color: rgb(255, 255, 255);\">同步:发送一个请求,等待返回,然后再发送下一个请求</span><br/><span style=\"color: rgb(77, 77, 77); font-family: &quot;Microsoft YaHei&quot;, &quot;SF Pro Display&quot;, Roboto, Noto, Arial, &quot;PingFang SC&quot;, sans-serif; font-size: 18px; font-variant-ligatures: common-ligatures; background-color: rgb(255, 255, 255);\">异步:发送一个请求,不等待返回,随时可以再发送下一个请求</span><br/><span style=\"color: rgb(77, 77, 77); font-family: &quot;Microsoft YaHei&quot;, &quot;SF Pro Display&quot;, Roboto, Noto, Arial, &quot;PingFang SC&quot;, sans-serif; font-size: 18px; font-variant-ligatures: common-ligatures; background-color: rgb(255, 255, 255);\">同步可以避免出现死锁，读脏数据的发生，一般共享某一资源的时候用，如果每个人都有修改权限，同时修改一个文件，有可能使一个人读取另一个人已经删除的内容，就会出错，同步就会按顺序来修改。</span><br/><span style=\"color: rgb(77, 77, 77); font-family: &quot;Microsoft YaHei&quot;, &quot;SF Pro Display&quot;, Roboto, Noto, Arial, &quot;PingFang SC&quot;, sans-serif; font-size: 18px; font-variant-ligatures: common-ligatures; background-color: rgb(255, 255, 255);\">异步则是可以提高效率了，现在cpu都是双核，四核，异步处理的话可以同时做多项工作，当然必须保证是可以并发处理的。</span><br/><span style=\"color: rgb(77, 77, 77); font-family: &quot;Microsoft YaHei&quot;, &quot;SF Pro Display&quot;, Roboto, Noto, Arial, &quot;PingFang SC&quot;, sans-serif; font-size: 18px; font-variant-ligatures: common-ligatures; background-color: rgb(255, 255, 255);\">比如广播，就是一个异步例子。发起者不关心接收者的状态。不需要等待接收者的返回信息</span><br/><span style=\"color: rgb(77, 77, 77); font-family: &quot;Microsoft YaHei&quot;, &quot;SF Pro Display&quot;, Roboto, Noto, Arial, &quot;PingFang SC&quot;, sans-serif; font-size: 18px; font-variant-ligatures: common-ligatures; background-color: rgb(255, 255, 255);\">电话，就是一个同步例子。发起者需要等待接收者，接通电话后，通信才开始。需要等待接收者的返回信息</span><br/><span style=\"color: rgb(77, 77, 77); font-family: &quot;Microsoft YaHei&quot;, &quot;SF Pro Display&quot;, Roboto, Noto, Arial, &quot;PingFang SC&quot;, sans-serif; font-size: 18px; font-variant-ligatures: common-ligatures; background-color: rgb(255, 255, 255);\">（6）</span><a href=\"https://blog.csdn.net/zzp_403184692/article/details/8184751\" style=\"box-sizing: border-box; outline: none; margin: 0px; padding: 0px; text-decoration-line: none; cursor: pointer; font-family: &quot;Microsoft YaHei&quot;, &quot;SF Pro Display&quot;, Roboto, Noto, Arial, &quot;PingFang SC&quot;, sans-serif; background-color: rgb(255, 255, 255); color: rgb(103, 149, 181); overflow-wrap: break-word; font-size: 18px; font-variant-ligatures: common-ligatures; white-space: normal;\">Java是值传递还是引用传递</a><br/><span style=\"color: rgb(77, 77, 77); font-family: &quot;Microsoft YaHei&quot;, &quot;SF Pro Display&quot;, Roboto, Noto, Arial, &quot;PingFang SC&quot;, sans-serif; font-size: 18px; font-variant-ligatures: common-ligatures; background-color: rgb(255, 255, 255);\">Java中所有的都是传值，当传的值的数据类型是对象时，传递的是该对象的引用，可以在调用的函数中用该引用来改变所指的对象中实际的值，但是不能为该对象引用本身赋值，因为赋值操作会改变引用所指向的对象不再为原来的对象，以后进行的改变在新对象上进行，无法达到修改原对象的目的。类似于Final修饰对象时，可以修改该对象的内容，但是不能修改该对象本身。（传对象是引用传递的只是把这种值传递但传递的值是一个引用的情况称为了引用传递）</span></p>', 1597824479, '梁洲文', 5, 0);
INSERT INTO `tp_news` VALUES (6, '软件工程复习重点', '<p>一、软件危机与软件工程：</p><p> 软件、软件危机、软件生存期、软件开发模型、软件管理 </p><p>1、 软件：软件是能够完成预定功能和性能的可执行的计算机程序    </p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;+使程序正常运行所需要的数据    </p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;+描述软件开发过程及其管理、程序的操作和使用的有关文档。</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  文档：分开发、管理、用户、维护文档，作用是记录及解决不可视性、通</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 信与交流、管理与维护、用户服务</p><p>2、 软件危机 </p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; a) 表现：软件成本高、难于控制开发进度、软件工作量估计困难、软件质量</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;低、软件修改维护困难 </p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;b) 原因：需求问题(描述不精确、理解不一致)、管理问题、方法和工具问题、</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 软件本身的特点</p><p>3、 软件生存期： </p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;a) 三个时期：定义时期(软件计划、需求分析)—&gt;开发时期(软件设计、编码实</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;现、测试)—&gt;使用和维护时期(维护) &nbsp;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;b) 六个阶段：软件计划需求分析设计编码测试使用与维护</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; c) 生命周期方法特点：顺序性、依赖性，推迟程序的物理实现、质量保证的观点</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(利于尽早发现错误，如阶段文档、评审) <br/></p><p>4、 软件开发模型 </p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; a) 瀑布模型：文档驱动 </p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;i. 阶段划分、分而治之、控制开发过程的复杂性 </p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ii. 自顶向下、由抽象到具体，顺序进行 </p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 优点：规范管理开发过程、文档驱动 </p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 缺点：初期系统的需求难以完全确定、文档驱动、周期长</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; b) 原型模型：</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  i. 针对：软件开发初期需求难以确定 </p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ii. 基本思想：快速建立原型，完善用户需求</p><p> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; iii. 优点：用户参与、快速 iv.</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 缺点：快速弱功能、对开发环境要求高 &nbsp;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;c) 螺旋模型(风险驱动) </p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;d) 增量模型(模块、功能驱动) </p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;e) 迭代模型 &nbsp; &nbsp;&nbsp;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; f) 喷泉模型 </p><p>5、 软件管理</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  a) 区别于其他工业产品生产管理的特点</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; b) 主要内容：开发计划与进度管理、文档管理、人员组织管理、成本管理、质量管理 <br/></p>', 1597825062, '陈海威', 3, 0);
INSERT INTO `tp_news` VALUES (7, '云计算要点简介', '<p style=\"margin-top: 1.4em; margin-bottom: 1.4em; color: rgb(26, 26, 26); font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"font-weight: 600;\">1. 云计算的本质就是按需服务 XaaS</span></p><p style=\"margin-top: 1.4em; margin-bottom: 1.4em; color: rgb(26, 26, 26); font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\">如图1，企业数据中心EDC可以简单分为5层L1-L4，依次为机房设施层、IT基础设施层、数据处理层、应用服务层。自建EDC所面临的主要挑战有建设难度高，业务上线时间长，运维管理复杂，系统扩容调整不灵活，以及总拥有成本TCO（CapEx、OpeEx与OppCost）较高，而总拥有价值TVO（IT带来的价值与收益）不明显。而云计算按需服务，按量付费，弹性扩展，自动化运维等特征正好为解决以上挑战提供很好的解决方案。</p><p style=\"margin-top: 1.4em; margin-bottom: 1.4em; color: rgb(26, 26, 26); font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"font-weight: 600;\">云计算的本质就是按需服务，一切皆服务 XaaS。</span>云计算有3类服务模式，基础设施即服务IaaS、平台即服务PaaS，以及软件即服务SaaS覆盖SaaS；其中IaaS覆盖L1、L2层，PaaS 覆盖L1-L3层，SaaS L1-L4层。云计算有4种部署模型：公有云，私有云、混合云与行业云，混合云是主要的趋势。企业从自建EDC向云计算转型，就是推动数据中心将从成本中心（降低TCO）向价值中心（增加TVO）转变。</p><p style=\"margin-top: 1.4em; margin-bottom: 1.4em; color: rgb(26, 26, 26); font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\">图1：数据中心分层模型</p><p><img src=\"/ueditor/php/upload/image/20200819/1597825258818192.jpg\" class=\"origin_image zh-lightbox-thumb lazy\" width=\"504\"/></p><p style=\"margin-top: 1.4em; margin-bottom: 1.4em; color: rgb(26, 26, 26); font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"font-weight: 600;\">2.</span>&nbsp;<span style=\"font-weight: 600;\">云计算的目标是像使用水和电一样使用IT</span></p><p style=\"margin-top: 1.4em; margin-bottom: 1.4em; color: rgb(26, 26, 26); font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\">2003年美国的尼古拉斯.卡尔在《IT不再重要》中提出，IT的发展历程与电力发展会非常相似（如图2）：会经历企业自建，部分租用，统一供应三个阶段。最终IT技术会像电力、自来水一样成为无处不在，简单易用，标准化且低成本的公共服务。届时IT将逐渐工具向效用转变，IT将不再重要，因为企业只需专注于在自己的核心业务领域构建竞争力，对IT只需按需使用，按量付费即可。当然，云计算的当前发展离像使用水和电一样使用IT还有很大一段距离，但这个目标未来可期。</p><p style=\"margin-top: 1.4em; margin-bottom: 1.4em; color: rgb(26, 26, 26); font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\">图2：IT与电力的发展历程</p><p><img src=\"https://pic4.zhimg.com/80/v2-5da8bc1a9ad8c9a0121ba09defde12a6_720w.jpg\" class=\"origin_image zh-lightbox-thumb lazy\" width=\"523\"/></p><p class=\"ztext-empty-paragraph\" style=\"margin-top: -0.8em; margin-bottom: -0.8em; color: rgb(26, 26, 26); font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\"><br/></p><p><br/></p>', 1597825286, '冯仁贵', 6, 0);

-- ----------------------------
-- Table structure for tp_paper
-- ----------------------------
DROP TABLE IF EXISTS `tp_paper`;
CREATE TABLE `tp_paper`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `paperName` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '试卷名',
  `belongCourseId` int NULL DEFAULT NULL COMMENT '所属科目',
  `examTime` int NOT NULL COMMENT '考试时间',
  `passScore` int NOT NULL COMMENT '及格分数',
  `totalScore` int NOT NULL COMMENT '总分',
  `createTime` int NOT NULL COMMENT '创建时间戳',
  `examCount` int NOT NULL DEFAULT 0 COMMENT '已考人数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tp_paper
-- ----------------------------
INSERT INTO `tp_paper` VALUES (22, '期末模拟考试卷（一）', 3, 60, 60, 100, 1597652687, 5);
INSERT INTO `tp_paper` VALUES (23, 'PHP动态网站期末考试卷（一）', 4, 60, 60, 100, 1597658490, 1);
INSERT INTO `tp_paper` VALUES (38, '手机APP期末测试卷(一)', 5, 60, 60, 100, 1597823674, 0);
INSERT INTO `tp_paper` VALUES (39, '智能园区系统集成期末考试卷', 6, 60, 60, 100, 1597816623, 0);

-- ----------------------------
-- Table structure for tp_single
-- ----------------------------
DROP TABLE IF EXISTS `tp_single`;
CREATE TABLE `tp_single`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `option` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ABCD选项使用json数组',
  `optionTrue` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'A',
  `score` int NOT NULL COMMENT '分数',
  `belongPaperId` int NOT NULL COMMENT '所属试卷',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 121 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tp_single
-- ----------------------------
INSERT INTO `tp_single` VALUES (6, '软件生存周期模型有多钟，下列选项中，（）不是软件生存周期模型。', '{\"A\":\"\\u87ba\\u65cb\\u6a21\\u578b\",\"B\":\"\\u589e\\u91cf\\u6a21\\u578b\",\"C\":\"\\u529f\\u80fd\\u6a21\\u578b\",\"D\":\"\\u7011\\u5e03\\u6a21\\u578b\"}', 'C', 1, 22);
INSERT INTO `tp_single` VALUES (7, '下说法错误的是（）。', '{\"A\":\"\\u589e\\u91cf\\u6a21\\u578b\\u662f\\u5728\\u7011\\u5e03\\u6a21\\u578b\\u7684\\u57fa\\u7840\\u4e0a\\u52a0\\u4ee5\\u4fee\\u6539\\u800c\\u5f62\\u6210\\u7684\\u2002\",\"B\":\"\\u589e\\u91cf\\u6a21\\u578b\\u63a8\\u8fdf\\u67d0\\u4e9b\\u9636\\u6bb5\\u6216\\u6240\\u6709\\u9636\\u6bb5\\u4e2d\\u7684\\u7ec6\\u8282\\uff0c\\u4ece\\u800c\\u8f83\\u65e9\\u5730\\u4ea7\\u751f\\u5de5\\u4f5c\\u8f6f\\u4ef6\\u2002\",\"C\":\"\\u7011\\u5e03\\u6a21\\u578b\\u548c\\u589e\\u91cf\\u6a21\\u578b\\u90fd\\u5c5e\\u4e8e\\u6574\\u4f53\\u5f00\\u53d1\\u6a21\\u578b\\u2002\",\"D\":\"\\u5e03\\u6a21\\u578b\\u89c4\\u5b9a\\u5728\\u5f00\\u59cb\\u4e0b\\u4e00\\u4e2a\\u9636\\u6bb5\\u7684\\u5de5\\u4f5c\\u4e4b\\u524d\\uff0c\\u5fc5\\u987b\\u5b8c\\u6210\\u524d\\u4e00\\u9636\\u6bb5\\u7684\\u6240\\u6709\\u7ec6\\u8282\"}', 'C', 1, 22);
INSERT INTO `tp_single` VALUES (8, '可行性分析中，系统流程图用于描述（）。', '{\"A\":\"\\u5f53\\u524d\\u8fd0\\u884c\\u7cfb\\u7edf\\u2002\",\"B\":\"\\u5f53\\u524d\\u903b\\u8f91\\u6a21\\u578b\",\"C\":\"\\u76ee\\u6807\\u7cfb\\u7edf\",\"D\":\"\\u65b0\\u7cfb\\u7edf\\u2002\"}', 'A', 1, 22);
INSERT INTO `tp_single` VALUES (9, '研究软硬件资源的有效性是进行（）研究的一方面。', '{\"A\":\"\\u6280\\u672f\\u53ef\\u884c\\u6027\",\"B\":\"\\u7ecf\\u6d4e\\u53ef\\u884c\\u6027\",\"C\":\"\\u793e\\u4f1a\\u53ef\\u884c\\u6027\",\"D\":\"\\u64cd\\u4f5c\\u53ef\\u884c\\u6027\"}', 'A', 1, 22);
INSERT INTO `tp_single` VALUES (10, '数据字典中，一般不包括下列选项中的（）条目。', '{\"A\":\"\\u6570\\u636e\\u6d41\",\"B\":\"\\u6570\\u636e\\u5b58\\u50a8\",\"C\":\"\\u52a0\\u5de5\",\"D\":\"\\u6e90\\u70b9\\u4e0e\\u7ec8\\u70b9\\u2002\"}', 'D', 1, 22);
INSERT INTO `tp_single` VALUES (11, 'SA方法的分析步骤是首先调查了解当前系统的工作流程，然后（）', '{\"A\":\"\\u83b7\\u5f97\\u5f53\\u524d\\u7cfb\\u7edf\\u7684\\u7269\\u7406\\u6a21\\u578b\\uff0c\\u62bd\\u8c61\\u51fa\\u5f53\\u524d\\u7cfb\\u7edf\\u7684\\u903b\\u8f91\\u6a21\\u578b\\uff0c\\u5efa\\u7acb\\u76ee\\u6807\\u7cfb\\u7edf\\u7684\\u903b\\u8f91\\u6a21\\u578b\\u2002\",\"B\":\"\\u83b7\\u5f97\\u5f53\\u524d\\u7cfb\\u7edf\\u7684\\u7269\\u7406\\u6a21\\u578b\\uff0c\\u62bd\\u8c61\\u51fa\\u76ee\\u6807\\u7cfb\\u7edf\\u7684\\u903b\\u8f91\\u6a21\\u578b\\uff0c\\u5efa\\u7acb\\u76ee\\u6807\\u7cfb\\u7edf\\u7684\\u7269\\u7406\\u6a21\\u578b\",\"C\":\"\\u83b7\\u5f97\\u5f53\\u524d\\u7cfb\\u7edf\\u7684\\u903b\\u8f91\\u6a21\\u578b\\uff0c\\u62bd\\u8c61\\u51fa\\u76ee\\u6807\\u7cfb\\u7edf\\u7684\\u7269\\u7406\\u6a21\\u578b\\uff0c\\u5efa\\u7acb\\u76ee\\u6807\\u7cfb\\u7edf\\u7684\\u903b\\u8f91\\u6a21\\u578b\",\"D\":\"\\u83b7\\u5f97\\u5f53\\u524d\\u7cfb\\u7edf\\u7684\\u903b\\u8f91\\u6a21\\u578b\\uff0c\\u62bd\\u8c61\\u51fa\\u76ee\\u6807\\u7cfb\\u7edf\\u7684\\u7269\\u7406\\u6a21\\u578b\\uff0c\\u5efa\\u7acb\\u76ee\\u6807\\u7cfb\\u7edf\\u7684\\u7269\\u7406\\u6a21\\u578b\\u2002\"}', 'A', 1, 22);
INSERT INTO `tp_single` VALUES (12, '通过（ ）可以完成数据流图的细化 。', '{\"A\":\"\\u7ed3\\u6784\\u5206\\u6790\\u2002\",\"B\":\"\\u529f\\u80fd\\u5206\\u89e3\\u2002\",\"C\":\"\\u6570\\u636e\\u5206\\u6790\",\"D\":\"\\u7cfb\\u7edf\\u5206\\u89e3\"}', 'B', 1, 22);
INSERT INTO `tp_single` VALUES (13, '对软件进行分解，是为了（）。 ', '{\"A\":\"\\u964d\\u4f4e\\u6a21\\u5757\\u7684\\u590d\\u6742\\u7a0b\\u5ea6\",\"B\":\"\\u964d\\u4f4e\\u6a21\\u5757\\u95f4\\u63a5\\u53e3\\u7684\\u590d\\u6742\\u7a0b\\u5ea6\",\"C\":\"\\u964d\\u4f4e\\u6a21\\u5757\\u7684\\u590d\\u6742\\u7a0b\\u5ea6\\uff0c\\u5e76\\u964d\\u4f4e\\u6a21\\u5757\\u95f4\\u63a5\\u53e3\\u7684\\u590d\\u6742\\u7a0b\\u5ea6\",\"D\":\"\\u964d\\u4f4e\\u6a21\\u5757\\u7684\\u590d\\u6742\\u7a0b\\u5ea6\\uff0c\\u5e76\\u63d0\\u9ad8\\u6a21\\u5757\\u95f4\\u63a5\\u53e3\\u7684\\u590d\\u6742\\u7a0b\\u5ea6\"}', 'C', 1, 22);
INSERT INTO `tp_single` VALUES (14, '为了提高模块的独立性，模块内部最好是（）。', '{\"A\":\"\\u903b\\u8f91\\u5185\\u805a\",\"B\":\"\\u65f6\\u95f4\\u5185\\u805a\\u2002\",\"C\":\"\\u529f\\u80fd\\u5185\\u805a\",\"D\":\"\\u901a\\u4fe1\\u5185\\u805a\"}', 'C', 1, 22);
INSERT INTO `tp_single` VALUES (15, '在软件结构设计完成后，对于下列说法，正确的是（）', '{\"A\":\"\\u975e\\u5355\\u4e00\\u529f\\u80fd\\u6a21\\u5757\\u7684\\u6247\\u5165\\u6570\\u5927\\u6bd4\\u8f83\\u597d\\uff0c\\u8bf4\\u660e\\u672c\\u6a21\\u5757\\u91cd\\u7528\\u7387\\u9ad8\\u2002\",\"B\":\"\\u5355\\u4e00\\u529f\\u80fd\\u7684\\u6a21\\u5757\\u6247\\u5165\\u9ad8\\u65f6\\u5e94\\u91cd\\u65b0\\u5206\\u89e3\\uff0c\\u4ee5\\u6d88\\u9664\\u63a7\\u5236\\u8026\\u5408\\u7684\\u60c5\\u51b5\\u2002\",\"C\":\"\\u4e00\\u4e2a\\u6a21\\u5757\\u7684\\u6247\\u51fa\\u592a\\u591a\\uff0c\\u8bf4\\u660e\\u8be5\\u6a21\\u5757\\u8fc7\\u5206\\u590d\\u6742\\uff0c\\u7f3a\\u5c11\\u4e2d\\u95f4\\u5c42\\u2002\",\"D\":\"\\u4e00\\u4e2a\\u6a21\\u5757\\u7684\\u6247\\u5165\\u592a\\u591a\\uff0c\\u8bf4\\u660e\\u8be5\\u6a21\\u5757\\u8fc7\\u5206\\u590d\\u6742\\uff0c\\u7f3a\\u5c11\\u4e2d\\u95f4\\u5c42\"}', 'C', 1, 22);
INSERT INTO `tp_single` VALUES (16, '在软件开发过程中，以下说法正确的是（ ）', '{\"A\":\"\\u7a0b\\u5e8f\\u6d41\\u7a0b\\u56fe\\u662f\\u9010\\u6b65\\u6c42\\u7cbe\\u7684\\u597d\\u5de5\\u5177\",\"B\":\"N-S\\u56fe\\u4e0d\\u53ef\\u80fd\\u4efb\\u610f\\u8f6c\\u79fb\\u63a7\\u5236\\uff0c\\u7b26\\u5408\\u7ed3\\u6784\\u5316\\u539f\\u5219\",\"C\":\"\\u5224\\u5b9a\\u8868\\u662f\\u4e00\\u79cd\\u901a\\u7528\\u7684\\u8bbe\\u8ba1\\u5de5\\u5177\",\"D\":\"\\u7a0b\\u5e8f\\u6d41\\u7a0b\\u56fe\\u548cN-S\\u56fe\\u90fd\\u4e0d\\u6613\\u8868\\u8fbe\\u6a21\\u5757\\u7684\\u5c42\\u6b21\\u7ed3\\u6784\"}', 'B', 1, 22);
INSERT INTO `tp_single` VALUES (17, '面向数据结构的设计方法（Jackson方法）是进行（）的形式化的方法。', '{\"A\":\"\\u7cfb\\u7edf\\u8bbe\\u8ba1\",\"B\":\"\\u8be6\\u7ec6\\u8bbe\\u8ba1\",\"C\":\"\\u8f6f\\u4ef6\\u8bbe\\u8ba1\",\"D\":\"\\u7f16\\u7801\"}', 'B', 1, 22);
INSERT INTO `tp_single` VALUES (18, '所有的对象可以成为各种对象类，每个对象类都定义了一组（）', '{\"A\":\"\\u8bf4\\u660e\",\"B\":\"\\u65b9\\u6cd5\",\"C\":\"\\u8fc7\\u7a0b\\u2002\",\"D\":\"\\u7c7b\\u578b\"}', 'B', 1, 22);
INSERT INTO `tp_single` VALUES (19, '以下说法错误的是（）', '{\"A\":\"\\u5bf9\\u8c61\\u5177\\u6709\\u5f88\\u5f3a\\u7684\\u8868\\u8fbe\\u80fd\\u529b\\u548c\\u63cf\\u8ff0\\u529f\\u80fd\",\"B\":\"\\u5bf9\\u8c61\\u662f\\u4eba\\u4eec\\u8981\\u8fdb\\u884c\\u7814\\u7a76\\u7684\\u4efb\\u4f55\\u4e8b\\u52a1\",\"C\":\"\\u5bf9\\u8c61\\u662f\\u5c01\\u88c5\\u7684\\u57fa\\u672c\\u5355\\u4f4d\",\"D\":\"\\u7c7b\\u5c01\\u88c5\\u6bd4\\u5bf9\\u8c61\\u5c01\\u88c5\\u66f4\\u5177\\u4f53\\u3001\\u66f4\\u7ec6\\u81f4\\u2002\"}', 'D', 1, 22);
INSERT INTO `tp_single` VALUES (20, '以下说法正确的是（）', '{\"A\":\"\\u529f\\u80fd\\u6a21\\u578b\\u8bf4\\u660e\\u5bf9\\u8c61\\u6a21\\u578b\\u4e2d\\u64cd\\u4f5c\\u7684\\u542b\\u4e49\",\"B\":\"\\u529f\\u80fd\\u6a21\\u578b\\u8bf4\\u660e\\u5bf9\\u8c61\\u6a21\\u578b\\u4e2d\\u64cd\\u4f5c\\u7684\\u542b\\u4e49\",\"C\":\"\\u529f\\u80fd\\u6a21\\u578b\\u8bf4\\u660e\\u52a8\\u6001\\u6a21\\u578b\\u4e2d\\u7ea6\\u675f\\u7684\\u542b\\u4e49\\u2002\",\"D\":\"\\u529f\\u80fd\\u6a21\\u578b\\u8bf4\\u660e\\u5bf9\\u8c61\\u6a21\\u578b\\u4e2d\\u52a8\\u4f5c\\u7684\\u610f\\u4e49\"}', 'B', 1, 22);
INSERT INTO `tp_single` VALUES (21, '以下说法错误的是（）', '{\"A\":\"\\u9762\\u5411\\u5bf9\\u8c61\\u65b9\\u6cd5\\u4e0d\\u4ec5\\u652f\\u6301\\u8fc7\\u7a0b\\u62bd\\u8c61\\uff0c\\u800c\\u4e14\\u652f\\u6301\\u6570\\u636e\\u62bd\\u8c61\",\"B\":\"\\u67d0\\u4e9b\\u9762\\u5411\\u5bf9\\u8c61\\u7684\\u7a0b\\u5e8f\\u8bbe\\u8ba1\\u8bed\\u8a00\\u8fd8\\u652f\\u6301\\u53c2\\u6570\\u5316\\u62bd\\u8c61\",\"C\":\"\\u4fe1\\u606f\\u9690\\u853d\\u901a\\u8fc7\\u5bf9\\u8c61\\u7684\\u5c01\\u88c5\\u6027\\u6765\\u5b9e\\u73b0\",\"D\":\"\\u5728\\u9762\\u5411\\u5bf9\\u8c61\\u65b9\\u6cd5\\u4e2d\\uff0c\\u7c7b\\u662f\\u6700\\u57fa\\u672c\\u7684\\u6a21\\u5757\"}', 'D', 1, 22);
INSERT INTO `tp_single` VALUES (22, '以下说法错误的是（）', '{\"A\":\"\\u591a\\u6001\\u6027\\u9632\\u6b62\\u4e86\\u7a0b\\u5e8f\\u76f8\\u4e92\\u4f9d\\u8d56\\u6027\\u800c\\u5e26\\u6765\\u7684\\u53d8\\u52a8\\u5f71\\u54cd\\u2002\",\"B\":\"\\u591a\\u6001\\u6027\\u662f\\u6307\\u76f8\\u540c\\u7684\\u64cd\\u4f5c\\u6216\\u51fd\\u6570\\u3001\\u8fc7\\u7a0b\\u53ef\\u4f5c\\u7528\\u4e8e\\u591a\\u79cd\\u7c7b\\u578b\\u7684\\u5bf9\\u8c61\\u4e0a\\u5e76\\u83b7\\u5f97\\u4e0d\\u540c\\u7684\\u7ed3\\u679c\",\"C\":\"\\u591a\\u6001\\u6027\\u4e0e\\u7ee7\\u627f\\u6027\\u76f8\\u7ed3\\u5408\\u4f7f\\u8f6f\\u4ef6\\u5177\\u6709\\u66f4\\u5e7f\\u6cdb\\u7684\\u91cd\\u7528\\u6027\\u548c\\u53ef\\u6269\\u5145\\u6027\",\"D\":\"\\u5c01\\u88c5\\u6027\\u662f\\u4fdd\\u8bc1\\u8f6f\\u4ef6\\u90e8\\u4ef6\\u5177\\u6709\\u4f18\\u826f\\u7684\\u6a21\\u5757\\u6027\\u7684\\u57fa\\u7840\\u2002\"}', 'A', 1, 22);
INSERT INTO `tp_single` VALUES (23, '软件可维护性的特征中相互矛盾的是（）。', '{\"A\":\"\\u53ef\\u4fee\\u6539\\u6027\\u548c\\u53ef\\u7406\\u89e3\\u6027\",\"B\":\"\\u53ef\\u6d4b\\u8bd5\\u6027\\u548c\\u53ef\\u7406\\u89e3\\u6027\",\"C\":\"\\u6548\\u7387\\u548c\\u53ef\\u4fee\\u6539\\u6027\",\"D\":\"\\u53ef\\u7406\\u89e3\\u6027\\u548c\\u53ef\\u8bfb\\u6027\"}', 'C', 1, 22);
INSERT INTO `tp_single` VALUES (24, '以下说法正确的是（）。', '{\"A\":\"\\u7ec4\\u88c5\\u7ed3\\u6784\\u53ef\\u7528\\u6765\\u63cf\\u8ff0\\u73b0\\u5b9e\\u4e16\\u754c\\u4e2d\\u7684\\u4e00\\u822c\\u7684\\u62bd\\u8c61\\u5173\\u7cfb\",\"B\":\"\\u5206\\u7c7b\\u7ed3\\u6784\\u53ef\\u7528\\u6765\\u63cf\\u8ff0\\u73b0\\u5b9e\\u4e16\\u754c\\u4e2d\\u7684\\u7c7b\\u7684\\u7ec4\\u6210\\u7684\\u62bd\\u8c61\\u5173\\u7cfb\",\"C\":\"\\u9762\\u5411\\u5bf9\\u8c61\\u7684\\u7ee7\\u627f\\u6027\\u662f\\u5b50\\u7c7b\\u81ea\\u52a8\\u5171\\u4eab\\u7236\\u7c7b\\u6570\\u636e\\u7ed3\\u6784\\u548c\\u65b9\\u6cd5\\u7684\\u673a\\u5236\\u2002\",\"D\":\"\\u9762\\u5411\\u5bf9\\u8c61\\u7684\\u552f\\u4e00\\u6027\\u662f\\u6307\\u5c06\\u5177\\u6709\\u4e00\\u81f4\\u6027\\u7684\\u6570\\u636e\\u7ed3\\u6784\\uff08\\u5c5e\\u6027\\uff09\\u548c\\u884c\\u4e3a\\uff08\\u64cd\\u4f5c\\uff09\\u7684\\u5bf9\\u8c61\\u62bd\\u8c61\\u6210\\u7c7b\\u2002\"}', 'C', 1, 22);
INSERT INTO `tp_single` VALUES (25, '以下说法错误的是（）', '{\"A\":\"\\u9762\\u5411\\u5bf9\\u8c61\\u5206\\u6790\\u4e0e\\u9762\\u5411\\u5bf9\\u8c61\\u8bbe\\u8ba1\\u7684\\u884c\\u533b\\u6ca1\\u6709\\u660e\\u663e\\u533a\\u522b\\u2002\",\"B\":\"\\u5728\\u5b9e\\u9645\\u7684\\u8f6f\\u4ef6\\u5f00\\u53d1\\u8fc7\\u7a0b\\u4e2d\\u9762\\u5411\\u5bf9\\u8c61\\u5206\\u6790\\u4e0e\\u9762\\u5411\\u5bf9\\u8c61\\u8bbe\\u8ba1\\u7684\\u754c\\u9650\\u662f\\u6a21\\u7cca\\u7684\",\"C\":\"\\u9762\\u5411\\u5bf9\\u8c61\\u5206\\u6790\\u548c\\u9762\\u5411\\u5bf9\\u8c61\\u8bbe\\u8ba1\\u6d3b\\u52a8\\u4e00\\u4e2a\\u591a\\u6b21\\u8fed\\u4ee3\\u7684\\u8fc7\\u7a0b\",\"D\":\"\\u4ece\\u9762\\u5411\\u5bf9\\u8c61\\u5206\\u6790\\u5230\\u9762\\u5411\\u5bf9\\u8c61\\u8bbe\\u8ba1\\uff0c\\u662f\\u4e00\\u4e2a\\u9010\\u6e10\\u6269\\u5145\\u6a21\\u578b\\u7684\\u8fc7\\u7a0b\"}', 'A', 1, 22);
INSERT INTO `tp_single` VALUES (26, '软件是（）', '{\"A\":\"\\u5904\\u7406\\u5bf9\\u8c61\\u548c\\u5904\\u7406\\u89c4\\u5219\\u7684\\u63cf\\u8ff0\",\"B\":\"\\u7a0b\\u5e8f\",\"C\":\"\\u7a0b\\u5e8f\\u53ca\\u5176\\u6587\\u6863\",\"D\":\"\\u8ba1\\u7b97\\u673a\\u7cfb\\u7edf\"}', 'C', 1, 22);
INSERT INTO `tp_single` VALUES (27, '软件需求规格说明的内容不应包括（）。', '{\"A\":\"\\u4e3b\\u8981\\u529f\\u80fd\",\"B\":\"\\u7b97\\u6cd5\\u7684\\u8be6\\u7ec6\\u63cf\\u8ff0\\u2002\",\"C\":\"\\u7528\\u6237\\u754c\\u9762\\u53ca\\u8fd0\\u884c\\u73af\\u5883\",\"D\":\"\\u8f6f\\u4ef6\\u7684\\u6027\\u80fd\\u2002\"}', 'B', 1, 22);
INSERT INTO `tp_single` VALUES (28, '程序的三种基本控制结构是（）。', '{\"A\":\"\\u8fc7\\u7a0b\\u3001\\u5b50\\u7a0b\\u5e8f\\u548c\\u5206\\u7a0b\\u5e8f\",\"B\":\"\\u987a\\u5e8f\\u3001\\u9009\\u62e9\\u548c\\u91cd\\u590d\",\"C\":\"\\u9012\\u5f52\\u3001\\u8fed\\u4ee3\\u548c\\u56de\\u6eaf\\u2002\",\"D\":\"\\u8c03\\u7528\\u3001\\u8fd4\\u56de\\u548c\\u8f6c\\u79fb\"}', 'B', 1, 22);
INSERT INTO `tp_single` VALUES (29, '面向对象的分析方法主要是建立三类模型，即()。', '{\"A\":\"\\u7cfb\\u7edf\\u6a21\\u578b\\u3001ER\\u6a21\\u578b\\u3001\\u5e94\\u7528\\u6a21\\u578b\\u2002\",\"B\":\"\\u5bf9\\u8c61\\u6a21\\u578b\\u3001\\u52a8\\u6001\\u6a21\\u578b\\u3001\\u5e94\\u7528\\u6a21\\u578b\\u2002\",\"C\":\"\\uff25-\\uff32\\u6a21\\u578b\\u3001\\u5bf9\\u8c61\\u6a21\\u578b\\u3001\\u529f\\u80fd\\u6a21\\u578b\\u2002\",\"D\":\"\\u5bf9\\u8c61\\u6a21\\u578b\\u3001\\u52a8\\u6001\\u6a21\\u578b\\u3001\\u529f\\u80fd\\u6a21\\u578b\\u2002\"}', 'D', 1, 22);
INSERT INTO `tp_single` VALUES (30, '在E-R模型中，包含以下基本成分()。', '{\"A\":\"\\u6570\\u636e\\u3001\\u5bf9\\u8c61\\u3001\\u5b9e\\u4f53\",\"B\":\"\\u63a7\\u5236\\u3001\\u8054\\u7cfb\\u3001\\u5bf9\\u8c61\",\"C\":\"\\u5b9e\\u4f53\\u3001\\u8054\\u7cfb\\u3001\\u5c5e\\u6027\",\"D\":\"\\u5b9e\\u4f53\\u3001\\u5c5e\\u6027\\u3001\\u64cd\\u4f5c\"}', 'C', 1, 22);
INSERT INTO `tp_single` VALUES (31, '各种软件维护的类型中最重要的是()。', '{\"A\":\"\\u5b8c\\u5584\\u6027\\u7ef4\\u62a4\\u2002\",\"B\":\"\\u7ea0\\u9519\\u6027\\u7ef4\\u62a4\",\"C\":\"\\u9002\\u5e94\\u6027\\u7ef4\\u62a4\",\"D\":\"\\u9884\\u9632\\u6027\\u7ef4\\u62a4\"}', 'A', 1, 22);
INSERT INTO `tp_single` VALUES (32, '软件测试的目标是（）。', '{\"A\":\"\\u8bc1\\u660e\\u8f6f\\u4ef6\\u662f\\u6b63\\u786e\\u7684\",\"B\":\"\\u53d1\\u73b0\\u9519\\u8bef\\u3001\\u964d\\u4f4e\\u9519\\u8bef\\u5e26\\u6765\\u7684\\u98ce\\u9669\\u2002\",\"C\":\"\\u6392\\u9664\\u8f6f\\u4ef6\\u4e2d\\u6240\\u6709\\u7684\\u9519\\u8bef\",\"D\":\"\\u4e0e\\u8f6f\\u4ef6\\u8c03\\u8bd5\\u76f8\\u540c\"}', 'B', 1, 22);
INSERT INTO `tp_single` VALUES (33, '软件生命周期中所花费用最多的阶段是（）', '{\"A\":\"\\u8be6\\u7ec6\\u8bbe\\u8ba1\",\"B\":\"\\u8f6f\\u4ef6\\u7f16\\u7801\\u2002\",\"C\":\"\\u8f6f\\u4ef6\\u6d4b\\u8bd5\",\"D\":\"\\u8f6f\\u4ef6\\u7ef4\\u62a4\"}', 'D', 1, 22);
INSERT INTO `tp_single` VALUES (34, '若有一个计算类型的程序，它的输入量只有一个X，其范围是[-1.0, 1.0]，现从输入的角度考虑一组测试用例：-1.001, -1.0, 1.0, 1.001.设计这组测试用例的方法是（）', '{\"A\":\"\\u6761\\u4ef6\\u8986\\u76d6\\u6cd5\",\"B\":\"\\u7b49\\u4ef7\\u5206\\u7c7b\\u6cd5\",\"C\":\"\\u8fb9\\u754c\\u503c\\u5206\\u6790\\u6cd5\\u2002\\u2002\\u2002\\u2002\",\"D\":\"\\u9519\\u8bef\\u63a8\\u6d4b\\u6cd5\"}', 'C', 1, 22);
INSERT INTO `tp_single` VALUES (35, '详细设计的基本任务是确定每个模块的()设计 ', '{\"A\":\"\\u529f\\u80fd\",\"B\":\"\\u8c03\\u7528\\u5173\\u7cfb\",\"C\":\"\\u8f93\\u5165\\u8f93\\u51fa\\u6570\\u636e\",\"D\":\"\\u7b97\\u6cd5\"}', 'D', 1, 22);
INSERT INTO `tp_single` VALUES (36, '设函数C（X）定义问题X的复杂程序，函数E（X）确定解决问题X需要的工作量（时间）。对于两个问题P1和P2，如果C（P1）>C（P2）显然E（P1）>E（P2）,则得出结论E（P1+P2）>E（P1）+E（P2）就是：（）。', '{\"A\":\"\\u6a21\\u5757\\u5316\\u7684\\u6839\\u636e\",\"B\":\"\\u9010\\u6b65\\u6c42\\u7cbe\\u7684\\u6839\\u636e\",\"C\":\"\\u62bd\\u8c61\\u7684\\u6839\\u636e\",\"D\":\"\\u4fe1\\u606f\\u9690\\u85cf\\u548c\\u5c40\\u90e8\\u5316\\u7684\\u6839\\u636e\"}', 'A', 1, 22);
INSERT INTO `tp_single` VALUES (37, '下面几种白箱测试技术，哪种是最强的覆盖准则 （）', '{\"A\":\"\\u8bed\\u53e5\\u8986\\u76d6\",\"B\":\"\\u6761\\u4ef6\\u8986\\u76d6\",\"C\":\"\\u5224\\u5b9a\\u8986\\u76d6\",\"D\":\"\\u6761\\u4ef6\\u7ec4\\u5408\\u8986\\u76d6\\u2002\"}', 'D', 1, 22);
INSERT INTO `tp_single` VALUES (38, '面向数据流的设计方法把（）映射成软件结构。', '{\"A\":\"\\u6570\\u636e\\u6d41\",\"B\":\"\\u7cfb\\u7edf\\u7ed3\\u6784\",\"C\":\"\\u63a7\\u5236\\u7ed3\\u6784\",\"D\":\"\\u4fe1\\u606f\\u6d41\\u2002\"}', 'A', 1, 22);
INSERT INTO `tp_single` VALUES (39, '内聚程度最低的是()内聚', '{\"A\":\"\\u5076\\u7136\",\"B\":\"\\u8fc7\\u7a0b\\u2002\",\"C\":\"\\u987a\\u5e8f\",\"D\":\"\\u65f6\\u95f4\"}', 'A', 1, 22);
INSERT INTO `tp_single` VALUES (40, '确定测试计划是在()阶段制定的', '{\"A\":\"\\u603b\\u4f53\\u8bbe\\u8ba1\",\"B\":\"\\u8be6\\u7ec6\\u8bbe\\u8ba1\",\"C\":\"\\u7f16\\u7801\",\"D\":\"\\u6d4b\\u8bd5\"}', 'A', 1, 22);
INSERT INTO `tp_single` VALUES (41, '需求分析的产品是（）。', '{\"A\":\"\\u6570\\u636e\\u6d41\\u7a0b\\u56fe\\u6848\",\"B\":\"\\u6570\\u636e\\u5b57\\u5178\",\"C\":\"\\u5224\\u5b9a\\u8868\",\"D\":\"\\u9700\\u6c42\\u89c4\\u683c\\u8bf4\\u660e\\u4e66\\u2002\"}', 'D', 1, 22);
INSERT INTO `tp_single` VALUES (42, '数据字典是软件需求分析阶段的最重要工具之一，其最基本的功能是（）', '{\"A\":\"\\u6570\\u636e\\u5e93\\u8bbe\\u8ba1\",\"B\":\"\\u6570\\u636e\\u901a\\u4fe1\\u2002\",\"C\":\"\\u6570\\u636e\\u5b9a\\u4e49\",\"D\":\"\\u6570\\u636e\\u7ef4\\u62a4\"}', 'C', 1, 22);
INSERT INTO `tp_single` VALUES (43, '()引入了“风险驱动”的思想，适用于大规模的内部开发项目。', '{\"A\":\"\\u589e\\u91cf\\u6a21\\u578b\",\"B\":\"\\u55b7\\u6cc9\\u6a21\\u578b\",\"C\":\"\\u539f\\u578b\\u6a21\\u578b\",\"D\":\"\\u87ba\\u65cb\\u6a21\\u578b\"}', 'D', 1, 22);
INSERT INTO `tp_single` VALUES (44, '模块的内聚性最高的是（）。', '{\"A\":\"\\u903b\\u8f91\\u5185\\u805a\",\"B\":\"\\u65f6\\u95f4\\u5185\\u805a\",\"C\":\"\\u5076\\u7136\\u5185\\u805a\",\"D\":\"\\u529f\\u80fd\\u5185\\u805a\"}', 'D', 1, 22);
INSERT INTO `tp_single` VALUES (45, '提高测试的有效性非常重要,成功的测试是指() 。', '{\"A\":\"\\u8bc1\\u660e\\u4e86\\u88ab\\u6d4b\\u8bd5\\u7a0b\\u5e8f\\u6b63\\u786e\\u65e0\\u8bef\\u2002\",\"B\":\"\\u8bf4\\u660e\\u4e86\\u88ab\\u6d4b\\u8bd5\\u7a0b\\u5e8f\\u7b26\\u5408\\u76f8\\u5e94\\u7684\\u8981\\u6c42\",\"C\":\"\\u672a\\u53d1\\u73b0\\u88ab\\u6d4b\\u7a0b\\u5e8f\\u7684\\u9519\\u8bef\",\"D\":\"\\u53d1\\u73b0\\u4e86\\u81f3\\u4eca\\u4e3a\\u6b62\\u5c1a\\u672a\\u53d1\\u73b0\\u7684\\u9519\\u8bef\"}', 'D', 1, 22);
INSERT INTO `tp_single` VALUES (71, 'LAMP的含义中,以下哪项是完全正确的? (       )', '{\"A\":\"linux+access+mysql+php\",\"B\":\"linux+apache+mssql+php\",\"C\":\"linux+apache+mysql+php\",\"D\":\"linux+access+mssql+php\"}', 'C', 1, 23);
INSERT INTO `tp_single` VALUES (72, '下列哪些是PHP的配置文件?(       )', '{\"A\":\"php.exe\",\"B\":\"php.ini\",\"C\":\"php_mysql.dll\",\"D\":\"php_mysqli.dll\"}', 'B', 1, 23);
INSERT INTO `tp_single` VALUES (73, '下列哪个才是apache的配置文件?(       )', '{\"A\":\"php.ini\",\"B\":\"httpd.conf\",\"C\":\"apache.exe\",\"D\":\"mysql.exe\"}', 'B', 1, 23);
INSERT INTO `tp_single` VALUES (74, 'PHP中整数型数据类型,在32位操作系统中表示的范围是多少?(       )', '{\"A\":\"-256\\u5230256\",\"B\":\"-1024\\u52301024\",\"C\":\"-32767\\u523032767\",\"D\":\"-2147483648\\u5230214748364\"}', 'D', 1, 23);
INSERT INTO `tp_single` VALUES (75, 'PHP中应该如何声明变量?(       )', '{\"A\":\"\\u91c7\\u7528$\\u53f7\\u5f00\\u5934\\u540e\\u9762\\u8ddf\\u53d8\\u91cf\\u540d\",\"B\":\"\\u91c7\\u7528var\\u5f00\\u5934\\u540e\\u9762\\u8ddf\\u53d8\\u91cf\\u540d\",\"C\":\"\\u91c7\\u7528declare\\u5f00\\u5934\\u540e\\u9762\\u8ddf\\u53d8\\u91cf\\u540d\",\"D\":\"\\u76f4\\u63a5\\u5199\\u51fa\\u53d8\\u91cf\\u540d\\u5c31\\u53ef\\u4ee5\"}', 'A', 1, 23);
INSERT INTO `tp_single` VALUES (76, '字符串定界符用什么符号表示？(       )', '{\"A\":\"=>\",\"B\":\"<<<\",\"C\":\">>\",\"D\":\"<<\"}', 'B', 1, 23);
INSERT INTO `tp_single` VALUES (77, 'PHP哪个函数能取得字符串长度?(       )', '{\"A\":\"strrev\",\"B\":\"substr\",\"C\":\"strlen\",\"D\":\"strchr\"}', 'C', 1, 23);
INSERT INTO `tp_single` VALUES (78, 'PHP字符串连接运算符是？(       )', '{\"A\":\"+\",\"B\":\".\",\"C\":\"&\",\"D\":\"\\uff01\"}', 'B', 1, 23);
INSERT INTO `tp_single` VALUES (79, '哪些是MySQL自带的数据库?(       )', '{\"A\":\"information_schema\",\"B\":\"sanguo\",\"C\":\"tempdb\",\"D\":\"master\"}', 'A', 1, 23);
INSERT INTO `tp_single` VALUES (80, '关于PHP中的各种循环,说法正确的是？(       )', '{\"A\":\"foreach\\u8bed\\u53e5\\u7528\\u4e8e\\u5faa\\u73af\\u904d\\u5386\\u6570\\u7ec4\",\"B\":\"do...while\\u662f\\u5148\\u5224\\u65ad\\u518d\\u8fd0\\u884c\\u5faa\\u73af\",\"C\":\"while\\u662f\\u5148\\u5faa\\u73af\\u518d\\u5224\\u65ad\\u6761\\u4ef6\",\"D\":\"for\\u5faa\\u73af\\u662f\\u6761\\u4ef6\\u5224\\u65ad\\u578b\\u7684\\u5faa\\u73af,\\u8ddfwhile\\u76f8\\u4f3c\"}', 'A', 1, 23);
INSERT INTO `tp_single` VALUES (81, '以下哪些是PHP的会话控制技术?(       )', '{\"A\":\"Cookie\",\"B\":\"Session\",\"C\":\"Application\",\"D\":\"Server\"}', 'B', 1, 23);
INSERT INTO `tp_single` VALUES (82, 'mysql的非(取反)运算符是？(       )', '{\"A\":\"and\",\"B\":\"or\",\"C\":\"&&\",\"D\":\"not\"}', 'D', 1, 23);
INSERT INTO `tp_single` VALUES (83, '在mysql的like结构中允许使用两种类型的通配符,除了_,还有哪个?(       )', '{\"A\":\"%\",\"B\":\"#\",\"C\":\"&\",\"D\":\"@\"}', 'A', 1, 23);
INSERT INTO `tp_single` VALUES (84, 'php哪个函数用于向mysql数据库发送指令?(       )', '{\"A\":\"mysql_select_db\",\"B\":\"mysql_connect\",\"C\":\"mysql_query\",\"D\":\"mysql_fetch_field\"}', 'C', 1, 23);
INSERT INTO `tp_single` VALUES (85, 'php连接上mysql之后,采用哪个函数配置循环可以得到指定表中的记录?(       )', '{\"A\":\"mysql_fetch_row\",\"B\":\"mysql_select_db\",\"C\":\"mysql_query\",\"D\":\"mysql_connect\"}', 'A', 1, 23);
INSERT INTO `tp_single` VALUES (86, 'php中哪个函数用于读取整个文件?(       )', '{\"A\":\"fgetss\",\"B\":\"fgets\",\"C\":\"fread\",\"D\":\"readfile()\"}', 'D', 1, 23);
INSERT INTO `tp_single` VALUES (87, 'PHP对目录进行操作时,先用哪个函数对操作目录进行是否存在的判断?(       )', '{\"A\":\"file_exists\",\"B\":\"is_dir\",\"C\":\"fopen\",\"D\":\"fclose\"}', 'B', 1, 23);
INSERT INTO `tp_single` VALUES (88, 'PHP连接mysql的连接函数mysql_connect的第三个参数是？(       )', '{\"A\":\"\\u4e3b\\u673a\\u540d\",\"B\":\"\\u6570\\u636e\\u5e93\\u5bc6\\u7801\",\"C\":\"\\u6570\\u636e\\u5e93\\u8981\\u7528\\u6237\\u540d\",\"D\":\"\\u62a5\\u9519\\u4fe1\\u606f\"}', 'B', 1, 23);
INSERT INTO `tp_single` VALUES (89, '正则表达式的行尾定位符是？(       )', '{\"A\":\"$\",\"B\":\"@\",\"C\":\"#\",\"D\":\"&\"}', 'A', 1, 23);
INSERT INTO `tp_single` VALUES (90, 'PHP中声明一个类,用以下关键字来进行声明？(       )', '{\"A\":\"$\",\"B\":\"class\",\"C\":\"public\",\"D\":\"echo\"}', 'B', 1, 23);
INSERT INTO `tp_single` VALUES (91, 'php向文本文件写入内容,应该采用哪个文件操作函数?(       )', '{\"A\":\"fclose()\",\"B\":\"fwrite()\",\"C\":\"fopen()\",\"D\":\"file()\"}', 'B', 1, 23);
INSERT INTO `tp_single` VALUES (92, 'PHP中类的继承是通过哪个关键字来实现的?(       )', '{\"A\":\"final\",\"B\":\"private\",\"C\":\"extends\",\"D\":\"interface\"}', 'C', 1, 23);
INSERT INTO `tp_single` VALUES (93, '哪个方法可以实现PHP中类的自动加载功能?(       )', '{\"A\":\"implements\",\"B\":\"extends\",\"C\":\"_ _autoload\",\"D\":\"interfaces\"}', 'C', 1, 23);
INSERT INTO `tp_single` VALUES (94, 'PHP中的域运算符号是？(       )', '{\"A\":\"@@\",\"B\":\"::\",\"C\":\"**\",\"D\":\"##\"}', 'B', 1, 23);
INSERT INTO `tp_single` VALUES (95, '判断某个类是否存在的函数为？(       )', '{\"A\":\"class_exists\",\"B\":\"file_exists\",\"C\":\"is_dir\",\"D\":\"interface_existd\"}', 'A', 1, 23);
INSERT INTO `tp_single` VALUES (96, 'mysql中auto_increment单词表示什么含义?(       )', '{\"A\":\"\\u4e3b\\u952e\",\"B\":\"\\u81ea\\u52a8\\u589e\\u957f\",\"C\":\"\\u975e\\u7a7a\\u7ea6\\u675f\",\"D\":\"\\u6279\\u91cf\\u5bfc\\u5165\"}', 'B', 1, 23);
INSERT INTO `tp_single` VALUES (97, 'PHP中的构造函数为？(       )', '{\"A\":\"_ _construct\",\"B\":\"_ _destruct\",\"C\":\"_ _autoload\",\"D\":\"\\u8ddf\\u7c7b\\u540d\\u76f8\\u540c\"}', 'A', 1, 23);
INSERT INTO `tp_single` VALUES (98, 'smarty模板文件的后缀名为？(       )', '{\"A\":\".html\",\"B\":\".tpl\",\"C\":\".exe\",\"D\":\".conf\"}', 'B', 1, 23);
INSERT INTO `tp_single` VALUES (99, 'PHP中检测某文件是否存在的函数为？(       )', '{\"A\":\"class_exists\",\"B\":\"file_exists\",\"C\":\"is_dir\",\"D\":\"get_class\"}', 'B', 1, 23);
INSERT INTO `tp_single` VALUES (100, 'PHP如果要实现网站常见的翻页功能,mysql中的哪个子句是必不可少的?(       )', '{\"A\":\"order\",\"B\":\"having\",\"C\":\"limit\",\"D\":\"using\"}', 'C', 1, 23);
INSERT INTO `tp_single` VALUES (101, '判断某类中是否存在指定的方法应该选择哪个函数?(       )', '{\"A\":\"A)class_exists\",\"B\":\"file_exists\",\"C\":\"interface_exists\",\"D\":\"method_exists\"}', 'D', 1, 23);
INSERT INTO `tp_single` VALUES (102, '下列哪些关键字表示右外连接?(       )', '{\"A\":\"leftjoin\",\"B\":\"rightjoin\",\"C\":\"innerjoin\",\"D\":\"using\"}', 'B', 1, 23);
INSERT INTO `tp_single` VALUES (103, '哪些为smarty中的赋值方法?(       )', '{\"A\":\"display\",\"B\":\"assign\",\"C\":\"left_delimiter\",\"D\":\"right_delimiter\"}', 'B', 1, 23);
INSERT INTO `tp_single` VALUES (104, 'PHP对文件进行操作是,先用哪个函数对操作文件进行是否存在的判断?(       )', '{\"A\":\"f_getc\",\"B\":\"file_exists\",\"C\":\"fopen\",\"D\":\"fclose\"}', 'B', 1, 23);
INSERT INTO `tp_single` VALUES (105, 'mysql中的groupby语句的功能是？(       )', '{\"A\":\"\\u6392\\u5e8f\",\"B\":\"\\u6a21\\u7cca\\u67e5\\u8be2\",\"C\":\"\\u5206\\u7ec4\",\"D\":\"\\u6279\\u91cf\\u5bfc\\u5165\"}', 'C', 1, 23);
INSERT INTO `tp_single` VALUES (106, 'PHP中调用类方法的符号是？(       )', '{\"A\":\"&&\",\"B\":\"->\",\"C\":\"**\",\"D\":\"<-\"}', 'B', 1, 23);
INSERT INTO `tp_single` VALUES (107, 'PHP中类的属性含义正确的是？(       )', '{\"A\":\"\\u7c7b\\u7684\\u5c5e\\u6027\\u5b9e\\u8d28\\u5c31\\u662f\\u7c7b\\u4e2d\\u7684\\u53d8\\u91cf\",\"B\":\"\\u7c7b\\u7684\\u5c5e\\u6027\\u5b9e\\u8d28\\u5c31\\u662f\\u7c7b\\u4e2d\\u7684\\u65b9\\u6cd5\",\"C\":\"\\u7c7b\\u7684\\u5c5e\\u6027\\u5b9e\\u8d28\\u5c31\\u662f\\u7c7b\\u7684\\u5b50\\u7c7b\",\"D\":\"\\u7c7b\\u7684\\u5c5e\\u6027\\u5b9e\\u8d28\\u5c31\\u662f\\u540d\"}', 'A', 1, 23);
INSERT INTO `tp_single` VALUES (108, 'echo ceil(0.60);返回值为？(       )', '{\"A\":\"6\",\"B\":\"1\",\"C\":\"0\",\"D\":\"0.2\"}', 'B', 1, 23);
INSERT INTO `tp_single` VALUES (109, 'mysqlint数据类型当中所占用字节数最小的为?(       )', '{\"A\":\"smallint\",\"B\":\"bigint\",\"C\":\"tinyint\",\"D\":\"int\"}', 'C', 1, 23);
INSERT INTO `tp_single` VALUES (110, '在？：运算符当中,表达式应该写在哪里?(       )', '{\"A\":\"?\\u53f7\\u524d\\u9762\\u7684\\u4f4d\\u7f6e\",\"B\":\"?\\u53f7\\u540e\\u9762,:\\u53f7\\u524d\\u9762\\u7684\\u4f4d\\u7f6e\",\"C\":\":\\u53f7\\u540e\\u9762\\u7684\\u4f4d\\u7f6e\",\"D\":\"?:\\u4e0d\\u662f\\u8fd0\\u7b97\\u7b26\"}', 'A', 1, 23);
INSERT INTO `tp_single` VALUES (111, '?:运算符相当于以下哪个PHP语句?(       )', '{\"A\":\"if...else\",\"B\":\"switch\",\"C\":\"for\",\"D\":\"break\"}', 'A', 1, 23);
INSERT INTO `tp_single` VALUES (112, 'php运算符中，优先级从高到低分别是?(       )', '{\"A\":\"\\u5173\\u7cfb\\u8fd0\\u7b97\\u7b26\\uff0c\\u903b\\u8f91\\u8fd0\\u7b97\\u7b26\\uff0c\\u7b97\\u672f\\u8fd0\\u7b97\\u7b26\",\"B\":\"\\u7b97\\u672f\\u8fd0\\u7b97\\u7b26\\uff0c\\u5173\\u7cfb\\u8fd0\\u7b97\\u7b26\\uff0c\\u903b\\u8f91\\u8fd0\\u7b97\\u7b26\",\"C\":\"\\u903b\\u8f91\\u8fd0\\u7b97\\u7b26\\uff0c\\u7b97\\u672f\\u8fd0\\u7b97\\u7b26\\uff0c\\u5173\\u7cfb\\u8fd0\\u7b97\\u7b26\\u2002\",\"D\":\"\\u5173\\u7cfb\\u8fd0\\u7b97\\u7b26\\uff0c\\u7b97\\u672f\\u8fd0\\u7b97\\u7b26\\uff0c\\u903b\\u8f91\\u8fd0\\u7b97\\u7b26\\u2002\"}', 'B', 1, 23);
INSERT INTO `tp_single` VALUES (113, 'cookie的值存储在(       )', '{\"A\":\"\\u786c\\u76d8\\u4e2d\",\"B\":\"\\u7a0b\\u5e8f\\u4e2d\",\"C\":\"\\u5ba2\\u6237\\u7aef\\u2002\",\"D\":\"\\u670d\\u52a1\\u5668\\u7aef\"}', 'C', 1, 23);
INSERT INTO `tp_single` VALUES (114, '要查看一个变量的数据类型,可使用函数(       )', '{\"A\":\"type()\\u2002\",\"B\":\"gettype()\\u2002\",\"C\":\"\\u2002GetType()\\u2002\\u2002\",\"D\":\"Type()\\u2002\"}', 'B', 1, 23);
INSERT INTO `tp_single` VALUES (115, '字符串的比较，是按（  ）进行比较。 (       )', '{\"A\":\"\\u62fc\\u97f3\\u987a\\u5e8f\",\"B\":\"ASCII\\u7801\\u503c\\u2002\",\"C\":\"\\u968f\\u673a\\u2002\\u2002\",\"D\":\"\\u5148\\u540e\\u987a\\u5e8f\\u2002\\u2002\"}', 'B', 1, 23);
INSERT INTO `tp_single` VALUES (116, '复选框的type属性值是(       )', '{\"A\":\"checkbox\",\"B\":\"radio\\u2002\",\"C\":\"select\",\"D\":\"check\"}', 'A', 1, 23);
INSERT INTO `tp_single` VALUES (117, '文件框的type属性值是(       )', '{\"A\":\"text\",\"B\":\"hidden\",\"C\":\"textarea\",\"D\":\"checkbox\\u2002\"}', 'C', 1, 23);
INSERT INTO `tp_single` VALUES (118, '要检查一个常量是否定义,可以使用函数   (       )', '{\"A\":\"defined(\\u2002)\",\"B\":\"isdefin(\\u2002)\\u2002\",\"C\":\"isdefined(\\u2002)\",\"D\":\"\\u65e0\"}', 'A', 1, 23);
INSERT INTO `tp_single` VALUES (119, '关于mysql_select_db的作用描述正确的是 (       )', '{\"A\":\"\\u8fde\\u63a5\\u6570\\u636e\\u5e93\",\"B\":\"\\u8fde\\u63a5\\u5e76\\u9009\\u53d6\\u6570\\u636e\\u5e93\",\"C\":\"\\u8fde\\u63a5\\u5e76\\u6253\\u5f00\\u6570\\u636e\\u5e93\",\"D\":\"\\u9009\\u53d6\\u6570\\u636e\\u5e93\"}', 'D', 1, 23);
INSERT INTO `tp_single` VALUES (120, '下列不正确的变量名是(       )', '{\"A\":\"$_test\",\"B\":\"$2abc\",\"C\":\"$Var\",\"D\":\"$printr\\u2002\"}', 'B', 1, 23);
INSERT INTO `tp_single` VALUES (121, '下列选项中属于字符串常量的是', '{\"A\":\"abc\",\"B\":\"\'abc\'\\u2002\",\"C\":\"(abc)\\u2002\",\"D\":\"{abc}\"}', 'B', 1, 38);
INSERT INTO `tp_single` VALUES (122, '若有int x,y,z;则表达式（x>y&&x>z)是', '{\"A\":\"\\u7b97\\u672f\\u8868\\u8fbe\\u5f0f\",\"B\":\"\\u903b\\u8f91\\u8868\\u8fbe\\u5f0f\",\"C\":\"\\u5173\\u7cfb\\u8868\\u8fbe\\u5f0f\",\"D\":\"\\u4ee5\\u4e0a\\u90fd\\u4e0d\\u5bf9\"}', 'B', 1, 38);
INSERT INTO `tp_single` VALUES (123, '在Java中，下面对于构造方法的描述正确的是', '{\"A\":\"\\u7c7b\\u5fc5\\u987b\\u663e\\u5f0f\\u5b9a\\u4e49\\u6784\\u9020\\u65b9\\u6cd5\",\"B\":\"\\u6784\\u9020\\u65b9\\u6cd5\\u7684\\u8fd4\\u56de\\u7c7b\\u578b\\u662fvoid\",\"C\":\"\\u6784\\u9020\\u65b9\\u6cd5\\u548c\\u7c7b\\u6709\\u76f8\\u540c\\u7684\\u540d\\u79f0\\uff0c\\u5e76\\u4e14\\u4e0d\\u80fd\\u5e26\\u4efb\\u4f55\\u53c2\\u6570\",\"D\":\"\\u4e00\\u4e2a\\u7c7b\\u53ef\\u4ee5\\u5b9a\\u4e49\\u591a\\u4e2a\\u6784\\u9020\\u65b9\\u6cd5\"}', 'D', 1, 38);
INSERT INTO `tp_single` VALUES (124, '在Java中，下列说法正确的是', '{\"A\":\"\\u7f16\\u5199\\u7684\\u6e90\\u7a0b\\u5e8f\\u4fdd\\u5b58\\u5728\\u6269\\u5c55\\u540d\\u4e3aclass\\u7684\\u6587\\u4ef6\\u4e2d\",\"B\":\"\\u6e90\\u7a0b\\u5e8f\\u7f16\\u8bd1\\u540e\\u4fdd\\u5b58\\u5728\\u6269\\u5c55\\u540d\\u4e3ajava\\u7684\\u6587\\u4ef6\\u4e2d\",\"C\":\"\\u7f16\\u5199\\u7684\\u6e90\\u7a0b\\u5e8f\\u5fc5\\u987b\\u5148\\u7f16\\u8bd1\\u540e\\u624d\\u80fd\\u8fd0\\u884c\",\"D\":\"\\u7a0b\\u5e8f\\u5458\\u53ef\\u4ee5\\u8bfb\\u61c2\\u6269\\u5c55\\u540d\\u4e3aclass\\u7684\\u6587\\u4ef6\"}', 'C', 1, 38);
INSERT INTO `tp_single` VALUES (125, '在java中，有下面代码，其中可以正确编译的是', '{\"A\":\"double\\u2002d\\u2002=\\u2002(int)2;\\u2002\",\"B\":\"int\\u2002I\\u2002=\\u20021.34;\",\"C\":\"int\\u2002I\\u2002=\\u2002(double)1;\\u2002\",\"D\":\"\\u4ee5\\u4e0a\\u90fd\\u5bf9\"}', 'A', 1, 38);
INSERT INTO `tp_single` VALUES (126, '指出正确的表达式', '{\"A\":\"byte\\u2002b=128;\\u2002\",\"B\":\"Boolean\\u2002x=null;\\u2002\",\"C\":\"Long\\u2002m=\\u2002oxfffL;\",\"D\":\"Double\\u2002d=0.9239d\\u2002\"}', 'B', 1, 38);
INSERT INTO `tp_single` VALUES (127, '在JAVA中,(  )关键字用来终止循环语句。', '{\"A\":\"Return\",\"B\":\"Continue\",\"C\":\"Break\",\"D\":\"Exit\"}', 'C', 1, 38);
INSERT INTO `tp_single` VALUES (128, '以下（  ）不是Java的原始数据类型。 ', '{\"A\":\"short\",\"B\":\"boolean\",\"C\":\"unit\",\"D\":\"float\"}', 'C', 1, 38);
INSERT INTO `tp_single` VALUES (129, '对public void add(int a) {…}方法的重载方法应返回', '{\"A\":\"void\",\"B\":\"int\",\"C\":\"float\\u2002\",\"D\":\"\\u4efb\\u4f55\\u7c7b\\u578b\"}', 'B', 1, 38);
INSERT INTO `tp_single` VALUES (130, '如果要让一个变量的值不被修改，可以将这个变量用关键字(  )修饰。 ', '{\"A\":\"static\",\"B\":\"super\",\"C\":\"final\",\"D\":\"finally\"}', 'C', 1, 38);
INSERT INTO `tp_single` VALUES (131, '事件类FocusEvent的监听类FocusListener的抽象方法有几个(   )', '{\"A\":\"1\",\"B\":\"2\",\"C\":\"6\",\"D\":\"4\"}', 'B', 1, 38);
INSERT INTO `tp_single` VALUES (132, '以下哪一个为标准输出流类(  )。', '{\"A\":\"DataOutputStream\",\"B\":\"FilterOutputStream\",\"C\":\"PrintStream\",\"D\":\"BufferedOutputStream\"}', 'C', 1, 38);
INSERT INTO `tp_single` VALUES (133, '将读取的内容处理后再输出，适合用下列哪种流(   )。 ', '{\"A\":\"PipedStream\",\"B\":\"FilterStream\",\"C\":\"FileStream\",\"D\":\"ObjectStream\"}', 'A', 1, 38);
INSERT INTO `tp_single` VALUES (134, 'DataInput和DataOutput是处理哪一种流的接口(   )。 ', '{\"A\":\"\\u6587\\u4ef6\\u6d41\",\"B\":\"\\u5b57\\u8282\\u6d41\",\"C\":\"\\u5b57\\u7b26\\u6d41\",\"D\":\"\\u5bf9\\u8c61\\u6d41\"}', 'B', 1, 38);
INSERT INTO `tp_single` VALUES (135, '测试文件是否存在可以采用如下哪个方法(   )。', '{\"A\":\"isFile()\",\"B\":\"isFiles()\\u2002\",\"C\":\"exist()\",\"D\":\"exists()\"}', 'A', 1, 38);
INSERT INTO `tp_single` VALUES (136, '下列不属于逻辑运算符的是（   ）。', '{\"A\":\"\\uff01\",\"B\":\"||\",\"C\":\"&&\",\"D\":\"|\"}', 'D', 1, 38);
INSERT INTO `tp_single` VALUES (137, '下列不属于表达式语句的是（  ）。 ', '{\"A\":\"++i;\\u2002\",\"B\":\"--j;\",\"C\":\"b#a;\\u2002\",\"D\":\"b+=a;\\u2002\"}', 'C', 1, 38);
INSERT INTO `tp_single` VALUES (138, '下列整数的定义中，错误的是（    ）。 ', '{\"A\":\"int\\u2002f=314.0;\",\"B\":\"int\\u2002a=012;\\u2002\",\"C\":\"\\u2002int\\u2002i=189;\\u2002\",\"D\":\"int\\u2002d=0x123;\"}', 'A', 1, 38);
INSERT INTO `tp_single` VALUES (139, '下列变量定义中，不合法的是（d  ）。', '{\"A\":\"int\\u2002$x;\",\"B\":\"int\\u2002_12;\",\"C\":\"int\\u2002Summer_2012;\",\"D\":\"int\\u2002#dim;\"}', 'D', 1, 38);
INSERT INTO `tp_single` VALUES (140, '下列语句中，属于多分支语句的是（  ）。 ', '{\"A\":\"if\\u8bed\\u53e5\",\"B\":\"switch\\u8bed\\u53e5\",\"C\":\"do\\u2002while\\u8bed\\u53e5\\u2002\",\"D\":\"for\\u8bed\\u53e5\"}', 'B', 1, 38);
INSERT INTO `tp_single` VALUES (141, '下列不是java的位运算符的是（  ）。', '{\"A\":\"~\",\"B\":\"^\",\"C\":\"|\\u2002\",\"D\":\"!\"}', 'D', 1, 38);
INSERT INTO `tp_single` VALUES (142, '若有int x,y,z;则表达式（x+y+z)是（   ）。 ', '{\"A\":\"\\u7b97\\u672f\\u8868\\u8fbe\\u5f0f\",\"B\":\"\\u903b\\u8f91\\u8868\\u8fbe\\u5f0f\\u2002\",\"C\":\"\\u5173\\u7cfb\\u8868\\u8fbe\\u5f0f\",\"D\":\"\\u4ee5\\u4e0a\\u90fd\\u4e0d\\u5bf9\"}', 'B', 1, 38);
INSERT INTO `tp_single` VALUES (143, '若有float f=2.6f;short s=20;则表达式f+s的值的类型是（  ）。', '{\"A\":\"float\",\"B\":\"short\",\"C\":\"int\",\"D\":\"byte\\u2002\"}', 'A', 1, 38);
INSERT INTO `tp_single` VALUES (144, '若有char c=\'8\';short s=20;则表达式c+s的值的类型是（  ）。 ', '{\"A\":\"char\",\"B\":\"short\",\"C\":\"int\",\"D\":\"byte\"}', 'A', 1, 38);
INSERT INTO `tp_single` VALUES (145, '若有byte b=6;char c=\'c\';则表达式b+c的值的类型是（   ）。 ', '{\"A\":\"int\",\"B\":\"byte\",\"C\":\"char\",\"D\":\"float\"}', 'C', 1, 38);
INSERT INTO `tp_single` VALUES (146, '有如下定义：float a=1.0f;double b=2.0;则表达式a+b的值的数据类型为（  ）。', '{\"A\":\"float\",\"B\":\"double\\u2002\",\"C\":\"char\",\"D\":\"int\"}', 'B', 1, 38);
INSERT INTO `tp_single` VALUES (147, '有如下定义：float a=3.14f;byte b=3;则表达式a+b的值的数据类型为（  ）。', '{\"A\":\"byte\",\"B\":\"int\",\"C\":\"char\",\"D\":\"float\"}', 'D', 1, 38);
INSERT INTO `tp_single` VALUES (148, '有如下定义：int a=1;byte b=2;则表达式a+b的数据类型为（   ）。 ', '{\"A\":\"int\",\"B\":\"byte\",\"C\":\"char\",\"D\":\"long\"}', 'A', 1, 38);
INSERT INTO `tp_single` VALUES (149, '若a的值为1，则执行语句if((a++<0)||(a>0))  a++;后，a的值是(  )。', '{\"A\":\"3\",\"B\":\"2\",\"C\":\"1\",\"D\":\"0.5\"}', 'B', 1, 38);
INSERT INTO `tp_single` VALUES (150, '下列循环执行的次数是（  ）。while(1)  i++; ', '{\"A\":\"1\",\"B\":\"0\",\"C\":\"\\u65e0\\u6570\\u6b21\",\"D\":\"\\u4ee5\\u4e0a\\u8bf4\\u6cd5\\u90fd\\u4e0d\\u5bf9\"}', 'C', 1, 38);
INSERT INTO `tp_single` VALUES (151, '子类与父类的方法定义完全相同，但是方法的实现却不同，这是采用了方法的(  )。 ', '{\"A\":\"\\u91cd\\u8f7d\",\"B\":\"\\u5b9e\\u73b0\",\"C\":\"\\u8986\\u76d6\\u2002\\u2002\\u2002\\u2002\\u2002\",\"D\":\"\\u7ee7\\u627f\"}', 'D', 1, 38);
INSERT INTO `tp_single` VALUES (152, 'JAVA所定义的版本中不包括：（  ） ', '{\"A\":\"J2EE\",\"B\":\"J2SE\",\"C\":\"J2ME\",\"D\":\"J2HE\"}', 'D', 1, 38);
INSERT INTO `tp_single` VALUES (153, 'Java语言使用的字符码集是（  ）。', '{\"A\":\"ASCII\",\"B\":\"BCD\\u2002\\u2002\\u2002\",\"C\":\"DCB\",\"D\":\"Unicode\"}', 'D', 1, 38);
INSERT INTO `tp_single` VALUES (154, '下列的哪个赋值语句是正确的？（  ） ', '{\"A\":\"char\\u2002a=12;\",\"B\":\"int\\u2002a=12.0;\",\"C\":\"int\\u2002a=12.0f;\",\"D\":\"int\\u2002a=\\uff08int\\uff0912.0\"}', 'D', 1, 38);
INSERT INTO `tp_single` VALUES (155, 'Java是从（  ）语言改进重新设计。 ', '{\"A\":\"Ada\",\"B\":\"C++\",\"C\":\"Pasacal\",\"D\":\"BASIC\"}', 'B', 1, 38);
INSERT INTO `tp_single` VALUES (156, '下列语句哪一个正确（  ）。         ', '{\"A\":\"Java\\u7a0b\\u5e8f\\u7ecf\\u7f16\\u8bd1\\u540e\\u4f1a\\u4ea7\\u751fmachine\\u2002code\",\"B\":\"Java\\u7a0b\\u5e8f\\u7ecf\\u7f16\\u8bd1\\u540e\\u4f1a\\u4ea7\\u751fbyte\\u2002code\",\"C\":\"Java\\u7a0b\\u5e8f\\u7ecf\\u7f16\\u8bd1\\u540e\\u4f1a\\u4ea7\\u751fDLL\",\"D\":\"\\u4ee5\\u4e0a\\u90fd\\u4e0d\\u6b63\\u786e\"}', 'B', 1, 38);
INSERT INTO `tp_single` VALUES (157, '下列运算符不是算术运算符的是（  ）。 ', '{\"A\":\"+\",\"B\":\"-\\u2002\",\"C\":\"*\\u2002\",\"D\":\"\\\\\"}', 'D', 1, 38);
INSERT INTO `tp_single` VALUES (158, '下面哪个是非法的（  ）。 ', '{\"A\":\"int\\u2002I=32;\\u2002\",\"B\":\"float\\u2002f=45.0;\\u2002\",\"C\":\"double\\u2002d=45.0;\\u2002\",\"D\":\"char\\u2002c\\u2002=\'a\';\\u2002\"}', 'B', 1, 38);
INSERT INTO `tp_single` VALUES (159, '变量命名规范说法正确的是（  ）    ', '{\"A\":\"\\u53d8\\u91cf\\u7531\\u5b57\\u6bcd.\\u4e0b\\u5212\\u7ebf.\\u6570\\u5b57.$\\u7b26\\u53f7\\u968f\\u610f\\u7ec4\\u6210\",\"B\":\"\\u53d8\\u91cf\\u4e0d\\u80fd\\u4ee5\\u6570\\u5b57\\u4f5c\\u4e3a\\u5f00\\u5934\",\"C\":\"D\\u548cd\\u5728java\\u4e2d\\u662f\\u540c\\u4e00\\u4e2a\\u53d8\\u91cf\",\"D\":\"\\u4e0d\\u540c\\u7c7b\\u578b\\u7684\\u53d8\\u91cf\\uff0c\\u53ef\\u4ee5\\u8d77\\u76f8\\u540c\\u7684\\u540d\\u5b57\"}', 'B', 1, 38);
INSERT INTO `tp_single` VALUES (160, '为一个boolean类型变量赋值时，可以使用( A )方式。   ', '{\"A\":\"boolean\\u2002a=1;\",\"B\":\"boolean\\u2002a=(9>=10);\",\"C\":\"boolean\\u2002a=\\\"\\u771f\\\";\",\"D\":\"boolean\\u2002a==false;\"}', 'A', 1, 38);
INSERT INTO `tp_single` VALUES (161, '执行下列语句后，j的值为（  ）。int i=1;j=++i;    ', '{\"A\":\"2\",\"B\":\"1\",\"C\":\"0\",\"D\":\"3\"}', 'A', 1, 38);
INSERT INTO `tp_single` VALUES (162, '下面哪个不是Java标准库中Writer类的子类(   )。    ', '{\"A\":\"FilterWriter\",\"B\":\"PrintWriter\",\"C\":\"LineNumberWriter\",\"D\":\"FileWriter\"}', 'C', 1, 38);
INSERT INTO `tp_single` VALUES (163, '下列语句正确的是（  ）。  ', '{\"A\":\"\\u5f62\\u5f0f\\u53c2\\u6570\\u53ef\\u88ab\\u89c6\\u4e3a\\u5c40\\u90e8\\u53d8\\u91cf\\u2002\\u2002\\u2002\\u2002\\u2002\\u2002\",\"B\":\"\\u5f62\\u5f0f\\u53c2\\u6570\\u53ef\\u88ab\\u5168\\u5c40\\u53d8\\u91cf\\u2002\\u2002\",\"C\":\"\\u5f62\\u5f0f\\u53c2\\u6570\\u4e3a\\u65b9\\u6cd5\\u88ab\\u8c03\\u7528\\u65f6\\uff0c\\u662f\\u771f\\u6b63\\u88ab\\u4f20\\u9012\\u7684\\u53c2\\u6570\",\"D\":\"\\u5f62\\u5f0f\\u53c2\\u6570\\u4e0d\\u53ef\\u4ee5\\u662f\\u5bf9\\u8c61\"}', 'A', 1, 38);
INSERT INTO `tp_single` VALUES (164, '若在某一个类定义中定义有如下的方法：abstract void performDial( );该方法属于（   ）。    ', '{\"A\":\"\\u63a5\\u53e3\\u65b9\\u6cd5\",\"B\":\"\\u6700\\u7ec8\\u65b9\\u6cd5\",\"C\":\"\\u62bd\\u8c61\\u65b9\\u6cd5\",\"D\":\"\\u7a7a\\u65b9\\u6cd5\"}', 'C', 1, 38);
INSERT INTO `tp_single` VALUES (165, '两个字符串String str1,str2;错误的连接二者的方式是（   ）。    ', '{\"A\":\"str1+str2\",\"B\":\"str1.str2\",\"C\":\"str1.contat(str2)\",\"D\":\"str2.contat(str1)\"}', 'B', 1, 38);
INSERT INTO `tp_single` VALUES (166, 'String（byte[ ],int,int）中，第三个参数用来生成字符串的byte型数组的（   ）。    ', '{\"A\":\"\\u957f\\u5ea6\",\"B\":\"\\u8d77\\u59cb\\u4f4d\\u7f6e\",\"C\":\"\\u7ec8\\u6b62\\u4f4d\\u7f6e\",\"D\":\"\\u7ec8\\u6b62\\u4f4d\\u7f6e+1\"}', 'A', 1, 38);
INSERT INTO `tp_single` VALUES (167, 'StringBuffer( String s )方法分配了s大小的空间和（  ）个字符的缓冲区。    ', '{\"A\":\"12\",\"B\":\"14\",\"C\":\"16\",\"D\":\"18\"}', 'C', 1, 38);
INSERT INTO `tp_single` VALUES (168, 'Java程序经过编译后生成的文件的后缀是（  ）                                    ', '{\"A\":\".obj\",\"B\":\".exe\",\"C\":\".class\\u2002\",\"D\":\".java\"}', 'C', 1, 38);
INSERT INTO `tp_single` VALUES (169, '以下哪些修饰符可以使变量对于任何其他类都是不可视的，包括子类？（  ）    ', '{\"A\":\"private\",\"B\":\"public\",\"C\":\"final\",\"D\":\"abstact\"}', 'C', 1, 38);
INSERT INTO `tp_single` VALUES (170, '以下关于继承的叙述正确的是（   ）。   ', '{\"A\":\"\\u5728Java\\u4e2d\\u7c7b\\u53ea\\u5141\\u8bb8\\u5355\\u4e00\\u7ee7\\u627f\",\"B\":\"\\u5728Java\\u4e2d\\u4e00\\u4e2a\\u7c7b\\u53ea\\u80fd\\u5b9e\\u73b0\\u4e00\\u4e2a\\u63a5\\u53e3\",\"C\":\"\\u5728Java\\u4e2d\\u4e00\\u4e2a\\u7c7b\\u4e0d\\u80fd\\u540c\\u65f6\\u7ee7\\u627f\\u4e00\\u4e2a\\u7c7b\\u548c\\u5b9e\\u73b0\\u4e00\\u4e2a\\u63a5\\u53e3\\u2002 \",\"D\":\"\\u5728Java\\u4e2d\\u63a5\\u53e3\\u53ea\\u5141\\u8bb8\\u5355\\u4e00\\u7ee7\\u627f\"}', 'A', 1, 38);
INSERT INTO `tp_single` VALUES (171, '类中不加任何访问权限限定的成员属于（   ）。   ', '{\"A\":\"default\",\"B\":\"public\",\"C\":\"private\",\"D\":\"protected\"}', 'A', 1, 38);
INSERT INTO `tp_single` VALUES (172, '定义一个接口必须使用的关键字是（  ）。 ', '{\"A\":\"public\\u2002\",\"B\":\"class\\u2002\",\"C\":\"interface\\u2002\",\"D\":\"static\"}', 'C', 1, 38);
INSERT INTO `tp_single` VALUES (173, '下述概念中不属于面向对象方法的是（  ）。    ', '{\"A\":\"\\u5bf9\\u8c61.\\u6d88\\u606f\",\"B\":\"\\u7ee7\\u627f.\\u591a\\u6001\",\"C\":\"\\u7c7b.\\u5c01\\u88c5\",\"D\":\"\\u8fc7\\u7a0b\\u8c03\\u7528\"}', 'D', 1, 38);
INSERT INTO `tp_single` VALUES (174, '一个对象创建包括的操作中，没有下面的（  ）。    ', '{\"A\":\"\\u91ca\\u653e\\u5185\\u5b58\",\"B\":\"\\u5bf9\\u8c61\\u58f0\\u660e\",\"C\":\"\\u5206\\u914d\\u5185\\u5b58\",\"D\":\"\\u8c03\\u7528\\u6784\\u9020\\u65b9\\u6cd5\"}', 'A', 1, 38);
INSERT INTO `tp_single` VALUES (175, '下面哪个不是Java标准库中Reader类的子类(   )。 ', '{\"A\":\"CharArrayReader\\u2002\",\"B\":\"InputStreamReader\\u2002\",\"C\":\"DataInputReader\\u2002\",\"D\":\"StringReader\"}', 'C', 1, 38);
INSERT INTO `tp_single` VALUES (176, '若有byte a=1,b=2,c;则下列赋值语句正确的是（   ）。 ', '{\"A\":\"c=a+b;\\u2002\",\"B\":\"c=a+2\\u2002\",\"C\":\"c=b-2;\\u2002\",\"D\":\"c=64+1;\"}', 'A', 1, 38);
INSERT INTO `tp_single` VALUES (177, '若有int x,y,z;则表达式（x+y>z)是（   ）。 ', '{\"A\":\"\\u7b97\\u672f\\u8868\\u8fbe\\u5f0f\\u2002\",\"B\":\"\\u903b\\u8f91\\u8868\\u8fbe\\u5f0f\\u2002\",\"C\":\"\\u5173\\u7cfb\\u8868\\u8fbe\\u5f0f\\u2002 \",\"D\":\"\\u4ee5\\u4e0a\\u90fd\\u4e0d\\u5bf9\"}', 'B', 1, 38);
INSERT INTO `tp_single` VALUES (178, 'boolean endsWith(String s)表示（     ）。    ', '{\"A\":\"\\u67e5\\u627e\\u67d0\\u5b57\\u7b26\\u4e32\\u662f\\u5426\\u4ee5s\\u4e3a\\u7ed3\\u5c3e\",\"B\":\"\\u67e5\\u627e\\u67d0\\u5b57\\u7b26\\u4e32\\u662f\\u5426\\u4e0es\\u5b8c\\u5168\\u5339\\u914d\",\"C\":\"\\u786e\\u5b9a\\u67d0\\u5b57\\u7b26\\u4e32\\u4e0es\\u7684\\u5927\\u5c0f\\u5173\\u7cfb\",\"D\":\"\\u786e\\u5b9a\\u67d0\\u5b57\\u7b26\\u4e32\\u662f\\u5426\\u4ee5s\\u4e3a\\u5f00\\u59cb\"}', 'A', 1, 38);
INSERT INTO `tp_single` VALUES (179, '对于ByteArrayInputStream类，下列哪一项是不正确的(   )。   ', '{\"A\":\"\\u548cInputStream\\u7c7b\\u6709\\u5f88\\u5927\\u7684\\u4e0d\\u540c\",\"B\":\"\\u6709\\u56db\\u4e2a\\u6210\\u5458\\u53d8\\u91cf\\uff1abuf.count.mark.pos\",\"C\":\"\\u53ef\\u4ee5\\u91cd\\u8bfb\\u90e8\\u5206\\u8f93\\u5165\\u6d41\\u6570\\u636e\\u2002\",\"D\":\"\\u53ef\\u4ee5\\u5bf9\\u8f93\\u5165\\u6d41\\u6570\\u636e\\u5b57\\u8282\\u6570\\u8ba1\\u6570\"}', 'A', 1, 38);
INSERT INTO `tp_single` VALUES (180, '关于字符流，下列哪一项是不正确的(   )。 ', '{\"A\":\"\\u4e3a\\u65b9\\u4fbf16\\u4f4dUnicode\\u5b57\\u7b26\\u5904\\u7406\\u800c\\u5f15\\u5165\\u7684\\u2002\",\"B\":\"\\u53ef\\u5904\\u7406\\u4efb\\u610f\\u7f16\\u7801\\u7684\\u975eASCII\\u5b57\\u7b26\\u2002\",\"C\":\"\\u4ee5\\u4e24\\u4e2a\\u5b57\\u8282\\u4e3a\\u57fa\\u672c\\u8f93\\u5165\\u8f93\\u51fa\\u5355\\u4f4d\\u2002\",\"D\":\"\\u6709\\u4e24\\u4e2a\\u57fa\\u672c\\u7c7b\\uff1aReader\\u548cWriter\"}', 'B', 1, 38);
INSERT INTO `tp_single` VALUES (181, '与SaaS不同的，这种“云”计算形式把开发环境或者运行平台也作为一种服务给用户提供()', '{\"A\":\"\\u8f6f\\u4ef6\\u5373\\u670d\\u52a1\",\"B\":\"\\u57fa\\u4e8e\\u5e73\\u53f0\\u670d\\u52a1\",\"C\":\"\\u57fa\\u4e8eWEB\\u670d\\u52a1\",\"D\":\"\\u57fa\\u4e8e\\u7ba1\\u7406\\u670d\\u52a1\\u2002\"}', 'B', 1, 39);
INSERT INTO `tp_single` VALUES (182, '云计算是对（）技术的发展与运用', '{\"A\":\"\\u5e76\\u884c\\u8ba1\\u7b97\",\"B\":\"\\u7f51\\u683c\\u8ba1\\u7b97\",\"C\":\"\\u5206\\u5e03\\u5f0f\\u8ba1\\u7b97\",\"D\":\"D\\u3001\\u4e09\\u4e2a\\u9009\\u9879\\u90fd\\u662f\"}', 'D', 1, 39);
INSERT INTO `tp_single` VALUES (183, '不属于桌面虚拟化技术构架的选项是', '{\"A\":\"\\u865a\\u62df\\u684c\\u9762\\u57fa\\u7840\\u67b6\\u6784\\uff08VDI\\uff09\",\"B\":\"\\u865a\\u62df\\u64cd\\u4f5c\\u7cfb\\u7edf\\u57fa\\u7840\\u67b6\\u6784\\uff08VOI)\",\"C\":\"\\u8fdc\\u7a0b\\u6258\\u7ba1\\u684c\\u9762\",\"D\":\"OSV\\u667a\\u80fd\\u684c\\u9762\\u865a\\u62df\\u5316\"}', 'C', 1, 39);
INSERT INTO `tp_single` VALUES (184, '( ）不属于桌面虚拟化技术构架的选项是', '{\"A\":\"SAAS\",\"B\":\"PAAS\",\"C\":\"IAAS\",\"D\":\"HAAS\"}', 'D', 1, 39);
INSERT INTO `tp_single` VALUES (185, '与网络计算相比，不属于云计算特征的是（）', '{\"A\":\"\\u8d44\\u6e90\\u9ad8\\u5ea6\\u5171\\u4eab\",\"B\":\"\\u9002\\u5408\\u7d27\\u8026\\u5408\\u79d1\\u5b66\\u8ba1\\u7b97\",\"C\":\"\\u652f\\u6301\\u865a\\u62df\\u673a\",\"D\":\"\\u9002\\u7528\\u4e8e\\u5546\\u4e1a\\u9886\\u57df\"}', 'B', 1, 39);
INSERT INTO `tp_single` VALUES (186, '将平台作为服务的云计算服务类型是（ ）', '{\"A\":\"IaaS\",\"B\":\"PaaS\",\"C\":\"SaaS\",\"D\":\"\\u4e09\\u4e2a\\u9009\\u9879\\u90fd\\u662f\"}', 'B', 1, 39);
INSERT INTO `tp_single` VALUES (187, '我们常提到的Window装个VMware装个Linux虚拟机属于（)', '{\"A\":\"\\u5b58\\u50a8\\u865a\\u62df\\u5316\",\"B\":\"\\u5185\\u5b58\\u865a\\u62df\\u5316\",\"C\":\"\\u7cfb\\u7edf\\u865a\\u62df\\u5316\\u5316\\u2002\",\"D\":\"\\u7f51\\u7edc\\u865a\\u62df\\u5316\"}', 'C', 1, 39);
INSERT INTO `tp_single` VALUES (188, 'IaaS是（ ）的简称', '{\"A\":\"\\u8f6f\\u4ef6\\u5373\\u670d\\u52a1\",\"B\":\"\\u5e73\\u53f0\\u5373\\u670d\\u52a1\",\"C\":\"\\u57fa\\u7840\\u8bbe\\u65bd\\u5373\\u670d\\u52a1\",\"D\":\"\\u786c\\u4ef6\\u5373\\u670d\\u52a1\"}', 'C', 1, 39);
INSERT INTO `tp_single` VALUES (189, '超大型数据中心运营中，什么费用所占比例最高（）', '{\"A\":\"\\u786c\\u4ef6\\u66f4\\u6362\\u8d39\\u7528\",\"B\":\"\\u8f6f\\u4ef6\\u7ef4\\u62a4\\u8d39\\u7528\",\"C\":\"\\u7a7a\\u8c03\\u7b49\\u652f\\u6301\\u7cfb\\u7edf\\u7ef4\\u62a4\\u8d39\\u7528\",\"D\":\"\\u7535\\u8d39\\u2002\"}', 'C', 1, 39);
INSERT INTO `tp_single` VALUES (190, '将基础设施作为服务的云计算服务类型是（ ）', '{\"A\":\"IaaS\",\"B\":\"PaaS\",\"C\":\"SaaS\",\"D\":\"\\u4e09\\u4e2a\\u9009\\u9879\\u90fd\\u662f\"}', 'A', 1, 39);
INSERT INTO `tp_single` VALUES (191, 'SAN属于', '{\"A\":\"\\u5185\\u7f6e\\u5b58\\u50a8\",\"B\":\"\\u5916\\u6302\\u5b58\\u50a8\",\"C\":\"\\u7f51\\u7edc\\u5316\\u5b58\\u50a8\",\"D\":\"\\u4ee5\\u4e0a\\u90fd\\u4e0d\\u5bf9\"}', 'C', 1, 39);
INSERT INTO `tp_single` VALUES (192, '不属于网络虚拟化的概念是', '{\"A\":\"VLAN\",\"B\":\"VPN\",\"C\":\"VEPA\",\"D\":\"SAN\"}', 'D', 1, 39);
INSERT INTO `tp_single` VALUES (193, '不属于原生架构（裸金属架构 ）的虚拟化系统是', '{\"A\":\"VMware\\u2002Workstation\",\"B\":\"ESX\\u2002Server\",\"C\":\"\\u5fae\\u8f6f\\u7684Hyper-V\",\"D\":\"H3C\\u2002CAS\"}', 'A', 1, 39);
INSERT INTO `tp_single` VALUES (194, '下列哪个特性不是虚拟化的主要特征（）', '{\"A\":\"\\u9ad8\\u6269\\u5c55\\u6027\",\"B\":\"\\u9ad8\\u53ef\\u7528\\u6027\",\"C\":\"\\u9ad8\\u5b89\\u5168\\u6027\",\"D\":\"\\u5b9e\\u73b0\\u6280\\u672f\\u7b80\\u5355\"}', 'D', 1, 39);
INSERT INTO `tp_single` VALUES (195, '我安装了一个桌面虚拟机软件，并在其内部安装一个普通操作系统，下列哪个行为，这个虚拟的操作系统最有可能做不到（）', '{\"A\":\"\\u4e0a\\u7f51\",\"B\":\"\\u6587\\u5b57\\u5904\\u7406\",\"C\":\"\\u5728\\u5176\\u5185\\u90e8\\u518d\\u5b89\\u88c5\\u4e00\\u4e2a\\u865a\\u62df\\u673a\",\"D\":\"\\u6e38\\u620f\\u2002\"}', 'C', 1, 39);
INSERT INTO `tp_single` VALUES (196, '亚马逊AWS提供的云计算服务类型是（）', '{\"A\":\"IaaS\",\"B\":\"PaaS\",\"C\":\"SaaS\",\"D\":\"\\u4e09\\u4e2a\\u9009\\u9879\\u90fd\\u662f\"}', 'D', 1, 39);
INSERT INTO `tp_single` VALUES (197, '从研究现状上看，下面不属于云计算特点的是（ ）', '{\"A\":\"\\u8d85\\u5927\\u89c4\\u6a21\",\"B\":\"\\u865a\\u62df\\u5316\",\"C\":\"\\u79c1\\u6709\\u5316\",\"D\":\"\\u9ad8\\u53ef\\u9760\\u6027\"}', 'C', 1, 39);
INSERT INTO `tp_single` VALUES (198, '不是桌面虚拟化远程连接协议的选项是', '{\"A\":\"RDP\",\"B\":\"CIC\",\"C\":\"ICA\",\"D\":\"PCoIP\"}', 'C', 1, 39);
INSERT INTO `tp_single` VALUES (199, '利用互联网把分散在不同地理位置的计算机组成一台虚拟的超级计算机的概念是', '{\"A\":\"\\u5e76\\u884c\\u8ba1\\u7b97\",\"B\":\"\\u5206\\u5e03\\u5f0f\\u8ba1\\u7b97\",\"C\":\"\\u7f51\\u683c\\u8ba1\\u7b97\",\"D\":\"\\u6548\\u7528\\u8ba1\\u7b97\"}', 'C', 1, 39);
INSERT INTO `tp_single` VALUES (200, '大数据的特征不包括', '{\"A\":\"\\u5927\\u91cf\\u5316\",\"B\":\"\\u591a\\u6837\\u5316\",\"C\":\"\\u5feb\\u901f\\u5316\",\"D\":\"\\u7ed3\\u6784\\u5316\"}', 'D', 1, 39);
INSERT INTO `tp_single` VALUES (201, '客户操作系统无需修改就能在虚拟服务器上运行的虚拟化技术是', '{\"A\":\"\\u5b8c\\u5168\\u865a\\u62df\\u5316\",\"B\":\"\\u534a\\u865a\\u62df\\u5316\",\"C\":\"\\u786c\\u4ef6\\u8f85\\u52a9\\u865a\\u62df\\u5316\",\"D\":\"\\u8f6f\\u4ef6\\u8f85\\u52a9\\u865a\\u62df\\u5316\"}', 'A', 1, 39);
INSERT INTO `tp_single` VALUES (202, '虚拟机最早在（ ）由IBM研究中心研制', '{\"A\":\"20\\u4e16\\u7eaa50\\u5e74\\u4ee3\",\"B\":\"20\\u4e16\\u7eaa60\\u5e74\\u4ee3\",\"C\":\"20\\u4e16\\u7eaa70\\u5e74\\u4ee3\",\"D\":\"20\\u4e16\\u7eaa80\\u5e74\\u4ee3\"}', 'C', 1, 39);
INSERT INTO `tp_single` VALUES (203, '（ ）是指用户可通过Internet获取IT基础设施硬件资源', '{\"A\":\"SAAS\",\"B\":\"PAAS\",\"C\":\"IAAS\",\"D\":\"HAAS\"}', 'A', 1, 39);
INSERT INTO `tp_single` VALUES (204, '( )提供云用户请求服务的交互界面，也是用户使用云的入口，用户通过Web浏览器可以注册、登录及定制服务、配置和管理用户。打开应用实例与本地操作桌面系统一样。      A、      B、      C、      D、', '{\"A\":\"\\u4e91\\u7528\\u6237\\u7aef\",\"B\":\"\\u670d\\u52a1\\u76ee\\u5f55\",\"C\":\"\\u7ba1\\u7406\\u7cfb\\u7edf\\u548c\\u90e8\\u7f72\\u5de5\\u5177\",\"D\":\"\\u76d1\\u63a7\\u7aef\"}', 'C', 1, 39);
INSERT INTO `tp_single` VALUES (205, '应用虚拟化不能解决的问题是', '{\"A\":\"\\u5e94\\u7528\\u8f6f\\u4ef6\\u7684\\u7248\\u672c\\u4e0d\\u517c\\u5bb9\\u95ee\\u9898\",\"B\":\"\\u8f6f\\u4ef6\\u5728\\u4e0d\\u540c\\u5e73\\u53f0\\u95f4\\u7684\\u79fb\\u690d\\u95ee\\u9898\",\"C\":\"\\u8f6f\\u4ef6\\u4e0d\\u9700\\u5b89\\u88c5\\u5c31\\u53ef\\u4f7f\\u7528\\u95ee\\u9898\",\"D\":\"\\u8f6f\\u4ef6\\u514d\\u8d39\\u95ee\\u9898\"}', 'B', 1, 39);
INSERT INTO `tp_single` VALUES (206, '基于光纤交换机的（ ）是利用FibreChannelSwitch为主干，建成的交互存储网络系统', '{\"A\":\"LAN\",\"B\":\"SAN\",\"C\":\"WAN\",\"D\":\"MAN\"}', 'B', 1, 39);
INSERT INTO `tp_single` VALUES (207, '虚拟化的特性不包括', '{\"A\":\"\\u9694\\u79bb\\u8fd0\\u884c\",\"B\":\"\\u786c\\u4ef6\\u5b9e\\u73b0\",\"C\":\"\\u5c01\\u88c5\\u62bd\\u8c61\",\"D\":\"\\u5e7f\\u6cdb\\u517c\\u5bb9\"}', 'B', 1, 39);
INSERT INTO `tp_single` VALUES (208, '（ ）是私有云计算基础架构的基石', '{\"A\":\"\\u865a\\u62df\\u5316\",\"B\":\"\\u5206\\u5e03\\u5f0f\",\"C\":\"\\u5e76\\u884c\",\"D\":\"\\u96c6\\u4e2d\\u5f0f\"}', 'A', 1, 39);
INSERT INTO `tp_single` VALUES (209, 'IaaS计算实现机制中，系统管理模块的核心功能是（）', '{\"A\":\"\\u8d1f\\u8f7d\\u5747\\u8861\",\"B\":\"\\u76d1\\u89c6\\u8282\\u70b9\\u7684\\u8fd0\\u884c\\u72b6\\u6001\",\"C\":\"\\u5e94\\u7528API\",\"D\":\"\\u8282\\u70b9\\u73af\\u5883\\u914d\\u7f6e\"}', 'A', 1, 39);
INSERT INTO `tp_single` VALUES (210, 'openstack的组件不包括', '{\"A\":\"Nova\",\"B\":\"Swift\",\"C\":\"Keyston\",\"D\":\"EC2\"}', 'D', 1, 39);
INSERT INTO `tp_single` VALUES (211, '云计算就是把计算资源都放到上（ ）', '{\"A\":\"\\u5bf9\\u7b49\\u7f51\",\"B\":\"\\u56e0\\u7279\\u7f51\",\"C\":\"\\u5e7f\\u57df\\u7f51\",\"D\":\"\\u65e0\\u7ebf\\u7f51\"}', 'B', 1, 39);
INSERT INTO `tp_single` VALUES (212, 'Xen提出的虚拟化产品交付中心结构不包括下面那条生产线（）', '{\"A\":\"\\u670d\\u52a1\\u5668\\u865a\\u62df\\u5316\",\"B\":\"\\u5e94\\u7528\\u865a\\u62df\\u5316\",\"C\":\"\\u684c\\u9762\\u865a\\u62df\\u5316\",\"D\":\"\\u6570\\u636e\\u4e2d\\u5fc3\\u642d\\u5efa\\u652f\\u6301\\u2002\"}', 'D', 1, 39);
INSERT INTO `tp_single` VALUES (213, '下面那个不是云计算的特征（）', '{\"A\":\"\\u865a\\u62df\\u5316\",\"B\":\"\\u52a8\\u6001\\u53ef\\u6269\\u5c55\",\"C\":\"\\u7ba1\\u7406\\u591a\\u8bbe\\u5907\",\"D\":\"\\u4e2a\\u4f53\\u81ea\\u6cbb\"}', 'D', 1, 39);
INSERT INTO `tp_single` VALUES (214, '虚拟化层对应（ ）结合Paas提供硬件服务，包括服务器集群及硬件检测等服务', '{\"A\":\"\\u8f6f\\u4ef6\\u5373\\u670d\\u52a1\",\"B\":\"\\u5e73\\u53f0\\u5373\\u670d\\u52a1\",\"C\":\"\\u57fa\\u7840\\u8bbe\\u65bd\\u5373\\u670d\\u52a1\",\"D\":\"\\u786c\\u4ef6\\u5373\\u670d\\u52a1\"}', 'D', 1, 39);
INSERT INTO `tp_single` VALUES (215, '不属于云计算缺点的选项是', '{\"A\":\"\\u9690\\u79c1\\u4e0e\\u5b89\\u5168\\u4fdd\\u969c\\u6709\\u9650\",\"B\":\"\\u4e91\\u8ba1\\u7b97\\u7684\\u529f\\u80fd\\u53ef\\u80fd\\u6709\\u9650\\u2002\",\"C\":\"\\u4e0d\\u80fd\\u63d0\\u4f9b\\u53ef\\u9760\\u3001\\u5b89\\u5168\\u7684\\u6570\\u636e\\u5b58\\u50a8\",\"D\":\"\\u53ef\\u80fd\\u5b58\\u5728\\u8131\\u673a\\u95ee\\u9898\"}', 'C', 1, 39);
INSERT INTO `tp_single` VALUES (216, '数据存储单位从小到大排列顺序是', '{\"A\":\"EB\\u2002\\u3001PB\\u3001YB\\u3001ZB\",\"B\":\"PB\\u3001EB\\u3001YB\\u3001ZB\",\"C\":\"PB\\u3001EB\\u3001ZB\\u3001YB\",\"D\":\"YB\\u3001ZB\\u3001PB\\u3001EB\"}', 'C', 1, 39);
INSERT INTO `tp_single` VALUES (217, ' ( )有校验数据，提供数据容错能力', '{\"A\":\"RAID5\",\"B\":\"RAID2\",\"C\":\"RAID1\",\"D\":\"RAID0\"}', 'A', 1, 39);
INSERT INTO `tp_single` VALUES (218, 'vSphere的组件不包括', '{\"A\":\"ESXi\",\"B\":\"vCenter\",\"C\":\"openstack\",\"D\":\"vStorage\\u2002VMFS\"}', 'C', 1, 39);
INSERT INTO `tp_single` VALUES (219, '（ ）是一群同构处理单元的集合，这些处理单元通过通信和协作来更快地解决大规模计算问题x', '{\"A\":\"\\u865a\\u62df\\u5316\",\"B\":\"\\u5206\\u5e03\\u5f0f\\u865a\\u62df\\u5316\",\"C\":\"\\u5e76\\u884c\\u8ba1\\u7b97\",\"D\":\"\\u96c6\\u7fa4\\u2002\"}', 'C', 1, 39);
INSERT INTO `tp_single` VALUES (220, '（ ）是公有云计算基础架构的基石', '{\"A\":\"\\u865a\\u62df\\u5316\",\"B\":\"\\u5206\\u5e03\\u5f0f\",\"C\":\"\\u5e76\\u884c\",\"D\":\"\\u96c6\\u4e2d\\u5f0f\"}', 'B', 1, 39);
INSERT INTO `tp_single` VALUES (221, '云计算管理平台中的在线迁移和高可用性功能需要( )作为先决条件', '{\"A\":\"\\u5171\\u4eab\\u5b58\\u50a8\",\"B\":\"\\u5171\\u4eab\\u670d\\u52a1\\u5668\",\"C\":\"\\u5171\\u4ea8\\u8def\\u7531\\u5668\",\"D\":\"\\u5171\\u4ea8\\u865a\\u62df\\u673a\"}', 'A', 1, 39);
INSERT INTO `tp_single` VALUES (222, 'IBM在2007年11月退出了“改进游戏规则”的（）计算平台，为客户带来即买即用的云计算平台', '{\"A\":\"\\u84dd\\u4e91\",\"B\":\"\\u84dd\\u5929\",\"C\":\"ARUZE\",\"D\":\"EC2\"}', 'A', 1, 39);
INSERT INTO `tp_single` VALUES (223, '（ ）是指在云计算基础设施上位用户提供应用软件部署和运行环境的服务', '{\"A\":\"SAAS\",\"B\":\"PAAS\",\"C\":\"IAAS\",\"D\":\"HAAS\"}', 'B', 1, 39);
INSERT INTO `tp_single` VALUES (224, '2008年，（）先后在无锡和北京建立了两个云计算中心', '{\"A\":\"IBM\",\"B\":\"Google\",\"C\":\"Amazon\",\"D\":\"\\u5fae\\u8f6f\"}', 'A', 1, 39);
INSERT INTO `tp_single` VALUES (225, '虚拟化资源指一些可以实现一定操作具有一定功能，但其本身是（ ）的资源，如计算池，存储池和网络池、数据库资源等，通过软件技术来实现相关的虚拟化功能包括虚拟环境、虚拟系统、虚拟平台', '{\"A\":\"\\u865a\\u62df\",\"B\":\"\\u771f\\u5b9e\",\"C\":\"\\u7269\\u7406\",\"D\":\"\\u5b9e\\u4f53\"}', 'A', 1, 39);
INSERT INTO `tp_single` VALUES (226, '一个有10个硬盘组成的Raid5阵列最多可以允许（）个硬盘出现故障不影响其数据的完整性', '{\"A\":\"1\\u4e2a\",\"B\":\"2\\u4e2a\",\"C\":\"4\\u4e2a\",\"D\":\"5\\u4e2a\"}', 'D', 1, 39);
INSERT INTO `tp_single` VALUES (227, 'SaaS是（ ）的简称', '{\"A\":\"\\u8f6f\\u4ef6\\u5373\\u670d\\u52a1\",\"B\":\"\\u5e73\\u53f0\\u5373\\u670d\\u52a1\",\"C\":\"\\u57fa\\u7840\\u8bbe\\u65bd\\u5373\\u670d\\u52a1\",\"D\":\"\\u786c\\u4ef6\\u5373\\u670d\\u52a1\"}', 'B', 1, 39);
INSERT INTO `tp_single` VALUES (228, '微软于2008年10月推出云计算操作系统是（）', '{\"A\":\"GoogleAppEngine\",\"B\":\"\\u84dd\\u4e91\",\"C\":\"Azure\",\"D\":\"EC2\"}', 'C', 1, 39);
INSERT INTO `tp_single` VALUES (229, '云计算体系结构的（）负责资源管理、任务管理用户管理和安全管理等工作', '{\"A\":\"\\u7269\\u7406\\u8d44\\u6e90\\u5c42\",\"B\":\"\\u8d44\\u6e90\\u6c60\\u5c42\",\"C\":\"\\u7ba1\\u7406\\u4e2d\\u95f4\\u4ef6\\u5c42\",\"D\":\"SOA\\u6784\\u5efa\\u5c42\"}', 'C', 1, 39);
INSERT INTO `tp_single` VALUES (230, 'Raid0阵列的磁盘使用的冗余（用于备份的数据）比例是多少', '{\"A\":\"50%\",\"B\":\"25%\",\"C\":\"15%\",\"D\":\"0\"}', 'D', 1, 39);

-- ----------------------------
-- Table structure for tp_student
-- ----------------------------
DROP TABLE IF EXISTS `tp_student`;
CREATE TABLE `tp_student`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `studentId` bigint NOT NULL COMMENT '学生id',
  `username` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学生名字',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `belongclassId` tinyint NULL DEFAULT 1 COMMENT '所属班级',
  `createTime` int NOT NULL COMMENT '注册时间戳',
  `lastTime` int NULL DEFAULT NULL COMMENT '最后登录时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tp_student
-- ----------------------------
INSERT INTO `tp_student` VALUES (1, 184020110, '冯仁贵', '14e1b600b1fd579f47433b88e8d85291', 1, 1597222008, 1597222008);
INSERT INTO `tp_student` VALUES (5, 184020108, '陈海威', '0ca3cdf488289d01585bd3e65e57d541', 1, 1597302094, 1597302094);
INSERT INTO `tp_student` VALUES (6, 184020116, '梁展', '14e1b600b1fd579f47433b88e8d85291', 1, 1597322351, 1597322351);
INSERT INTO `tp_student` VALUES (13, 184020123, '梁洲文', '14e1b600b1fd579f47433b88e8d85291', 1, 1597566052, 1597566052);

-- ----------------------------
-- Table structure for tp_teacher
-- ----------------------------
DROP TABLE IF EXISTS `tp_teacher`;
CREATE TABLE `tp_teacher`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录用户名',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录密码',
  `teacherName` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '超级管理员' COMMENT '默认超级管理员 老师名称',
  `belongClassId` int NOT NULL DEFAULT 1,
  `level` tinyint(1) NULL DEFAULT 1 COMMENT '等级\r\n1为超级管理员\r\n2为教师',
  `lastTime` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tp_teacher
-- ----------------------------
INSERT INTO `tp_teacher` VALUES (1, 'admin', 'c3284d0f94606de1fd2af172aba15bf3', '超级管理员', 1, 1, 1597381706);
INSERT INTO `tp_teacher` VALUES (2, '480918', '1acabbab37632d7232ae8967166f4f89', '超级管理员', 1, 1, 1597381706);
INSERT INTO `tp_teacher` VALUES (10, 'liaoying', '14e1b600b1fd579f47433b88e8d85291', '廖㼆', 1, 1, 1597643134);
INSERT INTO `tp_teacher` VALUES (11, 'weijinhua', '14e1b600b1fd579f47433b88e8d85291', '韦金华', 1, 1, 1597643269);
INSERT INTO `tp_teacher` VALUES (12, 'pangfengjuan', '14e1b600b1fd579f47433b88e8d85291', '庞凤娟', 1, 1, 1597643419);
INSERT INTO `tp_teacher` VALUES (13, 'mengdongling', '14e1b600b1fd579f47433b88e8d85291', '蒙冬灵', 1, 1, 1597643702);

SET FOREIGN_KEY_CHECKS = 1;
