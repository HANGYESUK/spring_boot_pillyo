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
	public ArrayList<PressureVO> listAllPressure() {
		return dao.listAllPressure();
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
	public PressureVO detailViewPressure(int famNo) {
		return dao.detailViewPressure(famNo);
	}

}
