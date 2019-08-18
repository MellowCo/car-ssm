package com.li.config;

import com.li.interceptor.LoginInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

/**
 * @Program: myssm
 * @ClassName: SpringMvc
 * @Description: springMvc配置
 * @Author: li
 * @Create: 2019-08-09 14:04
 */
@Configuration
@EnableWebMvc
@ComponentScan("com.li.controller")
public class SpringMvc implements WebMvcConfigurer {
    //配置视图解析器
    @Bean
    InternalResourceViewResolver internalResourceViewResolver(){
        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
        resolver.setPrefix("/view/");
        return resolver;
    }

    //配置文件上传
    @Bean("multipartResolver")
    CommonsMultipartResolver multipartResolver(){
        CommonsMultipartResolver resolver = new CommonsMultipartResolver();
        resolver.setMaxUploadSize(5242880);
        resolver.setDefaultEncoding("UTF-8");
        return resolver;
    }

    //配置静态资源 js css image
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/static/**/").addResourceLocations("/static/");
        registry.addResourceHandler("/view/**/").addResourceLocations("/view/");
        registry.addResourceHandler("/public/**/").addResourceLocations("/public/");
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new LoginInterceptor()).addPathPatterns("/**");
    }
}
