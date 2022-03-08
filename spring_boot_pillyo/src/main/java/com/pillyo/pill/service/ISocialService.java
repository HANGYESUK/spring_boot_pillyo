package com.pillyo.pill.service;

import com.pillyo.pill.model.social.KakaoVO;

public interface ISocialService {
	String kakaoEmailCheck(String k_email); // 중복회원인지 이메일 체크
	void kakaoJoin(KakaoVO vo); // 카카오 회원가입
	void kakaoJoinUser(KakaoVO vo); // 서비스 이용 위해 user 테이블에 추가
}
