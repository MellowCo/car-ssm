package com.li.services;

import com.li.domain.PageBean;
import com.li.domain.User;

/**
 * @Program: myssm
 * @ClassName: IBlackUserServices
 * @Description: 黑名单用户
 * @Author: li
 * @Create: 2019-08-11 13:57
 */
public interface IBlackUserServices {
    /**
     * @Description: 返回黑名单分页用户
     * @Author: li
     * @Create: 2019/8/11-13:58
     * @param start
     * @param size
     * @param user
     * @Return com.li.domain.PageBean<com.li.domain.User>
     */
    PageBean<User> pageUser(String start, String size, User user);

    /**
     * @Description: 更新用户 黑名单状态
     * @Author: li
     * @Create: 2019/8/11-14:22
     * @param email
     * @Return int
     */
    int updateStatus(String[] email);

}
