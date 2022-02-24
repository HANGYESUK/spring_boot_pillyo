package com.pillyo.pill.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pillyo.pill.model.PressureVO;
import com.pillyo.pill.service.PressureService;

@Controller
public class PressureController {
	@Autowired
	PressureService service;
	
	@RequestMapping("/pressureForm/{famNo}")
	public String PressureForm(@PathVariable("famNo") int famNo, Model model) {
		model.addAttribute("famNo", famNo);
		return "pressure/pressureForm";
	}
	
	@RequestMapping("/insertPressure")
	public String insertPressure(PressureVO vo) {
		service.insertPressure(vo);
		//return "pressure/pressureListView";
		return "redirect:/healthManageView";
	}
	
	@RequestMapping("/listAllPressure")
	public String listAllPressure(Model model){
		ArrayList<PressureVO> pressureList = service.listAllPressure();
		model.addAttribute("pressureList", pressureList);
		return "pressure/pressureListView";
	}
	
	//혈압 정보 삭제
	@RequestMapping("/deletePressure/{pressureNo}")
	public String deletePressure(@PathVariable int pressureNo) {
		System.out.println(pressureNo);
		service.deletePressure(pressureNo);
		return "redirect:/healthManageView";
	}
	//혈압 업데이트 폼 이동
	@RequestMapping("/updatePressureForm/{pressureNo}")
	public String updatePressureForm(@PathVariable int pressureNo, Model model) {
		PressureVO pressure = service.detailViewPressure(pressureNo);
		model.addAttribute("pressure", pressure);
		return "pressure/updatePressureForm";
	}
	//혈압 업데이트
	@RequestMapping("/updatePressure")
	public String updatePressure(PressureVO vo) {
		service.updatePressure(vo);
		return "redirect:/listAllPressure";  
	}
}
