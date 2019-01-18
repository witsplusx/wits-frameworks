drop table if exists emp_customer;

/*==============================================================*/
/* Table: emp_customer  扩展自系统用户                                 */
/*==============================================================*/
create table emp_customer
(
   id                               bigint(20) unsigned not null comment 'id 主键',
   user_id                      bigint(20) unsigned not null comment '用户ID',
   customer_name        VARCHAR(64) NOT NULL COMMENT '用户真实姓名',
   identity_card_type    integer(4) NOT NULL DEFAULT 1 COMMENT '证件类型：1 身份证，2 军官证，3 护照',
   identity_card_no     VARCHAR(32) COMMENT '证件号码',
   user_point               INT NOT NULL DEFAULT 0 COMMENT '用户积分',
   customer_level       integer(4) NOT NULL DEFAULT 1 COMMENT '会员级别：1 普通会员，2 青铜，3白银，4黄金，5钻石',
   user_money           DECIMAL(12, 4) NOT NULL DEFAULT 0.0000 COMMENT '用户余额',   
   primary key (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

 alter table emp_customer comment '电商用户表';
 
 
 drop table if exists emp_customer_level;

 create table emp_customer_level
(
   id                               bigint(20) unsigned not null comment 'id 主键',
   level_name               VARCHAR(10) NOT NULL COMMENT '会员级别名称',
   min_point                INT UNSIGNED NOT NULL DEFAULT 0 COMMENT '该级别最低积分',
   max_point                INT UNSIGNED NOT NULL DEFAULT 0 COMMENT '该级别最高积分',
   vbsc_meta_spec       integer(16) unsigned comment '元类型-基础字段',
   vbsc_mspec_desc      varchar(256) comment '元类型描述',
   vbsc_creator         varchar(128) comment '创建者',
   vbsc_create_date     datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   vbsc_modifier        varchar(128) comment '修改人',
   vbsc_modify_date     datetime not null default CURRENT_TIMESTAMP comment '新增时同创建时间',
   vbsc_use_stat        smallint not null default 1 comment '可用状态',
   vbsc_busi_type       int(8) comment '业务类型状态',
   vbsc_uni_version     integer(16) not null comment '版本号',
   vbsc_uni_timestamp   datetime not null default CURRENT_TIMESTAMP comment '时间戳',
   vbsc_partition_id    integer(8) unsigned comment '分区ID',
   vbsc_txid            bigint(20) unsigned comment '事务流水号',
   vbsc_notes           varchar(2000) comment '备注',
   vkp_fld1             varchar(128) comment '保留字段1',
   vkp_fld2             varchar(128) comment '保留字段2',
   vkp_fld3             varchar(256) comment '保留字段3',
   vkp_fld4             varchar(256) comment '保留字段4',
   vkp_fld5             varchar(512) comment '保留字段5',
   vkp_fld6             varchar(512) comment '保留字段6',
   vdblg_users          varchar(512) comment '所属人员，为空则数据均可访问，非空则只有指定人员访问',
   vdblg_orgnizations   varchar(512) comment '所属组织，非空表示指定组织结构下的人员可以访问',
   region               varchar(255) comment '区域',
   primary key (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

 alter table emp_customer_level comment '用户等级表';
 
  drop table if exists emp_customer_addr

 create table emp_customer_addr
(
   id                               bigint(20) unsigned not null comment 'id 主键',
   customer_id              INT UNSIGNED NOT NULL COMMENT 'customer_login表的自增ID',
   zip_code                    varchar(32) NOT NULL COMMENT '邮编',
   province                     varchar(64) NOT NULL COMMENT '地区表中省份',
   city                             varchar(64) NOT NULL COMMENT '地区表中城市',
   district                        varchar(64) NOT NULL COMMENT '地区表中的区',
   address                      VARCHAR(256) NOT NULL COMMENT '具体的地址门牌号',
   is_default                   TINYINT(1) NOT NULL default 0  COMMENT '是否默认,0否1是',
   vbsc_meta_spec       integer(16) unsigned comment '元类型-基础字段',
   vbsc_mspec_desc      varchar(256) comment '元类型描述',
   vbsc_creator         varchar(128) comment '创建者',
   vbsc_create_date     datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   vbsc_modifier        varchar(128) comment '修改人',
   vbsc_modify_date     datetime not null default CURRENT_TIMESTAMP comment '新增时同创建时间',
   vbsc_use_stat        smallint not null default 1 comment '可用状态',
   vbsc_busi_type       int(8) comment '业务类型状态',
   vbsc_uni_version     integer(16) not null comment '版本号',
   vbsc_uni_timestamp   datetime not null default CURRENT_TIMESTAMP comment '时间戳',
   vbsc_partition_id    integer(8) unsigned comment '分区ID',
   vbsc_txid            bigint(20) unsigned comment '事务流水号',
   vbsc_notes           varchar(2000) comment '备注',
   vkp_fld1             varchar(128) comment '保留字段1',
   vkp_fld2             varchar(128) comment '保留字段2',
   vkp_fld3             varchar(256) comment '保留字段3',
   vkp_fld4             varchar(256) comment '保留字段4',
   vkp_fld5             varchar(512) comment '保留字段5',
   vkp_fld6             varchar(512) comment '保留字段6',
   vdblg_users          varchar(512) comment '所属人员，为空则数据均可访问，非空则只有指定人员访问',
   vdblg_orgnizations   varchar(512) comment '所属组织，非空表示指定组织结构下的人员可以访问',
   region               varchar(255) comment '区域',
   primary key (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

 alter table emp_customer_addr comment '用户地址表';
 
 
   drop table if exists emp_customer_point_log

 create table emp_customer_point_log
(
   id                               bigint(20) unsigned not null comment 'id 主键',
   customer_id               bigint(20) unsigned  NOT NULL COMMENT 'customer_login表的自增ID',
   source                       integer(4) UNSIGNED NOT NULL COMMENT '积分来源：0订单，1登陆，2活动',
   refer_number          varchar(128) COMMENT '积分来源相关编号',
   change_point          integer(8) NOT NULL DEFAULT 0 COMMENT '变更积分数',
   vbsc_meta_spec       integer(16) unsigned comment '元类型-基础字段',
   vbsc_mspec_desc      varchar(256) comment '元类型描述',
   vbsc_creator         varchar(128) comment '创建者',
   vbsc_create_date     datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   vbsc_modifier        varchar(128) comment '修改人',
   vbsc_modify_date     datetime not null default CURRENT_TIMESTAMP comment '新增时同创建时间',
   vbsc_use_stat        smallint not null default 1 comment '可用状态',
   vbsc_busi_type       int(8) comment '业务类型状态',
   vbsc_uni_version     integer(16) not null comment '版本号',
   vbsc_uni_timestamp   datetime not null default CURRENT_TIMESTAMP comment '时间戳',
   vbsc_partition_id    integer(8) unsigned comment '分区ID',
   vbsc_txid            bigint(20) unsigned comment '事务流水号',
   vbsc_notes           varchar(2000) comment '备注',
   vkp_fld1             varchar(128) comment '保留字段1',
   vkp_fld2             varchar(128) comment '保留字段2',
   vkp_fld3             varchar(256) comment '保留字段3',
   vkp_fld4             varchar(256) comment '保留字段4',
   vkp_fld5             varchar(512) comment '保留字段5',
   vkp_fld6             varchar(512) comment '保留字段6',
   vdblg_users          varchar(512) comment '所属人员，为空则数据均可访问，非空则只有指定人员访问',
   vdblg_orgnizations   varchar(512) comment '所属组织，非空表示指定组织结构下的人员可以访问',
   region               varchar(255) comment '区域',
   primary key (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

 alter table emp_customer_point_log comment '用户积分日志表';
 
    drop table if exists emp_customer_balance_log

 create table emp_customer_balance_log
(
   id                               bigint(20) unsigned not null comment 'id 主键',
   customer_id               bigint(20) unsigned  NOT NULL COMMENT 'customer_login表的自增ID',
   source                       integer(4) UNSIGNED NOT NULL COMMENT '记录来源：1订单，2退货单',
   refer_number          varchar(128) COMMENT '相关单据ID',
   amount                   DECIMAL(12,4) NOT NULL DEFAULT 0.00 COMMENT '变动金额',
   vbsc_meta_spec       integer(16) unsigned comment '元类型-基础字段',
   vbsc_mspec_desc      varchar(256) comment '元类型描述',
   vbsc_creator         varchar(128) comment '创建者',
   vbsc_create_date     datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   vbsc_modifier        varchar(128) comment '修改人',
   vbsc_modify_date     datetime not null default CURRENT_TIMESTAMP comment '新增时同创建时间',
   vbsc_use_stat        smallint not null default 1 comment '可用状态',
   vbsc_busi_type       int(8) comment '业务类型状态',
   vbsc_uni_version     integer(16) not null comment '版本号',
   vbsc_uni_timestamp   datetime not null default CURRENT_TIMESTAMP comment '时间戳',
   vbsc_partition_id    integer(8) unsigned comment '分区ID',
   vbsc_txid            bigint(20) unsigned comment '事务流水号',
   vbsc_notes           varchar(2000) comment '备注',
   vkp_fld1             varchar(128) comment '保留字段1',
   vkp_fld2             varchar(128) comment '保留字段2',
   vkp_fld3             varchar(256) comment '保留字段3',
   vkp_fld4             varchar(256) comment '保留字段4',
   vkp_fld5             varchar(512) comment '保留字段5',
   vkp_fld6             varchar(512) comment '保留字段6',
   vdblg_users          varchar(512) comment '所属人员，为空则数据均可访问，非空则只有指定人员访问',
   vdblg_orgnizations   varchar(512) comment '所属组织，非空表示指定组织结构下的人员可以访问',
   region               varchar(255) comment '区域',
   primary key (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

 alter table emp_customer_balance_log comment '用户余额变更表';
 
 
 
 
 
 
 
 
 
