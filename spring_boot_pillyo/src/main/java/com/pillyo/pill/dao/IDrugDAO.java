package com.pillyo.pill.dao;

import java.util.ArrayList;

import com.pillyo.pill.model.DrugInfoVO;

public interface IDrugDAO {
	void insertDrugList(ArrayList<DrugInfoVO> drugList);		// API 약 정보 DB에 등록
}
