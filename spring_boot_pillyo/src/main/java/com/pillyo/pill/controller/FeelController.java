package com.pillyo.pill.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pillyo.pill.model.FeelVO;
import com.pillyo.pill.service.FeelService;

@Controller // 패키지 명
public class FeelController {
	
	@Autowired
	FeelService service;
	
	// 기분 관리 등록 폼으로 이동
	@RequestMapping("/feelForm/{famNo}")
	public String feel(@PathVariable("famNo") int famNo, Model model) {
		model.addAttribute("famNo", famNo);
		return "feel/feelForm";
	}
	
	// 기분 관리 등록
	@RequestMapping("/insertFeel")
	public String insertFeel(FeelVO vo) {
		service.insertFeel(vo);
		System.out.println(vo.getFeelScale());
		int famNo = vo.getFamNo();
		System.out.println("팸넘버"+famNo);
				
		//return "feel/feelListView";
		return "redirect:/healthManageView";
	}
	
	// 전체 기분 관리 기록 조회
	@RequestMapping("/listAllFeel")
	public String listAllFeel(Model model) {
		ArrayList<FeelVO> feelList = service.listAllFeel();
		model.addAttribute("feelList", feelList);
		return "feel/feelListView";
	}

	// 기분 관리 삭제
	@RequestMapping("/deleteFeel/{feelNo}")
	public String deleteFeel(@PathVariable int feelNo) {
		service.deleteFeel(feelNo);
		return "redirect:/healthManageView";
	}
	
	// 기분 관리 수정
	@RequestMapping("/updateFeel")
	public String updateFeel(FeelVO vo) {
		service.updateFeel(vo);
		return "redirect:/healthManageView";
	}
	
	//기분 관리 정보 업데이트 폼 이동
	@RequestMapping("/updateFeelForm/{feelNo}")
	public String updateFeelForm(@PathVariable int feelNo, Model model) {
		FeelVO feel = service.detailViewFeel(feelNo);
		model.addAttribute("feel", feel);
		return "feel/updateFeelForm";
}
	
}