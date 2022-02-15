package com.pillyo.pill.service;

import java.util.ArrayList;

import com.pillyo.pill.model.DoseVO;

public interface IDoseService {
	ArrayList<DoseVO> doseListView(); // 가족 목록 조회 
	void doseInsert(DoseVO doseVo); // 가족 정보 등록
	void doseUpdate(DoseVO doseVo); // 가족 정보 수정
	void doseDelete(String ddNo); // 가족 정보 삭제
	DoseVO doseDetailView(String ddNo); // 가족 정보 상세 조회
}
