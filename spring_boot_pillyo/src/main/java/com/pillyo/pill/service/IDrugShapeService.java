package com.pillyo.pill.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.pillyo.pill.model.DrugShapeVO;
import com.pillyo.pill.paging.Criteria;

public interface IDrugShapeService {
	//	낱알 옵션별 검색
	List<DrugShapeVO> drugShapeSearch(HashMap<String, Object> map) throws Exception;
	/* ArrayList<DrugShapeVO> drugShapeSearch(HashMap<String, Object> map); */
	
	//관리자 메뉴- 전체조회
	ArrayList<DrugShapeVO>listAllDrugShapeView();

	/* 페이징처리 */
	// 게시물 총 갯수
	public int getTotal(Criteria cri);

	// 페이징 처리 게시글 조회
	public List<DrugShapeVO> getShapeListPaging(Criteria cri) throws Exception;
}
