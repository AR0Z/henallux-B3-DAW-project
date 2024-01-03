package com.spring.henallux.ecommerce;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@EnableTransactionManagement
@SpringBootApplication
public class eShopExamenApplication {
	public static void main(String[] args) {
		SpringApplication.run(eShopExamenApplication.class, args);
	}

}
