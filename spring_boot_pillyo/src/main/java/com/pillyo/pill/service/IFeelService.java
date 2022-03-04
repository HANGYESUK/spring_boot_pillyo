package com.pillyo.pill.service;

import java.util.ArrayList;

import com.pillyo.pill.model.FeelVO;

public interface IFeelService{
	
	// 기분관리
	void insertFeel(FeelVO vo);			// 기분 관리 등록
	void updateFeel(FeelVO vo);			// 기분 관리 수정
	void deleteFeel(int feelNo);		// 기분 관리 삭제
	FeelVO detailViewFeel(int feelNo);	// 기분 관리 기록 상세 뷰
	ArrayList<FeelVO> listAllFeel(int famNo);	
	// 마이페이지
	ArrayList<FeelVO> myListAllFeel(String userId);	// 전체 기분 관리 기록 조회
}