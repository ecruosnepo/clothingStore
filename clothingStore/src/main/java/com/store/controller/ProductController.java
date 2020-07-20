package com.store.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.store.service.ProductService;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@GetMapping("/test")
	public String test(){
		System.out.println("테스트 맵핑");
		return "products/productList";
	}
	
	@GetMapping("/{genderId}/{catId}")
    public String productListView(@PathVariable("genderId") int gender, @PathVariable("catId") int cat) throws Exception {
        if(gender==1) {
        	
        	return "female/" + cat;
        }else if(gender==2) {
        	
        	return "male/" + cat;
        }else {
        	
        	return "kid/" + cat;
        }
   }
}
