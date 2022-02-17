package com.pillyo.pill.controller.Health;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pillyo.pill.model.Health.PressureVO;
import com.pillyo.pill.service.Health.PressureService;

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
	
	//혈압 정보 삭제
	@RequestMapping("/deletePressure/{pressureNo}")
	public String deletePressure(@PathVariable int pressureNo) {
		System.out.println(pressureNo);
		service.deletePressure(pressureNo);
		return "redirect:../listAllPressure";
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