package com.pillyo.pill;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

import com.pillyo.pill.controller.DoseController;
import com.pillyo.pill.controller.FamilyController;
import com.pillyo.pill.controller.HmController;
import com.pillyo.pill.controller.MainController;
import com.pillyo.pill.controller.UserController;
import com.pillyo.pill.controller.Drug.DrugInfoController;
import com.pillyo.pill.controller.Health.BodyController;
import com.pillyo.pill.controller.Health.FeelController;
import com.pillyo.pill.controller.Health.SugarController;
import com.pillyo.pill.dao.IDoseDAO;
import com.pillyo.pill.dao.IFamilyDAO;
import com.pillyo.pill.dao.IHmDAO;
import com.pillyo.pill.dao.IUserDAO;
import com.pillyo.pill.dao.Drug.IDrugDAO;
import com.pillyo.pill.dao.Health.IBodyDAO;
import com.pillyo.pill.dao.Health.IFeelDAO;
import com.pillyo.pill.dao.Health.ISugarDAO;

@SpringBootApplication
@ComponentScan(basePackageClasses = MainController.class)
@ComponentScan(basePackageClasses = UserController.class)
@ComponentScan(basePackageClasses = FamilyController.class)
@ComponentScan(basePackageClasses = SugarController.class)
@ComponentScan(basePackageClasses = BodyController.class)
@ComponentScan(basePackageClasses = FeelController.class)
@ComponentScan(basePackageClasses = DrugInfoController.class)
@ComponentScan(basePackageClasses = DoseController.class)
@ComponentScan(basePackageClasses = HmController.class) // 우리집 약관리

@MapperScan(basePackageClasses = IUserDAO.class)
@MapperScan(basePackageClasses = IFamilyDAO.class)
@MapperScan(basePackageClasses = ISugarDAO.class)
@MapperScan(basePackageClasses = IBodyDAO.class)
@MapperScan(basePackageClasses = IFeelDAO.class)
@MapperScan(basePackageClasses = IDrugDAO.class)
@MapperScan(basePackageClasses = IDoseDAO.class)
@MapperScan(basePackageClasses = IHmDAO.class)

public class SpringBootPillyoApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringBootPillyoApplication.class, args);
	}

}
