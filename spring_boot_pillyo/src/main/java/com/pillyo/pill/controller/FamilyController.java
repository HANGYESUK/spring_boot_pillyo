package com.pillyo.pill.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
		return "redirect:/famListView";
	}
	
	// 가족 목록 조회
	@RequestMapping("/famListView")
	public String famListView(Model model) {
		ArrayList<FamilyVO> famList = service.famListView();
		model.addAttribute("famList", famList);		
		return "/family/famListView";
	}
}
