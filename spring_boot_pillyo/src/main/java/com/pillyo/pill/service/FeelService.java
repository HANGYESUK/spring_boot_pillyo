package com.pillyo.pill.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.pillyo.pill.dao.IFeelDAO;
import com.pillyo.pill.model.FeelVO;

@Service
public class FeelService implements IFeelService{
	@Autowired
	@Qualifier("IFeelDAO")
	IFeelDAO dao;

	@Override
	public ArrayList<FeelVO> myListAllFeel(String userId) {
		return dao.myListAllFeel(userId);
	}

	@Override
	public void insertFeel(FeelVO vo) {
		dao.insertFeel(vo);
	}

	@Override
	public void updateFeel(FeelVO vo) {
		dao.updateFeel(vo);
	}

	@Override
	public void deleteFeel(int feelNo) {
		dao.deleteFeel(feelNo);
	}

	@Override
	public FeelVO detailViewFeel(int feelNo) {
		return dao.detailViewFeel(feelNo);
	}
	
	@Override
	public ArrayList<FeelVO> listAllFeel(int famNo) {
		// TODO Auto-generated method stub
		return dao.listAllFeel(famNo);
	}
}