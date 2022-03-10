package com.pillyo.pill.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.pillyo.pill.model.DrugShapeVO;
import com.pillyo.pill.paging.Criteria;

public interface IDrugShapeDAO {
	//public ArrayList<DrugShapeVO> drugShapeSearch(HashMap<String, Object> map);
	public List<DrugShapeVO> drugShapeSearch(HashMap<String, Object> map) throws Exception;
	
	public ArrayList<DrugShapeVO>listAllDrugShapeView();
	
	/* 페이징처리 */
	// 게시물 총 갯수
	public int getTotal(Criteria cri);

	// 페이징 처리 게시글 조회
	public List<DrugShapeVO> getShapeListPaging(Criteria cri) throws Exception;
	
}
