


drop table if exists emp_odrm_transaction;

/*==============================================================*/
/* Table: emp_odrm_transaction                                  */
/*==============================================================*/
create table emp_odrm_transaction
(
   id                   bigint(20) unsigned not null comment 'id 主键',
   order_sn             varchar(128) comment '交易单号',
   order_id             bigint(20) comment '订单ID',
   member_id            bigint(20) comment '交易用户ID',
   trans_amount         decimal(12,4) comment '交易金额',
   integral             integer(12) comment '积分',
   pay_type             varchar(32) comment '支付类型，余额、支付宝、微信',
   pay_source           varchar(32) comment '支付来源，终端应用类型名称  wap app web',
   pay_status           integer(4) comment '支付状态 -1 取消 0 未完成 1 已完成 -2 异常',
   trans_done_time      datetime comment '交易完成时间',
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

 alter table fdb_metar_compt_rel comment '交易表';
