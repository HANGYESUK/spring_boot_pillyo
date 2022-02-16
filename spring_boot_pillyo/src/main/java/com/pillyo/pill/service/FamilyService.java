package com.pillyo.pill.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.pillyo.pill.dao.IFamilyDAO;
import com.pillyo.pill.model.FamilyVO;

@Service 
public class FamilyService implements IFamilyService {
	@Autowired
	@Qualifier("IFamilyDAO")
	IFamilyDAO dao;
	
	@Override
	public ArrayList<FamilyVO> famListView(String userId) {
		return dao.famListView(userId);
	}

	@Override
	public void famInsert(FamilyVO famVo) {
		dao.famInsert(famVo);
	}

	@Override
	public void famUpdate(FamilyVO famVo) {
		dao.famUpdate(famVo);
	}

	@Override
	public void famDelete(String famNo) {
		dao.famDelete(famNo);
	}
	
	@Override
	public FamilyVO famDetailView(String famNo) {
		return dao.famDetailView(famNo);
	}

}