package com.pillyo.pill.dao.Health;

import java.util.ArrayList;

import com.pillyo.pill.model.Health.SugarVO;

public interface ISugarDAO {
	ArrayList<SugarVO>listAllSugar();
	void insertSugar(SugarVO vo);
	void updateSugar(SugarVO vo);
	void deleteSugar(int sugarNo);
	SugarVO detailViewSugar(int SugarNo);
}
