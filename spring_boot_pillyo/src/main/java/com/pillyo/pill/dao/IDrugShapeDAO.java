package com.pillyo.pill.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.pillyo.pill.model.DrugShapeVO;

public interface IDrugShapeDAO {
	public ArrayList<DrugShapeVO> drugShapeSearch(HashMap<String, Object> map);
}
