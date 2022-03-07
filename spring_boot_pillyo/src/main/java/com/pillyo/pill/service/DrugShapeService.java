package com.pillyo.pill.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.pillyo.pill.dao.IDrugShapeDAO;
import com.pillyo.pill.model.DrugShapeVO;

@Service
public class DrugShapeService implements IDrugShapeService {
@Autowired
@Qualifier("IDrugShapeDAO")
IDrugShapeDAO dao;
	
	@Override
	public ArrayList<DrugShapeVO> drugShapeSearch(HashMap<String, Object> map) {
		return dao.drugShapeSearch(map);
	}
	@Override
	public ArrayList<DrugShapeVO>listAllDrugShapeView(){
		return dao.listAllDrugShapeView();
	}
}
