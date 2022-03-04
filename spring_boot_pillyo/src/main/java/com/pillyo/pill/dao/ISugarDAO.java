package com.pillyo.pill.dao;

import java.util.ArrayList;

import com.pillyo.pill.model.SugarVO;

public interface ISugarDAO {
	void insertSugar(SugarVO vo);
	void updateSugar(SugarVO vo);
	void deleteSugar(int sugarNo);
	SugarVO detailViewSugar(int sugarNo);
	ArrayList<SugarVO> listAllSugar(int famNo);
	
	//마이페이지 
	ArrayList<SugarVO>myListAllSugar(String userId);
}
