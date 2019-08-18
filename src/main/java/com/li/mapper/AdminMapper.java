package com.li.mapper;

import org.apache.ibatis.annotations.Param;

public interface AdminMapper {
    /**
     * @Description: 查看管理员是否存在
     * @Author: li
     * @Create: 2019/8/9-17:15
     * @param username 数据库主键
     * @Return java.lang.Integer 1:用户存在
     */
    Integer findAdmin(String username);

    /**
     * @Description: 根据用户名和密码查找管理员
     * @Author: li
     * @Create: 2019/8/9-17:16
     * @param username 用户名
     * @param pwd 密码
     * @Return java.lang.Integer 1:密码正确
     */
    Integer findAdminAndPwd(@Param("username") String username, @Param("pwd") String password);

}