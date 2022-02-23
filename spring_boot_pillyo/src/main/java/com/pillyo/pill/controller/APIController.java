package com.pillyo.pill.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pillyo.pill.service.OCRService;

@Controller
public class APIController {
	
	@Autowired
	private OCRService ocrService;
	
	// OCR
	// (1) OCR API 서비스 호출 결과를 콘솔에 출력
	/*@RequestMapping("/clovaOCR")
	public void clovaOCR() {
		ocrService.clovaOCRService();
	}   -->  APIRestController에서 처리
	
	*/
	
	// 변경 ->
	// (2) ocrView.jsp 페이지로 이동
	@RequestMapping("/clovaOCRForm")
	public String clovaOCRForm() {
		return "/household_medicine/insertHmForm";
	}
}
