package com.pillyo.pill;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

import com.pillyo.pill.controller.MainController;
import com.pillyo.pill.controller.MemberController;
import com.pillyo.pill.dao.IMemberDAO;

@SpringBootApplication
@ComponentScan(basePackageClasses = MainController.class)
@ComponentScan(basePackageClasses = MemberController.class)
@MapperScan(basePackageClasses = IMemberDAO.class)
public class SpringBootPillyoApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringBootPillyoApplication.class, args);
	}

}
