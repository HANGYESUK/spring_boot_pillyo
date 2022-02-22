package com.pillyo.pill.controller.medicInfo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MedicInfoController {
	//@Autowired
	//DrugService drugService;
	
	// 의약 정보 페이지
	@RequestMapping("/medicInfo")
	public String medicInfo() {
		return "medicInfo/medicInfoView";
	}
}
