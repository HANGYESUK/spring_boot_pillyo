package com.pillyo.pill.controller;

import java.util.ArrayList;

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

@Controller
public class DoseController {
	@Autowired
	DoseService doseService;
	
	@Autowired
	DrugService drugService;
	
	// 복용 관리 - 등록
	@RequestMapping("/doseInsert")
	public String doseInsert(DoseVO doseVo) {
		doseService.doseInsert(doseVo);
		return "redirect:/doseListView";
	}
	
	// 복용 관리 - 수정 폼으로 이동 
	@RequestMapping("/doseUpdateForm/{ddNo}")
	public String doseUpdateForm(@PathVariable String ddNo, Model model) {
		ArrayList<AutoDrugInfoVO> drugList = drugService.drugListView();
		DoseVO doseVo = doseService.doseDetailView(ddNo);
		model.addAttribute("drugList", drugList);
		model.addAttribute("doseVo", doseVo);
		return "/dose/doseUpdateForm";
	}
	
	// 복용 관리 - 수정
	@RequestMapping("/doseUpdate")
	public String doseUpdate(DoseVO doseVo) {
		doseService.doseUpdate(doseVo);
		return "redirect:./doseListView";
	}
	
	// 복용 관리 - 삭제
	@RequestMapping("/doseDelete/{ddNo}")
	public String doseDelete(@PathVariable String ddNo) {
		doseService.doseDelete(ddNo);
		return "redirect:../doseListView";
	}
	
	// 복용 목록 조회
	@RequestMapping("/doseListView")
	public String doseListView(Model model) {
		ArrayList<DoseVO> doseList = doseService.doseListView();
		model.addAttribute("doseList", doseList);		
		return "/dose/doseListView";
	}
	
	// 복용 목록 상세 조회
	@RequestMapping("/doseDetailView/{ddNo}")
	public String doseDetailView(@PathVariable String ddNo, Model model) {
		DoseVO doseVo = doseService.doseDetailView(ddNo);
		model.addAttribute("doseVo", doseVo);
		
		return "/dose/doseDetailView";
	}
}