package com.pillyo.pill.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.pillyo.pill.dao.IHmDAO;
import com.pillyo.pill.model.HmVO;

@Service
public class HmService implements IHmService{
	@Autowired
	@Qualifier("IHmDAO")
	IHmDAO dao;

	@Override
	public ArrayList<HmVO> insertHmResult() {
		// 전체 약 목록 관리
		return dao.insertHmResult();
	}

	@Override
	public ArrayList<HmVO> listCtgHm(HashMap<String, Object>map) {
		// 카테고리별 약 목록 관리
		return dao.listCtgHm(map);
	}

	@Override
	public void insertHm(HmVO vo) {
		// 약 등록
		dao.insertHm(vo);
	}

	@Override
	public void updateHm(HmVO vo) {
		// 등록 된 약 수정
		dao.updateHm(vo);
	}

	@Override
	public void deleteHm(int hmNo) {
		// 등록 된 약 삭제
		dao.deleteHm(hmNo);
	}

	@Override
	public HmVO detailViewHm(int hmNo) {
		// 등록 된 약 상세정보
		return dao.detailViewHm(hmNo);
	}
	
	
}