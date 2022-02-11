package com.pillyo.pill.service;

import java.util.HashMap;

import com.pillyo.pill.model.UserVO;

public interface IUserService {
	// 추상메서드 작성 후 MemberService 파일 생성 (implements)

	// 로그인
	UserVO loginCheck(HashMap<String, Object> map);
	String userIdCheck(String userId);
}
