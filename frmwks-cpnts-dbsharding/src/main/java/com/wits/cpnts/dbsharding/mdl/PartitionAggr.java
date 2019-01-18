package com.wits.cpnts.dbsharding.mdl;

import lombok.Data;

import java.io.Serializable;

/**
 * 工程名称：wits-frameworks
 * 类路径：com.wits.cpnts.dbsharding.domain
 * 团队名称：witshine
 *
 * @author wodedipan605891@gmail.com
 * @createdate 2019-01-15 21:44
 * @desc
 * @see
 */
@Data
public class PartitionAggr implements Serializable {

    private Long id;
    private String pName;
    private String pCode;

}
