package com.pillyo.pill.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.pillyo.pill.dao.ISugarDAO;
import com.pillyo.pill.model.SugarVO;

@Service
public class SugarService implements ISugarService {
	@Autowired
	@Qualifier("ISugarDAO")
	ISugarDAO dao;
	
	@Override
	public ArrayList<SugarVO> listAllSugar() {
		return dao.listAllSugar();
	}

	@Override
	public void insertSugar(SugarVO vo) {
		dao.insertSugar(vo);
	}

	@Override
	public void updateSugar(SugarVO vo) {
		dao.updateSugar(vo);
	}

	@Override
	public void deleteSugar(int sugarNo) {
		dao.deleteSugar(sugarNo);
	}
	
	@Override
	public SugarVO detailViewSugar(int SugarNo) {
		return dao.detailViewSugar(SugarNo);
	}
}
