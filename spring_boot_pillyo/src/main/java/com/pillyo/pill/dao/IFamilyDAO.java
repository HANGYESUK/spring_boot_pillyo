package com.pillyo.pill.dao;

import java.util.ArrayList;

import com.pillyo.pill.model.FamilyVO;

public interface IFamilyDAO {
	ArrayList<FamilyVO> famListView(); // 가족 목록 조회
	void famInsert(FamilyVO famVo); // 가족 정보 등록
	void famUpdate(FamilyVO famVo); // 가족 정보 수정
	void famDelete(String famNo); // 가족 정보 삭제
	FamilyVO famDetailView(String famNo); // 가족 정보 상세 조회
}
