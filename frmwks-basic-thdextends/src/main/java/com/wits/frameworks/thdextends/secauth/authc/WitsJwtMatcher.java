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

import com.google.common.base.Strings;

import com.wits.frameworks.thdextends.secauth.cache.CacheDelegator;
import com.wits.frameworks.thdextends.secauth.config.MessageConfig;
import com.wits.frameworks.thdextends.secauth.config.ShiroProperties;
import com.wits.frameworks.thdextends.secauth.model.StatelessLogined;
import com.wits.frameworks.thdextends.secauth.service.ShiroCryptoService;
import com.wits.frameworks.thdextends.secauth.service.ShiroStatelessAccountProvider;
import com.wits.frameworks.thdextends.secauth.util.Commons;
import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.SignatureException;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.credential.CredentialsMatcher;

/**
 * JWT匹配器
 *
 * @author wodedipan605891@gmail.com
 * @createdate 2018-12-13 21:12
 */
public class WitsJwtMatcher implements CredentialsMatcher {

	private ShiroProperties properties;
	private MessageConfig messages;
	private ShiroCryptoService cryptoService;
	private ShiroStatelessAccountProvider accountProvider;
	private CacheDelegator cacheDelegator;

	@Override
	public boolean doCredentialsMatch(AuthenticationToken token, AuthenticationInfo info) {
		String jwt = (String) info.getCredentials();
		StatelessLogined statelessAccount = null;
		try{
			if(Commons.hasLen(this.properties.getJwtSecretKey())){
				statelessAccount = this.cryptoService.parseJwt(jwt);
			} else {
				String appId = (String) Commons.readValue(Commons.parseJwtPayload(jwt)).get("subject");
				String appKey = accountProvider.loadAppKey(appId);
				if(Strings.isNullOrEmpty(appKey))
					throw new AuthenticationException(MessageConfig.MSG_NO_SECRET_KEY);
				statelessAccount = this.cryptoService.parseJwt(jwt,appKey);
			}

		} catch(SignatureException e){
			throw new AuthenticationException(this.properties.getJwtSecretKey());
		} catch(ExpiredJwtException e){
			throw new AuthenticationException(this.messages.getMsgJwtTimeout());
		} catch(Exception e){
			throw new AuthenticationException(this.messages.getMsgJwtError());
		}
		if(null == statelessAccount){
			throw new AuthenticationException(this.messages.getMsgJwtError());
		}
		String tokenId = statelessAccount.getTokenId();
		if(this.properties.isJwtBurnEnabled()
				&&this.cacheDelegator.cutBurnedToken(tokenId)){
			throw new AuthenticationException(MessageConfig.MSG_BURNED_TOKEN);
		}
        return true;
	}

	public void setProperties(ShiroProperties properties) {
		this.properties = properties;
	}
	public void setCryptoService(ShiroCryptoService cryptoService) {
		this.cryptoService = cryptoService;
	}
	public void setMessages(MessageConfig messages) {
		this.messages = messages;
	}
	public void setCacheDelegator(CacheDelegator cacheDelegator) {
		this.cacheDelegator = cacheDelegator;
	}
}
