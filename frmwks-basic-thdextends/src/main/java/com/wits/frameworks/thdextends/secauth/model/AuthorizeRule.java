/*
 * Copyright 2017-2018 the original author(https://github.com/wj596)
 *
 * <p>
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * </p>
 */
package com.wits.frameworks.thdextends.secauth.model;

import java.io.Serializable;

/**
 *
 * 权限验证规则
 * @author wodedipan605891@gmail.com
 * @createdate 2018-12-20 16:54
 *
 */
public abstract class AuthorizeRule implements Serializable{

	private static final long serialVersionUID = 1L;

	public static final short RULE_TYPE_DEF = 1;
	public static final short RULE_TYPE_HMAC = 2;
	public static final short RULE_TYPE_JWT = 3;
	public static final short RULE_TYPE_CUSTOM = 4;

    /**
     * 规则类型
     */
	private short type;

	public short getType() {
		return type;
	}
	public void setType(short type) {
		this.type = type;
	}

	public abstract StringBuilder toFilterChain();
}
