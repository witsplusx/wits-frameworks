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
 * @createdate 2019-01-02 20:48
 * @desc
 * @see
 */
public abstract class AbstractAggregateRoot <ID extends Serializable> extends AbstractDomainObject<ID> implements AggregateRoot<ID> {

    private static final long serialVersionUID = -7295689940261849143L;

    private transient boolean isDeleted = false;

/*    @Transient
    private transient EventContainer domainEventContainer;

    protected void apply(Object eventPayload) {
        getDomainEventContainer().addEvent(eventPayload);
    }*/

    @Override
    public boolean isDeleted() {
        return isDeleted;
    }

/*
    @Override
    public Collection<? extends EventMessage> getUncommittedDomainEvents() {
        return getDomainEventContainer().getEvents();
    }
*/

/*
    @Override
    public void commitDomainEvents() {
        getDomainEventContainer().commit();
    }

    @Override
    public void clearDomainEvents() {
        getDomainEventContainer().clear();
    }

    public EventContainer getDomainEventContainer() {
        ensureDomainEventContainerInitialized();
        return domainEventContainer;
    }

    private void ensureDomainEventContainerInitialized() {
        if (domainEventContainer == null) {
            domainEventContainer = new EventContainer();
        }
    }
*/

}
