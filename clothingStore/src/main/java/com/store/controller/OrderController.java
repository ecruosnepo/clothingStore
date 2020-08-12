package com.store.controller;



import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.store.dto.MyPageDto;
import com.store.dto.OrderDto;
import com.store.service.OrderService;


@Controller
public class OrderController {

	@Autowired
	private OrderService orderService;


	
	// MyPage 페이지
	@RequestMapping(value="/myPage", method = RequestMethod.GET)
	public String MyPage(HttpSession session, HttpServletRequest request, Model model) throws Exception {
		String user_email = (String)session.getAttribute("email");

		
		List<OrderDto> oDto = orderService.selectOrderList(user_email);
		List<MyPageDto> mDto = orderService.selectPdMyPage(user_email);
	    int sum = 0;
		
		model.addAttribute("sum", sum);
	    model.addAttribute("oDto", oDto);
	    model.addAttribute("mDto", mDto);
		   	
	   	return "/user/myPage";
	}
	
}
