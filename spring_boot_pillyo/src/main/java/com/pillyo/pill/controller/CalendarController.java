package com.pillyo.pill.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CalendarController {
	@RequestMapping("/calendarView")
	public String calendarView() {
		return "/dose/calendarView";
	}
}
