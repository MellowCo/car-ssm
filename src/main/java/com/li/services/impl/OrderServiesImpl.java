package com.li.services.impl;

import com.li.domain.Corder;
import com.li.domain.PageBean;
import com.li.mapper.CarportMapper;
import com.li.mapper.CorderMapper;
import com.li.services.IOrderServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @Program: myssm
 * @ClassName: OrderServiesImpl
 * @Description:
 * @Author: li
 * @Create: 2019-08-12 14:51
 */
@Service
@Transactional(readOnly = true,propagation = Propagation.SUPPORTS)
public class OrderServiesImpl implements IOrderServices {
    @Autowired
    private CarportMapper carportMapper;

    @Autowired
    private CorderMapper corderMapper;
    /*
     * 添加订单
     */
    @Override
    @Transactional(propagation = Propagation.REQUIRED,readOnly = false)
    public Integer insertOrder(Corder corder) {
        Integer[] ids = {corder.getCid()};
        carportMapper.updateStatus(ids, 0);
        return corderMapper.insertOrder(corder);
    }

    @Override
    public List<Corder> findOrder(String email, Integer status) {
        return corderMapper.findOrder(email,status);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED,readOnly = false)
    public Integer updateStatus(Integer oid, Integer cid) {
        Integer[] ids = {cid};
        carportMapper.updateStatus(ids, 1);
        return corderMapper.updateStatus(oid);
    }

    @Override
    public PageBean<Corder> pageCorder(String _start, String _size, Corder corder) {
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

        int totalData = corderMapper.pageSize(corder);

        List<Corder> corders = corderMapper.pageCorder((start-1)*size, size, corder);

        return new PageBean<>(start, totalData, size, corders);
    }
}
