package com.webet.config;

import org.springframework.context.annotation.*;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@ImportResource("classpath:application-context.xml")
@ComponentScan(basePackages = { "com.webet.dao", "com.webet.services" })
@EnableTransactionManagement
@EnableJpaRepositories(basePackages = { "com.webet.dao" })
public class AppConfig {
    //
}
