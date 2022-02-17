package com.pillyo.pill.controller.Health;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pillyo.pill.model.Health.FeelVO;
import com.pillyo.pill.service.Health.FeelService;

@Controller // 패키지 명
public class FeelController {
	
	@Autowired
	FeelService service;
	
	// 기분 관리 등록
	@RequestMapping("/feelForm")
	public String mood() {
		return "feel/feelForm";
	}
	
	// 기분 관리 등록 완료 시 폼 이동
	@RequestMapping("/insertFeel")
	public String insertFeel(FeelVO feelvo) {
		service.insertFeel(feelvo);
		System.out.println(feelvo.getFeelScale());
		return "feel/feelListView";
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
		return "redirect:/listAllFeelVO";
	}
	
	// 기분 관리 수정
	@RequestMapping("/updateFeel")
	public String updateFeel(FeelVO feelvo) {
		service.updateFeel(feelvo);
		return "feel/feelListView";
	}
	
	//기분 관리 정보 업데이트 폼 이동
	@RequestMapping("/updateFeelForm/{feelNo}")
	public String updateFeelForm(@PathVariable int feelNo, Model model) {
		FeelVO feel = service.detailViewFeel(feelNo);
		model.addAttribute("feel", feel);
		return "feel/updateFeelForm";
}
	
}