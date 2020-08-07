package com.store.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OrderController {

	@RequestMapping("/MyPage")
	public String MyPage() {
		return "/user/MyPage";
	}
	
}
