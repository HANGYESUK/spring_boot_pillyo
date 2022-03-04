package com.pillyo.pill.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.pillyo.pill.model.HmVO;

public interface IHmService{
	ArrayList<HmVO>insertHmResult(String userId);						// 전체 약 목록 
	ArrayList<HmVO>listCtgHm(HashMap<String, Object>map);	// 카테고리별 약 목록 관리
	void insertHm(HmVO vo);									// 약 등록
	void updateHm(HmVO vo);									// 등록 된 약 수정
	void deleteHm(int hmNo);								// 등록 된 약 삭제
	HmVO detailViewHm (int hmNo);						// 등록 된 약 상세정보
}