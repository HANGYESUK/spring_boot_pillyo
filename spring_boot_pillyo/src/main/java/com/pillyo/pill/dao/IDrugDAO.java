package com.pillyo.pill.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.pillyo.pill.model.DrugInfoVO;

public interface IDrugDAO {
	void insertDrugList(ArrayList<DrugInfoVO> drugList);		// API 약 정보 DB에 등록
	ArrayList<DrugInfoVO> drugSearch(String keyWord);	//약 검색 
	DrugInfoVO detailViewDrug(String drugInfoNo);	//약 상세정보 조회
	
	ArrayList<DrugInfoVO> selectItemBySearchWord(String keyWord);	//자동완성
	ArrayList<DrugInfoVO> selectKeywordSearch(String keyWord); //자동완성 제목조회
}
