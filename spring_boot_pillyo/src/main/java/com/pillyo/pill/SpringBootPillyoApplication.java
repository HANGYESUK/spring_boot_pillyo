package com.pillyo.pill;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

import com.pillyo.pill.controller.AdminController;
import com.pillyo.pill.controller.BoardController;
import com.pillyo.pill.controller.BodyController;
import com.pillyo.pill.controller.CommentController;
import com.pillyo.pill.controller.DoseController;
import com.pillyo.pill.controller.DrugController;
import com.pillyo.pill.controller.DrugInfoController;
import com.pillyo.pill.controller.FamilyController;
import com.pillyo.pill.controller.FeelController;
import com.pillyo.pill.controller.HealthController;
import com.pillyo.pill.controller.HmController;
import com.pillyo.pill.controller.MainController;
import com.pillyo.pill.controller.SugarController;
import com.pillyo.pill.controller.UserController;
import com.pillyo.pill.dao.IAdminDAO;
import com.pillyo.pill.dao.IBoardDAO;
import com.pillyo.pill.dao.IBodyDAO;
import com.pillyo.pill.dao.ICommentDAO;
import com.pillyo.pill.dao.IDoseDAO;
import com.pillyo.pill.dao.IDrugDAO;
import com.pillyo.pill.dao.IFamilyDAO;
import com.pillyo.pill.dao.IFeelDAO;
import com.pillyo.pill.dao.IHmDAO;
import com.pillyo.pill.dao.IPressureDAO;
import com.pillyo.pill.dao.ISugarDAO;
import com.pillyo.pill.dao.IUserDAO;

@SpringBootApplication
@ComponentScan(basePackageClasses = MainController.class)
@ComponentScan(basePackageClasses = UserController.class)
@ComponentScan(basePackageClasses = FamilyController.class)
@ComponentScan(basePackageClasses = SugarController.class)
@ComponentScan(basePackageClasses = BodyController.class)
@ComponentScan(basePackageClasses = FeelController.class)
@ComponentScan(basePackageClasses = DrugInfoController.class)
@ComponentScan(basePackageClasses = DrugController.class)
@ComponentScan(basePackageClasses = DoseController.class)
@ComponentScan(basePackageClasses = BoardController.class)
@ComponentScan(basePackageClasses = HmController.class) // 우리집 약관리
@ComponentScan(basePackageClasses = HealthController.class)
@ComponentScan(basePackageClasses = AdminController.class)
@ComponentScan(basePackageClasses = CommentController.class)

@MapperScan(basePackageClasses = IUserDAO.class)
@MapperScan(basePackageClasses = IFamilyDAO.class)
@MapperScan(basePackageClasses = ISugarDAO.class)
@MapperScan(basePackageClasses = IPressureDAO.class)
@MapperScan(basePackageClasses = IBodyDAO.class)
@MapperScan(basePackageClasses = IFeelDAO.class)
@MapperScan(basePackageClasses = IDrugDAO.class)
@MapperScan(basePackageClasses = IDoseDAO.class)
@MapperScan(basePackageClasses = IBoardDAO.class)
@MapperScan(basePackageClasses = IHmDAO.class)
@MapperScan(basePackageClasses = IAdminDAO.class)
@MapperScan(basePackageClasses = ICommentDAO.class)
public class SpringBootPillyoApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringBootPillyoApplication.class, args);
	}

}
