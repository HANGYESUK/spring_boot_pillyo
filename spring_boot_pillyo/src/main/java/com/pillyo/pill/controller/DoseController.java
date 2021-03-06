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
public class DoseController {
	@Autowired
	DoseService doseService;
	
	@Autowired
	DrugService drugService;
	
	@Autowired
	FamilyService familyService;
	
	// 복용 관리 - 수정 폼으로 이동 
	@RequestMapping("/doseUpdateForm/{ddNo}")
	public String doseUpdateForm(@PathVariable int ddNo, Model model) {
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
		return "redirect:/calendarView";
	}
	
	// 복용 관리 - 삭제
	@RequestMapping("/doseDelete/{ddNo}")
	public String doseDelete(@PathVariable int ddNo) {
		doseService.doseDelete(ddNo);
		return "redirect:/calendarView";
	}
	
	// 복용 목록 조회
	@RequestMapping("/doseListView/{famNo}")
	public String doseListView(@PathVariable int famNo, Model model, HttpSession session) {
		String userId = (String)session.getAttribute("sid");
		ArrayList<FamilyVO> famList = familyService.famListView(userId);
		model.addAttribute("famList", famList);
		
		//매핑때 받은 @PathVariavle int famNo 다시 모델로 보냄.
		// famNo 기준 다시 등록폼 이동하거나 할때 사용. 
		model.addAttribute("famNo", famNo);
		
		ArrayList<DoseVO> doseList = doseService.doseListView(famNo);
		
		for (int i=0; i<doseList.size(); i++) {
			DoseVO doseItem = doseList.get(i);
			int drugInfoNo = doseItem.getDrugInfoNo();
			String doseDrugName = doseService.doseDetailName(drugInfoNo);
			doseItem.setDoseDrugName(doseDrugName);
		}
		
		model.addAttribute("doseList", doseList);		
		return "/dose/doseListView";
	}
	
	// 복용 목록 상세 조회
	@RequestMapping("/doseDetailView/{ddNo}")
	public String doseDetailView(@PathVariable int ddNo, Model model) {
		DoseVO doseVo = doseService.doseDetailView(ddNo);
		
		int drugInfoNo = doseVo.getDrugInfoNo();
		String doseDrugName = doseService.doseDetailName(drugInfoNo);
		doseVo.setDoseDrugName(doseDrugName);
		model.addAttribute("doseVo", doseVo);
		
		int doseFamNo = doseVo.getFamNo();
		String doseFamName = doseService.doseDetailFamName(doseFamNo);
		doseVo.setDoseFamName(doseFamName);
		
		
		
		model.addAttribute("doseDrugName", doseDrugName);
		model.addAttribute("doseFamName", doseFamName);
		
		return "/dose/doseDetailView";
	}
}