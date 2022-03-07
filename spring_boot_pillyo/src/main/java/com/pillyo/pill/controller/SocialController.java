package com.pillyo.pill.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pillyo.pill.model.social.KakaoVO;
import com.pillyo.pill.service.SocialService;

@Controller
public class SocialController {
	@Autowired
	SocialService service;
	
	// 테스트용 페이지
	@RequestMapping("/kakaoSocial")
	public String kakaoSocial() {	
		return "member/kakaoSocial";
	}
	
	// 회원가입
	@RequestMapping("/kakaoJoin")
	public String kakaoJoin(KakaoVO vo) {
//		vo.setK_name(k_name);
//		vo.setK_email(k_email);
//		vo.setK_bday(k_bday);
//		vo.setK_gender(k_gender);
		service.kakaoJoin(vo);		
		return "redirect:/";
	}
}
