package com.pillyo.pill.dao.social;

import com.pillyo.pill.model.social.KakaoVO;

public interface ISocialDAO {
	String kakaoJoinCheck(String k_email); // 카카오 회원가입 여부 체크
	String kakaoLoginCheck(String k_email); // 로그인 유효성 검사
	void kakaoJoin(KakaoVO vo); // 회원가입 : 카카오 DB에 추가
	void kakaoJoinUser(KakaoVO vo); // 회원가입 : 서비스 이용 위해 user 테이블에 추가
	int joinPathCheck(String id); // 로그인 시 소셜 로그인 회원인지 체크
}