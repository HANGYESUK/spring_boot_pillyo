package com.pillyo.pill.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.pillyo.pill.dao.IDrugShapeDAO;
import com.pillyo.pill.model.DrugShapeVO;
import com.pillyo.pill.paging.Criteria;

@Service
public class DrugShapeService implements IDrugShapeService {
@Autowired
@Qualifier("IDrugShapeDAO")
IDrugShapeDAO dao;
	
	@Override
	public List<DrugShapeVO> drugShapeSearch(HashMap<String, Object> map) throws Exception {
		/*
		 * public ArrayList<DrugShapeVO> drugShapeSearch(HashMap<String, Object> map) {
		 */
		return dao.drugShapeSearch(map);
	}
	@Override
	public ArrayList<DrugShapeVO>listAllDrugShapeView(){
		return dao.listAllDrugShapeView();
	}
	
	/* 페이징 */
	@Override
	public int getTotal(Criteria cri) {
		// TODO Auto-generated method stub
		return dao.getTotal(cri);
	}
	@Override
	public List<DrugShapeVO> getShapeListPaging(Criteria cri) throws Exception {
		return dao.getShapeListPaging(cri);
	}
	
}
