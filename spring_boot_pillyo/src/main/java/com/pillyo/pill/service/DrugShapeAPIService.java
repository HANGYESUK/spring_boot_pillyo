package com.pillyo.pill.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Service;

import com.pillyo.pill.model.DrugShapeAPIVO;

@Service
public class DrugShapeAPIService {
	
	 // public ArrayList<DrugShapeVO> drugShape(HashMap<String, Object>param) throws IOException {
		  public ArrayList<DrugShapeAPIVO> drugShape(String itemName) throws IOException {
		  ArrayList<DrugShapeAPIVO> shapeList = new ArrayList<DrugShapeAPIVO>();
		 // HashMap<String, Object> map = new HashMap<String, Object>(); 
		  //	String itemName = (String)map.get(itemName);
	        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1471000/MdcinGrnIdntfcInfoService01/getMdcinGrnIdntfcInfoList01"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=qRUMdevHSpJ8MlRLyOziaceeLS1ELKzPV8gv4Ij19n9Qgmpbmxx58EIioZdCiHKVNXlAChVztfC8YINW3Dtvug%3D%3D"); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("item_name","UTF-8") + "=" + URLEncoder.encode(itemName, "UTF-8")); /*품목명*/
	        //urlBuilder.append("&" + URLEncoder.encode("entp_name","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*업체명*/
	        //urlBuilder.append("&" + URLEncoder.encode("item_seq","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*품목일련번호*/
	        //urlBuilder.append("&" + URLEncoder.encode("img_regist_ts","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*약학정보원 이미지 생성일*/
	        //urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
	        //urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("3", "UTF-8")); /*한 페이지 결과 수*/
	        //urlBuilder.append("&" + URLEncoder.encode("edi_code","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*보험코드*/
	        urlBuilder.append("&" + URLEncoder.encode("type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*응답데이터 형식(xml/json) default : xml*/
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
	        System.out.println(sb.toString());
	        shapeList = jsonToList(sb.toString());
	      
	        return shapeList;
	        
	    }
	  
	  public ArrayList<DrugShapeAPIVO> jsonToList(String jsonResultStr){
		 ArrayList<DrugShapeAPIVO> shapeList = new ArrayList<DrugShapeAPIVO>();
		  
		  JSONParser jsonParser = new JSONParser();
			try {
				JSONObject jsonObj = (JSONObject) jsonParser.parse(jsonResultStr);
				JSONObject bodyObj = (JSONObject) jsonObj.get("body");			
				JSONArray itemsArray = (JSONArray) bodyObj.get("items");
				if(itemsArray != null) {
					//JSONArray의 각 요소에서 vo항목 추출
					for(int i=0; i<itemsArray.size(); i++) {
					DrugShapeAPIVO vo = new DrugShapeAPIVO();
					JSONObject obj0 = (JSONObject) itemsArray.get(i);
					
					String itemName;
					String entpName;
					String itemSeq;	// 품목번호
					String chart;		// 성상
					String itemImage;
					String print_front;	// 표기
					String drug_shape;	// 모양
					String color_class;	// 색상
					String class_name;	// 해열,진통,소염제..
					String form_code_name;	// 제형
					
					itemName=(String)obj0.get("ITEM_NAME");
					entpName=(String)obj0.get("ENTP_NAME");
					itemSeq=(String)obj0.get("ITEM_SEQ");	// 품목번호
					chart=(String)obj0.get("CHART");		// 성상
					itemImage=(String)obj0.get("ITEM_IMAGE");
					print_front=(String)obj0.get("PRINT_FRONT");	// 표기
					drug_shape=(String)obj0.get("DRUG_SHAPE");	// 모양
					color_class=(String)obj0.get("COLOR_CLASS1");	// 색상
					class_name=(String)obj0.get("CLASS_NAME");	// 해열,진통,소염제..
					form_code_name=(String)obj0.get("FORM_CODE_NAME");	// 제형
					
					vo.setItemName(itemName);
					vo.setEntpName(entpName);
					vo.setItemSeq(itemSeq);
					vo.setChart(chart);
					vo.setItemImage(itemImage);
					vo.setPrint_front(print_front);
					vo.setDrug_shape(drug_shape);
					vo.setColor_class(color_class);
					vo.setClass_name(class_name);
					vo.setForm_code_name(form_code_name);
					
					shapeList.add(vo);
					}
				}
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	
		  
		  return shapeList;
	  }
}
