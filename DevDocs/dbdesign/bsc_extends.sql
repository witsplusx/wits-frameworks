drop table if exists fdb_scam_usrthdplatform;

create table fdb_scam_usrthdplatform
(
   id                   bigint(20) unsigned not null comment 'id 主键',
   accout_id            bigint(20) unsigned comment '账号ID',
   thdplt_id            bigint(20) unsigned comment '第三方平台账号ID',
   thdplt_key           varchar(256) comment '第三方平台key',
   thdplt_token         varchar(256) comment '第三方平台token',
   thdp_type            integer(4) unsigned NOT NULL DEFAULT 0 comment '平台类型 0:未知,1:facebook,2:google,3:wechat,4:qq,5:weibo,6:twitter',
   nick_name            varchar(32) comment '昵称',
   avatar               varchar(256) comment '头像',
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
   vkp_fld5             varchar(512) comment '保留字段1',
   vkp_fld6             varchar(512) comment '保留字段2',
   vdblg_users          varchar(512) comment '所属人员，为空则数据均可访问，非空则只有指定人员访问',
   vdblg_orgnizations   varchar(512) comment '所属组织，非空表示指定组织结构下的人员可以访问',
   region               varchar(255) comment '区域',
   primary key (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

alter table fdb_metar_compt_rel comment '用户第三方平台登录表';
