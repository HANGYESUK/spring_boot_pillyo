package com.pillyo.pill.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.pillyo.pill.dao.IAdminDAO;
import com.pillyo.pill.model.AdminVO;
import com.pillyo.pill.model.UserVO;

@Service
public class AdminService implements IAdminService {
@Autowired
@Qualifier("IAdminDAO")
IAdminDAO dao;

	@Override
	public AdminVO adminLogin(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.adminLogin(map);
	}

	@Override
	public ArrayList<UserVO> listAllUser() {
		// TODO Auto-generated method stub
		return dao.listAllUser();
	}

	@Override
	public void updateUser(UserVO vo) {
		// TODO Auto-generated method stub
		dao.updateUser(vo);
	}

	@Override
	public void deleteUser(String userId) {
		// TODO Auto-generated method stub
		dao.deleteUser(userId);
	}

	@Override
	public UserVO detailUserView(String userId) {
		// TODO Auto-generated method stub
		return dao.detailUserView(userId);
	}

}
