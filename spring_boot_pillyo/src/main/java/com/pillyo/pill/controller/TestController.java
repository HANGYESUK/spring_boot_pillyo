package com.pillyo.pill.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {
	// 대쉬보드 레이아웃 테스트
	@RequestMapping("/layoutTest")
	public String layoutTest() {
		return "layout/layoutTest";
	}
}
