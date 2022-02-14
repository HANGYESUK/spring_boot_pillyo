package com.pillyo.pill.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller // 패키지 명
public class FeelController {
	
	@Autowired
	//FellService service;
	
	// 건강관리 - 기분관리
	@RequestMapping("/feelManageForm")
	public String mood() {
		return "/feelManage";
	}
	
}