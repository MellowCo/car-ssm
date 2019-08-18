package com.li.controller;

import com.li.domain.PageBean;
import com.li.domain.User;
import com.li.services.IBlackUserServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @Program: myssm
 * @ClassName: BlackUserController
 * @Description: 黑名单用户
 * @Author: li
 * @Create: 2019-08-11 13:53
 */
@Controller
@RequestMapping("/blackUser")
public class BlackUserController {
    @Autowired
    private IBlackUserServices services;

    /**
     * @Description: 返回黑名单用户
     * @Author: li
     * @Create: 2019/8/11-13:56
     * @param model
     * @param user
     * @Return java.lang.String
     */
    @RequestMapping("/page")
    public String blackUser(Model model, String currentPage, String pageSize, User user){
        System.out.println("model:" + model);
        PageBean<User> pageBean = services.pageUser(currentPage, pageSize, user);
        model.addAttribute("pu", pageBean);
        model.addAttribute("user", user);
        return "member-del.jsp";
    }

    @RequestMapping("/updateStatus")
    @ResponseBody
    public int updateStatus(String[] email){
        return services.updateStatus(email);
    }
}
