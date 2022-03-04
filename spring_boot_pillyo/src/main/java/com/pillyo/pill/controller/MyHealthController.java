package com.pillyo.pill.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pillyo.pill.model.PressureVO;
import com.pillyo.pill.model.SugarVO;
import com.pillyo.pill.service.BodyService;
import com.pillyo.pill.service.FamilyService;
import com.pillyo.pill.service.FeelService;
import com.pillyo.pill.service.PressureService;
import com.pillyo.pill.service.SugarService;


@Controller
public class MyHealthController {
	@Autowired
	HealthController service;
	
	// 항목별 서비스 연결
	@Autowired
	FamilyService family_service;		// 가족
	
	@Autowired
	BodyService body_service;			// 체형
	
	@Autowired
	FeelService feel_service;			// 기분
	
	@Autowired
	PressureService pressure_service; 	// 혈압
	
	@Autowired
	SugarService sugar_service;	 		// 혈당
	
	// 마이페이지 - 건강관리 리스트 페이지로 이동
	@RequestMapping("/MyPage/MyHealthList")
	public String MyHealthList() {
		return "member/myHealth";
	}
	
	// 체형 리스트 조회
	
	// 기분 리스트 조회
	
	// 혈압 리스트 조회
	@RequestMapping("/myListAllPressure")
	public String myListAllPressure(HttpSession session, Model model){
		String userId = (String)session.getAttribute("sid");
		System.out.println("마이페이지" + userId);
		ArrayList<PressureVO> pressureList = pressure_service.myListAllPressure(userId);
		model.addAttribute("pressureList", pressureList);
		System.out.println(pressureList.get(0));
		return "pressure/pressureListView";
	}
	// 혈당 리스트 조회
	@RequestMapping("/myListAllSugar")
	public String myListAllSugar(HttpSession session, Model model){
		String userId = (String)session.getAttribute("sid");
		System.out.println("마이페이지" + userId);
		ArrayList<SugarVO> sugarList = sugar_service.myListAllSugar(userId);
		model.addAttribute("sugarList", sugarList);
		System.out.println(sugarList.get(0));
		return "sugar/sugarListView";
	}
	
	
	
}
