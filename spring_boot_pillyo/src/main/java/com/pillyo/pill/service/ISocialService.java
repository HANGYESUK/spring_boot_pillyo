package com.pillyo.pill.service;

import java.util.HashMap;

import com.pillyo.pill.model.social.KakaoVO;

public interface ISocialService {
	String kakaoEmailCheck(String k_email); // 중복회원인지 이메일 체크
	void kakaoJoin(KakaoVO vo); // 카카오 회원가입
	void kakaoJoinUser(KakaoVO vo); // 서비스 이용 위해 user 테이블에 추가
	int joinPathCheck(String id); // 로그인 시 소셜 로그인 회원인지 체크
	String kakaoUserCheck(HashMap<String, Object> map); // 카카오 로그인 시 : 카카오 회원가입 되어있는 회원인지 아닌지 체크
	String kakaoLogin(HashMap<String, Object> map); // 카카오 로그인
}
