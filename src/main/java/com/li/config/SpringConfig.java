package com.li.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.context.annotation.PropertySource;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * @Program: myssm
 * @ClassName: SpringConfig
 * @Description: spring容器
 * @Author: li
 * @Create: 2019-08-09 13:43
 */
@Configuration
@ComponentScan("com.li.services")
@MapperScan("com.li.mapper")
@PropertySource("classpath:jdbc.properties")
@Import({JdbcConfig.class,TransactionManagement.class})
@EnableTransactionManagement
public class SpringConfig {
}
