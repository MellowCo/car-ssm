package com.li.controller;

import com.li.domain.Carport;
import com.li.domain.PageBean;
import com.li.services.ICarServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * @Program: myssm
 * @ClassName: CarController
 * @Description:
 * @Author: li
 * @Create: 2019-08-11 14:38
 */
@Controller
@RequestMapping("/car")
public class CarController {

    @Autowired
    private ICarServices services;

    /**
     * @param model
     * @param currentPage
     * @param pageSize
     * @param carport
     * @Description: 车辆分页
     * @Author: li
     * @Create: 2019/8/11-19:56
     * @Return java.lang.String
     */
    @RequestMapping("/page")
    public String pageCar(Model model, String currentPage, String pageSize, Carport carport) {
        PageBean<Carport> pageBean = services.pageCar(currentPage, pageSize, carport);
        model.addAttribute("pu", pageBean);
        model.addAttribute("car", carport);
        return "car-list.jsp";
    }

    /**
     * @param
     * @Description: 更改车辆状态
     * @Author: li
     * @Create: 2019/8/11-19:57
     * @Return void
     */
    @RequestMapping("/status")
    public void updateStatus(Integer[] ids, Integer status) {
        services.updateStatus(ids, status);
    }

    @RequestMapping("/insert")
    public String insertCar(Carport carport, MultipartFile file) throws IOException {
        /*
         * 上传文件
         */
        String path = "I:\\Java\\workspace\\Idea_workspace\\spring\\ssm\\myssm\\src\\main\\webapp\\static\\images";
        String fileName = UUID.randomUUID().toString().replace("-", "") + file.getOriginalFilename();
        file.transferTo(new File(path, fileName));

        /*
         * 保存图片路径
         */
        String imgPath = "../static/images/" + fileName;
        carport.setCimg(imgPath);

        services.insertCar(carport);
        return "redirect:../view/car-add.html";
    }

    /**
     * @param sort
     * @param request
     * @param response
     * @Description: 根虎排序，返回集合
     * @Author: li
     * @Create: 2019/8/12-14:03
     * @Return java.util.List<com.li.domain.Carport>
     */
    @RequestMapping("/carList")
    @ResponseBody
    public List<Carport> carList(String sort, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println(sort);

        if (sort == null) {
            System.out.println("1111111111");
            request.setAttribute("cars", services.carList(sort));
            request.getRequestDispatcher("../view/car.jsp").forward(request, response);
            return null;
        } else {
            System.out.println("222222222222222222222");
            return services.carList(sort);
        }
    }

   /**
    * @Description: 根据车名模糊查询
    * @Author: li
    * @Create: 2019/8/12-14:13
    * @param cname 
    * @Return java.util.List<com.li.domain.Carport>
    */
    @RequestMapping("search")
    @ResponseBody
    public List<Carport> search(String cname) {
        return services.findCarsByName(cname);
    }

    @GetMapping("{cid}")
    public ModelAndView findByID(@PathVariable("cid") Integer cid){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("user-order.jsp");
        mv.addObject("car", services.findCarByID(cid));

        Calendar ca = Calendar.getInstance();

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        String takeTime = formatter.format(new Date());

        ca.add(Calendar.DATE,2);
        String getTime = formatter.format(ca.getTime());
        mv.addObject("getTime", getTime);
        mv.addObject("takeTime", takeTime);
        return mv;
    }
}
