package com.wits.frameworks.core.ddd.entity;

import org.axonframework.eventhandling.EventMessage;

import java.io.Serializable;
import java.util.Collection;

/**
 * 工程名称：wits-frameworks
 * 类路径：com.wits.frameworks.core.ddd.entity
 * 团队名称：witshine
 *
 * @author wodedipan605891@gmail.com
 * @createdate 2019-01-02 20:44
 * @desc
 * @see
 */
public interface AggregateRoot<ID extends Serializable> extends DomainObject<ID> {

    Collection<? extends EventMessage> getUncommittedDomainEvents();

    long getVersion();

    boolean isDeleted();

    void commitDomainEvents();

    void clearDomainEvents();

}
