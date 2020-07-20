package com.store.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	@GetMapping("/product/list")
	public String productsList() throws Exception {
		return "products/productsList";
	}
	
	@RequestMapping("/productPage")
	public String productView() {
		return "products/productPage";
	}
	
}
