package com.li.mapper;

import com.li.domain.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserMapper {
    /**
     * @Description: 查找所有用户
     * @Author: li
     * @Create: 2019/8/9-14:36
     * @param
     * @Return java.util.List<User>
     */
    List<User> findAllUser();

    /**
     * @Description: 根据email查看用户是否存在
     * @Author: li
     * @Create: 2019/8/9-17:15
     * @param email 数据库主键
     * @Return User
     */
    User findUser(String email);

    /**
     * @Description: 根据用户名和密码查找用户
     * @Author: li
     * @Create: 2019/8/9-17:16
     * @param email 用户名
     * @param pwd 密码
     * @Return java.lang.Integer 1:密码正确
     */
    Integer findUserAndPwd(@Param("email") String email, @Param("pwd") String pwd);

    /**
     * @Description: 根据用户名，返回用户状态
     * @Author: li
     * @Create: 2019/8/9-17:18
     * @param email 用户名
     * @Return java.lang.Integer
     * -1:表示被拉黑
     *  1:表示可用
     */
    Integer findUserStatus(String email);

    /**
     * @Description: 分页加模糊查询
     * @Author: li
     * @Create: 2019/8/9-20:53
     * @param start 开始数据
     * @param size 页面大小
     * @param user 模糊查询条件
     * @Return java.util.List<com.li.domain.User>
     */
    List<User> pageUser(@Param("start") int start, @Param("size") int size, @Param("user") User user);

    /**
     * @Description: 返回模糊查询的数据
     * @Author: li
     * @Create: 2019/8/9-21:09
     * @param user
     * @Return java.lang.Integer
     */
    Integer pageUserSize(User user);

    /**
     * @Description: 添加用户
     * @Author: li
     * @Create: 2019/8/10-12:13
     * @param user
     * @Return int
     */
    int insertUser(User user);

    /**
     * @Description: 更改用户信息
     * @Author: li
     * @Create: 2019/8/10-13:10
     * @param user 
     * @Return int
     */
    int updateUser(User user);

    /**
     * @Description: 删除用户
     * @Author: li
     * @Create: 2019/8/10-15:12
     * @param email
     * @Return int
     */
    int delUser(String[] email);

    /**
     * @Description: 更新用户 黑名单状态
     * @Author: li
     * @Create: 2019/8/11-14:38
     * @param email 
     * @Return int
     */
    int updateStatus(String[] email);

}