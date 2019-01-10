package com.wits.cpnts.authcenter.constini;

import com.baomidou.mybatisplus.extension.plugins.PaginationInterceptor;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * 工程名称：wits-frameworks
 * 类路径：com.wits.cpnts.authcenter.constini
 * 团队名称：witshine
 *
 * @author wodedipan605891@gmail.com
 * @createdate 2018-12-31 22:51
 * @desc
 * @see
 */
@EnableTransactionManagement
@Configuration
@MapperScan("com.baomidou.cloud.appsvc.*.mapper*")
public class MybatisPlusConfig {

    /**
     * 分页插件
     */
    @Bean
    public PaginationInterceptor paginationInterceptor() {
        return new PaginationInterceptor();
    }

}
