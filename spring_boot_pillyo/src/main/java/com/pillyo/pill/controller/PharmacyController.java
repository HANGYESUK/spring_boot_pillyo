package com.pillyo.pill.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pillyo.pill.service.pharmacy.PharmacyInfoService;

@Controller
public class PharmacyController {
	@Autowired
	PharmacyInfoService service;
	
	// 약국 정보 DB 저장
	@RequestMapping("/insertPharmList")
	public String insertPharmList(String num) throws Exception{
		for(int i=1;i<2;i++) { //223
			service.insertPharmList(i+"");
		}
		return "/index";
	}
	
	// 지도
	@RequestMapping("/pharmacyMaps")
	public String pharmacyMaps() {
		return "pharmacy/pharmacyMaps";
	}
}
