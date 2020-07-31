package com.store.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.store.dto.ProductDto;
import com.store.service.ProductService;

@Controller
public class ManagerController {
	@Autowired
	ProductService productService;
	
	
	@RequestMapping("/manager")
	public String cusCenter(Model model) {
		return "customerCenter/main"; 
	}
	@RequestMapping("/adminProductList")
	public String mgProductList(Model model) {
		List<ProductDto> pDto = productService.listProduct(-1);
		model.addAttribute("pd_list", pDto);
		
		return "manager/adminProductList";
	}
	@RequestMapping("/mgProduct")
	public String mgProduct() {
		return "manager/product";
	}
	@RequestMapping("/regProductStock")
	public String regProductStock(Model model) {		
		
		return "admin/regProductStock";
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
