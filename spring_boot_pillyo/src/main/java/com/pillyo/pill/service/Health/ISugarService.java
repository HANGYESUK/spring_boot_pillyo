package com.pillyo.pill.service.Health;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.pillyo.pill.model.Health.SugarVO;

public interface ISugarService {
	ArrayList<SugarVO>listAllSugar();
	void insertSugar(SugarVO vo);
	void updateSugar(SugarVO vo);
	void deleteSugar(int sugarNo);
	SugarVO detailViewSugar(int SugarNo);
	
}
