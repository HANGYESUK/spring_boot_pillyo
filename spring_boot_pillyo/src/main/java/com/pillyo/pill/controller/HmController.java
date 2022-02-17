package com.pillyo.pill.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pillyo.pill.model.HmVO;
import com.pillyo.pill.service.HmService;

@Controller
public class HmController{
	
	@Autowired
	HmService service;	// 서비스 연결
	
	// 우리집 약관리 페이지로 이동
	@RequestMapping("/hmForm")
	public String Household_Medicine() {
		return "household_medicine/hmForm";
	}

	// 우리집 약관리 : 상비약 등록 페이지 이동
	@RequestMapping("/insertHm")
	public String insertHm(HmVO vo) {
		service.insertHm(vo);
		return "household_medicine/insertHmForm";
	}
	
	// 우리집 약관리 : 상비약 등록완료 페이지
	@RequestMapping("/insertHm/insertHmResult")
	public String insertHmResult(HmVO vo, Model model) {
		
		service.insertHmResult(vo);
		model.addAttribute("HmVO", vo);
		
		return "household_medicine/insertHmResult";
	}
	// test1
	// 우리집 약관리 : 전체 조회
	@RequestMapping("/listAllHm")
	public String listAllHm(Model model) {
		ArrayList<HmVO> hmList = service.listAllHm();
		model.addAttribute("hmList", hmList);
		return "household_medicine/hmListView";
	}
	
	// 우리집 약관리 : 카테고리별 조회
	@RequestMapping("/listCtgHm/{hmCtgNo}")
	public String listCtgHm(@PathVariable int hmCtgNo,
							@PathVariable int userId, Model model) {
		ArrayList<HmVO> hmCtgList = service.listCtgHm(hmCtgNo, userId);
		model.addAttribute("hmCtgList", hmCtgList);
		model.addAttribute("userId", userId);
		// DB에서 카테고리별 리스트 불러오기
		return "household_medicine/hmListView";
	}

	// 우리집 약관리 : 삭제
	@RequestMapping("/deleteHm/{hmNo}")
	public String deleteHm(@PathVariable int hmNo) {
		System.out.println(hmNo);	// 상비약 등록 번호가 잘 전달 되는지 확인
		service.deleteHm(hmNo);
		return "redirect:../listAllHm";
	}
	
	// 우리집 약관리 : 수정
	@RequestMapping("/updateHm")
	public String updateHm(HmVO vo) {
		service.updateHm(vo);
		return"redirect:/listAllHm";
	}
	
	// 우리집 약관리 : 업데이트 폼 이동
	@RequestMapping("/updateHmForm/{hmNo}")
	public String updateHmForm(@PathVariable int hmNo, Model model) {
		HmVO hm = service.detailViewHm(hmNo);
		model.addAttribute("hm", hm);
		return "household_medicine/updateHmForm";
	}
	
}