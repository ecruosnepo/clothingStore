package com.store.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ManagerController {
	
	@RequestMapping("/manager")
	public String cusCenter(Model model) {
		return "customerCenter/main"; 
	}
	
	@RequestMapping("/mgProduct")
	public String mgproduct() {
		return "manager/product";
	}
	@RequestMapping("/mgQna")
	public String mgQna() {
		return "manager/forQuestion";
	}
	@RequestMapping("/mgMember")
	public String mgMember() {
		return "manager/member";
	}
	

}
