package com.store.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import com.store.service.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	AdminService service;
	
	@RequestMapping("/admin")
	public String cusCenter(Model model) {
		return "redirect:adminProduct"; 
	}
	@RequestMapping("/adminProduct")
	public String adminProduct() {
		return "admin/product";
	}
	@RequestMapping("/adminQna")
	public String adminQna(@RequestParam(defaultValue="1") int page, Model model) {
		
		Map<String, Object> map=service.adminQnaService(page);
		model.addAttribute("list", map.get("dto"));
		model.addAttribute("startIdx", map.get("startIdx"));
		model.addAttribute("endIdx", map.get("endIdx"));
		model.addAttribute("thisPage", page);
		model.addAttribute("totalPage",map.get("totalPage"));
		model.addAttribute("startPageIdx", map.get("startPageIdx"));
		model.addAttribute("endPageIdx", map.get("endPageIdx"));
	
		return "admin/qna_main";
	}
	
	@RequestMapping("/adminQnaView")
	public String adminQnaView(@RequestParam("id")int id, Model model) {
		model.addAttribute("dto", service.adminQnaViewService(id));
		return "admin/qna_view";
	}
	
	@RequestMapping("/adminQnaUpdate")
	public String adminQnaUpdate(@RequestParam("id")int id, @RequestParam("answer")String answer, Model model) {
		if(answer.trim().length()==0 || answer==null) {
			model.addAttribute("result", 1);
			return "admin/qna_view";
		}
		service.adminQnaUpdateService(id, answer);
		model.addAttribute("result", 10);
		return "admin/qna_view";
	}
	
	@RequestMapping("/adminQnaDelete")
	public String adminQnaDelete(@RequestParam("id")int id) {
		service.adminQnaDeleteService(id);
		return "redirect:adminQna";
	}
	@RequestMapping("/adminQnaSearch")
	public String adminQnaSearch(@RequestParam(defaultValue="1") int page, @RequestParam("search")String search,
			Model model) {
		
		Map<String, Object> map=service.adminQnaSearchService(page, search);
		model.addAttribute("list", map.get("dto"));
		model.addAttribute("startIdx", map.get("startIdx"));
		model.addAttribute("endIdx", map.get("endIdx"));
		model.addAttribute("thisPage", page);
		model.addAttribute("totalPage",map.get("totalPage"));
		model.addAttribute("startPageIdx", map.get("startPageIdx"));
		model.addAttribute("endPageIdx", map.get("endPageIdx"));
		
		return "admin/qna_search";
	}
	
	@RequestMapping("/adminMember")
	public String adminMember() {
		return "admin/member";
	}
	
}
