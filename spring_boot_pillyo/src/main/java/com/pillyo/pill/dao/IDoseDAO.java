package com.pillyo.pill.dao;

import java.util.ArrayList;

import com.pillyo.pill.model.DoseVO;

public interface IDoseDAO {
	ArrayList<DoseVO> doseListView(); // 복용 목록 조회 
	void doseInsert(DoseVO doseVo); // 복용 정보 등록
	void doseUpdate(DoseVO doseVo); // 복용 정보 수정
	void doseDelete(String ddNo); // 복용 정보 삭제
	DoseVO doseDetailView(String ddNo); // 복용 정보 상세 조회
}
