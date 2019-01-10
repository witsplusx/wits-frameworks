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
package com.wits.frameworks.thdextends.secauth.filter;



import com.wits.frameworks.thdextends.secauth.config.MessageConfig;
import com.wits.frameworks.thdextends.secauth.util.Commons;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.StringUtils;
import org.apache.shiro.web.filter.authz.AuthorizationFilter;
import org.apache.shiro.web.util.WebUtils;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 抽象权限过滤器,扩展自AuthorizationFilter增加了针对ajax请求的处理。
 *
 * @author wodedipan605891@gmail.com
 * @createdate 2018-12-13 21:12
 */
public abstract class WitsAuthorizationFilter extends AuthorizationFilter{

    protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws IOException {
        Subject subject = getSubject(request, response);
        //未认证
        if (null == subject.getPrincipal()) {
    		if (Commons.isAjax(WebUtils.toHttp(request))) {
    			Commons.ajaxFailed(WebUtils.toHttp(response)
    					,HttpServletResponse.SC_UNAUTHORIZED
    					, MessageConfig.REST_CODE_AUTH_UNAUTHORIZED
    					,MessageConfig.REST_MESSAGE_AUTH_UNAUTHORIZED);
    		}
            saveRequestAndRedirectToLogin(request, response);
        //未授权
        } else {
    		if (Commons.isAjax(WebUtils.toHttp(request))) {
    			Commons.ajaxFailed(WebUtils.toHttp(response)
    					,HttpServletResponse.SC_FORBIDDEN
    					,MessageConfig.REST_CODE_AUTH_FORBIDDEN
    					,MessageConfig.REST_MESSAGE_AUTH_FORBIDDEN);
    		}else{
                String unauthorizedUrl = getUnauthorizedUrl();
                if (StringUtils.hasText(unauthorizedUrl)) {
                    WebUtils.issueRedirect(request, response, unauthorizedUrl);
                } else {
                    WebUtils.toHttp(response).sendError(HttpServletResponse.SC_FORBIDDEN);
                }
    		}
        }
        return false;
    }

}
