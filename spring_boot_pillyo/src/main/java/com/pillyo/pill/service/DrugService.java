package com.pillyo.pill.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.pillyo.pill.dao.IDrugDAO;
import com.pillyo.pill.model.AutoDrugInfoVO;
import com.pillyo.pill.model.DrugInfoVO;
import com.pillyo.pill.model.DrugShapeVO;
import com.pillyo.pill.paging.Criteria;

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
	@Override
	public ArrayList<DrugInfoVO> selectItemBySearchWord(String keyWord){ //자동완성
		return dao.selectItemBySearchWord(keyWord);
	}
	@Override
	public ArrayList<DrugInfoVO> selectKeywordSearch(String keyWord) { //자동완성 제목조회
		return dao.selectKeywordSearch(keyWord);
	}
	@Override
	public ArrayList<AutoDrugInfoVO>drugListView(){
		return dao.drugListView();
	}
	@Override
	public ArrayList<DrugInfoVO> listAllDrugView(){ //관리자 메뉴- 전제조회
		return dao.listAllDrugView();
	}
	/* 페이징 */
	@Override
	public int getTotal(Criteria cri) {
		// TODO Auto-generated method stub
		return dao.getTotal(cri);
	}
	@Override
	public List<DrugInfoVO> getDrugListPaging(Criteria cri) throws Exception {
		return dao.getDrugListPaging(cri);
	}
	
}
