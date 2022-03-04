package com.pillyo.pill.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pillyo.pill.model.SugarVO;
import com.pillyo.pill.service.SugarService;

@Controller
public class SugarController {
	@Autowired
	SugarService service;
	
	//혈당 등록 폼 이동
	@RequestMapping("/sugarForm/{famNo}")
	public String sugarForm(@PathVariable("famNo") int famNo, Model model) {
		model.addAttribute("famNo", famNo);
		return "sugar/sugarForm";
	}
	//혈당 등록
	@RequestMapping("/insertSugar")
	public String insertSugar(SugarVO vo) {
		service.insertSugar(vo);
		//return "redirect:../listAllSugar";
		return "redirect:/healthManageView";
	}
	//혈당 리스트 조회
	@RequestMapping("/listAllSugar")
	public String listAllSugar(Model model){
		return "sugar/sugarListView";
	}
	//혈당 정보 삭제
	@RequestMapping("/deleteSugar/{sugarNo}")
	public String deleteSugar(@PathVariable int sugarNo) {
		System.out.println(sugarNo);
		service.deleteSugar(sugarNo);
		return "redirect:/healthManageView";
	}
	//혈당 업데이트 폼 이동
	@RequestMapping("/updateSugarForm/{sugarNo}")
	public String updateSugarForm(@PathVariable int sugarNo, Model model) {
		SugarVO sugar = service.detailViewSugar(sugarNo);
		model.addAttribute("sugar", sugar);
		return "sugar/updateSugarForm";
	}
	//혈당 업데이트
	@RequestMapping("/updateSugar")
	public String updateProduct(SugarVO vo) {
		service.updateSugar(vo);
		return "redirect:/healthManageView";
	}
}
