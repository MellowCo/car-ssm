package com.li.services;

import com.li.domain.PageBean;
import com.li.domain.User;

import java.util.List;

/**
 * @Program: myssm
 * @ClassName: IUserServices
 * @Description:
 * @Author: li
 * @Create: 2019-08-09 14:39
 */
public interface IUserServices {

    /**
     * @Description: 查询所有用户
     * @Author: li
     * @Create: 2019/8/9-14:43
     * @param
     * @Return java.util.List<com.li.domain.User>
     */
    List<User> findAllUser();
    
    /**
     * @Description: 登陆校验
     * @Author: li
     * @Create: 2019/8/9-17:28
     * @param  
     * @Return java.lang.Integer
     */
    Integer Login(String email,String pwd);

    /**
     * @Description: 分页加模糊查询
     * @Author: li
     * @Create: 2019/8/9-20:53
     * @param start 开始数据
     * @param size 页面大小
     * @param user 模糊查询条件
     * @Return PageBean<User>
     */
    PageBean<User> pageUser(String start, String size, User user);

    /**
     * @Description: 添加用户
     * @Author: li
     * @Create: 2019/8/10-12:13
     * @param user
     * @Return void
     */
    int insertUser(User user);

    /**
     * @Description: 检查邮箱是否可用
     * @Author: li
     * @Create: 2019/8/10-12:46
     * @param email 
     * @Return int
     */
    int checkEmail(String email);

    /**
     * @Description: 更改用户信息
     * @Author: li
     * @Create: 2019/8/10-13:16
     * @param user 需要更改的用户信息
     * @Return int
     */
    int updateUser(User user);

    /**
     * @Description: 根据邮箱，返回用户信息
     * @Author: li
     * @Create: 2019/8/10-14:12
     * @param email 
     * @Return com.li.domain.User
     */
    User findUserByEmail(String email);

    /**
     * @Description: 删除用户
     * @Author: li
     * @Create: 2019/8/10-15:29
     * @param email 
     * @Return int
     */
    int delUser(String[] email);

    /**
     * @Description: 检查密码
     * @Author: li
     * @Create: 2019/8/11-13:34
     * @param email
     * @param pwd
     * @Return int
     */
    int checkPwd(String email,String pwd);
    

}
