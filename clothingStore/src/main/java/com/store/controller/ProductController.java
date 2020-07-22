package com.store.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.store.dao.CategoryDao;
import com.store.dto.CategoryDto;
import com.store.dto.ProductDto;
import com.store.service.ProductService;

@Controller
public class ProductController {
	@Autowired
	private ProductService productService;
	@Autowired
	private CategoryDao categoryDao;
	
	@GetMapping("/test")
	public String test() {
		return "products/productList";
	}
	
	@GetMapping("/productpage/{pdId}")
	public String productView(@PathVariable("pdId") int pd_id, HttpServletRequest req, Model model){
		System.out.println("상세 페이지");
		model.addAttribute("pd_dto", productService.viewProduct(pd_id));
		return "products/productPage/"+pd_id;
	}
	
	@GetMapping("/{genderId}/{catRefId}/{catId}")
    public String productListView(@PathVariable("genderId") int gender, @PathVariable("catId") int cat, @PathVariable("catRefId") int catRef, Model model) throws Exception {
        		
		if(gender==1) {
        	model.addAttribute("pd_list", productService.listProduct(cat));
        	return "products/productList";
        }else if(gender==2) {
        	model.addAttribute("pd_list", productService.listProduct(cat));
        	return "products/productList";
        }else {
        	model.addAttribute("pd_list", productService.listProduct(cat));
        	return "products/productList";
        }
	}
		
	@RequestMapping("/regProductForm")
	public String regProductForm(Model model) {
		System.out.println("상품 등록 폼");		
		Gson gson = new Gson();
		List<CategoryDto> allcat = categoryDao.getAllCatDao();
		model.addAttribute("allcat", gson.toJson(allcat));
		
		return "admin/regProduct";
	}
	
	@PostMapping("/regProduct")
	public String regProduct(HttpServletRequest req, ProductDto pDto) {
		System.out.println("상품 등록");		
		productService.regProduct(pDto);
		String referer = req.getHeader("Referer");
		return "redirect:"+referer;
	}
}
