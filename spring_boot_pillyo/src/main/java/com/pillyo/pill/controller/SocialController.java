package com.pillyo.pill.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pillyo.pill.model.UserVO;
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
	
	// 기존에 카카오로 회원가입 한 기록이 있으면 카카오 로그인 / 카카오로 회원가입 한 기록이 없으면 회원가입 하기 위한 체크
	@ResponseBody
	@RequestMapping("/kakaoUserCheck")
	public String kakaoUserCheck(@RequestParam HashMap<String, Object> param) {
		String kakaoUserCheckResult = socialService.kakaoUserCheck(param);
		
		String result = "not_in";
		if(kakaoUserCheckResult != null)
			result = "in";
		
		return result;
	}
	
	// 카카오 회원가입
	@RequestMapping("/kakaoJoin")
	public String kakaoJoin(KakaoVO vo) {
		
		socialService.kakaoJoin(vo);
		socialService.kakaoJoinUser(vo);
		return "redirect:/";
	}
	
	// 카카오 로그인
	@RequestMapping("/kakaoLogin")
	public String kakaoLogin(@RequestParam HashMap<String, Object> param, HttpSession session) {
		String result = "fail";
		String kakaoLoginSheck = socialService.kakaoLogin(param);
		
		if(kakaoLoginSheck != null) { result = "success"; }
		
		return "redirect:/";
	}
}
