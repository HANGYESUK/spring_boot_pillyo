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
	public void kakaoJoin(KakaoVO vo) {
		// 카카오 회원가입
		dao.kakaoJoin(vo);
	}

}