package com.pillyo.pill.controller;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.pillyo.pill.service.ChatbotService;
import com.pillyo.pill.service.OCRService;;

@RestController
public class APIRestController {

	@Autowired
	private OCRService ocrService;
	
	@Autowired
	private ChatbotService chatbotService;
	
	// OCR 요청 받아서 서비스 호출하고 결과 받아서 반환
	@RequestMapping("/clovaOCR")
	public String  faceRecogCel(@RequestParam("uploadFile") MultipartFile file) {		
		String result = "";
		
		try {
			// 1. 파일 저장 경로 설정 : 실제 서비스되는 위치 (프로젝트 외부에 저장)
			//String uploadPath = "C:/upload/"; // 로칼에서 사용할때 
			String uploadPath = "/upload/"; // 배포 서버에서 사용할때
			
			// 2. 원본 파일 이름 알아오기
			String originalFileName = file.getOriginalFilename();
			String filePathName = uploadPath + originalFileName;
			
			// 3. 파일 생성
			File file1 = new File(filePathName);
			
			// 4. 서버로 전송
			file.transferTo(file1);				
			
			// 서비스에 파일 path와 파일명 전달  -> 서비스 메소드에서 변경
			// 서비스에서 반환된 텍스트를 result에 저장
			result = ocrService.clovaOCRService(filePathName);
			System.out.println(result);
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	
	@RequestMapping("/clovaChatbot")
	public String clovaChatbot(@RequestParam("message") String message) {
		String result= chatbotService.main(message);
		//System.out.println(message);
		return result;
	}
}
