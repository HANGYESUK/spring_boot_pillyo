package com.pillyo.pill.service.Drug;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.pillyo.pill.dao.Drug.IDrugDAO;
import com.pillyo.pill.model.Drug.DrugInfoVO;

@Service
public class DrugService implements IDrugService {
	@Autowired
	@Qualifier("IDrugDAO")
	IDrugDAO dao;
		
	
	@Override
	public ArrayList<DrugInfoVO> drugSearch(String keyWord) {
		return dao.drugSearch(keyWord);
	}

	@Override
	public DrugInfoVO detailViewDrug(String drugInfoNo) {
		return dao.detailViewDrug(drugInfoNo);
	}

}