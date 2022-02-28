package com.pillyo.pill.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pillyo.pill.model.BodyVO;
import com.pillyo.pill.model.FamilyVO;
import com.pillyo.pill.model.FeelVO;
import com.pillyo.pill.model.PressureVO;
import com.pillyo.pill.model.SugarVO;
import com.pillyo.pill.service.BodyService;
import com.pillyo.pill.service.FamilyService;
import com.pillyo.pill.service.FeelService;
import com.pillyo.pill.service.PressureService;
import com.pillyo.pill.service.SugarService;

@Controller
public class HealthController { // 건강관리 컨트롤러
	
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
	/*
	 * // 건강 관리 정보 메인
	 * 
	 * @RequestMapping("/dashboard2") public String dashboard2() { return
	 * "/Main/dashboard2"; }
	 */
	
	// 건강 관리 정보 리스트
	@RequestMapping("/dashboard2/{famNo}") //페이지 다중 매핑 -> 하나만 하기
	public String listAllHealth(@PathVariable int famNo, Model model, HttpSession session) {
		// 가족번호를 전달하고, 각각의 관리 정보 받아오기
		
		String userId = (String)session.getAttribute("sid");	//session통해 userId Controller로 받기
		
		ArrayList<FamilyVO> famList = family_service.famListView(userId);	// userId이용해 famList 받기
		model.addAttribute("famList", famList);
		
		System.out.println(famNo);
		BodyVO body = body_service.detailViewBody(famNo);					// 체형관리
		model.addAttribute("body", body);
		
		FeelVO feel = feel_service.detailViewFeel(famNo);					// 기분관리
		model.addAttribute("feel", feel);
		
		PressureVO pressure = pressure_service.detailViewPressure(famNo);	// 혈압관리
		model.addAttribute("pressure", pressure);
		
		SugarVO sugar = sugar_service.detailViewSugar(famNo);				// 혈당관리
		model.addAttribute("sugar", sugar);
		
		return "Main/dashboard2"; // 대시보드 페이지로 포워딩
	}
	//처음 건강관리 선택시
	@RequestMapping("/healthManageView")
	public String dashboard(Model model, HttpSession session) {
		// 가족정보 변경하면서 이동할 수 있게 famList 받아옴.
//		String userId = (String)session.getAttribute("sid");
//		ArrayList<FamilyVO> famList = family_service.famListView(userId);
//		model.addAttribute("famList", famList);
//		
//		//선택한 famNO의 famList 인덱스를 확인하여
//		int idx = 0;
//		//for(int i=0;i<famList.size();i++) {
//			
//		//	if(famList.get(i).getFamNo() == famNo) {
//		//		idx= i;
//		//	}
//		//}
//		System.out.println(idx);
//		//famMember 이름 model값으로 보냄.
//		String famMember =  famList.get(idx).getFamMember();
//		model.addAttribute("famMember", famMember);
//
//		int famNo = famList.get(idx).getFamNo();
//		
//		//매핑때 받은 @PathVariavle int famNo 다시 모델로 보냄.
//		// famNo 기준 다시 등록폼 이동하거나 할때 사용. 
//		model.addAttribute("famNo", famNo);
//		
//		
//		//famNo 기준 건강 정보 리스트 출력.
//		ArrayList<BodyVO> bodyList = body_service.listAllBody(famNo);
//		model.addAttribute("bodyList", bodyList);
//		//				
//		ArrayList<FeelVO> feelList = feel_service.listAllFeel(famNo);
//		model.addAttribute("feelList", feelList);
//		System.out.println(feelList);
//		//FeelVO feel = feel_service.detailViewFeel(famNo);					// 기분관리
//		//model.addAttribute("feel", feel);
//		//				
//		ArrayList<PressureVO> pressureList = pressure_service.listAllPressure(famNo);
//		model.addAttribute("pressureList", pressureList);
//		//	PressureVO pressure = pressure_service.detailViewPressure(famNo);	// 혈압관리
//		//	model.addAttribute("pressure", pressure);
//		//				
//		ArrayList<SugarVO> sugarList = sugar_service.listAllSugar(famNo);
//		model.addAttribute("sugarList", sugarList);
//		//SugarVO sugar = sugar_service.detailViewSugar(famNo);				// 혈당관리
//		//model.addAttribute("sugar", sugar);
		return "/Main/healthManageView";
	}
	
	
	//건강관리 메인
	@RequestMapping("/healthManageView/{famNo}") //페이지 다중 매핑 -> 하나만 하기
	public String listAllHealth2(@PathVariable int famNo, Model model, HttpSession session) {
		// 가족번호를 전달하고, 각각의 관리 정보 받아오기
		//	 int famNo=1;
		
		// 가족정보 변경하면서 이동할 수 있게 famList 받아옴.
		String userId = (String)session.getAttribute("sid");
		ArrayList<FamilyVO> famList = family_service.famListView(userId);
		model.addAttribute("famList", famList);
		
		//선택한 famNO의 famList 인덱스를 확인하여
		int idx = 0;
		for(int i=0;i<famList.size();i++) {
			
			if(famList.get(i).getFamNo() == famNo) {
				idx= i;
			}
		}
		System.out.println(idx);
		//famMember 이름 model값으로 보냄.
		String famMember =  famList.get(idx).getFamMember();
		model.addAttribute("famMember", famMember);

		
		
		//매핑때 받은 @PathVariavle int famNo 다시 모델로 보냄.
		// famNo 기준 다시 등록폼 이동하거나 할때 사용. 
		model.addAttribute("famNo", famNo);
		
		
		//famNo 기준 건강 정보 리스트 출력.
		ArrayList<BodyVO> bodyList = body_service.listAllBody(famNo);
		model.addAttribute("bodyList", bodyList);
//		
		ArrayList<FeelVO> feelList = feel_service.listAllFeel(famNo);
		model.addAttribute("feelList", feelList);
		System.out.println(feelList);
//		FeelVO feel = feel_service.detailViewFeel(famNo);					// 기분관리
//		model.addAttribute("feel", feel);
//		
		ArrayList<PressureVO> pressureList = pressure_service.listAllPressure(famNo);
		model.addAttribute("pressureList", pressureList);
//		PressureVO pressure = pressure_service.detailViewPressure(famNo);	// 혈압관리
//		model.addAttribute("pressure", pressure);
//		
		ArrayList<SugarVO> sugarList = sugar_service.listAllSugar(famNo);
		model.addAttribute("sugarList", sugarList);
//		SugarVO sugar = sugar_service.detailViewSugar(famNo);				// 혈당관리
//		model.addAttribute("sugar", sugar);
		
		return "Main/healthManageView"; // 대시보드 페이지로 포워딩
	}
}