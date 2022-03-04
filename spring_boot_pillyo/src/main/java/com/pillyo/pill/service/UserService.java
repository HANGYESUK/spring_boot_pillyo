package com.pillyo.pill.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.pillyo.pill.dao.IUserDAO;
import com.pillyo.pill.model.UserVO;

@Service
public class UserService implements IUserService {
	@Autowired
	@Qualifier("IUserDAO")
	IUserDAO dao;
	
	@Override
	public UserVO loginCheck(HashMap<String, Object> map) {		
		return dao.loginCheck(map);
	}
	
	@Override
	public String userIdCheck(String userId) {
		return dao.userIdCheck(userId);
	}
	
	@Override
	public String userEmailCheck(String email) {
		return dao.userEmailCheck(email);
	}
	
	@Override
	public void userJoin(UserVO vo) {
		dao.userJoin(vo);
	}
	@Override
	public UserVO detailUserView(String userId) {	// 회원 상세 정보
		return dao.detailUserView(userId);
	}
	@Override
	public void updateUser(UserVO vo) {	// 회원 정보 수정
		dao.updateUser(vo);
	}
	@Override
	public void deleteUser(String userId) {	// 회원 정보 삭제
		dao.deleteUser(userId);
	}
	
	@Override
	public ArrayList<UserVO> listAllUser(){
		return dao.listAllUser();
	}
}
