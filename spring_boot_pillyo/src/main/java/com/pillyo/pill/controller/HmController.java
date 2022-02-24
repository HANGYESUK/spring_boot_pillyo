package com.pillyo.pill.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.pillyo.pill.model.HmVO;
import com.pillyo.pill.service.HmService;

@Controller
public class HmController{
	
	@Autowired
	HmService service;	// 서비스 연결
	
	
	// 우리집 약관리 페이지로 이동
	@RequestMapping("/hmForm")
	public String Household_Medicine(HmVO vo, Model model) {
		model.addAttribute("HmVO", vo);
		// System.out.println(vo.getHmCtgNo());
		return "household_medicine/hmForm";
	}
	
	
	// 우리집 약관리 : 상비약 등록 페이지 이동
	@RequestMapping("/insertHmForm")
	public String insertHmForm() {
		return "household_medicine/insertHmForm"; 
	}
	@RequestMapping("/insertHmForm2/{ocrResult}")
	public String insertHmForm2(@PathVariable String ocrResult, Model model) {
		model.addAttribute("ocrResult", ocrResult);
		return "household_medicine/insertHmForm2";
	}
	
	
	// 우리집 약관리 : 상비약 이미지 OCR 컨트롤러
	// OCR 요청 받아서 서비스 호출하고 결과 받아서 반환
	
	//우리집 약관리 : 상비약 등록
	@RequestMapping("/insertHm")
	//public String insertHm(@RequestParam("uploadFile")MultipartFile file,
	public String insertHm(HmVO vo, Model model) throws IOException{
				
		//1.파일 저장 경로 설정: 실제 서비스되는 위치로 (프로젝트 외부에 저장)
		//String uploadPath = "C:/upload/";
		
		//2. 원본 파일 이름 알아오기
		//String originalFileName = file.getOriginalFilename();
		
		//3. 파일 생성
		//File file1 = new File(uploadPath + originalFileName);
		
		//4.서버로 전송
		////file.transferTo(file1);
		//vo.setHmImg(originalFileName);
		//System.out.println(vo.getHmImg());
		
		service.insertHm(vo);
		model.addAttribute("HmVO", vo);
		
		//return null;
		
		// 우리집 약관리 : 상비약 등록 완료 페이지 이동
		return "redirect:/insertHmResult";
	}


	// 우리집 약관리 : 조회
	@RequestMapping("/insertHmResult")
	public String insertHmResult(Model model) {
		
		ArrayList<HmVO> hmList = service.insertHmResult();
		model.addAttribute("hmList", hmList);
		
		return "household_medicine/insertHmResult";
	}
	
	
	// 우리집 약관리 : 카테고리별 조회  --> http://localhost:8082/listCtgHm/1 리스트가 새로운 창에띄여짐
	@RequestMapping("/listCtgHm/{hmCtgNo}")
	public String listCtgHm(@PathVariable int hmCtgNo, Model model,
			 					HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		String userId = (String)session.getAttribute("sid");
		System.out.println(userId);
		map.put("userId", userId);
		map.put("hmCtgNo", hmCtgNo);
		
		ArrayList<HmVO> hmCtgList = service.listCtgHm(map);
		model.addAttribute("hmCtgList", hmCtgList);
		model.addAttribute("userId", userId);
		// DB에서 카테고리별 리스트 불러오기
		return "household_medicine/hmListView";
	}

	@ResponseBody
	@RequestMapping("/householde_medicine/hmListView")
	public ArrayList<HmVO> hmListViewAjax(@RequestParam("formData") int hmCtgNo,
											HttpSession session) {
		// formData 값이 hmListView로 전달이 안됌. 
		HashMap<String, Object> map = new HashMap<String, Object>();
		String userId = (String)session.getAttribute("sid");
		map.put("userId", userId);
		map.put("hmCtgNo", hmCtgNo);
		System.out.println("ajax" + map);
		ArrayList<HmVO> hmCtgList = service.listCtgHm(map);
		return hmCtgList;
	}
	
	// 우리집 약관리 : 삭제
	@RequestMapping("/deleteHm/{hmNo}")
	public String deleteHm(@PathVariable int hmNo) {
		System.out.println(hmNo);	// 상비약 등록 번호가 잘 전달 되는지 확인
		service.deleteHm(hmNo);
		return "redirect:../insertHmResult";
	}
	
	// 우리집 약관리 : 업데이트 폼 이동
	@RequestMapping("/updateHmForm/{hmNo}")
	public String updateHmForm(@PathVariable int hmNo, Model model) {
		HmVO hm = service.detailViewHm(hmNo);
		model.addAttribute("hm", hm);
		return "household_medicine/updateHmForm";
	}
	
	
	// 우리집 약관리 : 수정
	@RequestMapping("/updateHm")
	public String updateHm(HmVO vo) {
		service.updateHm(vo);
		return"redirect:/insertHmResult";
	}

	
}