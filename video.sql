/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : video

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-05-16 18:43:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admins
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL COMMENT '用户名',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `truename` varchar(20) NOT NULL COMMENT '真实姓名',
  `gid` int(10) NOT NULL COMMENT '角色id',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态：0正常，1禁用',
  `add_time` int(10) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admins
-- ----------------------------
INSERT INTO `admins` VALUES ('1', 'admin', 'a66abb5684c45962d887564f08346e8d', '张三丰', '1', '0', '1515650649');
INSERT INTO `admins` VALUES ('2', 'test', 'a66abb5684c45962d887564f08346e8d', 'tests', '1', '1', '0');

-- ----------------------------
-- Table structure for admin_groups
-- ----------------------------
DROP TABLE IF EXISTS `admin_groups`;
CREATE TABLE `admin_groups` (
  `gid` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `title` varchar(20) NOT NULL COMMENT '角色名称',
  `rights` text NOT NULL COMMENT '角色权限，json',
  PRIMARY KEY (`gid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_groups
-- ----------------------------
INSERT INTO `admin_groups` VALUES ('1', '系统管理员', '[1,4,7,5,6,2,8,9,10,11,12,3,13,14,15,16,17,18,19,20,21,22,23,24,25,26]');
INSERT INTO `admin_groups` VALUES ('2', '开发人员', '[1,4,7,5,6,2,8,9,10,11,12,3]');

-- ----------------------------
-- Table structure for admin_menus
-- ----------------------------
DROP TABLE IF EXISTS `admin_menus`;
CREATE TABLE `admin_menus` (
  `mid` int(10) NOT NULL AUTO_INCREMENT,
  `pid` int(10) NOT NULL DEFAULT '0' COMMENT '上级菜单',
  `ord` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `title` varchar(20) NOT NULL,
  `controller` varchar(30) NOT NULL COMMENT '控制器名称',
  `method` varchar(30) NOT NULL COMMENT '菜单名称',
  `ishidden` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否隐藏：0正常显示，1隐藏',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态：0正常，1禁用',
  PRIMARY KEY (`mid`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_menus
-- ----------------------------
INSERT INTO `admin_menus` VALUES ('1', '0', '0', '管理员管理', '', '', '0', '0');
INSERT INTO `admin_menus` VALUES ('2', '0', '0', '权限管理', '', '', '0', '0');
INSERT INTO `admin_menus` VALUES ('3', '0', '0', '系统设置', '', '', '0', '0');
INSERT INTO `admin_menus` VALUES ('4', '1', '0', '管理员列表', 'Admin', 'index', '0', '0');
INSERT INTO `admin_menus` VALUES ('5', '1', '0', '管理员添加', 'Admin', 'add', '1', '0');
INSERT INTO `admin_menus` VALUES ('6', '1', '0', '管理员保存', 'Admin', 'save', '1', '0');
INSERT INTO `admin_menus` VALUES ('7', '4', '0', '角色测试', 'Admin', 'tests', '0', '0');
INSERT INTO `admin_menus` VALUES ('8', '2', '0', '菜单管理', 'Menu', 'index', '0', '0');
INSERT INTO `admin_menus` VALUES ('9', '2', '0', '菜单添加', 'Menu', 'add', '1', '0');
INSERT INTO `admin_menus` VALUES ('10', '2', '0', '菜单保存', 'Menu', 'save', '1', '0');
INSERT INTO `admin_menus` VALUES ('11', '2', '0', '角色管理', 'Roles', 'index', '0', '0');
INSERT INTO `admin_menus` VALUES ('12', '2', '0', '角色保存', 'Roles', 'save', '1', '0');
INSERT INTO `admin_menus` VALUES ('13', '3', '0', '网站设置', 'Site', 'index', '0', '0');
INSERT INTO `admin_menus` VALUES ('14', '3', '0', '保存设置', 'Site', 'save', '1', '0');
INSERT INTO `admin_menus` VALUES ('15', '0', '0', '标签管理', '', '', '0', '0');
INSERT INTO `admin_menus` VALUES ('16', '15', '0', '频道标签', 'Labels', 'channel', '0', '0');
INSERT INTO `admin_menus` VALUES ('17', '15', '0', '资费标签', 'Labels', 'charge', '0', '0');
INSERT INTO `admin_menus` VALUES ('18', '15', '0', '地区标签', 'Labels', 'area', '0', '0');
INSERT INTO `admin_menus` VALUES ('19', '0', '0', '影片管理', '', '', '0', '0');
INSERT INTO `admin_menus` VALUES ('20', '19', '0', '影片列表', 'Video', 'index', '0', '0');
INSERT INTO `admin_menus` VALUES ('21', '19', '0', '添加影片', 'Video', 'add', '1', '0');
INSERT INTO `admin_menus` VALUES ('22', '19', '0', '保存影片', 'Video', 'save', '1', '0');
INSERT INTO `admin_menus` VALUES ('23', '19', '0', '图片上传', 'Video', 'upload_img', '1', '0');
INSERT INTO `admin_menus` VALUES ('24', '0', '0', '幻灯片管理', '', '', '0', '0');
INSERT INTO `admin_menus` VALUES ('25', '24', '0', '首页首屏', 'Slide', 'index', '0', '0');
INSERT INTO `admin_menus` VALUES ('26', '24', '0', '幻灯片保存', 'Slide', 'save', '1', '0');

-- ----------------------------
-- Table structure for sites
-- ----------------------------
DROP TABLE IF EXISTS `sites`;
CREATE TABLE `sites` (
  `names` varchar(50) NOT NULL,
  `values` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sites
-- ----------------------------
INSERT INTO `sites` VALUES ('site', '\"\\u7231\\u5947\\u827a\\uff08\\u4eff\\uff09\"');

-- ----------------------------
-- Table structure for slide
-- ----------------------------
DROP TABLE IF EXISTS `slide`;
CREATE TABLE `slide` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '类型：0首页首屏',
  `ord` tinyint(2) NOT NULL DEFAULT '0' COMMENT '排序',
  `title` varchar(30) NOT NULL COMMENT '标题',
  `url` varchar(255) NOT NULL COMMENT '链接地址',
  `img` varchar(255) NOT NULL COMMENT '图片地址',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of slide
-- ----------------------------
INSERT INTO `slide` VALUES ('2', '0', '0', '卫斯理2：余文乐燃起科幻风云', 'http://sdfasdfasdfasdf', '/uploads/20180418\\ba6c4d18ff471b02f9be94c85e9844f0.jpg');
INSERT INTO `slide` VALUES ('3', '0', '0', '街舞剧情升级：陈伟霆送抱抱', 'http://asfasdfa', '/uploads/20180418\\c2f0d9773673ae71c3248584c007910e.jpg');
INSERT INTO `slide` VALUES ('4', '0', '0', '好久不见：杨子姗郑恺异国相逢', 'http://adfasfdad', '/uploads/20180418\\c614771b1d2266095d10fd99fe07d218.jpg');
INSERT INTO `slide` VALUES ('5', '0', '0', '远大前程：陈思诚回永鑫复仇', 'http://asfdasdfasdfadsfa', '/uploads/20180418\\921031b3296df12c3bd52148434806f4.jpg');
INSERT INTO `slide` VALUES ('6', '0', '0', '魔都风云：再现乱世上海滩', 'http://asdfasdfasdfasdf', '/uploads/20180418\\810896bf49b5be6204070a3c90c6da24.jpg');
INSERT INTO `slide` VALUES ('7', '0', '0', '破冰者：罗晋潘之琳为爱出击', 'http://asdfasdfasdfaf', '/uploads/20180418\\19b910ce06d1e6a542520d7a8d8d84c4.jpg');
INSERT INTO `slide` VALUES ('8', '0', '0', '护宝联盟：阿娇陈楚河相爱相杀', 'http://asdfasdfasdfdas', '/uploads/20180418\\d230c9f10fcc345b6e3af9d54180d506.jpg');
INSERT INTO `slide` VALUES ('9', '0', '0', '2018北影节影展:高分佳片纵览', 'http://asdfasdfasdfadsfads', '/uploads/20180418\\50cd38c2de3e1dd50125e1e3d8a38756.jpg');
INSERT INTO `slide` VALUES ('10', '0', '0', '吴晓波:《十年二十人》之徐小平', 'http://asfasfasfasdfasd', '/uploads/20180418\\39544c425299aab8241476508bb72008.jpg');
INSERT INTO `slide` VALUES ('11', '0', '0', '埃及秘密：千年木乃伊离奇复活', 'http://adsfadsfasdf', '/uploads/20180418\\704a16aadaf59117a83bfc1f2aea8d3a.jpg');

-- ----------------------------
-- Table structure for video
-- ----------------------------
DROP TABLE IF EXISTS `video`;
CREATE TABLE `video` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `channel_id` int(10) NOT NULL COMMENT '频道',
  `charge_id` int(10) NOT NULL COMMENT '资费',
  `area_id` int(10) NOT NULL COMMENT '地区',
  `title` varchar(50) NOT NULL COMMENT '影片名称',
  `keywords` varchar(255) NOT NULL COMMENT '关键字',
  `desc` varchar(255) NOT NULL COMMENT '描述',
  `img` varchar(255) NOT NULL COMMENT '封面图url',
  `url` varchar(255) NOT NULL COMMENT '影片url',
  `pv` int(10) NOT NULL DEFAULT '0' COMMENT '点击量',
  `score` int(3) NOT NULL DEFAULT '0' COMMENT '影片评分',
  `is_vip` tinyint(1) NOT NULL COMMENT '是否vip才能看：0否，1是',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态：0下线，1正常',
  `add_time` int(10) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of video
-- ----------------------------
INSERT INTO `video` VALUES ('1', '2', '11', '13', '测试影片', '没阿斯蒂芬', '枯模压茜枯厅', '/uploads/20180413\\f14d13f942c8cce24ca8c04bfb35b820.jpg', 'http://www.php.demo/static/23.mp4', '0', '0', '0', '1', '1523603960');
INSERT INTO `video` VALUES ('2', '2', '11', '15', '测试影片二', 'sdfasfasdfasd', 'fasdfasdfadsfadfadsfadsfasdf', '/uploads/20180419\\f248d3d55bab4e151078aa972e4c8bc5.jpg', 'http://asfasdfas.mp4', '0', '0', '0', '1', '1523604076');
INSERT INTO `video` VALUES ('4', '3', '11', '13', '测试影片三', 'sdfasfasdfasd', 'fasdfasdfadsfadfadsfadsfasdf', '/uploads/20180420\\3e812a222d773d01f182920d87167541.jpg', 'http://asfasdfas.mp4', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for video_label
-- ----------------------------
DROP TABLE IF EXISTS `video_label`;
CREATE TABLE `video_label` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ord` int(3) NOT NULL DEFAULT '0' COMMENT '排序',
  `title` varchar(50) NOT NULL COMMENT '标签标题',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态：0正常，1禁用',
  `flag` varchar(50) NOT NULL COMMENT '标签分类标识',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of video_label
-- ----------------------------
INSERT INTO `video_label` VALUES ('1', '0', '电视剧', '0', 'channel');
INSERT INTO `video_label` VALUES ('2', '1', '电影', '0', 'channel');
INSERT INTO `video_label` VALUES ('3', '0', '综艺', '0', 'channel');
INSERT INTO `video_label` VALUES ('4', '0', '动漫', '0', 'channel');
INSERT INTO `video_label` VALUES ('5', '0', '记录片', '0', 'channel');
INSERT INTO `video_label` VALUES ('6', '0', '游戏', '0', 'channel');
INSERT INTO `video_label` VALUES ('7', '0', '资讯', '0', 'channel');
INSERT INTO `video_label` VALUES ('8', '0', '娱乐', '0', 'channel');
INSERT INTO `video_label` VALUES ('9', '5', '财经', '0', 'channel');
INSERT INTO `video_label` VALUES ('10', '5', '网络电影', '0', 'channel');
INSERT INTO `video_label` VALUES ('11', '0', '免费', '0', 'charge');
INSERT INTO `video_label` VALUES ('12', '0', '付费', '0', 'charge');
INSERT INTO `video_label` VALUES ('13', '0', '华语', '0', 'area');
INSERT INTO `video_label` VALUES ('14', '0', '香港', '0', 'area');
INSERT INTO `video_label` VALUES ('15', '0', '美国', '0', 'area');
INSERT INTO `video_label` VALUES ('16', '0', '欧洲', '0', 'area');
INSERT INTO `video_label` VALUES ('17', '0', '韩国', '0', 'area');
INSERT INTO `video_label` VALUES ('18', '0', '日本', '0', 'area');
INSERT INTO `video_label` VALUES ('19', '0', '泰国', '0', 'area');
INSERT INTO `video_label` VALUES ('20', '0', '其他', '0', 'area');
