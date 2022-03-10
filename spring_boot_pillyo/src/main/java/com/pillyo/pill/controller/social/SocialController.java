package com.pillyo.pill.controller.social;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pillyo.pill.model.social.KakaoVO;
import com.pillyo.pill.service.FamilyService;
import com.pillyo.pill.service.social.SocialService;

@Controller
public class SocialController {
	@Autowired
	SocialService socialService;
	
	@Autowired
	FamilyService familyService;
	
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
	
	// 카카오 회원가입 여부 체크
    // kakaoJoinCheck 결과(이메일)가 참이면 -> idpw 체크 -> idpw 체크 결과 참이면 세션부여 / 거짓이면 로그인 실패
	// kakaoJoinCheck 결과(이메일)가 거짓이면 -> 카카오 회원가입으로 이동
	@ResponseBody
	@RequestMapping("/kakaoJoinCheck")
	public String kakaoJoinCheck(@RequestParam("k_email") String k_email, HttpSession session) {
		String kakaoJoinCheckResult = socialService.kakaoJoinCheck(k_email);
		System.out.println(k_email);//
		System.out.println(kakaoJoinCheckResult);//
		String result = "not_in";
		if(kakaoJoinCheckResult != null) {
			result = "in";
			System.out.println(result);//
			System.out.println("전 : " + k_email);//
			String kakaoLoginId = socialService.kakaoLoginCheck(k_email);
			System.out.println("후 : " + k_email);//
			System.out.println(kakaoLoginId);//
			session.setAttribute("sid", kakaoLoginId);
			System.out.println("세션 부여 확인");//
			// 메인 페이지로 이동하도록 내용 추가해야 함
		}
		 
		return result;
	}
	
	// 카카오 로그인 유효성 검사 및 세션 처리
	@ResponseBody
	@RequestMapping("/kakaoLoginCheck")
	public String kakaoLoginCheck(@RequestParam("k_email") String k_email, HttpSession session) {
		String kakaoLoginId = socialService.kakaoLoginCheck(k_email);
		String result = "notEqual";
		
		if(kakaoLoginId != null) {
			session.setAttribute("sid", kakaoLoginId);
			result = "equal";
		}

		return result;
	}
	
	// 카카오 회원가입 (kakao_user 테이블과 user 테이블에 가입한 회원 정보 추가)
	@ResponseBody
	@RequestMapping("/kakaoDBInsert")
	public String kakaoDBInsert(KakaoVO vo, HttpSession session) {
		socialService.kakaoJoin(vo); // 카카오 DB에 추가
		socialService.kakaoJoinUser(vo); // user DB에 추가
		familyService.famStart(vo.getK_id()); // 가족 테이블에 본인으로 추가
		session.setAttribute("sid", vo.getK_id());
		System.out.println("회원가입 후 자동 세션 부여 확인");//
		return "success";
	}
}
