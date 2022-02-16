package com.pillyo.pill.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pillyo.pill.model.UserVO;
import com.pillyo.pill.service.UserService;

@Controller
public class UserController {
	@Autowired
	UserService service;
	
	// 로그인 폼으로 이동
	@RequestMapping("/loginForm")
	public String loginForm() {
		return "/member/loginForm";
	}

	// 로그인 처리 : id와 pw 전달 받아서 로그인 체크
	@ResponseBody
	@RequestMapping("/login")
	public String loginCheck(@RequestParam HashMap<String, Object> param,
											   HttpSession session) {
		
		// 로그인 체크 결과
		UserVO vo = service.loginCheck(param);
		String result = "fail";
		
		if(vo != null) {
			//로그인 성공하면 세션 변수 지정
			session.setAttribute("sid", vo.getUserId());
			System.out.println(vo.getUserId());
			result = "success";
		}
		
		return result;
	}
	
	// 로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		
		// DB에서 아이디 패승워드 확인

		session.invalidate();

		return "redirect:/";
	}
	
	// 사용자 아이디 중복 확인
		@ResponseBody
		@RequestMapping("/userIdCheck")
		public String userIdCheck(@RequestParam("userId") String userId) {
			String userId_result = service.userIdCheck(userId);
			
			String result = "use";
			if(userId_result != null)
				result = "no_use";
			
			return result;
		}
		
		// 사용자 이메일 중복 확인
		@ResponseBody
		@RequestMapping("/userEmailCheck")
		public String userEmailCheck(@RequestParam("userEmailId") String userEmailId, @RequestParam("userEmail") String userEmail) {
			String email = userEmailId + '@' + userEmail;
			String userEmail_result = service.userEmailCheck(email);
			
			String result = "use";
			if(userEmail_result != null)
				result = "no_use";
			
			return result;
		}
		
		// 회원가입
		@RequestMapping("/userJoin")
		public String userJoin(UserVO vo) {
			service.userJoin(vo);
			
			return "redirect:/";
		}
}
