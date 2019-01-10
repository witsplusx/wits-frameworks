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
package com.wits.frameworks.thdextends.secauth.authc;



import com.wits.frameworks.thdextends.secauth.util.Commons;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.mgt.DefaultSessionStorageEvaluator;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.subject.SubjectContext;
import org.apache.shiro.web.mgt.DefaultWebSubjectFactory;


/**
 * 扩展自DefaultWebSubjectFactory,对于无状态的TOKEN不创建session
 *
 * @author wodedipan605891@gmail.com
 * @createdate 2018-12-20 16:54
 */
public class WitsSubjectFactory extends DefaultWebSubjectFactory {

	private final DefaultSessionStorageEvaluator storageEvaluator;

	/**
	 * DefaultSessionStorageEvaluator是否持久化SESSION的开关
	 */
	public WitsSubjectFactory(DefaultSessionStorageEvaluator storageEvaluator){
		this.storageEvaluator = storageEvaluator;
	}

	@Override
    public Subject createSubject(SubjectContext context) {
    	this.storageEvaluator.setSessionStorageEnabled(Boolean.TRUE);
    	AuthenticationToken token = context.getAuthenticationToken();
    	if(Commons.isStatelessToken(token)){
            // 不创建 session
            context.setSessionCreationEnabled(false);
            // 不持久化session
            this.storageEvaluator.setSessionStorageEnabled(Boolean.FALSE);
    	}
        return super.createSubject(context);
    }

}
