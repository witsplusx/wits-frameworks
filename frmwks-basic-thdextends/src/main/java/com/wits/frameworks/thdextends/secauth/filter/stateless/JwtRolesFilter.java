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
package com.wits.frameworks.thdextends.secauth.filter.stateless;



import com.wits.frameworks.thdextends.secauth.config.MessageConfig;
import com.wits.frameworks.thdextends.secauth.util.Commons;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.util.WebUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/**
 * 基于JWT(JSON WEB TOKEN)的无状态过滤器--角色验证过滤器
 *
 * @author wodedipan605891@gmail.com
 * @createdate 2018-12-13 21:12
 */
public class JwtRolesFilter extends StatelessFilter {

	private static final Logger LOGGER = LoggerFactory.getLogger(JwtRolesFilter.class);


	@Override
	protected boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue) throws Exception {
		Subject subject = getSubject(request, response);
		if ((null == subject || !subject.isAuthenticated()) && isJwtSubmission(request)) {
			AuthenticationToken token = createJwtToken(request, response);
			try {
				subject = getSubject(request, response);
				subject.login(token);
				return this.checkRoles(subject,mappedValue);
			} catch (AuthenticationException e) {
				LOGGER.error(request.getRemoteHost()+" JWT鉴权  "+e.getMessage());
				Commons.restFailed(WebUtils.toHttp(response)
										, MessageConfig.REST_CODE_AUTH_UNAUTHORIZED,e.getMessage());
			}
		}
		return false;
	}


}
