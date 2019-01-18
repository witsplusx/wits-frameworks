package com.wits.cpnts.dbsharding.mdl;

import lombok.Data;

import java.io.Serializable;

/**
 * 工程名称：wits-frameworks
 * 类路径：com.wits.cpnts.dbsharding.mdl
 * 团队名称：witshine
 *
 * @author wodedipan605891@gmail.com
 * @createdate 2019-01-16 09:11
 * @desc
 * @see
 */
@Data
public class DataInterval implements Serializable {

    private Long id;
    private String type;
    private Long startId;
    private Long endId;

}
