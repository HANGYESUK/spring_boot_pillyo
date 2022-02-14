package com.pillyo.pill.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pillyo.pill.model.PressureVO;
import com.pillyo.pill.service.PressureService;

@Controller
public class PressureController {
	@Autowired
	PressureService service;
	
	@RequestMapping("/pressureForm")
	public String PressureForm() {
		return "pressure/pressureForm";
	}
	
	@RequestMapping("/insertPressure")
	public String insertPressure(PressureVO vo) {
		service.insertPressure(vo);
		return "pressure/pressureListView";
	}
	
	@RequestMapping("/listAllPressure")
	public String listAllPressure(Model model){
		ArrayList<PressureVO> pressureList = service.listAllPressure();
		model.addAttribute("pressureList", pressureList);
		return "pressure/pressureListView";
	}
}
