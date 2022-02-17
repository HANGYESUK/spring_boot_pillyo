package com.pillyo.pill.controller.Drug;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pillyo.pill.service.Drug.DrugInfoService;

@Controller
public class DrugInfoController {
	@Autowired
	DrugInfoService service;
	
	@RequestMapping("/insertDrugList")
	public String insertDrugList(String num) throws Exception{
		for(int i=1;i<45;i++) {
		
		service.insertDrugList(i+"");
		}
		return "/index";
	}
	
}
