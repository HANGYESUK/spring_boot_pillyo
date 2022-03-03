package com.pillyo.pill.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pillyo.pill.service.PharmacyService;

@Controller
public class MapsController {
	@Autowired
	PharmacyService service;
	
	@RequestMapping("/pharmacy")
	public String pharmacy() {
		return "maps/pharmacy";
	}
	
	@RequestMapping("/pharmacySearch")
	public void pharmacySearch() {
		service.pharmacySearch();
	}
}
