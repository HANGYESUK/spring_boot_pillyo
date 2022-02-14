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
	public ArrayList<FamilyVO> selectFamList() {
		return dao.selectFamList();
	}

	@Override
	public void famInsert(FamilyVO famVo) {
		dao.famInsert(famVo);
	}

	@Override
	public void updateFamMember(FamilyVO famVo) {
		//dao.updateFamMember(famVo);
	}

	@Override
	public void deleteFamMember(FamilyVO famVo) {
		//dao.deleteFamMember(famVo);
	}
	
}