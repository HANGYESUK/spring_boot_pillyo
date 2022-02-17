package com.pillyo.pill.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.pillyo.pill.dao.IBodyDAO;
import com.pillyo.pill.model.BodyVO;

@Service
public class BodyService implements IBodyService {
	@Autowired
	@Qualifier("IBodyDAO")
	IBodyDAO dao;
	
	
	@Override
	public ArrayList<BodyVO> listAllBody() {
		// TODO Auto-generated method stub
		return dao.listAllBody();
	}

	@Override
	public void insertBody(BodyVO vo) {
		// TODO Auto-generated method stub
		dao.insertBody(vo);
	}

	@Override
	public void updateBody(BodyVO vo) {
		// TODO Auto-generated method stub
		dao.updateBody(vo);
	}
	
	@Override
	public void deleteBody(int bodyNo) {
		dao.deleteBody(bodyNo);
	}

	@Override
	public BodyVO detailViewBody(int famNo) {
		// TODO Auto-generated method stub
		return dao.detailViewBody(famNo);
	}
	
	@Override
	public ArrayList<BodyVO> listAllBody(int famNo) {
		// TODO Auto-generated method stub
		return dao.listAllBody(famNo);
	}

}
