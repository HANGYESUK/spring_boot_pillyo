package com.pillyo.pill.service;

import java.util.ArrayList;

import com.pillyo.pill.model.FamilyVO;

public interface IFamilyService {
	ArrayList<FamilyVO> selectFamList(); // 전체 가족 조회
	void famInsert(FamilyVO famVo); // 가족 정보 등록
	void updateFamMember(FamilyVO famVo); // 가족 정보 수정
	void deleteFamMember(FamilyVO famVo); // 가족 정보 삭제
}
