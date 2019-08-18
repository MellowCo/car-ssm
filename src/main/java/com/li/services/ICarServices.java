package com.li.services;

import com.li.domain.Carport;
import com.li.domain.PageBean;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Program: myssm
 * @ClassName: ICarServices
 * @Description:
 * @Author: li
 * @Create: 2019-08-11 14:40
 */

public interface ICarServices {
    /**
     * @param start
     * @param size
     * @param carport
     * @Description: 车辆分页
     * @Author: li
     * @Create: 2019/8/11-14:41
     * @Return com.li.domain.PageBean<com.li.domain.User>
     */
    PageBean<Carport> pageCar(String start, String size, Carport carport);

    /**
     * @param
     * @Description: 更改车辆状态
     * @Author: li
     * @Create: 2019/8/11-19:50
     * @Return java.lang.Integer
     */
    Integer updateStatus(@Param("ids") Integer[] cids, @Param("status") Integer status);

    /**
     * @param carport
     * @Description: 添加车辆
     * @Author: li
     * @Create: 2019/8/11-20:41
     * @Return java.lang.Integer
     */
    Integer insertCar(Carport carport);

    /**
     * @param sort
     * @Description: 根据规则，返回集合
     * @Author: li
     * @Create: 2019/8/12-13:26
     * @Return java.util.List<com.li.domain.Carport>
     */
    List<Carport> carList(String sort);

    /**
     * @param cname
     * @Description: 根虎车名，模糊查询
     * @Author: li
     * @Create: 2019/8/12-13:59
     * @Return java.util.List<com.li.domain.Carport>
     */
    List<Carport> findCarsByName(String cname);

    /**
     * @Description: 根据车辆id，返回车辆
     * @Author: li
     * @Create: 2019/8/12-14:15
     * @param cid
     * @Return com.li.domain.Carport
     */
    Carport findCarByID(Integer cid);

}
