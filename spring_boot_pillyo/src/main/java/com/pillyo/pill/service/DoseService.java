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
	public ArrayList<DoseVO> doseListView() {
		return dao.doseListView();
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
	public void doseDelete(String ddNo) {
		dao.doseDelete(ddNo);
	}

	@Override
	public DoseVO doseDetailView(String ddNo) {
		return dao.doseDetailView(ddNo);
	}

}
