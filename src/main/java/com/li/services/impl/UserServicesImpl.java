package com.li.services.impl;

import com.li.domain.PageBean;
import com.li.domain.User;
import com.li.mapper.UserMapper;
import com.li.services.IUserServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @Program: myssm
 * @ClassName: UserServicesImpl
 * @Description:
 * @Author: li
 * @Create: 2019-08-09 14:42
 */
@Transactional(readOnly = true, propagation = Propagation.SUPPORTS) //设置查询的事务
@Service("userServices")
public class UserServicesImpl implements IUserServices {
    @Autowired
    private UserMapper mapper;

    //查询所有用户
    @Override
    public List<User> findAllUser() {
        return mapper.findAllUser();
    }

    //登陆校验
    @Override
    public Integer Login(String email, String pwd) {
        // return mapper.findUser(email) == 1 ? mapper.findUserAndPwd(email, pwd) == 1 ? mapper.findUserStatus(email) == 1 ? 1 : -2 : -1 : 0;

        if (mapper.findUser(email) != null) {
            if (mapper.findUserAndPwd(email, pwd) == 1) {
                if (mapper.findUserStatus(email) == 1) {
                    //密码正确
                    return 1;
                } else {
                    //被管理员拉黑
                    return -2;
                }
            } else {
                //密码错误
                return -1;
            }
        } else {
            //用户不存在
            return 0;
        }
    }

    //分页加模糊查询
    @Override
    public PageBean<User> pageUser(String _start, String _size,User user) {
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
     * 添加用户
     */
    @Override
    @Transactional(readOnly = false,propagation = Propagation.REQUIRED)
    public int insertUser(User user) {
        return mapper.insertUser(user);
    }

    /*
     * 检查邮箱是否可用
     */
    @Override
    public int checkEmail(String email) {

        if (mapper.findUser(email) == null) {
            return 0;
        }else{
            return 1;
        }
    }

    /*
     * 更改用户信息
     */
    @Override
    @Transactional(readOnly = false,propagation = Propagation.REQUIRED)
    public int updateUser(User user) {
        return mapper.updateUser(user);
    }

    /*
     * 查询单个用户的信息
     */
    @Override
    public User findUserByEmail(String email) {
        return mapper.findUser(email);
    }

    /*
     * 删除用户信息
     */
    @Override
    @Transactional(propagation = Propagation.REQUIRED,readOnly = false)
    public int delUser(String[] email) {
        return mapper.delUser(email);
    }

    @Override
    public int checkPwd(String email, String pwd) {
        return mapper.findUserAndPwd(email,pwd);
    }
}
