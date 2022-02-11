package com.pillyo.pill.service;

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
}
