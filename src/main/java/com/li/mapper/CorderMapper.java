package com.li.mapper;

import com.li.domain.Corder;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CorderMapper {

    /**
     * @param corder
     * @Description: 添加订单
     * @Author: li
     * @Create: 2019/8/12-14:46
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
    List<Corder> findOrder(@Param("email") String email,@Param("status") Integer status);


    List<Corder> pageCorder(@Param("start") int start, @Param("size") int size, @Param("corder") Corder corder);

    Integer pageSize(Corder corder);

    Integer updateStatus( Integer oid);
}