package com.li.controller;

import com.li.services.IAdminServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @Program: myssm
 * @ClassName: AdminController
 * @Description:
 * @Author: li
 * @Create: 2019-08-09 20:08
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private IAdminServices services;

    /**
     * @Description: 管理员登陆
     * @Author: li
     * @Create: 2019/8/9-20:10
     * @param username 管理员帐号
     * @param pwd 管理员密码
     * @Return int 1:登陆成功
     */
    @RequestMapping("/login")
    @ResponseBody
    public int login(String username,String pwd) {
        return services.login(username, pwd);
    }
}
