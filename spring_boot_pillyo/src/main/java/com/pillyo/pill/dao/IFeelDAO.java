package com.pillyo.pill.dao;

import java.util.ArrayList;

import com.pillyo.pill.model.FeelVO;

public interface IFeelDAO{

	// 기분관리
	ArrayList<FeelVO> listAllFeel();	// 전체 기분 관리 기록 조회
	void insertFeel(FeelVO vo);			// 기분 관리 등록
	void updateFeel(FeelVO vo);			// 기분 관리 수정
	void deleteFeel(int feelNo);		// 기분 관리 삭제
	FeelVO detailViewFeel(int famNo);	// 기분 관리 기록 상세 뷰
	ArrayList<FeelVO> listAllFeel(int famNo);
}