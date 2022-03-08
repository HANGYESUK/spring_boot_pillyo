package com.pillyo.pill.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.pillyo.pill.dao.ISocialDAO;
import com.pillyo.pill.model.social.KakaoVO;

@Service
public class SocialService implements ISocialService {
	@Autowired
	@Qualifier("ISocialDAO")
	ISocialDAO dao;
	
	@Override
	public String kakaoEmailCheck(String k_email) {
		// 중복회원인지 이메일 체크
		return dao.kakaoEmailCheck(k_email);
	}
	
	@Override
	public void kakaoJoin(KakaoVO vo) {
		// 카카오 회원가입
		dao.kakaoJoin(vo);
	}
	
	@Override
	public void kakaoJoinUser(KakaoVO vo) {
		// 서비스 이용 위해 user 테이블에 추가
		dao.kakaoJoinUser(vo);
	}
}