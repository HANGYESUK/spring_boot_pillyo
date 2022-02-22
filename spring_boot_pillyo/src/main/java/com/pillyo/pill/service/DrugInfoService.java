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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.pillyo.pill.dao.IDrugDAO;
import com.pillyo.pill.model.DrugInfoVO;

@Service
public class DrugInfoService {
	@Autowired
	@Qualifier("IDrugDAO")
	IDrugDAO dao;
	
		public void insertDrugList(String num) throws IOException{
			ArrayList<DrugInfoVO> drugList = new ArrayList<DrugInfoVO>(1000);  
			
			 // String result = "";
			
	        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1471000/DrbEasyDrugInfoService/getDrbEasyDrugList"); /*URL*/
	        //StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1471000/DrbEasyDrugInfoService"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=qRUMdevHSpJ8MlRLyOziaceeLS1ELKzPV8gv4Ij19n9Qgmpbmxx58EIioZdCiHKVNXlAChVztfC8YINW3Dtvug%3D%3D"); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode(num, "UTF-8")); /*페이지번호*/
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /*한 페이지 결과 수*/
	        //urlBuilder.append("&" + URLEncoder.encode("entpName","UTF-8") + "=" + URLEncoder.encode("한미약품(주)", "UTF-8")); /*업체명*/
	        //urlBuilder.append("&" + URLEncoder.encode("itemName","UTF-8") + "=" + URLEncoder.encode("한미아스피린장용정100밀리그램", "UTF-8")); /*제품명*/
	        //urlBuilder.append("&" + URLEncoder.encode("itemName","UTF-8") + "=" + URLEncoder.encode(drugName, "UTF-8")); /*제품명*/
	        //urlBuilder.append("&" + URLEncoder.encode("itemSeq","UTF-8") + "=" + URLEncoder.encode("200003092", "UTF-8")); /*품목기준코드*/
	        //urlBuilder.append("&" + URLEncoder.encode("efcyQesitm","UTF-8") + "=" + URLEncoder.encode("이 약은 심근경색, 뇌경색, 불안정형 협심증에서 혈전 생성 억제와...", "UTF-8")); /*이 약의 효능은 무엇입니까?*/
	        //urlBuilder.append("&" + URLEncoder.encode("useMethodQesitm","UTF-8") + "=" + URLEncoder.encode("성인은 1회 1정, 1일 1회 복용합니다..", "UTF-8")); /*이 약은 어떻게 사용합니까?*/
	        //urlBuilder.append("&" + URLEncoder.encode("atpnWarnQesitm","UTF-8") + "=" + URLEncoder.encode("매일 세잔 이상 정기적 음주자가 이 약 또는 다른 해열진통제를 복용할 때는...", "UTF-8")); /*이 약을 사용하기 전에 반드시 알아야 할 내용은 무엇입니까?*/
	        //urlBuilder.append("&" + URLEncoder.encode("atpnQesitm","UTF-8") + "=" + URLEncoder.encode("이 약 또는 다른 살리실산제제, 진통제, 소염제, 항류마티스제에 대한 과민증 환자...", "UTF-8")); /*이 약의 사용상 주의사항은 무엇입니까?*/
	        //urlBuilder.append("&" + URLEncoder.encode("intrcQesitm","UTF-8") + "=" + URLEncoder.encode("다른 비스테로이드성 소염진통제 및 살리실산 제제, 일주일 동안 메토트렉세이트 15밀리그람...", "UTF-8")); /*이 약을 사용하는 동안 주의해야 할 약 또는 음식은 무엇입니까?*/
	        //urlBuilder.append("&" + URLEncoder.encode("seQesitm","UTF-8") + "=" + URLEncoder.encode("쇽 증상(예: 호흡곤란, 전신조홍, 혈관부종, 두드러기), 천식발작, 과민증(홍반)...", "UTF-8")); /*이 약은 어떤 이상반응이 나타날 수 있습니까?*/
	        //urlBuilder.append("&" + URLEncoder.encode("depositMethodQesitm","UTF-8") + "=" + URLEncoder.encode("습기를 피해 실온에서 보관하십시오.", "UTF-8")); /*이 약은 어떻게 보관해야 합니까?*/
	        //urlBuilder.append("&" + URLEncoder.encode("openDe","UTF-8") + "=" + URLEncoder.encode("20200901", "UTF-8")); /*공개일자*/
	        //urlBuilder.append("&" + URLEncoder.encode("updateDe","UTF-8") + "=" + URLEncoder.encode("20200905", "UTF-8")); /*수정일자*/
	        urlBuilder.append("&" + URLEncoder.encode("type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*응답데이터 형식(xml/json) Default:xml*/
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
	        //result = sb.toString();
			
			 drugList = jsonToList(sb.toString());
			 /* System.out.println(drugVo.getItemName());
			 * System.out.println(drugVo.getEfcyQesitm());
			 * System.out.println(drugVo.getUseMethodQesitm());
			 * System.out.println(drugVo.getAtpnQesitm());
			 * System.out.println(drugVo.getIntrcQesitm());
			 * System.out.println(drugVo.getSeQesitm());
			 * System.out.println(drugVo.getDepositMethodQesitm());
			 * 
			 * return drugVo;
			 */
	        //return drugList;
			 dao.insertDrugList(drugList);
	    }
		
		
		   // API 서버로부터 JSON 정보를 파싱해서 DrugInfoVO의 항목을 추출해
			// LIST 에 담아 반환
		   public ArrayList<DrugInfoVO> jsonToList(String jsonResultStr){
			   ArrayList<DrugInfoVO> drugList = new ArrayList<DrugInfoVO>();
			   	
			   
				try {
					
					JSONParser jsonParser = new JSONParser();
					JSONObject jsonObj = (JSONObject) jsonParser.parse(jsonResultStr);
					JSONObject bodyObj = (JSONObject) jsonObj.get("body");			
					JSONArray itemsArray = (JSONArray) bodyObj.get("items");
					if(itemsArray != null) {
					//JSONArray의 각 요소에서 vo항목 추출
					for(int i=0; i<itemsArray.size(); i++) {
					DrugInfoVO vo = new DrugInfoVO();
					JSONObject obj0 = (JSONObject) itemsArray.get(i);
					
					String entpName;
					String itemName;
					String itemSeq;
					String efcyQesitm;
					String useMethodQesitm;
					String atpnQesitm;
					String intrcQesitm;
					String seQesitm;
					String depositMethodQesitm;
					String itemImage;
					
					entpName = (String) obj0.get("entpName");
					itemName = (String) obj0.get("itemName");
					itemSeq = (String) obj0.get("itemSeq");
					efcyQesitm = (String) obj0.get("efcyQesitm");
					useMethodQesitm = (String) obj0.get("useMethodQesitm");
					atpnQesitm = (String) obj0.get("atpnQesitm");
					intrcQesitm = (String) obj0.get("intrcQesitm");
					seQesitm = (String) obj0.get("seQesitm");
					depositMethodQesitm = (String) obj0.get("depositMethodQesitm");
					itemImage = (String) obj0.get("itemImage");
					
					vo.setEntpName(entpName);
					vo.setItemName(itemName);
					vo.setItemSeq(itemSeq);
					vo.setEfcyQesitm(efcyQesitm);
					vo.setUseMethodQesitm(useMethodQesitm);
					vo.setAtpnQesitm(atpnQesitm);
					vo.setIntrcQesitm(intrcQesitm);
					vo.setSeQesitm(seQesitm);
					vo.setDepositMethodQesitm(depositMethodQesitm);
					vo.setItemImage(itemImage);
					
					drugList.add(vo);
										
					}
					
				}
					else {
					DrugInfoVO vo = new DrugInfoVO();
					vo.setEntpName("없음");
					vo.setItemName("없음");
					vo.setItemSeq("없음");
					vo.setEfcyQesitm("없음");
					vo.setUseMethodQesitm("없음");
					vo.setAtpnQesitm("없음");
					vo.setIntrcQesitm("없음");
					vo.setSeQesitm("없음");
					vo.setDepositMethodQesitm("없음");
					vo.setItemImage("없음");
					
					}	
							
					
					
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				return drugList;
			}
}
