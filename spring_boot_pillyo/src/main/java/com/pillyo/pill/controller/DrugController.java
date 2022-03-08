package com.pillyo.pill.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pillyo.pill.model.DrugInfoVO;
import com.pillyo.pill.model.DrugShapeAPIVO;
import com.pillyo.pill.model.DrugShapeVO;
import com.pillyo.pill.service.DrugService;
import com.pillyo.pill.service.DrugShapeAPIService;
import com.pillyo.pill.service.DrugShapeService;

@Controller
public class DrugController {
	@Autowired
	DrugService service;
	@Autowired
	DrugShapeAPIService shapeAPIService;
	@Autowired
	DrugShapeService shapeService;
	
	//약 검색 결과조회
	@RequestMapping("/drugSearch")
	public String drugSearch(@RequestParam("keyWord") String keyWord, Model model) {
		ArrayList<DrugInfoVO> drugList = service.drugSearch(keyWord);
		model.addAttribute("druglist", drugList);
		return "drug/drugSearchResultView";
		//return "drug/dashboard_drugSearchResultTest";
	}
	//약 정보 상세조회
	@RequestMapping("/drugDetailView/{drugInfoNo}")
	public String drugDetailView(@PathVariable String drugInfoNo, Model model) {
		DrugInfoVO vo = service.detailViewDrug(drugInfoNo);
		model.addAttribute("drug", vo);
		return "drug/drugDetailView";
	}
	
	@ResponseBody
	@RequestMapping("/drugAutoComplete")
	public ArrayList<DrugInfoVO> drugAutoComplete(@RequestParam("keyWord") String keyWord) {
		ArrayList<DrugInfoVO> drugList = service.drugSearch(keyWord);
			
		return drugList;
	}
	
	@ResponseBody
	@RequestMapping("/selectItemBySearchWord")
	public ArrayList<DrugInfoVO> selectItemBySearchWord(@RequestParam("keyWord") String keyWord) {
		
		if(keyWord == null || keyWord.equals("")) return null;
	
		ArrayList<DrugInfoVO> drugList = service.selectItemBySearchWord(keyWord);
		return drugList;
	}
	
	@ResponseBody
	@RequestMapping("/keywordSearch")
	public String keywordSearch(@RequestParam("keyword") String keyword) throws Exception{
	
		if(keyword == null || keyword.equals(""))
		   return null ;
	
		keyword = keyword.toUpperCase();
	    List<DrugInfoVO> keywordList =service.selectKeywordSearch(keyword);
	    
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("keyword", keywordList);
		 		
	    String jsonInfo = jsonObject.toString();
	   // System.out.println(jsonInfo);
	    return jsonInfo ;
	}
	
	/* 자동완성 테스트 */
	@RequestMapping("/searchBar")
	public String searchBar() {
		return "Main/searchBar";
	}
	
	
	/* 약모양 Controller */
	@RequestMapping("/drugShapeAPI")
	public String drugShapeAPI(@RequestParam("itemName") String itemName,
																		Model model) throws IOException {
		System.out.println("drug컨트롤러"+itemName);
		ArrayList<DrugShapeAPIVO> shapeList = shapeAPIService.drugShape(itemName);
		model.addAttribute("shapeList", shapeList);
		return "drug/drugShapeAPIResultView";
	}
	
	
	
	  @RequestMapping("/drugShape") 
	  public String drugShape(@RequestParam HashMap<String, Object> map , Model model) {
		  System.out.println(map);
		  //{keyWord=베아제, DRUG_SHAPE=타원형, FORM_CODE_NAME=경질} 이렇게 폼 결과 받아옴.
		  ArrayList<DrugShapeVO> shapeList = shapeService.drugShapeSearch(map);
		 model.addAttribute("shapeList", shapeList);
		  return "drug/drugShapeResultView";
	  }
	  
	 /* ArrayList<DrugShapeVO> shapeList = shapeService.drugShape(keyWord);
	 * model.addAttribute("shapeList", shapeList);
	 * System.out.println(shapeList.get(0)); return "drug/drugShapeResultView"; }
	 */
	
	@RequestMapping("/drugShapeSearchForm")
	public String drugShapeSearchForm(Model model) {
		 ArrayList<DrugShapeVO> shapeList = shapeService.listAllDrugShapeView();
		 model.addAttribute("shapeList", shapeList);
		return "drug/drugShapeSearchForm";
	}
	
}
