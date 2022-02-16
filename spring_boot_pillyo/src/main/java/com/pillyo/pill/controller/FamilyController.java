package com.pillyo.pill.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
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
	
	
	
	// 가족 정보 수정 폼으로 이동
	@RequestMapping("/famUpdateForm/{famNo}")
	public String famUpdateForm(@PathVariable int famNo, Model model) {
		FamilyVO famVo = service.famDetailView(famNo);
		model.addAttribute("famVo", famVo);
		return "/family/famUpdateForm";
	}
	
	// 가족 정보 수정
	@RequestMapping("/famUpdate")
	public String famUpdate(FamilyVO famVo) {
		service.famUpdate(famVo);
		return "redirect:./famListView";
	}
	
	
	
	
	// 가족 정보 삭제
	@RequestMapping("/famDelete/{famNo}")
	public String famDelete(@PathVariable int famNo) {
		service.famDelete(famNo);
		return "redirect:../famListView";
	}
	
	
	
	
	// 가족 목록 조회
	@RequestMapping("/famListView")
	public String famListView(Model model, HttpSession session) {
		String userId = (String)session.getAttribute("sid");
		System.out.println(userId);
		ArrayList<FamilyVO> famList = service.famListView(userId);
		model.addAttribute("famList", famList);		
		return "/family/famListView";
	}
	
	
	// 가족 상세 정보 조회
	@RequestMapping("/famDetailView/{famNo}")
	public String famDetailView(@PathVariable int famNo, Model model) {
		FamilyVO famVo = service.famDetailView(famNo);
		model.addAttribute("famVo", famVo);
		
		return "/family/famDetailView";
	}
	
	
	
	
	
	
	/*
	 * FamilyVO famDetailView(String famNo); // 가족 정보 상세 조회
	 */
}