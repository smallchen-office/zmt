/* -----------------------------------------------------------*/
/* Description:备份的数据表[结构]：zmt_ad,zmt_ad_position,zmt_admin_auth,zmt_admin_shop,zmt_admin_users,zmt_area,zmt_auth,zmt_auth_cate,zmt_brand,zmt_config,zmt_goods,zmt_goods_cate,zmt_goods_detail,zmt_goods_img,zmt_goods_spec,zmt_goods_stock,zmt_need,zmt_note,zmt_note_cate,zmt_order,zmt_order_log,zmt_shop,zmt_shop_auth,zmt_shop_cate,zmt_shop_group,zmt_shop_group_auth,zmt_shop_info,zmt_shop_info_detail,zmt_spec,zmt_spread*/
/* Description:备份的数据表[数据]：zmt_ad,zmt_ad_position,zmt_admin_auth,zmt_admin_shop,zmt_admin_users,zmt_area,zmt_auth,zmt_auth_cate,zmt_brand,zmt_config,zmt_goods,zmt_goods_cate,zmt_goods_detail,zmt_goods_img,zmt_goods_spec,zmt_goods_stock,zmt_need,zmt_note,zmt_note_cate,zmt_order,zmt_order_log,zmt_shop,zmt_shop_auth,zmt_shop_cate,zmt_shop_group,zmt_shop_group_auth,zmt_shop_info,zmt_shop_info_detail,zmt_spec,zmt_spread*/
/* Time: 2018-06-24 03:49:14*/
/* -----------------------------------------------------------*/
/* SQLFile Label：#1*/
/* -----------------------------------------------------------*/


/* 表的结构 zmt_ad*/ 
DROP TABLE IF EXISTS zmt_ad;
CREATE TABLE zmt_ad (
  id int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  pid int(11) DEFAULT NULL COMMENT '广告位编号',
  title varchar(50) DEFAULT NULL COMMENT '标题',
  link varchar(255) DEFAULT NULL COMMENT '链接',
  images varchar(255) DEFAULT NULL COMMENT '广告图片',
  alt varchar(50) DEFAULT NULL COMMENT '简介',
  is_open tinyint(4) DEFAULT '1' COMMENT '是否启用',
  sort varchar(5) DEFAULT '50' COMMENT '排序',
  create_at datetime DEFAULT NULL COMMENT '创建时间',
  update_at datetime DEFAULT NULL COMMENT '更新时间',
  start_at datetime DEFAULT NULL COMMENT '开始时间',
  end_at datetime DEFAULT NULL COMMENT '结束时间',
  positions varchar(255) DEFAULT 'ALL_' COMMENT '显示区域',
  click_count int(11) DEFAULT '0' COMMENT '点击次数',
  is_target tinyint(4) DEFAULT '0' COMMENT '新窗口打开',
  PRIMARY KEY (id),
  KEY FK_Reference_1 (pid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='广告表';

/* 表的结构 zmt_ad_position*/ 
DROP TABLE IF EXISTS zmt_ad_position;
CREATE TABLE zmt_ad_position (
  id int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  title varchar(50) DEFAULT NULL COMMENT '标题',
  width varchar(10) DEFAULT NULL COMMENT '长度',
  height varchar(10) DEFAULT NULL COMMENT '宽度',
  `type` tinyint(4) DEFAULT '0' COMMENT '类型',
  `status` tinyint(4) DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (id)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='广告位表';

/* 表的结构 zmt_admin_auth*/ 
DROP TABLE IF EXISTS zmt_admin_auth;
CREATE TABLE zmt_admin_auth (
  id int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  pid int(11) DEFAULT '0',
  deep int(11) DEFAULT '0',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  ico varchar(50) DEFAULT NULL,
  control varchar(255) DEFAULT '#' COMMENT '控制器',
  `action` varchar(255) DEFAULT 'index' COMMENT '方法',
  `status` tinyint(4) DEFAULT '0' COMMENT '状态',
  sort varchar(5) DEFAULT '50',
  create_at datetime DEFAULT NULL COMMENT '创建时间',
  update_at datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (id)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='管理员权限表';

/* 表的结构 zmt_admin_shop*/ 
DROP TABLE IF EXISTS zmt_admin_shop;
CREATE TABLE zmt_admin_shop (
  id int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  shop_id int(11) DEFAULT NULL COMMENT '门店编号',
  admin_id int(11) DEFAULT NULL COMMENT '序号',
  attr varchar(255) DEFAULT NULL COMMENT '权限',
  PRIMARY KEY (id),
  KEY FK_Reference_5 (admin_id),
  KEY FK_Reference_6 (shop_id)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员店铺表';

/* 表的结构 zmt_admin_users*/ 
DROP TABLE IF EXISTS zmt_admin_users;
CREATE TABLE zmt_admin_users (
  id int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  username varchar(20) DEFAULT NULL COMMENT '登录账号',
  `password` varchar(50) DEFAULT '123456' COMMENT '登录密码',
  realname varchar(50) DEFAULT NULL COMMENT '真实姓名',
  telephone varchar(20) DEFAULT NULL,
  create_at datetime DEFAULT NULL COMMENT '创建时间',
  update_at datetime DEFAULT NULL COMMENT '更新时间',
  last_ip varchar(20) DEFAULT '127.0.0.1' COMMENT '上次地址',
  login_at datetime DEFAULT NULL COMMENT '上次时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (id)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='管理员列表';

/* 表的结构 zmt_area*/ 
DROP TABLE IF EXISTS zmt_area;
CREATE TABLE zmt_area (
  id int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  pid int(11) DEFAULT NULL COMMENT '父级编码',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  deep tinyint(4) DEFAULT NULL COMMENT '深度',
  sort varchar(5) DEFAULT NULL COMMENT '排序',
  region varchar(50) DEFAULT NULL COMMENT '大区名称',
  PRIMARY KEY (id)
) ENGINE=MyISAM AUTO_INCREMENT=3409 DEFAULT CHARSET=utf8 COMMENT='地区表';

/* 表的结构 zmt_auth*/ 
DROP TABLE IF EXISTS zmt_auth;
CREATE TABLE zmt_auth (
  id int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  cate_id int(11) DEFAULT NULL COMMENT '分类编码',
  `name` varchar(200) DEFAULT NULL COMMENT '名称',
  control varchar(200) DEFAULT NULL COMMENT '控制器',
  brief varchar(50) DEFAULT NULL COMMENT '简介',
  `status` tinyint(4) DEFAULT '0' COMMENT '状态',
  seo_title varchar(50) DEFAULT NULL COMMENT 'SEO标题',
  seo_keywords varchar(50) DEFAULT NULL COMMENT 'SEO关键字',
  seo_description varchar(200) DEFAULT NULL COMMENT 'SEO描述',
  PRIMARY KEY (id),
  KEY FK_Reference_3 (cate_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='权限表';

/* 表的结构 zmt_auth_cate*/ 
DROP TABLE IF EXISTS zmt_auth_cate;
CREATE TABLE zmt_auth_cate (
  id int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='权限分类表';

/* 表的结构 zmt_brand*/ 
DROP TABLE IF EXISTS zmt_brand;
CREATE TABLE zmt_brand (
  id int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  sort varchar(5) DEFAULT '50' COMMENT '排序',
  is_recommend tinyint(4) DEFAULT '0' COMMENT '推荐',
  PRIMARY KEY (id)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='品牌表';

/* 表的结构 zmt_config*/ 
DROP TABLE IF EXISTS zmt_config;
CREATE TABLE zmt_config (
  `key` varchar(20) NOT NULL DEFAULT '' COMMENT '索引',
  `value` varchar(20) DEFAULT NULL COMMENT '值',
  detail varchar(255) DEFAULT NULL COMMENT '备注',
  `type` tinyint(4) DEFAULT '0' COMMENT '属性',
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='系统配置表';

/* 表的结构 zmt_goods*/ 
DROP TABLE IF EXISTS zmt_goods;
CREATE TABLE zmt_goods (
  id int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  cate_id int(11) DEFAULT NULL COMMENT '分类序号',
  brand_id int(11) DEFAULT NULL COMMENT '品牌编号',
  `name` varchar(50) DEFAULT NULL COMMENT '短名称',
  longname varchar(200) DEFAULT NULL COMMENT '长名称',
  firstcode varchar(10) DEFAULT NULL COMMENT '首字母',
  PRIMARY KEY (id),
  KEY FK_Reference_13 (brand_id),
  KEY FK_Reference_7 (cate_id)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='商品表';

/* 表的结构 zmt_goods_cate*/ 
DROP TABLE IF EXISTS zmt_goods_cate;
CREATE TABLE zmt_goods_cate (
  id int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  pid int(11) DEFAULT '0' COMMENT '上级序号',
  deep int(11) DEFAULT '0',
  pid_path varchar(255) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  detail text COMMENT '备注',
  images varchar(255) DEFAULT NULL COMMENT '图片',
  shows tinyint(4) DEFAULT '0' COMMENT '显示样式\r\n            0：点\r\n            1：图片',
  sort varchar(5) DEFAULT '50' COMMENT '排序',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态\r\n            0：隐藏\r\n            1：正常\r\n            -1：作废',
  PRIMARY KEY (id)
) ENGINE=MyISAM AUTO_INCREMENT=443 DEFAULT CHARSET=utf8 COMMENT='商品分类表';

/* 表的结构 zmt_goods_detail*/ 
DROP TABLE IF EXISTS zmt_goods_detail;
CREATE TABLE zmt_goods_detail (
  id int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  goods_id int(11) DEFAULT NULL COMMENT '商品编号',
  shop_id int(11) DEFAULT NULL COMMENT '店铺序号',
  title varchar(255) DEFAULT NULL COMMENT '标题',
  img varchar(255) DEFAULT 'img' COMMENT '头部图片',
  detail text COMMENT '详情',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态\r\n            0:禁用\r\n            1:正常',
  create_at datetime DEFAULT NULL,
  update_at datetime DEFAULT NULL,
  PRIMARY KEY (id),
  KEY FK_Reference_17 (shop_id),
  KEY FK_Reference_8 (goods_id)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='商品详情表';

/* 表的结构 zmt_goods_img*/ 
DROP TABLE IF EXISTS zmt_goods_img;
CREATE TABLE zmt_goods_img (
  id int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  goods_id int(11) DEFAULT NULL COMMENT '商品序号',
  images varchar(255) DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (id),
  KEY FK_Reference_9 (goods_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品图片表';

/* 表的结构 zmt_goods_spec*/ 
DROP TABLE IF EXISTS zmt_goods_spec;
CREATE TABLE zmt_goods_spec (
  id int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  spec_id int(11) DEFAULT NULL COMMENT '规格编号',
  goods_id int(11) DEFAULT NULL COMMENT '序号',
  `value` varchar(200) DEFAULT NULL COMMENT '值',
  stock decimal(14,4) DEFAULT NULL COMMENT '库存量',
  sale_money decimal(14,4) DEFAULT NULL COMMENT '售价',
  special_money decimal(14,4) DEFAULT NULL COMMENT '特价',
  `status` tinyint(4) DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (id),
  KEY FK_Reference_14 (spec_id),
  KEY FK_Reference_20 (goods_id)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='商品规格表';

/* 表的结构 zmt_goods_stock*/ 
DROP TABLE IF EXISTS zmt_goods_stock;
CREATE TABLE zmt_goods_stock (
  id int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  goods_spec_id int(11) DEFAULT NULL COMMENT '规格编号',
  num0 decimal(14,4) DEFAULT NULL COMMENT '期初数量',
  num1 decimal(14,4) DEFAULT NULL COMMENT '变化数量',
  num2 decimal(14,4) DEFAULT NULL COMMENT '结余数量',
  detail varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (id),
  KEY FK_Reference_15 (goods_spec_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品库存表';

/* 表的结构 zmt_need*/ 
DROP TABLE IF EXISTS zmt_need;
CREATE TABLE zmt_need (
  id int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  shop_id int(11) DEFAULT NULL COMMENT '需求店铺',
  goods_id int(11) DEFAULT NULL COMMENT '商品编号',
  detail text COMMENT '备注',
  people varchar(50) DEFAULT NULL COMMENT '联系人',
  telephone varchar(20) DEFAULT NULL COMMENT '联系电话',
  create_at datetime DEFAULT NULL COMMENT '发布时间',
  `type` tinyint(4) DEFAULT NULL COMMENT '发布类型\r\n            0:求购\r\n            1:销售\r\n            2:推荐',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态\r\n            -1:取消\r\n            0:待审核\r\n            1:审核通过，已发布\r\n            2:审核失败\r\n            3:已下架',
  PRIMARY KEY (id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='需求发布表';

/* 表的结构 zmt_note*/ 
DROP TABLE IF EXISTS zmt_note;
CREATE TABLE zmt_note (
  id int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  cate_id int(11) DEFAULT NULL COMMENT '分类编号',
  head_img varchar(50) DEFAULT NULL COMMENT '头部图片',
  title varchar(255) DEFAULT NULL COMMENT '标题',
  abstract varchar(200) DEFAULT NULL COMMENT '摘要',
  note text COMMENT '详情',
  link varchar(50) DEFAULT NULL COMMENT '链接',
  is_show tinyint(4) DEFAULT '0' COMMENT '是否显示',
  create_at datetime DEFAULT NULL COMMENT '创建时间',
  add_at datetime DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (id),
  KEY FK_Reference_2 (cate_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文章表';

/* 表的结构 zmt_note_cate*/ 
DROP TABLE IF EXISTS zmt_note_cate;
CREATE TABLE zmt_note_cate (
  id int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  pid int(11) DEFAULT NULL COMMENT '父级编号',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  sort varchar(5) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文章分类表';

/* 表的结构 zmt_order*/ 
DROP TABLE IF EXISTS zmt_order;
CREATE TABLE zmt_order (
  id int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态\r\n            0:待支付\r\n            1:已支付\r\n            -1:支付失败\r\n            2:商家已确认\r\n            -2:商家取消\r\n            3:待出库\r\n            4:已出库\r\n            5:正在运输\r\n            6:待确认\r\n            7:已确认\r\n            -7:取消确认\r\n            8:取消订单',
  create_at datetime DEFAULT NULL COMMENT '创建时间',
  update_at datetime DEFAULT NULL COMMENT '上次更新',
  shop_id int(11) DEFAULT NULL COMMENT '店铺',
  user_id int(11) DEFAULT NULL COMMENT '会员',
  goods_id int(11) DEFAULT NULL COMMENT '商品编号',
  goods_name varchar(255) DEFAULT NULL COMMENT '商品名称',
  number decimal(14,4) DEFAULT NULL,
  all_money decimal(14,4) DEFAULT '0.0000' COMMENT '成交价格',
  sale_money decimal(14,4) DEFAULT '0.0000' COMMENT '定金',
  paytype tinyint(4) DEFAULT NULL COMMENT '支付方式\r\n            0:货到付款\r\n            1:现金\r\n            2:微信\r\n            3:支付宝\r\n            4:网银\r\n            5:其他',
  paycode varchar(255) DEFAULT NULL COMMENT '支付编码',
  address varchar(255) DEFAULT NULL COMMENT '配送地址',
  sendtype tinyint(4) DEFAULT NULL COMMENT '配送方式\r\n            0:默认方式\r\n            1:自提\r\n            2:人员配送\r\n            3:物流车',
  sendmoney decimal(14,4) DEFAULT '0.0000' COMMENT '运费',
  people varchar(50) DEFAULT NULL COMMENT '联系人',
  telephone varchar(20) DEFAULT NULL COMMENT '联系方式',
  PRIMARY KEY (id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单表';

/* 表的结构 zmt_order_log*/ 
DROP TABLE IF EXISTS zmt_order_log;
CREATE TABLE zmt_order_log (
  id int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  order_id int(11) DEFAULT NULL COMMENT '订单编号',
  status0 tinyint(4) DEFAULT NULL COMMENT '初始状态值',
  status1 tinyint(4) DEFAULT NULL COMMENT '变更状态值',
  create_at datetime DEFAULT NULL COMMENT '变更时间',
  detail varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (id),
  KEY FK_Reference_19 (order_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单日志';

/* 表的结构 zmt_shop*/ 
DROP TABLE IF EXISTS zmt_shop;
CREATE TABLE zmt_shop (
  id int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  cate_id int(11) DEFAULT NULL COMMENT '分类编号',
  `name` varchar(100) DEFAULT NULL COMMENT '店铺名称',
  username varchar(50) DEFAULT NULL COMMENT '登录用户',
  `password` varchar(50) DEFAULT NULL COMMENT '登录密码',
  author varchar(50) DEFAULT NULL COMMENT '联系人',
  telephone varchar(20) DEFAULT NULL COMMENT '联系方式',
  province_id int(11) DEFAULT '0' COMMENT '省份',
  city_id int(11) DEFAULT '0',
  area_id varchar(255) DEFAULT '0',
  map varchar(255) DEFAULT NULL COMMENT '地图标识',
  address varchar(255) DEFAULT NULL COMMENT '详细地址',
  content text COMMENT '店铺简介',
  `status` tinyint(4) DEFAULT '0' COMMENT '状态\r\n            -1：禁用\r\n            0：未开业\r\n            1：正常\r\n            2：闭店',
  create_at datetime DEFAULT NULL COMMENT '创建时间',
  audit_at datetime DEFAULT NULL COMMENT '审核时间',
  update_at datetime DEFAULT NULL COMMENT '更新时间',
  spread int(11) DEFAULT '0' COMMENT '推荐人',
  realmoney decimal(14,4) DEFAULT '0.0000' COMMENT '实际余额',
  freezemoney decimal(14,4) DEFAULT '0.0000' COMMENT '冻结余额',
  `type` tinyint(4) DEFAULT '1' COMMENT '类型\r\n            0:自营\r\n            1:加盟',
  PRIMARY KEY (id),
  KEY FK_Reference_4 (cate_id)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='店铺表';

/* 表的结构 zmt_shop_auth*/ 
DROP TABLE IF EXISTS zmt_shop_auth;
CREATE TABLE zmt_shop_auth (
  id int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  ico varchar(50) DEFAULT NULL COMMENT '图标',
  image varchar(50) DEFAULT NULL COMMENT '背景',
  control varchar(255) DEFAULT NULL COMMENT '控制器',
  `status` tinyint(4) DEFAULT '0' COMMENT '状态',
  sort varchar(5) DEFAULT '50',
  create_at datetime DEFAULT NULL COMMENT '创建时间',
  update_at datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (id)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='店铺分类权限';

/* 表的结构 zmt_shop_cate*/ 
DROP TABLE IF EXISTS zmt_shop_cate;
CREATE TABLE zmt_shop_cate (
  id int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  detail varchar(255) DEFAULT NULL COMMENT '简介',
  create_at datetime DEFAULT NULL COMMENT '创建日期',
  update_at datetime DEFAULT NULL COMMENT '更新日期',
  auth varchar(255) DEFAULT NULL COMMENT '权限',
  PRIMARY KEY (id)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='店铺分类表';

/* 表的结构 zmt_shop_group*/ 
DROP TABLE IF EXISTS zmt_shop_group;
CREATE TABLE zmt_shop_group (
  id int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  shop_id int(11) DEFAULT NULL COMMENT '店铺序号',
  cate_id int(11) DEFAULT NULL COMMENT '序号',
  auth_id int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '0',
  detail text,
  PRIMARY KEY (id),
  KEY FK_Reference_16 (shop_id),
  KEY FK_Reference_23 (cate_id),
  KEY FK_Reference_24 (auth_id)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='店铺操作分类表';

/* 表的结构 zmt_shop_group_auth*/ 
DROP TABLE IF EXISTS zmt_shop_group_auth;
CREATE TABLE zmt_shop_group_auth (
  id int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  title varchar(50) DEFAULT NULL COMMENT '标题',
  link varchar(50) DEFAULT NULL COMMENT '链接',
  ico varchar(50) DEFAULT NULL COMMENT '图标',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (id)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='店铺权限表';

/* 表的结构 zmt_shop_info*/ 
DROP TABLE IF EXISTS zmt_shop_info;
CREATE TABLE zmt_shop_info (
  id int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `type` tinyint(4) DEFAULT '1' COMMENT '类型\r\n            1:文本\r\n            2:单选\r\n            3:多选\r\n            4:下拉‘\r\n            5:文本域',
  `values` varchar(255) DEFAULT NULL COMMENT '值',
  is_must tinyint(4) DEFAULT '0' COMMENT '是否必填\r\n            0:否\r\n            1:是',
  PRIMARY KEY (id)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='商铺资料表';

/* 表的结构 zmt_shop_info_detail*/ 
DROP TABLE IF EXISTS zmt_shop_info_detail;
CREATE TABLE zmt_shop_info_detail (
  id int(11) NOT NULL AUTO_INCREMENT,
  shop_id int(11) DEFAULT NULL COMMENT '序号',
  info_id int(11) DEFAULT NULL COMMENT '序号',
  `value` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '0' COMMENT '状态\r\n            0:正常\r\n            1:错误',
  PRIMARY KEY (id),
  KEY FK_Reference_21 (shop_id),
  KEY FK_Reference_22 (info_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商铺资料对应表';

/* 表的结构 zmt_spec*/ 
DROP TABLE IF EXISTS zmt_spec;
CREATE TABLE zmt_spec (
  id int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (id)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='规格表';

/* 表的结构 zmt_spread*/ 
DROP TABLE IF EXISTS zmt_spread;
CREATE TABLE zmt_spread (
  id int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  username varchar(50) DEFAULT NULL COMMENT '登录名',
  `password` varchar(50) DEFAULT NULL COMMENT '登录密码',
  pid int(11) DEFAULT NULL COMMENT '上级推广人员编码',
  realname varchar(50) DEFAULT NULL COMMENT '真实姓名',
  telephone varchar(50) DEFAULT NULL COMMENT '联系方式',
  PRIMARY KEY (id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='推广人员表';



/* 转存表中的数据:zmt_ad*/ 


/* 转存表中的数据:zmt_ad_position*/ 
INSERT INTO `zmt_ad_position` VALUES ('1','WAP首页轮播图(4)','100%','300px','0','0');


/* 转存表中的数据:zmt_admin_auth*/ 
INSERT INTO `zmt_admin_auth` VALUES ('1','0','0','我的店铺','home','#','#','0','50','0000-00-00 00:00:00','0000-00-00 00:00:00');
INSERT INTO `zmt_admin_auth` VALUES ('2','1','1','店铺信息','','MyShop','index','0','50','0000-00-00 00:00:00','0000-00-00 00:00:00');
INSERT INTO `zmt_admin_auth` VALUES ('3','1','1','我的管理员','','MyShop','admin','0','50','0000-00-00 00:00:00','0000-00-00 00:00:00');
INSERT INTO `zmt_admin_auth` VALUES ('4','1','1','我的产品','','MyShop','goods','0','50','0000-00-00 00:00:00','0000-00-00 00:00:00');
INSERT INTO `zmt_admin_auth` VALUES ('5','1','1','我的订单','','','order','0','50','0000-00-00 00:00:00','0000-00-00 00:00:00');
INSERT INTO `zmt_admin_auth` VALUES ('6','0','0','管理店铺','home','#','#','0','50','0000-00-00 00:00:00','0000-00-00 00:00:00');
INSERT INTO `zmt_admin_auth` VALUES ('7','6','1','店铺列表','','Shops','index','0','50','0000-00-00 00:00:00','0000-00-00 00:00:00');
INSERT INTO `zmt_admin_auth` VALUES ('8','6','1','店铺审核','','Shops','audit','0','50','0000-00-00 00:00:00','0000-00-00 00:00:00');
INSERT INTO `zmt_admin_auth` VALUES ('9','0','0','数据库管理','floppy-disk','#','#','0','50','0000-00-00 00:00:00','0000-00-00 00:00:00');
INSERT INTO `zmt_admin_auth` VALUES ('10','9','1','数据库备份','','DataBase','index','0','50','0000-00-00 00:00:00','0000-00-00 00:00:00');
INSERT INTO `zmt_admin_auth` VALUES ('11','9','1','数据库还原','','DataBase','bakList','0','50','0000-00-00 00:00:00','0000-00-00 00:00:00');
INSERT INTO `zmt_admin_auth` VALUES ('12','0','0','基础资料','tags','#','#','0','50','0000-00-00 00:00:00','0000-00-00 00:00:00');
INSERT INTO `zmt_admin_auth` VALUES ('13','12','1','品牌管理','','Setting','brandlist','0','50','0000-00-00 00:00:00','0000-00-00 00:00:00');
INSERT INTO `zmt_admin_auth` VALUES ('14','12','1','规格管理','','Setting','speclist','0','50','0000-00-00 00:00:00','0000-00-00 00:00:00');
INSERT INTO `zmt_admin_auth` VALUES ('15','12','1','商品分类','','Setting','goodscate','0','50','0000-00-00 00:00:00','0000-00-00 00:00:00');
INSERT INTO `zmt_admin_auth` VALUES ('16','12','1','商品设置','','Setting','goodslist','0','50','0000-00-00 00:00:00','0000-00-00 00:00:00');
INSERT INTO `zmt_admin_auth` VALUES ('17','12','1','店铺分类','','Setting','shopcate','0','50','0000-00-00 00:00:00','0000-00-00 00:00:00');


/* 转存表中的数据:zmt_admin_shop*/ 
INSERT INTO `zmt_admin_shop` VALUES ('1','1','2','all');


/* 转存表中的数据:zmt_admin_users*/ 
INSERT INTO `zmt_admin_users` VALUES ('2','admin','93be24541521e6fe437c5ca3dfaf5a82','王小明','王小明','2018-06-15 23:31:01','2018-06-15 23:35:54','127.0.0.1','0000-00-00 00:00:00','0');


/* 转存表中的数据:zmt_area*/ 
INSERT INTO `zmt_area` VALUES ('1','0','中国','0','0','');
INSERT INTO `zmt_area` VALUES ('2','1','北京','1','0','');
INSERT INTO `zmt_area` VALUES ('3','1','安徽','1','0','');
INSERT INTO `zmt_area` VALUES ('4','1','福建','1','0','');
INSERT INTO `zmt_area` VALUES ('5','1','甘肃','1','0','');
INSERT INTO `zmt_area` VALUES ('6','1','广东','1','0','');
INSERT INTO `zmt_area` VALUES ('7','1','广西','1','0','');
INSERT INTO `zmt_area` VALUES ('8','1','贵州','1','0','');
INSERT INTO `zmt_area` VALUES ('9','1','海南','1','0','');
INSERT INTO `zmt_area` VALUES ('10','1','河北','1','0','');
INSERT INTO `zmt_area` VALUES ('11','1','河南','1','0','');
INSERT INTO `zmt_area` VALUES ('12','1','黑龙江','1','0','');
INSERT INTO `zmt_area` VALUES ('13','1','湖北','1','0','');
INSERT INTO `zmt_area` VALUES ('14','1','湖南','1','0','');
INSERT INTO `zmt_area` VALUES ('15','1','吉林','1','0','');
INSERT INTO `zmt_area` VALUES ('16','1','江苏','1','0','');
INSERT INTO `zmt_area` VALUES ('17','1','江西','1','0','');
INSERT INTO `zmt_area` VALUES ('18','1','辽宁','1','0','');
INSERT INTO `zmt_area` VALUES ('19','1','内蒙古','1','0','');
INSERT INTO `zmt_area` VALUES ('20','1','宁夏','1','0','');
INSERT INTO `zmt_area` VALUES ('21','1','青海','1','0','');
INSERT INTO `zmt_area` VALUES ('22','1','山东','1','0','');
INSERT INTO `zmt_area` VALUES ('23','1','山西','1','0','');
INSERT INTO `zmt_area` VALUES ('24','1','陕西','1','0','');
INSERT INTO `zmt_area` VALUES ('25','1','上海','1','0','');
INSERT INTO `zmt_area` VALUES ('26','1','四川','1','0','');
INSERT INTO `zmt_area` VALUES ('27','1','天津','1','0','');
INSERT INTO `zmt_area` VALUES ('28','1','西藏','1','0','');
INSERT INTO `zmt_area` VALUES ('29','1','新疆','1','0','');
INSERT INTO `zmt_area` VALUES ('30','1','云南','1','0','');
INSERT INTO `zmt_area` VALUES ('31','1','浙江','1','0','');
INSERT INTO `zmt_area` VALUES ('32','1','重庆','1','0','');
INSERT INTO `zmt_area` VALUES ('33','1','香港','1','0','');
INSERT INTO `zmt_area` VALUES ('34','1','澳门','1','0','');
INSERT INTO `zmt_area` VALUES ('35','1','台湾','1','0','');
INSERT INTO `zmt_area` VALUES ('36','3','安庆','2','0','');
INSERT INTO `zmt_area` VALUES ('37','3','蚌埠','2','0','');
INSERT INTO `zmt_area` VALUES ('38','3','巢湖','2','0','');
INSERT INTO `zmt_area` VALUES ('39','3','池州','2','0','');
INSERT INTO `zmt_area` VALUES ('40','3','滁州','2','0','');
INSERT INTO `zmt_area` VALUES ('41','3','阜阳','2','0','');
INSERT INTO `zmt_area` VALUES ('42','3','淮北','2','0','');
INSERT INTO `zmt_area` VALUES ('43','3','淮南','2','0','');
INSERT INTO `zmt_area` VALUES ('44','3','黄山','2','0','');
INSERT INTO `zmt_area` VALUES ('45','3','六安','2','0','');
INSERT INTO `zmt_area` VALUES ('46','3','马鞍山','2','0','');
INSERT INTO `zmt_area` VALUES ('47','3','宿州','2','0','');
INSERT INTO `zmt_area` VALUES ('48','3','铜陵','2','0','');
INSERT INTO `zmt_area` VALUES ('49','3','芜湖','2','0','');
INSERT INTO `zmt_area` VALUES ('50','3','宣城','2','0','');
INSERT INTO `zmt_area` VALUES ('51','3','亳州','2','0','');
INSERT INTO `zmt_area` VALUES ('52','2','北京','2','0','');
INSERT INTO `zmt_area` VALUES ('53','4','福州','2','0','');
INSERT INTO `zmt_area` VALUES ('54','4','龙岩','2','0','');
INSERT INTO `zmt_area` VALUES ('55','4','南平','2','0','');
INSERT INTO `zmt_area` VALUES ('56','4','宁德','2','0','');
INSERT INTO `zmt_area` VALUES ('57','4','莆田','2','0','');
INSERT INTO `zmt_area` VALUES ('58','4','泉州','2','0','');
INSERT INTO `zmt_area` VALUES ('59','4','三明','2','0','');
INSERT INTO `zmt_area` VALUES ('60','4','厦门','2','0','');
INSERT INTO `zmt_area` VALUES ('61','4','漳州','2','0','');
INSERT INTO `zmt_area` VALUES ('62','5','兰州','2','0','');
INSERT INTO `zmt_area` VALUES ('63','5','白银','2','0','');
INSERT INTO `zmt_area` VALUES ('64','5','定西','2','0','');
INSERT INTO `zmt_area` VALUES ('65','5','甘南','2','0','');
INSERT INTO `zmt_area` VALUES ('66','5','嘉峪关','2','0','');
INSERT INTO `zmt_area` VALUES ('67','5','金昌','2','0','');
INSERT INTO `zmt_area` VALUES ('68','5','酒泉','2','0','');
INSERT INTO `zmt_area` VALUES ('69','5','临夏','2','0','');
INSERT INTO `zmt_area` VALUES ('70','5','陇南','2','0','');
INSERT INTO `zmt_area` VALUES ('71','5','平凉','2','0','');
INSERT INTO `zmt_area` VALUES ('72','5','庆阳','2','0','');
INSERT INTO `zmt_area` VALUES ('73','5','天水','2','0','');
INSERT INTO `zmt_area` VALUES ('74','5','武威','2','0','');
INSERT INTO `zmt_area` VALUES ('75','5','张掖','2','0','');
INSERT INTO `zmt_area` VALUES ('76','6','广州','2','0','');
INSERT INTO `zmt_area` VALUES ('77','6','深圳','2','0','');
INSERT INTO `zmt_area` VALUES ('78','6','潮州','2','0','');
INSERT INTO `zmt_area` VALUES ('79','6','东莞','2','0','');
INSERT INTO `zmt_area` VALUES ('80','6','佛山','2','0','');
INSERT INTO `zmt_area` VALUES ('81','6','河源','2','0','');
INSERT INTO `zmt_area` VALUES ('82','6','惠州','2','0','');
INSERT INTO `zmt_area` VALUES ('83','6','江门','2','0','');
INSERT INTO `zmt_area` VALUES ('84','6','揭阳','2','0','');
INSERT INTO `zmt_area` VALUES ('85','6','茂名','2','0','');
INSERT INTO `zmt_area` VALUES ('86','6','梅州','2','0','');
INSERT INTO `zmt_area` VALUES ('87','6','清远','2','0','');
INSERT INTO `zmt_area` VALUES ('88','6','汕头','2','0','');
INSERT INTO `zmt_area` VALUES ('89','6','汕尾','2','0','');
INSERT INTO `zmt_area` VALUES ('90','6','韶关','2','0','');
INSERT INTO `zmt_area` VALUES ('91','6','阳江','2','0','');
INSERT INTO `zmt_area` VALUES ('92','6','云浮','2','0','');
INSERT INTO `zmt_area` VALUES ('93','6','湛江','2','0','');
INSERT INTO `zmt_area` VALUES ('94','6','肇庆','2','0','');
INSERT INTO `zmt_area` VALUES ('95','6','中山','2','0','');
INSERT INTO `zmt_area` VALUES ('96','6','珠海','2','0','');
INSERT INTO `zmt_area` VALUES ('97','7','南宁','2','0','');
INSERT INTO `zmt_area` VALUES ('98','7','桂林','2','0','');
INSERT INTO `zmt_area` VALUES ('99','7','百色','2','0','');
INSERT INTO `zmt_area` VALUES ('100','7','北海','2','0','');
INSERT INTO `zmt_area` VALUES ('101','7','崇左','2','0','');
INSERT INTO `zmt_area` VALUES ('102','7','防城港','2','0','');
INSERT INTO `zmt_area` VALUES ('103','7','贵港','2','0','');
INSERT INTO `zmt_area` VALUES ('104','7','河池','2','0','');
INSERT INTO `zmt_area` VALUES ('105','7','贺州','2','0','');
INSERT INTO `zmt_area` VALUES ('106','7','来宾','2','0','');
INSERT INTO `zmt_area` VALUES ('107','7','柳州','2','0','');
INSERT INTO `zmt_area` VALUES ('108','7','钦州','2','0','');
INSERT INTO `zmt_area` VALUES ('109','7','梧州','2','0','');
INSERT INTO `zmt_area` VALUES ('110','7','玉林','2','0','');
INSERT INTO `zmt_area` VALUES ('111','8','贵阳','2','0','');
INSERT INTO `zmt_area` VALUES ('112','8','安顺','2','0','');
INSERT INTO `zmt_area` VALUES ('113','8','毕节','2','0','');
INSERT INTO `zmt_area` VALUES ('114','8','六盘水','2','0','');
INSERT INTO `zmt_area` VALUES ('115','8','黔东南','2','0','');
INSERT INTO `zmt_area` VALUES ('116','8','黔南','2','0','');
INSERT INTO `zmt_area` VALUES ('117','8','黔西南','2','0','');
INSERT INTO `zmt_area` VALUES ('118','8','铜仁','2','0','');
INSERT INTO `zmt_area` VALUES ('119','8','遵义','2','0','');
INSERT INTO `zmt_area` VALUES ('120','9','海口','2','0','');
INSERT INTO `zmt_area` VALUES ('121','9','三亚','2','0','');
INSERT INTO `zmt_area` VALUES ('122','9','白沙','2','0','');
INSERT INTO `zmt_area` VALUES ('123','9','保亭','2','0','');
INSERT INTO `zmt_area` VALUES ('124','9','昌江','2','0','');
INSERT INTO `zmt_area` VALUES ('125','9','澄迈县','2','0','');
INSERT INTO `zmt_area` VALUES ('126','9','定安县','2','0','');
INSERT INTO `zmt_area` VALUES ('127','9','东方','2','0','');
INSERT INTO `zmt_area` VALUES ('128','9','乐东','2','0','');
INSERT INTO `zmt_area` VALUES ('129','9','临高县','2','0','');
INSERT INTO `zmt_area` VALUES ('130','9','陵水','2','0','');
INSERT INTO `zmt_area` VALUES ('131','9','琼海','2','0','');
INSERT INTO `zmt_area` VALUES ('132','9','琼中','2','0','');
INSERT INTO `zmt_area` VALUES ('133','9','屯昌县','2','0','');
INSERT INTO `zmt_area` VALUES ('134','9','万宁','2','0','');
INSERT INTO `zmt_area` VALUES ('135','9','文昌','2','0','');
INSERT INTO `zmt_area` VALUES ('136','9','五指山','2','0','');
INSERT INTO `zmt_area` VALUES ('137','9','儋州','2','0','');
INSERT INTO `zmt_area` VALUES ('138','10','石家庄','2','0','');
INSERT INTO `zmt_area` VALUES ('139','10','保定','2','0','');
INSERT INTO `zmt_area` VALUES ('140','10','沧州','2','0','');
INSERT INTO `zmt_area` VALUES ('141','10','承德','2','0','');
INSERT INTO `zmt_area` VALUES ('142','10','邯郸','2','0','');
INSERT INTO `zmt_area` VALUES ('143','10','衡水','2','0','');
INSERT INTO `zmt_area` VALUES ('144','10','廊坊','2','0','');
INSERT INTO `zmt_area` VALUES ('145','10','秦皇岛','2','0','');
INSERT INTO `zmt_area` VALUES ('146','10','唐山','2','0','');
INSERT INTO `zmt_area` VALUES ('147','10','邢台','2','0','');
INSERT INTO `zmt_area` VALUES ('148','10','张家口','2','0','');
INSERT INTO `zmt_area` VALUES ('149','11','郑州','2','0','');
INSERT INTO `zmt_area` VALUES ('150','11','洛阳','2','0','');
INSERT INTO `zmt_area` VALUES ('151','11','开封','2','0','');
INSERT INTO `zmt_area` VALUES ('152','11','安阳','2','0','');
INSERT INTO `zmt_area` VALUES ('153','11','鹤壁','2','0','');
INSERT INTO `zmt_area` VALUES ('154','11','济源','2','0','');
INSERT INTO `zmt_area` VALUES ('155','11','焦作','2','0','');
INSERT INTO `zmt_area` VALUES ('156','11','南阳','2','0','');
INSERT INTO `zmt_area` VALUES ('157','11','平顶山','2','0','');
INSERT INTO `zmt_area` VALUES ('158','11','三门峡','2','0','');
INSERT INTO `zmt_area` VALUES ('159','11','商丘','2','0','');
INSERT INTO `zmt_area` VALUES ('160','11','新乡','2','0','');
INSERT INTO `zmt_area` VALUES ('161','11','信阳','2','0','');
INSERT INTO `zmt_area` VALUES ('162','11','许昌','2','0','');
INSERT INTO `zmt_area` VALUES ('163','11','周口','2','0','');
INSERT INTO `zmt_area` VALUES ('164','11','驻马店','2','0','');
INSERT INTO `zmt_area` VALUES ('165','11','漯河','2','0','');
INSERT INTO `zmt_area` VALUES ('166','11','濮阳','2','0','');
INSERT INTO `zmt_area` VALUES ('167','12','哈尔滨','2','0','');
INSERT INTO `zmt_area` VALUES ('168','12','大庆','2','0','');
INSERT INTO `zmt_area` VALUES ('169','12','大兴安岭','2','0','');
INSERT INTO `zmt_area` VALUES ('170','12','鹤岗','2','0','');
INSERT INTO `zmt_area` VALUES ('171','12','黑河','2','0','');
INSERT INTO `zmt_area` VALUES ('172','12','鸡西','2','0','');
INSERT INTO `zmt_area` VALUES ('173','12','佳木斯','2','0','');
INSERT INTO `zmt_area` VALUES ('174','12','牡丹江','2','0','');
INSERT INTO `zmt_area` VALUES ('175','12','七台河','2','0','');
INSERT INTO `zmt_area` VALUES ('176','12','齐齐哈尔','2','0','');
INSERT INTO `zmt_area` VALUES ('177','12','双鸭山','2','0','');
INSERT INTO `zmt_area` VALUES ('178','12','绥化','2','0','');
INSERT INTO `zmt_area` VALUES ('179','12','伊春','2','0','');
INSERT INTO `zmt_area` VALUES ('180','13','武汉','2','0','');
INSERT INTO `zmt_area` VALUES ('181','13','仙桃','2','0','');
INSERT INTO `zmt_area` VALUES ('182','13','鄂州','2','0','');
INSERT INTO `zmt_area` VALUES ('183','13','黄冈','2','0','');
INSERT INTO `zmt_area` VALUES ('184','13','黄石','2','0','');
INSERT INTO `zmt_area` VALUES ('185','13','荆门','2','0','');
INSERT INTO `zmt_area` VALUES ('186','13','荆州','2','0','');
INSERT INTO `zmt_area` VALUES ('187','13','潜江','2','0','');
INSERT INTO `zmt_area` VALUES ('188','13','神农架林区','2','0','');
INSERT INTO `zmt_area` VALUES ('189','13','十堰','2','0','');
INSERT INTO `zmt_area` VALUES ('190','13','随州','2','0','');
INSERT INTO `zmt_area` VALUES ('191','13','天门','2','0','');
INSERT INTO `zmt_area` VALUES ('192','13','咸宁','2','0','');
INSERT INTO `zmt_area` VALUES ('193','13','襄樊','2','0','');
INSERT INTO `zmt_area` VALUES ('194','13','孝感','2','0','');
INSERT INTO `zmt_area` VALUES ('195','13','宜昌','2','0','');
INSERT INTO `zmt_area` VALUES ('196','13','恩施','2','0','');
INSERT INTO `zmt_area` VALUES ('197','14','长沙','2','0','');
INSERT INTO `zmt_area` VALUES ('198','14','张家界','2','0','');
INSERT INTO `zmt_area` VALUES ('199','14','常德','2','0','');
INSERT INTO `zmt_area` VALUES ('200','14','郴州','2','0','');
INSERT INTO `zmt_area` VALUES ('201','14','衡阳','2','0','');
INSERT INTO `zmt_area` VALUES ('202','14','怀化','2','0','');
INSERT INTO `zmt_area` VALUES ('203','14','娄底','2','0','');
INSERT INTO `zmt_area` VALUES ('204','14','邵阳','2','0','');
INSERT INTO `zmt_area` VALUES ('205','14','湘潭','2','0','');
INSERT INTO `zmt_area` VALUES ('206','14','湘西','2','0','');
INSERT INTO `zmt_area` VALUES ('207','14','益阳','2','0','');
INSERT INTO `zmt_area` VALUES ('208','14','永州','2','0','');
INSERT INTO `zmt_area` VALUES ('209','14','岳阳','2','0','');
INSERT INTO `zmt_area` VALUES ('210','14','株洲','2','0','');
INSERT INTO `zmt_area` VALUES ('211','15','长春','2','0','');
INSERT INTO `zmt_area` VALUES ('212','15','吉林','2','0','');
INSERT INTO `zmt_area` VALUES ('213','15','白城','2','0','');
INSERT INTO `zmt_area` VALUES ('214','15','白山','2','0','');
INSERT INTO `zmt_area` VALUES ('215','15','辽源','2','0','');
INSERT INTO `zmt_area` VALUES ('216','15','四平','2','0','');
INSERT INTO `zmt_area` VALUES ('217','15','松原','2','0','');
INSERT INTO `zmt_area` VALUES ('218','15','通化','2','0','');
INSERT INTO `zmt_area` VALUES ('219','15','延边','2','0','');
INSERT INTO `zmt_area` VALUES ('220','16','南京','2','0','');
INSERT INTO `zmt_area` VALUES ('221','16','苏州','2','0','');
INSERT INTO `zmt_area` VALUES ('222','16','无锡','2','0','');
INSERT INTO `zmt_area` VALUES ('223','16','常州','2','0','');
INSERT INTO `zmt_area` VALUES ('224','16','淮安','2','0','');
INSERT INTO `zmt_area` VALUES ('225','16','连云港','2','0','');
INSERT INTO `zmt_area` VALUES ('226','16','南通','2','0','');
INSERT INTO `zmt_area` VALUES ('227','16','宿迁','2','0','');
INSERT INTO `zmt_area` VALUES ('228','16','泰州','2','0','');
INSERT INTO `zmt_area` VALUES ('229','16','徐州','2','0','');
INSERT INTO `zmt_area` VALUES ('230','16','盐城','2','0','');
INSERT INTO `zmt_area` VALUES ('231','16','扬州','2','0','');
INSERT INTO `zmt_area` VALUES ('232','16','镇江','2','0','');
INSERT INTO `zmt_area` VALUES ('233','17','南昌','2','0','');
INSERT INTO `zmt_area` VALUES ('234','17','抚州','2','0','');
INSERT INTO `zmt_area` VALUES ('235','17','赣州','2','0','');
INSERT INTO `zmt_area` VALUES ('236','17','吉安','2','0','');
INSERT INTO `zmt_area` VALUES ('237','17','景德镇','2','0','');
INSERT INTO `zmt_area` VALUES ('238','17','九江','2','0','');
INSERT INTO `zmt_area` VALUES ('239','17','萍乡','2','0','');
INSERT INTO `zmt_area` VALUES ('240','17','上饶','2','0','');
INSERT INTO `zmt_area` VALUES ('241','17','新余','2','0','');
INSERT INTO `zmt_area` VALUES ('242','17','宜春','2','0','');
INSERT INTO `zmt_area` VALUES ('243','17','鹰潭','2','0','');
INSERT INTO `zmt_area` VALUES ('244','18','沈阳','2','0','');
INSERT INTO `zmt_area` VALUES ('245','18','大连','2','0','');
INSERT INTO `zmt_area` VALUES ('246','18','鞍山','2','0','');
INSERT INTO `zmt_area` VALUES ('247','18','本溪','2','0','');
INSERT INTO `zmt_area` VALUES ('248','18','朝阳','2','0','');
INSERT INTO `zmt_area` VALUES ('249','18','丹东','2','0','');
INSERT INTO `zmt_area` VALUES ('250','18','抚顺','2','0','');
INSERT INTO `zmt_area` VALUES ('251','18','阜新','2','0','');
INSERT INTO `zmt_area` VALUES ('252','18','葫芦岛','2','0','');
INSERT INTO `zmt_area` VALUES ('253','18','锦州','2','0','');
INSERT INTO `zmt_area` VALUES ('254','18','辽阳','2','0','');
INSERT INTO `zmt_area` VALUES ('255','18','盘锦','2','0','');
INSERT INTO `zmt_area` VALUES ('256','18','铁岭','2','0','');
INSERT INTO `zmt_area` VALUES ('257','18','营口','2','0','');
INSERT INTO `zmt_area` VALUES ('258','19','呼和浩特','2','0','');
INSERT INTO `zmt_area` VALUES ('259','19','阿拉善盟','2','0','');
INSERT INTO `zmt_area` VALUES ('260','19','巴彦淖尔盟','2','0','');
INSERT INTO `zmt_area` VALUES ('261','19','包头','2','0','');
INSERT INTO `zmt_area` VALUES ('262','19','赤峰','2','0','');
INSERT INTO `zmt_area` VALUES ('263','19','鄂尔多斯','2','0','');
INSERT INTO `zmt_area` VALUES ('264','19','呼伦贝尔','2','0','');
INSERT INTO `zmt_area` VALUES ('265','19','通辽','2','0','');
INSERT INTO `zmt_area` VALUES ('266','19','乌海','2','0','');
INSERT INTO `zmt_area` VALUES ('267','19','乌兰察布市','2','0','');
INSERT INTO `zmt_area` VALUES ('268','19','锡林郭勒盟','2','0','');
INSERT INTO `zmt_area` VALUES ('269','19','兴安盟','2','0','');
INSERT INTO `zmt_area` VALUES ('270','20','银川','2','0','');
INSERT INTO `zmt_area` VALUES ('271','20','固原','2','0','');
INSERT INTO `zmt_area` VALUES ('272','20','石嘴山','2','0','');
INSERT INTO `zmt_area` VALUES ('273','20','吴忠','2','0','');
INSERT INTO `zmt_area` VALUES ('274','20','中卫','2','0','');
INSERT INTO `zmt_area` VALUES ('275','21','西宁','2','0','');
INSERT INTO `zmt_area` VALUES ('276','21','果洛','2','0','');
INSERT INTO `zmt_area` VALUES ('277','21','海北','2','0','');
INSERT INTO `zmt_area` VALUES ('278','21','海东','2','0','');
INSERT INTO `zmt_area` VALUES ('279','21','海南','2','0','');
INSERT INTO `zmt_area` VALUES ('280','21','海西','2','0','');
INSERT INTO `zmt_area` VALUES ('281','21','黄南','2','0','');
INSERT INTO `zmt_area` VALUES ('282','21','玉树','2','0','');
INSERT INTO `zmt_area` VALUES ('283','22','济南','2','0','');
INSERT INTO `zmt_area` VALUES ('284','22','青岛','2','0','');
INSERT INTO `zmt_area` VALUES ('285','22','滨州','2','0','');
INSERT INTO `zmt_area` VALUES ('286','22','德州','2','0','');
INSERT INTO `zmt_area` VALUES ('287','22','东营','2','0','');
INSERT INTO `zmt_area` VALUES ('288','22','菏泽','2','0','');
INSERT INTO `zmt_area` VALUES ('289','22','济宁','2','0','');
INSERT INTO `zmt_area` VALUES ('290','22','莱芜','2','0','');
INSERT INTO `zmt_area` VALUES ('291','22','聊城','2','0','');
INSERT INTO `zmt_area` VALUES ('292','22','临沂','2','0','');
INSERT INTO `zmt_area` VALUES ('293','22','日照','2','0','');
INSERT INTO `zmt_area` VALUES ('294','22','泰安','2','0','');
INSERT INTO `zmt_area` VALUES ('295','22','威海','2','0','');
INSERT INTO `zmt_area` VALUES ('296','22','潍坊','2','0','');
INSERT INTO `zmt_area` VALUES ('297','22','烟台','2','0','');
INSERT INTO `zmt_area` VALUES ('298','22','枣庄','2','0','');
INSERT INTO `zmt_area` VALUES ('299','22','淄博','2','0','');
INSERT INTO `zmt_area` VALUES ('300','23','太原','2','0','');
INSERT INTO `zmt_area` VALUES ('301','23','长治','2','0','');
INSERT INTO `zmt_area` VALUES ('302','23','大同','2','0','');
INSERT INTO `zmt_area` VALUES ('303','23','晋城','2','0','');
INSERT INTO `zmt_area` VALUES ('304','23','晋中','2','0','');
INSERT INTO `zmt_area` VALUES ('305','23','临汾','2','0','');
INSERT INTO `zmt_area` VALUES ('306','23','吕梁','2','0','');
INSERT INTO `zmt_area` VALUES ('307','23','朔州','2','0','');
INSERT INTO `zmt_area` VALUES ('308','23','忻州','2','0','');
INSERT INTO `zmt_area` VALUES ('309','23','阳泉','2','0','');
INSERT INTO `zmt_area` VALUES ('310','23','运城','2','0','');
INSERT INTO `zmt_area` VALUES ('311','24','西安','2','0','');
INSERT INTO `zmt_area` VALUES ('312','24','安康','2','0','');
INSERT INTO `zmt_area` VALUES ('313','24','宝鸡','2','0','');
INSERT INTO `zmt_area` VALUES ('314','24','汉中','2','0','');
INSERT INTO `zmt_area` VALUES ('315','24','商洛','2','0','');
INSERT INTO `zmt_area` VALUES ('316','24','铜川','2','0','');
INSERT INTO `zmt_area` VALUES ('317','24','渭南','2','0','');
INSERT INTO `zmt_area` VALUES ('318','24','咸阳','2','0','');
INSERT INTO `zmt_area` VALUES ('319','24','延安','2','0','');
INSERT INTO `zmt_area` VALUES ('320','24','榆林','2','0','');
INSERT INTO `zmt_area` VALUES ('321','25','上海','2','0','');
INSERT INTO `zmt_area` VALUES ('322','26','成都','2','0','');
INSERT INTO `zmt_area` VALUES ('323','26','绵阳','2','0','');
INSERT INTO `zmt_area` VALUES ('324','26','阿坝','2','0','');
INSERT INTO `zmt_area` VALUES ('325','26','巴中','2','0','');
INSERT INTO `zmt_area` VALUES ('326','26','达州','2','0','');
INSERT INTO `zmt_area` VALUES ('327','26','德阳','2','0','');
INSERT INTO `zmt_area` VALUES ('328','26','甘孜','2','0','');
INSERT INTO `zmt_area` VALUES ('329','26','广安','2','0','');
INSERT INTO `zmt_area` VALUES ('330','26','广元','2','0','');
INSERT INTO `zmt_area` VALUES ('331','26','乐山','2','0','');
INSERT INTO `zmt_area` VALUES ('332','26','凉山','2','0','');
INSERT INTO `zmt_area` VALUES ('333','26','眉山','2','0','');
INSERT INTO `zmt_area` VALUES ('334','26','南充','2','0','');
INSERT INTO `zmt_area` VALUES ('335','26','内江','2','0','');
INSERT INTO `zmt_area` VALUES ('336','26','攀枝花','2','0','');
INSERT INTO `zmt_area` VALUES ('337','26','遂宁','2','0','');
INSERT INTO `zmt_area` VALUES ('338','26','雅安','2','0','');
INSERT INTO `zmt_area` VALUES ('339','26','宜宾','2','0','');
INSERT INTO `zmt_area` VALUES ('340','26','资阳','2','0','');
INSERT INTO `zmt_area` VALUES ('341','26','自贡','2','0','');
INSERT INTO `zmt_area` VALUES ('342','26','泸州','2','0','');
INSERT INTO `zmt_area` VALUES ('343','27','天津','2','0','');
INSERT INTO `zmt_area` VALUES ('344','28','拉萨','2','0','');
INSERT INTO `zmt_area` VALUES ('345','28','阿里','2','0','');
INSERT INTO `zmt_area` VALUES ('346','28','昌都','2','0','');
INSERT INTO `zmt_area` VALUES ('347','28','林芝','2','0','');
INSERT INTO `zmt_area` VALUES ('348','28','那曲','2','0','');
INSERT INTO `zmt_area` VALUES ('349','28','日喀则','2','0','');
INSERT INTO `zmt_area` VALUES ('350','28','山南','2','0','');
INSERT INTO `zmt_area` VALUES ('351','29','乌鲁木齐','2','0','');
INSERT INTO `zmt_area` VALUES ('352','29','阿克苏','2','0','');
INSERT INTO `zmt_area` VALUES ('353','29','阿拉尔','2','0','');
INSERT INTO `zmt_area` VALUES ('354','29','巴音郭楞','2','0','');
INSERT INTO `zmt_area` VALUES ('355','29','博尔塔拉','2','0','');
INSERT INTO `zmt_area` VALUES ('356','29','昌吉','2','0','');
INSERT INTO `zmt_area` VALUES ('357','29','哈密','2','0','');
INSERT INTO `zmt_area` VALUES ('358','29','和田','2','0','');
INSERT INTO `zmt_area` VALUES ('359','29','喀什','2','0','');
INSERT INTO `zmt_area` VALUES ('360','29','克拉玛依','2','0','');
INSERT INTO `zmt_area` VALUES ('361','29','克孜勒苏','2','0','');
INSERT INTO `zmt_area` VALUES ('362','29','石河子','2','0','');
INSERT INTO `zmt_area` VALUES ('363','29','图木舒克','2','0','');
INSERT INTO `zmt_area` VALUES ('364','29','吐鲁番','2','0','');
INSERT INTO `zmt_area` VALUES ('365','29','五家渠','2','0','');
INSERT INTO `zmt_area` VALUES ('366','29','伊犁','2','0','');
INSERT INTO `zmt_area` VALUES ('367','30','昆明','2','0','');
INSERT INTO `zmt_area` VALUES ('368','30','怒江','2','0','');
INSERT INTO `zmt_area` VALUES ('369','30','普洱','2','0','');
INSERT INTO `zmt_area` VALUES ('370','30','丽江','2','0','');
INSERT INTO `zmt_area` VALUES ('371','30','保山','2','0','');
INSERT INTO `zmt_area` VALUES ('372','30','楚雄','2','0','');
INSERT INTO `zmt_area` VALUES ('373','30','大理','2','0','');
INSERT INTO `zmt_area` VALUES ('374','30','德宏','2','0','');
INSERT INTO `zmt_area` VALUES ('375','30','迪庆','2','0','');
INSERT INTO `zmt_area` VALUES ('376','30','红河','2','0','');
INSERT INTO `zmt_area` VALUES ('377','30','临沧','2','0','');
INSERT INTO `zmt_area` VALUES ('378','30','曲靖','2','0','');
INSERT INTO `zmt_area` VALUES ('379','30','文山','2','0','');
INSERT INTO `zmt_area` VALUES ('380','30','西双版纳','2','0','');
INSERT INTO `zmt_area` VALUES ('381','30','玉溪','2','0','');
INSERT INTO `zmt_area` VALUES ('382','30','昭通','2','0','');
INSERT INTO `zmt_area` VALUES ('383','31','杭州','2','0','');
INSERT INTO `zmt_area` VALUES ('384','31','湖州','2','0','');
INSERT INTO `zmt_area` VALUES ('385','31','嘉兴','2','0','');
INSERT INTO `zmt_area` VALUES ('386','31','金华','2','0','');
INSERT INTO `zmt_area` VALUES ('387','31','丽水','2','0','');
INSERT INTO `zmt_area` VALUES ('388','31','宁波','2','0','');
INSERT INTO `zmt_area` VALUES ('389','31','绍兴','2','0','');
INSERT INTO `zmt_area` VALUES ('390','31','台州','2','0','');
INSERT INTO `zmt_area` VALUES ('391','31','温州','2','0','');
INSERT INTO `zmt_area` VALUES ('392','31','舟山','2','0','');
INSERT INTO `zmt_area` VALUES ('393','31','衢州','2','0','');
INSERT INTO `zmt_area` VALUES ('394','32','重庆','2','0','');
INSERT INTO `zmt_area` VALUES ('395','33','香港','2','0','');
INSERT INTO `zmt_area` VALUES ('396','34','澳门','2','0','');
INSERT INTO `zmt_area` VALUES ('397','35','台湾','2','0','');
INSERT INTO `zmt_area` VALUES ('398','36','迎江区','3','0','');
INSERT INTO `zmt_area` VALUES ('399','36','大观区','3','0','');
INSERT INTO `zmt_area` VALUES ('400','36','宜秀区','3','0','');
INSERT INTO `zmt_area` VALUES ('401','36','桐城市','3','0','');
INSERT INTO `zmt_area` VALUES ('402','36','怀宁县','3','0','');
INSERT INTO `zmt_area` VALUES ('403','36','枞阳县','3','0','');
INSERT INTO `zmt_area` VALUES ('404','36','潜山县','3','0','');
INSERT INTO `zmt_area` VALUES ('405','36','太湖县','3','0','');
INSERT INTO `zmt_area` VALUES ('406','36','宿松县','3','0','');
INSERT INTO `zmt_area` VALUES ('407','36','望江县','3','0','');
INSERT INTO `zmt_area` VALUES ('408','36','岳西县','3','0','');
INSERT INTO `zmt_area` VALUES ('409','37','中市区','3','0','');
INSERT INTO `zmt_area` VALUES ('410','37','东市区','3','0','');
INSERT INTO `zmt_area` VALUES ('411','37','西市区','3','0','');
INSERT INTO `zmt_area` VALUES ('412','37','郊区','3','0','');
INSERT INTO `zmt_area` VALUES ('413','37','怀远县','3','0','');
INSERT INTO `zmt_area` VALUES ('414','37','五河县','3','0','');
INSERT INTO `zmt_area` VALUES ('415','37','固镇县','3','0','');
INSERT INTO `zmt_area` VALUES ('416','38','居巢区','3','0','');
INSERT INTO `zmt_area` VALUES ('417','38','庐江县','3','0','');
INSERT INTO `zmt_area` VALUES ('418','38','无为县','3','0','');
INSERT INTO `zmt_area` VALUES ('419','38','含山县','3','0','');
INSERT INTO `zmt_area` VALUES ('420','38','和县','3','0','');
INSERT INTO `zmt_area` VALUES ('421','39','贵池区','3','0','');
INSERT INTO `zmt_area` VALUES ('422','39','东至县','3','0','');
INSERT INTO `zmt_area` VALUES ('423','39','石台县','3','0','');
INSERT INTO `zmt_area` VALUES ('424','39','青阳县','3','0','');
INSERT INTO `zmt_area` VALUES ('425','40','琅琊区','3','0','');
INSERT INTO `zmt_area` VALUES ('426','40','南谯区','3','0','');
INSERT INTO `zmt_area` VALUES ('427','40','天长市','3','0','');
INSERT INTO `zmt_area` VALUES ('428','40','明光市','3','0','');
INSERT INTO `zmt_area` VALUES ('429','40','来安县','3','0','');
INSERT INTO `zmt_area` VALUES ('430','40','全椒县','3','0','');
INSERT INTO `zmt_area` VALUES ('431','40','定远县','3','0','');
INSERT INTO `zmt_area` VALUES ('432','40','凤阳县','3','0','');
INSERT INTO `zmt_area` VALUES ('433','41','蚌山区','3','0','');
INSERT INTO `zmt_area` VALUES ('434','41','龙子湖区','3','0','');
INSERT INTO `zmt_area` VALUES ('435','41','禹会区','3','0','');
INSERT INTO `zmt_area` VALUES ('436','41','淮上区','3','0','');
INSERT INTO `zmt_area` VALUES ('437','41','颍州区','3','0','');
INSERT INTO `zmt_area` VALUES ('438','41','颍东区','3','0','');
INSERT INTO `zmt_area` VALUES ('439','41','颍泉区','3','0','');
INSERT INTO `zmt_area` VALUES ('440','41','界首市','3','0','');
INSERT INTO `zmt_area` VALUES ('441','41','临泉县','3','0','');
INSERT INTO `zmt_area` VALUES ('442','41','太和县','3','0','');
INSERT INTO `zmt_area` VALUES ('443','41','阜南县','3','0','');
INSERT INTO `zmt_area` VALUES ('444','41','颖上县','3','0','');
INSERT INTO `zmt_area` VALUES ('445','42','相山区','3','0','');
INSERT INTO `zmt_area` VALUES ('446','42','杜集区','3','0','');
INSERT INTO `zmt_area` VALUES ('447','42','烈山区','3','0','');
INSERT INTO `zmt_area` VALUES ('448','42','濉溪县','3','0','');
INSERT INTO `zmt_area` VALUES ('449','43','田家庵区','3','0','');
INSERT INTO `zmt_area` VALUES ('450','43','大通区','3','0','');
INSERT INTO `zmt_area` VALUES ('451','43','谢家集区','3','0','');
INSERT INTO `zmt_area` VALUES ('452','43','八公山区','3','0','');
INSERT INTO `zmt_area` VALUES ('453','43','潘集区','3','0','');
INSERT INTO `zmt_area` VALUES ('454','43','凤台县','3','0','');
INSERT INTO `zmt_area` VALUES ('455','44','屯溪区','3','0','');
INSERT INTO `zmt_area` VALUES ('456','44','黄山区','3','0','');
INSERT INTO `zmt_area` VALUES ('457','44','徽州区','3','0','');
INSERT INTO `zmt_area` VALUES ('458','44','歙县','3','0','');
INSERT INTO `zmt_area` VALUES ('459','44','休宁县','3','0','');
INSERT INTO `zmt_area` VALUES ('460','44','黟县','3','0','');
INSERT INTO `zmt_area` VALUES ('461','44','祁门县','3','0','');
INSERT INTO `zmt_area` VALUES ('462','45','金安区','3','0','');
INSERT INTO `zmt_area` VALUES ('463','45','裕安区','3','0','');
INSERT INTO `zmt_area` VALUES ('464','45','寿县','3','0','');
INSERT INTO `zmt_area` VALUES ('465','45','霍邱县','3','0','');
INSERT INTO `zmt_area` VALUES ('466','45','舒城县','3','0','');
INSERT INTO `zmt_area` VALUES ('467','45','金寨县','3','0','');
INSERT INTO `zmt_area` VALUES ('468','45','霍山县','3','0','');
INSERT INTO `zmt_area` VALUES ('469','46','雨山区','3','0','');
INSERT INTO `zmt_area` VALUES ('470','46','花山区','3','0','');
INSERT INTO `zmt_area` VALUES ('471','46','金家庄区','3','0','');
INSERT INTO `zmt_area` VALUES ('472','46','当涂县','3','0','');
INSERT INTO `zmt_area` VALUES ('473','47','埇桥区','3','0','');
INSERT INTO `zmt_area` VALUES ('474','47','砀山县','3','0','');
INSERT INTO `zmt_area` VALUES ('475','47','萧县','3','0','');
INSERT INTO `zmt_area` VALUES ('476','47','灵璧县','3','0','');
INSERT INTO `zmt_area` VALUES ('477','47','泗县','3','0','');
INSERT INTO `zmt_area` VALUES ('478','48','铜官山区','3','0','');
INSERT INTO `zmt_area` VALUES ('479','48','狮子山区','3','0','');
INSERT INTO `zmt_area` VALUES ('480','48','郊区','3','0','');
INSERT INTO `zmt_area` VALUES ('481','48','铜陵县','3','0','');
INSERT INTO `zmt_area` VALUES ('482','49','镜湖区','3','0','');
INSERT INTO `zmt_area` VALUES ('483','49','弋江区','3','0','');
INSERT INTO `zmt_area` VALUES ('484','49','鸠江区','3','0','');
INSERT INTO `zmt_area` VALUES ('485','49','三山区','3','0','');
INSERT INTO `zmt_area` VALUES ('486','49','芜湖县','3','0','');
INSERT INTO `zmt_area` VALUES ('487','49','繁昌县','3','0','');
INSERT INTO `zmt_area` VALUES ('488','49','南陵县','3','0','');
INSERT INTO `zmt_area` VALUES ('489','50','宣州区','3','0','');
INSERT INTO `zmt_area` VALUES ('490','50','宁国市','3','0','');
INSERT INTO `zmt_area` VALUES ('491','50','郎溪县','3','0','');
INSERT INTO `zmt_area` VALUES ('492','50','广德县','3','0','');
INSERT INTO `zmt_area` VALUES ('493','50','泾县','3','0','');
INSERT INTO `zmt_area` VALUES ('494','50','绩溪县','3','0','');
INSERT INTO `zmt_area` VALUES ('495','50','旌德县','3','0','');
INSERT INTO `zmt_area` VALUES ('496','51','涡阳县','3','0','');
INSERT INTO `zmt_area` VALUES ('497','51','蒙城县','3','0','');
INSERT INTO `zmt_area` VALUES ('498','51','利辛县','3','0','');
INSERT INTO `zmt_area` VALUES ('499','51','谯城区','3','0','');
INSERT INTO `zmt_area` VALUES ('500','52','东城区','3','0','');
INSERT INTO `zmt_area` VALUES ('501','52','西城区','3','0','');
INSERT INTO `zmt_area` VALUES ('502','52','海淀区','3','0','');
INSERT INTO `zmt_area` VALUES ('503','52','朝阳区','3','0','');
INSERT INTO `zmt_area` VALUES ('504','52','崇文区','3','0','');
INSERT INTO `zmt_area` VALUES ('505','52','宣武区','3','0','');
INSERT INTO `zmt_area` VALUES ('506','52','丰台区','3','0','');
INSERT INTO `zmt_area` VALUES ('507','52','石景山区','3','0','');
INSERT INTO `zmt_area` VALUES ('508','52','房山区','3','0','');
INSERT INTO `zmt_area` VALUES ('509','52','门头沟区','3','0','');
INSERT INTO `zmt_area` VALUES ('510','52','通州区','3','0','');
INSERT INTO `zmt_area` VALUES ('511','52','顺义区','3','0','');
INSERT INTO `zmt_area` VALUES ('512','52','昌平区','3','0','');
INSERT INTO `zmt_area` VALUES ('513','52','怀柔区','3','0','');
INSERT INTO `zmt_area` VALUES ('514','52','平谷区','3','0','');
INSERT INTO `zmt_area` VALUES ('515','52','大兴区','3','0','');
INSERT INTO `zmt_area` VALUES ('516','52','密云县','3','0','');
INSERT INTO `zmt_area` VALUES ('517','52','延庆县','3','0','');
INSERT INTO `zmt_area` VALUES ('518','53','鼓楼区','3','0','');
INSERT INTO `zmt_area` VALUES ('519','53','台江区','3','0','');
INSERT INTO `zmt_area` VALUES ('520','53','仓山区','3','0','');
INSERT INTO `zmt_area` VALUES ('521','53','马尾区','3','0','');
INSERT INTO `zmt_area` VALUES ('522','53','晋安区','3','0','');
INSERT INTO `zmt_area` VALUES ('523','53','福清市','3','0','');
INSERT INTO `zmt_area` VALUES ('524','53','长乐市','3','0','');
INSERT INTO `zmt_area` VALUES ('525','53','闽侯县','3','0','');
INSERT INTO `zmt_area` VALUES ('526','53','连江县','3','0','');
INSERT INTO `zmt_area` VALUES ('527','53','罗源县','3','0','');
INSERT INTO `zmt_area` VALUES ('528','53','闽清县','3','0','');
INSERT INTO `zmt_area` VALUES ('529','53','永泰县','3','0','');
INSERT INTO `zmt_area` VALUES ('530','53','平潭县','3','0','');
INSERT INTO `zmt_area` VALUES ('531','54','新罗区','3','0','');
INSERT INTO `zmt_area` VALUES ('532','54','漳平市','3','0','');
INSERT INTO `zmt_area` VALUES ('533','54','长汀县','3','0','');
INSERT INTO `zmt_area` VALUES ('534','54','永定县','3','0','');
INSERT INTO `zmt_area` VALUES ('535','54','上杭县','3','0','');
INSERT INTO `zmt_area` VALUES ('536','54','武平县','3','0','');
INSERT INTO `zmt_area` VALUES ('537','54','连城县','3','0','');
INSERT INTO `zmt_area` VALUES ('538','55','延平区','3','0','');
INSERT INTO `zmt_area` VALUES ('539','55','邵武市','3','0','');
INSERT INTO `zmt_area` VALUES ('540','55','武夷山市','3','0','');
INSERT INTO `zmt_area` VALUES ('541','55','建瓯市','3','0','');
INSERT INTO `zmt_area` VALUES ('542','55','建阳市','3','0','');
INSERT INTO `zmt_area` VALUES ('543','55','顺昌县','3','0','');
INSERT INTO `zmt_area` VALUES ('544','55','浦城县','3','0','');
INSERT INTO `zmt_area` VALUES ('545','55','光泽县','3','0','');
INSERT INTO `zmt_area` VALUES ('546','55','松溪县','3','0','');
INSERT INTO `zmt_area` VALUES ('547','55','政和县','3','0','');
INSERT INTO `zmt_area` VALUES ('548','56','蕉城区','3','0','');
INSERT INTO `zmt_area` VALUES ('549','56','福安市','3','0','');
INSERT INTO `zmt_area` VALUES ('550','56','福鼎市','3','0','');
INSERT INTO `zmt_area` VALUES ('551','56','霞浦县','3','0','');
INSERT INTO `zmt_area` VALUES ('552','56','古田县','3','0','');
INSERT INTO `zmt_area` VALUES ('553','56','屏南县','3','0','');
INSERT INTO `zmt_area` VALUES ('554','56','寿宁县','3','0','');
INSERT INTO `zmt_area` VALUES ('555','56','周宁县','3','0','');
INSERT INTO `zmt_area` VALUES ('556','56','柘荣县','3','0','');
INSERT INTO `zmt_area` VALUES ('557','57','城厢区','3','0','');
INSERT INTO `zmt_area` VALUES ('558','57','涵江区','3','0','');
INSERT INTO `zmt_area` VALUES ('559','57','荔城区','3','0','');
INSERT INTO `zmt_area` VALUES ('560','57','秀屿区','3','0','');
INSERT INTO `zmt_area` VALUES ('561','57','仙游县','3','0','');
INSERT INTO `zmt_area` VALUES ('562','58','鲤城区','3','0','');
INSERT INTO `zmt_area` VALUES ('563','58','丰泽区','3','0','');
INSERT INTO `zmt_area` VALUES ('564','58','洛江区','3','0','');
INSERT INTO `zmt_area` VALUES ('565','58','清濛开发区','3','0','');
INSERT INTO `zmt_area` VALUES ('566','58','泉港区','3','0','');
INSERT INTO `zmt_area` VALUES ('567','58','石狮市','3','0','');
INSERT INTO `zmt_area` VALUES ('568','58','晋江市','3','0','');
INSERT INTO `zmt_area` VALUES ('569','58','南安市','3','0','');
INSERT INTO `zmt_area` VALUES ('570','58','惠安县','3','0','');
INSERT INTO `zmt_area` VALUES ('571','58','安溪县','3','0','');
INSERT INTO `zmt_area` VALUES ('572','58','永春县','3','0','');
INSERT INTO `zmt_area` VALUES ('573','58','德化县','3','0','');
INSERT INTO `zmt_area` VALUES ('574','58','金门县','3','0','');
INSERT INTO `zmt_area` VALUES ('575','59','梅列区','3','0','');
INSERT INTO `zmt_area` VALUES ('576','59','三元区','3','0','');
INSERT INTO `zmt_area` VALUES ('577','59','永安市','3','0','');
INSERT INTO `zmt_area` VALUES ('578','59','明溪县','3','0','');
INSERT INTO `zmt_area` VALUES ('579','59','清流县','3','0','');
INSERT INTO `zmt_area` VALUES ('580','59','宁化县','3','0','');
INSERT INTO `zmt_area` VALUES ('581','59','大田县','3','0','');
INSERT INTO `zmt_area` VALUES ('582','59','尤溪县','3','0','');
INSERT INTO `zmt_area` VALUES ('583','59','沙县','3','0','');
INSERT INTO `zmt_area` VALUES ('584','59','将乐县','3','0','');
INSERT INTO `zmt_area` VALUES ('585','59','泰宁县','3','0','');
INSERT INTO `zmt_area` VALUES ('586','59','建宁县','3','0','');
INSERT INTO `zmt_area` VALUES ('587','60','思明区','3','0','');
INSERT INTO `zmt_area` VALUES ('588','60','海沧区','3','0','');
INSERT INTO `zmt_area` VALUES ('589','60','湖里区','3','0','');
INSERT INTO `zmt_area` VALUES ('590','60','集美区','3','0','');
INSERT INTO `zmt_area` VALUES ('591','60','同安区','3','0','');
INSERT INTO `zmt_area` VALUES ('592','60','翔安区','3','0','');
INSERT INTO `zmt_area` VALUES ('593','61','芗城区','3','0','');
INSERT INTO `zmt_area` VALUES ('594','61','龙文区','3','0','');
INSERT INTO `zmt_area` VALUES ('595','61','龙海市','3','0','');
INSERT INTO `zmt_area` VALUES ('596','61','云霄县','3','0','');
INSERT INTO `zmt_area` VALUES ('597','61','漳浦县','3','0','');
INSERT INTO `zmt_area` VALUES ('598','61','诏安县','3','0','');
INSERT INTO `zmt_area` VALUES ('599','61','长泰县','3','0','');
INSERT INTO `zmt_area` VALUES ('600','61','东山县','3','0','');
INSERT INTO `zmt_area` VALUES ('601','61','南靖县','3','0','');
INSERT INTO `zmt_area` VALUES ('602','61','平和县','3','0','');
INSERT INTO `zmt_area` VALUES ('603','61','华安县','3','0','');
INSERT INTO `zmt_area` VALUES ('604','62','皋兰县','3','0','');
INSERT INTO `zmt_area` VALUES ('605','62','城关区','3','0','');
INSERT INTO `zmt_area` VALUES ('606','62','七里河区','3','0','');
INSERT INTO `zmt_area` VALUES ('607','62','西固区','3','0','');
INSERT INTO `zmt_area` VALUES ('608','62','安宁区','3','0','');
INSERT INTO `zmt_area` VALUES ('609','62','红古区','3','0','');
INSERT INTO `zmt_area` VALUES ('610','62','永登县','3','0','');
INSERT INTO `zmt_area` VALUES ('611','62','榆中县','3','0','');
INSERT INTO `zmt_area` VALUES ('612','63','白银区','3','0','');
INSERT INTO `zmt_area` VALUES ('613','63','平川区','3','0','');
INSERT INTO `zmt_area` VALUES ('614','63','会宁县','3','0','');
INSERT INTO `zmt_area` VALUES ('615','63','景泰县','3','0','');
INSERT INTO `zmt_area` VALUES ('616','63','靖远县','3','0','');
INSERT INTO `zmt_area` VALUES ('617','64','临洮县','3','0','');
INSERT INTO `zmt_area` VALUES ('618','64','陇西县','3','0','');
INSERT INTO `zmt_area` VALUES ('619','64','通渭县','3','0','');
INSERT INTO `zmt_area` VALUES ('620','64','渭源县','3','0','');
INSERT INTO `zmt_area` VALUES ('621','64','漳县','3','0','');
INSERT INTO `zmt_area` VALUES ('622','64','岷县','3','0','');
INSERT INTO `zmt_area` VALUES ('623','64','安定区','3','0','');
INSERT INTO `zmt_area` VALUES ('624','64','安定区','3','0','');
INSERT INTO `zmt_area` VALUES ('625','65','合作市','3','0','');
INSERT INTO `zmt_area` VALUES ('626','65','临潭县','3','0','');
INSERT INTO `zmt_area` VALUES ('627','65','卓尼县','3','0','');
INSERT INTO `zmt_area` VALUES ('628','65','舟曲县','3','0','');
INSERT INTO `zmt_area` VALUES ('629','65','迭部县','3','0','');
INSERT INTO `zmt_area` VALUES ('630','65','玛曲县','3','0','');
INSERT INTO `zmt_area` VALUES ('631','65','碌曲县','3','0','');
INSERT INTO `zmt_area` VALUES ('632','65','夏河县','3','0','');
INSERT INTO `zmt_area` VALUES ('633','66','嘉峪关市','3','0','');
INSERT INTO `zmt_area` VALUES ('634','67','金川区','3','0','');
INSERT INTO `zmt_area` VALUES ('635','67','永昌县','3','0','');
INSERT INTO `zmt_area` VALUES ('636','68','肃州区','3','0','');
INSERT INTO `zmt_area` VALUES ('637','68','玉门市','3','0','');
INSERT INTO `zmt_area` VALUES ('638','68','敦煌市','3','0','');
INSERT INTO `zmt_area` VALUES ('639','68','金塔县','3','0','');
INSERT INTO `zmt_area` VALUES ('640','68','瓜州县','3','0','');
INSERT INTO `zmt_area` VALUES ('641','68','肃北','3','0','');
INSERT INTO `zmt_area` VALUES ('642','68','阿克塞','3','0','');
INSERT INTO `zmt_area` VALUES ('643','69','临夏市','3','0','');
INSERT INTO `zmt_area` VALUES ('644','69','临夏县','3','0','');
INSERT INTO `zmt_area` VALUES ('645','69','康乐县','3','0','');
INSERT INTO `zmt_area` VALUES ('646','69','永靖县','3','0','');
INSERT INTO `zmt_area` VALUES ('647','69','广河县','3','0','');
INSERT INTO `zmt_area` VALUES ('648','69','和政县','3','0','');
INSERT INTO `zmt_area` VALUES ('649','69','东乡族自治县','3','0','');
INSERT INTO `zmt_area` VALUES ('650','69','积石山','3','0','');
INSERT INTO `zmt_area` VALUES ('651','70','成县','3','0','');
INSERT INTO `zmt_area` VALUES ('652','70','徽县','3','0','');
INSERT INTO `zmt_area` VALUES ('653','70','康县','3','0','');
INSERT INTO `zmt_area` VALUES ('654','70','礼县','3','0','');
INSERT INTO `zmt_area` VALUES ('655','70','两当县','3','0','');
INSERT INTO `zmt_area` VALUES ('656','70','文县','3','0','');
INSERT INTO `zmt_area` VALUES ('657','70','西和县','3','0','');
INSERT INTO `zmt_area` VALUES ('658','70','宕昌县','3','0','');
INSERT INTO `zmt_area` VALUES ('659','70','武都区','3','0','');
INSERT INTO `zmt_area` VALUES ('660','71','崇信县','3','0','');
INSERT INTO `zmt_area` VALUES ('661','71','华亭县','3','0','');
INSERT INTO `zmt_area` VALUES ('662','71','静宁县','3','0','');
INSERT INTO `zmt_area` VALUES ('663','71','灵台县','3','0','');
INSERT INTO `zmt_area` VALUES ('664','71','崆峒区','3','0','');
INSERT INTO `zmt_area` VALUES ('665','71','庄浪县','3','0','');
INSERT INTO `zmt_area` VALUES ('666','71','泾川县','3','0','');
INSERT INTO `zmt_area` VALUES ('667','72','合水县','3','0','');
INSERT INTO `zmt_area` VALUES ('668','72','华池县','3','0','');
INSERT INTO `zmt_area` VALUES ('669','72','环县','3','0','');
INSERT INTO `zmt_area` VALUES ('670','72','宁县','3','0','');
INSERT INTO `zmt_area` VALUES ('671','72','庆城县','3','0','');
INSERT INTO `zmt_area` VALUES ('672','72','西峰区','3','0','');
INSERT INTO `zmt_area` VALUES ('673','72','镇原县','3','0','');
INSERT INTO `zmt_area` VALUES ('674','72','正宁县','3','0','');
INSERT INTO `zmt_area` VALUES ('675','73','甘谷县','3','0','');
INSERT INTO `zmt_area` VALUES ('676','73','秦安县','3','0','');
INSERT INTO `zmt_area` VALUES ('677','73','清水县','3','0','');
INSERT INTO `zmt_area` VALUES ('678','73','秦州区','3','0','');
INSERT INTO `zmt_area` VALUES ('679','73','麦积区','3','0','');
INSERT INTO `zmt_area` VALUES ('680','73','武山县','3','0','');
INSERT INTO `zmt_area` VALUES ('681','73','张家川','3','0','');
INSERT INTO `zmt_area` VALUES ('682','74','古浪县','3','0','');
INSERT INTO `zmt_area` VALUES ('683','74','民勤县','3','0','');
INSERT INTO `zmt_area` VALUES ('684','74','天祝','3','0','');
INSERT INTO `zmt_area` VALUES ('685','74','凉州区','3','0','');
INSERT INTO `zmt_area` VALUES ('686','75','高台县','3','0','');
INSERT INTO `zmt_area` VALUES ('687','75','临泽县','3','0','');
INSERT INTO `zmt_area` VALUES ('688','75','民乐县','3','0','');
INSERT INTO `zmt_area` VALUES ('689','75','山丹县','3','0','');
INSERT INTO `zmt_area` VALUES ('690','75','肃南','3','0','');
INSERT INTO `zmt_area` VALUES ('691','75','甘州区','3','0','');
INSERT INTO `zmt_area` VALUES ('692','76','从化市','3','0','');
INSERT INTO `zmt_area` VALUES ('693','76','天河区','3','0','');
INSERT INTO `zmt_area` VALUES ('694','76','东山区','3','0','');
INSERT INTO `zmt_area` VALUES ('695','76','白云区','3','0','');
INSERT INTO `zmt_area` VALUES ('696','76','海珠区','3','0','');
INSERT INTO `zmt_area` VALUES ('697','76','荔湾区','3','0','');
INSERT INTO `zmt_area` VALUES ('698','76','越秀区','3','0','');
INSERT INTO `zmt_area` VALUES ('699','76','黄埔区','3','0','');
INSERT INTO `zmt_area` VALUES ('700','76','番禺区','3','0','');
INSERT INTO `zmt_area` VALUES ('701','76','花都区','3','0','');
INSERT INTO `zmt_area` VALUES ('702','76','增城区','3','0','');
INSERT INTO `zmt_area` VALUES ('703','76','从化区','3','0','');
INSERT INTO `zmt_area` VALUES ('704','76','市郊','3','0','');
INSERT INTO `zmt_area` VALUES ('705','77','福田区','3','0','');
INSERT INTO `zmt_area` VALUES ('706','77','罗湖区','3','0','');
INSERT INTO `zmt_area` VALUES ('707','77','南山区','3','0','');
INSERT INTO `zmt_area` VALUES ('708','77','宝安区','3','0','');
INSERT INTO `zmt_area` VALUES ('709','77','龙岗区','3','0','');
INSERT INTO `zmt_area` VALUES ('710','77','盐田区','3','0','');
INSERT INTO `zmt_area` VALUES ('711','78','湘桥区','3','0','');
INSERT INTO `zmt_area` VALUES ('712','78','潮安县','3','0','');
INSERT INTO `zmt_area` VALUES ('713','78','饶平县','3','0','');
INSERT INTO `zmt_area` VALUES ('714','79','南城区','3','0','');
INSERT INTO `zmt_area` VALUES ('715','79','东城区','3','0','');
INSERT INTO `zmt_area` VALUES ('716','79','万江区','3','0','');
INSERT INTO `zmt_area` VALUES ('717','79','莞城区','3','0','');
INSERT INTO `zmt_area` VALUES ('718','79','石龙镇','3','0','');
INSERT INTO `zmt_area` VALUES ('719','79','虎门镇','3','0','');
INSERT INTO `zmt_area` VALUES ('720','79','麻涌镇','3','0','');
INSERT INTO `zmt_area` VALUES ('721','79','道滘镇','3','0','');
INSERT INTO `zmt_area` VALUES ('722','79','石碣镇','3','0','');
INSERT INTO `zmt_area` VALUES ('723','79','沙田镇','3','0','');
INSERT INTO `zmt_area` VALUES ('724','79','望牛墩镇','3','0','');
INSERT INTO `zmt_area` VALUES ('725','79','洪梅镇','3','0','');
INSERT INTO `zmt_area` VALUES ('726','79','茶山镇','3','0','');
INSERT INTO `zmt_area` VALUES ('727','79','寮步镇','3','0','');
INSERT INTO `zmt_area` VALUES ('728','79','大岭山镇','3','0','');
INSERT INTO `zmt_area` VALUES ('729','79','大朗镇','3','0','');
INSERT INTO `zmt_area` VALUES ('730','79','黄江镇','3','0','');
INSERT INTO `zmt_area` VALUES ('731','79','樟木头','3','0','');
INSERT INTO `zmt_area` VALUES ('732','79','凤岗镇','3','0','');
INSERT INTO `zmt_area` VALUES ('733','79','塘厦镇','3','0','');
INSERT INTO `zmt_area` VALUES ('734','79','谢岗镇','3','0','');
INSERT INTO `zmt_area` VALUES ('735','79','厚街镇','3','0','');
INSERT INTO `zmt_area` VALUES ('736','79','清溪镇','3','0','');
INSERT INTO `zmt_area` VALUES ('737','79','常平镇','3','0','');
INSERT INTO `zmt_area` VALUES ('738','79','桥头镇','3','0','');
INSERT INTO `zmt_area` VALUES ('739','79','横沥镇','3','0','');
INSERT INTO `zmt_area` VALUES ('740','79','东坑镇','3','0','');
INSERT INTO `zmt_area` VALUES ('741','79','企石镇','3','0','');
INSERT INTO `zmt_area` VALUES ('742','79','石排镇','3','0','');
INSERT INTO `zmt_area` VALUES ('743','79','长安镇','3','0','');
INSERT INTO `zmt_area` VALUES ('744','79','中堂镇','3','0','');
INSERT INTO `zmt_area` VALUES ('745','79','高埗镇','3','0','');
INSERT INTO `zmt_area` VALUES ('746','80','禅城区','3','0','');
INSERT INTO `zmt_area` VALUES ('747','80','南海区','3','0','');
INSERT INTO `zmt_area` VALUES ('748','80','顺德区','3','0','');
INSERT INTO `zmt_area` VALUES ('749','80','三水区','3','0','');
INSERT INTO `zmt_area` VALUES ('750','80','高明区','3','0','');
INSERT INTO `zmt_area` VALUES ('751','81','东源县','3','0','');
INSERT INTO `zmt_area` VALUES ('752','81','和平县','3','0','');
INSERT INTO `zmt_area` VALUES ('753','81','源城区','3','0','');
INSERT INTO `zmt_area` VALUES ('754','81','连平县','3','0','');
INSERT INTO `zmt_area` VALUES ('755','81','龙川县','3','0','');
INSERT INTO `zmt_area` VALUES ('756','81','紫金县','3','0','');
INSERT INTO `zmt_area` VALUES ('757','82','惠阳区','3','0','');
INSERT INTO `zmt_area` VALUES ('758','82','惠城区','3','0','');
INSERT INTO `zmt_area` VALUES ('759','82','大亚湾','3','0','');
INSERT INTO `zmt_area` VALUES ('760','82','博罗县','3','0','');
INSERT INTO `zmt_area` VALUES ('761','82','惠东县','3','0','');
INSERT INTO `zmt_area` VALUES ('762','82','龙门县','3','0','');
INSERT INTO `zmt_area` VALUES ('763','83','江海区','3','0','');
INSERT INTO `zmt_area` VALUES ('764','83','蓬江区','3','0','');
INSERT INTO `zmt_area` VALUES ('765','83','新会区','3','0','');
INSERT INTO `zmt_area` VALUES ('766','83','台山市','3','0','');
INSERT INTO `zmt_area` VALUES ('767','83','开平市','3','0','');
INSERT INTO `zmt_area` VALUES ('768','83','鹤山市','3','0','');
INSERT INTO `zmt_area` VALUES ('769','83','恩平市','3','0','');
INSERT INTO `zmt_area` VALUES ('770','84','榕城区','3','0','');
INSERT INTO `zmt_area` VALUES ('771','84','普宁市','3','0','');
INSERT INTO `zmt_area` VALUES ('772','84','揭东县','3','0','');
INSERT INTO `zmt_area` VALUES ('773','84','揭西县','3','0','');
INSERT INTO `zmt_area` VALUES ('774','84','惠来县','3','0','');
INSERT INTO `zmt_area` VALUES ('775','85','茂南区','3','0','');
INSERT INTO `zmt_area` VALUES ('776','85','茂港区','3','0','');
INSERT INTO `zmt_area` VALUES ('777','85','高州市','3','0','');
INSERT INTO `zmt_area` VALUES ('778','85','化州市','3','0','');
INSERT INTO `zmt_area` VALUES ('779','85','信宜市','3','0','');
INSERT INTO `zmt_area` VALUES ('780','85','电白县','3','0','');
INSERT INTO `zmt_area` VALUES ('781','86','梅县','3','0','');
INSERT INTO `zmt_area` VALUES ('782','86','梅江区','3','0','');
INSERT INTO `zmt_area` VALUES ('783','86','兴宁市','3','0','');
INSERT INTO `zmt_area` VALUES ('784','86','大埔县','3','0','');
INSERT INTO `zmt_area` VALUES ('785','86','丰顺县','3','0','');
INSERT INTO `zmt_area` VALUES ('786','86','五华县','3','0','');
INSERT INTO `zmt_area` VALUES ('787','86','平远县','3','0','');
INSERT INTO `zmt_area` VALUES ('788','86','蕉岭县','3','0','');
INSERT INTO `zmt_area` VALUES ('789','87','清城区','3','0','');
INSERT INTO `zmt_area` VALUES ('790','87','英德市','3','0','');
INSERT INTO `zmt_area` VALUES ('791','87','连州市','3','0','');
INSERT INTO `zmt_area` VALUES ('792','87','佛冈县','3','0','');
INSERT INTO `zmt_area` VALUES ('793','87','阳山县','3','0','');
INSERT INTO `zmt_area` VALUES ('794','87','清新县','3','0','');
INSERT INTO `zmt_area` VALUES ('795','87','连山','3','0','');
INSERT INTO `zmt_area` VALUES ('796','87','连南','3','0','');
INSERT INTO `zmt_area` VALUES ('797','88','南澳县','3','0','');
INSERT INTO `zmt_area` VALUES ('798','88','潮阳区','3','0','');
INSERT INTO `zmt_area` VALUES ('799','88','澄海区','3','0','');
INSERT INTO `zmt_area` VALUES ('800','88','龙湖区','3','0','');
INSERT INTO `zmt_area` VALUES ('801','88','金平区','3','0','');
INSERT INTO `zmt_area` VALUES ('802','88','濠江区','3','0','');
INSERT INTO `zmt_area` VALUES ('803','88','潮南区','3','0','');
INSERT INTO `zmt_area` VALUES ('804','89','城区','3','0','');
INSERT INTO `zmt_area` VALUES ('805','89','陆丰市','3','0','');
INSERT INTO `zmt_area` VALUES ('806','89','海丰县','3','0','');
INSERT INTO `zmt_area` VALUES ('807','89','陆河县','3','0','');
INSERT INTO `zmt_area` VALUES ('808','90','曲江县','3','0','');
INSERT INTO `zmt_area` VALUES ('809','90','浈江区','3','0','');
INSERT INTO `zmt_area` VALUES ('810','90','武江区','3','0','');
INSERT INTO `zmt_area` VALUES ('811','90','曲江区','3','0','');
INSERT INTO `zmt_area` VALUES ('812','90','乐昌市','3','0','');
INSERT INTO `zmt_area` VALUES ('813','90','南雄市','3','0','');
INSERT INTO `zmt_area` VALUES ('814','90','始兴县','3','0','');
INSERT INTO `zmt_area` VALUES ('815','90','仁化县','3','0','');
INSERT INTO `zmt_area` VALUES ('816','90','翁源县','3','0','');
INSERT INTO `zmt_area` VALUES ('817','90','新丰县','3','0','');
INSERT INTO `zmt_area` VALUES ('818','90','乳源','3','0','');
INSERT INTO `zmt_area` VALUES ('819','91','江城区','3','0','');
INSERT INTO `zmt_area` VALUES ('820','91','阳春市','3','0','');
INSERT INTO `zmt_area` VALUES ('821','91','阳西县','3','0','');
INSERT INTO `zmt_area` VALUES ('822','91','阳东县','3','0','');
INSERT INTO `zmt_area` VALUES ('823','92','云城区','3','0','');
INSERT INTO `zmt_area` VALUES ('824','92','罗定市','3','0','');
INSERT INTO `zmt_area` VALUES ('825','92','新兴县','3','0','');
INSERT INTO `zmt_area` VALUES ('826','92','郁南县','3','0','');
INSERT INTO `zmt_area` VALUES ('827','92','云安县','3','0','');
INSERT INTO `zmt_area` VALUES ('828','93','赤坎区','3','0','');
INSERT INTO `zmt_area` VALUES ('829','93','霞山区','3','0','');
INSERT INTO `zmt_area` VALUES ('830','93','坡头区','3','0','');
INSERT INTO `zmt_area` VALUES ('831','93','麻章区','3','0','');
INSERT INTO `zmt_area` VALUES ('832','93','廉江市','3','0','');
INSERT INTO `zmt_area` VALUES ('833','93','雷州市','3','0','');
INSERT INTO `zmt_area` VALUES ('834','93','吴川市','3','0','');
INSERT INTO `zmt_area` VALUES ('835','93','遂溪县','3','0','');
INSERT INTO `zmt_area` VALUES ('836','93','徐闻县','3','0','');
INSERT INTO `zmt_area` VALUES ('837','94','肇庆市','3','0','');
INSERT INTO `zmt_area` VALUES ('838','94','高要市','3','0','');
INSERT INTO `zmt_area` VALUES ('839','94','四会市','3','0','');
INSERT INTO `zmt_area` VALUES ('840','94','广宁县','3','0','');
INSERT INTO `zmt_area` VALUES ('841','94','怀集县','3','0','');
INSERT INTO `zmt_area` VALUES ('842','94','封开县','3','0','');
INSERT INTO `zmt_area` VALUES ('843','94','德庆县','3','0','');
INSERT INTO `zmt_area` VALUES ('844','95','石岐街道','3','0','');
INSERT INTO `zmt_area` VALUES ('845','95','东区街道','3','0','');
INSERT INTO `zmt_area` VALUES ('846','95','西区街道','3','0','');
INSERT INTO `zmt_area` VALUES ('847','95','环城街道','3','0','');
INSERT INTO `zmt_area` VALUES ('848','95','中山港街道','3','0','');
INSERT INTO `zmt_area` VALUES ('849','95','五桂山街道','3','0','');
INSERT INTO `zmt_area` VALUES ('850','96','香洲区','3','0','');
INSERT INTO `zmt_area` VALUES ('851','96','斗门区','3','0','');
INSERT INTO `zmt_area` VALUES ('852','96','金湾区','3','0','');
INSERT INTO `zmt_area` VALUES ('853','97','邕宁区','3','0','');
INSERT INTO `zmt_area` VALUES ('854','97','青秀区','3','0','');
INSERT INTO `zmt_area` VALUES ('855','97','兴宁区','3','0','');
INSERT INTO `zmt_area` VALUES ('856','97','良庆区','3','0','');
INSERT INTO `zmt_area` VALUES ('857','97','西乡塘区','3','0','');
INSERT INTO `zmt_area` VALUES ('858','97','江南区','3','0','');
INSERT INTO `zmt_area` VALUES ('859','97','武鸣县','3','0','');
INSERT INTO `zmt_area` VALUES ('860','97','隆安县','3','0','');
INSERT INTO `zmt_area` VALUES ('861','97','马山县','3','0','');
INSERT INTO `zmt_area` VALUES ('862','97','上林县','3','0','');
INSERT INTO `zmt_area` VALUES ('863','97','宾阳县','3','0','');
INSERT INTO `zmt_area` VALUES ('864','97','横县','3','0','');
INSERT INTO `zmt_area` VALUES ('865','98','秀峰区','3','0','');
INSERT INTO `zmt_area` VALUES ('866','98','叠彩区','3','0','');
INSERT INTO `zmt_area` VALUES ('867','98','象山区','3','0','');
INSERT INTO `zmt_area` VALUES ('868','98','七星区','3','0','');
INSERT INTO `zmt_area` VALUES ('869','98','雁山区','3','0','');
INSERT INTO `zmt_area` VALUES ('870','98','阳朔县','3','0','');
INSERT INTO `zmt_area` VALUES ('871','98','临桂县','3','0','');
INSERT INTO `zmt_area` VALUES ('872','98','灵川县','3','0','');
INSERT INTO `zmt_area` VALUES ('873','98','全州县','3','0','');
INSERT INTO `zmt_area` VALUES ('874','98','平乐县','3','0','');
INSERT INTO `zmt_area` VALUES ('875','98','兴安县','3','0','');
INSERT INTO `zmt_area` VALUES ('876','98','灌阳县','3','0','');
INSERT INTO `zmt_area` VALUES ('877','98','荔浦县','3','0','');
INSERT INTO `zmt_area` VALUES ('878','98','资源县','3','0','');
INSERT INTO `zmt_area` VALUES ('879','98','永福县','3','0','');
INSERT INTO `zmt_area` VALUES ('880','98','龙胜','3','0','');
INSERT INTO `zmt_area` VALUES ('881','98','恭城','3','0','');
INSERT INTO `zmt_area` VALUES ('882','99','右江区','3','0','');
INSERT INTO `zmt_area` VALUES ('883','99','凌云县','3','0','');
INSERT INTO `zmt_area` VALUES ('884','99','平果县','3','0','');
INSERT INTO `zmt_area` VALUES ('885','99','西林县','3','0','');
INSERT INTO `zmt_area` VALUES ('886','99','乐业县','3','0','');
INSERT INTO `zmt_area` VALUES ('887','99','德保县','3','0','');
INSERT INTO `zmt_area` VALUES ('888','99','田林县','3','0','');
INSERT INTO `zmt_area` VALUES ('889','99','田阳县','3','0','');
INSERT INTO `zmt_area` VALUES ('890','99','靖西县','3','0','');
INSERT INTO `zmt_area` VALUES ('891','99','田东县','3','0','');
INSERT INTO `zmt_area` VALUES ('892','99','那坡县','3','0','');
INSERT INTO `zmt_area` VALUES ('893','99','隆林','3','0','');
INSERT INTO `zmt_area` VALUES ('894','100','海城区','3','0','');
INSERT INTO `zmt_area` VALUES ('895','100','银海区','3','0','');
INSERT INTO `zmt_area` VALUES ('896','100','铁山港区','3','0','');
INSERT INTO `zmt_area` VALUES ('897','100','合浦县','3','0','');
INSERT INTO `zmt_area` VALUES ('898','101','江州区','3','0','');
INSERT INTO `zmt_area` VALUES ('899','101','凭祥市','3','0','');
INSERT INTO `zmt_area` VALUES ('900','101','宁明县','3','0','');
INSERT INTO `zmt_area` VALUES ('901','101','扶绥县','3','0','');
INSERT INTO `zmt_area` VALUES ('902','101','龙州县','3','0','');
INSERT INTO `zmt_area` VALUES ('903','101','大新县','3','0','');
INSERT INTO `zmt_area` VALUES ('904','101','天等县','3','0','');
INSERT INTO `zmt_area` VALUES ('905','102','港口区','3','0','');
INSERT INTO `zmt_area` VALUES ('906','102','防城区','3','0','');
INSERT INTO `zmt_area` VALUES ('907','102','东兴市','3','0','');
INSERT INTO `zmt_area` VALUES ('908','102','上思县','3','0','');
INSERT INTO `zmt_area` VALUES ('909','103','港北区','3','0','');
INSERT INTO `zmt_area` VALUES ('910','103','港南区','3','0','');
INSERT INTO `zmt_area` VALUES ('911','103','覃塘区','3','0','');
INSERT INTO `zmt_area` VALUES ('912','103','桂平市','3','0','');
INSERT INTO `zmt_area` VALUES ('913','103','平南县','3','0','');
INSERT INTO `zmt_area` VALUES ('914','104','金城江区','3','0','');
INSERT INTO `zmt_area` VALUES ('915','104','宜州市','3','0','');
INSERT INTO `zmt_area` VALUES ('916','104','天峨县','3','0','');
INSERT INTO `zmt_area` VALUES ('917','104','凤山县','3','0','');
INSERT INTO `zmt_area` VALUES ('918','104','南丹县','3','0','');
INSERT INTO `zmt_area` VALUES ('919','104','东兰县','3','0','');
INSERT INTO `zmt_area` VALUES ('920','104','都安','3','0','');
INSERT INTO `zmt_area` VALUES ('921','104','罗城','3','0','');
INSERT INTO `zmt_area` VALUES ('922','104','巴马','3','0','');
INSERT INTO `zmt_area` VALUES ('923','104','环江','3','0','');
INSERT INTO `zmt_area` VALUES ('924','104','大化','3','0','');
INSERT INTO `zmt_area` VALUES ('925','105','八步区','3','0','');
INSERT INTO `zmt_area` VALUES ('926','105','钟山县','3','0','');
INSERT INTO `zmt_area` VALUES ('927','105','昭平县','3','0','');
INSERT INTO `zmt_area` VALUES ('928','105','富川','3','0','');
INSERT INTO `zmt_area` VALUES ('929','106','兴宾区','3','0','');
INSERT INTO `zmt_area` VALUES ('930','106','合山市','3','0','');
INSERT INTO `zmt_area` VALUES ('931','106','象州县','3','0','');
INSERT INTO `zmt_area` VALUES ('932','106','武宣县','3','0','');
INSERT INTO `zmt_area` VALUES ('933','106','忻城县','3','0','');
INSERT INTO `zmt_area` VALUES ('934','106','金秀','3','0','');
INSERT INTO `zmt_area` VALUES ('935','107','城中区','3','0','');
INSERT INTO `zmt_area` VALUES ('936','107','鱼峰区','3','0','');
INSERT INTO `zmt_area` VALUES ('937','107','柳北区','3','0','');
INSERT INTO `zmt_area` VALUES ('938','107','柳南区','3','0','');
INSERT INTO `zmt_area` VALUES ('939','107','柳江县','3','0','');
INSERT INTO `zmt_area` VALUES ('940','107','柳城县','3','0','');
INSERT INTO `zmt_area` VALUES ('941','107','鹿寨县','3','0','');
INSERT INTO `zmt_area` VALUES ('942','107','融安县','3','0','');
INSERT INTO `zmt_area` VALUES ('943','107','融水','3','0','');
INSERT INTO `zmt_area` VALUES ('944','107','三江','3','0','');
INSERT INTO `zmt_area` VALUES ('945','108','钦南区','3','0','');
INSERT INTO `zmt_area` VALUES ('946','108','钦北区','3','0','');
INSERT INTO `zmt_area` VALUES ('947','108','灵山县','3','0','');
INSERT INTO `zmt_area` VALUES ('948','108','浦北县','3','0','');
INSERT INTO `zmt_area` VALUES ('949','109','万秀区','3','0','');
INSERT INTO `zmt_area` VALUES ('950','109','蝶山区','3','0','');
INSERT INTO `zmt_area` VALUES ('951','109','长洲区','3','0','');
INSERT INTO `zmt_area` VALUES ('952','109','岑溪市','3','0','');
INSERT INTO `zmt_area` VALUES ('953','109','苍梧县','3','0','');
INSERT INTO `zmt_area` VALUES ('954','109','藤县','3','0','');
INSERT INTO `zmt_area` VALUES ('955','109','蒙山县','3','0','');
INSERT INTO `zmt_area` VALUES ('956','110','玉州区','3','0','');
INSERT INTO `zmt_area` VALUES ('957','110','北流市','3','0','');
INSERT INTO `zmt_area` VALUES ('958','110','容县','3','0','');
INSERT INTO `zmt_area` VALUES ('959','110','陆川县','3','0','');
INSERT INTO `zmt_area` VALUES ('960','110','博白县','3','0','');
INSERT INTO `zmt_area` VALUES ('961','110','兴业县','3','0','');
INSERT INTO `zmt_area` VALUES ('962','111','南明区','3','0','');
INSERT INTO `zmt_area` VALUES ('963','111','云岩区','3','0','');
INSERT INTO `zmt_area` VALUES ('964','111','花溪区','3','0','');
INSERT INTO `zmt_area` VALUES ('965','111','乌当区','3','0','');
INSERT INTO `zmt_area` VALUES ('966','111','白云区','3','0','');
INSERT INTO `zmt_area` VALUES ('967','111','小河区','3','0','');
INSERT INTO `zmt_area` VALUES ('968','111','金阳新区','3','0','');
INSERT INTO `zmt_area` VALUES ('969','111','新天园区','3','0','');
INSERT INTO `zmt_area` VALUES ('970','111','清镇市','3','0','');
INSERT INTO `zmt_area` VALUES ('971','111','开阳县','3','0','');
INSERT INTO `zmt_area` VALUES ('972','111','修文县','3','0','');
INSERT INTO `zmt_area` VALUES ('973','111','息烽县','3','0','');
INSERT INTO `zmt_area` VALUES ('974','112','西秀区','3','0','');
INSERT INTO `zmt_area` VALUES ('975','112','关岭','3','0','');
INSERT INTO `zmt_area` VALUES ('976','112','镇宁','3','0','');
INSERT INTO `zmt_area` VALUES ('977','112','紫云','3','0','');
INSERT INTO `zmt_area` VALUES ('978','112','平坝县','3','0','');
INSERT INTO `zmt_area` VALUES ('979','112','普定县','3','0','');
INSERT INTO `zmt_area` VALUES ('980','113','毕节市','3','0','');
INSERT INTO `zmt_area` VALUES ('981','113','大方县','3','0','');
INSERT INTO `zmt_area` VALUES ('982','113','黔西县','3','0','');
INSERT INTO `zmt_area` VALUES ('983','113','金沙县','3','0','');
INSERT INTO `zmt_area` VALUES ('984','113','织金县','3','0','');
INSERT INTO `zmt_area` VALUES ('985','113','纳雍县','3','0','');
INSERT INTO `zmt_area` VALUES ('986','113','赫章县','3','0','');
INSERT INTO `zmt_area` VALUES ('987','113','威宁','3','0','');
INSERT INTO `zmt_area` VALUES ('988','114','钟山区','3','0','');
INSERT INTO `zmt_area` VALUES ('989','114','六枝特区','3','0','');
INSERT INTO `zmt_area` VALUES ('990','114','水城县','3','0','');
INSERT INTO `zmt_area` VALUES ('991','114','盘县','3','0','');
INSERT INTO `zmt_area` VALUES ('992','115','凯里市','3','0','');
INSERT INTO `zmt_area` VALUES ('993','115','黄平县','3','0','');
INSERT INTO `zmt_area` VALUES ('994','115','施秉县','3','0','');
INSERT INTO `zmt_area` VALUES ('995','115','三穗县','3','0','');
INSERT INTO `zmt_area` VALUES ('996','115','镇远县','3','0','');
INSERT INTO `zmt_area` VALUES ('997','115','岑巩县','3','0','');
INSERT INTO `zmt_area` VALUES ('998','115','天柱县','3','0','');
INSERT INTO `zmt_area` VALUES ('999','115','锦屏县','3','0','');
INSERT INTO `zmt_area` VALUES ('1000','115','剑河县','3','0','');
INSERT INTO `zmt_area` VALUES ('1001','115','台江县','3','0','');
INSERT INTO `zmt_area` VALUES ('1002','115','黎平县','3','0','');
INSERT INTO `zmt_area` VALUES ('1003','115','榕江县','3','0','');
INSERT INTO `zmt_area` VALUES ('1004','115','从江县','3','0','');
INSERT INTO `zmt_area` VALUES ('1005','115','雷山县','3','0','');
INSERT INTO `zmt_area` VALUES ('1006','115','麻江县','3','0','');
INSERT INTO `zmt_area` VALUES ('1007','115','丹寨县','3','0','');
INSERT INTO `zmt_area` VALUES ('1008','116','都匀市','3','0','');
INSERT INTO `zmt_area` VALUES ('1009','116','福泉市','3','0','');
INSERT INTO `zmt_area` VALUES ('1010','116','荔波县','3','0','');
INSERT INTO `zmt_area` VALUES ('1011','116','贵定县','3','0','');
INSERT INTO `zmt_area` VALUES ('1012','116','瓮安县','3','0','');
INSERT INTO `zmt_area` VALUES ('1013','116','独山县','3','0','');
INSERT INTO `zmt_area` VALUES ('1014','116','平塘县','3','0','');
INSERT INTO `zmt_area` VALUES ('1015','116','罗甸县','3','0','');
INSERT INTO `zmt_area` VALUES ('1016','116','长顺县','3','0','');
INSERT INTO `zmt_area` VALUES ('1017','116','龙里县','3','0','');
INSERT INTO `zmt_area` VALUES ('1018','116','惠水县','3','0','');
INSERT INTO `zmt_area` VALUES ('1019','116','三都','3','0','');
INSERT INTO `zmt_area` VALUES ('1020','117','兴义市','3','0','');
INSERT INTO `zmt_area` VALUES ('1021','117','兴仁县','3','0','');
INSERT INTO `zmt_area` VALUES ('1022','117','普安县','3','0','');
INSERT INTO `zmt_area` VALUES ('1023','117','晴隆县','3','0','');
INSERT INTO `zmt_area` VALUES ('1024','117','贞丰县','3','0','');
INSERT INTO `zmt_area` VALUES ('1025','117','望谟县','3','0','');
INSERT INTO `zmt_area` VALUES ('1026','117','册亨县','3','0','');
INSERT INTO `zmt_area` VALUES ('1027','117','安龙县','3','0','');
INSERT INTO `zmt_area` VALUES ('1028','118','铜仁市','3','0','');
INSERT INTO `zmt_area` VALUES ('1029','118','江口县','3','0','');
INSERT INTO `zmt_area` VALUES ('1030','118','石阡县','3','0','');
INSERT INTO `zmt_area` VALUES ('1031','118','思南县','3','0','');
INSERT INTO `zmt_area` VALUES ('1032','118','德江县','3','0','');
INSERT INTO `zmt_area` VALUES ('1033','118','玉屏','3','0','');
INSERT INTO `zmt_area` VALUES ('1034','118','印江','3','0','');
INSERT INTO `zmt_area` VALUES ('1035','118','沿河','3','0','');
INSERT INTO `zmt_area` VALUES ('1036','118','松桃','3','0','');
INSERT INTO `zmt_area` VALUES ('1037','118','万山特区','3','0','');
INSERT INTO `zmt_area` VALUES ('1038','119','红花岗区','3','0','');
INSERT INTO `zmt_area` VALUES ('1039','119','务川县','3','0','');
INSERT INTO `zmt_area` VALUES ('1040','119','道真县','3','0','');
INSERT INTO `zmt_area` VALUES ('1041','119','汇川区','3','0','');
INSERT INTO `zmt_area` VALUES ('1042','119','赤水市','3','0','');
INSERT INTO `zmt_area` VALUES ('1043','119','仁怀市','3','0','');
INSERT INTO `zmt_area` VALUES ('1044','119','遵义县','3','0','');
INSERT INTO `zmt_area` VALUES ('1045','119','桐梓县','3','0','');
INSERT INTO `zmt_area` VALUES ('1046','119','绥阳县','3','0','');
INSERT INTO `zmt_area` VALUES ('1047','119','正安县','3','0','');
INSERT INTO `zmt_area` VALUES ('1048','119','凤冈县','3','0','');
INSERT INTO `zmt_area` VALUES ('1049','119','湄潭县','3','0','');
INSERT INTO `zmt_area` VALUES ('1050','119','余庆县','3','0','');
INSERT INTO `zmt_area` VALUES ('1051','119','习水县','3','0','');
INSERT INTO `zmt_area` VALUES ('1052','119','道真','3','0','');
INSERT INTO `zmt_area` VALUES ('1053','119','务川','3','0','');
INSERT INTO `zmt_area` VALUES ('1054','120','秀英区','3','0','');
INSERT INTO `zmt_area` VALUES ('1055','120','龙华区','3','0','');
INSERT INTO `zmt_area` VALUES ('1056','120','琼山区','3','0','');
INSERT INTO `zmt_area` VALUES ('1057','120','美兰区','3','0','');
INSERT INTO `zmt_area` VALUES ('1058','137','市区','3','0','');
INSERT INTO `zmt_area` VALUES ('1059','137','洋浦开发区','3','0','');
INSERT INTO `zmt_area` VALUES ('1060','137','那大镇','3','0','');
INSERT INTO `zmt_area` VALUES ('1061','137','王五镇','3','0','');
INSERT INTO `zmt_area` VALUES ('1062','137','雅星镇','3','0','');
INSERT INTO `zmt_area` VALUES ('1063','137','大成镇','3','0','');
INSERT INTO `zmt_area` VALUES ('1064','137','中和镇','3','0','');
INSERT INTO `zmt_area` VALUES ('1065','137','峨蔓镇','3','0','');
INSERT INTO `zmt_area` VALUES ('1066','137','南丰镇','3','0','');
INSERT INTO `zmt_area` VALUES ('1067','137','白马井镇','3','0','');
INSERT INTO `zmt_area` VALUES ('1068','137','兰洋镇','3','0','');
INSERT INTO `zmt_area` VALUES ('1069','137','和庆镇','3','0','');
INSERT INTO `zmt_area` VALUES ('1070','137','海头镇','3','0','');
INSERT INTO `zmt_area` VALUES ('1071','137','排浦镇','3','0','');
INSERT INTO `zmt_area` VALUES ('1072','137','东成镇','3','0','');
INSERT INTO `zmt_area` VALUES ('1073','137','光村镇','3','0','');
INSERT INTO `zmt_area` VALUES ('1074','137','木棠镇','3','0','');
INSERT INTO `zmt_area` VALUES ('1075','137','新州镇','3','0','');
INSERT INTO `zmt_area` VALUES ('1076','137','三都镇','3','0','');
INSERT INTO `zmt_area` VALUES ('1077','137','其他','3','0','');
INSERT INTO `zmt_area` VALUES ('1078','138','长安区','3','0','');
INSERT INTO `zmt_area` VALUES ('1079','138','桥东区','3','0','');
INSERT INTO `zmt_area` VALUES ('1080','138','桥西区','3','0','');
INSERT INTO `zmt_area` VALUES ('1081','138','新华区','3','0','');
INSERT INTO `zmt_area` VALUES ('1082','138','裕华区','3','0','');
INSERT INTO `zmt_area` VALUES ('1083','138','井陉矿区','3','0','');
INSERT INTO `zmt_area` VALUES ('1084','138','高新区','3','0','');
INSERT INTO `zmt_area` VALUES ('1085','138','辛集市','3','0','');
INSERT INTO `zmt_area` VALUES ('1086','138','藁城市','3','0','');
INSERT INTO `zmt_area` VALUES ('1087','138','晋州市','3','0','');
INSERT INTO `zmt_area` VALUES ('1088','138','新乐市','3','0','');
INSERT INTO `zmt_area` VALUES ('1089','138','鹿泉市','3','0','');
INSERT INTO `zmt_area` VALUES ('1090','138','井陉县','3','0','');
INSERT INTO `zmt_area` VALUES ('1091','138','正定县','3','0','');
INSERT INTO `zmt_area` VALUES ('1092','138','栾城县','3','0','');
INSERT INTO `zmt_area` VALUES ('1093','138','行唐县','3','0','');
INSERT INTO `zmt_area` VALUES ('1094','138','灵寿县','3','0','');
INSERT INTO `zmt_area` VALUES ('1095','138','高邑县','3','0','');
INSERT INTO `zmt_area` VALUES ('1096','138','深泽县','3','0','');
INSERT INTO `zmt_area` VALUES ('1097','138','赞皇县','3','0','');
INSERT INTO `zmt_area` VALUES ('1098','138','无极县','3','0','');
INSERT INTO `zmt_area` VALUES ('1099','138','平山县','3','0','');
INSERT INTO `zmt_area` VALUES ('1100','138','元氏县','3','0','');
INSERT INTO `zmt_area` VALUES ('1101','138','赵县','3','0','');
INSERT INTO `zmt_area` VALUES ('1102','139','新市区','3','0','');
INSERT INTO `zmt_area` VALUES ('1103','139','南市区','3','0','');
INSERT INTO `zmt_area` VALUES ('1104','139','北市区','3','0','');
INSERT INTO `zmt_area` VALUES ('1105','139','涿州市','3','0','');
INSERT INTO `zmt_area` VALUES ('1106','139','定州市','3','0','');
INSERT INTO `zmt_area` VALUES ('1107','139','安国市','3','0','');
INSERT INTO `zmt_area` VALUES ('1108','139','高碑店市','3','0','');
INSERT INTO `zmt_area` VALUES ('1109','139','满城县','3','0','');
INSERT INTO `zmt_area` VALUES ('1110','139','清苑县','3','0','');
INSERT INTO `zmt_area` VALUES ('1111','139','涞水县','3','0','');
INSERT INTO `zmt_area` VALUES ('1112','139','阜平县','3','0','');
INSERT INTO `zmt_area` VALUES ('1113','139','徐水县','3','0','');
INSERT INTO `zmt_area` VALUES ('1114','139','定兴县','3','0','');
INSERT INTO `zmt_area` VALUES ('1115','139','唐县','3','0','');
INSERT INTO `zmt_area` VALUES ('1116','139','高阳县','3','0','');
INSERT INTO `zmt_area` VALUES ('1117','139','容城县','3','0','');
INSERT INTO `zmt_area` VALUES ('1118','139','涞源县','3','0','');
INSERT INTO `zmt_area` VALUES ('1119','139','望都县','3','0','');
INSERT INTO `zmt_area` VALUES ('1120','139','安新县','3','0','');
INSERT INTO `zmt_area` VALUES ('1121','139','易县','3','0','');
INSERT INTO `zmt_area` VALUES ('1122','139','曲阳县','3','0','');
INSERT INTO `zmt_area` VALUES ('1123','139','蠡县','3','0','');
INSERT INTO `zmt_area` VALUES ('1124','139','顺平县','3','0','');
INSERT INTO `zmt_area` VALUES ('1125','139','博野县','3','0','');
INSERT INTO `zmt_area` VALUES ('1126','139','雄县','3','0','');
INSERT INTO `zmt_area` VALUES ('1127','140','运河区','3','0','');
INSERT INTO `zmt_area` VALUES ('1128','140','新华区','3','0','');
INSERT INTO `zmt_area` VALUES ('1129','140','泊头市','3','0','');
INSERT INTO `zmt_area` VALUES ('1130','140','任丘市','3','0','');
INSERT INTO `zmt_area` VALUES ('1131','140','黄骅市','3','0','');
INSERT INTO `zmt_area` VALUES ('1132','140','河间市','3','0','');
INSERT INTO `zmt_area` VALUES ('1133','140','沧县','3','0','');
INSERT INTO `zmt_area` VALUES ('1134','140','青县','3','0','');
INSERT INTO `zmt_area` VALUES ('1135','140','东光县','3','0','');
INSERT INTO `zmt_area` VALUES ('1136','140','海兴县','3','0','');
INSERT INTO `zmt_area` VALUES ('1137','140','盐山县','3','0','');
INSERT INTO `zmt_area` VALUES ('1138','140','肃宁县','3','0','');
INSERT INTO `zmt_area` VALUES ('1139','140','南皮县','3','0','');
INSERT INTO `zmt_area` VALUES ('1140','140','吴桥县','3','0','');
INSERT INTO `zmt_area` VALUES ('1141','140','献县','3','0','');
INSERT INTO `zmt_area` VALUES ('1142','140','孟村','3','0','');
INSERT INTO `zmt_area` VALUES ('1143','141','双桥区','3','0','');
INSERT INTO `zmt_area` VALUES ('1144','141','双滦区','3','0','');
INSERT INTO `zmt_area` VALUES ('1145','141','鹰手营子矿区','3','0','');
INSERT INTO `zmt_area` VALUES ('1146','141','承德县','3','0','');
INSERT INTO `zmt_area` VALUES ('1147','141','兴隆县','3','0','');
INSERT INTO `zmt_area` VALUES ('1148','141','平泉县','3','0','');
INSERT INTO `zmt_area` VALUES ('1149','141','滦平县','3','0','');
INSERT INTO `zmt_area` VALUES ('1150','141','隆化县','3','0','');
INSERT INTO `zmt_area` VALUES ('1151','141','丰宁','3','0','');
INSERT INTO `zmt_area` VALUES ('1152','141','宽城','3','0','');
INSERT INTO `zmt_area` VALUES ('1153','141','围场','3','0','');
INSERT INTO `zmt_area` VALUES ('1154','142','从台区','3','0','');
INSERT INTO `zmt_area` VALUES ('1155','142','复兴区','3','0','');
INSERT INTO `zmt_area` VALUES ('1156','142','邯山区','3','0','');
INSERT INTO `zmt_area` VALUES ('1157','142','峰峰矿区','3','0','');
INSERT INTO `zmt_area` VALUES ('1158','142','武安市','3','0','');
INSERT INTO `zmt_area` VALUES ('1159','142','邯郸县','3','0','');
INSERT INTO `zmt_area` VALUES ('1160','142','临漳县','3','0','');
INSERT INTO `zmt_area` VALUES ('1161','142','成安县','3','0','');
INSERT INTO `zmt_area` VALUES ('1162','142','大名县','3','0','');
INSERT INTO `zmt_area` VALUES ('1163','142','涉县','3','0','');
INSERT INTO `zmt_area` VALUES ('1164','142','磁县','3','0','');
INSERT INTO `zmt_area` VALUES ('1165','142','肥乡县','3','0','');
INSERT INTO `zmt_area` VALUES ('1166','142','永年县','3','0','');
INSERT INTO `zmt_area` VALUES ('1167','142','邱县','3','0','');
INSERT INTO `zmt_area` VALUES ('1168','142','鸡泽县','3','0','');
INSERT INTO `zmt_area` VALUES ('1169','142','广平县','3','0','');
INSERT INTO `zmt_area` VALUES ('1170','142','馆陶县','3','0','');
INSERT INTO `zmt_area` VALUES ('1171','142','魏县','3','0','');
INSERT INTO `zmt_area` VALUES ('1172','142','曲周县','3','0','');
INSERT INTO `zmt_area` VALUES ('1173','143','桃城区','3','0','');
INSERT INTO `zmt_area` VALUES ('1174','143','冀州市','3','0','');
INSERT INTO `zmt_area` VALUES ('1175','143','深州市','3','0','');
INSERT INTO `zmt_area` VALUES ('1176','143','枣强县','3','0','');
INSERT INTO `zmt_area` VALUES ('1177','143','武邑县','3','0','');
INSERT INTO `zmt_area` VALUES ('1178','143','武强县','3','0','');
INSERT INTO `zmt_area` VALUES ('1179','143','饶阳县','3','0','');
INSERT INTO `zmt_area` VALUES ('1180','143','安平县','3','0','');
INSERT INTO `zmt_area` VALUES ('1181','143','故城县','3','0','');
INSERT INTO `zmt_area` VALUES ('1182','143','景县','3','0','');
INSERT INTO `zmt_area` VALUES ('1183','143','阜城县','3','0','');
INSERT INTO `zmt_area` VALUES ('1184','144','安次区','3','0','');
INSERT INTO `zmt_area` VALUES ('1185','144','广阳区','3','0','');
INSERT INTO `zmt_area` VALUES ('1186','144','霸州市','3','0','');
INSERT INTO `zmt_area` VALUES ('1187','144','三河市','3','0','');
INSERT INTO `zmt_area` VALUES ('1188','144','固安县','3','0','');
INSERT INTO `zmt_area` VALUES ('1189','144','永清县','3','0','');
INSERT INTO `zmt_area` VALUES ('1190','144','香河县','3','0','');
INSERT INTO `zmt_area` VALUES ('1191','144','大城县','3','0','');
INSERT INTO `zmt_area` VALUES ('1192','144','文安县','3','0','');
INSERT INTO `zmt_area` VALUES ('1193','144','大厂','3','0','');
INSERT INTO `zmt_area` VALUES ('1194','145','海港区','3','0','');
INSERT INTO `zmt_area` VALUES ('1195','145','山海关区','3','0','');
INSERT INTO `zmt_area` VALUES ('1196','145','北戴河区','3','0','');
INSERT INTO `zmt_area` VALUES ('1197','145','昌黎县','3','0','');
INSERT INTO `zmt_area` VALUES ('1198','145','抚宁县','3','0','');
INSERT INTO `zmt_area` VALUES ('1199','145','卢龙县','3','0','');
INSERT INTO `zmt_area` VALUES ('1200','145','青龙','3','0','');
INSERT INTO `zmt_area` VALUES ('1201','146','路北区','3','0','');
INSERT INTO `zmt_area` VALUES ('1202','146','路南区','3','0','');
INSERT INTO `zmt_area` VALUES ('1203','146','古冶区','3','0','');
INSERT INTO `zmt_area` VALUES ('1204','146','开平区','3','0','');
INSERT INTO `zmt_area` VALUES ('1205','146','丰南区','3','0','');
INSERT INTO `zmt_area` VALUES ('1206','146','丰润区','3','0','');
INSERT INTO `zmt_area` VALUES ('1207','146','遵化市','3','0','');
INSERT INTO `zmt_area` VALUES ('1208','146','迁安市','3','0','');
INSERT INTO `zmt_area` VALUES ('1209','146','滦县','3','0','');
INSERT INTO `zmt_area` VALUES ('1210','146','滦南县','3','0','');
INSERT INTO `zmt_area` VALUES ('1211','146','乐亭县','3','0','');
INSERT INTO `zmt_area` VALUES ('1212','146','迁西县','3','0','');
INSERT INTO `zmt_area` VALUES ('1213','146','玉田县','3','0','');
INSERT INTO `zmt_area` VALUES ('1214','146','唐海县','3','0','');
INSERT INTO `zmt_area` VALUES ('1215','147','桥东区','3','0','');
INSERT INTO `zmt_area` VALUES ('1216','147','桥西区','3','0','');
INSERT INTO `zmt_area` VALUES ('1217','147','南宫市','3','0','');
INSERT INTO `zmt_area` VALUES ('1218','147','沙河市','3','0','');
INSERT INTO `zmt_area` VALUES ('1219','147','邢台县','3','0','');
INSERT INTO `zmt_area` VALUES ('1220','147','临城县','3','0','');
INSERT INTO `zmt_area` VALUES ('1221','147','内丘县','3','0','');
INSERT INTO `zmt_area` VALUES ('1222','147','柏乡县','3','0','');
INSERT INTO `zmt_area` VALUES ('1223','147','隆尧县','3','0','');
INSERT INTO `zmt_area` VALUES ('1224','147','任县','3','0','');
INSERT INTO `zmt_area` VALUES ('1225','147','南和县','3','0','');
INSERT INTO `zmt_area` VALUES ('1226','147','宁晋县','3','0','');
INSERT INTO `zmt_area` VALUES ('1227','147','巨鹿县','3','0','');
INSERT INTO `zmt_area` VALUES ('1228','147','新河县','3','0','');
INSERT INTO `zmt_area` VALUES ('1229','147','广宗县','3','0','');
INSERT INTO `zmt_area` VALUES ('1230','147','平乡县','3','0','');
INSERT INTO `zmt_area` VALUES ('1231','147','威县','3','0','');
INSERT INTO `zmt_area` VALUES ('1232','147','清河县','3','0','');
INSERT INTO `zmt_area` VALUES ('1233','147','临西县','3','0','');
INSERT INTO `zmt_area` VALUES ('1234','148','桥西区','3','0','');
INSERT INTO `zmt_area` VALUES ('1235','148','桥东区','3','0','');
INSERT INTO `zmt_area` VALUES ('1236','148','宣化区','3','0','');
INSERT INTO `zmt_area` VALUES ('1237','148','下花园区','3','0','');
INSERT INTO `zmt_area` VALUES ('1238','148','宣化县','3','0','');
INSERT INTO `zmt_area` VALUES ('1239','148','张北县','3','0','');
INSERT INTO `zmt_area` VALUES ('1240','148','康保县','3','0','');
INSERT INTO `zmt_area` VALUES ('1241','148','沽源县','3','0','');
INSERT INTO `zmt_area` VALUES ('1242','148','尚义县','3','0','');
INSERT INTO `zmt_area` VALUES ('1243','148','蔚县','3','0','');
INSERT INTO `zmt_area` VALUES ('1244','148','阳原县','3','0','');
INSERT INTO `zmt_area` VALUES ('1245','148','怀安县','3','0','');
INSERT INTO `zmt_area` VALUES ('1246','148','万全县','3','0','');
INSERT INTO `zmt_area` VALUES ('1247','148','怀来县','3','0','');
INSERT INTO `zmt_area` VALUES ('1248','148','涿鹿县','3','0','');
INSERT INTO `zmt_area` VALUES ('1249','148','赤城县','3','0','');
INSERT INTO `zmt_area` VALUES ('1250','148','崇礼县','3','0','');
INSERT INTO `zmt_area` VALUES ('1251','149','金水区','3','0','');
INSERT INTO `zmt_area` VALUES ('1252','149','邙山区','3','0','');
INSERT INTO `zmt_area` VALUES ('1253','149','二七区','3','0','');
INSERT INTO `zmt_area` VALUES ('1254','149','管城区','3','0','');
INSERT INTO `zmt_area` VALUES ('1255','149','中原区','3','0','');
INSERT INTO `zmt_area` VALUES ('1256','149','上街区','3','0','');
INSERT INTO `zmt_area` VALUES ('1257','149','惠济区','3','0','');
INSERT INTO `zmt_area` VALUES ('1258','149','郑东新区','3','0','');
INSERT INTO `zmt_area` VALUES ('1259','149','经济技术开发区','3','0','');
INSERT INTO `zmt_area` VALUES ('1260','149','高新开发区','3','0','');
INSERT INTO `zmt_area` VALUES ('1261','149','出口加工区','3','0','');
INSERT INTO `zmt_area` VALUES ('1262','149','巩义市','3','0','');
INSERT INTO `zmt_area` VALUES ('1263','149','荥阳市','3','0','');
INSERT INTO `zmt_area` VALUES ('1264','149','新密市','3','0','');
INSERT INTO `zmt_area` VALUES ('1265','149','新郑市','3','0','');
INSERT INTO `zmt_area` VALUES ('1266','149','登封市','3','0','');
INSERT INTO `zmt_area` VALUES ('1267','149','中牟县','3','0','');
INSERT INTO `zmt_area` VALUES ('1268','150','西工区','3','0','');
INSERT INTO `zmt_area` VALUES ('1269','150','老城区','3','0','');
INSERT INTO `zmt_area` VALUES ('1270','150','涧西区','3','0','');
INSERT INTO `zmt_area` VALUES ('1271','150','瀍河回族区','3','0','');
INSERT INTO `zmt_area` VALUES ('1272','150','洛龙区','3','0','');
INSERT INTO `zmt_area` VALUES ('1273','150','吉利区','3','0','');
INSERT INTO `zmt_area` VALUES ('1274','150','偃师市','3','0','');
INSERT INTO `zmt_area` VALUES ('1275','150','孟津县','3','0','');
INSERT INTO `zmt_area` VALUES ('1276','150','新安县','3','0','');
INSERT INTO `zmt_area` VALUES ('1277','150','栾川县','3','0','');
INSERT INTO `zmt_area` VALUES ('1278','150','嵩县','3','0','');
INSERT INTO `zmt_area` VALUES ('1279','150','汝阳县','3','0','');
INSERT INTO `zmt_area` VALUES ('1280','150','宜阳县','3','0','');
INSERT INTO `zmt_area` VALUES ('1281','150','洛宁县','3','0','');
INSERT INTO `zmt_area` VALUES ('1282','150','伊川县','3','0','');
INSERT INTO `zmt_area` VALUES ('1283','151','鼓楼区','3','0','');
INSERT INTO `zmt_area` VALUES ('1284','151','龙亭区','3','0','');
INSERT INTO `zmt_area` VALUES ('1285','151','顺河回族区','3','0','');
INSERT INTO `zmt_area` VALUES ('1286','151','金明区','3','0','');
INSERT INTO `zmt_area` VALUES ('1287','151','禹王台区','3','0','');
INSERT INTO `zmt_area` VALUES ('1288','151','杞县','3','0','');
INSERT INTO `zmt_area` VALUES ('1289','151','通许县','3','0','');
INSERT INTO `zmt_area` VALUES ('1290','151','尉氏县','3','0','');
INSERT INTO `zmt_area` VALUES ('1291','151','开封县','3','0','');
INSERT INTO `zmt_area` VALUES ('1292','151','兰考县','3','0','');
INSERT INTO `zmt_area` VALUES ('1293','152','北关区','3','0','');
INSERT INTO `zmt_area` VALUES ('1294','152','文峰区','3','0','');
INSERT INTO `zmt_area` VALUES ('1295','152','殷都区','3','0','');
INSERT INTO `zmt_area` VALUES ('1296','152','龙安区','3','0','');
INSERT INTO `zmt_area` VALUES ('1297','152','林州市','3','0','');
INSERT INTO `zmt_area` VALUES ('1298','152','安阳县','3','0','');
INSERT INTO `zmt_area` VALUES ('1299','152','汤阴县','3','0','');
INSERT INTO `zmt_area` VALUES ('1300','152','滑县','3','0','');
INSERT INTO `zmt_area` VALUES ('1301','152','内黄县','3','0','');
INSERT INTO `zmt_area` VALUES ('1302','153','淇滨区','3','0','');
INSERT INTO `zmt_area` VALUES ('1303','153','山城区','3','0','');
INSERT INTO `zmt_area` VALUES ('1304','153','鹤山区','3','0','');
INSERT INTO `zmt_area` VALUES ('1305','153','浚县','3','0','');
INSERT INTO `zmt_area` VALUES ('1306','153','淇县','3','0','');
INSERT INTO `zmt_area` VALUES ('1307','154','济源市','3','0','');
INSERT INTO `zmt_area` VALUES ('1308','155','解放区','3','0','');
INSERT INTO `zmt_area` VALUES ('1309','155','中站区','3','0','');
INSERT INTO `zmt_area` VALUES ('1310','155','马村区','3','0','');
INSERT INTO `zmt_area` VALUES ('1311','155','山阳区','3','0','');
INSERT INTO `zmt_area` VALUES ('1312','155','沁阳市','3','0','');
INSERT INTO `zmt_area` VALUES ('1313','155','孟州市','3','0','');
INSERT INTO `zmt_area` VALUES ('1314','155','修武县','3','0','');
INSERT INTO `zmt_area` VALUES ('1315','155','博爱县','3','0','');
INSERT INTO `zmt_area` VALUES ('1316','155','武陟县','3','0','');
INSERT INTO `zmt_area` VALUES ('1317','155','温县','3','0','');
INSERT INTO `zmt_area` VALUES ('1318','156','卧龙区','3','0','');
INSERT INTO `zmt_area` VALUES ('1319','156','宛城区','3','0','');
INSERT INTO `zmt_area` VALUES ('1320','156','邓州市','3','0','');
INSERT INTO `zmt_area` VALUES ('1321','156','南召县','3','0','');
INSERT INTO `zmt_area` VALUES ('1322','156','方城县','3','0','');
INSERT INTO `zmt_area` VALUES ('1323','156','西峡县','3','0','');
INSERT INTO `zmt_area` VALUES ('1324','156','镇平县','3','0','');
INSERT INTO `zmt_area` VALUES ('1325','156','内乡县','3','0','');
INSERT INTO `zmt_area` VALUES ('1326','156','淅川县','3','0','');
INSERT INTO `zmt_area` VALUES ('1327','156','社旗县','3','0','');
INSERT INTO `zmt_area` VALUES ('1328','156','唐河县','3','0','');
INSERT INTO `zmt_area` VALUES ('1329','156','新野县','3','0','');
INSERT INTO `zmt_area` VALUES ('1330','156','桐柏县','3','0','');
INSERT INTO `zmt_area` VALUES ('1331','157','新华区','3','0','');
INSERT INTO `zmt_area` VALUES ('1332','157','卫东区','3','0','');
INSERT INTO `zmt_area` VALUES ('1333','157','湛河区','3','0','');
INSERT INTO `zmt_area` VALUES ('1334','157','石龙区','3','0','');
INSERT INTO `zmt_area` VALUES ('1335','157','舞钢市','3','0','');
INSERT INTO `zmt_area` VALUES ('1336','157','汝州市','3','0','');
INSERT INTO `zmt_area` VALUES ('1337','157','宝丰县','3','0','');
INSERT INTO `zmt_area` VALUES ('1338','157','叶县','3','0','');
INSERT INTO `zmt_area` VALUES ('1339','157','鲁山县','3','0','');
INSERT INTO `zmt_area` VALUES ('1340','157','郏县','3','0','');
INSERT INTO `zmt_area` VALUES ('1341','158','湖滨区','3','0','');
INSERT INTO `zmt_area` VALUES ('1342','158','义马市','3','0','');
INSERT INTO `zmt_area` VALUES ('1343','158','灵宝市','3','0','');
INSERT INTO `zmt_area` VALUES ('1344','158','渑池县','3','0','');
INSERT INTO `zmt_area` VALUES ('1345','158','陕县','3','0','');
INSERT INTO `zmt_area` VALUES ('1346','158','卢氏县','3','0','');
INSERT INTO `zmt_area` VALUES ('1347','159','梁园区','3','0','');
INSERT INTO `zmt_area` VALUES ('1348','159','睢阳区','3','0','');
INSERT INTO `zmt_area` VALUES ('1349','159','永城市','3','0','');
INSERT INTO `zmt_area` VALUES ('1350','159','民权县','3','0','');
INSERT INTO `zmt_area` VALUES ('1351','159','睢县','3','0','');
INSERT INTO `zmt_area` VALUES ('1352','159','宁陵县','3','0','');
INSERT INTO `zmt_area` VALUES ('1353','159','虞城县','3','0','');
INSERT INTO `zmt_area` VALUES ('1354','159','柘城县','3','0','');
INSERT INTO `zmt_area` VALUES ('1355','159','夏邑县','3','0','');
INSERT INTO `zmt_area` VALUES ('1356','160','卫滨区','3','0','');
INSERT INTO `zmt_area` VALUES ('1357','160','红旗区','3','0','');
INSERT INTO `zmt_area` VALUES ('1358','160','凤泉区','3','0','');
INSERT INTO `zmt_area` VALUES ('1359','160','牧野区','3','0','');
INSERT INTO `zmt_area` VALUES ('1360','160','卫辉市','3','0','');
INSERT INTO `zmt_area` VALUES ('1361','160','辉县市','3','0','');
INSERT INTO `zmt_area` VALUES ('1362','160','新乡县','3','0','');
INSERT INTO `zmt_area` VALUES ('1363','160','获嘉县','3','0','');
INSERT INTO `zmt_area` VALUES ('1364','160','原阳县','3','0','');
INSERT INTO `zmt_area` VALUES ('1365','160','延津县','3','0','');
INSERT INTO `zmt_area` VALUES ('1366','160','封丘县','3','0','');
INSERT INTO `zmt_area` VALUES ('1367','160','长垣县','3','0','');
INSERT INTO `zmt_area` VALUES ('1368','161','浉河区','3','0','');
INSERT INTO `zmt_area` VALUES ('1369','161','平桥区','3','0','');
INSERT INTO `zmt_area` VALUES ('1370','161','罗山县','3','0','');
INSERT INTO `zmt_area` VALUES ('1371','161','光山县','3','0','');
INSERT INTO `zmt_area` VALUES ('1372','161','新县','3','0','');
INSERT INTO `zmt_area` VALUES ('1373','161','商城县','3','0','');
INSERT INTO `zmt_area` VALUES ('1374','161','固始县','3','0','');
INSERT INTO `zmt_area` VALUES ('1375','161','潢川县','3','0','');
INSERT INTO `zmt_area` VALUES ('1376','161','淮滨县','3','0','');
INSERT INTO `zmt_area` VALUES ('1377','161','息县','3','0','');
INSERT INTO `zmt_area` VALUES ('1378','162','魏都区','3','0','');
INSERT INTO `zmt_area` VALUES ('1379','162','禹州市','3','0','');
INSERT INTO `zmt_area` VALUES ('1380','162','长葛市','3','0','');
INSERT INTO `zmt_area` VALUES ('1381','162','许昌县','3','0','');
INSERT INTO `zmt_area` VALUES ('1382','162','鄢陵县','3','0','');
INSERT INTO `zmt_area` VALUES ('1383','162','襄城县','3','0','');
INSERT INTO `zmt_area` VALUES ('1384','163','川汇区','3','0','');
INSERT INTO `zmt_area` VALUES ('1385','163','项城市','3','0','');
INSERT INTO `zmt_area` VALUES ('1386','163','扶沟县','3','0','');
INSERT INTO `zmt_area` VALUES ('1387','163','西华县','3','0','');
INSERT INTO `zmt_area` VALUES ('1388','163','商水县','3','0','');
INSERT INTO `zmt_area` VALUES ('1389','163','沈丘县','3','0','');
INSERT INTO `zmt_area` VALUES ('1390','163','郸城县','3','0','');
INSERT INTO `zmt_area` VALUES ('1391','163','淮阳县','3','0','');
INSERT INTO `zmt_area` VALUES ('1392','163','太康县','3','0','');
INSERT INTO `zmt_area` VALUES ('1393','163','鹿邑县','3','0','');
INSERT INTO `zmt_area` VALUES ('1394','164','驿城区','3','0','');
INSERT INTO `zmt_area` VALUES ('1395','164','西平县','3','0','');
INSERT INTO `zmt_area` VALUES ('1396','164','上蔡县','3','0','');
INSERT INTO `zmt_area` VALUES ('1397','164','平舆县','3','0','');
INSERT INTO `zmt_area` VALUES ('1398','164','正阳县','3','0','');
INSERT INTO `zmt_area` VALUES ('1399','164','确山县','3','0','');
INSERT INTO `zmt_area` VALUES ('1400','164','泌阳县','3','0','');
INSERT INTO `zmt_area` VALUES ('1401','164','汝南县','3','0','');
INSERT INTO `zmt_area` VALUES ('1402','164','遂平县','3','0','');
INSERT INTO `zmt_area` VALUES ('1403','164','新蔡县','3','0','');
INSERT INTO `zmt_area` VALUES ('1404','165','郾城区','3','0','');
INSERT INTO `zmt_area` VALUES ('1405','165','源汇区','3','0','');
INSERT INTO `zmt_area` VALUES ('1406','165','召陵区','3','0','');
INSERT INTO `zmt_area` VALUES ('1407','165','舞阳县','3','0','');
INSERT INTO `zmt_area` VALUES ('1408','165','临颍县','3','0','');
INSERT INTO `zmt_area` VALUES ('1409','166','华龙区','3','0','');
INSERT INTO `zmt_area` VALUES ('1410','166','清丰县','3','0','');
INSERT INTO `zmt_area` VALUES ('1411','166','南乐县','3','0','');
INSERT INTO `zmt_area` VALUES ('1412','166','范县','3','0','');
INSERT INTO `zmt_area` VALUES ('1413','166','台前县','3','0','');
INSERT INTO `zmt_area` VALUES ('1414','166','濮阳县','3','0','');
INSERT INTO `zmt_area` VALUES ('1415','167','道里区','3','0','');
INSERT INTO `zmt_area` VALUES ('1416','167','南岗区','3','0','');
INSERT INTO `zmt_area` VALUES ('1417','167','动力区','3','0','');
INSERT INTO `zmt_area` VALUES ('1418','167','平房区','3','0','');
INSERT INTO `zmt_area` VALUES ('1419','167','香坊区','3','0','');
INSERT INTO `zmt_area` VALUES ('1420','167','太平区','3','0','');
INSERT INTO `zmt_area` VALUES ('1421','167','道外区','3','0','');
INSERT INTO `zmt_area` VALUES ('1422','167','阿城区','3','0','');
INSERT INTO `zmt_area` VALUES ('1423','167','呼兰区','3','0','');
INSERT INTO `zmt_area` VALUES ('1424','167','松北区','3','0','');
INSERT INTO `zmt_area` VALUES ('1425','167','尚志市','3','0','');
INSERT INTO `zmt_area` VALUES ('1426','167','双城市','3','0','');
INSERT INTO `zmt_area` VALUES ('1427','167','五常市','3','0','');
INSERT INTO `zmt_area` VALUES ('1428','167','方正县','3','0','');
INSERT INTO `zmt_area` VALUES ('1429','167','宾县','3','0','');
INSERT INTO `zmt_area` VALUES ('1430','167','依兰县','3','0','');
INSERT INTO `zmt_area` VALUES ('1431','167','巴彦县','3','0','');
INSERT INTO `zmt_area` VALUES ('1432','167','通河县','3','0','');
INSERT INTO `zmt_area` VALUES ('1433','167','木兰县','3','0','');
INSERT INTO `zmt_area` VALUES ('1434','167','延寿县','3','0','');
INSERT INTO `zmt_area` VALUES ('1435','168','萨尔图区','3','0','');
INSERT INTO `zmt_area` VALUES ('1436','168','红岗区','3','0','');
INSERT INTO `zmt_area` VALUES ('1437','168','龙凤区','3','0','');
INSERT INTO `zmt_area` VALUES ('1438','168','让胡路区','3','0','');
INSERT INTO `zmt_area` VALUES ('1439','168','大同区','3','0','');
INSERT INTO `zmt_area` VALUES ('1440','168','肇州县','3','0','');
INSERT INTO `zmt_area` VALUES ('1441','168','肇源县','3','0','');
INSERT INTO `zmt_area` VALUES ('1442','168','林甸县','3','0','');
INSERT INTO `zmt_area` VALUES ('1443','168','杜尔伯特','3','0','');
INSERT INTO `zmt_area` VALUES ('1444','169','呼玛县','3','0','');
INSERT INTO `zmt_area` VALUES ('1445','169','漠河县','3','0','');
INSERT INTO `zmt_area` VALUES ('1446','169','塔河县','3','0','');
INSERT INTO `zmt_area` VALUES ('1447','170','兴山区','3','0','');
INSERT INTO `zmt_area` VALUES ('1448','170','工农区','3','0','');
INSERT INTO `zmt_area` VALUES ('1449','170','南山区','3','0','');
INSERT INTO `zmt_area` VALUES ('1450','170','兴安区','3','0','');
INSERT INTO `zmt_area` VALUES ('1451','170','向阳区','3','0','');
INSERT INTO `zmt_area` VALUES ('1452','170','东山区','3','0','');
INSERT INTO `zmt_area` VALUES ('1453','170','萝北县','3','0','');
INSERT INTO `zmt_area` VALUES ('1454','170','绥滨县','3','0','');
INSERT INTO `zmt_area` VALUES ('1455','171','爱辉区','3','0','');
INSERT INTO `zmt_area` VALUES ('1456','171','五大连池市','3','0','');
INSERT INTO `zmt_area` VALUES ('1457','171','北安市','3','0','');
INSERT INTO `zmt_area` VALUES ('1458','171','嫩江县','3','0','');
INSERT INTO `zmt_area` VALUES ('1459','171','逊克县','3','0','');
INSERT INTO `zmt_area` VALUES ('1460','171','孙吴县','3','0','');
INSERT INTO `zmt_area` VALUES ('1461','172','鸡冠区','3','0','');
INSERT INTO `zmt_area` VALUES ('1462','172','恒山区','3','0','');
INSERT INTO `zmt_area` VALUES ('1463','172','城子河区','3','0','');
INSERT INTO `zmt_area` VALUES ('1464','172','滴道区','3','0','');
INSERT INTO `zmt_area` VALUES ('1465','172','梨树区','3','0','');
INSERT INTO `zmt_area` VALUES ('1466','172','虎林市','3','0','');
INSERT INTO `zmt_area` VALUES ('1467','172','密山市','3','0','');
INSERT INTO `zmt_area` VALUES ('1468','172','鸡东县','3','0','');
INSERT INTO `zmt_area` VALUES ('1469','173','前进区','3','0','');
INSERT INTO `zmt_area` VALUES ('1470','173','郊区','3','0','');
INSERT INTO `zmt_area` VALUES ('1471','173','向阳区','3','0','');
INSERT INTO `zmt_area` VALUES ('1472','173','东风区','3','0','');
INSERT INTO `zmt_area` VALUES ('1473','173','同江市','3','0','');
INSERT INTO `zmt_area` VALUES ('1474','173','富锦市','3','0','');
INSERT INTO `zmt_area` VALUES ('1475','173','桦南县','3','0','');
INSERT INTO `zmt_area` VALUES ('1476','173','桦川县','3','0','');
INSERT INTO `zmt_area` VALUES ('1477','173','汤原县','3','0','');
INSERT INTO `zmt_area` VALUES ('1478','173','抚远县','3','0','');
INSERT INTO `zmt_area` VALUES ('1479','174','爱民区','3','0','');
INSERT INTO `zmt_area` VALUES ('1480','174','东安区','3','0','');
INSERT INTO `zmt_area` VALUES ('1481','174','阳明区','3','0','');
INSERT INTO `zmt_area` VALUES ('1482','174','西安区','3','0','');
INSERT INTO `zmt_area` VALUES ('1483','174','绥芬河市','3','0','');
INSERT INTO `zmt_area` VALUES ('1484','174','海林市','3','0','');
INSERT INTO `zmt_area` VALUES ('1485','174','宁安市','3','0','');
INSERT INTO `zmt_area` VALUES ('1486','174','穆棱市','3','0','');
INSERT INTO `zmt_area` VALUES ('1487','174','东宁县','3','0','');
INSERT INTO `zmt_area` VALUES ('1488','174','林口县','3','0','');
INSERT INTO `zmt_area` VALUES ('1489','175','桃山区','3','0','');
INSERT INTO `zmt_area` VALUES ('1490','175','新兴区','3','0','');
INSERT INTO `zmt_area` VALUES ('1491','175','茄子河区','3','0','');
INSERT INTO `zmt_area` VALUES ('1492','175','勃利县','3','0','');
INSERT INTO `zmt_area` VALUES ('1493','176','龙沙区','3','0','');
INSERT INTO `zmt_area` VALUES ('1494','176','昂昂溪区','3','0','');
INSERT INTO `zmt_area` VALUES ('1495','176','铁峰区','3','0','');
INSERT INTO `zmt_area` VALUES ('1496','176','建华区','3','0','');
INSERT INTO `zmt_area` VALUES ('1497','176','富拉尔基区','3','0','');
INSERT INTO `zmt_area` VALUES ('1498','176','碾子山区','3','0','');
INSERT INTO `zmt_area` VALUES ('1499','176','梅里斯达斡尔区','3','0','');
INSERT INTO `zmt_area` VALUES ('1500','176','讷河市','3','0','');
INSERT INTO `zmt_area` VALUES ('1501','176','龙江县','3','0','');
INSERT INTO `zmt_area` VALUES ('1502','176','依安县','3','0','');
INSERT INTO `zmt_area` VALUES ('1503','176','泰来县','3','0','');
INSERT INTO `zmt_area` VALUES ('1504','176','甘南县','3','0','');
INSERT INTO `zmt_area` VALUES ('1505','176','富裕县','3','0','');
INSERT INTO `zmt_area` VALUES ('1506','176','克山县','3','0','');
INSERT INTO `zmt_area` VALUES ('1507','176','克东县','3','0','');
INSERT INTO `zmt_area` VALUES ('1508','176','拜泉县','3','0','');
INSERT INTO `zmt_area` VALUES ('1509','177','尖山区','3','0','');
INSERT INTO `zmt_area` VALUES ('1510','177','岭东区','3','0','');
INSERT INTO `zmt_area` VALUES ('1511','177','四方台区','3','0','');
INSERT INTO `zmt_area` VALUES ('1512','177','宝山区','3','0','');
INSERT INTO `zmt_area` VALUES ('1513','177','集贤县','3','0','');
INSERT INTO `zmt_area` VALUES ('1514','177','友谊县','3','0','');
INSERT INTO `zmt_area` VALUES ('1515','177','宝清县','3','0','');
INSERT INTO `zmt_area` VALUES ('1516','177','饶河县','3','0','');
INSERT INTO `zmt_area` VALUES ('1517','178','北林区','3','0','');
INSERT INTO `zmt_area` VALUES ('1518','178','安达市','3','0','');
INSERT INTO `zmt_area` VALUES ('1519','178','肇东市','3','0','');
INSERT INTO `zmt_area` VALUES ('1520','178','海伦市','3','0','');
INSERT INTO `zmt_area` VALUES ('1521','178','望奎县','3','0','');
INSERT INTO `zmt_area` VALUES ('1522','178','兰西县','3','0','');
INSERT INTO `zmt_area` VALUES ('1523','178','青冈县','3','0','');
INSERT INTO `zmt_area` VALUES ('1524','178','庆安县','3','0','');
INSERT INTO `zmt_area` VALUES ('1525','178','明水县','3','0','');
INSERT INTO `zmt_area` VALUES ('1526','178','绥棱县','3','0','');
INSERT INTO `zmt_area` VALUES ('1527','179','伊春区','3','0','');
INSERT INTO `zmt_area` VALUES ('1528','179','带岭区','3','0','');
INSERT INTO `zmt_area` VALUES ('1529','179','南岔区','3','0','');
INSERT INTO `zmt_area` VALUES ('1530','179','金山屯区','3','0','');
INSERT INTO `zmt_area` VALUES ('1531','179','西林区','3','0','');
INSERT INTO `zmt_area` VALUES ('1532','179','美溪区','3','0','');
INSERT INTO `zmt_area` VALUES ('1533','179','乌马河区','3','0','');
INSERT INTO `zmt_area` VALUES ('1534','179','翠峦区','3','0','');
INSERT INTO `zmt_area` VALUES ('1535','179','友好区','3','0','');
INSERT INTO `zmt_area` VALUES ('1536','179','上甘岭区','3','0','');
INSERT INTO `zmt_area` VALUES ('1537','179','五营区','3','0','');
INSERT INTO `zmt_area` VALUES ('1538','179','红星区','3','0','');
INSERT INTO `zmt_area` VALUES ('1539','179','新青区','3','0','');
INSERT INTO `zmt_area` VALUES ('1540','179','汤旺河区','3','0','');
INSERT INTO `zmt_area` VALUES ('1541','179','乌伊岭区','3','0','');
INSERT INTO `zmt_area` VALUES ('1542','179','铁力市','3','0','');
INSERT INTO `zmt_area` VALUES ('1543','179','嘉荫县','3','0','');
INSERT INTO `zmt_area` VALUES ('1544','180','江岸区','3','0','');
INSERT INTO `zmt_area` VALUES ('1545','180','武昌区','3','0','');
INSERT INTO `zmt_area` VALUES ('1546','180','江汉区','3','0','');
INSERT INTO `zmt_area` VALUES ('1547','180','硚口区','3','0','');
INSERT INTO `zmt_area` VALUES ('1548','180','汉阳区','3','0','');
INSERT INTO `zmt_area` VALUES ('1549','180','青山区','3','0','');
INSERT INTO `zmt_area` VALUES ('1550','180','洪山区','3','0','');
INSERT INTO `zmt_area` VALUES ('1551','180','东西湖区','3','0','');
INSERT INTO `zmt_area` VALUES ('1552','180','汉南区','3','0','');
INSERT INTO `zmt_area` VALUES ('1553','180','蔡甸区','3','0','');
INSERT INTO `zmt_area` VALUES ('1554','180','江夏区','3','0','');
INSERT INTO `zmt_area` VALUES ('1555','180','黄陂区','3','0','');
INSERT INTO `zmt_area` VALUES ('1556','180','新洲区','3','0','');
INSERT INTO `zmt_area` VALUES ('1557','180','经济开发区','3','0','');
INSERT INTO `zmt_area` VALUES ('1558','181','仙桃市','3','0','');
INSERT INTO `zmt_area` VALUES ('1559','182','鄂城区','3','0','');
INSERT INTO `zmt_area` VALUES ('1560','182','华容区','3','0','');
INSERT INTO `zmt_area` VALUES ('1561','182','梁子湖区','3','0','');
INSERT INTO `zmt_area` VALUES ('1562','183','黄州区','3','0','');
INSERT INTO `zmt_area` VALUES ('1563','183','麻城市','3','0','');
INSERT INTO `zmt_area` VALUES ('1564','183','武穴市','3','0','');
INSERT INTO `zmt_area` VALUES ('1565','183','团风县','3','0','');
INSERT INTO `zmt_area` VALUES ('1566','183','红安县','3','0','');
INSERT INTO `zmt_area` VALUES ('1567','183','罗田县','3','0','');
INSERT INTO `zmt_area` VALUES ('1568','183','英山县','3','0','');
INSERT INTO `zmt_area` VALUES ('1569','183','浠水县','3','0','');
INSERT INTO `zmt_area` VALUES ('1570','183','蕲春县','3','0','');
INSERT INTO `zmt_area` VALUES ('1571','183','黄梅县','3','0','');
INSERT INTO `zmt_area` VALUES ('1572','184','黄石港区','3','0','');
INSERT INTO `zmt_area` VALUES ('1573','184','西塞山区','3','0','');
INSERT INTO `zmt_area` VALUES ('1574','184','下陆区','3','0','');
INSERT INTO `zmt_area` VALUES ('1575','184','铁山区','3','0','');
INSERT INTO `zmt_area` VALUES ('1576','184','大冶市','3','0','');
INSERT INTO `zmt_area` VALUES ('1577','184','阳新县','3','0','');
INSERT INTO `zmt_area` VALUES ('1578','185','东宝区','3','0','');
INSERT INTO `zmt_area` VALUES ('1579','185','掇刀区','3','0','');
INSERT INTO `zmt_area` VALUES ('1580','185','钟祥市','3','0','');
INSERT INTO `zmt_area` VALUES ('1581','185','京山县','3','0','');
INSERT INTO `zmt_area` VALUES ('1582','185','沙洋县','3','0','');
INSERT INTO `zmt_area` VALUES ('1583','186','沙市区','3','0','');
INSERT INTO `zmt_area` VALUES ('1584','186','荆州区','3','0','');
INSERT INTO `zmt_area` VALUES ('1585','186','石首市','3','0','');
INSERT INTO `zmt_area` VALUES ('1586','186','洪湖市','3','0','');
INSERT INTO `zmt_area` VALUES ('1587','186','松滋市','3','0','');
INSERT INTO `zmt_area` VALUES ('1588','186','公安县','3','0','');
INSERT INTO `zmt_area` VALUES ('1589','186','监利县','3','0','');
INSERT INTO `zmt_area` VALUES ('1590','186','江陵县','3','0','');
INSERT INTO `zmt_area` VALUES ('1591','187','潜江市','3','0','');
INSERT INTO `zmt_area` VALUES ('1592','188','神农架林区','3','0','');
INSERT INTO `zmt_area` VALUES ('1593','189','张湾区','3','0','');
INSERT INTO `zmt_area` VALUES ('1594','189','茅箭区','3','0','');
INSERT INTO `zmt_area` VALUES ('1595','189','丹江口市','3','0','');
INSERT INTO `zmt_area` VALUES ('1596','189','郧县','3','0','');
INSERT INTO `zmt_area` VALUES ('1597','189','郧西县','3','0','');
INSERT INTO `zmt_area` VALUES ('1598','189','竹山县','3','0','');
INSERT INTO `zmt_area` VALUES ('1599','189','竹溪县','3','0','');
INSERT INTO `zmt_area` VALUES ('1600','189','房县','3','0','');
INSERT INTO `zmt_area` VALUES ('1601','190','曾都区','3','0','');
INSERT INTO `zmt_area` VALUES ('1602','190','广水市','3','0','');
INSERT INTO `zmt_area` VALUES ('1603','191','天门市','3','0','');
INSERT INTO `zmt_area` VALUES ('1604','192','咸安区','3','0','');
INSERT INTO `zmt_area` VALUES ('1605','192','赤壁市','3','0','');
INSERT INTO `zmt_area` VALUES ('1606','192','嘉鱼县','3','0','');
INSERT INTO `zmt_area` VALUES ('1607','192','通城县','3','0','');
INSERT INTO `zmt_area` VALUES ('1608','192','崇阳县','3','0','');
INSERT INTO `zmt_area` VALUES ('1609','192','通山县','3','0','');
INSERT INTO `zmt_area` VALUES ('1610','193','襄城区','3','0','');
INSERT INTO `zmt_area` VALUES ('1611','193','樊城区','3','0','');
INSERT INTO `zmt_area` VALUES ('1612','193','襄阳区','3','0','');
INSERT INTO `zmt_area` VALUES ('1613','193','老河口市','3','0','');
INSERT INTO `zmt_area` VALUES ('1614','193','枣阳市','3','0','');
INSERT INTO `zmt_area` VALUES ('1615','193','宜城市','3','0','');
INSERT INTO `zmt_area` VALUES ('1616','193','南漳县','3','0','');
INSERT INTO `zmt_area` VALUES ('1617','193','谷城县','3','0','');
INSERT INTO `zmt_area` VALUES ('1618','193','保康县','3','0','');
INSERT INTO `zmt_area` VALUES ('1619','194','孝南区','3','0','');
INSERT INTO `zmt_area` VALUES ('1620','194','应城市','3','0','');
INSERT INTO `zmt_area` VALUES ('1621','194','安陆市','3','0','');
INSERT INTO `zmt_area` VALUES ('1622','194','汉川市','3','0','');
INSERT INTO `zmt_area` VALUES ('1623','194','孝昌县','3','0','');
INSERT INTO `zmt_area` VALUES ('1624','194','大悟县','3','0','');
INSERT INTO `zmt_area` VALUES ('1625','194','云梦县','3','0','');
INSERT INTO `zmt_area` VALUES ('1626','195','长阳','3','0','');
INSERT INTO `zmt_area` VALUES ('1627','195','五峰','3','0','');
INSERT INTO `zmt_area` VALUES ('1628','195','西陵区','3','0','');
INSERT INTO `zmt_area` VALUES ('1629','195','伍家岗区','3','0','');
INSERT INTO `zmt_area` VALUES ('1630','195','点军区','3','0','');
INSERT INTO `zmt_area` VALUES ('1631','195','猇亭区','3','0','');
INSERT INTO `zmt_area` VALUES ('1632','195','夷陵区','3','0','');
INSERT INTO `zmt_area` VALUES ('1633','195','宜都市','3','0','');
INSERT INTO `zmt_area` VALUES ('1634','195','当阳市','3','0','');
INSERT INTO `zmt_area` VALUES ('1635','195','枝江市','3','0','');
INSERT INTO `zmt_area` VALUES ('1636','195','远安县','3','0','');
INSERT INTO `zmt_area` VALUES ('1637','195','兴山县','3','0','');
INSERT INTO `zmt_area` VALUES ('1638','195','秭归县','3','0','');
INSERT INTO `zmt_area` VALUES ('1639','196','恩施市','3','0','');
INSERT INTO `zmt_area` VALUES ('1640','196','利川市','3','0','');
INSERT INTO `zmt_area` VALUES ('1641','196','建始县','3','0','');
INSERT INTO `zmt_area` VALUES ('1642','196','巴东县','3','0','');
INSERT INTO `zmt_area` VALUES ('1643','196','宣恩县','3','0','');
INSERT INTO `zmt_area` VALUES ('1644','196','咸丰县','3','0','');
INSERT INTO `zmt_area` VALUES ('1645','196','来凤县','3','0','');
INSERT INTO `zmt_area` VALUES ('1646','196','鹤峰县','3','0','');
INSERT INTO `zmt_area` VALUES ('1647','197','岳麓区','3','0','');
INSERT INTO `zmt_area` VALUES ('1648','197','芙蓉区','3','0','');
INSERT INTO `zmt_area` VALUES ('1649','197','天心区','3','0','');
INSERT INTO `zmt_area` VALUES ('1650','197','开福区','3','0','');
INSERT INTO `zmt_area` VALUES ('1651','197','雨花区','3','0','');
INSERT INTO `zmt_area` VALUES ('1652','197','开发区','3','0','');
INSERT INTO `zmt_area` VALUES ('1653','197','浏阳市','3','0','');
INSERT INTO `zmt_area` VALUES ('1654','197','长沙县','3','0','');
INSERT INTO `zmt_area` VALUES ('1655','197','望城县','3','0','');
INSERT INTO `zmt_area` VALUES ('1656','197','宁乡县','3','0','');
INSERT INTO `zmt_area` VALUES ('1657','198','永定区','3','0','');
INSERT INTO `zmt_area` VALUES ('1658','198','武陵源区','3','0','');
INSERT INTO `zmt_area` VALUES ('1659','198','慈利县','3','0','');
INSERT INTO `zmt_area` VALUES ('1660','198','桑植县','3','0','');
INSERT INTO `zmt_area` VALUES ('1661','199','武陵区','3','0','');
INSERT INTO `zmt_area` VALUES ('1662','199','鼎城区','3','0','');
INSERT INTO `zmt_area` VALUES ('1663','199','津市市','3','0','');
INSERT INTO `zmt_area` VALUES ('1664','199','安乡县','3','0','');
INSERT INTO `zmt_area` VALUES ('1665','199','汉寿县','3','0','');
INSERT INTO `zmt_area` VALUES ('1666','199','澧县','3','0','');
INSERT INTO `zmt_area` VALUES ('1667','199','临澧县','3','0','');
INSERT INTO `zmt_area` VALUES ('1668','199','桃源县','3','0','');
INSERT INTO `zmt_area` VALUES ('1669','199','石门县','3','0','');
INSERT INTO `zmt_area` VALUES ('1670','200','北湖区','3','0','');
INSERT INTO `zmt_area` VALUES ('1671','200','苏仙区','3','0','');
INSERT INTO `zmt_area` VALUES ('1672','200','资兴市','3','0','');
INSERT INTO `zmt_area` VALUES ('1673','200','桂阳县','3','0','');
INSERT INTO `zmt_area` VALUES ('1674','200','宜章县','3','0','');
INSERT INTO `zmt_area` VALUES ('1675','200','永兴县','3','0','');
INSERT INTO `zmt_area` VALUES ('1676','200','嘉禾县','3','0','');
INSERT INTO `zmt_area` VALUES ('1677','200','临武县','3','0','');
INSERT INTO `zmt_area` VALUES ('1678','200','汝城县','3','0','');
INSERT INTO `zmt_area` VALUES ('1679','200','桂东县','3','0','');
INSERT INTO `zmt_area` VALUES ('1680','200','安仁县','3','0','');
INSERT INTO `zmt_area` VALUES ('1681','201','雁峰区','3','0','');
INSERT INTO `zmt_area` VALUES ('1682','201','珠晖区','3','0','');
INSERT INTO `zmt_area` VALUES ('1683','201','石鼓区','3','0','');
INSERT INTO `zmt_area` VALUES ('1684','201','蒸湘区','3','0','');
INSERT INTO `zmt_area` VALUES ('1685','201','南岳区','3','0','');
INSERT INTO `zmt_area` VALUES ('1686','201','耒阳市','3','0','');
INSERT INTO `zmt_area` VALUES ('1687','201','常宁市','3','0','');
INSERT INTO `zmt_area` VALUES ('1688','201','衡阳县','3','0','');
INSERT INTO `zmt_area` VALUES ('1689','201','衡南县','3','0','');
INSERT INTO `zmt_area` VALUES ('1690','201','衡山县','3','0','');
INSERT INTO `zmt_area` VALUES ('1691','201','衡东县','3','0','');
INSERT INTO `zmt_area` VALUES ('1692','201','祁东县','3','0','');
INSERT INTO `zmt_area` VALUES ('1693','202','鹤城区','3','0','');
INSERT INTO `zmt_area` VALUES ('1694','202','靖州','3','0','');
INSERT INTO `zmt_area` VALUES ('1695','202','麻阳','3','0','');
INSERT INTO `zmt_area` VALUES ('1696','202','通道','3','0','');
INSERT INTO `zmt_area` VALUES ('1697','202','新晃','3','0','');
INSERT INTO `zmt_area` VALUES ('1698','202','芷江','3','0','');
INSERT INTO `zmt_area` VALUES ('1699','202','沅陵县','3','0','');
INSERT INTO `zmt_area` VALUES ('1700','202','辰溪县','3','0','');
INSERT INTO `zmt_area` VALUES ('1701','202','溆浦县','3','0','');
INSERT INTO `zmt_area` VALUES ('1702','202','中方县','3','0','');
INSERT INTO `zmt_area` VALUES ('1703','202','会同县','3','0','');
INSERT INTO `zmt_area` VALUES ('1704','202','洪江市','3','0','');
INSERT INTO `zmt_area` VALUES ('1705','203','娄星区','3','0','');
INSERT INTO `zmt_area` VALUES ('1706','203','冷水江市','3','0','');
INSERT INTO `zmt_area` VALUES ('1707','203','涟源市','3','0','');
INSERT INTO `zmt_area` VALUES ('1708','203','双峰县','3','0','');
INSERT INTO `zmt_area` VALUES ('1709','203','新化县','3','0','');
INSERT INTO `zmt_area` VALUES ('1710','204','城步','3','0','');
INSERT INTO `zmt_area` VALUES ('1711','204','双清区','3','0','');
INSERT INTO `zmt_area` VALUES ('1712','204','大祥区','3','0','');
INSERT INTO `zmt_area` VALUES ('1713','204','北塔区','3','0','');
INSERT INTO `zmt_area` VALUES ('1714','204','武冈市','3','0','');
INSERT INTO `zmt_area` VALUES ('1715','204','邵东县','3','0','');
INSERT INTO `zmt_area` VALUES ('1716','204','新邵县','3','0','');
INSERT INTO `zmt_area` VALUES ('1717','204','邵阳县','3','0','');
INSERT INTO `zmt_area` VALUES ('1718','204','隆回县','3','0','');
INSERT INTO `zmt_area` VALUES ('1719','204','洞口县','3','0','');
INSERT INTO `zmt_area` VALUES ('1720','204','绥宁县','3','0','');
INSERT INTO `zmt_area` VALUES ('1721','204','新宁县','3','0','');
INSERT INTO `zmt_area` VALUES ('1722','205','岳塘区','3','0','');
INSERT INTO `zmt_area` VALUES ('1723','205','雨湖区','3','0','');
INSERT INTO `zmt_area` VALUES ('1724','205','湘乡市','3','0','');
INSERT INTO `zmt_area` VALUES ('1725','205','韶山市','3','0','');
INSERT INTO `zmt_area` VALUES ('1726','205','湘潭县','3','0','');
INSERT INTO `zmt_area` VALUES ('1727','206','吉首市','3','0','');
INSERT INTO `zmt_area` VALUES ('1728','206','泸溪县','3','0','');
INSERT INTO `zmt_area` VALUES ('1729','206','凤凰县','3','0','');
INSERT INTO `zmt_area` VALUES ('1730','206','花垣县','3','0','');
INSERT INTO `zmt_area` VALUES ('1731','206','保靖县','3','0','');
INSERT INTO `zmt_area` VALUES ('1732','206','古丈县','3','0','');
INSERT INTO `zmt_area` VALUES ('1733','206','永顺县','3','0','');
INSERT INTO `zmt_area` VALUES ('1734','206','龙山县','3','0','');
INSERT INTO `zmt_area` VALUES ('1735','207','赫山区','3','0','');
INSERT INTO `zmt_area` VALUES ('1736','207','资阳区','3','0','');
INSERT INTO `zmt_area` VALUES ('1737','207','沅江市','3','0','');
INSERT INTO `zmt_area` VALUES ('1738','207','南县','3','0','');
INSERT INTO `zmt_area` VALUES ('1739','207','桃江县','3','0','');
INSERT INTO `zmt_area` VALUES ('1740','207','安化县','3','0','');
INSERT INTO `zmt_area` VALUES ('1741','208','江华','3','0','');
INSERT INTO `zmt_area` VALUES ('1742','208','冷水滩区','3','0','');
INSERT INTO `zmt_area` VALUES ('1743','208','零陵区','3','0','');
INSERT INTO `zmt_area` VALUES ('1744','208','祁阳县','3','0','');
INSERT INTO `zmt_area` VALUES ('1745','208','东安县','3','0','');
INSERT INTO `zmt_area` VALUES ('1746','208','双牌县','3','0','');
INSERT INTO `zmt_area` VALUES ('1747','208','道县','3','0','');
INSERT INTO `zmt_area` VALUES ('1748','208','江永县','3','0','');
INSERT INTO `zmt_area` VALUES ('1749','208','宁远县','3','0','');
INSERT INTO `zmt_area` VALUES ('1750','208','蓝山县','3','0','');
INSERT INTO `zmt_area` VALUES ('1751','208','新田县','3','0','');
INSERT INTO `zmt_area` VALUES ('1752','209','岳阳楼区','3','0','');
INSERT INTO `zmt_area` VALUES ('1753','209','君山区','3','0','');
INSERT INTO `zmt_area` VALUES ('1754','209','云溪区','3','0','');
INSERT INTO `zmt_area` VALUES ('1755','209','汨罗市','3','0','');
INSERT INTO `zmt_area` VALUES ('1756','209','临湘市','3','0','');
INSERT INTO `zmt_area` VALUES ('1757','209','岳阳县','3','0','');
INSERT INTO `zmt_area` VALUES ('1758','209','华容县','3','0','');
INSERT INTO `zmt_area` VALUES ('1759','209','湘阴县','3','0','');
INSERT INTO `zmt_area` VALUES ('1760','209','平江县','3','0','');
INSERT INTO `zmt_area` VALUES ('1761','210','天元区','3','0','');
INSERT INTO `zmt_area` VALUES ('1762','210','荷塘区','3','0','');
INSERT INTO `zmt_area` VALUES ('1763','210','芦淞区','3','0','');
INSERT INTO `zmt_area` VALUES ('1764','210','石峰区','3','0','');
INSERT INTO `zmt_area` VALUES ('1765','210','醴陵市','3','0','');
INSERT INTO `zmt_area` VALUES ('1766','210','株洲县','3','0','');
INSERT INTO `zmt_area` VALUES ('1767','210','攸县','3','0','');
INSERT INTO `zmt_area` VALUES ('1768','210','茶陵县','3','0','');
INSERT INTO `zmt_area` VALUES ('1769','210','炎陵县','3','0','');
INSERT INTO `zmt_area` VALUES ('1770','211','朝阳区','3','0','');
INSERT INTO `zmt_area` VALUES ('1771','211','宽城区','3','0','');
INSERT INTO `zmt_area` VALUES ('1772','211','二道区','3','0','');
INSERT INTO `zmt_area` VALUES ('1773','211','南关区','3','0','');
INSERT INTO `zmt_area` VALUES ('1774','211','绿园区','3','0','');
INSERT INTO `zmt_area` VALUES ('1775','211','双阳区','3','0','');
INSERT INTO `zmt_area` VALUES ('1776','211','净月潭开发区','3','0','');
INSERT INTO `zmt_area` VALUES ('1777','211','高新技术开发区','3','0','');
INSERT INTO `zmt_area` VALUES ('1778','211','经济技术开发区','3','0','');
INSERT INTO `zmt_area` VALUES ('1779','211','汽车产业开发区','3','0','');
INSERT INTO `zmt_area` VALUES ('1780','211','德惠市','3','0','');
INSERT INTO `zmt_area` VALUES ('1781','211','九台市','3','0','');
INSERT INTO `zmt_area` VALUES ('1782','211','榆树市','3','0','');
INSERT INTO `zmt_area` VALUES ('1783','211','农安县','3','0','');
INSERT INTO `zmt_area` VALUES ('1784','212','船营区','3','0','');
INSERT INTO `zmt_area` VALUES ('1785','212','昌邑区','3','0','');
INSERT INTO `zmt_area` VALUES ('1786','212','龙潭区','3','0','');
INSERT INTO `zmt_area` VALUES ('1787','212','丰满区','3','0','');
INSERT INTO `zmt_area` VALUES ('1788','212','蛟河市','3','0','');
INSERT INTO `zmt_area` VALUES ('1789','212','桦甸市','3','0','');
INSERT INTO `zmt_area` VALUES ('1790','212','舒兰市','3','0','');
INSERT INTO `zmt_area` VALUES ('1791','212','磐石市','3','0','');
INSERT INTO `zmt_area` VALUES ('1792','212','永吉县','3','0','');
INSERT INTO `zmt_area` VALUES ('1793','213','洮北区','3','0','');
INSERT INTO `zmt_area` VALUES ('1794','213','洮南市','3','0','');
INSERT INTO `zmt_area` VALUES ('1795','213','大安市','3','0','');
INSERT INTO `zmt_area` VALUES ('1796','213','镇赉县','3','0','');
INSERT INTO `zmt_area` VALUES ('1797','213','通榆县','3','0','');
INSERT INTO `zmt_area` VALUES ('1798','214','江源区','3','0','');
INSERT INTO `zmt_area` VALUES ('1799','214','八道江区','3','0','');
INSERT INTO `zmt_area` VALUES ('1800','214','长白','3','0','');
INSERT INTO `zmt_area` VALUES ('1801','214','临江市','3','0','');
INSERT INTO `zmt_area` VALUES ('1802','214','抚松县','3','0','');
INSERT INTO `zmt_area` VALUES ('1803','214','靖宇县','3','0','');
INSERT INTO `zmt_area` VALUES ('1804','215','龙山区','3','0','');
INSERT INTO `zmt_area` VALUES ('1805','215','西安区','3','0','');
INSERT INTO `zmt_area` VALUES ('1806','215','东丰县','3','0','');
INSERT INTO `zmt_area` VALUES ('1807','215','东辽县','3','0','');
INSERT INTO `zmt_area` VALUES ('1808','216','铁西区','3','0','');
INSERT INTO `zmt_area` VALUES ('1809','216','铁东区','3','0','');
INSERT INTO `zmt_area` VALUES ('1810','216','伊通','3','0','');
INSERT INTO `zmt_area` VALUES ('1811','216','公主岭市','3','0','');
INSERT INTO `zmt_area` VALUES ('1812','216','双辽市','3','0','');
INSERT INTO `zmt_area` VALUES ('1813','216','梨树县','3','0','');
INSERT INTO `zmt_area` VALUES ('1814','217','前郭尔罗斯','3','0','');
INSERT INTO `zmt_area` VALUES ('1815','217','宁江区','3','0','');
INSERT INTO `zmt_area` VALUES ('1816','217','长岭县','3','0','');
INSERT INTO `zmt_area` VALUES ('1817','217','乾安县','3','0','');
INSERT INTO `zmt_area` VALUES ('1818','217','扶余县','3','0','');
INSERT INTO `zmt_area` VALUES ('1819','218','东昌区','3','0','');
INSERT INTO `zmt_area` VALUES ('1820','218','二道江区','3','0','');
INSERT INTO `zmt_area` VALUES ('1821','218','梅河口市','3','0','');
INSERT INTO `zmt_area` VALUES ('1822','218','集安市','3','0','');
INSERT INTO `zmt_area` VALUES ('1823','218','通化县','3','0','');
INSERT INTO `zmt_area` VALUES ('1824','218','辉南县','3','0','');
INSERT INTO `zmt_area` VALUES ('1825','218','柳河县','3','0','');
INSERT INTO `zmt_area` VALUES ('1826','219','延吉市','3','0','');
INSERT INTO `zmt_area` VALUES ('1827','219','图们市','3','0','');
INSERT INTO `zmt_area` VALUES ('1828','219','敦化市','3','0','');
INSERT INTO `zmt_area` VALUES ('1829','219','珲春市','3','0','');
INSERT INTO `zmt_area` VALUES ('1830','219','龙井市','3','0','');
INSERT INTO `zmt_area` VALUES ('1831','219','和龙市','3','0','');
INSERT INTO `zmt_area` VALUES ('1832','219','安图县','3','0','');
INSERT INTO `zmt_area` VALUES ('1833','219','汪清县','3','0','');
INSERT INTO `zmt_area` VALUES ('1834','220','玄武区','3','0','');
INSERT INTO `zmt_area` VALUES ('1835','220','鼓楼区','3','0','');
INSERT INTO `zmt_area` VALUES ('1836','220','白下区','3','0','');
INSERT INTO `zmt_area` VALUES ('1837','220','建邺区','3','0','');
INSERT INTO `zmt_area` VALUES ('1838','220','秦淮区','3','0','');
INSERT INTO `zmt_area` VALUES ('1839','220','雨花台区','3','0','');
INSERT INTO `zmt_area` VALUES ('1840','220','下关区','3','0','');
INSERT INTO `zmt_area` VALUES ('1841','220','栖霞区','3','0','');
INSERT INTO `zmt_area` VALUES ('1842','220','浦口区','3','0','');
INSERT INTO `zmt_area` VALUES ('1843','220','江宁区','3','0','');
INSERT INTO `zmt_area` VALUES ('1844','220','六合区','3','0','');
INSERT INTO `zmt_area` VALUES ('1845','220','溧水县','3','0','');
INSERT INTO `zmt_area` VALUES ('1846','220','高淳县','3','0','');
INSERT INTO `zmt_area` VALUES ('1847','221','沧浪区','3','0','');
INSERT INTO `zmt_area` VALUES ('1848','221','金阊区','3','0','');
INSERT INTO `zmt_area` VALUES ('1849','221','平江区','3','0','');
INSERT INTO `zmt_area` VALUES ('1850','221','虎丘区','3','0','');
INSERT INTO `zmt_area` VALUES ('1851','221','吴中区','3','0','');
INSERT INTO `zmt_area` VALUES ('1852','221','相城区','3','0','');
INSERT INTO `zmt_area` VALUES ('1853','221','园区','3','0','');
INSERT INTO `zmt_area` VALUES ('1854','221','新区','3','0','');
INSERT INTO `zmt_area` VALUES ('1855','221','常熟市','3','0','');
INSERT INTO `zmt_area` VALUES ('1856','221','张家港市','3','0','');
INSERT INTO `zmt_area` VALUES ('1857','221','玉山镇','3','0','');
INSERT INTO `zmt_area` VALUES ('1858','221','巴城镇','3','0','');
INSERT INTO `zmt_area` VALUES ('1859','221','周市镇','3','0','');
INSERT INTO `zmt_area` VALUES ('1860','221','陆家镇','3','0','');
INSERT INTO `zmt_area` VALUES ('1861','221','花桥镇','3','0','');
INSERT INTO `zmt_area` VALUES ('1862','221','淀山湖镇','3','0','');
INSERT INTO `zmt_area` VALUES ('1863','221','张浦镇','3','0','');
INSERT INTO `zmt_area` VALUES ('1864','221','周庄镇','3','0','');
INSERT INTO `zmt_area` VALUES ('1865','221','千灯镇','3','0','');
INSERT INTO `zmt_area` VALUES ('1866','221','锦溪镇','3','0','');
INSERT INTO `zmt_area` VALUES ('1867','221','开发区','3','0','');
INSERT INTO `zmt_area` VALUES ('1868','221','吴江市','3','0','');
INSERT INTO `zmt_area` VALUES ('1869','221','太仓市','3','0','');
INSERT INTO `zmt_area` VALUES ('1870','222','崇安区','3','0','');
INSERT INTO `zmt_area` VALUES ('1871','222','北塘区','3','0','');
INSERT INTO `zmt_area` VALUES ('1872','222','南长区','3','0','');
INSERT INTO `zmt_area` VALUES ('1873','222','锡山区','3','0','');
INSERT INTO `zmt_area` VALUES ('1874','222','惠山区','3','0','');
INSERT INTO `zmt_area` VALUES ('1875','222','滨湖区','3','0','');
INSERT INTO `zmt_area` VALUES ('1876','222','新区','3','0','');
INSERT INTO `zmt_area` VALUES ('1877','222','江阴市','3','0','');
INSERT INTO `zmt_area` VALUES ('1878','222','宜兴市','3','0','');
INSERT INTO `zmt_area` VALUES ('1879','223','天宁区','3','0','');
INSERT INTO `zmt_area` VALUES ('1880','223','钟楼区','3','0','');
INSERT INTO `zmt_area` VALUES ('1881','223','戚墅堰区','3','0','');
INSERT INTO `zmt_area` VALUES ('1882','223','郊区','3','0','');
INSERT INTO `zmt_area` VALUES ('1883','223','新北区','3','0','');
INSERT INTO `zmt_area` VALUES ('1884','223','武进区','3','0','');
INSERT INTO `zmt_area` VALUES ('1885','223','溧阳市','3','0','');
INSERT INTO `zmt_area` VALUES ('1886','223','金坛市','3','0','');
INSERT INTO `zmt_area` VALUES ('1887','224','清河区','3','0','');
INSERT INTO `zmt_area` VALUES ('1888','224','清浦区','3','0','');
INSERT INTO `zmt_area` VALUES ('1889','224','楚州区','3','0','');
INSERT INTO `zmt_area` VALUES ('1890','224','淮阴区','3','0','');
INSERT INTO `zmt_area` VALUES ('1891','224','涟水县','3','0','');
INSERT INTO `zmt_area` VALUES ('1892','224','洪泽县','3','0','');
INSERT INTO `zmt_area` VALUES ('1893','224','盱眙县','3','0','');
INSERT INTO `zmt_area` VALUES ('1894','224','金湖县','3','0','');
INSERT INTO `zmt_area` VALUES ('1895','225','新浦区','3','0','');
INSERT INTO `zmt_area` VALUES ('1896','225','连云区','3','0','');
INSERT INTO `zmt_area` VALUES ('1897','225','海州区','3','0','');
INSERT INTO `zmt_area` VALUES ('1898','225','赣榆县','3','0','');
INSERT INTO `zmt_area` VALUES ('1899','225','东海县','3','0','');
INSERT INTO `zmt_area` VALUES ('1900','225','灌云县','3','0','');
INSERT INTO `zmt_area` VALUES ('1901','225','灌南县','3','0','');
INSERT INTO `zmt_area` VALUES ('1902','226','崇川区','3','0','');
INSERT INTO `zmt_area` VALUES ('1903','226','港闸区','3','0','');
INSERT INTO `zmt_area` VALUES ('1904','226','经济开发区','3','0','');
INSERT INTO `zmt_area` VALUES ('1905','226','启东市','3','0','');
INSERT INTO `zmt_area` VALUES ('1906','226','如皋市','3','0','');
INSERT INTO `zmt_area` VALUES ('1907','226','通州市','3','0','');
INSERT INTO `zmt_area` VALUES ('1908','226','海门市','3','0','');
INSERT INTO `zmt_area` VALUES ('1909','226','海安县','3','0','');
INSERT INTO `zmt_area` VALUES ('1910','226','如东县','3','0','');
INSERT INTO `zmt_area` VALUES ('1911','227','宿城区','3','0','');
INSERT INTO `zmt_area` VALUES ('1912','227','宿豫区','3','0','');
INSERT INTO `zmt_area` VALUES ('1913','227','宿豫县','3','0','');
INSERT INTO `zmt_area` VALUES ('1914','227','沭阳县','3','0','');
INSERT INTO `zmt_area` VALUES ('1915','227','泗阳县','3','0','');
INSERT INTO `zmt_area` VALUES ('1916','227','泗洪县','3','0','');
INSERT INTO `zmt_area` VALUES ('1917','228','海陵区','3','0','');
INSERT INTO `zmt_area` VALUES ('1918','228','高港区','3','0','');
INSERT INTO `zmt_area` VALUES ('1919','228','兴化市','3','0','');
INSERT INTO `zmt_area` VALUES ('1920','228','靖江市','3','0','');
INSERT INTO `zmt_area` VALUES ('1921','228','泰兴市','3','0','');
INSERT INTO `zmt_area` VALUES ('1922','228','姜堰市','3','0','');
INSERT INTO `zmt_area` VALUES ('1923','229','云龙区','3','0','');
INSERT INTO `zmt_area` VALUES ('1924','229','鼓楼区','3','0','');
INSERT INTO `zmt_area` VALUES ('1925','229','九里区','3','0','');
INSERT INTO `zmt_area` VALUES ('1926','229','贾汪区','3','0','');
INSERT INTO `zmt_area` VALUES ('1927','229','泉山区','3','0','');
INSERT INTO `zmt_area` VALUES ('1928','229','新沂市','3','0','');
INSERT INTO `zmt_area` VALUES ('1929','229','邳州市','3','0','');
INSERT INTO `zmt_area` VALUES ('1930','229','丰县','3','0','');
INSERT INTO `zmt_area` VALUES ('1931','229','沛县','3','0','');
INSERT INTO `zmt_area` VALUES ('1932','229','铜山县','3','0','');
INSERT INTO `zmt_area` VALUES ('1933','229','睢宁县','3','0','');
INSERT INTO `zmt_area` VALUES ('1934','230','城区','3','0','');
INSERT INTO `zmt_area` VALUES ('1935','230','亭湖区','3','0','');
INSERT INTO `zmt_area` VALUES ('1936','230','盐都区','3','0','');
INSERT INTO `zmt_area` VALUES ('1937','230','盐都县','3','0','');
INSERT INTO `zmt_area` VALUES ('1938','230','东台市','3','0','');
INSERT INTO `zmt_area` VALUES ('1939','230','大丰市','3','0','');
INSERT INTO `zmt_area` VALUES ('1940','230','响水县','3','0','');
INSERT INTO `zmt_area` VALUES ('1941','230','滨海县','3','0','');
INSERT INTO `zmt_area` VALUES ('1942','230','阜宁县','3','0','');
INSERT INTO `zmt_area` VALUES ('1943','230','射阳县','3','0','');
INSERT INTO `zmt_area` VALUES ('1944','230','建湖县','3','0','');
INSERT INTO `zmt_area` VALUES ('1945','231','广陵区','3','0','');
INSERT INTO `zmt_area` VALUES ('1946','231','维扬区','3','0','');
INSERT INTO `zmt_area` VALUES ('1947','231','邗江区','3','0','');
INSERT INTO `zmt_area` VALUES ('1948','231','仪征市','3','0','');
INSERT INTO `zmt_area` VALUES ('1949','231','高邮市','3','0','');
INSERT INTO `zmt_area` VALUES ('1950','231','江都市','3','0','');
INSERT INTO `zmt_area` VALUES ('1951','231','宝应县','3','0','');
INSERT INTO `zmt_area` VALUES ('1952','232','京口区','3','0','');
INSERT INTO `zmt_area` VALUES ('1953','232','润州区','3','0','');
INSERT INTO `zmt_area` VALUES ('1954','232','丹徒区','3','0','');
INSERT INTO `zmt_area` VALUES ('1955','232','丹阳市','3','0','');
INSERT INTO `zmt_area` VALUES ('1956','232','扬中市','3','0','');
INSERT INTO `zmt_area` VALUES ('1957','232','句容市','3','0','');
INSERT INTO `zmt_area` VALUES ('1958','233','东湖区','3','0','');
INSERT INTO `zmt_area` VALUES ('1959','233','西湖区','3','0','');
INSERT INTO `zmt_area` VALUES ('1960','233','青云谱区','3','0','');
INSERT INTO `zmt_area` VALUES ('1961','233','湾里区','3','0','');
INSERT INTO `zmt_area` VALUES ('1962','233','青山湖区','3','0','');
INSERT INTO `zmt_area` VALUES ('1963','233','红谷滩新区','3','0','');
INSERT INTO `zmt_area` VALUES ('1964','233','昌北区','3','0','');
INSERT INTO `zmt_area` VALUES ('1965','233','高新区','3','0','');
INSERT INTO `zmt_area` VALUES ('1966','233','南昌县','3','0','');
INSERT INTO `zmt_area` VALUES ('1967','233','新建县','3','0','');
INSERT INTO `zmt_area` VALUES ('1968','233','安义县','3','0','');
INSERT INTO `zmt_area` VALUES ('1969','233','进贤县','3','0','');
INSERT INTO `zmt_area` VALUES ('1970','234','临川区','3','0','');
INSERT INTO `zmt_area` VALUES ('1971','234','南城县','3','0','');
INSERT INTO `zmt_area` VALUES ('1972','234','黎川县','3','0','');
INSERT INTO `zmt_area` VALUES ('1973','234','南丰县','3','0','');
INSERT INTO `zmt_area` VALUES ('1974','234','崇仁县','3','0','');
INSERT INTO `zmt_area` VALUES ('1975','234','乐安县','3','0','');
INSERT INTO `zmt_area` VALUES ('1976','234','宜黄县','3','0','');
INSERT INTO `zmt_area` VALUES ('1977','234','金溪县','3','0','');
INSERT INTO `zmt_area` VALUES ('1978','234','资溪县','3','0','');
INSERT INTO `zmt_area` VALUES ('1979','234','东乡县','3','0','');
INSERT INTO `zmt_area` VALUES ('1980','234','广昌县','3','0','');
INSERT INTO `zmt_area` VALUES ('1981','235','章贡区','3','0','');
INSERT INTO `zmt_area` VALUES ('1982','235','于都县','3','0','');
INSERT INTO `zmt_area` VALUES ('1983','235','瑞金市','3','0','');
INSERT INTO `zmt_area` VALUES ('1984','235','南康市','3','0','');
INSERT INTO `zmt_area` VALUES ('1985','235','赣县','3','0','');
INSERT INTO `zmt_area` VALUES ('1986','235','信丰县','3','0','');
INSERT INTO `zmt_area` VALUES ('1987','235','大余县','3','0','');
INSERT INTO `zmt_area` VALUES ('1988','235','上犹县','3','0','');
INSERT INTO `zmt_area` VALUES ('1989','235','崇义县','3','0','');
INSERT INTO `zmt_area` VALUES ('1990','235','安远县','3','0','');
INSERT INTO `zmt_area` VALUES ('1991','235','龙南县','3','0','');
INSERT INTO `zmt_area` VALUES ('1992','235','定南县','3','0','');
INSERT INTO `zmt_area` VALUES ('1993','235','全南县','3','0','');
INSERT INTO `zmt_area` VALUES ('1994','235','宁都县','3','0','');
INSERT INTO `zmt_area` VALUES ('1995','235','兴国县','3','0','');
INSERT INTO `zmt_area` VALUES ('1996','235','会昌县','3','0','');
INSERT INTO `zmt_area` VALUES ('1997','235','寻乌县','3','0','');
INSERT INTO `zmt_area` VALUES ('1998','235','石城县','3','0','');
INSERT INTO `zmt_area` VALUES ('1999','236','安福县','3','0','');
INSERT INTO `zmt_area` VALUES ('2000','236','吉州区','3','0','');
INSERT INTO `zmt_area` VALUES ('2001','236','青原区','3','0','');
INSERT INTO `zmt_area` VALUES ('2002','236','井冈山市','3','0','');
INSERT INTO `zmt_area` VALUES ('2003','236','吉安县','3','0','');
INSERT INTO `zmt_area` VALUES ('2004','236','吉水县','3','0','');
INSERT INTO `zmt_area` VALUES ('2005','236','峡江县','3','0','');
INSERT INTO `zmt_area` VALUES ('2006','236','新干县','3','0','');
INSERT INTO `zmt_area` VALUES ('2007','236','永丰县','3','0','');
INSERT INTO `zmt_area` VALUES ('2008','236','泰和县','3','0','');
INSERT INTO `zmt_area` VALUES ('2009','236','遂川县','3','0','');
INSERT INTO `zmt_area` VALUES ('2010','236','万安县','3','0','');
INSERT INTO `zmt_area` VALUES ('2011','236','永新县','3','0','');
INSERT INTO `zmt_area` VALUES ('2012','237','珠山区','3','0','');
INSERT INTO `zmt_area` VALUES ('2013','237','昌江区','3','0','');
INSERT INTO `zmt_area` VALUES ('2014','237','乐平市','3','0','');
INSERT INTO `zmt_area` VALUES ('2015','237','浮梁县','3','0','');
INSERT INTO `zmt_area` VALUES ('2016','238','浔阳区','3','0','');
INSERT INTO `zmt_area` VALUES ('2017','238','庐山区','3','0','');
INSERT INTO `zmt_area` VALUES ('2018','238','瑞昌市','3','0','');
INSERT INTO `zmt_area` VALUES ('2019','238','九江县','3','0','');
INSERT INTO `zmt_area` VALUES ('2020','238','武宁县','3','0','');
INSERT INTO `zmt_area` VALUES ('2021','238','修水县','3','0','');
INSERT INTO `zmt_area` VALUES ('2022','238','永修县','3','0','');
INSERT INTO `zmt_area` VALUES ('2023','238','德安县','3','0','');
INSERT INTO `zmt_area` VALUES ('2024','238','星子县','3','0','');
INSERT INTO `zmt_area` VALUES ('2025','238','都昌县','3','0','');
INSERT INTO `zmt_area` VALUES ('2026','238','湖口县','3','0','');
INSERT INTO `zmt_area` VALUES ('2027','238','彭泽县','3','0','');
INSERT INTO `zmt_area` VALUES ('2028','239','安源区','3','0','');
INSERT INTO `zmt_area` VALUES ('2029','239','湘东区','3','0','');
INSERT INTO `zmt_area` VALUES ('2030','239','莲花县','3','0','');
INSERT INTO `zmt_area` VALUES ('2031','239','芦溪县','3','0','');
INSERT INTO `zmt_area` VALUES ('2032','239','上栗县','3','0','');
INSERT INTO `zmt_area` VALUES ('2033','240','信州区','3','0','');
INSERT INTO `zmt_area` VALUES ('2034','240','德兴市','3','0','');
INSERT INTO `zmt_area` VALUES ('2035','240','上饶县','3','0','');
INSERT INTO `zmt_area` VALUES ('2036','240','广丰县','3','0','');
INSERT INTO `zmt_area` VALUES ('2037','240','玉山县','3','0','');
INSERT INTO `zmt_area` VALUES ('2038','240','铅山县','3','0','');
INSERT INTO `zmt_area` VALUES ('2039','240','横峰县','3','0','');
INSERT INTO `zmt_area` VALUES ('2040','240','弋阳县','3','0','');
INSERT INTO `zmt_area` VALUES ('2041','240','余干县','3','0','');
INSERT INTO `zmt_area` VALUES ('2042','240','波阳县','3','0','');
INSERT INTO `zmt_area` VALUES ('2043','240','万年县','3','0','');
INSERT INTO `zmt_area` VALUES ('2044','240','婺源县','3','0','');
INSERT INTO `zmt_area` VALUES ('2045','241','渝水区','3','0','');
INSERT INTO `zmt_area` VALUES ('2046','241','分宜县','3','0','');
INSERT INTO `zmt_area` VALUES ('2047','242','袁州区','3','0','');
INSERT INTO `zmt_area` VALUES ('2048','242','丰城市','3','0','');
INSERT INTO `zmt_area` VALUES ('2049','242','樟树市','3','0','');
INSERT INTO `zmt_area` VALUES ('2050','242','高安市','3','0','');
INSERT INTO `zmt_area` VALUES ('2051','242','奉新县','3','0','');
INSERT INTO `zmt_area` VALUES ('2052','242','万载县','3','0','');
INSERT INTO `zmt_area` VALUES ('2053','242','上高县','3','0','');
INSERT INTO `zmt_area` VALUES ('2054','242','宜丰县','3','0','');
INSERT INTO `zmt_area` VALUES ('2055','242','靖安县','3','0','');
INSERT INTO `zmt_area` VALUES ('2056','242','铜鼓县','3','0','');
INSERT INTO `zmt_area` VALUES ('2057','243','月湖区','3','0','');
INSERT INTO `zmt_area` VALUES ('2058','243','贵溪市','3','0','');
INSERT INTO `zmt_area` VALUES ('2059','243','余江县','3','0','');
INSERT INTO `zmt_area` VALUES ('2060','244','沈河区','3','0','');
INSERT INTO `zmt_area` VALUES ('2061','244','皇姑区','3','0','');
INSERT INTO `zmt_area` VALUES ('2062','244','和平区','3','0','');
INSERT INTO `zmt_area` VALUES ('2063','244','大东区','3','0','');
INSERT INTO `zmt_area` VALUES ('2064','244','铁西区','3','0','');
INSERT INTO `zmt_area` VALUES ('2065','244','苏家屯区','3','0','');
INSERT INTO `zmt_area` VALUES ('2066','244','东陵区','3','0','');
INSERT INTO `zmt_area` VALUES ('2067','244','沈北新区','3','0','');
INSERT INTO `zmt_area` VALUES ('2068','244','于洪区','3','0','');
INSERT INTO `zmt_area` VALUES ('2069','244','浑南新区','3','0','');
INSERT INTO `zmt_area` VALUES ('2070','244','新民市','3','0','');
INSERT INTO `zmt_area` VALUES ('2071','244','辽中县','3','0','');
INSERT INTO `zmt_area` VALUES ('2072','244','康平县','3','0','');
INSERT INTO `zmt_area` VALUES ('2073','244','法库县','3','0','');
INSERT INTO `zmt_area` VALUES ('2074','245','西岗区','3','0','');
INSERT INTO `zmt_area` VALUES ('2075','245','中山区','3','0','');
INSERT INTO `zmt_area` VALUES ('2076','245','沙河口区','3','0','');
INSERT INTO `zmt_area` VALUES ('2077','245','甘井子区','3','0','');
INSERT INTO `zmt_area` VALUES ('2078','245','旅顺口区','3','0','');
INSERT INTO `zmt_area` VALUES ('2079','245','金州区','3','0','');
INSERT INTO `zmt_area` VALUES ('2080','245','开发区','3','0','');
INSERT INTO `zmt_area` VALUES ('2081','245','瓦房店市','3','0','');
INSERT INTO `zmt_area` VALUES ('2082','245','普兰店市','3','0','');
INSERT INTO `zmt_area` VALUES ('2083','245','庄河市','3','0','');
INSERT INTO `zmt_area` VALUES ('2084','245','长海县','3','0','');
INSERT INTO `zmt_area` VALUES ('2085','246','铁东区','3','0','');
INSERT INTO `zmt_area` VALUES ('2086','246','铁西区','3','0','');
INSERT INTO `zmt_area` VALUES ('2087','246','立山区','3','0','');
INSERT INTO `zmt_area` VALUES ('2088','246','千山区','3','0','');
INSERT INTO `zmt_area` VALUES ('2089','246','岫岩','3','0','');
INSERT INTO `zmt_area` VALUES ('2090','246','海城市','3','0','');
INSERT INTO `zmt_area` VALUES ('2091','246','台安县','3','0','');
INSERT INTO `zmt_area` VALUES ('2092','247','本溪','3','0','');
INSERT INTO `zmt_area` VALUES ('2093','247','平山区','3','0','');
INSERT INTO `zmt_area` VALUES ('2094','247','明山区','3','0','');
INSERT INTO `zmt_area` VALUES ('2095','247','溪湖区','3','0','');
INSERT INTO `zmt_area` VALUES ('2096','247','南芬区','3','0','');
INSERT INTO `zmt_area` VALUES ('2097','247','桓仁','3','0','');
INSERT INTO `zmt_area` VALUES ('2098','248','双塔区','3','0','');
INSERT INTO `zmt_area` VALUES ('2099','248','龙城区','3','0','');
INSERT INTO `zmt_area` VALUES ('2100','248','喀喇沁左翼蒙古族自治县','3','0','');
INSERT INTO `zmt_area` VALUES ('2101','248','北票市','3','0','');
INSERT INTO `zmt_area` VALUES ('2102','248','凌源市','3','0','');
INSERT INTO `zmt_area` VALUES ('2103','248','朝阳县','3','0','');
INSERT INTO `zmt_area` VALUES ('2104','248','建平县','3','0','');
INSERT INTO `zmt_area` VALUES ('2105','249','振兴区','3','0','');
INSERT INTO `zmt_area` VALUES ('2106','249','元宝区','3','0','');
INSERT INTO `zmt_area` VALUES ('2107','249','振安区','3','0','');
INSERT INTO `zmt_area` VALUES ('2108','249','宽甸','3','0','');
INSERT INTO `zmt_area` VALUES ('2109','249','东港市','3','0','');
INSERT INTO `zmt_area` VALUES ('2110','249','凤城市','3','0','');
INSERT INTO `zmt_area` VALUES ('2111','250','顺城区','3','0','');
INSERT INTO `zmt_area` VALUES ('2112','250','新抚区','3','0','');
INSERT INTO `zmt_area` VALUES ('2113','250','东洲区','3','0','');
INSERT INTO `zmt_area` VALUES ('2114','250','望花区','3','0','');
INSERT INTO `zmt_area` VALUES ('2115','250','清原','3','0','');
INSERT INTO `zmt_area` VALUES ('2116','250','新宾','3','0','');
INSERT INTO `zmt_area` VALUES ('2117','250','抚顺县','3','0','');
INSERT INTO `zmt_area` VALUES ('2118','251','阜新','3','0','');
INSERT INTO `zmt_area` VALUES ('2119','251','海州区','3','0','');
INSERT INTO `zmt_area` VALUES ('2120','251','新邱区','3','0','');
INSERT INTO `zmt_area` VALUES ('2121','251','太平区','3','0','');
INSERT INTO `zmt_area` VALUES ('2122','251','清河门区','3','0','');
INSERT INTO `zmt_area` VALUES ('2123','251','细河区','3','0','');
INSERT INTO `zmt_area` VALUES ('2124','251','彰武县','3','0','');
INSERT INTO `zmt_area` VALUES ('2125','252','龙港区','3','0','');
INSERT INTO `zmt_area` VALUES ('2126','252','南票区','3','0','');
INSERT INTO `zmt_area` VALUES ('2127','252','连山区','3','0','');
INSERT INTO `zmt_area` VALUES ('2128','252','兴城市','3','0','');
INSERT INTO `zmt_area` VALUES ('2129','252','绥中县','3','0','');
INSERT INTO `zmt_area` VALUES ('2130','252','建昌县','3','0','');
INSERT INTO `zmt_area` VALUES ('2131','253','太和区','3','0','');
INSERT INTO `zmt_area` VALUES ('2132','253','古塔区','3','0','');
INSERT INTO `zmt_area` VALUES ('2133','253','凌河区','3','0','');
INSERT INTO `zmt_area` VALUES ('2134','253','凌海市','3','0','');
INSERT INTO `zmt_area` VALUES ('2135','253','北镇市','3','0','');
INSERT INTO `zmt_area` VALUES ('2136','253','黑山县','3','0','');
INSERT INTO `zmt_area` VALUES ('2137','253','义县','3','0','');
INSERT INTO `zmt_area` VALUES ('2138','254','白塔区','3','0','');
INSERT INTO `zmt_area` VALUES ('2139','254','文圣区','3','0','');
INSERT INTO `zmt_area` VALUES ('2140','254','宏伟区','3','0','');
INSERT INTO `zmt_area` VALUES ('2141','254','太子河区','3','0','');
INSERT INTO `zmt_area` VALUES ('2142','254','弓长岭区','3','0','');
INSERT INTO `zmt_area` VALUES ('2143','254','灯塔市','3','0','');
INSERT INTO `zmt_area` VALUES ('2144','254','辽阳县','3','0','');
INSERT INTO `zmt_area` VALUES ('2145','255','双台子区','3','0','');
INSERT INTO `zmt_area` VALUES ('2146','255','兴隆台区','3','0','');
INSERT INTO `zmt_area` VALUES ('2147','255','大洼县','3','0','');
INSERT INTO `zmt_area` VALUES ('2148','255','盘山县','3','0','');
INSERT INTO `zmt_area` VALUES ('2149','256','银州区','3','0','');
INSERT INTO `zmt_area` VALUES ('2150','256','清河区','3','0','');
INSERT INTO `zmt_area` VALUES ('2151','256','调兵山市','3','0','');
INSERT INTO `zmt_area` VALUES ('2152','256','开原市','3','0','');
INSERT INTO `zmt_area` VALUES ('2153','256','铁岭县','3','0','');
INSERT INTO `zmt_area` VALUES ('2154','256','西丰县','3','0','');
INSERT INTO `zmt_area` VALUES ('2155','256','昌图县','3','0','');
INSERT INTO `zmt_area` VALUES ('2156','257','站前区','3','0','');
INSERT INTO `zmt_area` VALUES ('2157','257','西市区','3','0','');
INSERT INTO `zmt_area` VALUES ('2158','257','鲅鱼圈区','3','0','');
INSERT INTO `zmt_area` VALUES ('2159','257','老边区','3','0','');
INSERT INTO `zmt_area` VALUES ('2160','257','盖州市','3','0','');
INSERT INTO `zmt_area` VALUES ('2161','257','大石桥市','3','0','');
INSERT INTO `zmt_area` VALUES ('2162','258','回民区','3','0','');
INSERT INTO `zmt_area` VALUES ('2163','258','玉泉区','3','0','');
INSERT INTO `zmt_area` VALUES ('2164','258','新城区','3','0','');
INSERT INTO `zmt_area` VALUES ('2165','258','赛罕区','3','0','');
INSERT INTO `zmt_area` VALUES ('2166','258','清水河县','3','0','');
INSERT INTO `zmt_area` VALUES ('2167','258','土默特左旗','3','0','');
INSERT INTO `zmt_area` VALUES ('2168','258','托克托县','3','0','');
INSERT INTO `zmt_area` VALUES ('2169','258','和林格尔县','3','0','');
INSERT INTO `zmt_area` VALUES ('2170','258','武川县','3','0','');
INSERT INTO `zmt_area` VALUES ('2171','259','阿拉善左旗','3','0','');
INSERT INTO `zmt_area` VALUES ('2172','259','阿拉善右旗','3','0','');
INSERT INTO `zmt_area` VALUES ('2173','259','额济纳旗','3','0','');
INSERT INTO `zmt_area` VALUES ('2174','260','临河区','3','0','');
INSERT INTO `zmt_area` VALUES ('2175','260','五原县','3','0','');
INSERT INTO `zmt_area` VALUES ('2176','260','磴口县','3','0','');
INSERT INTO `zmt_area` VALUES ('2177','260','乌拉特前旗','3','0','');
INSERT INTO `zmt_area` VALUES ('2178','260','乌拉特中旗','3','0','');
INSERT INTO `zmt_area` VALUES ('2179','260','乌拉特后旗','3','0','');
INSERT INTO `zmt_area` VALUES ('2180','260','杭锦后旗','3','0','');
INSERT INTO `zmt_area` VALUES ('2181','261','昆都仑区','3','0','');
INSERT INTO `zmt_area` VALUES ('2182','261','青山区','3','0','');
INSERT INTO `zmt_area` VALUES ('2183','261','东河区','3','0','');
INSERT INTO `zmt_area` VALUES ('2184','261','九原区','3','0','');
INSERT INTO `zmt_area` VALUES ('2185','261','石拐区','3','0','');
INSERT INTO `zmt_area` VALUES ('2186','261','白云矿区','3','0','');
INSERT INTO `zmt_area` VALUES ('2187','261','土默特右旗','3','0','');
INSERT INTO `zmt_area` VALUES ('2188','261','固阳县','3','0','');
INSERT INTO `zmt_area` VALUES ('2189','261','达尔罕茂明安联合旗','3','0','');
INSERT INTO `zmt_area` VALUES ('2190','262','红山区','3','0','');
INSERT INTO `zmt_area` VALUES ('2191','262','元宝山区','3','0','');
INSERT INTO `zmt_area` VALUES ('2192','262','松山区','3','0','');
INSERT INTO `zmt_area` VALUES ('2193','262','阿鲁科尔沁旗','3','0','');
INSERT INTO `zmt_area` VALUES ('2194','262','巴林左旗','3','0','');
INSERT INTO `zmt_area` VALUES ('2195','262','巴林右旗','3','0','');
INSERT INTO `zmt_area` VALUES ('2196','262','林西县','3','0','');
INSERT INTO `zmt_area` VALUES ('2197','262','克什克腾旗','3','0','');
INSERT INTO `zmt_area` VALUES ('2198','262','翁牛特旗','3','0','');
INSERT INTO `zmt_area` VALUES ('2199','262','喀喇沁旗','3','0','');
INSERT INTO `zmt_area` VALUES ('2200','262','宁城县','3','0','');
INSERT INTO `zmt_area` VALUES ('2201','262','敖汉旗','3','0','');
INSERT INTO `zmt_area` VALUES ('2202','263','东胜区','3','0','');
INSERT INTO `zmt_area` VALUES ('2203','263','达拉特旗','3','0','');
INSERT INTO `zmt_area` VALUES ('2204','263','准格尔旗','3','0','');
INSERT INTO `zmt_area` VALUES ('2205','263','鄂托克前旗','3','0','');
INSERT INTO `zmt_area` VALUES ('2206','263','鄂托克旗','3','0','');
INSERT INTO `zmt_area` VALUES ('2207','263','杭锦旗','3','0','');
INSERT INTO `zmt_area` VALUES ('2208','263','乌审旗','3','0','');
INSERT INTO `zmt_area` VALUES ('2209','263','伊金霍洛旗','3','0','');
INSERT INTO `zmt_area` VALUES ('2210','264','海拉尔区','3','0','');
INSERT INTO `zmt_area` VALUES ('2211','264','莫力达瓦','3','0','');
INSERT INTO `zmt_area` VALUES ('2212','264','满洲里市','3','0','');
INSERT INTO `zmt_area` VALUES ('2213','264','牙克石市','3','0','');
INSERT INTO `zmt_area` VALUES ('2214','264','扎兰屯市','3','0','');
INSERT INTO `zmt_area` VALUES ('2215','264','额尔古纳市','3','0','');
INSERT INTO `zmt_area` VALUES ('2216','264','根河市','3','0','');
INSERT INTO `zmt_area` VALUES ('2217','264','阿荣旗','3','0','');
INSERT INTO `zmt_area` VALUES ('2218','264','鄂伦春自治旗','3','0','');
INSERT INTO `zmt_area` VALUES ('2219','264','鄂温克族自治旗','3','0','');
INSERT INTO `zmt_area` VALUES ('2220','264','陈巴尔虎旗','3','0','');
INSERT INTO `zmt_area` VALUES ('2221','264','新巴尔虎左旗','3','0','');
INSERT INTO `zmt_area` VALUES ('2222','264','新巴尔虎右旗','3','0','');
INSERT INTO `zmt_area` VALUES ('2223','265','科尔沁区','3','0','');
INSERT INTO `zmt_area` VALUES ('2224','265','霍林郭勒市','3','0','');
INSERT INTO `zmt_area` VALUES ('2225','265','科尔沁左翼中旗','3','0','');
INSERT INTO `zmt_area` VALUES ('2226','265','科尔沁左翼后旗','3','0','');
INSERT INTO `zmt_area` VALUES ('2227','265','开鲁县','3','0','');
INSERT INTO `zmt_area` VALUES ('2228','265','库伦旗','3','0','');
INSERT INTO `zmt_area` VALUES ('2229','265','奈曼旗','3','0','');
INSERT INTO `zmt_area` VALUES ('2230','265','扎鲁特旗','3','0','');
INSERT INTO `zmt_area` VALUES ('2231','266','海勃湾区','3','0','');
INSERT INTO `zmt_area` VALUES ('2232','266','乌达区','3','0','');
INSERT INTO `zmt_area` VALUES ('2233','266','海南区','3','0','');
INSERT INTO `zmt_area` VALUES ('2234','267','化德县','3','0','');
INSERT INTO `zmt_area` VALUES ('2235','267','集宁区','3','0','');
INSERT INTO `zmt_area` VALUES ('2236','267','丰镇市','3','0','');
INSERT INTO `zmt_area` VALUES ('2237','267','卓资县','3','0','');
INSERT INTO `zmt_area` VALUES ('2238','267','商都县','3','0','');
INSERT INTO `zmt_area` VALUES ('2239','267','兴和县','3','0','');
INSERT INTO `zmt_area` VALUES ('2240','267','凉城县','3','0','');
INSERT INTO `zmt_area` VALUES ('2241','267','察哈尔右翼前旗','3','0','');
INSERT INTO `zmt_area` VALUES ('2242','267','察哈尔右翼中旗','3','0','');
INSERT INTO `zmt_area` VALUES ('2243','267','察哈尔右翼后旗','3','0','');
INSERT INTO `zmt_area` VALUES ('2244','267','四子王旗','3','0','');
INSERT INTO `zmt_area` VALUES ('2245','268','二连浩特市','3','0','');
INSERT INTO `zmt_area` VALUES ('2246','268','锡林浩特市','3','0','');
INSERT INTO `zmt_area` VALUES ('2247','268','阿巴嘎旗','3','0','');
INSERT INTO `zmt_area` VALUES ('2248','268','苏尼特左旗','3','0','');
INSERT INTO `zmt_area` VALUES ('2249','268','苏尼特右旗','3','0','');
INSERT INTO `zmt_area` VALUES ('2250','268','东乌珠穆沁旗','3','0','');
INSERT INTO `zmt_area` VALUES ('2251','268','西乌珠穆沁旗','3','0','');
INSERT INTO `zmt_area` VALUES ('2252','268','太仆寺旗','3','0','');
INSERT INTO `zmt_area` VALUES ('2253','268','镶黄旗','3','0','');
INSERT INTO `zmt_area` VALUES ('2254','268','正镶白旗','3','0','');
INSERT INTO `zmt_area` VALUES ('2255','268','正蓝旗','3','0','');
INSERT INTO `zmt_area` VALUES ('2256','268','多伦县','3','0','');
INSERT INTO `zmt_area` VALUES ('2257','269','乌兰浩特市','3','0','');
INSERT INTO `zmt_area` VALUES ('2258','269','阿尔山市','3','0','');
INSERT INTO `zmt_area` VALUES ('2259','269','科尔沁右翼前旗','3','0','');
INSERT INTO `zmt_area` VALUES ('2260','269','科尔沁右翼中旗','3','0','');
INSERT INTO `zmt_area` VALUES ('2261','269','扎赉特旗','3','0','');
INSERT INTO `zmt_area` VALUES ('2262','269','突泉县','3','0','');
INSERT INTO `zmt_area` VALUES ('2263','270','西夏区','3','0','');
INSERT INTO `zmt_area` VALUES ('2264','270','金凤区','3','0','');
INSERT INTO `zmt_area` VALUES ('2265','270','兴庆区','3','0','');
INSERT INTO `zmt_area` VALUES ('2266','270','灵武市','3','0','');
INSERT INTO `zmt_area` VALUES ('2267','270','永宁县','3','0','');
INSERT INTO `zmt_area` VALUES ('2268','270','贺兰县','3','0','');
INSERT INTO `zmt_area` VALUES ('2269','271','原州区','3','0','');
INSERT INTO `zmt_area` VALUES ('2270','271','海原县','3','0','');
INSERT INTO `zmt_area` VALUES ('2271','271','西吉县','3','0','');
INSERT INTO `zmt_area` VALUES ('2272','271','隆德县','3','0','');
INSERT INTO `zmt_area` VALUES ('2273','271','泾源县','3','0','');
INSERT INTO `zmt_area` VALUES ('2274','271','彭阳县','3','0','');
INSERT INTO `zmt_area` VALUES ('2275','272','惠农县','3','0','');
INSERT INTO `zmt_area` VALUES ('2276','272','大武口区','3','0','');
INSERT INTO `zmt_area` VALUES ('2277','272','惠农区','3','0','');
INSERT INTO `zmt_area` VALUES ('2278','272','陶乐县','3','0','');
INSERT INTO `zmt_area` VALUES ('2279','272','平罗县','3','0','');
INSERT INTO `zmt_area` VALUES ('2280','273','利通区','3','0','');
INSERT INTO `zmt_area` VALUES ('2281','273','中卫县','3','0','');
INSERT INTO `zmt_area` VALUES ('2282','273','青铜峡市','3','0','');
INSERT INTO `zmt_area` VALUES ('2283','273','中宁县','3','0','');
INSERT INTO `zmt_area` VALUES ('2284','273','盐池县','3','0','');
INSERT INTO `zmt_area` VALUES ('2285','273','同心县','3','0','');
INSERT INTO `zmt_area` VALUES ('2286','274','沙坡头区','3','0','');
INSERT INTO `zmt_area` VALUES ('2287','274','海原县','3','0','');
INSERT INTO `zmt_area` VALUES ('2288','274','中宁县','3','0','');
INSERT INTO `zmt_area` VALUES ('2289','275','城中区','3','0','');
INSERT INTO `zmt_area` VALUES ('2290','275','城东区','3','0','');
INSERT INTO `zmt_area` VALUES ('2291','275','城西区','3','0','');
INSERT INTO `zmt_area` VALUES ('2292','275','城北区','3','0','');
INSERT INTO `zmt_area` VALUES ('2293','275','湟中县','3','0','');
INSERT INTO `zmt_area` VALUES ('2294','275','湟源县','3','0','');
INSERT INTO `zmt_area` VALUES ('2295','275','大通','3','0','');
INSERT INTO `zmt_area` VALUES ('2296','276','玛沁县','3','0','');
INSERT INTO `zmt_area` VALUES ('2297','276','班玛县','3','0','');
INSERT INTO `zmt_area` VALUES ('2298','276','甘德县','3','0','');
INSERT INTO `zmt_area` VALUES ('2299','276','达日县','3','0','');
INSERT INTO `zmt_area` VALUES ('2300','276','久治县','3','0','');
INSERT INTO `zmt_area` VALUES ('2301','276','玛多县','3','0','');
INSERT INTO `zmt_area` VALUES ('2302','277','海晏县','3','0','');
INSERT INTO `zmt_area` VALUES ('2303','277','祁连县','3','0','');
INSERT INTO `zmt_area` VALUES ('2304','277','刚察县','3','0','');
INSERT INTO `zmt_area` VALUES ('2305','277','门源','3','0','');
INSERT INTO `zmt_area` VALUES ('2306','278','平安县','3','0','');
INSERT INTO `zmt_area` VALUES ('2307','278','乐都县','3','0','');
INSERT INTO `zmt_area` VALUES ('2308','278','民和','3','0','');
INSERT INTO `zmt_area` VALUES ('2309','278','互助','3','0','');
INSERT INTO `zmt_area` VALUES ('2310','278','化隆','3','0','');
INSERT INTO `zmt_area` VALUES ('2311','278','循化','3','0','');
INSERT INTO `zmt_area` VALUES ('2312','279','共和县','3','0','');
INSERT INTO `zmt_area` VALUES ('2313','279','同德县','3','0','');
INSERT INTO `zmt_area` VALUES ('2314','279','贵德县','3','0','');
INSERT INTO `zmt_area` VALUES ('2315','279','兴海县','3','0','');
INSERT INTO `zmt_area` VALUES ('2316','279','贵南县','3','0','');
INSERT INTO `zmt_area` VALUES ('2317','280','德令哈市','3','0','');
INSERT INTO `zmt_area` VALUES ('2318','280','格尔木市','3','0','');
INSERT INTO `zmt_area` VALUES ('2319','280','乌兰县','3','0','');
INSERT INTO `zmt_area` VALUES ('2320','280','都兰县','3','0','');
INSERT INTO `zmt_area` VALUES ('2321','280','天峻县','3','0','');
INSERT INTO `zmt_area` VALUES ('2322','281','同仁县','3','0','');
INSERT INTO `zmt_area` VALUES ('2323','281','尖扎县','3','0','');
INSERT INTO `zmt_area` VALUES ('2324','281','泽库县','3','0','');
INSERT INTO `zmt_area` VALUES ('2325','281','河南蒙古族自治县','3','0','');
INSERT INTO `zmt_area` VALUES ('2326','282','玉树县','3','0','');
INSERT INTO `zmt_area` VALUES ('2327','282','杂多县','3','0','');
INSERT INTO `zmt_area` VALUES ('2328','282','称多县','3','0','');
INSERT INTO `zmt_area` VALUES ('2329','282','治多县','3','0','');
INSERT INTO `zmt_area` VALUES ('2330','282','囊谦县','3','0','');
INSERT INTO `zmt_area` VALUES ('2331','282','曲麻莱县','3','0','');
INSERT INTO `zmt_area` VALUES ('2332','283','市中区','3','0','');
INSERT INTO `zmt_area` VALUES ('2333','283','历下区','3','0','');
INSERT INTO `zmt_area` VALUES ('2334','283','天桥区','3','0','');
INSERT INTO `zmt_area` VALUES ('2335','283','槐荫区','3','0','');
INSERT INTO `zmt_area` VALUES ('2336','283','历城区','3','0','');
INSERT INTO `zmt_area` VALUES ('2337','283','长清区','3','0','');
INSERT INTO `zmt_area` VALUES ('2338','283','章丘市','3','0','');
INSERT INTO `zmt_area` VALUES ('2339','283','平阴县','3','0','');
INSERT INTO `zmt_area` VALUES ('2340','283','济阳县','3','0','');
INSERT INTO `zmt_area` VALUES ('2341','283','商河县','3','0','');
INSERT INTO `zmt_area` VALUES ('2342','284','市南区','3','0','');
INSERT INTO `zmt_area` VALUES ('2343','284','市北区','3','0','');
INSERT INTO `zmt_area` VALUES ('2344','284','城阳区','3','0','');
INSERT INTO `zmt_area` VALUES ('2345','284','四方区','3','0','');
INSERT INTO `zmt_area` VALUES ('2346','284','李沧区','3','0','');
INSERT INTO `zmt_area` VALUES ('2347','284','黄岛区','3','0','');
INSERT INTO `zmt_area` VALUES ('2348','284','崂山区','3','0','');
INSERT INTO `zmt_area` VALUES ('2349','284','胶州市','3','0','');
INSERT INTO `zmt_area` VALUES ('2350','284','即墨市','3','0','');
INSERT INTO `zmt_area` VALUES ('2351','284','平度市','3','0','');
INSERT INTO `zmt_area` VALUES ('2352','284','胶南市','3','0','');
INSERT INTO `zmt_area` VALUES ('2353','284','莱西市','3','0','');
INSERT INTO `zmt_area` VALUES ('2354','285','滨城区','3','0','');
INSERT INTO `zmt_area` VALUES ('2355','285','惠民县','3','0','');
INSERT INTO `zmt_area` VALUES ('2356','285','阳信县','3','0','');
INSERT INTO `zmt_area` VALUES ('2357','285','无棣县','3','0','');
INSERT INTO `zmt_area` VALUES ('2358','285','沾化县','3','0','');
INSERT INTO `zmt_area` VALUES ('2359','285','博兴县','3','0','');
INSERT INTO `zmt_area` VALUES ('2360','285','邹平县','3','0','');
INSERT INTO `zmt_area` VALUES ('2361','286','德城区','3','0','');
INSERT INTO `zmt_area` VALUES ('2362','286','陵县','3','0','');
INSERT INTO `zmt_area` VALUES ('2363','286','乐陵市','3','0','');
INSERT INTO `zmt_area` VALUES ('2364','286','禹城市','3','0','');
INSERT INTO `zmt_area` VALUES ('2365','286','宁津县','3','0','');
INSERT INTO `zmt_area` VALUES ('2366','286','庆云县','3','0','');
INSERT INTO `zmt_area` VALUES ('2367','286','临邑县','3','0','');
INSERT INTO `zmt_area` VALUES ('2368','286','齐河县','3','0','');
INSERT INTO `zmt_area` VALUES ('2369','286','平原县','3','0','');
INSERT INTO `zmt_area` VALUES ('2370','286','夏津县','3','0','');
INSERT INTO `zmt_area` VALUES ('2371','286','武城县','3','0','');
INSERT INTO `zmt_area` VALUES ('2372','287','东营区','3','0','');
INSERT INTO `zmt_area` VALUES ('2373','287','河口区','3','0','');
INSERT INTO `zmt_area` VALUES ('2374','287','垦利县','3','0','');
INSERT INTO `zmt_area` VALUES ('2375','287','利津县','3','0','');
INSERT INTO `zmt_area` VALUES ('2376','287','广饶县','3','0','');
INSERT INTO `zmt_area` VALUES ('2377','288','牡丹区','3','0','');
INSERT INTO `zmt_area` VALUES ('2378','288','曹县','3','0','');
INSERT INTO `zmt_area` VALUES ('2379','288','单县','3','0','');
INSERT INTO `zmt_area` VALUES ('2380','288','成武县','3','0','');
INSERT INTO `zmt_area` VALUES ('2381','288','巨野县','3','0','');
INSERT INTO `zmt_area` VALUES ('2382','288','郓城县','3','0','');
INSERT INTO `zmt_area` VALUES ('2383','288','鄄城县','3','0','');
INSERT INTO `zmt_area` VALUES ('2384','288','定陶县','3','0','');
INSERT INTO `zmt_area` VALUES ('2385','288','东明县','3','0','');
INSERT INTO `zmt_area` VALUES ('2386','289','市中区','3','0','');
INSERT INTO `zmt_area` VALUES ('2387','289','任城区','3','0','');
INSERT INTO `zmt_area` VALUES ('2388','289','曲阜市','3','0','');
INSERT INTO `zmt_area` VALUES ('2389','289','兖州市','3','0','');
INSERT INTO `zmt_area` VALUES ('2390','289','邹城市','3','0','');
INSERT INTO `zmt_area` VALUES ('2391','289','微山县','3','0','');
INSERT INTO `zmt_area` VALUES ('2392','289','鱼台县','3','0','');
INSERT INTO `zmt_area` VALUES ('2393','289','金乡县','3','0','');
INSERT INTO `zmt_area` VALUES ('2394','289','嘉祥县','3','0','');
INSERT INTO `zmt_area` VALUES ('2395','289','汶上县','3','0','');
INSERT INTO `zmt_area` VALUES ('2396','289','泗水县','3','0','');
INSERT INTO `zmt_area` VALUES ('2397','289','梁山县','3','0','');
INSERT INTO `zmt_area` VALUES ('2398','290','莱城区','3','0','');
INSERT INTO `zmt_area` VALUES ('2399','290','钢城区','3','0','');
INSERT INTO `zmt_area` VALUES ('2400','291','东昌府区','3','0','');
INSERT INTO `zmt_area` VALUES ('2401','291','临清市','3','0','');
INSERT INTO `zmt_area` VALUES ('2402','291','阳谷县','3','0','');
INSERT INTO `zmt_area` VALUES ('2403','291','莘县','3','0','');
INSERT INTO `zmt_area` VALUES ('2404','291','茌平县','3','0','');
INSERT INTO `zmt_area` VALUES ('2405','291','东阿县','3','0','');
INSERT INTO `zmt_area` VALUES ('2406','291','冠县','3','0','');
INSERT INTO `zmt_area` VALUES ('2407','291','高唐县','3','0','');
INSERT INTO `zmt_area` VALUES ('2408','292','兰山区','3','0','');
INSERT INTO `zmt_area` VALUES ('2409','292','罗庄区','3','0','');
INSERT INTO `zmt_area` VALUES ('2410','292','河东区','3','0','');
INSERT INTO `zmt_area` VALUES ('2411','292','沂南县','3','0','');
INSERT INTO `zmt_area` VALUES ('2412','292','郯城县','3','0','');
INSERT INTO `zmt_area` VALUES ('2413','292','沂水县','3','0','');
INSERT INTO `zmt_area` VALUES ('2414','292','苍山县','3','0','');
INSERT INTO `zmt_area` VALUES ('2415','292','费县','3','0','');
INSERT INTO `zmt_area` VALUES ('2416','292','平邑县','3','0','');
INSERT INTO `zmt_area` VALUES ('2417','292','莒南县','3','0','');
INSERT INTO `zmt_area` VALUES ('2418','292','蒙阴县','3','0','');
INSERT INTO `zmt_area` VALUES ('2419','292','临沭县','3','0','');
INSERT INTO `zmt_area` VALUES ('2420','293','东港区','3','0','');
INSERT INTO `zmt_area` VALUES ('2421','293','岚山区','3','0','');
INSERT INTO `zmt_area` VALUES ('2422','293','五莲县','3','0','');
INSERT INTO `zmt_area` VALUES ('2423','293','莒县','3','0','');
INSERT INTO `zmt_area` VALUES ('2424','294','泰山区','3','0','');
INSERT INTO `zmt_area` VALUES ('2425','294','岱岳区','3','0','');
INSERT INTO `zmt_area` VALUES ('2426','294','新泰市','3','0','');
INSERT INTO `zmt_area` VALUES ('2427','294','肥城市','3','0','');
INSERT INTO `zmt_area` VALUES ('2428','294','宁阳县','3','0','');
INSERT INTO `zmt_area` VALUES ('2429','294','东平县','3','0','');
INSERT INTO `zmt_area` VALUES ('2430','295','荣成市','3','0','');
INSERT INTO `zmt_area` VALUES ('2431','295','乳山市','3','0','');
INSERT INTO `zmt_area` VALUES ('2432','295','环翠区','3','0','');
INSERT INTO `zmt_area` VALUES ('2433','295','文登市','3','0','');
INSERT INTO `zmt_area` VALUES ('2434','296','潍城区','3','0','');
INSERT INTO `zmt_area` VALUES ('2435','296','寒亭区','3','0','');
INSERT INTO `zmt_area` VALUES ('2436','296','坊子区','3','0','');
INSERT INTO `zmt_area` VALUES ('2437','296','奎文区','3','0','');
INSERT INTO `zmt_area` VALUES ('2438','296','青州市','3','0','');
INSERT INTO `zmt_area` VALUES ('2439','296','诸城市','3','0','');
INSERT INTO `zmt_area` VALUES ('2440','296','寿光市','3','0','');
INSERT INTO `zmt_area` VALUES ('2441','296','安丘市','3','0','');
INSERT INTO `zmt_area` VALUES ('2442','296','高密市','3','0','');
INSERT INTO `zmt_area` VALUES ('2443','296','昌邑市','3','0','');
INSERT INTO `zmt_area` VALUES ('2444','296','临朐县','3','0','');
INSERT INTO `zmt_area` VALUES ('2445','296','昌乐县','3','0','');
INSERT INTO `zmt_area` VALUES ('2446','297','芝罘区','3','0','');
INSERT INTO `zmt_area` VALUES ('2447','297','福山区','3','0','');
INSERT INTO `zmt_area` VALUES ('2448','297','牟平区','3','0','');
INSERT INTO `zmt_area` VALUES ('2449','297','莱山区','3','0','');
INSERT INTO `zmt_area` VALUES ('2450','297','开发区','3','0','');
INSERT INTO `zmt_area` VALUES ('2451','297','龙口市','3','0','');
INSERT INTO `zmt_area` VALUES ('2452','297','莱阳市','3','0','');
INSERT INTO `zmt_area` VALUES ('2453','297','莱州市','3','0','');
INSERT INTO `zmt_area` VALUES ('2454','297','蓬莱市','3','0','');
INSERT INTO `zmt_area` VALUES ('2455','297','招远市','3','0','');
INSERT INTO `zmt_area` VALUES ('2456','297','栖霞市','3','0','');
INSERT INTO `zmt_area` VALUES ('2457','297','海阳市','3','0','');
INSERT INTO `zmt_area` VALUES ('2458','297','长岛县','3','0','');
INSERT INTO `zmt_area` VALUES ('2459','298','市中区','3','0','');
INSERT INTO `zmt_area` VALUES ('2460','298','山亭区','3','0','');
INSERT INTO `zmt_area` VALUES ('2461','298','峄城区','3','0','');
INSERT INTO `zmt_area` VALUES ('2462','298','台儿庄区','3','0','');
INSERT INTO `zmt_area` VALUES ('2463','298','薛城区','3','0','');
INSERT INTO `zmt_area` VALUES ('2464','298','滕州市','3','0','');
INSERT INTO `zmt_area` VALUES ('2465','299','张店区','3','0','');
INSERT INTO `zmt_area` VALUES ('2466','299','临淄区','3','0','');
INSERT INTO `zmt_area` VALUES ('2467','299','淄川区','3','0','');
INSERT INTO `zmt_area` VALUES ('2468','299','博山区','3','0','');
INSERT INTO `zmt_area` VALUES ('2469','299','周村区','3','0','');
INSERT INTO `zmt_area` VALUES ('2470','299','桓台县','3','0','');
INSERT INTO `zmt_area` VALUES ('2471','299','高青县','3','0','');
INSERT INTO `zmt_area` VALUES ('2472','299','沂源县','3','0','');
INSERT INTO `zmt_area` VALUES ('2473','300','杏花岭区','3','0','');
INSERT INTO `zmt_area` VALUES ('2474','300','小店区','3','0','');
INSERT INTO `zmt_area` VALUES ('2475','300','迎泽区','3','0','');
INSERT INTO `zmt_area` VALUES ('2476','300','尖草坪区','3','0','');
INSERT INTO `zmt_area` VALUES ('2477','300','万柏林区','3','0','');
INSERT INTO `zmt_area` VALUES ('2478','300','晋源区','3','0','');
INSERT INTO `zmt_area` VALUES ('2479','300','高新开发区','3','0','');
INSERT INTO `zmt_area` VALUES ('2480','300','民营经济开发区','3','0','');
INSERT INTO `zmt_area` VALUES ('2481','300','经济技术开发区','3','0','');
INSERT INTO `zmt_area` VALUES ('2482','300','清徐县','3','0','');
INSERT INTO `zmt_area` VALUES ('2483','300','阳曲县','3','0','');
INSERT INTO `zmt_area` VALUES ('2484','300','娄烦县','3','0','');
INSERT INTO `zmt_area` VALUES ('2485','300','古交市','3','0','');
INSERT INTO `zmt_area` VALUES ('2486','301','城区','3','0','');
INSERT INTO `zmt_area` VALUES ('2487','301','郊区','3','0','');
INSERT INTO `zmt_area` VALUES ('2488','301','沁县','3','0','');
INSERT INTO `zmt_area` VALUES ('2489','301','潞城市','3','0','');
INSERT INTO `zmt_area` VALUES ('2490','301','长治县','3','0','');
INSERT INTO `zmt_area` VALUES ('2491','301','襄垣县','3','0','');
INSERT INTO `zmt_area` VALUES ('2492','301','屯留县','3','0','');
INSERT INTO `zmt_area` VALUES ('2493','301','平顺县','3','0','');
INSERT INTO `zmt_area` VALUES ('2494','301','黎城县','3','0','');
INSERT INTO `zmt_area` VALUES ('2495','301','壶关县','3','0','');
INSERT INTO `zmt_area` VALUES ('2496','301','长子县','3','0','');
INSERT INTO `zmt_area` VALUES ('2497','301','武乡县','3','0','');
INSERT INTO `zmt_area` VALUES ('2498','301','沁源县','3','0','');
INSERT INTO `zmt_area` VALUES ('2499','302','城区','3','0','');
INSERT INTO `zmt_area` VALUES ('2500','302','矿区','3','0','');
INSERT INTO `zmt_area` VALUES ('2501','302','南郊区','3','0','');
INSERT INTO `zmt_area` VALUES ('2502','302','新荣区','3','0','');
INSERT INTO `zmt_area` VALUES ('2503','302','阳高县','3','0','');
INSERT INTO `zmt_area` VALUES ('2504','302','天镇县','3','0','');
INSERT INTO `zmt_area` VALUES ('2505','302','广灵县','3','0','');
INSERT INTO `zmt_area` VALUES ('2506','302','灵丘县','3','0','');
INSERT INTO `zmt_area` VALUES ('2507','302','浑源县','3','0','');
INSERT INTO `zmt_area` VALUES ('2508','302','左云县','3','0','');
INSERT INTO `zmt_area` VALUES ('2509','302','大同县','3','0','');
INSERT INTO `zmt_area` VALUES ('2510','303','城区','3','0','');
INSERT INTO `zmt_area` VALUES ('2511','303','高平市','3','0','');
INSERT INTO `zmt_area` VALUES ('2512','303','沁水县','3','0','');
INSERT INTO `zmt_area` VALUES ('2513','303','阳城县','3','0','');
INSERT INTO `zmt_area` VALUES ('2514','303','陵川县','3','0','');
INSERT INTO `zmt_area` VALUES ('2515','303','泽州县','3','0','');
INSERT INTO `zmt_area` VALUES ('2516','304','榆次区','3','0','');
INSERT INTO `zmt_area` VALUES ('2517','304','介休市','3','0','');
INSERT INTO `zmt_area` VALUES ('2518','304','榆社县','3','0','');
INSERT INTO `zmt_area` VALUES ('2519','304','左权县','3','0','');
INSERT INTO `zmt_area` VALUES ('2520','304','和顺县','3','0','');
INSERT INTO `zmt_area` VALUES ('2521','304','昔阳县','3','0','');
INSERT INTO `zmt_area` VALUES ('2522','304','寿阳县','3','0','');
INSERT INTO `zmt_area` VALUES ('2523','304','太谷县','3','0','');
INSERT INTO `zmt_area` VALUES ('2524','304','祁县','3','0','');
INSERT INTO `zmt_area` VALUES ('2525','304','平遥县','3','0','');
INSERT INTO `zmt_area` VALUES ('2526','304','灵石县','3','0','');
INSERT INTO `zmt_area` VALUES ('2527','305','尧都区','3','0','');
INSERT INTO `zmt_area` VALUES ('2528','305','侯马市','3','0','');
INSERT INTO `zmt_area` VALUES ('2529','305','霍州市','3','0','');
INSERT INTO `zmt_area` VALUES ('2530','305','曲沃县','3','0','');
INSERT INTO `zmt_area` VALUES ('2531','305','翼城县','3','0','');
INSERT INTO `zmt_area` VALUES ('2532','305','襄汾县','3','0','');
INSERT INTO `zmt_area` VALUES ('2533','305','洪洞县','3','0','');
INSERT INTO `zmt_area` VALUES ('2534','305','吉县','3','0','');
INSERT INTO `zmt_area` VALUES ('2535','305','安泽县','3','0','');
INSERT INTO `zmt_area` VALUES ('2536','305','浮山县','3','0','');
INSERT INTO `zmt_area` VALUES ('2537','305','古县','3','0','');
INSERT INTO `zmt_area` VALUES ('2538','305','乡宁县','3','0','');
INSERT INTO `zmt_area` VALUES ('2539','305','大宁县','3','0','');
INSERT INTO `zmt_area` VALUES ('2540','305','隰县','3','0','');
INSERT INTO `zmt_area` VALUES ('2541','305','永和县','3','0','');
INSERT INTO `zmt_area` VALUES ('2542','305','蒲县','3','0','');
INSERT INTO `zmt_area` VALUES ('2543','305','汾西县','3','0','');
INSERT INTO `zmt_area` VALUES ('2544','306','离石市','3','0','');
INSERT INTO `zmt_area` VALUES ('2545','306','离石区','3','0','');
INSERT INTO `zmt_area` VALUES ('2546','306','孝义市','3','0','');
INSERT INTO `zmt_area` VALUES ('2547','306','汾阳市','3','0','');
INSERT INTO `zmt_area` VALUES ('2548','306','文水县','3','0','');
INSERT INTO `zmt_area` VALUES ('2549','306','交城县','3','0','');
INSERT INTO `zmt_area` VALUES ('2550','306','兴县','3','0','');
INSERT INTO `zmt_area` VALUES ('2551','306','临县','3','0','');
INSERT INTO `zmt_area` VALUES ('2552','306','柳林县','3','0','');
INSERT INTO `zmt_area` VALUES ('2553','306','石楼县','3','0','');
INSERT INTO `zmt_area` VALUES ('2554','306','岚县','3','0','');
INSERT INTO `zmt_area` VALUES ('2555','306','方山县','3','0','');
INSERT INTO `zmt_area` VALUES ('2556','306','中阳县','3','0','');
INSERT INTO `zmt_area` VALUES ('2557','306','交口县','3','0','');
INSERT INTO `zmt_area` VALUES ('2558','307','朔城区','3','0','');
INSERT INTO `zmt_area` VALUES ('2559','307','平鲁区','3','0','');
INSERT INTO `zmt_area` VALUES ('2560','307','山阴县','3','0','');
INSERT INTO `zmt_area` VALUES ('2561','307','应县','3','0','');
INSERT INTO `zmt_area` VALUES ('2562','307','右玉县','3','0','');
INSERT INTO `zmt_area` VALUES ('2563','307','怀仁县','3','0','');
INSERT INTO `zmt_area` VALUES ('2564','308','忻府区','3','0','');
INSERT INTO `zmt_area` VALUES ('2565','308','原平市','3','0','');
INSERT INTO `zmt_area` VALUES ('2566','308','定襄县','3','0','');
INSERT INTO `zmt_area` VALUES ('2567','308','五台县','3','0','');
INSERT INTO `zmt_area` VALUES ('2568','308','代县','3','0','');
INSERT INTO `zmt_area` VALUES ('2569','308','繁峙县','3','0','');
INSERT INTO `zmt_area` VALUES ('2570','308','宁武县','3','0','');
INSERT INTO `zmt_area` VALUES ('2571','308','静乐县','3','0','');
INSERT INTO `zmt_area` VALUES ('2572','308','神池县','3','0','');
INSERT INTO `zmt_area` VALUES ('2573','308','五寨县','3','0','');
INSERT INTO `zmt_area` VALUES ('2574','308','岢岚县','3','0','');
INSERT INTO `zmt_area` VALUES ('2575','308','河曲县','3','0','');
INSERT INTO `zmt_area` VALUES ('2576','308','保德县','3','0','');
INSERT INTO `zmt_area` VALUES ('2577','308','偏关县','3','0','');
INSERT INTO `zmt_area` VALUES ('2578','309','城区','3','0','');
INSERT INTO `zmt_area` VALUES ('2579','309','矿区','3','0','');
INSERT INTO `zmt_area` VALUES ('2580','309','郊区','3','0','');
INSERT INTO `zmt_area` VALUES ('2581','309','平定县','3','0','');
INSERT INTO `zmt_area` VALUES ('2582','309','盂县','3','0','');
INSERT INTO `zmt_area` VALUES ('2583','310','盐湖区','3','0','');
INSERT INTO `zmt_area` VALUES ('2584','310','永济市','3','0','');
INSERT INTO `zmt_area` VALUES ('2585','310','河津市','3','0','');
INSERT INTO `zmt_area` VALUES ('2586','310','临猗县','3','0','');
INSERT INTO `zmt_area` VALUES ('2587','310','万荣县','3','0','');
INSERT INTO `zmt_area` VALUES ('2588','310','闻喜县','3','0','');
INSERT INTO `zmt_area` VALUES ('2589','310','稷山县','3','0','');
INSERT INTO `zmt_area` VALUES ('2590','310','新绛县','3','0','');
INSERT INTO `zmt_area` VALUES ('2591','310','绛县','3','0','');
INSERT INTO `zmt_area` VALUES ('2592','310','垣曲县','3','0','');
INSERT INTO `zmt_area` VALUES ('2593','310','夏县','3','0','');
INSERT INTO `zmt_area` VALUES ('2594','310','平陆县','3','0','');
INSERT INTO `zmt_area` VALUES ('2595','310','芮城县','3','0','');
INSERT INTO `zmt_area` VALUES ('2596','311','莲湖区','3','0','');
INSERT INTO `zmt_area` VALUES ('2597','311','新城区','3','0','');
INSERT INTO `zmt_area` VALUES ('2598','311','碑林区','3','0','');
INSERT INTO `zmt_area` VALUES ('2599','311','雁塔区','3','0','');
INSERT INTO `zmt_area` VALUES ('2600','311','灞桥区','3','0','');
INSERT INTO `zmt_area` VALUES ('2601','311','未央区','3','0','');
INSERT INTO `zmt_area` VALUES ('2602','311','阎良区','3','0','');
INSERT INTO `zmt_area` VALUES ('2603','311','临潼区','3','0','');
INSERT INTO `zmt_area` VALUES ('2604','311','长安区','3','0','');
INSERT INTO `zmt_area` VALUES ('2605','311','蓝田县','3','0','');
INSERT INTO `zmt_area` VALUES ('2606','311','周至县','3','0','');
INSERT INTO `zmt_area` VALUES ('2607','311','户县','3','0','');
INSERT INTO `zmt_area` VALUES ('2608','311','高陵县','3','0','');
INSERT INTO `zmt_area` VALUES ('2609','312','汉滨区','3','0','');
INSERT INTO `zmt_area` VALUES ('2610','312','汉阴县','3','0','');
INSERT INTO `zmt_area` VALUES ('2611','312','石泉县','3','0','');
INSERT INTO `zmt_area` VALUES ('2612','312','宁陕县','3','0','');
INSERT INTO `zmt_area` VALUES ('2613','312','紫阳县','3','0','');
INSERT INTO `zmt_area` VALUES ('2614','312','岚皋县','3','0','');
INSERT INTO `zmt_area` VALUES ('2615','312','平利县','3','0','');
INSERT INTO `zmt_area` VALUES ('2616','312','镇坪县','3','0','');
INSERT INTO `zmt_area` VALUES ('2617','312','旬阳县','3','0','');
INSERT INTO `zmt_area` VALUES ('2618','312','白河县','3','0','');
INSERT INTO `zmt_area` VALUES ('2619','313','陈仓区','3','0','');
INSERT INTO `zmt_area` VALUES ('2620','313','渭滨区','3','0','');
INSERT INTO `zmt_area` VALUES ('2621','313','金台区','3','0','');
INSERT INTO `zmt_area` VALUES ('2622','313','凤翔县','3','0','');
INSERT INTO `zmt_area` VALUES ('2623','313','岐山县','3','0','');
INSERT INTO `zmt_area` VALUES ('2624','313','扶风县','3','0','');
INSERT INTO `zmt_area` VALUES ('2625','313','眉县','3','0','');
INSERT INTO `zmt_area` VALUES ('2626','313','陇县','3','0','');
INSERT INTO `zmt_area` VALUES ('2627','313','千阳县','3','0','');
INSERT INTO `zmt_area` VALUES ('2628','313','麟游县','3','0','');
INSERT INTO `zmt_area` VALUES ('2629','313','凤县','3','0','');
INSERT INTO `zmt_area` VALUES ('2630','313','太白县','3','0','');
INSERT INTO `zmt_area` VALUES ('2631','314','汉台区','3','0','');
INSERT INTO `zmt_area` VALUES ('2632','314','南郑县','3','0','');
INSERT INTO `zmt_area` VALUES ('2633','314','城固县','3','0','');
INSERT INTO `zmt_area` VALUES ('2634','314','洋县','3','0','');
INSERT INTO `zmt_area` VALUES ('2635','314','西乡县','3','0','');
INSERT INTO `zmt_area` VALUES ('2636','314','勉县','3','0','');
INSERT INTO `zmt_area` VALUES ('2637','314','宁强县','3','0','');
INSERT INTO `zmt_area` VALUES ('2638','314','略阳县','3','0','');
INSERT INTO `zmt_area` VALUES ('2639','314','镇巴县','3','0','');
INSERT INTO `zmt_area` VALUES ('2640','314','留坝县','3','0','');
INSERT INTO `zmt_area` VALUES ('2641','314','佛坪县','3','0','');
INSERT INTO `zmt_area` VALUES ('2642','315','商州区','3','0','');
INSERT INTO `zmt_area` VALUES ('2643','315','洛南县','3','0','');
INSERT INTO `zmt_area` VALUES ('2644','315','丹凤县','3','0','');
INSERT INTO `zmt_area` VALUES ('2645','315','商南县','3','0','');
INSERT INTO `zmt_area` VALUES ('2646','315','山阳县','3','0','');
INSERT INTO `zmt_area` VALUES ('2647','315','镇安县','3','0','');
INSERT INTO `zmt_area` VALUES ('2648','315','柞水县','3','0','');
INSERT INTO `zmt_area` VALUES ('2649','316','耀州区','3','0','');
INSERT INTO `zmt_area` VALUES ('2650','316','王益区','3','0','');
INSERT INTO `zmt_area` VALUES ('2651','316','印台区','3','0','');
INSERT INTO `zmt_area` VALUES ('2652','316','宜君县','3','0','');
INSERT INTO `zmt_area` VALUES ('2653','317','临渭区','3','0','');
INSERT INTO `zmt_area` VALUES ('2654','317','韩城市','3','0','');
INSERT INTO `zmt_area` VALUES ('2655','317','华阴市','3','0','');
INSERT INTO `zmt_area` VALUES ('2656','317','华县','3','0','');
INSERT INTO `zmt_area` VALUES ('2657','317','潼关县','3','0','');
INSERT INTO `zmt_area` VALUES ('2658','317','大荔县','3','0','');
INSERT INTO `zmt_area` VALUES ('2659','317','合阳县','3','0','');
INSERT INTO `zmt_area` VALUES ('2660','317','澄城县','3','0','');
INSERT INTO `zmt_area` VALUES ('2661','317','蒲城县','3','0','');
INSERT INTO `zmt_area` VALUES ('2662','317','白水县','3','0','');
INSERT INTO `zmt_area` VALUES ('2663','317','富平县','3','0','');
INSERT INTO `zmt_area` VALUES ('2664','318','秦都区','3','0','');
INSERT INTO `zmt_area` VALUES ('2665','318','渭城区','3','0','');
INSERT INTO `zmt_area` VALUES ('2666','318','杨陵区','3','0','');
INSERT INTO `zmt_area` VALUES ('2667','318','兴平市','3','0','');
INSERT INTO `zmt_area` VALUES ('2668','318','三原县','3','0','');
INSERT INTO `zmt_area` VALUES ('2669','318','泾阳县','3','0','');
INSERT INTO `zmt_area` VALUES ('2670','318','乾县','3','0','');
INSERT INTO `zmt_area` VALUES ('2671','318','礼泉县','3','0','');
INSERT INTO `zmt_area` VALUES ('2672','318','永寿县','3','0','');
INSERT INTO `zmt_area` VALUES ('2673','318','彬县','3','0','');
INSERT INTO `zmt_area` VALUES ('2674','318','长武县','3','0','');
INSERT INTO `zmt_area` VALUES ('2675','318','旬邑县','3','0','');
INSERT INTO `zmt_area` VALUES ('2676','318','淳化县','3','0','');
INSERT INTO `zmt_area` VALUES ('2677','318','武功县','3','0','');
INSERT INTO `zmt_area` VALUES ('2678','319','吴起县','3','0','');
INSERT INTO `zmt_area` VALUES ('2679','319','宝塔区','3','0','');
INSERT INTO `zmt_area` VALUES ('2680','319','延长县','3','0','');
INSERT INTO `zmt_area` VALUES ('2681','319','延川县','3','0','');
INSERT INTO `zmt_area` VALUES ('2682','319','子长县','3','0','');
INSERT INTO `zmt_area` VALUES ('2683','319','安塞县','3','0','');
INSERT INTO `zmt_area` VALUES ('2684','319','志丹县','3','0','');
INSERT INTO `zmt_area` VALUES ('2685','319','甘泉县','3','0','');
INSERT INTO `zmt_area` VALUES ('2686','319','富县','3','0','');
INSERT INTO `zmt_area` VALUES ('2687','319','洛川县','3','0','');
INSERT INTO `zmt_area` VALUES ('2688','319','宜川县','3','0','');
INSERT INTO `zmt_area` VALUES ('2689','319','黄龙县','3','0','');
INSERT INTO `zmt_area` VALUES ('2690','319','黄陵县','3','0','');
INSERT INTO `zmt_area` VALUES ('2691','320','榆阳区','3','0','');
INSERT INTO `zmt_area` VALUES ('2692','320','神木县','3','0','');
INSERT INTO `zmt_area` VALUES ('2693','320','府谷县','3','0','');
INSERT INTO `zmt_area` VALUES ('2694','320','横山县','3','0','');
INSERT INTO `zmt_area` VALUES ('2695','320','靖边县','3','0','');
INSERT INTO `zmt_area` VALUES ('2696','320','定边县','3','0','');
INSERT INTO `zmt_area` VALUES ('2697','320','绥德县','3','0','');
INSERT INTO `zmt_area` VALUES ('2698','320','米脂县','3','0','');
INSERT INTO `zmt_area` VALUES ('2699','320','佳县','3','0','');
INSERT INTO `zmt_area` VALUES ('2700','320','吴堡县','3','0','');
INSERT INTO `zmt_area` VALUES ('2701','320','清涧县','3','0','');
INSERT INTO `zmt_area` VALUES ('2702','320','子洲县','3','0','');
INSERT INTO `zmt_area` VALUES ('2703','321','长宁区','3','0','');
INSERT INTO `zmt_area` VALUES ('2704','321','闸北区','3','0','');
INSERT INTO `zmt_area` VALUES ('2705','321','闵行区','3','0','');
INSERT INTO `zmt_area` VALUES ('2706','321','徐汇区','3','0','');
INSERT INTO `zmt_area` VALUES ('2707','321','浦东新区','3','0','');
INSERT INTO `zmt_area` VALUES ('2708','321','杨浦区','3','0','');
INSERT INTO `zmt_area` VALUES ('2709','321','普陀区','3','0','');
INSERT INTO `zmt_area` VALUES ('2710','321','静安区','3','0','');
INSERT INTO `zmt_area` VALUES ('2711','321','卢湾区','3','0','');
INSERT INTO `zmt_area` VALUES ('2712','321','虹口区','3','0','');
INSERT INTO `zmt_area` VALUES ('2713','321','黄浦区','3','0','');
INSERT INTO `zmt_area` VALUES ('2714','321','南汇区','3','0','');
INSERT INTO `zmt_area` VALUES ('2715','321','松江区','3','0','');
INSERT INTO `zmt_area` VALUES ('2716','321','嘉定区','3','0','');
INSERT INTO `zmt_area` VALUES ('2717','321','宝山区','3','0','');
INSERT INTO `zmt_area` VALUES ('2718','321','青浦区','3','0','');
INSERT INTO `zmt_area` VALUES ('2719','321','金山区','3','0','');
INSERT INTO `zmt_area` VALUES ('2720','321','奉贤区','3','0','');
INSERT INTO `zmt_area` VALUES ('2721','321','崇明县','3','0','');
INSERT INTO `zmt_area` VALUES ('2722','322','青羊区','3','0','');
INSERT INTO `zmt_area` VALUES ('2723','322','锦江区','3','0','');
INSERT INTO `zmt_area` VALUES ('2724','322','金牛区','3','0','');
INSERT INTO `zmt_area` VALUES ('2725','322','武侯区','3','0','');
INSERT INTO `zmt_area` VALUES ('2726','322','成华区','3','0','');
INSERT INTO `zmt_area` VALUES ('2727','322','龙泉驿区','3','0','');
INSERT INTO `zmt_area` VALUES ('2728','322','青白江区','3','0','');
INSERT INTO `zmt_area` VALUES ('2729','322','新都区','3','0','');
INSERT INTO `zmt_area` VALUES ('2730','322','温江区','3','0','');
INSERT INTO `zmt_area` VALUES ('2731','322','高新区','3','0','');
INSERT INTO `zmt_area` VALUES ('2732','322','高新西区','3','0','');
INSERT INTO `zmt_area` VALUES ('2733','322','都江堰市','3','0','');
INSERT INTO `zmt_area` VALUES ('2734','322','彭州市','3','0','');
INSERT INTO `zmt_area` VALUES ('2735','322','邛崃市','3','0','');
INSERT INTO `zmt_area` VALUES ('2736','322','崇州市','3','0','');
INSERT INTO `zmt_area` VALUES ('2737','322','金堂县','3','0','');
INSERT INTO `zmt_area` VALUES ('2738','322','双流县','3','0','');
INSERT INTO `zmt_area` VALUES ('2739','322','郫县','3','0','');
INSERT INTO `zmt_area` VALUES ('2740','322','大邑县','3','0','');
INSERT INTO `zmt_area` VALUES ('2741','322','蒲江县','3','0','');
INSERT INTO `zmt_area` VALUES ('2742','322','新津县','3','0','');
INSERT INTO `zmt_area` VALUES ('2743','322','都江堰市','3','0','');
INSERT INTO `zmt_area` VALUES ('2744','322','彭州市','3','0','');
INSERT INTO `zmt_area` VALUES ('2745','322','邛崃市','3','0','');
INSERT INTO `zmt_area` VALUES ('2746','322','崇州市','3','0','');
INSERT INTO `zmt_area` VALUES ('2747','322','金堂县','3','0','');
INSERT INTO `zmt_area` VALUES ('2748','322','双流县','3','0','');
INSERT INTO `zmt_area` VALUES ('2749','322','郫县','3','0','');
INSERT INTO `zmt_area` VALUES ('2750','322','大邑县','3','0','');
INSERT INTO `zmt_area` VALUES ('2751','322','蒲江县','3','0','');
INSERT INTO `zmt_area` VALUES ('2752','322','新津县','3','0','');
INSERT INTO `zmt_area` VALUES ('2753','323','涪城区','3','0','');
INSERT INTO `zmt_area` VALUES ('2754','323','游仙区','3','0','');
INSERT INTO `zmt_area` VALUES ('2755','323','江油市','3','0','');
INSERT INTO `zmt_area` VALUES ('2756','323','盐亭县','3','0','');
INSERT INTO `zmt_area` VALUES ('2757','323','三台县','3','0','');
INSERT INTO `zmt_area` VALUES ('2758','323','平武县','3','0','');
INSERT INTO `zmt_area` VALUES ('2759','323','安县','3','0','');
INSERT INTO `zmt_area` VALUES ('2760','323','梓潼县','3','0','');
INSERT INTO `zmt_area` VALUES ('2761','323','北川县','3','0','');
INSERT INTO `zmt_area` VALUES ('2762','324','马尔康县','3','0','');
INSERT INTO `zmt_area` VALUES ('2763','324','汶川县','3','0','');
INSERT INTO `zmt_area` VALUES ('2764','324','理县','3','0','');
INSERT INTO `zmt_area` VALUES ('2765','324','茂县','3','0','');
INSERT INTO `zmt_area` VALUES ('2766','324','松潘县','3','0','');
INSERT INTO `zmt_area` VALUES ('2767','324','九寨沟县','3','0','');
INSERT INTO `zmt_area` VALUES ('2768','324','金川县','3','0','');
INSERT INTO `zmt_area` VALUES ('2769','324','小金县','3','0','');
INSERT INTO `zmt_area` VALUES ('2770','324','黑水县','3','0','');
INSERT INTO `zmt_area` VALUES ('2771','324','壤塘县','3','0','');
INSERT INTO `zmt_area` VALUES ('2772','324','阿坝县','3','0','');
INSERT INTO `zmt_area` VALUES ('2773','324','若尔盖县','3','0','');
INSERT INTO `zmt_area` VALUES ('2774','324','红原县','3','0','');
INSERT INTO `zmt_area` VALUES ('2775','325','巴州区','3','0','');
INSERT INTO `zmt_area` VALUES ('2776','325','通江县','3','0','');
INSERT INTO `zmt_area` VALUES ('2777','325','南江县','3','0','');
INSERT INTO `zmt_area` VALUES ('2778','325','平昌县','3','0','');
INSERT INTO `zmt_area` VALUES ('2779','326','通川区','3','0','');
INSERT INTO `zmt_area` VALUES ('2780','326','万源市','3','0','');
INSERT INTO `zmt_area` VALUES ('2781','326','达县','3','0','');
INSERT INTO `zmt_area` VALUES ('2782','326','宣汉县','3','0','');
INSERT INTO `zmt_area` VALUES ('2783','326','开江县','3','0','');
INSERT INTO `zmt_area` VALUES ('2784','326','大竹县','3','0','');
INSERT INTO `zmt_area` VALUES ('2785','326','渠县','3','0','');
INSERT INTO `zmt_area` VALUES ('2786','327','旌阳区','3','0','');
INSERT INTO `zmt_area` VALUES ('2787','327','广汉市','3','0','');
INSERT INTO `zmt_area` VALUES ('2788','327','什邡市','3','0','');
INSERT INTO `zmt_area` VALUES ('2789','327','绵竹市','3','0','');
INSERT INTO `zmt_area` VALUES ('2790','327','罗江县','3','0','');
INSERT INTO `zmt_area` VALUES ('2791','327','中江县','3','0','');
INSERT INTO `zmt_area` VALUES ('2792','328','康定县','3','0','');
INSERT INTO `zmt_area` VALUES ('2793','328','丹巴县','3','0','');
INSERT INTO `zmt_area` VALUES ('2794','328','泸定县','3','0','');
INSERT INTO `zmt_area` VALUES ('2795','328','炉霍县','3','0','');
INSERT INTO `zmt_area` VALUES ('2796','328','九龙县','3','0','');
INSERT INTO `zmt_area` VALUES ('2797','328','甘孜县','3','0','');
INSERT INTO `zmt_area` VALUES ('2798','328','雅江县','3','0','');
INSERT INTO `zmt_area` VALUES ('2799','328','新龙县','3','0','');
INSERT INTO `zmt_area` VALUES ('2800','328','道孚县','3','0','');
INSERT INTO `zmt_area` VALUES ('2801','328','白玉县','3','0','');
INSERT INTO `zmt_area` VALUES ('2802','328','理塘县','3','0','');
INSERT INTO `zmt_area` VALUES ('2803','328','德格县','3','0','');
INSERT INTO `zmt_area` VALUES ('2804','328','乡城县','3','0','');
INSERT INTO `zmt_area` VALUES ('2805','328','石渠县','3','0','');
INSERT INTO `zmt_area` VALUES ('2806','328','稻城县','3','0','');
INSERT INTO `zmt_area` VALUES ('2807','328','色达县','3','0','');
INSERT INTO `zmt_area` VALUES ('2808','328','巴塘县','3','0','');
INSERT INTO `zmt_area` VALUES ('2809','328','得荣县','3','0','');
INSERT INTO `zmt_area` VALUES ('2810','329','广安区','3','0','');
INSERT INTO `zmt_area` VALUES ('2811','329','华蓥市','3','0','');
INSERT INTO `zmt_area` VALUES ('2812','329','岳池县','3','0','');
INSERT INTO `zmt_area` VALUES ('2813','329','武胜县','3','0','');
INSERT INTO `zmt_area` VALUES ('2814','329','邻水县','3','0','');
INSERT INTO `zmt_area` VALUES ('2815','330','利州区','3','0','');
INSERT INTO `zmt_area` VALUES ('2816','330','元坝区','3','0','');
INSERT INTO `zmt_area` VALUES ('2817','330','朝天区','3','0','');
INSERT INTO `zmt_area` VALUES ('2818','330','旺苍县','3','0','');
INSERT INTO `zmt_area` VALUES ('2819','330','青川县','3','0','');
INSERT INTO `zmt_area` VALUES ('2820','330','剑阁县','3','0','');
INSERT INTO `zmt_area` VALUES ('2821','330','苍溪县','3','0','');
INSERT INTO `zmt_area` VALUES ('2822','331','峨眉山市','3','0','');
INSERT INTO `zmt_area` VALUES ('2823','331','乐山市','3','0','');
INSERT INTO `zmt_area` VALUES ('2824','331','犍为县','3','0','');
INSERT INTO `zmt_area` VALUES ('2825','331','井研县','3','0','');
INSERT INTO `zmt_area` VALUES ('2826','331','夹江县','3','0','');
INSERT INTO `zmt_area` VALUES ('2827','331','沐川县','3','0','');
INSERT INTO `zmt_area` VALUES ('2828','331','峨边','3','0','');
INSERT INTO `zmt_area` VALUES ('2829','331','马边','3','0','');
INSERT INTO `zmt_area` VALUES ('2830','332','西昌市','3','0','');
INSERT INTO `zmt_area` VALUES ('2831','332','盐源县','3','0','');
INSERT INTO `zmt_area` VALUES ('2832','332','德昌县','3','0','');
INSERT INTO `zmt_area` VALUES ('2833','332','会理县','3','0','');
INSERT INTO `zmt_area` VALUES ('2834','332','会东县','3','0','');
INSERT INTO `zmt_area` VALUES ('2835','332','宁南县','3','0','');
INSERT INTO `zmt_area` VALUES ('2836','332','普格县','3','0','');
INSERT INTO `zmt_area` VALUES ('2837','332','布拖县','3','0','');
INSERT INTO `zmt_area` VALUES ('2838','332','金阳县','3','0','');
INSERT INTO `zmt_area` VALUES ('2839','332','昭觉县','3','0','');
INSERT INTO `zmt_area` VALUES ('2840','332','喜德县','3','0','');
INSERT INTO `zmt_area` VALUES ('2841','332','冕宁县','3','0','');
INSERT INTO `zmt_area` VALUES ('2842','332','越西县','3','0','');
INSERT INTO `zmt_area` VALUES ('2843','332','甘洛县','3','0','');
INSERT INTO `zmt_area` VALUES ('2844','332','美姑县','3','0','');
INSERT INTO `zmt_area` VALUES ('2845','332','雷波县','3','0','');
INSERT INTO `zmt_area` VALUES ('2846','332','木里','3','0','');
INSERT INTO `zmt_area` VALUES ('2847','333','东坡区','3','0','');
INSERT INTO `zmt_area` VALUES ('2848','333','仁寿县','3','0','');
INSERT INTO `zmt_area` VALUES ('2849','333','彭山县','3','0','');
INSERT INTO `zmt_area` VALUES ('2850','333','洪雅县','3','0','');
INSERT INTO `zmt_area` VALUES ('2851','333','丹棱县','3','0','');
INSERT INTO `zmt_area` VALUES ('2852','333','青神县','3','0','');
INSERT INTO `zmt_area` VALUES ('2853','334','阆中市','3','0','');
INSERT INTO `zmt_area` VALUES ('2854','334','南部县','3','0','');
INSERT INTO `zmt_area` VALUES ('2855','334','营山县','3','0','');
INSERT INTO `zmt_area` VALUES ('2856','334','蓬安县','3','0','');
INSERT INTO `zmt_area` VALUES ('2857','334','仪陇县','3','0','');
INSERT INTO `zmt_area` VALUES ('2858','334','顺庆区','3','0','');
INSERT INTO `zmt_area` VALUES ('2859','334','高坪区','3','0','');
INSERT INTO `zmt_area` VALUES ('2860','334','嘉陵区','3','0','');
INSERT INTO `zmt_area` VALUES ('2861','334','西充县','3','0','');
INSERT INTO `zmt_area` VALUES ('2862','335','市中区','3','0','');
INSERT INTO `zmt_area` VALUES ('2863','335','东兴区','3','0','');
INSERT INTO `zmt_area` VALUES ('2864','335','威远县','3','0','');
INSERT INTO `zmt_area` VALUES ('2865','335','资中县','3','0','');
INSERT INTO `zmt_area` VALUES ('2866','335','隆昌县','3','0','');
INSERT INTO `zmt_area` VALUES ('2867','336','东  区','3','0','');
INSERT INTO `zmt_area` VALUES ('2868','336','西  区','3','0','');
INSERT INTO `zmt_area` VALUES ('2869','336','仁和区','3','0','');
INSERT INTO `zmt_area` VALUES ('2870','336','米易县','3','0','');
INSERT INTO `zmt_area` VALUES ('2871','336','盐边县','3','0','');
INSERT INTO `zmt_area` VALUES ('2872','337','船山区','3','0','');
INSERT INTO `zmt_area` VALUES ('2873','337','安居区','3','0','');
INSERT INTO `zmt_area` VALUES ('2874','337','蓬溪县','3','0','');
INSERT INTO `zmt_area` VALUES ('2875','337','射洪县','3','0','');
INSERT INTO `zmt_area` VALUES ('2876','337','大英县','3','0','');
INSERT INTO `zmt_area` VALUES ('2877','338','雨城区','3','0','');
INSERT INTO `zmt_area` VALUES ('2878','338','名山县','3','0','');
INSERT INTO `zmt_area` VALUES ('2879','338','荥经县','3','0','');
INSERT INTO `zmt_area` VALUES ('2880','338','汉源县','3','0','');
INSERT INTO `zmt_area` VALUES ('2881','338','石棉县','3','0','');
INSERT INTO `zmt_area` VALUES ('2882','338','天全县','3','0','');
INSERT INTO `zmt_area` VALUES ('2883','338','芦山县','3','0','');
INSERT INTO `zmt_area` VALUES ('2884','338','宝兴县','3','0','');
INSERT INTO `zmt_area` VALUES ('2885','339','翠屏区','3','0','');
INSERT INTO `zmt_area` VALUES ('2886','339','宜宾县','3','0','');
INSERT INTO `zmt_area` VALUES ('2887','339','南溪县','3','0','');
INSERT INTO `zmt_area` VALUES ('2888','339','江安县','3','0','');
INSERT INTO `zmt_area` VALUES ('2889','339','长宁县','3','0','');
INSERT INTO `zmt_area` VALUES ('2890','339','高县','3','0','');
INSERT INTO `zmt_area` VALUES ('2891','339','珙县','3','0','');
INSERT INTO `zmt_area` VALUES ('2892','339','筠连县','3','0','');
INSERT INTO `zmt_area` VALUES ('2893','339','兴文县','3','0','');
INSERT INTO `zmt_area` VALUES ('2894','339','屏山县','3','0','');
INSERT INTO `zmt_area` VALUES ('2895','340','雁江区','3','0','');
INSERT INTO `zmt_area` VALUES ('2896','340','简阳市','3','0','');
INSERT INTO `zmt_area` VALUES ('2897','340','安岳县','3','0','');
INSERT INTO `zmt_area` VALUES ('2898','340','乐至县','3','0','');
INSERT INTO `zmt_area` VALUES ('2899','341','大安区','3','0','');
INSERT INTO `zmt_area` VALUES ('2900','341','自流井区','3','0','');
INSERT INTO `zmt_area` VALUES ('2901','341','贡井区','3','0','');
INSERT INTO `zmt_area` VALUES ('2902','341','沿滩区','3','0','');
INSERT INTO `zmt_area` VALUES ('2903','341','荣县','3','0','');
INSERT INTO `zmt_area` VALUES ('2904','341','富顺县','3','0','');
INSERT INTO `zmt_area` VALUES ('2905','342','江阳区','3','0','');
INSERT INTO `zmt_area` VALUES ('2906','342','纳溪区','3','0','');
INSERT INTO `zmt_area` VALUES ('2907','342','龙马潭区','3','0','');
INSERT INTO `zmt_area` VALUES ('2908','342','泸县','3','0','');
INSERT INTO `zmt_area` VALUES ('2909','342','合江县','3','0','');
INSERT INTO `zmt_area` VALUES ('2910','342','叙永县','3','0','');
INSERT INTO `zmt_area` VALUES ('2911','342','古蔺县','3','0','');
INSERT INTO `zmt_area` VALUES ('2912','343','和平区','3','0','');
INSERT INTO `zmt_area` VALUES ('2913','343','河西区','3','0','');
INSERT INTO `zmt_area` VALUES ('2914','343','南开区','3','0','');
INSERT INTO `zmt_area` VALUES ('2915','343','河北区','3','0','');
INSERT INTO `zmt_area` VALUES ('2916','343','河东区','3','0','');
INSERT INTO `zmt_area` VALUES ('2917','343','红桥区','3','0','');
INSERT INTO `zmt_area` VALUES ('2918','343','东丽区','3','0','');
INSERT INTO `zmt_area` VALUES ('2919','343','津南区','3','0','');
INSERT INTO `zmt_area` VALUES ('2920','343','西青区','3','0','');
INSERT INTO `zmt_area` VALUES ('2921','343','北辰区','3','0','');
INSERT INTO `zmt_area` VALUES ('2922','343','塘沽区','3','0','');
INSERT INTO `zmt_area` VALUES ('2923','343','汉沽区','3','0','');
INSERT INTO `zmt_area` VALUES ('2924','343','大港区','3','0','');
INSERT INTO `zmt_area` VALUES ('2925','343','武清区','3','0','');
INSERT INTO `zmt_area` VALUES ('2926','343','宝坻区','3','0','');
INSERT INTO `zmt_area` VALUES ('2927','343','经济开发区','3','0','');
INSERT INTO `zmt_area` VALUES ('2928','343','宁河县','3','0','');
INSERT INTO `zmt_area` VALUES ('2929','343','静海县','3','0','');
INSERT INTO `zmt_area` VALUES ('2930','343','蓟县','3','0','');
INSERT INTO `zmt_area` VALUES ('2931','344','城关区','3','0','');
INSERT INTO `zmt_area` VALUES ('2932','344','林周县','3','0','');
INSERT INTO `zmt_area` VALUES ('2933','344','当雄县','3','0','');
INSERT INTO `zmt_area` VALUES ('2934','344','尼木县','3','0','');
INSERT INTO `zmt_area` VALUES ('2935','344','曲水县','3','0','');
INSERT INTO `zmt_area` VALUES ('2936','344','堆龙德庆县','3','0','');
INSERT INTO `zmt_area` VALUES ('2937','344','达孜县','3','0','');
INSERT INTO `zmt_area` VALUES ('2938','344','墨竹工卡县','3','0','');
INSERT INTO `zmt_area` VALUES ('2939','345','噶尔县','3','0','');
INSERT INTO `zmt_area` VALUES ('2940','345','普兰县','3','0','');
INSERT INTO `zmt_area` VALUES ('2941','345','札达县','3','0','');
INSERT INTO `zmt_area` VALUES ('2942','345','日土县','3','0','');
INSERT INTO `zmt_area` VALUES ('2943','345','革吉县','3','0','');
INSERT INTO `zmt_area` VALUES ('2944','345','改则县','3','0','');
INSERT INTO `zmt_area` VALUES ('2945','345','措勤县','3','0','');
INSERT INTO `zmt_area` VALUES ('2946','346','昌都县','3','0','');
INSERT INTO `zmt_area` VALUES ('2947','346','江达县','3','0','');
INSERT INTO `zmt_area` VALUES ('2948','346','贡觉县','3','0','');
INSERT INTO `zmt_area` VALUES ('2949','346','类乌齐县','3','0','');
INSERT INTO `zmt_area` VALUES ('2950','346','丁青县','3','0','');
INSERT INTO `zmt_area` VALUES ('2951','346','察雅县','3','0','');
INSERT INTO `zmt_area` VALUES ('2952','346','八宿县','3','0','');
INSERT INTO `zmt_area` VALUES ('2953','346','左贡县','3','0','');
INSERT INTO `zmt_area` VALUES ('2954','346','芒康县','3','0','');
INSERT INTO `zmt_area` VALUES ('2955','346','洛隆县','3','0','');
INSERT INTO `zmt_area` VALUES ('2956','346','边坝县','3','0','');
INSERT INTO `zmt_area` VALUES ('2957','347','林芝县','3','0','');
INSERT INTO `zmt_area` VALUES ('2958','347','工布江达县','3','0','');
INSERT INTO `zmt_area` VALUES ('2959','347','米林县','3','0','');
INSERT INTO `zmt_area` VALUES ('2960','347','墨脱县','3','0','');
INSERT INTO `zmt_area` VALUES ('2961','347','波密县','3','0','');
INSERT INTO `zmt_area` VALUES ('2962','347','察隅县','3','0','');
INSERT INTO `zmt_area` VALUES ('2963','347','朗县','3','0','');
INSERT INTO `zmt_area` VALUES ('2964','348','那曲县','3','0','');
INSERT INTO `zmt_area` VALUES ('2965','348','嘉黎县','3','0','');
INSERT INTO `zmt_area` VALUES ('2966','348','比如县','3','0','');
INSERT INTO `zmt_area` VALUES ('2967','348','聂荣县','3','0','');
INSERT INTO `zmt_area` VALUES ('2968','348','安多县','3','0','');
INSERT INTO `zmt_area` VALUES ('2969','348','申扎县','3','0','');
INSERT INTO `zmt_area` VALUES ('2970','348','索县','3','0','');
INSERT INTO `zmt_area` VALUES ('2971','348','班戈县','3','0','');
INSERT INTO `zmt_area` VALUES ('2972','348','巴青县','3','0','');
INSERT INTO `zmt_area` VALUES ('2973','348','尼玛县','3','0','');
INSERT INTO `zmt_area` VALUES ('2974','349','日喀则市','3','0','');
INSERT INTO `zmt_area` VALUES ('2975','349','南木林县','3','0','');
INSERT INTO `zmt_area` VALUES ('2976','349','江孜县','3','0','');
INSERT INTO `zmt_area` VALUES ('2977','349','定日县','3','0','');
INSERT INTO `zmt_area` VALUES ('2978','349','萨迦县','3','0','');
INSERT INTO `zmt_area` VALUES ('2979','349','拉孜县','3','0','');
INSERT INTO `zmt_area` VALUES ('2980','349','昂仁县','3','0','');
INSERT INTO `zmt_area` VALUES ('2981','349','谢通门县','3','0','');
INSERT INTO `zmt_area` VALUES ('2982','349','白朗县','3','0','');
INSERT INTO `zmt_area` VALUES ('2983','349','仁布县','3','0','');
INSERT INTO `zmt_area` VALUES ('2984','349','康马县','3','0','');
INSERT INTO `zmt_area` VALUES ('2985','349','定结县','3','0','');
INSERT INTO `zmt_area` VALUES ('2986','349','仲巴县','3','0','');
INSERT INTO `zmt_area` VALUES ('2987','349','亚东县','3','0','');
INSERT INTO `zmt_area` VALUES ('2988','349','吉隆县','3','0','');
INSERT INTO `zmt_area` VALUES ('2989','349','聂拉木县','3','0','');
INSERT INTO `zmt_area` VALUES ('2990','349','萨嘎县','3','0','');
INSERT INTO `zmt_area` VALUES ('2991','349','岗巴县','3','0','');
INSERT INTO `zmt_area` VALUES ('2992','350','乃东县','3','0','');
INSERT INTO `zmt_area` VALUES ('2993','350','扎囊县','3','0','');
INSERT INTO `zmt_area` VALUES ('2994','350','贡嘎县','3','0','');
INSERT INTO `zmt_area` VALUES ('2995','350','桑日县','3','0','');
INSERT INTO `zmt_area` VALUES ('2996','350','琼结县','3','0','');
INSERT INTO `zmt_area` VALUES ('2997','350','曲松县','3','0','');
INSERT INTO `zmt_area` VALUES ('2998','350','措美县','3','0','');
INSERT INTO `zmt_area` VALUES ('2999','350','洛扎县','3','0','');
INSERT INTO `zmt_area` VALUES ('3000','350','加查县','3','0','');
INSERT INTO `zmt_area` VALUES ('3001','350','隆子县','3','0','');
INSERT INTO `zmt_area` VALUES ('3002','350','错那县','3','0','');
INSERT INTO `zmt_area` VALUES ('3003','350','浪卡子县','3','0','');
INSERT INTO `zmt_area` VALUES ('3004','351','天山区','3','0','');
INSERT INTO `zmt_area` VALUES ('3005','351','沙依巴克区','3','0','');
INSERT INTO `zmt_area` VALUES ('3006','351','新市区','3','0','');
INSERT INTO `zmt_area` VALUES ('3007','351','水磨沟区','3','0','');
INSERT INTO `zmt_area` VALUES ('3008','351','头屯河区','3','0','');
INSERT INTO `zmt_area` VALUES ('3009','351','达坂城区','3','0','');
INSERT INTO `zmt_area` VALUES ('3010','351','米东区','3','0','');
INSERT INTO `zmt_area` VALUES ('3011','351','乌鲁木齐县','3','0','');
INSERT INTO `zmt_area` VALUES ('3012','352','阿克苏市','3','0','');
INSERT INTO `zmt_area` VALUES ('3013','352','温宿县','3','0','');
INSERT INTO `zmt_area` VALUES ('3014','352','库车县','3','0','');
INSERT INTO `zmt_area` VALUES ('3015','352','沙雅县','3','0','');
INSERT INTO `zmt_area` VALUES ('3016','352','新和县','3','0','');
INSERT INTO `zmt_area` VALUES ('3017','352','拜城县','3','0','');
INSERT INTO `zmt_area` VALUES ('3018','352','乌什县','3','0','');
INSERT INTO `zmt_area` VALUES ('3019','352','阿瓦提县','3','0','');
INSERT INTO `zmt_area` VALUES ('3020','352','柯坪县','3','0','');
INSERT INTO `zmt_area` VALUES ('3021','353','阿拉尔市','3','0','');
INSERT INTO `zmt_area` VALUES ('3022','354','库尔勒市','3','0','');
INSERT INTO `zmt_area` VALUES ('3023','354','轮台县','3','0','');
INSERT INTO `zmt_area` VALUES ('3024','354','尉犁县','3','0','');
INSERT INTO `zmt_area` VALUES ('3025','354','若羌县','3','0','');
INSERT INTO `zmt_area` VALUES ('3026','354','且末县','3','0','');
INSERT INTO `zmt_area` VALUES ('3027','354','焉耆','3','0','');
INSERT INTO `zmt_area` VALUES ('3028','354','和静县','3','0','');
INSERT INTO `zmt_area` VALUES ('3029','354','和硕县','3','0','');
INSERT INTO `zmt_area` VALUES ('3030','354','博湖县','3','0','');
INSERT INTO `zmt_area` VALUES ('3031','355','博乐市','3','0','');
INSERT INTO `zmt_area` VALUES ('3032','355','精河县','3','0','');
INSERT INTO `zmt_area` VALUES ('3033','355','温泉县','3','0','');
INSERT INTO `zmt_area` VALUES ('3034','356','呼图壁县','3','0','');
INSERT INTO `zmt_area` VALUES ('3035','356','米泉市','3','0','');
INSERT INTO `zmt_area` VALUES ('3036','356','昌吉市','3','0','');
INSERT INTO `zmt_area` VALUES ('3037','356','阜康市','3','0','');
INSERT INTO `zmt_area` VALUES ('3038','356','玛纳斯县','3','0','');
INSERT INTO `zmt_area` VALUES ('3039','356','奇台县','3','0','');
INSERT INTO `zmt_area` VALUES ('3040','356','吉木萨尔县','3','0','');
INSERT INTO `zmt_area` VALUES ('3041','356','木垒','3','0','');
INSERT INTO `zmt_area` VALUES ('3042','357','哈密市','3','0','');
INSERT INTO `zmt_area` VALUES ('3043','357','伊吾县','3','0','');
INSERT INTO `zmt_area` VALUES ('3044','357','巴里坤','3','0','');
INSERT INTO `zmt_area` VALUES ('3045','358','和田市','3','0','');
INSERT INTO `zmt_area` VALUES ('3046','358','和田县','3','0','');
INSERT INTO `zmt_area` VALUES ('3047','358','墨玉县','3','0','');
INSERT INTO `zmt_area` VALUES ('3048','358','皮山县','3','0','');
INSERT INTO `zmt_area` VALUES ('3049','358','洛浦县','3','0','');
INSERT INTO `zmt_area` VALUES ('3050','358','策勒县','3','0','');
INSERT INTO `zmt_area` VALUES ('3051','358','于田县','3','0','');
INSERT INTO `zmt_area` VALUES ('3052','358','民丰县','3','0','');
INSERT INTO `zmt_area` VALUES ('3053','359','喀什市','3','0','');
INSERT INTO `zmt_area` VALUES ('3054','359','疏附县','3','0','');
INSERT INTO `zmt_area` VALUES ('3055','359','疏勒县','3','0','');
INSERT INTO `zmt_area` VALUES ('3056','359','英吉沙县','3','0','');
INSERT INTO `zmt_area` VALUES ('3057','359','泽普县','3','0','');
INSERT INTO `zmt_area` VALUES ('3058','359','莎车县','3','0','');
INSERT INTO `zmt_area` VALUES ('3059','359','叶城县','3','0','');
INSERT INTO `zmt_area` VALUES ('3060','359','麦盖提县','3','0','');
INSERT INTO `zmt_area` VALUES ('3061','359','岳普湖县','3','0','');
INSERT INTO `zmt_area` VALUES ('3062','359','伽师县','3','0','');
INSERT INTO `zmt_area` VALUES ('3063','359','巴楚县','3','0','');
INSERT INTO `zmt_area` VALUES ('3064','359','塔什库尔干','3','0','');
INSERT INTO `zmt_area` VALUES ('3065','360','克拉玛依市','3','0','');
INSERT INTO `zmt_area` VALUES ('3066','361','阿图什市','3','0','');
INSERT INTO `zmt_area` VALUES ('3067','361','阿克陶县','3','0','');
INSERT INTO `zmt_area` VALUES ('3068','361','阿合奇县','3','0','');
INSERT INTO `zmt_area` VALUES ('3069','361','乌恰县','3','0','');
INSERT INTO `zmt_area` VALUES ('3070','362','石河子市','3','0','');
INSERT INTO `zmt_area` VALUES ('3071','363','图木舒克市','3','0','');
INSERT INTO `zmt_area` VALUES ('3072','364','吐鲁番市','3','0','');
INSERT INTO `zmt_area` VALUES ('3073','364','鄯善县','3','0','');
INSERT INTO `zmt_area` VALUES ('3074','364','托克逊县','3','0','');
INSERT INTO `zmt_area` VALUES ('3075','365','五家渠市','3','0','');
INSERT INTO `zmt_area` VALUES ('3076','366','阿勒泰市','3','0','');
INSERT INTO `zmt_area` VALUES ('3077','366','布克赛尔','3','0','');
INSERT INTO `zmt_area` VALUES ('3078','366','伊宁市','3','0','');
INSERT INTO `zmt_area` VALUES ('3079','366','布尔津县','3','0','');
INSERT INTO `zmt_area` VALUES ('3080','366','奎屯市','3','0','');
INSERT INTO `zmt_area` VALUES ('3081','366','乌苏市','3','0','');
INSERT INTO `zmt_area` VALUES ('3082','366','额敏县','3','0','');
INSERT INTO `zmt_area` VALUES ('3083','366','富蕴县','3','0','');
INSERT INTO `zmt_area` VALUES ('3084','366','伊宁县','3','0','');
INSERT INTO `zmt_area` VALUES ('3085','366','福海县','3','0','');
INSERT INTO `zmt_area` VALUES ('3086','366','霍城县','3','0','');
INSERT INTO `zmt_area` VALUES ('3087','366','沙湾县','3','0','');
INSERT INTO `zmt_area` VALUES ('3088','366','巩留县','3','0','');
INSERT INTO `zmt_area` VALUES ('3089','366','哈巴河县','3','0','');
INSERT INTO `zmt_area` VALUES ('3090','366','托里县','3','0','');
INSERT INTO `zmt_area` VALUES ('3091','366','青河县','3','0','');
INSERT INTO `zmt_area` VALUES ('3092','366','新源县','3','0','');
INSERT INTO `zmt_area` VALUES ('3093','366','裕民县','3','0','');
INSERT INTO `zmt_area` VALUES ('3094','366','和布克赛尔','3','0','');
INSERT INTO `zmt_area` VALUES ('3095','366','吉木乃县','3','0','');
INSERT INTO `zmt_area` VALUES ('3096','366','昭苏县','3','0','');
INSERT INTO `zmt_area` VALUES ('3097','366','特克斯县','3','0','');
INSERT INTO `zmt_area` VALUES ('3098','366','尼勒克县','3','0','');
INSERT INTO `zmt_area` VALUES ('3099','366','察布查尔','3','0','');
INSERT INTO `zmt_area` VALUES ('3100','367','盘龙区','3','0','');
INSERT INTO `zmt_area` VALUES ('3101','367','五华区','3','0','');
INSERT INTO `zmt_area` VALUES ('3102','367','官渡区','3','0','');
INSERT INTO `zmt_area` VALUES ('3103','367','西山区','3','0','');
INSERT INTO `zmt_area` VALUES ('3104','367','东川区','3','0','');
INSERT INTO `zmt_area` VALUES ('3105','367','安宁市','3','0','');
INSERT INTO `zmt_area` VALUES ('3106','367','呈贡县','3','0','');
INSERT INTO `zmt_area` VALUES ('3107','367','晋宁县','3','0','');
INSERT INTO `zmt_area` VALUES ('3108','367','富民县','3','0','');
INSERT INTO `zmt_area` VALUES ('3109','367','宜良县','3','0','');
INSERT INTO `zmt_area` VALUES ('3110','367','嵩明县','3','0','');
INSERT INTO `zmt_area` VALUES ('3111','367','石林县','3','0','');
INSERT INTO `zmt_area` VALUES ('3112','367','禄劝','3','0','');
INSERT INTO `zmt_area` VALUES ('3113','367','寻甸','3','0','');
INSERT INTO `zmt_area` VALUES ('3114','368','兰坪','3','0','');
INSERT INTO `zmt_area` VALUES ('3115','368','泸水县','3','0','');
INSERT INTO `zmt_area` VALUES ('3116','368','福贡县','3','0','');
INSERT INTO `zmt_area` VALUES ('3117','368','贡山','3','0','');
INSERT INTO `zmt_area` VALUES ('3118','369','宁洱','3','0','');
INSERT INTO `zmt_area` VALUES ('3119','369','思茅区','3','0','');
INSERT INTO `zmt_area` VALUES ('3120','369','墨江','3','0','');
INSERT INTO `zmt_area` VALUES ('3121','369','景东','3','0','');
INSERT INTO `zmt_area` VALUES ('3122','369','景谷','3','0','');
INSERT INTO `zmt_area` VALUES ('3123','369','镇沅','3','0','');
INSERT INTO `zmt_area` VALUES ('3124','369','江城','3','0','');
INSERT INTO `zmt_area` VALUES ('3125','369','孟连','3','0','');
INSERT INTO `zmt_area` VALUES ('3126','369','澜沧','3','0','');
INSERT INTO `zmt_area` VALUES ('3127','369','西盟','3','0','');
INSERT INTO `zmt_area` VALUES ('3128','370','古城区','3','0','');
INSERT INTO `zmt_area` VALUES ('3129','370','宁蒗','3','0','');
INSERT INTO `zmt_area` VALUES ('3130','370','玉龙','3','0','');
INSERT INTO `zmt_area` VALUES ('3131','370','永胜县','3','0','');
INSERT INTO `zmt_area` VALUES ('3132','370','华坪县','3','0','');
INSERT INTO `zmt_area` VALUES ('3133','371','隆阳区','3','0','');
INSERT INTO `zmt_area` VALUES ('3134','371','施甸县','3','0','');
INSERT INTO `zmt_area` VALUES ('3135','371','腾冲县','3','0','');
INSERT INTO `zmt_area` VALUES ('3136','371','龙陵县','3','0','');
INSERT INTO `zmt_area` VALUES ('3137','371','昌宁县','3','0','');
INSERT INTO `zmt_area` VALUES ('3138','372','楚雄市','3','0','');
INSERT INTO `zmt_area` VALUES ('3139','372','双柏县','3','0','');
INSERT INTO `zmt_area` VALUES ('3140','372','牟定县','3','0','');
INSERT INTO `zmt_area` VALUES ('3141','372','南华县','3','0','');
INSERT INTO `zmt_area` VALUES ('3142','372','姚安县','3','0','');
INSERT INTO `zmt_area` VALUES ('3143','372','大姚县','3','0','');
INSERT INTO `zmt_area` VALUES ('3144','372','永仁县','3','0','');
INSERT INTO `zmt_area` VALUES ('3145','372','元谋县','3','0','');
INSERT INTO `zmt_area` VALUES ('3146','372','武定县','3','0','');
INSERT INTO `zmt_area` VALUES ('3147','372','禄丰县','3','0','');
INSERT INTO `zmt_area` VALUES ('3148','373','大理市','3','0','');
INSERT INTO `zmt_area` VALUES ('3149','373','祥云县','3','0','');
INSERT INTO `zmt_area` VALUES ('3150','373','宾川县','3','0','');
INSERT INTO `zmt_area` VALUES ('3151','373','弥渡县','3','0','');
INSERT INTO `zmt_area` VALUES ('3152','373','永平县','3','0','');
INSERT INTO `zmt_area` VALUES ('3153','373','云龙县','3','0','');
INSERT INTO `zmt_area` VALUES ('3154','373','洱源县','3','0','');
INSERT INTO `zmt_area` VALUES ('3155','373','剑川县','3','0','');
INSERT INTO `zmt_area` VALUES ('3156','373','鹤庆县','3','0','');
INSERT INTO `zmt_area` VALUES ('3157','373','漾濞','3','0','');
INSERT INTO `zmt_area` VALUES ('3158','373','南涧','3','0','');
INSERT INTO `zmt_area` VALUES ('3159','373','巍山','3','0','');
INSERT INTO `zmt_area` VALUES ('3160','374','潞西市','3','0','');
INSERT INTO `zmt_area` VALUES ('3161','374','瑞丽市','3','0','');
INSERT INTO `zmt_area` VALUES ('3162','374','梁河县','3','0','');
INSERT INTO `zmt_area` VALUES ('3163','374','盈江县','3','0','');
INSERT INTO `zmt_area` VALUES ('3164','374','陇川县','3','0','');
INSERT INTO `zmt_area` VALUES ('3165','375','香格里拉县','3','0','');
INSERT INTO `zmt_area` VALUES ('3166','375','德钦县','3','0','');
INSERT INTO `zmt_area` VALUES ('3167','375','维西','3','0','');
INSERT INTO `zmt_area` VALUES ('3168','376','泸西县','3','0','');
INSERT INTO `zmt_area` VALUES ('3169','376','蒙自县','3','0','');
INSERT INTO `zmt_area` VALUES ('3170','376','个旧市','3','0','');
INSERT INTO `zmt_area` VALUES ('3171','376','开远市','3','0','');
INSERT INTO `zmt_area` VALUES ('3172','376','绿春县','3','0','');
INSERT INTO `zmt_area` VALUES ('3173','376','建水县','3','0','');
INSERT INTO `zmt_area` VALUES ('3174','376','石屏县','3','0','');
INSERT INTO `zmt_area` VALUES ('3175','376','弥勒县','3','0','');
INSERT INTO `zmt_area` VALUES ('3176','376','元阳县','3','0','');
INSERT INTO `zmt_area` VALUES ('3177','376','红河县','3','0','');
INSERT INTO `zmt_area` VALUES ('3178','376','金平','3','0','');
INSERT INTO `zmt_area` VALUES ('3179','376','河口','3','0','');
INSERT INTO `zmt_area` VALUES ('3180','376','屏边','3','0','');
INSERT INTO `zmt_area` VALUES ('3181','377','临翔区','3','0','');
INSERT INTO `zmt_area` VALUES ('3182','377','凤庆县','3','0','');
INSERT INTO `zmt_area` VALUES ('3183','377','云县','3','0','');
INSERT INTO `zmt_area` VALUES ('3184','377','永德县','3','0','');
INSERT INTO `zmt_area` VALUES ('3185','377','镇康县','3','0','');
INSERT INTO `zmt_area` VALUES ('3186','377','双江','3','0','');
INSERT INTO `zmt_area` VALUES ('3187','377','耿马','3','0','');
INSERT INTO `zmt_area` VALUES ('3188','377','沧源','3','0','');
INSERT INTO `zmt_area` VALUES ('3189','378','麒麟区','3','0','');
INSERT INTO `zmt_area` VALUES ('3190','378','宣威市','3','0','');
INSERT INTO `zmt_area` VALUES ('3191','378','马龙县','3','0','');
INSERT INTO `zmt_area` VALUES ('3192','378','陆良县','3','0','');
INSERT INTO `zmt_area` VALUES ('3193','378','师宗县','3','0','');
INSERT INTO `zmt_area` VALUES ('3194','378','罗平县','3','0','');
INSERT INTO `zmt_area` VALUES ('3195','378','富源县','3','0','');
INSERT INTO `zmt_area` VALUES ('3196','378','会泽县','3','0','');
INSERT INTO `zmt_area` VALUES ('3197','378','沾益县','3','0','');
INSERT INTO `zmt_area` VALUES ('3198','379','文山县','3','0','');
INSERT INTO `zmt_area` VALUES ('3199','379','砚山县','3','0','');
INSERT INTO `zmt_area` VALUES ('3200','379','西畴县','3','0','');
INSERT INTO `zmt_area` VALUES ('3201','379','麻栗坡县','3','0','');
INSERT INTO `zmt_area` VALUES ('3202','379','马关县','3','0','');
INSERT INTO `zmt_area` VALUES ('3203','379','丘北县','3','0','');
INSERT INTO `zmt_area` VALUES ('3204','379','广南县','3','0','');
INSERT INTO `zmt_area` VALUES ('3205','379','富宁县','3','0','');
INSERT INTO `zmt_area` VALUES ('3206','380','景洪市','3','0','');
INSERT INTO `zmt_area` VALUES ('3207','380','勐海县','3','0','');
INSERT INTO `zmt_area` VALUES ('3208','380','勐腊县','3','0','');
INSERT INTO `zmt_area` VALUES ('3209','381','红塔区','3','0','');
INSERT INTO `zmt_area` VALUES ('3210','381','江川县','3','0','');
INSERT INTO `zmt_area` VALUES ('3211','381','澄江县','3','0','');
INSERT INTO `zmt_area` VALUES ('3212','381','通海县','3','0','');
INSERT INTO `zmt_area` VALUES ('3213','381','华宁县','3','0','');
INSERT INTO `zmt_area` VALUES ('3214','381','易门县','3','0','');
INSERT INTO `zmt_area` VALUES ('3215','381','峨山','3','0','');
INSERT INTO `zmt_area` VALUES ('3216','381','新平','3','0','');
INSERT INTO `zmt_area` VALUES ('3217','381','元江','3','0','');
INSERT INTO `zmt_area` VALUES ('3218','382','昭阳区','3','0','');
INSERT INTO `zmt_area` VALUES ('3219','382','鲁甸县','3','0','');
INSERT INTO `zmt_area` VALUES ('3220','382','巧家县','3','0','');
INSERT INTO `zmt_area` VALUES ('3221','382','盐津县','3','0','');
INSERT INTO `zmt_area` VALUES ('3222','382','大关县','3','0','');
INSERT INTO `zmt_area` VALUES ('3223','382','永善县','3','0','');
INSERT INTO `zmt_area` VALUES ('3224','382','绥江县','3','0','');
INSERT INTO `zmt_area` VALUES ('3225','382','镇雄县','3','0','');
INSERT INTO `zmt_area` VALUES ('3226','382','彝良县','3','0','');
INSERT INTO `zmt_area` VALUES ('3227','382','威信县','3','0','');
INSERT INTO `zmt_area` VALUES ('3228','382','水富县','3','0','');
INSERT INTO `zmt_area` VALUES ('3229','383','西湖区','3','0','');
INSERT INTO `zmt_area` VALUES ('3230','383','上城区','3','0','');
INSERT INTO `zmt_area` VALUES ('3231','383','下城区','3','0','');
INSERT INTO `zmt_area` VALUES ('3232','383','拱墅区','3','0','');
INSERT INTO `zmt_area` VALUES ('3233','383','滨江区','3','0','');
INSERT INTO `zmt_area` VALUES ('3234','383','江干区','3','0','');
INSERT INTO `zmt_area` VALUES ('3235','383','萧山区','3','0','');
INSERT INTO `zmt_area` VALUES ('3236','383','余杭区','3','0','');
INSERT INTO `zmt_area` VALUES ('3237','383','市郊','3','0','');
INSERT INTO `zmt_area` VALUES ('3238','383','建德市','3','0','');
INSERT INTO `zmt_area` VALUES ('3239','383','富阳市','3','0','');
INSERT INTO `zmt_area` VALUES ('3240','383','临安市','3','0','');
INSERT INTO `zmt_area` VALUES ('3241','383','桐庐县','3','0','');
INSERT INTO `zmt_area` VALUES ('3242','383','淳安县','3','0','');
INSERT INTO `zmt_area` VALUES ('3243','384','吴兴区','3','0','');
INSERT INTO `zmt_area` VALUES ('3244','384','南浔区','3','0','');
INSERT INTO `zmt_area` VALUES ('3245','384','德清县','3','0','');
INSERT INTO `zmt_area` VALUES ('3246','384','长兴县','3','0','');
INSERT INTO `zmt_area` VALUES ('3247','384','安吉县','3','0','');
INSERT INTO `zmt_area` VALUES ('3248','385','南湖区','3','0','');
INSERT INTO `zmt_area` VALUES ('3249','385','秀洲区','3','0','');
INSERT INTO `zmt_area` VALUES ('3250','385','海宁市','3','0','');
INSERT INTO `zmt_area` VALUES ('3251','385','嘉善县','3','0','');
INSERT INTO `zmt_area` VALUES ('3252','385','平湖市','3','0','');
INSERT INTO `zmt_area` VALUES ('3253','385','桐乡市','3','0','');
INSERT INTO `zmt_area` VALUES ('3254','385','海盐县','3','0','');
INSERT INTO `zmt_area` VALUES ('3255','386','婺城区','3','0','');
INSERT INTO `zmt_area` VALUES ('3256','386','金东区','3','0','');
INSERT INTO `zmt_area` VALUES ('3257','386','兰溪市','3','0','');
INSERT INTO `zmt_area` VALUES ('3258','386','市区','3','0','');
INSERT INTO `zmt_area` VALUES ('3259','386','佛堂镇','3','0','');
INSERT INTO `zmt_area` VALUES ('3260','386','上溪镇','3','0','');
INSERT INTO `zmt_area` VALUES ('3261','386','义亭镇','3','0','');
INSERT INTO `zmt_area` VALUES ('3262','386','大陈镇','3','0','');
INSERT INTO `zmt_area` VALUES ('3263','386','苏溪镇','3','0','');
INSERT INTO `zmt_area` VALUES ('3264','386','赤岸镇','3','0','');
INSERT INTO `zmt_area` VALUES ('3265','386','东阳市','3','0','');
INSERT INTO `zmt_area` VALUES ('3266','386','永康市','3','0','');
INSERT INTO `zmt_area` VALUES ('3267','386','武义县','3','0','');
INSERT INTO `zmt_area` VALUES ('3268','386','浦江县','3','0','');
INSERT INTO `zmt_area` VALUES ('3269','386','磐安县','3','0','');
INSERT INTO `zmt_area` VALUES ('3270','387','莲都区','3','0','');
INSERT INTO `zmt_area` VALUES ('3271','387','龙泉市','3','0','');
INSERT INTO `zmt_area` VALUES ('3272','387','青田县','3','0','');
INSERT INTO `zmt_area` VALUES ('3273','387','缙云县','3','0','');
INSERT INTO `zmt_area` VALUES ('3274','387','遂昌县','3','0','');
INSERT INTO `zmt_area` VALUES ('3275','387','松阳县','3','0','');
INSERT INTO `zmt_area` VALUES ('3276','387','云和县','3','0','');
INSERT INTO `zmt_area` VALUES ('3277','387','庆元县','3','0','');
INSERT INTO `zmt_area` VALUES ('3278','387','景宁','3','0','');
INSERT INTO `zmt_area` VALUES ('3279','388','海曙区','3','0','');
INSERT INTO `zmt_area` VALUES ('3280','388','江东区','3','0','');
INSERT INTO `zmt_area` VALUES ('3281','388','江北区','3','0','');
INSERT INTO `zmt_area` VALUES ('3282','388','镇海区','3','0','');
INSERT INTO `zmt_area` VALUES ('3283','388','北仑区','3','0','');
INSERT INTO `zmt_area` VALUES ('3284','388','鄞州区','3','0','');
INSERT INTO `zmt_area` VALUES ('3285','388','余姚市','3','0','');
INSERT INTO `zmt_area` VALUES ('3286','388','慈溪市','3','0','');
INSERT INTO `zmt_area` VALUES ('3287','388','奉化市','3','0','');
INSERT INTO `zmt_area` VALUES ('3288','388','象山县','3','0','');
INSERT INTO `zmt_area` VALUES ('3289','388','宁海县','3','0','');
INSERT INTO `zmt_area` VALUES ('3290','389','越城区','3','0','');
INSERT INTO `zmt_area` VALUES ('3291','389','上虞市','3','0','');
INSERT INTO `zmt_area` VALUES ('3292','389','嵊州市','3','0','');
INSERT INTO `zmt_area` VALUES ('3293','389','绍兴县','3','0','');
INSERT INTO `zmt_area` VALUES ('3294','389','新昌县','3','0','');
INSERT INTO `zmt_area` VALUES ('3295','389','诸暨市','3','0','');
INSERT INTO `zmt_area` VALUES ('3296','390','椒江区','3','0','');
INSERT INTO `zmt_area` VALUES ('3297','390','黄岩区','3','0','');
INSERT INTO `zmt_area` VALUES ('3298','390','路桥区','3','0','');
INSERT INTO `zmt_area` VALUES ('3299','390','温岭市','3','0','');
INSERT INTO `zmt_area` VALUES ('3300','390','临海市','3','0','');
INSERT INTO `zmt_area` VALUES ('3301','390','玉环县','3','0','');
INSERT INTO `zmt_area` VALUES ('3302','390','三门县','3','0','');
INSERT INTO `zmt_area` VALUES ('3303','390','天台县','3','0','');
INSERT INTO `zmt_area` VALUES ('3304','390','仙居县','3','0','');
INSERT INTO `zmt_area` VALUES ('3305','391','鹿城区','3','0','');
INSERT INTO `zmt_area` VALUES ('3306','391','龙湾区','3','0','');
INSERT INTO `zmt_area` VALUES ('3307','391','瓯海区','3','0','');
INSERT INTO `zmt_area` VALUES ('3308','391','瑞安市','3','0','');
INSERT INTO `zmt_area` VALUES ('3309','391','乐清市','3','0','');
INSERT INTO `zmt_area` VALUES ('3310','391','洞头县','3','0','');
INSERT INTO `zmt_area` VALUES ('3311','391','永嘉县','3','0','');
INSERT INTO `zmt_area` VALUES ('3312','391','平阳县','3','0','');
INSERT INTO `zmt_area` VALUES ('3313','391','苍南县','3','0','');
INSERT INTO `zmt_area` VALUES ('3314','391','文成县','3','0','');
INSERT INTO `zmt_area` VALUES ('3315','391','泰顺县','3','0','');
INSERT INTO `zmt_area` VALUES ('3316','392','定海区','3','0','');
INSERT INTO `zmt_area` VALUES ('3317','392','普陀区','3','0','');
INSERT INTO `zmt_area` VALUES ('3318','392','岱山县','3','0','');
INSERT INTO `zmt_area` VALUES ('3319','392','嵊泗县','3','0','');
INSERT INTO `zmt_area` VALUES ('3320','393','衢州市','3','0','');
INSERT INTO `zmt_area` VALUES ('3321','393','江山市','3','0','');
INSERT INTO `zmt_area` VALUES ('3322','393','常山县','3','0','');
INSERT INTO `zmt_area` VALUES ('3323','393','开化县','3','0','');
INSERT INTO `zmt_area` VALUES ('3324','393','龙游县','3','0','');
INSERT INTO `zmt_area` VALUES ('3325','394','合川区','3','0','');
INSERT INTO `zmt_area` VALUES ('3326','394','江津区','3','0','');
INSERT INTO `zmt_area` VALUES ('3327','394','南川区','3','0','');
INSERT INTO `zmt_area` VALUES ('3328','394','永川区','3','0','');
INSERT INTO `zmt_area` VALUES ('3329','394','南岸区','3','0','');
INSERT INTO `zmt_area` VALUES ('3330','394','渝北区','3','0','');
INSERT INTO `zmt_area` VALUES ('3331','394','万盛区','3','0','');
INSERT INTO `zmt_area` VALUES ('3332','394','大渡口区','3','0','');
INSERT INTO `zmt_area` VALUES ('3333','394','万州区','3','0','');
INSERT INTO `zmt_area` VALUES ('3334','394','北碚区','3','0','');
INSERT INTO `zmt_area` VALUES ('3335','394','沙坪坝区','3','0','');
INSERT INTO `zmt_area` VALUES ('3336','394','巴南区','3','0','');
INSERT INTO `zmt_area` VALUES ('3337','394','涪陵区','3','0','');
INSERT INTO `zmt_area` VALUES ('3338','394','江北区','3','0','');
INSERT INTO `zmt_area` VALUES ('3339','394','九龙坡区','3','0','');
INSERT INTO `zmt_area` VALUES ('3340','394','渝中区','3','0','');
INSERT INTO `zmt_area` VALUES ('3341','394','黔江开发区','3','0','');
INSERT INTO `zmt_area` VALUES ('3342','394','长寿区','3','0','');
INSERT INTO `zmt_area` VALUES ('3343','394','双桥区','3','0','');
INSERT INTO `zmt_area` VALUES ('3344','394','綦江县','3','0','');
INSERT INTO `zmt_area` VALUES ('3345','394','潼南县','3','0','');
INSERT INTO `zmt_area` VALUES ('3346','394','铜梁县','3','0','');
INSERT INTO `zmt_area` VALUES ('3347','394','大足县','3','0','');
INSERT INTO `zmt_area` VALUES ('3348','394','荣昌县','3','0','');
INSERT INTO `zmt_area` VALUES ('3349','394','璧山县','3','0','');
INSERT INTO `zmt_area` VALUES ('3350','394','垫江县','3','0','');
INSERT INTO `zmt_area` VALUES ('3351','394','武隆县','3','0','');
INSERT INTO `zmt_area` VALUES ('3352','394','丰都县','3','0','');
INSERT INTO `zmt_area` VALUES ('3353','394','城口县','3','0','');
INSERT INTO `zmt_area` VALUES ('3354','394','梁平县','3','0','');
INSERT INTO `zmt_area` VALUES ('3355','394','开县','3','0','');
INSERT INTO `zmt_area` VALUES ('3356','394','巫溪县','3','0','');
INSERT INTO `zmt_area` VALUES ('3357','394','巫山县','3','0','');
INSERT INTO `zmt_area` VALUES ('3358','394','奉节县','3','0','');
INSERT INTO `zmt_area` VALUES ('3359','394','云阳县','3','0','');
INSERT INTO `zmt_area` VALUES ('3360','394','忠县','3','0','');
INSERT INTO `zmt_area` VALUES ('3361','394','石柱','3','0','');
INSERT INTO `zmt_area` VALUES ('3362','394','彭水','3','0','');
INSERT INTO `zmt_area` VALUES ('3363','394','酉阳','3','0','');
INSERT INTO `zmt_area` VALUES ('3364','394','秀山','3','0','');
INSERT INTO `zmt_area` VALUES ('3365','395','沙田区','3','0','');
INSERT INTO `zmt_area` VALUES ('3366','395','东区','3','0','');
INSERT INTO `zmt_area` VALUES ('3367','395','观塘区','3','0','');
INSERT INTO `zmt_area` VALUES ('3368','395','黄大仙区','3','0','');
INSERT INTO `zmt_area` VALUES ('3369','395','九龙城区','3','0','');
INSERT INTO `zmt_area` VALUES ('3370','395','屯门区','3','0','');
INSERT INTO `zmt_area` VALUES ('3371','395','葵青区','3','0','');
INSERT INTO `zmt_area` VALUES ('3372','395','元朗区','3','0','');
INSERT INTO `zmt_area` VALUES ('3373','395','深水埗区','3','0','');
INSERT INTO `zmt_area` VALUES ('3374','395','西贡区','3','0','');
INSERT INTO `zmt_area` VALUES ('3375','395','大埔区','3','0','');
INSERT INTO `zmt_area` VALUES ('3376','395','湾仔区','3','0','');
INSERT INTO `zmt_area` VALUES ('3377','395','油尖旺区','3','0','');
INSERT INTO `zmt_area` VALUES ('3378','395','北区','3','0','');
INSERT INTO `zmt_area` VALUES ('3379','395','南区','3','0','');
INSERT INTO `zmt_area` VALUES ('3380','395','荃湾区','3','0','');
INSERT INTO `zmt_area` VALUES ('3381','395','中西区','3','0','');
INSERT INTO `zmt_area` VALUES ('3382','395','离岛区','3','0','');
INSERT INTO `zmt_area` VALUES ('3383','396','澳门','3','0','');
INSERT INTO `zmt_area` VALUES ('3384','397','台北','3','0','');
INSERT INTO `zmt_area` VALUES ('3385','397','高雄','3','0','');
INSERT INTO `zmt_area` VALUES ('3386','397','基隆','3','0','');
INSERT INTO `zmt_area` VALUES ('3387','397','台中','3','0','');
INSERT INTO `zmt_area` VALUES ('3388','397','台南','3','0','');
INSERT INTO `zmt_area` VALUES ('3389','397','新竹','3','0','');
INSERT INTO `zmt_area` VALUES ('3390','397','嘉义','3','0','');
INSERT INTO `zmt_area` VALUES ('3391','397','宜兰县','3','0','');
INSERT INTO `zmt_area` VALUES ('3392','397','桃园县','3','0','');
INSERT INTO `zmt_area` VALUES ('3393','397','苗栗县','3','0','');
INSERT INTO `zmt_area` VALUES ('3394','397','彰化县','3','0','');
INSERT INTO `zmt_area` VALUES ('3395','397','南投县','3','0','');
INSERT INTO `zmt_area` VALUES ('3396','397','云林县','3','0','');
INSERT INTO `zmt_area` VALUES ('3397','397','屏东县','3','0','');
INSERT INTO `zmt_area` VALUES ('3398','397','台东县','3','0','');
INSERT INTO `zmt_area` VALUES ('3399','397','花莲县','3','0','');
INSERT INTO `zmt_area` VALUES ('3400','397','澎湖县','3','0','');
INSERT INTO `zmt_area` VALUES ('3401','3','合肥','2','0','');
INSERT INTO `zmt_area` VALUES ('3402','3401','庐阳区','3','0','');
INSERT INTO `zmt_area` VALUES ('3403','3401','瑶海区','3','0','');
INSERT INTO `zmt_area` VALUES ('3404','3401','蜀山区','3','0','');
INSERT INTO `zmt_area` VALUES ('3405','3401','包河区','3','0','');
INSERT INTO `zmt_area` VALUES ('3406','3401','长丰县','3','0','');
INSERT INTO `zmt_area` VALUES ('3407','3401','肥东县','3','0','');
INSERT INTO `zmt_area` VALUES ('3408','3401','肥西县','3','0','');


/* 转存表中的数据:zmt_auth*/ 


/* 转存表中的数据:zmt_auth_cate*/ 


/* 转存表中的数据:zmt_brand*/ 
INSERT INTO `zmt_brand` VALUES ('1','金锣','50','1');
INSERT INTO `zmt_brand` VALUES ('2','得利斯','50','1');
INSERT INTO `zmt_brand` VALUES ('4','新希望六合','10','1');
INSERT INTO `zmt_brand` VALUES ('5','猪老大','10','1');
INSERT INTO `zmt_brand` VALUES ('6','牧联','10','1');


/* 转存表中的数据:zmt_config*/ 
INSERT INTO `zmt_config` VALUES ('web_site_title','卓牧通','网站的标题--中文','0');
INSERT INTO `zmt_config` VALUES ('web_site_description','卓牧通','描述','0');
INSERT INTO `zmt_config` VALUES ('web_site_keyword','卓牧通','网站搜索引擎关键字','0');
INSERT INTO `zmt_config` VALUES ('web_site_status','0','站点状态','0');
INSERT INTO `zmt_config` VALUES ('web_site_icp','鲁ICP备15030319号-5','网站备案号','0');
INSERT INTO `zmt_config` VALUES ('user_allow_register','0','是否允许用户注册','0');
INSERT INTO `zmt_config` VALUES ('web_cnzz','','','0');


/* 转存表中的数据:zmt_goods*/ 
INSERT INTO `zmt_goods` VALUES ('1','5','1','罗曼褐壳蛋鸡','罗曼褐壳蛋鸡','L');
INSERT INTO `zmt_goods` VALUES ('3','12','2','海兰褐蛋鸡苗','纯种海兰褐蛋鸡苗','H');
INSERT INTO `zmt_goods` VALUES ('4','7','4','罗曼粉壳蛋鸡','罗曼粉壳蛋鸡','L');
INSERT INTO `zmt_goods` VALUES ('5','38','6','北京鸭','北京鸭','B');
INSERT INTO `zmt_goods` VALUES ('6','45','1','绍兴鸭','绍兴鸭子','S');


/* 转存表中的数据:zmt_goods_cate*/ 
INSERT INTO `zmt_goods_cate` VALUES ('1','0','0','0_1','卓牧通','自营产品','','0','0','1');
INSERT INTO `zmt_goods_cate` VALUES ('2','0','0','0_2','销售产品','销售产品','','0','50','-1');
INSERT INTO `zmt_goods_cate` VALUES ('3','1','1','0_1_3','畜药','畜药','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('4','0','0','0_4','鸡类','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('5','4','1','0_4_5','蛋鸡','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('6','4','2','0_4_6','罗曼褐壳蛋鸡','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('7','4','2','0_4_7','罗曼粉壳蛋鸡','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('9','0','0','0_9','鸭类','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('8','1','1','0_1_8','饲料','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('11','4','1','0_4_11','肉鸡','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('12','5','2','0_4_5_12','海兰褐壳蛋鸡','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('13','5','2','0_4_5_13','洛岛红鸡','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('14','5','2','0_4_5_14','海兰白壳蛋鸡','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('10','5','2','0_4_5_10','白来航鸡','白来航鸡','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('16','0','0','0_16','鹅类','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('17','0','0','0_17','猪类','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('18','0','0','0_18','牛类','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('19','0','0','0_19','羊类','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('20','0','0','0_20','珍禽','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('21','0','0','0_21','宠物','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('22','0','0','0_22','鸽子','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('23','0','0','0_23','鹌鹑','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('24','0','0','0_24','貉子','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('25','0','0','0_25','狐狸','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('26','0','0','0_26','貂类','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('27','0','0','0_27','兔子','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('28','0','0','0_28','螃蟹','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('29','0','0','0_29','鱼类','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('30','0','0','0_30','虾类','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('31','0','0','0_31','贝类','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('32','11','2','0_4_11_32','308','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('33','0','0','','AA','','','0','10','-1');
INSERT INTO `zmt_goods_cate` VALUES ('34','11','2','0_4_11_34','AA','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('35','9','1','0_9_35','肉鸭','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('36','9','1','0_9_36','蛋鸭','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('37','35','2','0_9_35_37','樱桃谷','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('38','35','2','0_9_35_38','北京鸭','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('39','35','2','0_9_35_39','天府肉鸭','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('40','35','2','0_9_35_40','狄高鸭','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('41','35','2','0_9_35_41','海格鸭','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('42','35','2','0_9_35_42','克里默瘤头鸭','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('43','35','2','0_9_35_43','瘤头鸭','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('44','36','2','0_9_36_44','金定鸭','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('45','36','2','0_9_36_45','绍兴鸭','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('46','36','2','0_9_36_46','高邮鸭','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('47','36','2','0_9_36_47','地方土鸭','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('48','16','1','0_16_48','肉鹅','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('49','11','2','0_4_11_49','科宝','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('50','11','2','0_4_11_50','哈伯德','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('51','5','2','0_4_5_51','农大三号','农大三号','','0','10','1');
INSERT INTO `zmt_goods_cate` VALUES ('52','5','2','0_4_5_52','伊沙褐壳蛋鸡','伊沙褐壳蛋鸡','','0','10','1');
INSERT INTO `zmt_goods_cate` VALUES ('53','5','2','0_4_5_53','星杂579','星杂579','','0','10','1');
INSERT INTO `zmt_goods_cate` VALUES ('54','5','2','0_4_5_54','花凤鸡','花凤鸡','','0','10','1');
INSERT INTO `zmt_goods_cate` VALUES ('55','5','2','0_4_5_55','芦花鸡','芦花鸡','','0','10','1');
INSERT INTO `zmt_goods_cate` VALUES ('15','5','2','0_4_5_15','洛岛红','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('225','223','2','0_19_223_225','小尾寒羊','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('56','5','2','0_4_5_56','绿壳蛋鸡','','','0','10','1');
INSERT INTO `zmt_goods_cate` VALUES ('57','5','2','0_4_5_57','京粉壳蛋鸡','','','0','10','1');
INSERT INTO `zmt_goods_cate` VALUES ('58','5','2','0_4_5_58','京白壳蛋鸡','','','0','10','1');
INSERT INTO `zmt_goods_cate` VALUES ('59','5','2','0_4_5_59','新汉夏鸡','','','0','10','1');
INSERT INTO `zmt_goods_cate` VALUES ('60','5','2','0_4_5_60','澳洲黑鸡','澳洲黑鸡','','0','10','1');
INSERT INTO `zmt_goods_cate` VALUES ('61','5','2','0_4_5_61','洛克鸡','','','0','10','1');
INSERT INTO `zmt_goods_cate` VALUES ('62','5','2','0_4_5_62','狼山鸡','狼山鸡','','0','10','1');
INSERT INTO `zmt_goods_cate` VALUES ('63','5','2','0_4_5_63','九斤鸡','九斤鸡','','0','10','1');
INSERT INTO `zmt_goods_cate` VALUES ('64','5','2','0_4_5_64','丝毛乌骨鸡','丝毛乌骨鸡','','0','10','1');
INSERT INTO `zmt_goods_cate` VALUES ('65','5','2','0_4_5_65','地方土鸡','','','0','10','1');
INSERT INTO `zmt_goods_cate` VALUES ('66','11','2','0_4_11_66','817','','','0','10','1');
INSERT INTO `zmt_goods_cate` VALUES ('67','11','2','0_4_11_67','黑腿麻鸡','黑腿麻鸡','','0','10','1');
INSERT INTO `zmt_goods_cate` VALUES ('68','11','2','0_4_11_68','青腿麻鸡','青腿麻鸡','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('69','11','2','0_4_11_69','红玉','红玉','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('70','11','2','0_4_11_70','红杂交','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('71','11','2','0_4_11_71','白杂交','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('72','11','2','0_4_11_72','三黄鸡','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('73','11','2','0_4_11_73','柴鸡（土鸡）','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('74','11','2','0_4_11_74','火鸡','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('75','11','2','0_4_11_75','黄羽肉鸡','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('76','11','2','0_4_11_76','山鸡','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('77','48','2','0_16_48_77','狮头鹅','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('78','48','2','0_16_48_78','马冈鹅','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('79','48','2','0_16_48_79','溆浦鹅','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('80','48','2','0_16_48_80','浙东鹅','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('81','48','2','0_16_48_81','四川白鹅','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('82','48','2','0_16_48_82','皖西白鹅','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('83','16','1','0_16_83','蛋鹅','蛋鹅','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('84','83','2','0_16_83_84','豁眼鹅','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('85','83','2','0_16_83_85','雁鹅','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('86','83','2','0_16_83_86','朗德鹅','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('87','83','2','0_16_83_87','鸿雁鹅','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('88','83','2','0_16_83_88','家鹅','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('89','83','2','0_16_83_89','马冈鹅','马冈鹅','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('90','83','2','0_16_83_90','狮头鹅','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('91','83','2','0_16_83_91','莱茵鹅','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('92','83','2','0_16_83_92','四川白鹅','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('93','83','2','0_16_83_93','乌鬃鹅','乌鬃鹅','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('94','83','2','0_16_83_94','灰鹅','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('95','83','2','0_16_83_95','溆浦鹅','溆浦鹅','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('96','3','2','0_1_3_96','抗病毒类','抗病毒类','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('97','3','2','0_1_3_97','抗菌消炎类','抗菌消炎类','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('98','3','2','0_1_3_98','呼吸道类','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('99','3','2','0_1_3_99','抗原虫类','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('100','3','2','0_1_3_100','抗寄生虫类','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('101','3','2','0_1_3_101','营养保健类','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('102','3','2','0_1_3_102','保肝护肾类','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('103','3','2','0_1_3_103','健胃增食类','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('104','3','2','0_1_3_104','消毒剂类','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('105','3','2','0_1_3_105','疫苗类','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('106','3','2','0_1_3_106','驱蚊蝇类','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('107','8','2','0_1_8_107','开口饲料','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('108','8','2','0_1_8_108','育成期饲料','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('109','8','2','0_1_8_109','产蛋期饲料(哺乳期饲料)','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('110','8','2','0_1_8_110','育肥期饲料','育肥期饲料','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('111','17','1','0_17_111','白猪系列','白猪系列','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('112','111','2','0_17_111_112','太湖系','太湖系','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('113','111','2','0_17_111_113','长白系','长白系','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('114','111','2','0_17_111_114','大白系','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('115','111','2','0_17_111_115','二元猪','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('116','111','2','0_17_111_116','三元猪','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('117','111','2','0_17_111_117','地方杂交白猪','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('118','111','2','0_17_111_118','苏白猪','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('119','111','2','0_17_111_119','皮特兰猪','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('120','111','2','0_17_111_120','三江白猪','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('121','111','2','0_17_111_121','广西白猪','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('122','111','2','0_17_111_122','湖北白猪','湖北白猪','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('123','111','2','0_17_111_123','上海白猪','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('124','111','2','0_17_111_124','赣州白猪','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('125','111','2','0_17_111_125','汉中白猪','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('126','111','2','0_17_111_126','伊犁白猪','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('127','111','2','0_17_111_127','哈尔贝白猪','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('128','111','2','0_17_111_128','浙江中白猪','浙江中白猪','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('129','17','1','0_17_129','黑猪系列','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('130','129','2','0_17_129_130','地方杂交黑猪','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('131','129','2','0_17_129_131','北京黑猪','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('132','129','2','0_17_129_132','杜洛克','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('133','129','2','0_17_129_133','东北民猪','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('134','129','2','0_17_129_134','华中两头乌猪','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('135','129','2','0_17_129_135','黄淮海黑猪','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('136','129','2','0_17_129_136','汉普夏猪','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('137','129','2','0_17_129_137','汉江黑猪','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('138','129','2','0_17_129_138','沂蒙黑猪','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('139','129','2','0_17_129_139','粤东黑猪','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('140','129','2','0_17_129_140','海南黑猪','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('141','129','2','0_17_129_141','滇南小耳猪','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('142','129','2','0_17_129_142','蓝塘猪','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('143','129','2','0_17_129_143','香猪','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('144','129','2','0_17_129_144','隆林猪','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('145','129','2','0_17_129_145','槐猪','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('146','129','2','0_17_129_146','五指山猪','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('147','129','2','0_17_129_147','宁乡猪','宁乡猪','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('148','129','2','0_17_129_148','湘西黑猪','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('149','129','2','0_17_129_149','大围子猪','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('150','129','2','0_17_129_150','浙江金华猪','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('151','129','2','0_17_129_151','大花白猪','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('152','129','2','0_17_129_152','龙游乌猪','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('153','129','2','0_17_129_153','玉江猪','玉江猪','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('154','129','2','0_17_129_154','武夷黑猪','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('155','129','2','0_17_129_155','清平猪','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('156','129','2','0_17_129_156','南阳黑猪（八眉猪）','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('157','129','2','0_17_129_157','莆田猪','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('158','129','2','0_17_129_158','福州黑猪','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('159','129','2','0_17_129_159','太湖黑猪系','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('160','129','2','0_17_129_160','姜曲海猪','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('161','129','2','0_17_129_161','东串猪','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('162','129','2','0_17_129_162','虹桥猪','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('163','129','2','0_17_129_163','皖南黑猪','皖南黑猪','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('164','129','2','0_17_129_164','阳新猪','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('165','129','2','0_17_129_165','山西黑猪','山西黑猪','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('166','129','2','0_17_129_166','荣昌猪','荣昌猪','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('167','129','2','0_17_129_167','藏猪','藏猪','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('168','129','2','0_17_129_168','内江猪','内江猪','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('169','129','2','0_17_129_169','新金猪','新金猪','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('170','17','1','0_17_170','花猪系列','花猪系列','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('171','170','2','0_17_170_171','东北花猪（乐平猪）','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('172','170','2','0_17_170_172','泛农花猪','泛农花猪','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('173','170','2','0_17_170_173','广东大花猪','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('174','170','2','0_17_170_174','两广小花猪','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('175','170','2','0_17_170_175','闽北花猪','闽北花猪','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('176','170','2','0_17_170_176','嵊县花猪','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('177','170','2','0_17_170_177','杭猪','杭猪','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('178','170','2','0_17_170_178','赣中南花猪','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('179','170','2','0_17_170_179','皖南花猪','皖南花猪','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('180','170','2','0_17_170_180','新淮猪','新淮猪','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('181','18','1','0_18_181','肉牛','肉牛','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('182','181','2','0_18_181_182','西门塔尔牛','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('183','181','2','0_18_181_183','夏洛莱牛','夏洛莱牛','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('184','181','2','0_18_181_184','利木赞牛','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('185','181','2','0_18_181_185','鲁西黄牛','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('186','181','2','0_18_181_186','三元杂交牛','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('187','181','2','0_18_181_187','黑牛','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('188','181','2','0_18_181_188','秦川牛','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('189','181','2','0_18_181_189','抗旱王牛','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('190','181','2','0_18_181_190','日本黑毛和牛','日本黑毛和牛','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('191','181','2','0_18_181_191','短角牛','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('192','181','2','0_18_181_192','安格斯牛','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('193','181','2','0_18_181_193','皮埃蒙特牛','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('194','181','2','0_18_181_194','海福特牛','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('195','18','1','0_18_195','奶牛','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('196','195','2','0_18_195_196','黑花牛','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('197','195','2','0_18_195_197','中国黑白花牛','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('198','195','2','0_18_195_198','荷斯坦奶牛','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('199','195','2','0_18_195_199','娟珊牛','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('200','195','2','0_18_195_200','爱尔夏牛','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('201','195','2','0_18_195_201','丹麦红牛','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('202','195','2','0_18_195_202','瑞士褐牛','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('203','19','1','0_19_203','山羊','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('204','203','2','0_19_203_204','青山羊','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('205','203','2','0_19_203_205','波尔山羊','波尔山羊','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('206','203','2','0_19_203_206','黄淮山羊','黄淮山羊','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('207','203','2','0_19_203_207','马头山羊','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('208','203','2','0_19_203_208','陕南白山羊','陕南白山羊','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('209','203','2','0_19_203_209','贵州白山羊','贵州白山羊','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('210','203','2','0_19_203_210','圭山山羊','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('211','203','2','0_19_203_211','建昌黑山羊','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('212','203','2','0_19_203_212','关中奶山羊','关中奶山羊','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('213','203','2','0_19_203_213','新疆山羊','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('214','203','2','0_19_203_214','西藏山羊','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('215','203','2','0_19_203_215','内蒙古绒山羊','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('216','203','2','0_19_203_216','宜昌白山羊','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('217','203','2','0_19_203_217','太行山羊','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('218','203','2','0_19_203_218','河西绒山羊','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('219','203','2','0_19_203_219','成都麻羊','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('220','203','2','0_19_203_220','龙陵山羊','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('221','203','2','0_19_203_221','陇东黑山羊','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('222','203','2','0_19_203_222','杂交山羊','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('223','19','1','0_19_223','绵羊','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('224','223','2','0_19_223_224','兰州大尾羊','兰州大尾羊','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('226','223','2','0_19_223_226','大尾寒羊','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('227','223','2','0_19_223_227','岷县黑裘皮羊','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('228','223','2','0_19_223_228','同羊','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('229','223','2','0_19_223_229','和田羊','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('230','223','2','0_19_223_230','阿勒泰羊','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('231','223','2','0_19_223_231','哈萨克羊','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('232','223','2','0_19_223_232','巴音布鲁克羊','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('233','223','2','0_19_223_233','乌珠穆沁羊','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('234','223','2','0_19_223_234','西藏羊','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('235','223','2','0_19_223_235','茨盖羊','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('236','223','2','0_19_223_236','颇尔华斯羊','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('237','223','2','0_19_223_237','斯达夫洛波羊','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('238','223','2','0_19_223_238','高加索羊','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('239','223','2','0_19_223_239','中国卡拉库而羊','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('240','223','2','0_19_223_240','中国美利奴羊','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('241','223','2','0_19_223_241','敖汉细毛羊','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('242','223','2','0_19_223_242','甘肃高山细毛羊','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('243','223','2','0_19_223_243','内蒙古细毛羊','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('244','223','2','0_19_223_244','贵德黑裘皮羊','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('245','223','2','0_19_223_245','丽江绵羊','丽江绵羊','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('246','223','2','0_19_223_246','昭通绵羊','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('247','223','2','0_19_223_247','威宁绵羊','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('248','223','2','0_19_223_248','杂交绵羊','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('249','20','1','0_20_249','鸡类','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('250','249','2','0_20_249_250','珍珠鸡','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('251','249','2','0_20_249_251','乌鸡','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('252','249','2','0_20_249_252','贵妃鸡','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('253','249','2','0_20_249_253','白马鸡','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('254','249','2','0_20_249_254','中华鹧鸪','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('255','249','2','0_20_249_255','黑鸡','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('256','249','2','0_20_249_256','松鸡','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('257','249','2','0_20_249_257','白鹇','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('258','249','2','0_20_249_258','红腹锦鸡','红腹锦鸡','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('259','249','2','0_20_249_259','锦鸡','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('260','249','2','0_20_249_260','闽南火鸡','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('261','249','2','0_20_249_261','七彩山鸡','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('262','249','2','0_20_249_262','鹧鸪','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('263','20','1','0_20_263','鸟类','鸟类','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('264','263','2','0_20_263_264','孔雀','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('265','263','2','0_20_263_265','画眉','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('266','263','2','0_20_263_266','八哥','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('267','263','2','0_20_263_267','鹦鹉','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('268','263','2','0_20_263_268','百灵','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('269','263','2','0_20_263_269','黑水鸭','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('270','263','2','0_20_263_270','金丝雀','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('271','263','2','0_20_263_271','天鹅','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('272','263','2','0_20_263_272','鶴类','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('273','263','2','0_20_263_273','朱鹮','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('274','263','2','0_20_263_274','鸳鸯','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('275','263','2','0_20_263_275','白鹭','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('276','263','2','0_20_263_276','鹈鹕','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('277','263','2','0_20_263_277','鹰','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('278','21','1','0_21_278','狗','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('279','278','2','0_21_278_279','柴犬','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('280','278','2','0_21_278_280','比熊犬','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('281','278','2','0_21_278_281','博美犬','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('282','278','2','0_21_278_282','贵宾犬','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('283','278','2','0_21_278_283','美国恶霸犬','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('284','278','2','0_21_278_284','泰迪犬','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('285','278','2','0_21_278_285','萨摩耶犬','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('286','278','2','0_21_278_286','黑狼犬','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('287','278','2','0_21_278_287','狼青','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('288','278','2','0_21_278_288','大头猎犬','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('289','278','2','0_21_278_289','草狗','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('290','278','2','0_21_278_290','斗牛犬','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('291','278','2','0_21_278_291','拉布拉多犬','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('292','278','2','0_21_278_292','吉娃娃犬','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('293','278','2','0_21_278_293','比特犬','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('294','278','2','0_21_278_294','袖狗','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('295','278','2','0_21_278_295','黑贝','黑贝','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('296','278','2','0_21_278_296','秋田犬','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('297','278','2','0_21_278_297','卡斯罗犬','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('298','278','2','0_21_278_298','沙皮犬','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('299','278','2','0_21_278_299','蝴蝶犬','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('300','278','2','0_21_278_300','德国牧羊犬','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('301','278','2','0_21_278_301','边境牧羊犬','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('302','278','2','0_21_278_302','苏格兰牧羊犬','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('303','278','2','0_21_278_303','银狐犬','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('304','278','2','0_21_278_304','小鹿犬','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('305','278','2','0_21_278_305','柯基犬','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('306','278','2','0_21_278_306','贝灵顿梗犬','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('307','278','2','0_21_278_307','西伯利亚雪橇犬','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('308','278','2','0_21_278_308','苏联红犬','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('309','278','2','0_21_278_309','藏獒','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('310','278','2','0_21_278_310','雪獒','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('311','278','2','0_21_278_311','西班牙獒','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('312','278','2','0_21_278_312','松狮犬杜高犬','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('313','278','2','0_21_278_313','格力犬','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('314','278','2','0_21_278_314','大丹犬','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('315','278','2','0_21_278_315','约克夏犬','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('316','278','2','0_21_278_316','圣伯纳犬','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('317','278','2','0_21_278_317','阿富汗猎犬','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('318','278','2','0_21_278_318','杜宾犬','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('319','278','2','0_21_278_319','大白熊犬','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('320','278','2','0_21_278_320','哈士奇犬','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('321','21','1','0_21_321','猫','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('322','321','2','0_21_321_322','中华田园猫','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('323','321','2','0_21_321_323','中国狸花猫','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('324','321','2','0_21_321_324','山东狮子猫','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('325','321','2','0_21_321_325','东方猫','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('326','321','2','0_21_321_326','东奇尼猫','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('327','321','2','0_21_321_327','茶杯猫','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('328','321','2','0_21_321_328','异国短毛猫','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('329','321','2','0_21_321_329','英国短毛猫','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('330','321','2','0_21_321_330','美国短毛猫','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('331','321','2','0_21_321_331','重点色短毛猫','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('332','321','2','0_21_321_332','金吉拉猫','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('333','321','2','0_21_321_333','挪威森林猫','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('334','321','2','0_21_321_334','苏格兰折耳猫','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('335','321','2','0_21_321_335','波斯猫','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('336','321','2','0_21_321_336','蓝猫','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('337','321','2','0_21_321_337','天使猫','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('338','321','2','0_21_321_338','孟加拉豹猫','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('339','321','2','0_21_321_339','布偶猫','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('340','321','2','0_21_321_340','暹罗猫','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('341','321','2','0_21_321_341','麒麟猫','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('342','321','2','0_21_321_342','喜马拉雅种猫','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('343','321','2','0_21_321_343','临清狮猫','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('344','321','2','0_21_321_344','皮堡斯猫','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('345','321','2','0_21_321_345','埃及猫','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('346','321','2','0_21_321_346','土耳其梵猫','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('347','321','2','0_21_321_347','土耳其安哥拉猫','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('348','321','2','0_21_321_348','狮子猫','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('349','321','2','0_21_321_349','孟买猫','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('350','321','2','0_21_321_350','巴厘猫','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('351','321','2','0_21_321_351','加拿大无毛猫','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('352','321','2','0_21_321_352','玄猫','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('353','321','2','0_21_321_353','虎斑猫','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('354','321','2','0_21_321_354','薮猫','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('355','321','2','0_21_321_355','阿比西尼亚猫','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('356','321','2','0_21_321_356','日本短尾猫','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('357','321','2','0_21_321_357','卡尔特猫','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('358','321','2','0_21_321_358','奥西猫','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('359','321','2','0_21_321_359','波米拉猫','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('360','321','2','0_21_321_360','哈瓦那猫','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('361','321','2','0_21_321_361','柯尼斯卷毛猫','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('362','321','2','0_21_321_362','塞尔凯克卷毛猫','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('363','321','2','0_21_321_363','德文卷毛猫','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('364','321','2','0_21_321_364','克拉特猫','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('365','321','2','0_21_321_365','伯曼猫','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('366','321','2','0_21_321_366','欧洲缅甸猫','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('367','321','2','0_21_321_367','内华达猫','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('368','321','2','0_21_321_368','沙特尔猫','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('369','321','2','0_21_321_369','索马里猫','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('370','321','2','0_21_321_370','斯芬克斯猫','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('371','321','2','0_21_321_371','威尔士猫','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('372','321','2','0_21_321_372','新加坡猫','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('373','22','1','0_22_373','肉鸽','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('374','373','2','0_22_373_374','美国落地王鸽','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('375','373','2','0_22_373_375','白羽王鸽','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('376','373','2','0_22_373_376','努鸽','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('377','373','2','0_22_373_377','球星鸽','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('378','373','2','0_22_373_378','元宝鸽','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('379','373','2','0_22_373_379','银王鸽','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('380','373','2','0_22_373_380','蒙丹鸽','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('381','373','2','0_22_373_381','贺姆鸽','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('382','373','2','0_22_373_382','石岐鸽','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('383','22','1','0_22_383','信鸽','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('384','22','1','0_22_384','观赏鸽','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('385','384','2','0_22_384_385','丝羽鸽','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('386','384','2','0_22_384_386','芙蓉鸽','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('387','384','2','0_22_384_387','凤尾鸽','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('388','384','2','0_22_384_388','燕子鸽','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('389','384','2','0_22_384_389','金鱼鸽','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('390','384','2','0_22_384_390','大尾鸽','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('391','384','2','0_22_384_391','白鸽','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('392','384','2','0_22_384_392','花丽虎鸽','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('393','384','2','0_22_384_393','四边白鸽','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('394','384','2','0_22_384_394','黑顶盖鸽','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('395','384','2','0_22_384_395','两头乌鸽','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('396','384','2','0_22_384_396','两头红鸽','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('397','384','2','0_22_384_397','淑女鸽','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('398','27','1','0_27_398','肉兔','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('399','398','2','0_27_398_399','中国白兔','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('400','398','2','0_27_398_400','塔兔','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('401','398','2','0_27_398_401','哈尔滨大白兔','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('402','398','2','0_27_398_402','八点黑兔','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('403','398','2','0_27_398_403','豫丰黄兔','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('404','398','2','0_27_398_404','懒兔','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('405','398','2','0_27_398_405','喜马拉雅兔','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('406','398','2','0_27_398_406','花巨兔','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('407','398','2','0_27_398_407','福建黄兔','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('408','398','2','0_27_398_408','银狐兔','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('409','398','2','0_27_398_409','贝韦伦兔','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('410','398','2','0_27_398_410','巨型花明兔','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('411','398','2','0_27_398_411','加利福尼亚兔','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('412','398','2','0_27_398_412','比利时兔（马兔）','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('413','398','2','0_27_398_413','艾哥肉兔','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('414','398','2','0_27_398_414','伊拉兔','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('415','398','2','0_27_398_415','公羊兔','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('416','27','1','0_27_416','长毛兔','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('417','416','2','0_27_416_417','安哥拉长毛兔','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('418','416','2','0_27_416_418','浙西长毛兔','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('419','416','2','0_27_416_419','西德长毛兔','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('420','416','2','0_27_416_420','新美系懒兔','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('421','416','2','0_27_416_421','法系懒兔','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('422','416','2','0_27_416_422','新西兰兔','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('423','416','2','0_27_416_423','塞北兔','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('424','416','2','0_27_416_424','虎皮黄兔','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('425','416','2','0_27_416_425','莲山黑兔','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('426','416','2','0_27_416_426','伊拉兔','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('427','416','2','0_27_416_427','野兔','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('428','416','2','0_27_416_428','青紫蓝兔','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('429','28','1','0_28_429','淡水蟹','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('430','28','1','0_28_430','咸水蟹','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('431','29','1','0_29_431','淡水鱼','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('432','431','2','0_29_431_432','鲤鱼','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('433','431','2','0_29_431_433','鲫鱼','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('434','431','2','0_29_431_434','草鱼','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('435','431','2','0_29_431_435','鲇鱼','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('436','431','2','0_29_431_436','黄鳝','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('437','431','2','0_29_431_437','鲢鱼','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('438','29','1','0_29_438','咸水鱼','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('439','438','2','0_29_438_439','带鱼','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('440','30','1','0_30_440','淡水虾','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('441','30','1','0_30_441','咸水虾','','','0','50','1');
INSERT INTO `zmt_goods_cate` VALUES ('442','31','1','0_31_442','淡水螺','','','0','50','1');


/* 转存表中的数据:zmt_goods_detail*/ 
INSERT INTO `zmt_goods_detail` VALUES ('1','1','1','自家养殖罗曼褐壳蛋鸡','img','','0','0000-00-00 00:00:00','0000-00-00 00:00:00');


/* 转存表中的数据:zmt_goods_img*/ 


/* 转存表中的数据:zmt_goods_spec*/ 
INSERT INTO `zmt_goods_spec` VALUES ('1','1','1','鸡苗','100.0000','16.0000','10.0000','0');
INSERT INTO `zmt_goods_spec` VALUES ('2','1','1','幼鸡','10.0000','16.0000','10.0000','0');


/* 转存表中的数据:zmt_goods_stock*/ 


/* 转存表中的数据:zmt_need*/ 


/* 转存表中的数据:zmt_note*/ 


/* 转存表中的数据:zmt_note_cate*/ 


/* 转存表中的数据:zmt_order*/ 


/* 转存表中的数据:zmt_order_log*/ 


/* 转存表中的数据:zmt_shop*/ 
INSERT INTO `zmt_shop` VALUES ('1','1','卓牧通','admin','93be24541521e6fe437c5ca3dfaf5a82','王小明','17853391882','22','296','2437','36.6813308172,119.14308218667','山东省潍坊市','','1','2018-06-12 16:15:00','2018-06-12 16:15:00','2018-06-24 03:49:08','0','0.0000','0.0000','1');
INSERT INTO `zmt_shop` VALUES ('2','1','天毅帆','tianyifan','93be24541521e6fe437c5ca3dfaf5a82','王小明','17853391882','3','0','0','','山东潍坊','<p>测试描述</p>','-2','2018-06-21 14:17:12','','2018-06-21 15:24:47','','0.0000','0.0000','1');


/* 转存表中的数据:zmt_shop_auth*/ 
INSERT INTO `zmt_shop_auth` VALUES ('1','查看附近专家','','','find/id/3','0','50','0000-00-00 00:00:00','0000-00-00 00:00:00');
INSERT INTO `zmt_shop_auth` VALUES ('2','查看附近会员','','','find/id/0','0','50','0000-00-00 00:00:00','0000-00-00 00:00:00');
INSERT INTO `zmt_shop_auth` VALUES ('3','发布文章','','','','0','50','0000-00-00 00:00:00','0000-00-00 00:00:00');


/* 转存表中的数据:zmt_shop_cate*/ 
INSERT INTO `zmt_shop_cate` VALUES ('1','自营','本自营店铺为卓牧通平台自营商品，平台保证产品的质量和服务，请放心购买！','2018-06-12 16:15:00','2018-06-19 12:05:08','1,2,3');
INSERT INTO `zmt_shop_cate` VALUES ('2','饲养户','饲养户是为全国各地大小型养殖场提供务的平台管理入口，饲养户可在本平台下发布产品信息，发布养殖信息，查看专家、物流车辆、采购信息等功能。','2018-06-12 16:15:00','2018-06-19 12:05:39','');
INSERT INTO `zmt_shop_cate` VALUES ('3','工厂','本模块为饲料厂、兽药厂等单位提供了发布产品信息的入口，可为厂家的业务拓展提供有效帮助。功能主要有，上传产品信息，查看养殖信息等。','2018-06-12 16:15:00','2018-06-19 12:06:08','');
INSERT INTO `zmt_shop_cate` VALUES ('4','专家','专家入口为各类养殖专家提供信息获取及信息发布的平台，专家可查看养殖场信息，其它专家发布的信息，采购商信息等功能。','2018-06-12 16:15:00','2018-06-19 12:06:29','');
INSERT INTO `zmt_shop_cate` VALUES ('5','物流运输','本模块为养殖行业提供物流服务的运输车辆或者运输单位提供信息发布和交流的平台。','2018-06-12 16:15:00','2018-06-19 12:06:50','');
INSERT INTO `zmt_shop_cate` VALUES ('6','收购商','采购商可为各种蛋类、肉类、禽类收购商提供收购信息发布，养殖信息查看，行情信息查看提供服务人口。','2018-06-18 00:12:47','2018-06-19 12:07:12','');


/* 转存表中的数据:zmt_shop_group*/ 
INSERT INTO `zmt_shop_group` VALUES ('1','1','96','1','1','');
INSERT INTO `zmt_shop_group` VALUES ('2','1','3','2','1','');


/* 转存表中的数据:zmt_shop_group_auth*/ 
INSERT INTO `zmt_shop_group_auth` VALUES ('1','发布商品','','plus','1');
INSERT INTO `zmt_shop_group_auth` VALUES ('2','发布文章','','plus','1');
INSERT INTO `zmt_shop_group_auth` VALUES ('3','查看文章','','plus','1');


/* 转存表中的数据:zmt_shop_info*/ 
INSERT INTO `zmt_shop_info` VALUES ('1','注册名称','1','','1');
INSERT INTO `zmt_shop_info` VALUES ('2','注册地址','1','','1');
INSERT INTO `zmt_shop_info` VALUES ('3','店铺地址','1','','1');
INSERT INTO `zmt_shop_info` VALUES ('4','联系电话','1','','1');
INSERT INTO `zmt_shop_info` VALUES ('5','营业执照','6','','1');
INSERT INTO `zmt_shop_info` VALUES ('6','推荐码','1','','0');


/* 转存表中的数据:zmt_shop_info_detail*/ 


/* 转存表中的数据:zmt_spec*/ 
INSERT INTO `zmt_spec` VALUES ('1','头');
INSERT INTO `zmt_spec` VALUES ('2','只');
INSERT INTO `zmt_spec` VALUES ('3','公斤');
INSERT INTO `zmt_spec` VALUES ('4','尾');
INSERT INTO `zmt_spec` VALUES ('5','克');
INSERT INTO `zmt_spec` VALUES ('6','吨');
INSERT INTO `zmt_spec` VALUES ('7','条');
INSERT INTO `zmt_spec` VALUES ('8','两');


/* 转存表中的数据:zmt_spread*/ 
