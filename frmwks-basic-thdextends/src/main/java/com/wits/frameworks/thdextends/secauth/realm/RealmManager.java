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
package com.wits.frameworks.thdextends.secauth.realm;

import com.google.common.collect.Lists;
import com.wits.frameworks.thdextends.secauth.authc.WitsHmacMatcher;
import com.wits.frameworks.thdextends.secauth.authc.WitsJwtMatcher;
import com.wits.frameworks.thdextends.secauth.authc.WitsPasswdMatcher;
import com.wits.frameworks.thdextends.secauth.cache.CacheDelegator;
import com.wits.frameworks.thdextends.secauth.config.MessageConfig;
import com.wits.frameworks.thdextends.secauth.config.ShiroProperties;
import com.wits.frameworks.thdextends.secauth.service.DefaultStatelessAccountProvider;
import com.wits.frameworks.thdextends.secauth.service.ShiroAccountProvider;
import com.wits.frameworks.thdextends.secauth.service.ShiroCryptoService;
import com.wits.frameworks.thdextends.secauth.service.ShiroStatelessAccountProvider;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.realm.Realm;

import java.util.Collections;
import java.util.List;

/**
 * REALM 管理器
 *
 * @author wodedipan605891@gmail.com
 * @createdate 2018-12-13 21:12
 */
public class RealmManager {

	private ShiroProperties properties;
	private MessageConfig messages;
	private WitsPasswdMatcher witsPasswdMatcher;
	private ShiroCryptoService shiroCryptoService;
	private ShiroAccountProvider accountProvider;
	private ShiroStatelessAccountProvider statelessAccountProvider;
	private List<Realm> customRealms;
	private CacheDelegator cacheDelegator;

	private List<Realm> statefulRealms = Lists.newLinkedList();
	private List<Realm> statelessRealms = Lists.newLinkedList();
	private List<Realm> cachedRealms = Lists.newLinkedList();


	public void initRealms(){
		if(null == this.statelessAccountProvider){
			DefaultStatelessAccountProvider defaultStatelessAccountProvider = new DefaultStatelessAccountProvider();
			defaultStatelessAccountProvider.setShiroAccountProvider(accountProvider);
			statelessAccountProvider = defaultStatelessAccountProvider;
		}
		PasswdRealm passwdRealm = new PasswdRealm();
		passwdRealm.setCredentialsMatcher(this.witsPasswdMatcher);
		passwdRealm.setAccountProvider(this.accountProvider);
		passwdRealm.setMessages(this.messages);
		if (this.properties.isAuthCacheEnabled()) {
			passwdRealm.setAuthorizationCacheName(ShiroProperties.CACHE_NAME_AUTHORIZATION);
			passwdRealm.setAuthenticationCacheName(ShiroProperties.CACHE_NAME_AUTHENTICATION);
			passwdRealm.setCachingEnabled(Boolean.TRUE);
			passwdRealm.setAuthenticationCachingEnabled(Boolean.TRUE);
			passwdRealm.setAuthorizationCachingEnabled(Boolean.TRUE);
			this.addCachedRealms(passwdRealm);
		}  else {
			passwdRealm.setCachingEnabled(Boolean.FALSE);
		}
		this.addStatefulRealms(passwdRealm);
		if (this.properties.isHmacEnabled()) {
			WitsHmacMatcher hmacMatcher = new WitsHmacMatcher();
			hmacMatcher.setAccountProvider(this.statelessAccountProvider);
			hmacMatcher.setMessages(this.messages);
			hmacMatcher.setCryptoService(this.shiroCryptoService);
			hmacMatcher.setProperties(this.properties);
			hmacMatcher.setCacheDelegator(this.cacheDelegator);
			HmacRealm hmacRealm = new HmacRealm();
			hmacRealm.setAccountProvider(this.statelessAccountProvider);
			hmacRealm.setCredentialsMatcher(hmacMatcher);
			hmacRealm.setCachingEnabled(Boolean.FALSE);
			this.addStatelessRealms(hmacRealm);
		}
		if (properties.isJwtEnabled()) {
			WitsJwtMatcher jwtMatcher = new WitsJwtMatcher();
			jwtMatcher.setProperties(this.properties);
			jwtMatcher.setMessages(this.messages);
			jwtMatcher.setCryptoService(this.shiroCryptoService);
			jwtMatcher.setCacheDelegator(this.cacheDelegator);
			JwtRealm jwtRealm = new JwtRealm();
			jwtRealm.setCredentialsMatcher(jwtMatcher);
			jwtRealm.setCachingEnabled(Boolean.FALSE);
			this.addStatelessRealms(jwtRealm);
		}

		this.customRealms.forEach(realm -> {
			if (realm instanceof AuthorizingRealm) {
				AuthorizingRealm authorizingRealm = (AuthorizingRealm) realm;
				if(null == authorizingRealm.getCredentialsMatcher()){
					authorizingRealm.setCredentialsMatcher(witsPasswdMatcher);
				}
				if(authorizingRealm.isAuthenticationCachingEnabled() && this.properties.isAuthCacheEnabled()){
					authorizingRealm.setAuthenticationCacheName(ShiroProperties.CACHE_NAME_AUTHENTICATION);
				}
				if(authorizingRealm.isAuthorizationCachingEnabled() && this.properties.isAuthCacheEnabled()){
					authorizingRealm.setAuthorizationCacheName(ShiroProperties.CACHE_NAME_AUTHORIZATION);
				}
				this.cachedRealms.add(authorizingRealm);
				this.statefulRealms.add(authorizingRealm);
			} else {
				this.statefulRealms.add(realm);
			}
		});
	}

	public void addStatefulRealms(Realm statefulRealm) {
		this.statefulRealms.add(statefulRealm);
	}
	public void addStatelessRealms(Realm statelessRealm) {
		this.statelessRealms.add(statelessRealm);
	}
	public void addCachedRealms(Realm cachedRealm) {
		this.cachedRealms.add(cachedRealm);
	}
	public List<Realm> getAllRealms() {
		List<Realm> realms = Lists.newLinkedList();
		realms.addAll(this.getStatefulRealms());
		realms.addAll(this.getStatelessRealms());
		return Collections.unmodifiableList(realms);
	}



	public List<Realm> getStatefulRealms() {
		return statefulRealms;
	}
	public List<Realm> getStatelessRealms() {
		return statelessRealms;
	}
	public List<Realm> getCachedRealms() {
		return cachedRealms;
	}
	public void setProperties(ShiroProperties properties) {
		this.properties = properties;
	}
	public void setWitsPasswdMatcher(WitsPasswdMatcher witsPasswdMatcher) {
		this.witsPasswdMatcher = witsPasswdMatcher;
	}
	public void setShiroCryptoService(ShiroCryptoService shiroCryptoService) {
		this.shiroCryptoService = shiroCryptoService;
	}
	public void setMessages(MessageConfig messages) {
		this.messages = messages;
	}
	public void setAccountProvider(ShiroAccountProvider accountProvider) {
		this.accountProvider = accountProvider;
	}
	public void setStatelessAccountProvider(ShiroStatelessAccountProvider statelessAccountProvider) {
		this.statelessAccountProvider = statelessAccountProvider;
	}
	public void setCustomRealms(List<Realm> customRealms) {
		this.customRealms = customRealms;
	}
	public void setCacheDelegator(CacheDelegator cacheDelegator) {
		this.cacheDelegator = cacheDelegator;
	}
}
