package com.pillyo.pill.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	@RequestMapping("/")
	public String index() {
		return "/index";
	}
	
	@RequestMapping("/join")
	public String join() {
		return "/join";
	}
}
