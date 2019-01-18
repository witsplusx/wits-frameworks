package com.wits.frameworks.core.ddd.entity;

import java.io.Serializable;

/**
 * 工程名称：wits-frameworks
 * 类路径：com.wits.frameworks.core.ddd.entity
 * 团队名称：witshine
 *
 * @author wodedipan605891@gmail.com
 * @createdate 2019-01-02 21:07
 * @desc
 * @see
 */
public interface EventMessageLoc extends Serializable {

    Class getPayloadType();

    Object getPayload();

    MessageType getMessageType();

}
