package com.store.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.store.service.ProductService;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
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
}
