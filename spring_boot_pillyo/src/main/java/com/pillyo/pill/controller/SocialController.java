package com.pillyo.pill.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pillyo.pill.model.social.KakaoVO;
import com.pillyo.pill.service.SocialService;
import com.pillyo.pill.service.UserService;

@Controller
public class SocialController {
	@Autowired
	SocialService socialService;
	
	// 테스트용 페이지
	@RequestMapping("/kakaoSocial")
	public String kakaoSocial() {	
		return "member/kakaoSocial";
	}
	
	// 카카오 회원가입 폼 (카카오 정보 연동 및 추가 정보 입력)
	@RequestMapping("/kakaoJoinForm")
	public String kakaoJoinForm() {	
		return "member/kakaoJoinForm";
	}
	
	// 중복회원인지 이메일 체크
	@ResponseBody
	@RequestMapping("/kakaoEmailCheck")
	public String kakaoEmailCheck(@RequestParam("k_email") String k_email) {
		String kakaoEmail_result = socialService.kakaoEmailCheck(k_email);
		
		String result = "use";
		if(kakaoEmail_result != null)
			result = "no_use";
		
		return result;
	}
	
	// 카카오 회원 회원가입 처리
	@RequestMapping("/kakaoJoin")
	public String kakaoJoin(KakaoVO vo) {	
		socialService.kakaoJoin(vo);
		socialService.kakaoJoinUser(vo);
		return "redirect:/";
	}
}
