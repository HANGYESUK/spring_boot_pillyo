package com.pillyo.pill.controller;

import java.io.IOException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pillyo.pill.model.DrugInfoVO;
import com.pillyo.pill.service.DrugService;
import com.pillyo.pill.service.DrugShapeService;

@Controller
public class DrugController {
	@Autowired
	DrugService service;
	@Autowired
	DrugShapeService shService;
	
	
	//약 검색 결과조회
	@RequestMapping("/drugSearch")
	public String drugSearch(@RequestParam("keyWord") String keyWord, Model model) {
		ArrayList<DrugInfoVO> drugList = service.drugSearch(keyWord);
		model.addAttribute("druglist", drugList);
		
		return "drug/drugSearchResultView";
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
	@RequestMapping("/selectKeywordSearch")
	public ArrayList<DrugInfoVO> selectKeywordSearch(@RequestParam ("keyWord") String keyWord, Model model) {
		ArrayList<DrugInfoVO> drugNameList = service.selectKeywordSearch(keyWord);
		model.addAttribute("drugList", drugNameList);
		return drugNameList;
	}
	
	/* 약모양 Controller */
	
	@RequestMapping("/drugShape")
	public void drugShape() throws IOException {
		shService.drugShape();
	}
	
	@RequestMapping("/drugShapeSearchForm")
	public String drugShapeSearchForm() {
		return "drug/drugShapeSearchForm";
	}
	
}
