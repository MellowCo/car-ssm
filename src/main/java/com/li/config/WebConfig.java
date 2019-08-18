package com.li.config;

import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.filter.HiddenHttpMethodFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

import javax.servlet.FilterRegistration;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;

/**
 * @Program: myssm
 * @ClassName: WebConfig
 * @Description: 配置前端控制器 过滤器
 * @Author: li
 * @Create: 2019-08-09 14:13
 */

public class WebConfig extends AbstractAnnotationConfigDispatcherServletInitializer {

    @Override
    protected Class<?>[] getRootConfigClasses() {
        return new Class<?>[]{SpringConfig.class};
    }

    @Override
    protected Class<?>[] getServletConfigClasses() {
        return new Class<?>[]{SpringMvc.class};
    }

    @Override
    protected String[] getServletMappings() {
        return new String[]{"/"};
    }

    @Override
    public void onStartup(ServletContext servletContext) throws ServletException {

        FilterRegistration registration = servletContext.addFilter("encodingFilter", CharacterEncodingFilter.class);
        registration.setInitParameter("encoding", "UTF-8");
        registration.addMappingForUrlPatterns(null,false,"/*");

        FilterRegistration registration1 = servletContext.addFilter("methodFilter", HiddenHttpMethodFilter.class);
        registration1.addMappingForUrlPatterns(null,false,"/*");

        super.onStartup(servletContext);
    }
}
