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
	public void famStart(String userId) {
		dao.famStart(userId);
	}
	@Override
	public void famUpdate(FamilyVO famVo) {
		dao.famUpdate(famVo);
	}

	@Override
	public void famDelete(int famNo) {
		dao.famDelete(famNo);
	}
	
	@Override
	public FamilyVO famDetailView(int famNo) {
		return dao.famDetailView(famNo);
	}
	@Override
	public void deleteUserFam(String userId) {
		dao.deleteUserFam(userId);
	}
	@Override
	public int nextFamNo() {
		return dao.nextFamNo();
	}
}