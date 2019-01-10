package com.wits.cpnts.authcenter.mybplus;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * 工程名称：wits-frameworks
 * 类路径：com.wits.cpnts.authcenter.mybplus
 * 团队名称：witshine
 *
 * @author wodedipan605891@gmail.com
 * @createdate 2018-12-31 22:03
 * @desc
 * @see
 *
 */
@SpringBootApplication
@MapperScan("com.wits.cpnts.authcenter.mybplus.mapper")
public class SampleApplication {

    public static void main(String[] args) {
        SpringApplication.run(SampleApplication.class, args);
    }

}
