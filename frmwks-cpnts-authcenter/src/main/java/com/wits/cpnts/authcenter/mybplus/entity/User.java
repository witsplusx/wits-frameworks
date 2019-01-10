package com.wits.cpnts.authcenter.mybplus.entity;

import lombok.Data;

/**
 * 工程名称：wits-frameworks
 * 类路径：com.wits.cpnts.authcenter.mybplus.entity
 * 团队名称：witshine
 *
 * @author wodedipan605891@gmail.com
 * @createdate 2018-12-31 22:07
 * @desc
 * @see
 */
@Data
public class User {

    private Long id;
    private String name;
    private Integer age;
    private String email;

}
