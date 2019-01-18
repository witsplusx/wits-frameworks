package com.wits.cpnts.dbsharding.mdl;

import lombok.Data;

import java.io.Serializable;

/**
 * 工程名称：wits-frameworks
 * 类路径：com.wits.cpnts.dbsharding.domain.partition
 * 团队名称：witshine
 *
 * @author wodedipan605891@gmail.com
 * @createdate 2019-01-15 21:51
 * @desc
 * @see
 */
@Data
public class ShardGroup implements Serializable {

    private Long id;
    private String name;
    private String code;
    private Boolean writable;

    private Long relPartitionId;

}
