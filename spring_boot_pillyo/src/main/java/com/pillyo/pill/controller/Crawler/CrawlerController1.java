package com.pillyo.pill.controller.Crawler;

import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CrawlerController1 {
	@RequestMapping("/crawlerView1")
	public String crawerView1() {
		return "crawler/crawlerView1";
	}
	
	@RequestMapping(value = "crawling1", method = RequestMethod.GET)
	public String startCrawl(Model model) throws IOException {

		String URL = "http://www.paadu.or.kr/sub/pharm01.asp";
		
		Document doc = Jsoup.connect(URL).get();
		
		Elements aboutDrug = doc.select("#pharm01-01 .mb20 .red+p"); // 약이란?
		Elements OTCETC = doc.select("#pharm01-02 .mb20 li"); // 일반의약품 (Over The Counter Drug:OTC)과 전문의약품 (Ethical The Counter Drug:ETC)
		Elements STC = doc.select("#pharm01-02 .mb20 .red+p"); // 안전 상비 의약품 (safe over-the-counter medicines)
		Elements typeOfDrug = doc.select("#pharm01-03 .mb20"); // 일반약의 종류
		
		model.addAttribute("aboutDrug", aboutDrug);
		model.addAttribute("OTCETC", OTCETC);
		model.addAttribute("STC", STC);
		model.addAttribute("typeOfDrug", typeOfDrug);

		// System.out.println(aboutDrug); // 선택한 본문 HTML 요소 그 자체 (태그 포함)

		return "crawler/crawlerView1";
	}
}
