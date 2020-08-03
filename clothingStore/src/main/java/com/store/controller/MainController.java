package com.store.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

import com.store.dto.AddressDto;
import com.store.dto.CartListDto;
import com.store.dto.UserDto;
import com.store.service.AddressService;
import com.store.service.CartService;
import com.store.service.UserService;

@Controller
public class MainController {
	
	@Autowired
	UserService userService;
	@Autowired
	AddressService addressService;
	@Autowired
	CartService cartService;
	
	@PostMapping("/checkout")
	public String checkout(HttpSession session, HttpServletRequest req, Model model) {
		String email = (String)session.getAttribute("email");
		UserDto uDto = userService.sGetUserInfo(email);		
		List<AddressDto> aDto = addressService.sGetAddressList(email);
		List<CartListDto> cDto = cartService.CartListView(email);
		
		model.addAttribute("cart_list", cDto);		
		model.addAttribute("user", uDto);
		model.addAttribute("address_list",aDto);
		
		return "/checkout";
	}
	
}
