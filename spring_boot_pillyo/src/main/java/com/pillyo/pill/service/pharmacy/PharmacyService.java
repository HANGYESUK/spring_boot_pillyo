package com.pillyo.pill.service.pharmacy;

import java.util.ArrayList;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.io.BufferedReader;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.pillyo.pill.dao.IPharmacyDAO;
import com.pillyo.pill.model.pharmacy.PharmacyVO;

@Service
public class PharmacyService implements IPharmacyService {
	@Autowired
	@Qualifier("IPharmacyDAO")
	IPharmacyDAO dao;

	@Override
	public ArrayList<PharmacyVO> listAllPharm() {
		// TODO Auto-generated method stub
		return null;
	}

}
