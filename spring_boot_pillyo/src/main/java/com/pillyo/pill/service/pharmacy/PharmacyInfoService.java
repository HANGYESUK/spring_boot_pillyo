package com.pillyo.pill.service.pharmacy;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.pillyo.pill.dao.IPharmacyDAO;
import com.pillyo.pill.model.pharmacy.PharmacyVO;

@Service
public class PharmacyInfoService {
	@Autowired
	@Qualifier("IPharmacyDAO")
	IPharmacyDAO dao;
	
	public void insertPharmList(String num) throws IOException {
		ArrayList<PharmacyVO> pharmList = new ArrayList<PharmacyVO>(1000); 
		
        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B552657/ErmctInsttInfoInqireService/getParmacyFullDown"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=gGnbDk4EVmX3iCO1Bq5c8cg%2FdrYNV4uDMq07HmAdjTbWFRhLujRCfRUCAKlnmOs%2BThvvz2DJLgjoNY5F5Zs3YQ%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode(num, "UTF-8")); /*페이지번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /*한 페이지 결과 수*/
        URL url = new URL(urlBuilder.toString());

        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        //System.out.println(sb.toString());
        //result = sb.toString();
        
        //xmlToJson(sb.toString());
        
        
        // API로부터 XML 정보 파싱 -> PharmacyVO의 항목 추출 -> 리스트로 생성
        // pharmList = xmlToList(sb.toString());
        
        // DB에 insert
        // dao.insertPharmList(pharmList);
    }
	
	
	// xml to json ---------------------------------------------------------------------
//	public static void xmlToJson(String xmlResult) {
//		System.out.println(xmlResult); //printing Example of XML
//	}
	
	
	
	
	
	
	
	
	
	
	
	// ------------------------------------------------------------------
}
