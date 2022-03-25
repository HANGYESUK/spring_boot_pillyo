package com.pillyo.pill.dao;

import java.util.ArrayList;

import com.pillyo.pill.model.FamilyVO;

public interface IFamilyDAO {
	ArrayList<FamilyVO> famListView(String userId); // 가족 목록 조회 
	void famInsert(FamilyVO famVo); // 가족 정보 등록
	void famStart(String userId);
	void famUpdate(FamilyVO famVo); // 가족 정보 수정
	void famDelete(int famNo); // 가족 정보 삭제
	FamilyVO famDetailView(int famNo); // 가족 정보 상세 조회
	
	void deleteUserFam(String userId); //관리자메뉴 회원탈퇴시 가족정보 삭제
	
	int nextFamNo(); //다음 가족번호 받아오기
}
