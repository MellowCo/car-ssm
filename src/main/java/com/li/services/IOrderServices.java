package com.li.services;

import com.li.domain.Corder;
import com.li.domain.PageBean;

import java.util.List;

/**
 * @Program: myssm
 * @ClassName: IOrderServices
 * @Description:
 * @Author: li
 * @Create: 2019-08-12 14:50
 */
public interface IOrderServices {
    /**
     * @Description: 添加订单
     * @Author: li
     * @Create: 2019/8/12-14:50
     * @param corder
     * @Return java.lang.Integer
     */
    Integer insertOrder(Corder corder);

    /**
     * @param email 用户
     * @param status 订单状态
     * @Description: 查询订单
     * @Author: li
     * @Create: 2019/8/12-15:03
     * @Return java.util.List<com.li.domain.Corder>
     */
    List<Corder> findOrder(String email,Integer status);

    Integer updateStatus(Integer oid, Integer cid);

    PageBean<Corder> pageCorder(String start, String size, Corder corder);
}
