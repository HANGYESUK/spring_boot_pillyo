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
public class CrawlerController2 {
	@RequestMapping("/crawlerView2")
	public String crawerView2() {
		return "crawler/crawlerView2";
	}
	
	@RequestMapping(value = "crawling2", method = RequestMethod.GET)
	public String startCrawl(Model model) throws IOException {

		String URL = "http://www.paadu.or.kr/sub/pharm02.asp?menu_current=18";
		
		Document doc = Jsoup.connect(URL).get();
		
		Elements childTake = doc.select("#pharm02-01 .mb20"); // 어린이 약복용 (약물을 복용 전 반드시 알아야 하는 내용)
		Elements drugExpiration = doc.select("#pharm02-02 .mb20"); // 의약품 유효기간
		
		model.addAttribute("childTake", childTake);
		model.addAttribute("drugExpiration", drugExpiration);

		// System.out.println(childTake); // 선택한 본문 HTML 요소 그 자체 (태그 포함)

		return "crawler/crawlerView2";
	}
}
