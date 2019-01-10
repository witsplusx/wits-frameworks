package com.wits.cpnts.authcenter.testcase.mybplus;

import com.wits.cpnts.authcenter.mybplus.entity.User;
import com.wits.cpnts.authcenter.mybplus.mapper.UserMapper;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

/**
 * 工程名称：wits-frameworks
 * 类路径：com.wits.cpnts.authcenter.testcase.mybplus
 * 团队名称：witshine
 *
 * @author wodedipan605891@gmail.com
 * @createdate 2018-12-31 22:09
 * @desc
 * @see
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class SampleTest {

    @Autowired
    private UserMapper userMapper;

    @Test
    public void testSelect() {
        System.out.println(("----- selectAll method test ------"));
        List<User> userList = userMapper.selectList(null);
        Assert.assertEquals(5, userList.size());
        userList.forEach(System.out::println);
    }

}
