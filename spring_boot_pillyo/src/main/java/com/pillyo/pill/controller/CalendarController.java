package com.pillyo.pill.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pillyo.pill.model.AutoDrugInfoVO;
import com.pillyo.pill.model.DoseVO;
import com.pillyo.pill.service.DoseService;
import com.pillyo.pill.service.DrugService;

@Controller
public class CalendarController {
	@Autowired
	DoseService doseService;
	
	@Autowired
	DrugService drugService;
	
	// 복용관리 - 캘린더
	@RequestMapping("/calendarView")
	public String calendarView(Model model) {
		// 캘린더 추가용 복용 목록 데이터 (json) 생성
		ArrayList<DoseVO> doseList = doseService.doseListView();
		ArrayList<AutoDrugInfoVO> drugList = drugService.drugListView();
		model.addAttribute("doseList", doseList);
		model.addAttribute("drugList", drugList);
		return "/dose/calendarView";
	}
	
	// 복용 관리 - 캘린더 모달창 통해 등록
	@RequestMapping("/doseCalInsert")
	public String doseInsert(DoseVO doseVo) {
		doseService.doseInsert(doseVo);
		return "redirect:/calendarView";
	}
}
