drop table if exists emp_customer;
create table emp_customer
(
   id                       bigint(20) unsigned not null comment 'id 主键',
   user_id                  bigint(20) unsigned not null comment '用户ID',
   customer_name            VARCHAR(64) NOT NULL COMMENT '用户真实姓名',
   identity_card_type       integer(4) NOT NULL DEFAULT 1 COMMENT '证件类型：1 身份证，2 军官证，3 护照',
   identity_card_no         VARCHAR(32) COMMENT '证件号码',
   user_point               INT NOT NULL DEFAULT 0 COMMENT '用户积分',
   customer_level           integer(4) NOT NULL DEFAULT 1 COMMENT '会员级别：1 普通会员，2 青铜，3白银，4黄金，5钻石',
   user_money               DECIMAL(12, 4) NOT NULL DEFAULT 0.0000 COMMENT '用户余额',
   primary key (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
alter table emp_customer comment '电商用户表';


drop table if exists emp_customer_level;
create table emp_customer_level
(
   id                       bigint(20) unsigned not null comment 'id 主键',
   level_name               VARCHAR(10) NOT NULL COMMENT '会员级别名称',
   min_point                INT UNSIGNED NOT NULL DEFAULT 0 COMMENT '该级别最低积分',
   max_point                INT UNSIGNED NOT NULL DEFAULT 0 COMMENT '该级别最高积分',
   vbsc_meta_spec           integer(16) unsigned comment '元类型-基础字段',
   vbsc_mspec_desc          varchar(256) comment '元类型描述',
   vbsc_creator             varchar(128) comment '创建者',
   vbsc_create_date         datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   vbsc_modifier            varchar(128) comment '修改人',
   vbsc_modify_date         datetime not null default CURRENT_TIMESTAMP comment '新增时同创建时间',
   vbsc_use_stat            smallint not null default 1 comment '可用状态',
   vbsc_busi_type           int(8) comment '业务类型状态',
   vbsc_uni_version         integer(16) not null comment '版本号',
   vbsc_uni_timestamp       datetime not null default CURRENT_TIMESTAMP comment '时间戳',
   vbsc_partition_id        integer(8) unsigned comment '分区ID',
   vbsc_txid                bigint(20) unsigned comment '事务流水号',
   vbsc_notes               varchar(2000) comment '备注',
   vkp_fld1                 varchar(128) comment '保留字段1',
   vkp_fld2                 varchar(128) comment '保留字段2',
   vkp_fld3                 varchar(256) comment '保留字段3',
   vkp_fld4                 varchar(256) comment '保留字段4',
   vkp_fld5                 varchar(512) comment '保留字段5',
   vkp_fld6                 varchar(512) comment '保留字段6',
   vdblg_users              varchar(512) comment '所属人员，为空则数据均可访问，非空则只有指定人员访问',
   vdblg_orgnizations       varchar(512) comment '所属组织，非空表示指定组织结构下的人员可以访问',
   region                   varchar(255) comment '区域',
   primary key (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

 alter table emp_customer_level comment '用户等级表';

  drop table if exists emp_customer_addr

 create table emp_customer_addr
(
   id                       bigint(20) unsigned not null comment 'id 主键',
   customer_id              INT UNSIGNED NOT NULL COMMENT 'customer_login表的自增ID',
   zip_code                 varchar(32) NOT NULL COMMENT '邮编',
   province                 varchar(64) NOT NULL COMMENT '地区表中省份',
   city                     varchar(64) NOT NULL COMMENT '地区表中城市',
   district                 varchar(64) NOT NULL COMMENT '地区表中的区',
   address                  VARCHAR(256) NOT NULL COMMENT '具体的地址门牌号',
   is_default               TINYINT(1) NOT NULL default 0  COMMENT '是否默认,0否1是',
   vbsc_meta_spec           integer(16) unsigned comment '元类型-基础字段',
   vbsc_mspec_desc          varchar(256) comment '元类型描述',
   vbsc_creator             varchar(128) comment '创建者',
   vbsc_create_date         datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   vbsc_modifier            varchar(128) comment '修改人',
   vbsc_modify_date         datetime not null default CURRENT_TIMESTAMP comment '新增时同创建时间',
   vbsc_use_stat            smallint not null default 1 comment '可用状态',
   vbsc_busi_type           int(8) comment '业务类型状态',
   vbsc_uni_version         integer(16) not null comment '版本号',
   vbsc_uni_timestamp       datetime not null default CURRENT_TIMESTAMP comment '时间戳',
   vbsc_partition_id        integer(8) unsigned comment '分区ID',
   vbsc_txid                bigint(20) unsigned comment '事务流水号',
   vbsc_notes               varchar(2000) comment '备注',
   vkp_fld1                 varchar(128) comment '保留字段1',
   vkp_fld2                 varchar(128) comment '保留字段2',
   vkp_fld3                 varchar(256) comment '保留字段3',
   vkp_fld4                 varchar(256) comment '保留字段4',
   vkp_fld5                 varchar(512) comment '保留字段5',
   vkp_fld6                 varchar(512) comment '保留字段6',
   vdblg_users              varchar(512) comment '所属人员，为空则数据均可访问，非空则只有指定人员访问',
   vdblg_orgnizations       varchar(512) comment '所属组织，非空表示指定组织结构下的人员可以访问',
   region                   varchar(255) comment '区域',
   primary key (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
alter table emp_customer_addr comment '用户地址表';


drop table if exists emp_customer_point_log
create table emp_customer_point_log
(
   id                       bigint(20) unsigned not null comment 'id 主键',
   customer_id              bigint(20) unsigned  NOT NULL COMMENT 'customer_login表的自增ID',
   source                   integer(4) UNSIGNED NOT NULL COMMENT '积分来源：0订单，1登陆，2活动',
   refer_number             varchar(128) COMMENT '积分来源相关编号',
   change_point             integer(8) NOT NULL DEFAULT 0 COMMENT '变更积分数',
   vbsc_meta_spec           integer(16) unsigned comment '元类型-基础字段',
   vbsc_mspec_desc          varchar(256) comment '元类型描述',
   vbsc_creator             varchar(128) comment '创建者',
   vbsc_create_date         datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   vbsc_modifier            varchar(128) comment '修改人',
   vbsc_modify_date         datetime not null default CURRENT_TIMESTAMP comment '新增时同创建时间',
   vbsc_use_stat            smallint not null default 1 comment '可用状态',
   vbsc_busi_type           int(8) comment '业务类型状态',
   vbsc_uni_version         integer(16) not null comment '版本号',
   vbsc_uni_timestamp       datetime not null default CURRENT_TIMESTAMP comment '时间戳',
   vbsc_partition_id        integer(8) unsigned comment '分区ID',
   vbsc_txid                bigint(20) unsigned comment '事务流水号',
   vbsc_notes               varchar(2000) comment '备注',
   vkp_fld1                 varchar(128) comment '保留字段1',
   vkp_fld2                 varchar(128) comment '保留字段2',
   vkp_fld3                 varchar(256) comment '保留字段3',
   vkp_fld4                 varchar(256) comment '保留字段4',
   vkp_fld5                 varchar(512) comment '保留字段5',
   vkp_fld6                 varchar(512) comment '保留字段6',
   vdblg_users              varchar(512) comment '所属人员，为空则数据均可访问，非空则只有指定人员访问',
   vdblg_orgnizations       varchar(512) comment '所属组织，非空表示指定组织结构下的人员可以访问',
   region                   varchar(255) comment '区域',
   primary key (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
alter table emp_customer_point_log comment '用户积分日志表';

drop table if exists emp_customer_balance_log
create table emp_customer_balance_log
(
   id                       bigint(20) unsigned not null comment 'id 主键',
   customer_id              bigint(20) unsigned  NOT NULL COMMENT 'customer_login表的自增ID',
   source                   integer(4) UNSIGNED NOT NULL COMMENT '记录来源：1订单，2退货单',
   refer_number             varchar(128) COMMENT '相关单据ID',
   amount                   DECIMAL(12,4) NOT NULL DEFAULT 0.00 COMMENT '变动金额',
   vbsc_meta_spec           integer(16) unsigned comment '元类型-基础字段',
   vbsc_mspec_desc          varchar(256) comment '元类型描述',
   vbsc_creator             varchar(128) comment '创建者',
   vbsc_create_date         datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   vbsc_modifier            varchar(128) comment '修改人',
   vbsc_modify_date         datetime not null default CURRENT_TIMESTAMP comment '新增时同创建时间',
   vbsc_use_stat            smallint not null default 1 comment '可用状态',
   vbsc_busi_type           int(8) comment '业务类型状态',
   vbsc_uni_version         integer(16) not null comment '版本号',
   vbsc_uni_timestamp       datetime not null default CURRENT_TIMESTAMP comment '时间戳',
   vbsc_partition_id        integer(8) unsigned comment '分区ID',
   vbsc_txid                bigint(20) unsigned comment '事务流水号',
   vbsc_notes               varchar(2000) comment '备注',
   vkp_fld1                 varchar(128) comment '保留字段1',
   vkp_fld2                 varchar(128) comment '保留字段2',
   vkp_fld3                 varchar(256) comment '保留字段3',
   vkp_fld4                 varchar(256) comment '保留字段4',
   vkp_fld5                 varchar(512) comment '保留字段5',
   vkp_fld6                 varchar(512) comment '保留字段6',
   vdblg_users              varchar(512) comment '所属人员，为空则数据均可访问，非空则只有指定人员访问',
   vdblg_orgnizations       varchar(512) comment '所属组织，非空表示指定组织结构下的人员可以访问',
   region                   varchar(255) comment '区域',
   primary key (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
alter table emp_customer_balance_log comment '用户余额变更表';


----商品表 (spu表)
CREATE TABLE emp_product (
  id                        bigint(20) unsigned not null comment 'id 主键',
  name                      varchar(256) NOT NULL COMMENT '商品标题',
  category_id               bigint(20) unsigned NOT NULL COMMENT '商品分类编号',
  mer_id                    bigint(20) unsigned NOT NULL COMMENT '商家编号',
  freight_id                bigint(20) unsigned  DEFAULT NULL,
  type_id                   tinyint(4) NOT NULL COMMENT '类型编号',
  sketch                    varchar(256) DEFAULT NULL COMMENT '简述',
  intro                     text NOT NULL COMMENT '商品描述',
  keywords                  varchar(255) DEFAULT NULL COMMENT '商品关键字',
  tags                      varchar(255) DEFAULT NULL COMMENT '标签',
  marque                    varchar(255) NOT NULL COMMENT '商品型号',
  barcode                   varchar(255) NOT NULL COMMENT '仓库条码',
  brand_id                  int(11) NOT NULL COMMENT '品牌编号',
  virtual                   int(11) NOT NULL DEFAULT '0' COMMENT '虚拟购买量',
  price                     decimal(8,2) NOT NULL COMMENT '商品价格',
  market_price              decimal(8,2) NOT NULL COMMENT '市场价格',
  integral                  int(11) NOT NULL DEFAULT '0' COMMENT '可使用积分抵消',
  stock                     int(11) NOT NULL COMMENT '库存量',
  warning_stock             int(11) NOT NULL COMMENT '库存警告',
  picture_url               varchar(256) NOT NULL COMMENT '封面图',
  posters                   varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  status                    tinyint(4) NOT NULL COMMENT '状态 -1=>下架,1=>上架,2=>预售,0=>未上架',
  state                     tinyint(4) NOT NULL DEFAULT '0' COMMENT '审核状态 -1 审核失败 0 未审核 1 审核成功',
  is_package                tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否是套餐',
  is_integral               tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否是积分产品',
  sort                      int(11) NOT NULL DEFAULT '99' COMMENT '排序',
  vbsc_meta_spec            integer(16) unsigned comment '元类型-基础字段',
   vbsc_mspec_desc          varchar(256) comment '元类型描述',
   vbsc_creator             varchar(128) comment '创建者',
   vbsc_create_date         datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   vbsc_modifier            varchar(128) comment '修改人',
   vbsc_modify_date         datetime not null default CURRENT_TIMESTAMP comment '新增时同创建时间',
   vbsc_use_stat            smallint not null default 1 comment '可用状态',
   vbsc_busi_type           int(8) comment '业务类型状态',
   vbsc_uni_version         integer(16) not null comment '版本号',
   vbsc_uni_timestamp       datetime not null default CURRENT_TIMESTAMP comment '时间戳',
   vbsc_partition_id        integer(8) unsigned comment '分区ID',
   vbsc_txid                bigint(20) unsigned comment '事务流水号',
   vbsc_notes               varchar(2000) comment '备注',
   vkp_fld1                 varchar(128) comment '保留字段1',
   vkp_fld2                 varchar(128) comment '保留字段2',
   vkp_fld3                 varchar(256) comment '保留字段3',
   vkp_fld4                 varchar(256) comment '保留字段4',
   vkp_fld5                 varchar(512) comment '保留字段5',
   vkp_fld6                 varchar(512) comment '保留字段6',
   vdblg_users              varchar(512) comment '所属人员，为空则数据均可访问，非空则只有指定人员访问',
   vdblg_orgnizations       varchar(512) comment '所属组织，非空表示指定组织结构下的人员可以访问',
   region                   varchar(255) comment '区域',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
alter table emp_product comment '商品表 (spu表)';

---商品类目
CREATE TABLE product_category (
  id                        bigint(20) unsigned not null comment 'id 主键',
  name                      varchar(255) NOT NULL COMMENT '分类表',
  code                      varchar(128) NOT NULL COMMENT '父分类编号',
  cover                     varchar(255) DEFAULT NULL COMMENT '封面图',
  index_block_status        tinyint(4) NOT NULL DEFAULT '0' COMMENT '首页块级状态 1=>显示',
  status                    tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态 1=>正常',
  sort                      int(11) NOT NULL DEFAULT '999' COMMENT '排序',
    vbsc_meta_spec            integer(16) unsigned comment '元类型-基础字段',
   vbsc_mspec_desc          varchar(256) comment '元类型描述',
   vbsc_creator             varchar(128) comment '创建者',
   vbsc_create_date         datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   vbsc_modifier            varchar(128) comment '修改人',
   vbsc_modify_date         datetime not null default CURRENT_TIMESTAMP comment '新增时同创建时间',
   vbsc_use_stat            smallint not null default 1 comment '可用状态',
   vbsc_busi_type           int(8) comment '业务类型状态',
   vbsc_uni_version         integer(16) not null comment '版本号',
   vbsc_uni_timestamp       datetime not null default CURRENT_TIMESTAMP comment '时间戳',
   vbsc_partition_id        integer(8) unsigned comment '分区ID',
   vbsc_txid                bigint(20) unsigned comment '事务流水号',
   vbsc_notes               varchar(2000) comment '备注',
   vkp_fld1                 varchar(128) comment '保留字段1',
   vkp_fld2                 varchar(128) comment '保留字段2',
   vkp_fld3                 varchar(256) comment '保留字段3',
   vkp_fld4                 varchar(256) comment '保留字段4',
   vkp_fld5                 varchar(512) comment '保留字段5',
   vkp_fld6                 varchar(512) comment '保留字段6',
   vdblg_users              varchar(512) comment '所属人员，为空则数据均可访问，非空则只有指定人员访问',
   vdblg_orgnizations       varchar(512) comment '所属组织，非空表示指定组织结构下的人员可以访问',
   region                   varchar(255) comment '区域',
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

----系统规格表
CREATE TABLE system_attribute (
  id                        int(10) unsigned NOT NULL AUTO_INCREMENT,
  category_id               int(11) NOT NULL COMMENT '商品类别编号',
  name                      varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '属性名称',
  sort                      int(11) NOT NULL DEFAULT '999' COMMENT '排列次序',
  PRIMARY KEY (id),
  KEY product_attribute_category_id_name_index (category_id,name)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

----系统属性表
CREATE TABLE product_attribute_option (
  id                        int(10) unsigned NOT NULL AUTO_INCREMENT,
  name                      varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '选项名称',
  attr_id                   int(11) NOT NULL COMMENT '属性编码',
  sort                      int(11) NOT NULL DEFAULT '999' COMMENT '排序',
  PRIMARY KEY (id),
  KEY product_attribute_option_name_attr_id_index (name,attr_id)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

----规格属性绑定表
CREATE TABLE product_attribute_and_option (
  id                        int(10) unsigned NOT NULL AUTO_INCREMENT,
  sku_id                    int(11) NOT NULL COMMENT 'sku编码',
  option_id                 int(11) NOT NULL DEFAULT '0' COMMENT '属性选项编码',
  attribute_id              int(11) NOT NULL COMMENT '属性编码',
  sort                      int(11) NOT NULL DEFAULT '999' COMMENT '排序',
  supplier_option_id        int(11) DEFAULT NULL,
  PRIMARY KEY (id),
  KEY product_attribute_and_option_sku_id_option_id_attribute_id_index (sku_id,option_id,attribute_id)
) ENGINE=InnoDB AUTO_INCREMENT=6335 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-----sku表
CREATE TABLE product_sku (
  id                        int(10) unsigned NOT NULL AUTO_INCREMENT,
  product_id                int(11) NOT NULL COMMENT '商品编码',
  name                      varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'sku名称',
  img                       varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主图',
  price                     decimal(8,2) NOT NULL COMMENT '价格',
  stock                     int(11) NOT NULL DEFAULT '0' COMMENT '库存',
  code                      varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品编码',
  barcode                   varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品条形码',
  data                      varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'sku串',
  PRIMARY KEY (id),
  KEY product_sku_name_product_id_index (name,product_id)
) ENGINE=InnoDB AUTO_INCREMENT=530 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

---自定义规格表
CREATE TABLE product_attribute (
  id                        int(10) unsigned NOT NULL AUTO_INCREMENT,
  product_id                int(11) NOT NULL COMMENT '商品编码',
  name                      varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '规格名称',
  sort                      int(11) NOT NULL DEFAULT '999' COMMENT '排序',
  PRIMARY KEY (id),
  KEY product_supplier_attribute_name_product_id_index (name,product_id)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

----商品图片元素
CREATE TABLE product_album (
  id                        int(10) unsigned NOT NULL AUTO_INCREMENT,
  product_id                int(11) NOT NULL COMMENT '商品编号',
  name                      varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品名称',
  url                       varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图片地址',
  size                      int(11) DEFAULT NULL COMMENT '视频大小',
  intro                     varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '图片介绍',
  sort                      int(11) NOT NULL DEFAULT '999' COMMENT '排序',
  status                    tinyint(4) NOT NULL DEFAULT '0' COMMENT '图片状态',
  state                     tinyint(4) NOT NULL DEFAULT '0' COMMENT '资源类型 0=>图片 1=>视频',
  created_at                timestamp NULL DEFAULT NULL,
  updated_at                timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

---商品品牌
CREATE TABLE product_brand (
  id                        int(10) unsigned NOT NULL AUTO_INCREMENT,
  product_category_id       int(11) NOT NULL COMMENT '商品类别编号',
  name                      varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '品牌名称',
  image_url                 varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '图片url',
  sort                      int(11) NOT NULL DEFAULT '999' COMMENT '排列次序',
  status                    tinyint(4) NOT NULL COMMENT '状态',
  created_at                timestamp NULL DEFAULT NULL,
  updated_at                timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY product_brand_name_unique (name)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



--order 订单表

CREATE TABLE order (
  id                        int(10) unsigned NOT NULL AUTO_INCREMENT,
  order_no                  varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '订单编号',
  order_sn                  varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '交易号',
  member_id                 int(11) NOT NULL COMMENT '客户编号',
  supplier_id               int(11) DEFAULT '0' COMMENT '商户编码',
  supplier_name             varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商户名称',
  order_status              tinyint(4) NOT NULL DEFAULT '0' COMMENT '订单状态 0未付款,1已付款,2已发货,3已签收,-1退货申请,-2退货中,-3已退货,-4取消交易 -5撤销申请',
  after_status              tinyint(4) NOT NULL DEFAULT '0' COMMENT '用户售后状态 0 未发起售后 1 申请售后 -1 售后已取消 2 处理中 200 处理完毕',
  product_count             int(11) NOT NULL DEFAULT '0' COMMENT '商品数量',
  product_amount_total      decimal(12,4) NOT NULL COMMENT '商品总价',
  order_amount_total        decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT '实际付款金额',
  logistics_fee             decimal(12,4) NOT NULL COMMENT '运费金额',
  address_id                int(11) NOT NULL COMMENT '收货地址编码',
  pay_channel               tinyint(4) NOT NULL DEFAULT '0' COMMENT '支付渠道 0余额 1微信 2支付宝',
  out_trade_no              varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '订单支付单号',
  escrow_trade_no           varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '第三方支付流水号',
  pay_time                  int(11) NOT NULL DEFAULT '0' COMMENT '付款时间',
  delivery_time             int(11) NOT NULL DEFAULT '0' COMMENT '发货时间',
  order_settlement_status   tinyint(4) NOT NULL DEFAULT '0' COMMENT '订单结算状态 0未结算 1已结算',
  order_settlement_time     int(11) NOT NULL DEFAULT '0' COMMENT '订单结算时间',
  is_package enum('0','1')  COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '是否是套餐',
  is_integral enum('0','1') COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '是否是积分产品',
  created_at                timestamp NULL DEFAULT NULL,
  updated_at                timestamp NULL DEFAULT NULL,
  deleted_at                timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id),
  KEY order_order_sn_member_id_order_status_out_trade_no_index (order_sn,member_id,order_status,out_trade_no(191))
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

---order_detail 订单详情
CREATE TABLE order_detail (
  id                        int(10) unsigned NOT NULL AUTO_INCREMENT,
  order_id                  int(11) NOT NULL COMMENT '订单编码',
  product_id                int(11) NOT NULL COMMENT '商品编码',
  product_name              varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品名称',
  product_price             decimal(12,4) NOT NULL COMMENT '商品价格',
  product_sku               int(11) NOT NULL COMMENT '商品SKU',
  product_picture_url       varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  product_mode_desc         varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品型号信息',
  product_mode_params       int(11) DEFAULT NULL COMMENT '商品型号参数',
  discount_rate             tinyint(4) NOT NULL DEFAULT '0' COMMENT '折扣比例',
  discount_amount           decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT '折扣比例',
  number                    int(11) NOT NULL DEFAULT '1' COMMENT '购买数量',
  subtotal                  decimal(12,4) NOT NULL COMMENT '小计金额',
  is_product_exists         enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '商品是否有效 1失效',
  remark text               COLLATE utf8mb4_unicode_ci COMMENT '客户商品备注',
  created_at                timestamp NULL DEFAULT NULL,
  updated_at                timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id),
  KEY order_detail_order_id_index (order_id)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

---order_logistics 订单物流
CREATE TABLE order_logistics (
  id                        int(10) unsigned NOT NULL AUTO_INCREMENT,
  order_id                  int(11) NOT NULL COMMENT '订单编码',
  express_no                varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '发货快递单号',
  consignee_realname        varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '收货人姓名',
  consignee_telphone        varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '联系电话',
  consignee_telphone2       varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备用联系电话',
  consignee_address         varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '收货地址',
  consignee_zip             int(11) NOT NULL COMMENT '邮政编码',
  logistics_type            varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '物流方式',
  logistics_fee             decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '物流发货运费',
  order_logistics_status    int(11) NOT NULL DEFAULT '0' COMMENT '物流状态',
  logistics_settlement_status int(11) NOT NULL DEFAULT '0' COMMENT '物流结算状态',
  logistics_result_last     varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '物流最后状态描述',
  logistics_result          varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '物流描述',
  logistics_create_time     int(11) NOT NULL DEFAULT '0' COMMENT '发货时间',
  logistics_update_time     int(11) NOT NULL DEFAULT '0' COMMENT '物流更新时间',
  logistics_settlement_time int(11) NOT NULL DEFAULT '0' COMMENT '物流结算时间',
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

---order_returns 订单退换货
CREATE TABLE order_returns (
  id                        int(10) unsigned NOT NULL AUTO_INCREMENT,
  returns_no                varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '退货编号 供客户查询',
  order_id                  int(11) NOT NULL COMMENT '订单编号',
  express_no                varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '物流单号',
  consignee_realname        varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '收货人姓名',
  consignee_telphone        varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '联系电话',
  consignee_telphone2       varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '备用联系电话',
  consignee_address         varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '收货地址',
  consignee_zip             varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '邮政编码',
  logistics_type            varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '物流方式',
  logistics_fee             decimal(12,2) NOT NULL COMMENT '物流发货运费',
  order_logistics_status    int(11) DEFAULT NULL COMMENT '物流状态',
  logistics_settlement_status int(11) DEFAULT NULL COMMENT '物流结算状态',
  logistics_result_last     varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '物流最后状态描述',
  logistics_result          varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '物流描述',
  logistics_create_time     int(11) DEFAULT NULL COMMENT '发货时间',
  logistics_update_time     int(11) DEFAULT NULL COMMENT '物流更新时间',
  logistics_settlement_time int(11) DEFAULT NULL COMMENT '物流结算时间',
  returns_type              tinyint(4) NOT NULL DEFAULT '0' COMMENT '0全部退单 1部分退单',
  handling_way              varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'PUPAWAY:退货入库;REDELIVERY:重新发货;RECLAIM-REDELIVERY:不要求归还并重新发货; REFUND:退款; COMPENSATION:不退货并赔偿',
  returns_amount            decimal(8,2) NOT NULL COMMENT '退款金额',
  return_submit_time        int(11) NOT NULL COMMENT '退货申请时间',
  handling_time             int(11) NOT NULL COMMENT '退货处理时间',
  remark                    text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '退货原因',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

----order_returns_apply 售后申请
CREATE TABLE order_returns_apply (
  id                        int(10) unsigned NOT NULL AUTO_INCREMENT,
  order_no                  varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '订单单号',
  order_detail_id           varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '子订单编码',
  return_no                 varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '售后单号',
  member_id                 int(11) NOT NULL COMMENT '用户编码',
  state                     tinyint(4) NOT NULL COMMENT '类型 0 仅退款 1退货退款',
  product_status            tinyint(4) NOT NULL DEFAULT '0' COMMENT '货物状态 0:已收到货 1:未收到货',
  why                       varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '退换货原因',
  status                    tinyint(4) NOT NULL DEFAULT '0' COMMENT '审核状态 -1 拒绝 0 未审核 1审核通过',
  audit_time                int(11) NOT NULL DEFAULT '0' COMMENT '审核时间',
  audit_why                 varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '审核原因',
  note text                 COLLATE utf8mb4_unicode_ci COMMENT '备注',
  created_at                timestamp NULL DEFAULT NULL,
  updated_at                timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;








