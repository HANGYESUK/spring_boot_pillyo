package com.pillyo.pill.controller.notification;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class webNotificationController {
	// 알림 버튼 있는 페이지
	@RequestMapping("/webNotification")
	public String webNotification() {
		return "dose/webNotification";
	}
}
