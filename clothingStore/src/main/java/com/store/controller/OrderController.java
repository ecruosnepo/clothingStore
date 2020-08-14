package com.store.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.store.dto.AddressDto;
import com.store.dto.CartDto;
import com.store.dto.CartListDto;
import com.store.dto.OrderDetailDto;
import com.store.dto.OrderDto;
import com.store.dto.UserDto;
import com.store.service.AddressService;
import com.store.service.CartService;
import com.store.service.OrderService;
import com.store.service.StockService;
import com.store.service.UserService;

@Controller
public class OrderController {
	
	@Autowired
	UserService userService;
	@Autowired
	AddressService addressService;
	@Autowired
	CartService cartService;
	@Autowired
	OrderService orderService;
	@Autowired
	StockService stockService;
	
	@RequestMapping("/checkoutForm")
	public String checkoutForm(HttpSession session, HttpServletRequest req, Model model) throws Exception {
		String email = (String)session.getAttribute("email");
		UserDto uDto = userService.sGetUserInfo(email);		
		List<AddressDto> address_list = addressService.sGetAddressList(email);
		List<CartListDto> cDto = cartService.cartListView(email);
		
		model.addAttribute("cart_list", cDto);		
		model.addAttribute("user", uDto);
		model.addAttribute("address_list",address_list);
		
		return "/checkoutForm";
	}
	
	@PostMapping("/checkout")
	@ResponseBody
	public int checkout(Model model,OrderDetailDto odDto, OrderDto oDto, @RequestParam("imp_uid")String imp_uid) throws Exception {
		String email = oDto.getUser_email();
		List<CartDto> cDto = cartService.cartInfo(email);
		
		oDto.setOrder_id(imp_uid);		
		
		System.out.println(oDto.toString());
		
		orderService.addOrder(oDto);
		System.out.println("order추가 완료");
		System.out.println("orderDetail추가 시작");	
		
		orderService.addOrderDetail(imp_uid,email);
		
		for(CartDto list:cDto) {
			stockService.orderUpdateStock(list.getPd_id(), list.getPd_size(), list.getPd_quantity(),"sub");
		}
		
		cartService.deleteOrderCart(email);
		
		int result = 1; 
		
		return result;
	}
	
	@RequestMapping("/getDeliveryAddress")
	public @ResponseBody AddressDto getDeliveryAddress(HttpSession session, @RequestParam("address_index")int address_index, Model model) {
		System.out.println("배송 주소 받기");
		String email = (String)session.getAttribute("email");
		AddressDto aDto = addressService.sGetAddressDto(email, address_index);
		
		return aDto;
	}
	
	@RequestMapping("/compliteCheckout")
	public String compliteCheckout(@RequestParam("checkout_complite")int complite) {
		
		
		return "/compliteCheckout";
	}
}
