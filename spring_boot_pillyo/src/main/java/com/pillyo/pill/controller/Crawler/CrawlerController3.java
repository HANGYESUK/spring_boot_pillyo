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
public class CrawlerController3 {
	@RequestMapping("/crawlerView3")
	public String crawerView3() {
		return "crawler/crawlerView3";
	}
	
	@RequestMapping(value = "crawling3", method = RequestMethod.GET)
	public String startCrawl(Model model) throws IOException {

		String URL = "http://www.paadu.or.kr/sub/pharm03.asp?menu_current=19";
		
		Document doc = Jsoup.connect(URL).get();
		
		Elements gargle = doc.select("#pharm01-01 ul"); // 가글제
		Elements enema = doc.select("#pharm01-02 ul"); // 관장액
		Elements drySyrup = doc.select("#pharm01-03 ul"); // 건조시럽제
		Elements orodispersibleTablets = doc.select("#pharm01-04 ul"); // 구강붕해정
		Elements buccalTablet = doc.select("#pharm01-05 ul"); // 박칼정
		Elements effervescentTablet = doc.select("#pharm01-06 ul"); // 발포정
		Elements nasalSpray = doc.select("#pharm01-07 ul"); // 비강분무제
		
		Elements powder = doc.select("#pharm01-08 ul"); // 산제
		Elements sublingualTablet = doc.select("#pharm01-09 ul"); // 설하정
		Elements liquid = doc.select("#pharm01-10 ul"); // 액제
		Elements OCL = doc.select("#pharm01-11 ul"); // 연고(Ointment), 크림, 로션
		Elements nasalDrops = doc.select("#pharm01-12 ul"); // 점비제 (코)
		Elements eyeDrops = doc.select("#pharm01-13 ul"); // 점안제
		Elements earDrops = doc.select("#pharm01-14 ul"); // 점이제 (귀)
		
		Elements TC = doc.select("#pharm01-15 ul"); // 정제(tablet), 캡슐제(capsules)
		Elements pessary = doc.select("#pharm01-16 ul"); // 질 좌제 (질정)
		Elements chewableTablet = doc.select("#pharm01-17 ul"); // 츄어블정
		Elements patch = doc.select("#pharm01-18 ul"); // 패취제
		Elements MDI = doc.select("#pharm01-19 ul"); // 흡입제 (에어로졸) : 정량식흡입제(MDI, Metered Dose Inhaler)
		Elements DPI = doc.select("#pharm01-20 ul"); // 흡입제 (터부할러) : 건조분말흡입제(DPI, Dry Powder Inhaler)
		Elements suppository = doc.select("#pharm01-21 ul"); // 항문 좌제 (좌약)
		
		model.addAttribute("gargle", gargle);
		model.addAttribute("enema", enema);
		model.addAttribute("drySyrup", drySyrup);
		model.addAttribute("orodispersibleTablets", orodispersibleTablets);
		model.addAttribute("buccalTablet", buccalTablet);
		model.addAttribute("effervescentTablet", effervescentTablet);
		model.addAttribute("nasalSpray", nasalSpray);
		
		model.addAttribute("powder", powder);
		model.addAttribute("sublingualTablet", sublingualTablet);
		model.addAttribute("liquid", liquid);
		model.addAttribute("OCL", OCL);
		model.addAttribute("nasalDrops", nasalDrops);
		model.addAttribute("eyeDrops", eyeDrops);
		model.addAttribute("earDrops", earDrops);
		
		model.addAttribute("TC", TC);
		model.addAttribute("pessary", pessary);
		model.addAttribute("chewableTablet", chewableTablet);
		model.addAttribute("patch", patch);
		model.addAttribute("MDI", MDI);
		model.addAttribute("DPI", DPI);
		model.addAttribute("suppository", suppository);

		// System.out.println(gargle); // 선택한 본문 HTML 요소 그 자체 (태그 포함)

		return "crawler/crawlerView3";
	}
}
