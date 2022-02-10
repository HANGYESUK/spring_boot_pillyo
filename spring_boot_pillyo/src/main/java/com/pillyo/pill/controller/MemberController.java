package com.pillyo.pill.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pillyo.pill.service.IMemberService;

@Controller
public class MemberController {
	@Autowired
	IMemberService service;
	
	// 로그인 폼으로 이동
	@RequestMapping("/loginForm")
	public String loginForm() {
		return "/member/loginForm";
	}
}
