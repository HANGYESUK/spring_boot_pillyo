package com.pillyo.pill.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PharmacyController {
	@RequestMapping("/pharmacyMaps")
	public String pharmacyMaps() {
		return "pharmacy/pharmacyMaps";
	}
}
