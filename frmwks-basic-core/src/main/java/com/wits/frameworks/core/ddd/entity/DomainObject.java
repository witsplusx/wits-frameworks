package com.wits.frameworks.core.ddd.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 工程名称：wits-frameworks
 * 类路径：com.wits.frameworks.core.ddd
 * 团队名称：witshine
 *
 * @author wodedipan605891@gmail.com
 * @createdate 2019-01-02 20:39
 * @desc
 * @see
 */
public interface DomainObject<ID extends Serializable> extends Serializable {

    ID getId();

    void setId(ID id);

    boolean isNew();

    Date getGenTime();

    Date getLastUpTime();

}
