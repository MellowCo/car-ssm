package com.li.controller;

import com.li.domain.Corder;
import com.li.domain.PageBean;
import com.li.services.IOrderServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @Program: myssm
 * @ClassName: OrderController
 * @Description:
 * @Author: li
 * @Create: 2019-08-12 14:57
 */
@Controller
@RequestMapping("/order")
public class OrderController {
    @Autowired
    private IOrderServices services;

    @RequestMapping("/insert")
    public String insertOrder(Corder corder, HttpSession session){
        corder.setEmail((String) session.getAttribute("email"));
        services.insertOrder(corder);
        return "redirect:/order/userOrder/1";
    }

    @RequestMapping("/userOrder/{status}")
    public String onlineOrder(Model model, @PathVariable("status") Integer status,HttpSession session){
        String email = (String) session.getAttribute("email");
        List<Corder> order = services.findOrder(email, status);
        model.addAttribute("list",order);
        return status == 1 ? "uorder.jsp" : "uorder-history.jsp";
    }

    @RequestMapping("/updateStatus")
    public String updateStatus(Integer cid,Integer oid){
        services.updateStatus(oid, cid);
        return "redirect:/order/userOrder/1";
    }

    @RequestMapping("/pageOrder")
    public ModelAndView pageOrder(String currentPage, String pageSize, Corder corder) {
        PageBean<Corder> pageBean = services.pageCorder(currentPage, pageSize, corder);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("order-list.jsp");
        mv.addObject("pu", pageBean);
        mv.addObject("order", corder);
        return mv;
    }

}
