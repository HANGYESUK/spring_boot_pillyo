package com.pillyo.pill.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.pillyo.pill.model.SugarVO;

public interface ISugarService {
	void insertSugar(SugarVO vo);
	void updateSugar(SugarVO vo);
	void deleteSugar(int sugarNo);
	SugarVO detailViewSugar(int sugarNo);
	ArrayList<SugarVO> listAllSugar(int famNo);

	//마이 페이지 
	ArrayList<SugarVO>myListAllSugar(String userId);
}
