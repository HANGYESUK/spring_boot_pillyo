package com.pillyo.pill.dao;

import java.util.HashMap;

import com.pillyo.pill.model.UserVO;

public interface IUserDAO {

	// 로그인 체크
	UserVO loginCheck(HashMap<String, Object> map);
	String userIdCheck(String userId);
}
