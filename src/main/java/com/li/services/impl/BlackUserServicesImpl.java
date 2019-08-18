package com.li.services.impl;

import com.li.domain.PageBean;
import com.li.domain.User;
import com.li.mapper.UserMapper;
import com.li.services.IBlackUserServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @Program: myssm
 * @ClassName: BlackUserServicesImpl
 * @Description:
 * @Author: li
 * @Create: 2019-08-11 13:58
 */
@Service
@Transactional(readOnly = true,propagation = Propagation.SUPPORTS)
public class BlackUserServicesImpl implements IBlackUserServices {
    @Autowired
    private UserMapper mapper;
    /*
     * 返回黑名单用户
     */
    @Override
    public PageBean<User> pageUser(String _start, String _size, User user) {
        user.setStatus(-1);
        int start = 0;
        int size = 0;

        if (_start == null){
            start = 1;
        }else{
            start = Integer.parseInt(_start);
        }

        if (_size == null){
            size = 5;
        }else{
            size = Integer.parseInt(_size);
        }

        int totalData = mapper.pageUserSize(user);

        List<User> users = mapper.pageUser((start-1)*size, size, user);

        return new PageBean<>(start, totalData, size, users);
    }

    /*
     * 更改用户黑名单状态
     */
    @Override
    @Transactional(propagation = Propagation.REQUIRED,readOnly = false)
    public int updateStatus(String[] email) {
        return mapper.updateStatus(email);
    }
}
