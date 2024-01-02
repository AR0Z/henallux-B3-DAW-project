package com.spring.henallux.firstSpringProject;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringBootApplication
public class eShopExamenApplication {
	public static void main(String[] args) {
		SpringApplication.run(eShopExamenApplication.class, args);
	}

}
