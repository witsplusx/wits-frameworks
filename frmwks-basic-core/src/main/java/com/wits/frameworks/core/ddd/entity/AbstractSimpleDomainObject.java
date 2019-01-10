package com.wits.frameworks.core.ddd.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 工程名称：wits-frameworks
 * 类路径：com.wits.frameworks.core.ddd.entity
 * 团队名称：witshine
 *
 * @author wodedipan605891@gmail.com
 * @createdate 2019-01-02 20:57
 * @desc
 * @see
 */
public abstract class AbstractSimpleDomainObject<ID extends Serializable> extends AbstractDomainObject<ID> {


    private static final long serialVersionUID = 5891480982236336994L;

    private Date createTime;

    private Date lastUpdateTime;

    @Override
    public Date getGenTime() {
        return createTime;
    }

    @Override
    public Date getLastUpTime() {
        return lastUpdateTime;
    }


}
