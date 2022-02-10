package com.pillyo.pill.service;

import java.util.HashMap;

import com.pillyo.pill.model.MemberVO;

public interface IMemberService {
	// 추상메서드 작성 후 MemberService 파일 생성 (implements)
	MemberVO loginCheck(HashMap<String, Object> map);
	String userIdCheck(String userId);
}
