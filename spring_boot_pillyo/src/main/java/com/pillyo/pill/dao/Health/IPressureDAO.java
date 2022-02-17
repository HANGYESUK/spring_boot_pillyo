package com.pillyo.pill.dao.Health;

import java.util.ArrayList;

import com.pillyo.pill.model.Health.PressureVO;
import com.pillyo.pill.model.Health.SugarVO;

public interface IPressureDAO {
	ArrayList<PressureVO>listAllPressure();
	void insertPressure(PressureVO vo);
	void updatePressure(PressureVO vo);
	void deletePressure(int pressureNo);
	PressureVO detailViewPressure(int pessureNo);
}
