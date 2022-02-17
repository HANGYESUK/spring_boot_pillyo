package com.pillyo.pill.controller.Health;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pillyo.pill.model.Health.BodyVO;
import com.pillyo.pill.model.Health.FeelVO;
import com.pillyo.pill.model.Health.PressureVO;
import com.pillyo.pill.model.Health.SugarVO;
import com.pillyo.pill.service.Health.BodyService;
import com.pillyo.pill.service.Health.FeelService;
import com.pillyo.pill.service.Health.PressureService;
import com.pillyo.pill.service.Health.SugarService;

@Controller
public class HealthController { // 건강관리 컨트롤러
	
	// 항목별 서비스 연결
	@Autowired
	BodyService body_service;			// 체형
	
	@Autowired
	FeelService feel_service;			// 기분
	
	@Autowired
	PressureService pressure_service; 	// 혈압
	
	@Autowired
	SugarService sugar_service;	 		// 혈당
	/*
	 * // 건강 관리 정보 메인
	 * 
	 * @RequestMapping("/dashboard2") public String dashboard2() { return
	 * "/Main/dashboard2"; }
	 */
	
	// 건강 관리 정보 리스트
	@RequestMapping("/dashboard2/{famNo}") //페이지 다중 매핑 -> 하나만 하기
	public String listAllHealth(@PathVariable int famNo, Model model) {
		// 가족번호를 전달하고, 각각의 관리 정보 받아오기
//		int famNo=1; 
		
		BodyVO body = body_service.detailViewBody(famNo);					// 체형관리
		System.out.println(body.getHeight());
		model.addAttribute("body", body);
		
		FeelVO feel = feel_service.detailViewFeel(famNo);					// 기분관리
		model.addAttribute("feel", feel);
		
		PressureVO pressure = pressure_service.detailViewPressure(famNo);	// 혈압관리
		model.addAttribute("pressure", pressure);
		
		SugarVO sugar = sugar_service.detailViewSugar(famNo);				// 혈당관리
		model.addAttribute("sugar", sugar);
		
		return "Main/dashboard2"; // 대시보드 페이지로 포워딩
	}
}