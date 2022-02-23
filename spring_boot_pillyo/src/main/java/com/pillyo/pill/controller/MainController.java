package com.pillyo.pill.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pillyo.pill.model.FamilyVO;
import com.pillyo.pill.service.FamilyService;

@Controller
public class MainController {
	@Autowired
	FamilyService service;
	
	@RequestMapping("/")
	public String index() {
		return "/index";
	}
	
	@RequestMapping("/join")
	public String join() {
		return "/join";
	}
	
	@RequestMapping("/dashboard")
	public String dashboard(Model model, HttpSession session) {
		String userId = (String)session.getAttribute("sid");
		ArrayList<FamilyVO> famList = service.famListView(userId);
		
		FamilyVO famIdx = famList.get(0);
		session.setAttribute("famNo", famIdx.getFamNo());
		session.getAttribute("famNo");
	
		model.addAttribute("famList", famList); 	// 프로필 가족 리스트
		System.out.println(famList);
		model.addAttribute("famIdx", famIdx);	// 메뉴 이동시 famNo 기본값으로 이용.
		return "/Main/dashboard";
	}
	
	@RequestMapping("/dashboardtest") // 테스트 // index.jsp에 주소 
	public String dashboardtest(Model model, HttpSession session) {
		String userId = (String)session.getAttribute("sid");
		System.out.println(userId);
		ArrayList<FamilyVO> famList = service.famListView(userId);
		model.addAttribute("famList", famList);		
		return "/Main/dashboard_famtest"; // dashboard_famtest 페이지 뛰우기 
	}
}
