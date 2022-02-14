package com.pillyo.pill.controller;

import java.util.ArrayList;

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
	
	@RequestMapping("/sugarForm")
	public String sugarForm() {
		return "sugar/sugarForm";
	}
	
	@RequestMapping("/insertSugar")
	public String insertSugar(SugarVO vo) {
		service.insertSugar(vo);
		return "sugar/sugarListView";
	}
	
	@RequestMapping("/listAllSugar")
	public String listAllSugar(Model model){
		ArrayList<SugarVO> sugarList = service.listAllSugar();
		model.addAttribute("sugarList", sugarList);
		return "sugar/sugarListView";
	}
	@RequestMapping("/deleteSugar/{sugarNo}")
	public String deleteSugar(@PathVariable int sugarNo) {
		System.out.println(sugarNo);
		service.deleteSugar(sugarNo);
		return "redirect:../listAllSugar";
	}
}
