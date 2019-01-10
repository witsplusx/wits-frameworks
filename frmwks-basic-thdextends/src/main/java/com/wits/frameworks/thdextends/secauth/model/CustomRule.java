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

import com.google.common.base.Strings;

/**
 * 自由定制的权限验证规则
 *
 * @author wodedipan605891@gmail.com
 * @createdate 2018-12-20 16:54
 *
 */
public class CustomRule extends AuthorizeRule{

	private static final long serialVersionUID = 1L;

    /**
     * 资源URL
     */
	private String url;
    /**
     *  过滤规则
     */
	private String rule;

	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getRule() {
		return rule;
	}
	public void setRule(String rule) {
		this.rule = rule;
	}

	@Override
	public StringBuilder toFilterChain() {
		if(Strings.isNullOrEmpty(this.getUrl())) {
		    return null;
        }
		if(Strings.isNullOrEmpty(this.getRule())) {
		    return null;
        }
		return new StringBuilder(this.getRule());
	}

}
