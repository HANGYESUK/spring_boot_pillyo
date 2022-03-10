package com.pillyo.pill.service.social;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.pillyo.pill.dao.social.ISocialDAO;
import com.pillyo.pill.model.social.KakaoVO;

@Service
public class SocialService implements ISocialService {
	@Autowired
	@Qualifier("ISocialDAO")
	ISocialDAO dao;
	
	@Override
	public String kakaoJoinCheck(String k_email) {
		// 카카오 회원가입 여부 체크
		return dao.kakaoJoinCheck(k_email);
	}
	
	@Override
	public String kakaoLoginCheck(String k_email) {
		// 로그인 유효성 검사
		return dao.kakaoLoginCheck(k_email);
	}
	
	@Override
	public void kakaoJoin(KakaoVO vo) {
		// 회원가입 : kakao_user 테이블에 회원정보 추가
		dao.kakaoJoin(vo);
	}
	
	@Override
	public void kakaoJoinUser(KakaoVO vo) {
		// 회원가입 : 서비스 이용 위해 user 테이블에 회원정보 추가
		dao.kakaoJoinUser(vo);
	}
	
	@Override
	public int joinPathCheck(String id) {
		// 로그인 시 소셜 로그인 회원인지 체크
		return dao.joinPathCheck(id);
	}
}