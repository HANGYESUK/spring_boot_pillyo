package com.pillyo.pill.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.pillyo.pill.dao.IPressureDAO;
import com.pillyo.pill.model.PressureVO;
import com.pillyo.pill.model.SugarVO;

@Service
public class PressureService implements IPressureService {
	@Autowired
	@Qualifier("IPressureDAO")
	IPressureDAO dao;
	
	@Override
	public ArrayList<PressureVO> myListAllPressure(String userId) {
		return dao.myListAllPressure(userId);
	}

	@Override
	public void insertPressure(PressureVO vo) {
		dao.insertPressure(vo);
	}

	@Override
	public void updatePressure(PressureVO vo) {
		dao.updatePressure(vo);
	}

	@Override
	public void deletePressure(int pressureNo) {
		dao.deletePressure(pressureNo);
	}
	
	@Override
	public PressureVO detailViewPressure(int pressureNo) {
		return dao.detailViewPressure(pressureNo);
	}
	
	@Override
	public ArrayList<PressureVO> listAllPressure(int famNo) {
		// TODO Auto-generated method stub
		return dao.listAllPressure(famNo);
	}

}
