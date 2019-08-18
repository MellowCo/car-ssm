package com.li.services.impl;

import com.li.mapper.AdminMapper;
import com.li.services.IAdminServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Program: myssm
 * @ClassName: AdminServicesImpl
 * @Description:
 * @Author: li
 * @Create: 2019-08-09 20:05
 */
@Service
public class AdminServicesImpl implements IAdminServices {
    @Autowired
    private AdminMapper mapper;

    //管理登陆
    @Override
    public int login(String username, String pwd) {
        if (mapper.findAdmin(username) == 1) {
            if (mapper.findAdminAndPwd(username, pwd) == 1) {
                //密码正确
                return 1;
            } else {
                //密码错误
                return -1;
            }
        } else {
            //管理员不存在
            return 0;
        }

    }
}
