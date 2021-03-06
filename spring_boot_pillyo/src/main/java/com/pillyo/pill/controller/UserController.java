package com.pillyo.pill.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pillyo.pill.model.UserVO;
import com.pillyo.pill.service.FamilyService;
import com.pillyo.pill.service.UserService;
import com.pillyo.pill.service.notification.NotificationService;
import com.pillyo.pill.service.social.SocialService;

@Controller
public class UserController {
	@Autowired
	UserService user_service;
	
	@Autowired
	FamilyService family_Service;
	
	@Autowired
	SocialService social_Service;
	
	@Autowired
	NotificationService notification_Service;
	
	
	// 로그인 폼으로 이동
	@RequestMapping("/loginForm")
	public String loginForm() {
		return "/member/loginForm";
	}

	// 로그인 처리 : id와 pw 전달 받아서 로그인 체크
	@ResponseBody
	@RequestMapping("/login")
	public String loginCheck(@RequestParam HashMap<String, Object> param, HttpSession session) {

		String result = "fail";
		UserVO vo = user_service.loginCheck(param);
		
		if(vo != null) {
			// 소셜 로그인 회원인지 체크 (가입경로 0 : pillyo 회원 | 1 : 카카오)
			int joinPath = social_Service.joinPathCheck(vo.getUserId());
			
			if (joinPath==0) {
				// 일반 회원으로 로그인 성공하면 세션 변수 지정
				session.setAttribute("sid", vo.getUserId());
				// System.out.println(vo.getUserId());
				result = "success";
			} else if (joinPath==1) {
				result = "kakao";
			} else {
				result = "fail";
			}
		}
		
		return result;
	}
	
	// 로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		
		// DB에서 아이디 패스워드 확인

		session.invalidate();

		return "redirect:/";
	}
	
	// 사용자 아이디 중복 확인
	@ResponseBody
	@RequestMapping("/userIdCheck")
	public String userIdCheck(@RequestParam("userId") String userId) {
		String userId_result = user_service.userIdCheck(userId);
		
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
		System.out.println(email);
		String userEmail_result = user_service.userEmailCheck(email);
		
		String result = "use";
		if(userEmail_result != null)
			result = "no_use";
		
		return result;
	}
	
	// 회원가입
	@RequestMapping("/userJoin")
	public String userJoin(UserVO vo) {
		user_service.userJoin(vo);
		
		//회원가입시 가족 번호 본인으로 자동 생성
		String userId = vo.getUserId();
		family_Service.famStart(userId);
		
		// 복용 알림 정보 default 추가
		notification_Service.joinNotiDefault(userId);
		
		return "redirect:/";
	}
	//마이페이지 이동
	@RequestMapping("/myPage")
	public String myPage() {
		return "/member/myPage";
	}
	
	
	//회원정보 수정폼으로 이동
	@RequestMapping("/updateMemberForm")
	public String updateMemberForm(HttpSession session, Model model) {
		String userId = (String)session.getAttribute("sid");
		UserVO vo = user_service.detailUserView(userId);
		
		//이메일 분리
		String emailStr = vo.getUserEmail();
		String[] emailArray = emailStr.split("@");
		String emailId = emailArray[0];
		String email = emailArray[1];
		
		  //핸드폰 분리
		String hpStr = vo.getUserHp();
		System.out.println(hpStr);
		String[] hpArray = hpStr.split("-");
		 
		
		String userHp1 = hpArray[0];
		String userHp2 = hpArray[1];
		String userHp3 = hpArray[2];
		 
					
		model.addAttribute("user", vo);
		model.addAttribute("emailId", emailId);
		model.addAttribute("email", email);
		model.addAttribute("userHp1", userHp1);
		model.addAttribute("userHp2", userHp2);
		model.addAttribute("userHp3", userHp3);
		
		return "/member/updateMemberForm";
	}
	
	@RequestMapping("/updateUser")
	public String updateUser(UserVO vo) {
		String emailId = vo.getUserEmailId();
		String email = vo.getUserEmailText();
		String userEmail = emailId + "@" + email;
		System.out.println(userEmail);
		vo.setUserEmail(userEmail);
		
		String userHp1 = vo.getUserHp1();
		String userHp2 = vo.getUserHp2();
		String userHp3 = vo.getUserHp3();
		String userHp = userHp1 + "-" + userHp2 +"-" +userHp3;
		vo.setUserHp(userHp);
		
		user_service.updateUser(vo);
		return "redirect:/myPage";
	}
	
	//회원탈퇴
	@RequestMapping("/deleteUser/{userId}")
	public String deleteUser(@PathVariable("userId") String userId, HttpSession session) {
		user_service.deleteUser(userId);
		session.invalidate();
		return "index";
	}
	
	
	// ---------------------------------------------------------------------------------------------------
	
	// 아이디 비밀번호 찾기 이동
	@RequestMapping("/find_user_ID_PW_form")
	public String find_user_ID_PW_form() {
		return "/member/findUserIdPw";
	}
	
	// 아이디 찾기
	@ResponseBody
	@RequestMapping("/find_UserId")
	public String findUserId(@RequestParam HashMap<String, Object> param, HttpSession session) {
		
		// 아이디 체크 결과
		UserVO vo = user_service.findUserId(param);
		String result = "fail";
		
		if(vo != null) {
			// 이름+이메일 -> 아이디 여부 확인해야함
			session.setAttribute("sid", vo.getUserId());
			result = "success";
		} 
		
		return result;
	}
}
