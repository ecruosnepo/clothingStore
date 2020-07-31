package com.store.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.store.service.AddressService;

@Controller
public class AddressController {
	    
	  @Autowired
	  private AddressService addressService;
	
	
	    // 회원 주소록 새 주소 추가
		@RequestMapping(value="/subAddress", method = RequestMethod.GET)
		public String subAddress() throws Exception {
		   return "/myPage/subAddress";
		}
		@PostMapping("/SubAddress") // insert
		public String SubAddress(@RequestParam("r_name")String r_name,
				                 @RequestParam("address1")String address1,
				                 @RequestParam("address2")String address2,
				                 @RequestParam("address3")String address3,
				                 @RequestParam("address4")String address4,
				                 String email, HttpSession session) throws Exception{
			String emails = (String)session.getAttribute("email");
			
			if ( null != emails ) {
				addressService.sInsertSubAddress(emails, r_name, address1, address2, address3, address4);
				return "/myPage/subAddressAction";
			}
			 return "/myPage/subAddressAction";
		}
}
