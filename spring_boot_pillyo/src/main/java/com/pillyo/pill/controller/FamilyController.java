package com.pillyo.pill.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pillyo.pill.model.FamilyVO;
import com.pillyo.pill.service.FamilyService;

@Controller
public class FamilyController {
	@Autowired
	FamilyService service;
	
	// 가족 등록 폼으로 이동
	@RequestMapping("/famInsertForm")
	public String famInsertForm() {
		return "/family/famInsertForm";
	}
	
	// 가족 등록
	@RequestMapping("/famInsert")
	public String famInsert(FamilyVO fam) {
		service.famInsert(fam);
		return "/family/famListView";
	}
}
