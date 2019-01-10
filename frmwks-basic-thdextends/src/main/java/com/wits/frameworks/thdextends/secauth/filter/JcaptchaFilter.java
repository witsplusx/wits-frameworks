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



import com.wits.frameworks.thdextends.secauth.util.JCaptchaUtil;
import org.apache.shiro.web.servlet.OncePerRequestFilter;
import org.apache.shiro.web.util.WebUtils;

import javax.imageio.ImageIO;
import javax.servlet.*;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.IOException;

/**
 * 验证码生成过滤器
 *
 * @author wodedipan605891@gmail.com
 * @createdate 2018-12-13 21:12
 *
 */
public class JcaptchaFilter extends OncePerRequestFilter {

	@Override
	public void doFilterInternal(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletResponse httpResponse = WebUtils.toHttp(response);
		httpResponse.setHeader("Cache-Control", "no-store");
		httpResponse.setHeader("Pragma", "no-cache");
		httpResponse.setDateHeader("Expires", 0);
		httpResponse.setContentType("image/jpeg");
        ServletOutputStream output = httpResponse.getOutputStream();
        try {
            BufferedImage image = JCaptchaUtil.generateCaptcha(WebUtils.toHttp(request));
            ImageIO.write(image, "jpg", output);
            output.flush();
        } finally {
        	output.close();
        }

	}
}
