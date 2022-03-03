package com.pillyo.pill.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pillyo.pill.model.AdminVO;
import com.pillyo.pill.model.UserVO;
import com.pillyo.pill.service.AdminService;
import com.pillyo.pill.service.UserService;

@Controller
public class AdminController {
	@Autowired
	AdminService aservice;
	@Autowired
	UserService uservice;
	
	// 로그인 폼으로 이동
		@RequestMapping("/adminloginForm")
		public String adminloginForm() {
			return "/admin/adminLoginForm";
		}

	//관리자 로그인
		@ResponseBody
		@RequestMapping("/adminLogin")
		public String adminLogin(@RequestParam HashMap<String, Object> map,
												   HttpSession session) {
			
			// 로그인 체크 결과
			AdminVO vo = aservice.adminLogin(map);
			String result = "fail";
			
			if(vo != null) {
				//로그인 성공하면 세션 변수 지정
				session.setAttribute("admin", vo.getAdminId());
				result = "success";
			}
			
			return result;
		}
		
		@RequestMapping("/adminMain")
		public String adminMain() {
			return "admin/adminMain";
		}
	
		@RequestMapping("/listAllUser")
		public String listAllUser(Model model) {
			ArrayList<UserVO> userList = uservice.listAllUser();
			model.addAttribute("userList", userList);
			return "admin/a_listAllUserView";
		}
}
