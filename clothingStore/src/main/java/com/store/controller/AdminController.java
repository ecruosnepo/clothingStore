package com.store.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.store.dao.CategoryDao;
import com.store.dto.CategoryDto;
import com.store.service.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	AdminService service;
	@Autowired
	CategoryDao categoryDao;
	
	@RequestMapping("/admin")
	public String cusCenter(Model model) {
		return "redirect:adminProduct"; 
	}
	
	@RequestMapping("/adminProduct")
	public String adminProduct(Model model) {
		System.out.println("상품 등록 폼");		
		Gson gson = new Gson();
		List<CategoryDto> allcat = categoryDao.getAllCatDao();
		model.addAttribute("allcat", gson.toJson(allcat));
		
		return "admin/addProduct";
	}
	
	@GetMapping("/updateProductForm")
	public String updateProductForm(Model model) {
		System.out.println("상품 수정 폼");
		
		
		return "/admin/updateProduct";
	}
	
	@RequestMapping("/adminQna")
	public String adminQna(@RequestParam(defaultValue="1") int page, Model model) {
		
		Map<String, Object> map=service.adminQnaService(page);
		model.addAttribute("list", map.get("dto"));
		model.addAttribute("page", map.get("page"));
	
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
	public String adminQnaSearch(@RequestParam(defaultValue="1") int page, @RequestParam(name="search",defaultValue="")String search,
			@RequestParam(name="boardCat",defaultValue="")String boardCat, Model model) {
		
		Map<String, Object> map = service.adminQnaSearchService(page, search, boardCat);
		model.addAttribute("boardDto", map.get("boardDto"));
		model.addAttribute("page", map.get("page"));
		model.addAttribute("search", search);
		model.addAttribute("boardCat", boardCat);
		model.addAttribute("boardCatList", map.get("boardCatList"));
		
		return "admin/qna_search";
	}
	
	@RequestMapping("/adminMember")
	public String adminMember(@RequestParam(defaultValue="1") int page, Model model) {
		Map<String, Object> map=service.adminMemberListService(page);
		model.addAttribute("list", map.get("dto"));
		model.addAttribute("page", map.get("page"));
		
		return "admin/member";
	}
	
	@CrossOrigin
	@RequestMapping(value="/adminMemberDel", method=RequestMethod.POST)
	public @ResponseBody int adminMemDel(@RequestParam(value = "chbox[]") List<String> chArr) throws Exception {
		
		System.out.println(chArr);
		int result=service.adminMemDelService(chArr);
		
		return result;
	}
	
	@RequestMapping(value="/adminMemSearch", method=RequestMethod.GET)
	public String adminMemSearch(@RequestParam(defaultValue="1") int page, @RequestParam(name="search",defaultValue="")String search,
			Model model) {
		
		Map<String, Object> map=service.adminMemSearch(page,search);
		model.addAttribute("list", map.get("searchList"));
		model.addAttribute("page", map.get("page"));
		model.addAttribute("search", search);
		
		return "admin/member_search";
	}
	@RequestMapping("/adminProductList")
	public String adminProductList(Model model) {
		return "admin/adminProductList"; 
	}
}
