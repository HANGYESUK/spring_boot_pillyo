package com.pillyo.pill.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.pillyo.pill.model.UserVO;

public interface IUserDAO {

	// 로그인 체크
	UserVO loginCheck(HashMap<String, Object> map);
	String userIdCheck(String userId);
	
	// 회원가입
	String userEmailCheck(String email); // 이메일 중복 확인
	void userJoin(UserVO vo); // 회원가입
	
	UserVO detailUserView(String userId);	// 회원 상세 정보
	void updateUser(UserVO vo);	// 회원 정보 수정
	void deleteUser(String userId);	// 회원 정보 삭제
	
	
	//관리자메뉴
	ArrayList<UserVO> listAllUser();
	int userCount();
}
