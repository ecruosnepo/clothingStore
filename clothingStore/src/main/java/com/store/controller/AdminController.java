package com.store.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.store.service.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	AdminService service;
	
	@RequestMapping("/admin")
	public String cusCenter(Model model) {
		return "redirect:adminMember"; 
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
	public String adminQnaDelete(@RequestParam("id")int id, HttpServletRequest req) {
		String realPath=req.getServletContext().getRealPath("/resources/questionFile");
		service.adminQnaDeleteService(id,realPath);
		
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
	public @ResponseBody int adminMemDel(@RequestParam(value = "chbox[]") List<String> chArr, HttpServletRequest req) throws Exception {
		String realPath=req.getServletContext().getRealPath("/resources/questionFile");
		int result=service.adminMemDelService(chArr, realPath);
		
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
	@RequestMapping("/adminAddPd")
	public String adminAddPd(Model model) {
		//상품 추가 코드..
		return "admin/addProduct"; 
	}
	
	@RequestMapping("/adminPdList")
	public String adminProductList(@RequestParam(defaultValue="1") int page, Model model) {
		Map<String, Object> map=service.adminPdListService(page);
		model.addAttribute("list", map.get("pdList"));
		model.addAttribute("page", map.get("page"));
		return "admin/adminProductList";
	}
	
	@RequestMapping("/adminPdSearch")
	public String adminPdSearch(@RequestParam(defaultValue="1") int page, @RequestParam(name="search",defaultValue="")String search,
			Model model) {
		Map<String, Object> map=service.adminPdListService(page,search);
		model.addAttribute("list", map.get("pdList"));
		model.addAttribute("page", map.get("page"));
		model.addAttribute("search", search);
		
		return "admin/adminPdSearch"; 
	}
	
	@RequestMapping("adminPdDelete")
	public @ResponseBody int adminPdDelete(@RequestParam("pd_id[]")List<String> pd_id, @RequestParam("pd_size[]")List<String> pd_size,
			HttpServletRequest req) {
		String realPath=req.getServletContext().getRealPath("/resources/pdImages");
		System.out.println(pd_id);
		System.out.println(pd_size);
		
		int result=service.adminPdDeleteService(pd_id, pd_size, realPath);
		
		return result;
	}
	
	@RequestMapping("/adminPdUpdate")
	public String adminPdUpdate(Model model) {
		//상품 업데이트 코드...
		return "admin/updateProduct"; 
	}
	
	@RequestMapping("/adminOrderList")
	public String adOrderList(@RequestParam(defaultValue="1") int page, Model model) {
		Map<String, Object> map=service.adOrderListService(page);
		model.addAttribute("list", map.get("orderList"));
		model.addAttribute("page", map.get("page"));
		
		return "admin/orderList";
	}
	@RequestMapping("/adOrderView")
	public String adOrderView(@RequestParam("order_id")String order_id, Model model) {
		Map<String, Object> map=service.adOrderViewService(order_id);
		model.addAttribute("order", map.get("orderList"));
		model.addAttribute("detail", map.get("detailList"));
		
		return "admin/order_view"; 
	}
}
