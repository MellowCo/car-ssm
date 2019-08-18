package com.li.services.impl;

import com.li.domain.Carport;
import com.li.domain.PageBean;
import com.li.mapper.CarportMapper;
import com.li.services.ICarServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @Program: myssm
 * @ClassName: CarServicesImpl
 * @Description:
 * @Author: li
 * @Create: 2019-08-11 14:43
 */
@Service
@Transactional(readOnly = true,propagation = Propagation.SUPPORTS)
public class CarServicesImpl implements ICarServices {

    @Autowired
    private CarportMapper mapper;

    @Override
    public PageBean<Carport> pageCar(String _start, String _size, Carport carport) {

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

        int totalData = mapper.pageSize(carport);

        List<Carport> cars = mapper.pageCar((start-1)*size, size, carport);

        return new PageBean<>(start, totalData, size, cars);
    }

    /*
     * 更改车辆状态
     */
    @Override
    @Transactional(propagation = Propagation.REQUIRED,readOnly = false)
    public Integer updateStatus(Integer[] cids, Integer status) {
        return mapper.updateStatus(cids,status);
    }

    /*
     * 添加车辆
     */
    @Override
    @Transactional(propagation = Propagation.REQUIRED,readOnly = false)
    public Integer insertCar(Carport carport) {
        return mapper.insertCar(carport);
    }

    /*
     * 排序返回集合
     */
    @Override
    public List<Carport> carList(String sort) {
        return mapper.carList(sort);
    }


    /*
     * 根据车名模糊查询
     */
    @Override
    public List<Carport> findCarsByName(String cname) {
        return mapper.findCarsByName(cname);
    }

    /*
     * 根虎id返回车辆
     */
    @Override
    public Carport findCarByID(Integer cid) {
        return mapper.findCarByID(cid);
    }


}
