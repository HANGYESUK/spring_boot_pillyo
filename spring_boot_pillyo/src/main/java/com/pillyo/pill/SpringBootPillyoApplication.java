package com.pillyo.pill;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = {"com.pillyo.pill"})
@MapperScan(basePackages = {"com.pillyo.pill"})
public class SpringBootPillyoApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringBootPillyoApplication.class, args);
	}

}
