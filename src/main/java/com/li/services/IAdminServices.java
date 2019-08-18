package com.li.services;

/**
 * @Program: myssm
 * @ClassName: IAdminServices
 * @Description:
 * @Author: li
 * @Create: 2019-08-09 20:04
 */
public interface IAdminServices {

    /**
     * @Description: 管理登陆
     * @Author: li
     * @Create: 2019/8/9-20:04
     * @param username
     * @param pwd
     * @Return int
     */
    int login(String username,String pwd);
}
