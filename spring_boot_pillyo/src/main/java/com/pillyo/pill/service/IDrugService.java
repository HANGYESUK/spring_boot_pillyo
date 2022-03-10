package com.pillyo.pill.service;

import java.util.ArrayList;
import java.util.List;

import com.pillyo.pill.model.AutoDrugInfoVO;
import com.pillyo.pill.model.DrugInfoVO;
import com.pillyo.pill.model.DrugShapeVO;
import com.pillyo.pill.paging.Criteria;

public interface IDrugService {
	
	ArrayList<DrugInfoVO> drugSearch(String keyWord);	//약 검색 
	DrugInfoVO detailViewDrug(String drugInfoNo);	//약 상세정보 조회

	ArrayList<DrugInfoVO> selectItemBySearchWord(String keyWord);	//자동완성
	ArrayList<DrugInfoVO> selectKeywordSearch(String keyWord); //자동완성 제목조회
	
	ArrayList<AutoDrugInfoVO>drugListView();	//복용정보 자동완성
	
	//관리자 메뉴
	ArrayList<DrugInfoVO> listAllDrugView(); //관리자 메뉴- 전제조회
	
	/* 페이징처리 */
	// 게시물 총 갯수
	public int getTotal(Criteria cri);

	// 페이징 처리 게시글 조회
	public List<DrugInfoVO> getDrugListPaging(Criteria cri) throws Exception;
}
