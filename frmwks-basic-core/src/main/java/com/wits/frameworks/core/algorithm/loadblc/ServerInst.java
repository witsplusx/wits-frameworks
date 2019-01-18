package com.wits.frameworks.core.algorithm.loadblc;

import lombok.Data;

/**
 * 工程名称：wits-frameworks
 * 类路径：com.wits.frameworks.core.algorithm.loadblc
 * 团队名称：witshine
 *
 * @author wodedipan605891@gmail.com
 * @createdate 2019-01-17 17:56
 * @desc
 * @see
 */
@Data
public class ServerInst {

    private String instUniCode;
    private int weight;

    public ServerInst(String inst, int weight) {
        this.instUniCode = inst;
        this.weight = weight;
    }

}
