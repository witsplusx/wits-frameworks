/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2018/12/29 15:21:11                          */
/*==============================================================*/


drop table if exists fdb_metam_attr_spec;

drop table if exists fdb_metam_dbinst_schema;

drop table if exists fdb_metam_dbtbl_reldesc;

drop table if exists fdb_metam_dictvalue;

drop table if exists fdb_metam_dictype;

drop table if exists fdb_metam_domain;

drop table if exists fdb_metam_entity_spec;

drop table if exists fdb_metam_field;

drop table if exists fdb_metam_relation_spec;

drop table if exists fdb_metam_table;

drop table if exists fdb_metam_taiji;

drop table if exists fdb_metam_ui_compt;

drop table if exists fdb_metam_ui_view;

drop table if exists fdb_metar_compt_rel;

drop table if exists fdb_metar_dict_dicv;

drop table if exists fdb_metar_dictv_attr;

drop table if exists fdb_metar_dm_entity;

drop table if exists fdb_metar_spec_compt;

drop table if exists fdb_metar_taiji_inter;

drop table if exists fdb_metar_tbl_spec;

drop table if exists fdb_metar_tj_entity;

drop table if exists fdb_metar_view_compt;

drop table if exists fdb_metar_view_inter;

drop table if exists fdb_scam_ciper_mng;

drop table if exists fdb_scam_organization;

drop table if exists fdb_scam_role;

drop table if exists fdb_scam_staff;

drop table if exists fdb_scam_sysres;

drop table if exists fdb_scam_user;

drop table if exists fdb_scam_user_group;

drop table if exists fdb_scam_user_trace;

drop table if exists fdb_scar_ciper_entity;

drop table if exists fdb_scar_org_staff;

drop table if exists fdb_scar_role_operm;

drop table if exists fdb_scar_ugrp_role;

drop table if exists fdb_scar_user_operm;

drop table if exists fdb_scar_user_role;

drop table if exists fdb_scar_user_ugrp;

