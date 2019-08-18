package com.li.controller;

import com.li.domain.PageBean;
import com.li.domain.User;
import com.li.services.IUserServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

/**
 * @Program: myssm
 * @ClassName: UserController
 * @Description:
 * @Author: li
 * @Create: 2019-08-09 14:45
 */
@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private IUserServices services;

    /**
     * @Description: 查询所有用户
     * @Author: li
     * @Create: 2019/8/9-14:46
     * @param
     * @Return java.lang.String
     */
    @RequestMapping("/findAllUser")
    public String findAllUser(Model model){
        model.addAttribute("list",services.findAllUser());
        return "list.jsp";
    }

    /**
     * @Description: 用户登陆
     * @Author: li
     * @Create: 2019/8/9-21:03
     * @param email
     * @param pwd
     * @param session
     * @Return int
     */
    @RequestMapping("/login")
    @ResponseBody
    public int login(String email, String pwd, HttpSession session){
        Integer login = services.Login(email, pwd);

        if (login == 1) {
            session.setAttribute("email", email);
        }

        return login;
    }

    /**
     * @Description: 分页加模糊查询
     * @Author: li
     * @Create: 2019/8/10-12:29
     * @param currentPage 当前页
     * @param pageSize 页面大小
     * @param user 查询条件
     * @Return org.springframework.web.servlet.ModelAndView
     */
    @RequestMapping("/pageUser")
    public ModelAndView pageUser(String currentPage, String pageSize, User user) {
        PageBean<User> pageBean = services.pageUser(currentPage, pageSize, user);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("member-list.jsp");
        mv.addObject("pu", pageBean);
        mv.addObject("user", user);
        return mv;
    }


    /**
     * @Description: 注册检查邮箱是否可用
     * @Author: li
     * @Create: 2019/8/10-12:43
     * @param
     * @Return java.lang.String
     */
    @RequestMapping("/checkEmail")
    @ResponseBody
    public int checkEmail(String email){
        return services.checkEmail(email) == 1 ? 1 : 0;
    }


    /**
     * @Description: 添加用户
     * @Author: li
     * @Create: 2019/8/10-12:40
     * @param user
     * @Return java.lang.String
     */
    @RequestMapping("/insertUser")
    @ResponseBody
    public int insertUser(User user){
        return services.insertUser(user);
    }

    /**
     * @Description: put 更改用户信息
     * @Author: li
     * @Create: 2019/8/10-13:30
     * @param user
     * @Return int
     */
    @PutMapping
    @ResponseBody
    public int updateUser(User user){
        return services.updateUser(user);
    }

    /**
     * @Description: get请求，rest查询用户信息
     * @Author: li
     * @Create: 2019/8/10-13:32
     * @param email
     * @Return org.springframework.web.servlet.ModelAndView
     */
    @GetMapping("/{email}/")
    public ModelAndView findUserByEmail(@PathVariable("email") String email){
        User user = services.findUserByEmail(email);
        return new ModelAndView("member-edit.jsp", "user", user);
    }
    
    /**
     * @Description: 删除用户
     * @Author: li
     * @Create: 2019/8/10-15:12
     * @param email 
     * @Return int
     */
    @DeleteMapping
    @ResponseBody
    public int delUser(String[] email){
        return services.delUser(email);
    }

    @RequestMapping("/checkPwd")
    @ResponseBody
    public int checkPwd(String email,String pwd){
        return services.checkPwd(email, pwd);
    }

}
