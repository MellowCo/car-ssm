package com.li.config;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;

import javax.sql.DataSource;
import java.beans.PropertyVetoException;

/**
 * @Program: myssm
 * @ClassName: JdbcConfig
 * @Description: 数据库
 * @Author: li
 * @Create: 2019-08-09 13:49
 */
public class JdbcConfig {
    @Value("${jdbc.url}")
    private String url;

    @Value("${jdbc.driver}")
    private String driver;

    @Value("${jdbc.username}")
    private String username;

    @Value("${jdbc.password}")
    private String password;

    //配置c3p0数据源
    @Bean("dataSource")
    DataSource createDataSource() throws PropertyVetoException {
        ComboPooledDataSource source = new ComboPooledDataSource();

        source.setPassword(password);
        source.setJdbcUrl(url);
        source.setUser(username);
        source.setDriverClass(driver);

        return source;
    }


    @Bean
    SqlSessionFactoryBean createSessionFactoryBean(DataSource dataSource){
        SqlSessionFactoryBean bean = new SqlSessionFactoryBean();
        bean.setDataSource(dataSource);
        bean.setTypeAliasesPackage("com.li.domain");
        return bean;
    }
}
