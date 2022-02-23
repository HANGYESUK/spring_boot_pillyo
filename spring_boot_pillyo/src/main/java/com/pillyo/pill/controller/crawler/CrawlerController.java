package com.pillyo.pill.controller.crawler;

import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CrawlerController {
	@RequestMapping("/crawlerView")
	public String crawerView() {
		return "crawler/crawlerView";
	}

	/*
	 * @RequestMapping(value = "crawling", method = RequestMethod.GET) public String
	 * startCrawl(Model model) throws IOException {
	 * 
	 * String URL_1 = "http://www.paadu.or.kr/sub/pharm01.asp"; String URL_2 =
	 * "http://www.paadu.or.kr/sub/pharm02.asp?menu_current=18"; String URL_3 =
	 * "http://www.paadu.or.kr/sub/pharm03.asp?menu_current=19";
	 * 
	 * 
	 * Document doc_1 = Jsoup.connect(URL_1).get(); Document doc_2 =
	 * Jsoup.connect(URL_2).get(); Document doc_3 = Jsoup.connect(URL_3).get();
	 * 
	 * 1 Elements aboutDrug = doc_1.select("#pharm01-01 .mb20 .red+p"); // 약이란?
	 * Elements OTCETC = doc_1.select("#pharm01-02 .mb20 li"); // 일반의약품 (Over The
	 * Counter Drug:OTC)과 전문의약품 (Ethical The Counter Drug:ETC) Elements STC =
	 * doc_1.select("#pharm01-02 .mb20 .red+p"); // 안전 상비 의약품 (safe over-the-counter
	 * medicines) Elements typeOfDrug = doc_1.select("#pharm01-03 .mb20"); // 일반약의
	 * 종류
	 * 
	 * 2 Elements childTake = doc_2.select("#pharm02-01 .mb20"); // 어린이 약복용 (약물을 복용
	 * 전 반드시 알아야 하는 내용) Elements drugExpiration = doc_2.select("#pharm02-02 .mb20");
	 * // 의약품 유효기간
	 * 
	 * 3 Elements gargle = doc_3.select("#pharm01-01 ul"); // 가글제 Elements enema =
	 * doc_3.select("#pharm01-02 ul"); // 관장액 Elements drySyrup =
	 * doc_3.select("#pharm01-03 ul"); // 건조시럽제 Elements orodispersibleTablets =
	 * doc_3.select("#pharm01-04 ul"); // 구강붕해정 Elements buccalTablet =
	 * doc_3.select("#pharm01-05 ul"); // 박칼정 Elements effervescentTablet =
	 * doc_3.select("#pharm01-06 ul"); // 발포정 Elements nasalSpray =
	 * doc_3.select("#pharm01-07 ul"); // 비강분무제 Elements powder =
	 * doc_3.select("#pharm01-08 ul"); // 산제 Elements sublingualTablet =
	 * doc_3.select("#pharm01-09 ul"); // 설하정 Elements liquid =
	 * doc_3.select("#pharm01-10 ul"); // 액제 Elements OCL =
	 * doc_3.select("#pharm01-11 ul"); // 연고(Ointment), 크림, 로션 Elements nasalDrops =
	 * doc_3.select("#pharm01-12 ul"); // 점비제 (코) Elements eyeDrops =
	 * doc_3.select("#pharm01-13 ul"); // 점안제 Elements earDrops =
	 * doc_3.select("#pharm01-14 ul"); // 점이제 (귀) Elements TC =
	 * doc_3.select("#pharm01-15 ul"); // 정제(tablet), 캡슐제(capsules) Elements pessary
	 * = doc_3.select("#pharm01-16 ul"); // 질 좌제 (질정) Elements chewableTablet =
	 * doc_3.select("#pharm01-17 ul"); // 츄어블정 Elements patch =
	 * doc_3.select("#pharm01-18 ul"); // 패취제 Elements MDI =
	 * doc_3.select("#pharm01-19 ul"); // 흡입제 (에어로졸) : 정량식흡입제(MDI, Metered Dose
	 * Inhaler) Elements DPI = doc_3.select("#pharm01-20 ul"); // 흡입제 (터부할러) :
	 * 건조분말흡입제(DPI, Dry Powder Inhaler) Elements suppository =
	 * doc_3.select("#pharm01-21 ul"); // 항문 좌제 (좌약)
	 * 
	 * 1 model.addAttribute("aboutDrug", aboutDrug); model.addAttribute("OTCETC",
	 * OTCETC); model.addAttribute("STC", STC); model.addAttribute("typeOfDrug",
	 * typeOfDrug);
	 * 
	 * 2 model.addAttribute("childTake", childTake);
	 * model.addAttribute("drugExpiration", drugExpiration);
	 * 
	 * 3 model.addAttribute("gargle", gargle); model.addAttribute("enema", enema);
	 * model.addAttribute("drySyrup", drySyrup);
	 * model.addAttribute("orodispersibleTablets", orodispersibleTablets);
	 * model.addAttribute("buccalTablet", buccalTablet);
	 * model.addAttribute("effervescentTablet", effervescentTablet);
	 * model.addAttribute("nasalSpray", nasalSpray); model.addAttribute("powder",
	 * powder); model.addAttribute("sublingualTablet", sublingualTablet);
	 * model.addAttribute("liquid", liquid); model.addAttribute("OCL", OCL);
	 * model.addAttribute("nasalDrops", nasalDrops); model.addAttribute("eyeDrops",
	 * eyeDrops); model.addAttribute("earDrops", earDrops); model.addAttribute("TC",
	 * TC); model.addAttribute("pessary", pessary);
	 * model.addAttribute("chewableTablet", chewableTablet);
	 * model.addAttribute("patch", patch); model.addAttribute("MDI", MDI);
	 * model.addAttribute("DPI", DPI); model.addAttribute("suppository",
	 * suppository);
	 * 
	 * return "crawler/crawlerView"; }
	 */
}