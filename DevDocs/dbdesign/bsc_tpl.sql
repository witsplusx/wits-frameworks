/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2018/12/29 15:18:48                          */
/*==============================================================*/


drop table if exists bsc_relations;

drop table if exists bsc_table_tpl;

/*==============================================================*/
/* Table: bsc_relations                                         */
/*==============================================================*/
create table bsc_relations
(
   id                   bigint(20) unsigned not null comment 'id 主键',
   vkey_start_id        bigint(20),
   vkey_end_id          bigint(20),
   vbsc_meta_spec       integer(16) unsigned comment '元类型-基础字段',
   vbsc_mspec_desc      varchar(256) comment '元类型描述',
   vbsc_partition_id    integer(8) unsigned comment '分区id',
   vbsc_txid            bigint(20) unsigned comment '事务流水号',
   vbsc_creator         varchar(128) comment '创建者',
   vbsc_create_date     datetime not null default CURRENT_TIMESTAMP comment '创建时间',
   region               varchar(255) comment '区域',
   primary key (id)
);

alter table bsc_relations comment '基础关联表';

/*==============================================================*/
/* Table: bsc_table_tpl                                         */
/*==============================================================*/
create table bsc_table_tpl
(
   id                   bigint(20) unsigned not null comment 'id 主键',
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
);

alter table bsc_table_tpl comment '基础数据表';

