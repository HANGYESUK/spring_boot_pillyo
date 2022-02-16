package com.pillyo.pill.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pillyo.pill.model.FamilyVO;
import com.pillyo.pill.model.UserVO;
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
		System.out.println(userId);
		ArrayList<FamilyVO> famList = service.famListView(userId);
		model.addAttribute("famList", famList);		
		return "/Main/dashboard";
	}
}
