package com.wits.frameworks.core.ddd.entity;



import java.io.Serializable;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * 工程名称：wits-frameworks
 * 类路径：com.wits.frameworks.core.ddd.entity
 * 团队名称：witshine
 *
 * @author wodedipan605891@gmail.com
 * @createdate 2019-01-02 20:50
 * @desc
 * @see
 */
public class EventContainer implements Serializable {

    private final Map<Object, EventMessage> eventMessageMap = new LinkedHashMap<>();

    public <T> void addEvent(T payload) {

        if (!eventMessageMap.containsKey(payload)) {
            EventMessage eventMessage = new SimpleEventMessage(payload);
            eventMessageMap.put(payload, eventMessage);
        }
    }

    public Collection<EventMessage> getEvents() {
        return eventMessageMap.values();
    }

    public void commit() {
        eventMessageMap.clear();
    }

    public void clear() {
        eventMessageMap.clear();
    }

}
