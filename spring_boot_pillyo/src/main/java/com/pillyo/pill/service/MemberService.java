package com.pillyo.pill.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.pillyo.pill.dao.IMemberDAO;
import com.pillyo.pill.model.MemberVO;


@Service
public class MemberService implements IMemberService {
	@Autowired
	@Qualifier("IMemberDAO")
	IMemberDAO dao;
	
	@Override
	public MemberVO loginCheck(HashMap<String, Object> map) {		
		return dao.loginCheck(map);
	}
	
	@Override
	public String userIdCheck(String userId) {
		return dao.userIdCheck(userId);
	}
}
