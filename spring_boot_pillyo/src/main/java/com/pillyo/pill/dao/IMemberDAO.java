package com.pillyo.pill.dao;

import java.util.HashMap;

import com.pillyo.pill.model.MemberVO;

public interface IMemberDAO {

	// 로그인 체크
	MemberVO loginCheck(HashMap<String, Object> map);
	String userIdCheck(String userId);
}
