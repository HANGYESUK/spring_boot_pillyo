package com.pillyo.pill.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.pillyo.pill.dao.IUserDAO;
import com.pillyo.pill.model.DrugInfoVO;
import com.pillyo.pill.model.UserVO;
import com.pillyo.pill.paging.Criteria;

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
	@Override
	public int userCount() {
		return dao.userCount();
	}
	
	// 아이디 찾기
	@Override
	public UserVO findUserId(HashMap<String, Object> map) {		
		return dao.findUserId(map);
	}
	
	// 비밀번호 찾기
	@Override
	public UserVO findUserPw(HashMap<String, Object> map) {		
		return dao.findUserPw(map);
	}
	
	/* 페이징 */
	@Override
	public int getTotal(Criteria cri) {
		// TODO Auto-generated method stub
		return dao.getTotal(cri);
	}
	@Override
	public List<UserVO> getUserListPaging(Criteria cri) throws Exception {
		return dao.getUserListPaging(cri);
	}
	
}
