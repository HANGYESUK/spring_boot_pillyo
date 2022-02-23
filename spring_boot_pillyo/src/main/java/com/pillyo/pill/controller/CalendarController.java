package com.pillyo.pill.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pillyo.pill.model.AutoDrugInfoVO;
import com.pillyo.pill.model.DoseVO;
import com.pillyo.pill.model.FamilyVO;
import com.pillyo.pill.service.DoseService;
import com.pillyo.pill.service.DrugService;
import com.pillyo.pill.service.FamilyService;

@Controller
public class CalendarController {
	@Autowired
	DoseService doseService;
	
	@Autowired
	DrugService drugService;
	
	@Autowired
	FamilyService familyService;
	
	// 복용관리 - 캘린더
	@RequestMapping("/calendarView/{famNo}")
	public String calendarView(@PathVariable("famNo") int famNo, Model model, HttpSession session) {
		// 캘린더 추가용 복용 목록 데이터 (json) 생성
		ArrayList<DoseVO> doseList = doseService.doseListView(famNo);
		ArrayList<AutoDrugInfoVO> drugList = drugService.drugListView();
		model.addAttribute("doseList", doseList);
		model.addAttribute("drugList", drugList);
		
		// 가족정보 변경하면서 이동할 수 있게 famList 받아옴.
		String userId = (String)session.getAttribute("sid"); //session통해 userId Controller로 받기
		ArrayList<FamilyVO> famList = familyService.famListView(userId);
		model.addAttribute("famList", famList);
		
		// 매핑때 받은 @PathVariavle int famNo 다시 모델로 보냄.
		// famNo 기준 다시 등록폼 이동하거나 할때 사용. 
		model.addAttribute("famNo", famNo);
		return "/dose/calendarView";
	}
	
	// 복용 관리 - 캘린더 모달창 통해 등록
	@RequestMapping("/doseCalInsert")
	public String doseInsert(DoseVO doseVo) {
		doseService.doseInsert(doseVo);
		return "redirect:/calendarView";
	}
}
