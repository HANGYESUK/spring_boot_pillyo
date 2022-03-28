package com.pillyo.pill.controller.notification;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pillyo.pill.model.UserVO;
import com.pillyo.pill.model.notification.SENSVO;
import com.pillyo.pill.model.notification.notificationVO;
import com.pillyo.pill.service.UserService;
import com.pillyo.pill.service.notification.NotificationService;
import com.pillyo.pill.service.notification.SENSService;

@Controller
public class NotificationController {
	@Autowired
	SENSService SENSservice;
	
	@Autowired
	UserService userService;
	
	@Autowired
	NotificationService notiService;
	
	// 메시지 전송
	@ResponseBody
	@RequestMapping("/sendSMS")
	public void sendSMS(SENSVO vo) throws Exception{
	//public String sendSMS(@RequestParam HashMap<String, Object> map){
		
//		System.out.println("aaa");
//		System.out.println(vo.getNotiHp());
//		System.out.println(vo.getNotiUserName());
//		System.out.println(vo.getReserveTime());
//		System.out.println(vo.getNotiTime());
		String hp = vo.getNotiHp();
		String name = vo.getNotiUserName();
		String rTime = vo.getReserveTime() + " " + vo.getNotiTime();
		
		HashMap <String, String> memInfo = new HashMap<String, String>();
		memInfo.put("hp", hp);
		memInfo.put("name", name);
		memInfo.put("rTime", rTime);
		SENSService.sendSMS(memInfo);
		
//		for (int i=0; i<doseNotiArr.size(); i++) {
//			String doseFamName = doseNotiArr.get(i);
//			String notiMemHp = doseNotiArr.get(i);
//			String reserveTime = doseNotiArr.get(i);
//			HashMap <String, String> memInfo = new HashMap<String, String>();
//			memInfo.put("doseFamName", doseFamName);
//			memInfo.put("notiMemHp", notiMemHp);
//			memInfo.put("reserveTime", reserveTime);	
//			SENSService.sendSMS(memInfo);
//		}
		
		
		// ----------------------------------------------------------
//		ArrayList<UserVO> notiRcvMemList = notiService.notiRcvMember();
//		String[] notiMemHpArr = new String[50];
//		System.out.println(notiRcvMemList);
//
//		String notiMemHp = "";
//		
//		for (int i=0; i<notiRcvMemList.size(); i++) {
//			UserVO notiMem = notiRcvMemList.get(i);
//			
//			String notiMemHpBefore = notiMem.getUserHp();
//			String hpArr[] = notiMemHpBefore.split("-");
//			
//			for (int j=0; j<hpArr.length; j++) {
//				notiMemHp+=hpArr[j];
//			}
//			System.out.println(notiMemHp);
//
//			notiMemHpArr[i] = notiMemHp;
//			SENSservice.sendSMS_getup(notiMemHp);
//			SENSservice.sendSMS_morning(notiMemHp);
//			SENSservice.sendSMS_lunch(notiMemHp);
//			SENSservice.sendSMS_dinner(notiMemHp);
//			SENSservice.sendSMS_beforeBed(notiMemHp);
//		}
		
		//-------------------
//		notiMemHp = "01088477451";
//		String reserveTime = "2022-03-27 22:07";
//		HashMap <String, String> memInfo = new HashMap<String, String>();
//		memInfo.put("notiMemHp", notiMemHp);
//		memInfo.put("reserveTime", reserveTime);
//		
//		SENSService.sendSMS_getup(memInfo);
//		return result;
	}
	
	
	
	// --------------------------------------------------------------------------
	// 복용 알림 테스트 페이지
	@RequestMapping("/doseNotificationView")
	public String doseNotificationView(HttpSession session, Model model){
		String userId = (String)session.getAttribute("sid");
		notificationVO vo = notiService.detailNoti(userId);
		model.addAttribute("notification", vo);
		return "dose/doseNotificationView";
	}
	
	// 알림 정보 수정
	@RequestMapping("/doseNotiUpdate")
	public String doseNotiUpdate(HttpSession session, Model model, notificationVO notificationVO){
		String userId = (String)session.getAttribute("sid");
		UserVO vo = userService.detailUserView(userId);
		model.addAttribute("user", vo);
		notiService.updateNoti(notificationVO);
		return "redirect:/calendarView";
	}
}
