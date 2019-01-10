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
package com.wits.frameworks.thdextends.secauth.service;



import com.wits.frameworks.thdextends.secauth.model.Account;
import org.apache.shiro.authc.AuthenticationException;

import java.util.Set;

/**
 * 账号信息提供者接口<br>
 * 应用系统实现这个接口为鉴权提供必要的账号信息。
 *
 * @author wodedipan605891@gmail.com
 * @createdate 2018-12-20 16:54
 */
public interface ShiroAccountProvider {
	/**
	 * 根据用户名获取账号信息
	 * @return 账号信如果查找不到用户返回null或者直接抛出AuthenticationException
	 * @param account
	 * @see
	 */
	Account loadAccount(String account) throws AuthenticationException;
	/**
	 * 根据用户名称加载用户所有的角色
	 * @param account 账号
	 * @return 角色列表
	 */
	Set<String> loadRoles(String account);
	/**
	 * 根据用户名称加载用户所有的权限
	 * @param account 账号
	 * @return 权限列表
	 */
	Set<String> loadPermissions(String account);
}
