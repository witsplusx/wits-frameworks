package com.wits.frameworks.core.ddd.entity;

/**
 * 工程名称：wits-frameworks
 * 类路径：com.wits.frameworks.core.ddd.entity
 * 团队名称：witshine
 *
 * @author wodedipan605891@gmail.com
 * @createdate 2019-01-02 21:09
 * @desc
 * @see
 */
public class SimpleEventMessage<T> implements EventMessage {


    private static final long serialVersionUID = 4075952009259360956L;

    final T payload;

    private MessageType type = MessageType.DOMAIN_EVENT;

    public SimpleEventMessage(T payload) {
        this.payload = payload;
    }

    public SimpleEventMessage(T payload, MessageType type) {
        this.payload = payload;
        this.type = type;
    }

    @Override
    public Class getPayloadType() {
        return payload.getClass();
    }

    @Override
    public Object getPayload() {
        return payload;
    }

    @Override
    public MessageType getMessageType() {
        return type;
    }

    @Override
    public int hashCode() {
        int hashCode = 17;
        hashCode += null == payload ? 0 : payload.hashCode() * 31;
        hashCode += type.hashCode() * 31;

        return hashCode;
    }

    @Override
    public boolean equals(Object other) {

        if (other == null) {
            return false;
        }

        if (this == other) {
            return true;
        }

        if (!this.getClass().equals(other.getClass())) {
            return false;
        }

        SimpleEventMessage<T> that = (SimpleEventMessage<T>) other;

        if (this.payload == null || that.payload == null) {
            return true;
        }

        return this.payload.equals(that.payload) && type.equals(that.type);
    }

}
