package com.pillyo.pill.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.pillyo.pill.dao.IDoseDAO;
import com.pillyo.pill.model.DoseVO;

@Service
public class DoseService implements IDoseService {
	@Autowired
	@Qualifier("IDoseDAO")
	IDoseDAO dao;
	
	@Override
	public ArrayList<DoseVO> doseListView(int famNo) {
		return dao.doseListView(famNo);
	}

	@Override
	public void doseInsert(DoseVO doseVo) {
		dao.doseInsert(doseVo);
	}

	@Override
	public void doseUpdate(DoseVO doseVo) {
		dao.doseUpdate(doseVo);
	}

	@Override
	public void doseDelete(int ddNo) {
		dao.doseDelete(ddNo);
	}

	@Override
	public DoseVO doseDetailView(int ddNo) {
		return dao.doseDetailView(ddNo);
	}
	
	@Override
	public String doseDetailName(int ddNo) {
		return dao.doseDetailName(ddNo);
	}

}
