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
	
	// 기분 관리 등록 폼 이동
	@RequestMapping("/feelManageForm")
	public String mood() {
		return "/feel/feelManage";
	}
	
	// 기분 관리 등록 완료 시 폼 이동
	@RequestMapping("/insertFeel")
	public String insertFeel(FeelVO feelvo) {
		service.insertFeel(feelvo);
		System.out.println(feelvo.getFeelScale());
		return "redirect:../listAllFeelVO";
	}
	
	// 기분 관리 수정
	@RequestMapping("/updateFeel")
	public String updateFeel(FeelVO feelvo) {
		service.updateFeel(feelvo);
		return "redirect:/listAllFeelVO";
	}
	
	// 기분 관리 삭제
	@RequestMapping("/deleteFeel/{feelNo}")
	public String deleteFeel(@PathVariable int feelNo) {
		service.deleteFeel(feelNo);
		return "redirect:/listAllFeelVO";
	}
	
	// 전체 기분 관리 기록 조회
	@RequestMapping("/listAllFeelVO")
	public String listAllFeelVO(Model model) {
		ArrayList<FeelVO> feelList = service.listAllFeelVO();
		model.addAttribute("feelList", feelList);
		return "feel/listAllFeelVO";
	}

}