/*==============================================================*/
/* Table: fdb_metam_attr_spec                                   */
/*==============================================================*/
create table fdb_metam_attr_spec
(
   id                   bigint(20) unsigned not null comment 'id 主键',
   rel_spec_id          bigint(20) comment '所属实体规格ID',
   spec_type            varchar(32) comment '所属规格类型，ENTITY  RELATION',
   rel_dm_id            bigint(20) comment '所属域',
   attr_name            varchar(128) not null comment '名称',
   attr_code            varchar(128) comment '编码',
   espec_icon           varchar(64) comment '图标',
   attr_type            varchar(32) comment '属性类型，表字段TBLFLD，关联依赖1:1  REL1TO1   关联依赖1:N REL1TON',
   rel_ettspec_id       bigint(20) comment '关联实体规格ID',
   rel_tbl_id           bigint(20) comment '所属表ID',
   rel_tbl_name         varchar(64) comment '所属表名称',
   rel_fld_id           bigint(20) comment '所属字段ID',
   rel_fld_name         varchar(64) comment '所属字段名称',
   attr_code_type       varchar(32) comment '类属性类型，对应编程语言类型',
   def_value            varchar(64) comment '默认值',
   rel_dict_id          bigint(20) comment '所属字典类型',
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

alter table fdb_metam_attr_spec comment '元数据-属性规格';

/*==============================================================*/
/* Table: fdb_metam_dbinst_schema                               */
/*==============================================================*/
create table fdb_metam_dbinst_schema
(
   id                   bigint(20) unsigned not null comment 'id 主键',
   parent_id            bigint(20) unsigned comment '父ID',
   rel_dm_id            bigint(20) comment '所属域',
   dinst_type           varchar(64) comment '数据实例类型，关系型MySQL....',
   svr_type             varchar(32) comment '服务模式',
   svr_role             varchar(32) comment '服务角色，主从...',
   dinst_name           varchar(128) not null comment '名称',
   dinst_code           varchar(128) comment '编码',
   driver_url           varchar(512) comment '驱动链接',
   req_account          varchar(64) comment '访问账号',
   req_password         varchar(255) comment '访问密码',
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

alter table fdb_metam_dbinst_schema comment '元数据-数据源模式';

/*==============================================================*/
/* Table: fdb_metam_dbtbl_reldesc                               */
/*==============================================================*/
create table fdb_metam_dbtbl_reldesc
(
   id                   bigint(20) unsigned not null comment 'id 主键',
   rel_dbinst_id        bigint(20) comment '所属数据源/模式',
   rel_dm_id            bigint(20) comment '所属域',
   tblrel_type          varchar(32) comment '实体关系类型',
   src_tbl_id           bigint(20) comment '源表ID',
   src_tbl_name         varchar(64) comment '源表名称',
   src_relfld_id        bigint(20) comment '源表关联字段ID',
   src_relfld_name      varchar(64) comment '源表关联字段名称',
   mid_tbl_id           bigint(20) comment '中间表ID',
   mid_tbl_name         varchar(64) comment '中间表名',
   mid_afld_id          bigint(20) comment '中间表A端关联字段ID',
   mid_afld_name        varchar(64) comment '中间表A端关联字段名称',
   mid_zfld_id          bigint(20) comment '中间表Z端关联字段ID',
   mid_zfld_name        varchar(64) comment '中间表Z端关联字段名称',
   dst_tbl_id           bigint(20) comment '目标表ID',
   dst_tbl_name         varchar(64) comment '目标表名称',
   dst_relfld_id        bigint(20) comment '目标表关联字段ID',
   dst_relfld_name      varchar(64) comment '目标表关联字段名称',
   mid_name             varchar(128) not null comment '名称',
   mid_code             varchar(128) comment '编码',
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

alter table fdb_metam_dbtbl_reldesc comment '元数据-实体表关系描述';

/*==============================================================*/
/* Table: fdb_metam_dictvalue                                   */
/*==============================================================*/
create table fdb_metam_dictvalue
(
   ID                   bigint(20) unsigned not null comment 'id 主键',
   parent_id            bigint(20) unsigned comment '父ID',
   rel_dictype_id       bigint(20) comment '所属字典类型',
   rel_dm_id            bigint(20) comment '所属域',
   dicv_name            varchar(128) not null comment '名称',
   dicv_code            varchar(128) comment '编码',
   dic_value            varchar(64) comment '取值',
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
   primary key (ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

alter table fdb_metam_dictvalue comment '字典值表';

/*==============================================================*/
/* Table: fdb_metam_dictype                                     */
/*==============================================================*/
create table fdb_metam_dictype
(
   id                   bigint(20) unsigned not null comment 'id 主键',
   parent_id            bigint(20) unsigned comment '父ID',
   rel_dm_id            bigint(20) comment '所属域',
   dict_name            varchar(128) not null comment '名称',
   dict_code            varchar(128) comment '编码',
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

alter table fdb_metam_dictype comment '字典类型表';

/*==============================================================*/
/* Table: fdb_metam_domain                                      */
/*==============================================================*/
create table fdb_metam_domain
(
   id                   bigint(20) unsigned not null comment 'id 主键',
   dm_name              varchar(128) not null comment '名称',
   dm_code              varchar(128) comment '编码',
   dm_type              varchar(32) comment '域类型',
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

alter table fdb_metam_domain comment ' 元数据配置-领域表';

/*==============================================================*/
/* Table: fdb_metam_entity_spec                                 */
/*==============================================================*/
create table fdb_metam_entity_spec
(
   id                   bigint(20) unsigned not null comment 'id 主键',
   rel_dm_id            bigint(20) comment '所属域',
   espec_name           varchar(128) not null comment '名称',
   espec_code           varchar(128) comment '编码',
   espec_icon           varchar(64) comment '图标',
   rel_modu_name        varchar(64) comment '所属模块名',
   cls_path             varchar(255) comment '类路径',
   qry_svr_uri          varchar(512) comment '检索服务资源',
   data_qry_scripts     text comment '数据检索语句',
   put_svr_uri2         varchar(512) comment '添加/更新服务资源',
   data_put_scripts     text comment '数据添加/更新语句',
   del_svr_uri          varchar(512) comment '删除服务资源',
   data_del_scripts     text comment '数据删除语句',
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

alter table fdb_metam_entity_spec comment '元数据-实体规格';

/*==============================================================*/
/* Table: fdb_metam_field                                       */
/*==============================================================*/
create table fdb_metam_field
(
   id                   bigint(20) unsigned not null comment 'id 主键',
   rel_tbl_id           bigint(20) comment '所属表ID',
   rel_dm_id            bigint(20) comment '所属域',
   fld_name             varchar(128) not null comment '名称',
   fld_code             varchar(128) comment '编码',
   fld_type             varchar(64) comment '字段类型',
   fld_length           integer(4) comment '长度',
   fld_presision        integer(4) comment '精度',
   is_null              tinyint(1) comment '是否可为空',
   def_val              varchar(64) comment '默认值',
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

alter table fdb_metam_field comment '元数据-字段表';

/*==============================================================*/
/* Table: fdb_metam_relation_spec                               */
/*==============================================================*/
create table fdb_metam_relation_spec
(
   id                   bigint(20) unsigned not null comment 'id 主键',
   rel_dm_id            bigint(20) comment '所属域',
   rspec_name           varchar(128) not null comment '名称',
   rspec_code           varchar(128) comment '编码',
   prv_entity_id        bigint(20) comment '提供方实体ID',
   prv_rel_type         varchar(32) comment '提供方关联类型, 1TO1    1TON',
   csm_entity_id        bigint(20) comment '接收方实体ID',
   csm_rel_type         varchar(32) comment '接收方关联类型 1TO1   1TON',
   rspec_icon           varchar(64) comment '图标',
   pkg_path             varchar(255) comment '包路径',
   svr_uri              varchar(255) comment '服务资源（REST）',
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
   qry_svr_uri          varchar(512) comment '检索服务资源',
   data_qry_scripts     text comment '数据检索语句',
   region               varchar(255) comment '区域',
   primary key (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

alter table fdb_metam_relation_spec comment '元数据-关系规格';

/*==============================================================*/
/* Table: fdb_metam_table                                       */
/*==============================================================*/
create table fdb_metam_table
(
   id                   bigint(20) unsigned not null comment 'id 主键',
   parent_id            bigint(20) unsigned comment '父ID',
   rel_datasrc_id       bigint(20) comment '所属数据源',
   rel_dm_id            bigint(20) comment '所属域',
   tbl_name             varchar(128) not null comment '名称',
   tbl_code             varchar(128) comment '编码',
   tbl_type             varchar(64) comment '表类型',
   prik_fld_names       varchar(128) comment '主键字段名',
   lgtbl_fld_name       varchar(128) comment '纵表字段名',
   lgtbl_key_fld        varchar(128) comment '纵表KEY字段名',
   lgtbl_value_fld      varchar(128) comment '纵表VALUE字段名',
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

alter table fdb_metam_table comment '元数据配置-模型表';

/*==============================================================*/
/* Table: fdb_metam_taiji                                       */
/*==============================================================*/
create table fdb_metam_taiji
(
   id                   bigint(20) unsigned not null comment 'id 主键',
   tj_name              varchar(128) not null comment '名称',
   tj_code              varchar(128) comment '编码',
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

alter table fdb_metam_taiji comment '元数据配置——太极';

/*==============================================================*/
/* Table: fdb_metam_ui_compt                                    */
/*==============================================================*/
create table fdb_metam_ui_compt
(
   id                   bigint(20) unsigned not null comment 'id 主键',
   parent_id            bigint(20) comment '父组件ID',
   rel_dm_id            bigint(20) comment '所属域',
   compt_name           varchar(128) not null comment '名称',
   compt_code           varchar(128) comment '编码',
   compt_icon           varchar(64) comment '图标',
   compt_type           varchar(32) comment '组件类型',
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

alter table fdb_metam_ui_compt comment '元数据-展现组件';

/*==============================================================*/
/* Table: fdb_metam_ui_view                                     */
/*==============================================================*/
create table fdb_metam_ui_view
(
   id                   bigint(20) unsigned not null comment 'id 主键',
   parent_id            bigint(20) comment '父组件ID',
   rel_dm_id            bigint(20) comment '所属域',
   rel_app_id           bigint(20) comment '所属应用ID',
   rel_app_name         varchar(128) comment '所属应用名称',
   rel_svrinst_id       bigint(20) comment '所属服务实例ID',
   rel_svrinst_name     varchar(512) comment '所属服务实例名称',
   view_name            varchar(128) not null comment '名称',
   view_code            varchar(128) comment '编码',
   view_type            varchar(32) comment '界面类型   PAGE  LAYOUT',
   res_svc_uri          varchar(255) comment '资源访问路径',
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

alter table fdb_metam_ui_view comment '元数据-展现界面';

/*==============================================================*/
/* Table: fdb_metar_compt_rel                                   */
/*==============================================================*/
create table fdb_metar_compt_rel
(
   id                   bigint(20) unsigned not null comment 'id 主键',
   rel_type             varchar(32) comment '关系类型',
   vkey_srccompt_id     bigint(20) comment '源组件ID',
   vkey_tarcompt_id     bigint(20) comment '目标组件ID',
   vbsc_meta_spec       integer(16) unsigned comment '元类型-基础字段',
   vbsc_mspec_desc      varchar(256) comment '元类型描述',
   vbsc_partition_id    integer(8) unsigned comment '分区id',
   vbsc_txid            bigint(20) unsigned comment '事务流水号',
   vbsc_creator         varchar(128) comment '创建者',
   vbsc_create_date     datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   region               varchar(255) comment '区域',
   primary key (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

alter table fdb_metar_compt_rel comment '组件-组件组合关系';

/*==============================================================*/
/* Table: fdb_metar_dict_dicv                                   */
/*==============================================================*/
create table fdb_metar_dict_dicv
(
   id                   bigint(20) unsigned not null comment 'id 主键',
   vkey_dict_id         bigint(20) comment '用户组ID',
   vkey_dicv_id         bigint(20) comment '角色ID',
   vbsc_meta_spec       integer(16) unsigned comment '元类型-基础字段',
   vbsc_mspec_desc      varchar(256) comment '元类型描述',
   vbsc_partition_id    integer(8) unsigned comment '分区id',
   vbsc_txid            bigint(20) unsigned comment '事务流水号',
   vbsc_creator         varchar(128) comment '创建者',
   vbsc_create_date     datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   region               varchar(255) comment '区域',
   primary key (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

alter table fdb_metar_dict_dicv comment '字典值与字典类型映射';

/*==============================================================*/
/* Table: fdb_metar_dictv_attr                                  */
/*==============================================================*/
create table fdb_metar_dictv_attr
(
   id                   bigint(20) unsigned not null comment 'id 主键',
   spec_attr_id         bigint(20) comment '规格属性ID',
   vkey_dicv_id         bigint(20) comment '角色ID',
   vbsc_meta_spec       integer(16) unsigned comment '元类型-基础字段',
   vbsc_mspec_desc      varchar(256) comment '元类型描述',
   vbsc_partition_id    integer(8) unsigned comment '分区id',
   vbsc_txid            bigint(20) unsigned comment '事务流水号',
   vbsc_creator         varchar(128) comment '创建者',
   vbsc_create_date     datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   region               varchar(255) comment '区域',
   primary key (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

alter table fdb_metar_dictv_attr comment '字典值与规格属性关联映射';

/*==============================================================*/
/* Table: fdb_metar_dm_entity                                   */
/*==============================================================*/
create table fdb_metar_dm_entity
(
   id                   bigint(20) unsigned not null comment 'id 主键',
   vkey_ugrp_id         bigint(20) comment '用户组ID',
   vkey_entity_id       bigint(20) comment '角色ID',
   entity_type          varchar(64),
   table_name           varchar(64) comment '关联表名称',
   vbsc_meta_spec       integer(16) unsigned comment '元类型-基础字段',
   vbsc_mspec_desc      varchar(256) comment '元类型描述',
   vbsc_partition_id    integer(8) unsigned comment '分区id',
   vbsc_txid            bigint(20) unsigned comment '事务流水号',
   vbsc_creator         varchar(128) comment '创建者',
   vbsc_create_date     datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   region               varchar(255) comment '区域',
   primary key (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

alter table fdb_metar_dm_entity comment '域与实体对象关系表';

/*==============================================================*/
/* Table: fdb_metar_spec_compt                                  */
/*==============================================================*/
create table fdb_metar_spec_compt
(
   id                   bigint(20) unsigned not null comment 'id 主键',
   spec_type            varchar(32) comment '规格类型, ENTITY  RELATION',
   vkey_spec_id         bigint(20) comment '规格ID',
   vkey_compt_id        bigint(20) comment '组件ID',
   vbsc_meta_spec       integer(16) unsigned comment '元类型-基础字段',
   vbsc_mspec_desc      varchar(256) comment '元类型描述',
   vbsc_partition_id    integer(8) unsigned comment '分区id',
   vbsc_txid            bigint(20) unsigned comment '事务流水号',
   vbsc_creator         varchar(128) comment '创建者',
   vbsc_create_date     datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   region               varchar(255) comment '区域',
   primary key (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

alter table fdb_metar_spec_compt comment '组件与规格关联映射';

/*==============================================================*/
/* Table: fdb_metar_taiji_inter                                 */
/*==============================================================*/
create table fdb_metar_taiji_inter
(
   id                   bigint(20) unsigned not null comment 'id 主键',
   vkey_src_id          bigint(20) comment '源太极ID',
   vkey_dst_id          bigint(20) comment '目标太极ID',
   inter_type           varchar(32) comment '交互方式',
   vbsc_meta_spec       integer(16) unsigned comment '元类型-基础字段',
   vbsc_mspec_desc      varchar(256) comment '元类型描述',
   vbsc_partition_id    integer(8) unsigned comment '分区id',
   vbsc_txid            bigint(20) unsigned comment '事务流水号',
   vbsc_creator         varchar(128) comment '创建者',
   vbsc_create_date     datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   region               varchar(255) comment '区域',
   primary key (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

alter table fdb_metar_taiji_inter comment '太极之间交互';

/*==============================================================*/
/* Table: fdb_metar_tbl_spec                                    */
/*==============================================================*/
create table fdb_metar_tbl_spec
(
   id                   bigint(20) unsigned not null comment 'id 主键',
   vkey_tbl_id          bigint(20) comment '表ID',
   vkey_spec_id         bigint(20) comment '规格ID',
   spec_type            varchar(32) comment '规格类型',
   vbsc_meta_spec       integer(16) unsigned comment '元类型-基础字段',
   vbsc_mspec_desc      varchar(256) comment '元类型描述',
   vbsc_partition_id    integer(8) unsigned comment '分区id',
   vbsc_txid            bigint(20) unsigned comment '事务流水号',
   vbsc_creator         varchar(128) comment '创建者',
   vbsc_create_date     datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   region               varchar(255) comment '区域',
   primary key (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

alter table fdb_metar_tbl_spec comment '规格与表映射关系';

/*==============================================================*/
/* Table: fdb_metar_tj_entity                                   */
/*==============================================================*/
create table fdb_metar_tj_entity
(
   id                   bigint(20) unsigned not null comment 'id 主键',
   vkey_tj_id           bigint(20) comment '用户组ID',
   vkey_entity_id       bigint(20) comment '角色ID',
   entity_type          varchar(64),
   table_name           varchar(64) comment '关联表名称',
   vbsc_meta_spec       integer(16) unsigned comment '元类型-基础字段',
   vbsc_mspec_desc      varchar(256) comment '元类型描述',
   vbsc_partition_id    integer(8) unsigned comment '分区id',
   vbsc_txid            bigint(20) unsigned comment '事务流水号',
   vbsc_creator         varchar(128) comment '创建者',
   vbsc_create_date     datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   region               varchar(255) comment '区域',
   primary key (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

alter table fdb_metar_tj_entity comment '太极与实体对象关系表';

/*==============================================================*/
/* Table: fdb_metar_view_compt                                  */
/*==============================================================*/
create table fdb_metar_view_compt
(
   id                   bigint(20) unsigned not null comment 'id 主键',
   vkey_view_id         bigint(20) comment '规格ID',
   vkey_compt_id        bigint(20) comment '组件ID',
   vbsc_meta_spec       integer(16) unsigned comment '元类型-基础字段',
   vbsc_mspec_desc      varchar(256) comment '元类型描述',
   vbsc_partition_id    integer(8) unsigned comment '分区id',
   vbsc_txid            bigint(20) unsigned comment '事务流水号',
   vbsc_creator         varchar(128) comment '创建者',
   vbsc_create_date     datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   region               varchar(255) comment '区域',
   primary key (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

alter table fdb_metar_view_compt comment '界面与组件关联映射';

/*==============================================================*/
/* Table: fdb_metar_view_inter                                  */
/*==============================================================*/
create table fdb_metar_view_inter
(
   id                   bigint(20) unsigned not null comment 'id 主键',
   vkey_srcview_id      bigint(20) comment '源界面ID',
   vkey_dstview_id      bigint(20) comment '目标界面ID',
   inter_type           varchar(32) comment '交互方式',
   vkey_srccompt_id     bigint(20) comment '源组件ID',
   vkey_dstcompt_id     bigint(20) comment '目标组件ID',
   vbsc_meta_spec       integer(16) unsigned comment '元类型-基础字段',
   vbsc_mspec_desc      varchar(256) comment '元类型描述',
   vbsc_partition_id    integer(8) unsigned comment '分区id',
   vbsc_txid            bigint(20) unsigned comment '事务流水号',
   vbsc_creator         varchar(128) comment '创建者',
   vbsc_create_date     datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   region               varchar(255) comment '区域',
   primary key (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

alter table fdb_metar_view_inter comment '界面交互映射';

/*==============================================================*/
/* Table: fdb_scam_ciper_mng                                    */
/*==============================================================*/
create table fdb_scam_ciper_mng
(
   id                   bigint(20) unsigned not null comment 'id 主键',
   rel_parent_id        bigint(20) comment '父节点ID',
   ugrp_name            varchar(128) comment '名称',
   ugrp_code            varchar(64) comment '编码',
   ciper_type           varchar(32) comment '密钥类型',
   ciper_key            varchar(128) comment '密钥Key',
   ciper_salt           varchar(64) comment '密钥加盐',
   pub_key              varchar(512) comment '公钥',
   pri_key              varchar(4000) comment '私钥',
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

alter table fdb_scam_ciper_mng comment '秘钥管理';

/*==============================================================*/
/* Table: fdb_scam_organization                                 */
/*==============================================================*/
create table fdb_scam_organization
(
   id                   bigint(20) unsigned not null comment 'id 主键',
   short_name           varchar(255) comment '简称',
   org_manager          varchar(255) comment '组织正职领导',
   vice_manager         varchar(255) comment '组织副职领导',
   org_status_detail    varchar(64) comment '组织机构状态明细',
   org_level_code       varchar(64) comment '层级编码',
   org_status           varchar(16) comment '组织机构状态',
   is_corp              varchar(16) comment '是否公司',
   dept_level           varchar(32) comment '部门层级',
   org_type             varchar(32) comment '组织类型',
   corp_type            varchar(32) comment '公司类型',
   dept_type            varchar(128) comment '部门类型',
   show_num             integer(8) comment '排序编号',
   parent_corp_code     varchar(255) comment '上级公司编码',
   parent_corp_name     varchar(255) comment '上级公司名称',
   parent_dept_code     varchar(255) comment '上级部门编码',
   parent_dept_name     varchar(255) comment '上级部门名称',
   parent_org_code      varchar(255) comment '上级组织机构编码',
   parent_org_name      varchar(255) comment '上级组织机构名称',
   area_code            varchar(255) comment '所属地区编码',
   parent_id            bigint(20) unsigned comment '父ID',
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

alter table fdb_scam_organization comment '组织结构表';

/*==============================================================*/
/* Table: fdb_scam_role                                         */
/*==============================================================*/
create table fdb_scam_role
(
   id                   bigint(20) unsigned not null comment 'id 主键',
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
   role_name            varchar(128) comment '名称',
   role_code            varchar(64) comment '编码',
   region               varchar(255) comment '区域',
   primary key (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

alter table fdb_scam_role comment '系统角色表';

/*==============================================================*/
/* Table: fdb_scam_staff                                        */
/*==============================================================*/
create table fdb_scam_staff
(
   id                   bigint(20) unsigned not null comment 'id 主键',
   corp_code            varchar(128) comment '公司编码',
   user_type            varchar(16) comment '员工分类',
   card_photo           varchar(128) comment '证件照',
   born_date            datetime comment '出生日期',
   identity_num         varchar(32) comment '身份证号',
   gender               varchar(16) comment '性别',
   pre_phonenum         varchar(16) comment '首选手机号',
   work_tellnum         varchar(16) comment '办公电话',
   emp_status           varchar(16) comment '员工状态',
   position_name        varchar(128) comment '岗位名称',
   employ_date          datetime comment '入职时间',
   posi_sequence        varchar(16) comment '岗位序列',
   posi_level_type      varchar(128) comment '岗位体系',
   posi_type            varchar(128) comment '基准岗位',
   posi_level           varchar(16) comment '岗位等级',
   posi_layer_type      varchar(128) comment '岗位层级体系',
   posi_layer           varchar(16) comment '岗位层级',
   job_title            varchar(128) comment '职务',
   depat_name           varchar(128) comment '所属部门名',
   depat_code           varchar(128) comment '所属部门编码',
   corp_name            varchar(128) comment '所属公司名',
   posi_emp_type        varchar(128) comment '用户任职类型',
   area_code            varchar(32) comment '所属地区编码',
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

alter table fdb_scam_staff comment '员工信息表';

/*==============================================================*/
/* Table: fdb_scam_sysres                                       */
/*==============================================================*/
create table fdb_scam_sysres
(
   id                   bigint(20) unsigned not null comment 'id 主键',
   parent_id            bigint(20) unsigned comment '父ID',
   res_name             varchar(128) not null comment '名称',
   res_code             varchar(128) comment '编码',
   res_type             varchar(32) comment '资源类型',
   res_uri              varchar(255) comment '资源URI，自定义一个表达式，支持界面展现以及数据粒度',
   res_icon             varchar(128) comment '图标',
   res_express          varchar(255) comment '表达式',
   show_order           integer(4) comment '展示顺序',
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

alter table fdb_scam_sysres comment ' 系统资源表';

/*==============================================================*/
/* Table: fdb_scam_user                                         */
/*==============================================================*/
create table fdb_scam_user
(
   id                   bigint(20) unsigned not null comment 'id 主键',
   rel_staff_id         bigint(20) comment '所属员工ID',
   user_account         varchar(128) not null comment '用户账号',
   bak_account          varchar(128) comment '备用账号',
   nick_name            varchar(64) comment '昵称',
   acct_photo           varchar(128) comment '帐号头像',
   pass_salt            varchar(32) comment '加密盐',
   user_password        varchar(128) not null comment '密码(+盐)',
   account_type         varchar(32) comment '账号类别',
   email                varchar(128) not null comment '邮箱地址',
   birthday             varchar(16) comment '生日',
   reg_date             datetime comment '注册时间',
   reg_ipaddr           char(10) comment '注册IP地址',
   last_login_time      datetime comment '上次登录时间',
   last_login_ip        char(10) comment '上次登录IP',
   last_login_type      char(10) comment '登录类型，web桌面，手机端',
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

alter table fdb_scam_user comment '系统用户表';

/*==============================================================*/
/* Table: fdb_scam_user_group                                   */
/*==============================================================*/
create table fdb_scam_user_group
(
   id                   bigint(20) unsigned not null comment 'id 主键',
   rel_parent_id        bigint(20) comment '所属父角色组',
   ugrp_name            varchar(128) comment '名称',
   ugrp_code            varchar(64) comment '编码',
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

alter table fdb_scam_user_group comment '系统用户组';

/*==============================================================*/
/* Table: fdb_scam_user_trace                                   */
/*==============================================================*/
create table fdb_scam_user_trace
(
   id                   bigint(20) unsigned not null comment 'id 主键',
   rel_user_id          bigint(20) comment '所属用户ID',
   trace_type           varchar(32) comment '跟踪类型',
   client_ip            varchar(32) comment 'IP地址',
   mac_addr             varchar(32) comment 'MAC地址',
   client_dev_info      varchar(255) comment '使用设备信息',
   inter_token          varchar(255) comment '令牌会话',
   oper_conts           varchar(512) comment '操作内容',
   audit_conts          varchar(512) comment '审计内容',
   ugrp_name            varchar(128) comment '名称',
   ugrp_code            varchar(64) comment '编码',
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

alter table fdb_scam_user_trace comment '系统用户跟踪表';

/*==============================================================*/
/* Table: fdb_scar_ciper_entity                                 */
/*==============================================================*/
create table fdb_scar_ciper_entity
(
   ID                   bigint(20) unsigned not null comment 'id 主键',
   entity_tbl_name      varchar(64) comment '实体表名称',
   vkey_entity_id       bigint(20) comment '实体ID',
   vkey_ciper_id        bigint(20) comment '密钥ID',
   vbsc_meta_spec       integer(16) unsigned comment '元类型-基础字段',
   vbsc_mspec_desc      varchar(256) comment '元类型描述',
   vbsc_partition_id    integer(8) unsigned comment '分区id',
   vbsc_txid            bigint(20) unsigned comment '事务流水号',
   vbsc_creator         varchar(128) comment '创建者',
   vbsc_create_date     datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   region               varchar(255) comment '区域',
   primary key (ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

alter table fdb_scar_ciper_entity comment '密钥-实体映射关系';

/*==============================================================*/
/* Table: fdb_scar_org_staff                                    */
/*==============================================================*/
create table fdb_scar_org_staff
(
   id                   bigint(20) unsigned not null comment 'id 主键',
   vkey_org_id          bigint(20) comment '组织机构ID',
   vkey_staff_id        bigint(20) comment '员工ID',
   vbsc_meta_spec       integer(16) unsigned comment '元类型-基础字段',
   vbsc_mspec_desc      varchar(256) comment '元类型描述',
   vbsc_partition_id    integer(8) unsigned comment '分区id',
   vbsc_txid            bigint(20) unsigned comment '事务流水号',
   vbsc_creator         varchar(128) comment '创建者',
   vbsc_create_date     datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   region               varchar(255) comment '区域',
   primary key (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

alter table fdb_scar_org_staff comment '组织-员工关系表';

/*==============================================================*/
/* Table: fdb_scar_role_operm                                   */
/*==============================================================*/
create table fdb_scar_role_operm
(
   id                   bigint(20) unsigned not null comment 'id 主键',
   vkey_role_id         bigint(20) comment '角色ID',
   vkey_res_id          bigint(20) comment '资源ID',
   vbsc_meta_spec       integer(16) unsigned comment '元类型-基础字段',
   vbsc_mspec_desc      varchar(256) comment '元类型描述',
   vbsc_partition_id    integer(8) unsigned comment '分区id',
   vbsc_txid            bigint(20) unsigned comment '事务流水号',
   vbsc_creator         varchar(128) comment '创建者',
   vbsc_create_date     datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   region               varchar(255) comment '区域',
   primary key (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

alter table fdb_scar_role_operm comment '角色资源操作权限关联表';

/*==============================================================*/
/* Table: fdb_scar_ugrp_role                                    */
/*==============================================================*/
create table fdb_scar_ugrp_role
(
   id                   bigint(20) unsigned not null comment 'id 主键',
   vkey_ugrp_id         bigint(20) comment '用户组ID',
   vkey_role_id         bigint(20) comment '角色ID',
   vbsc_meta_spec       integer(16) unsigned comment '元类型-基础字段',
   vbsc_mspec_desc      varchar(256) comment '元类型描述',
   vbsc_partition_id    integer(8) unsigned comment '分区id',
   vbsc_txid            bigint(20) unsigned comment '事务流水号',
   vbsc_creator         varchar(128) comment '创建者',
   vbsc_create_date     datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   region               varchar(255) comment '区域',
   primary key (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

alter table fdb_scar_ugrp_role comment '用户组-角色关系表';

/*==============================================================*/
/* Table: fdb_scar_user_operm                                   */
/*==============================================================*/
create table fdb_scar_user_operm
(
   ID                   bigint(20) unsigned not null comment 'id 主键',
   vkey_user_id         bigint(20) comment '用户ID',
   vkey_operm_id        bigint(20) comment '操作权限ID',
   vbsc_meta_spec       integer(16) unsigned comment '元类型-基础字段',
   vbsc_mspec_desc      varchar(256) comment '元类型描述',
   vbsc_partition_id    integer(8) unsigned comment '分区id',
   vbsc_txid            bigint(20) unsigned comment '事务流水号',
   vbsc_creator         varchar(128) comment '创建者',
   vbsc_create_date     datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   region               varchar(255) comment '区域',
   primary key (ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

alter table fdb_scar_user_operm comment '用户-权限-关系表';

/*==============================================================*/
/* Table: fdb_scar_user_role                                    */
/*==============================================================*/
create table fdb_scar_user_role
(
   id                   bigint(20) unsigned not null comment 'id 主键',
   vkey_staff_id        bigint(20) comment '用户ID',
   vkey_role_id         bigint(20) comment '角色ID',
   vbsc_meta_spec       integer(16) unsigned comment '元类型-基础字段',
   vbsc_mspec_desc      varchar(256) comment '元类型描述',
   vbsc_partition_id    integer(8) unsigned comment '分区id',
   vbsc_txid            bigint(20) unsigned comment '事务流水号',
   vbsc_creator         varchar(128) comment '创建者',
   vbsc_create_date     datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   region               varchar(255) comment '区域',
   primary key (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

alter table fdb_scar_user_role comment '用户-角色关系表';

/*==============================================================*/
/* Table: fdb_scar_user_ugrp                                    */
/*==============================================================*/
create table fdb_scar_user_ugrp
(
   id                   bigint(20) unsigned not null comment 'id 主键',
   vkey_user_id         bigint(20) comment '用户ID',
   vkey_ugrp_id         bigint(20) comment '用户组ID',
   vbsc_meta_spec       integer(16) unsigned comment '元类型-基础字段',
   vbsc_mspec_desc      varchar(256) comment '元类型描述',
   vbsc_partition_id    integer(8) unsigned comment '分区id',
   vbsc_txid            bigint(20) unsigned comment '事务流水号',
   vbsc_creator         varchar(128) comment '创建者',
   vbsc_create_date     datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   region               varchar(255) comment '区域',
   primary key (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

alter table fdb_scar_user_ugrp comment ' 员工-用户组-关系表';

