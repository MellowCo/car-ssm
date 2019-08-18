package com.li.mapper;

import com.li.domain.Carport;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CarportMapper {
    /**
     * @Description: 车辆分页
     * @Author: li
     * @Create: 2019/8/11-14:44
     * @param start
     * @param size
     * @param carport
     * @Return java.util.List<com.li.domain.Carport>
     */
    List<Carport> pageCar(@Param("start") int start, @Param("size") int size, @Param("carport") Carport carport);

    /**
     * @Description: 返回模糊查询的数据
     * @Author: li
     * @Create: 2019/8/11-14:52
     * @param carport
     * @Return java.lang.Integer
     */
    Integer pageSize(Carport carport);

    /**
     * @Description: 更改车辆状态
     * @Author: li
     * @Create: 2019/8/11-19:50
     * @param
     * @Return java.lang.Integer
     */
    Integer updateStatus(@Param("ids") Integer[] cids,@Param("status") Integer status);

    /**
     * @Description: 添加车辆
     * @Author: li
     * @Create: 2019/8/11-20:15
     * @param carport
     * @Return java.lang.Integer
     */
    Integer insertCar(Carport carport);

    /**
     * @Description: 根据排序，返回集合
     * @Author: li
     * @Create: 2019/8/12-13:57
     * @param sort 
     * @Return java.util.List<com.li.domain.Carport>
     */
    List<Carport> carList(String sort);

    /**
     * @Description: 根虎车名，模糊查询
     * @Author: li
     * @Create: 2019/8/12-13:59
     * @param cname
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