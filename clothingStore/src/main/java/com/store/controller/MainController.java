package com.store.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
	/*
	 * @Autowired ProductService productSerivce;
	 * 
	 * @GetMapping("/regProduct") public String regProduct(HttpServletRequest req,
	 * ProductDto pDto) throws Exception { productService.
	 * 
	 * String referer = req.getHeader("Referer");
	 * 
	 * return "redirect:"+referer; }
	 */
	
	@GetMapping("/checkout")
	public String checkout() {
		
		return "/checkout";
	}
	
}
