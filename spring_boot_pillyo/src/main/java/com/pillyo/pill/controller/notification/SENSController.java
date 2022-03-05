package com.pillyo.pill.controller.notification;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pillyo.pill.service.notification.SENSService;

@Controller
public class SENSController {
	@Autowired
	SENSService service;
	
	// 메시지 전송
	@RequestMapping("/sendSMS")
	public void sendSMS(){
		service.sendSMS(null);
	}
}
