package com.pillyo.pill.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.pillyo.pill.model.UserVO;

public interface IUserService {
	// 추상메서드 작성 후 MemberService 파일 생성 (implements)

	// 로그인
	UserVO loginCheck(HashMap<String, Object> map);
	String userIdCheck(String userId);
	UserVO detailUserView(String userId);	// 회원 상세 정보
	void updateUser(UserVO vo);	// 회원 정보 수정
	void deleteUser(String userId);	// 회원 정보 삭제
	String userEmailCheck(String email); // 이메일 중복 확인
	void userJoin(UserVO vo); // 회원가입
	
	
	//관리자 메뉴
	ArrayList<UserVO> listAllUser();
	int userCount();
}
