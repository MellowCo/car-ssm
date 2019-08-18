package com.li.config;

import org.springframework.context.annotation.Bean;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;

import javax.sql.DataSource;

/**
 * @Program: myssm
 * @ClassName: TransactionManagement
 * @Description: spring事务管理
 * @Author: li
 * @Create: 2019-08-09 14:02
 */
public class TransactionManagement {

    @Bean
    DataSourceTransactionManager createDataSourceTransactionManager(DataSource dataSource){
        return new DataSourceTransactionManager(dataSource);
    }
}
