package com.pillyo.pill.controller.notification;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pillyo.pill.model.UserVO;
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
	@RequestMapping("/sendSMS")
	public void sendSMS(){
		ArrayList<UserVO> notiRcvMemList = notiService.notiRcvMember();
		String[] notiMemHpArr = new String[50];
		System.out.println(notiRcvMemList);

		String notiMemHp = "";
		
		for (int i=0; i<notiRcvMemList.size(); i++) {
			UserVO notiMem = notiRcvMemList.get(i);
			
			String notiMemHpBefore = notiMem.getUserHp();
			String hpArr[] = notiMemHpBefore.split("-");
			
			for (int j=0; j<hpArr.length; j++) {
				notiMemHp+=hpArr[j];
			}
			System.out.println(notiMemHp);

			notiMemHpArr[i] = notiMemHp;
//			SENSservice.sendSMS_getup(notiMemHp);
//			SENSservice.sendSMS_morning(notiMemHp);
//			SENSservice.sendSMS_lunch(notiMemHp);
//			SENSservice.sendSMS_dinner(notiMemHp);
//			SENSservice.sendSMS_beforeBed(notiMemHp);
		}
		notiMemHp = "01088477451";
		String reserveTime = "2022-03-27 22:07";
		HashMap <String, String> memInfo = new HashMap<String, String>();
		memInfo.put("notiMemHp", notiMemHp);
		memInfo.put("reserveTime", reserveTime);
		
		SENSService.sendSMS_getup(memInfo);
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
