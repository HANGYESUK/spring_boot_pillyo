package com.pillyo.pill.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.pillyo.pill.model.AdminVO;
import com.pillyo.pill.model.UserVO;

public interface IAdminDAO {
	//관리자 로그인
	AdminVO adminLogin(HashMap<String, Object>map);
	
	//회원관리
	ArrayList<UserVO> listAllUser();
	void updateUser(UserVO vo);
	void deleteUser(String userId);
	UserVO detailUserView(String userId);
	
	
	
	//건강관리
		//체형
		
		//혈당
		
		//혈압
		
		//기분
	
	//게시판관리
	
}
