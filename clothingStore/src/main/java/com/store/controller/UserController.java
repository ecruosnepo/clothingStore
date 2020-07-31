package com.store.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.store.service.AddressServiceImpl;
import com.store.service.UserServiceImpl;

@Controller
public class UserController {
	
	private int result; 
	 
	@Autowired
	private UserServiceImpl UserService;
	
	@Autowired
	private AddressServiceImpl AddressService;

	// 메인 페이지 초기 루트 지정	
	@RequestMapping(value="/index", method = RequestMethod.GET)
	public String root() throws Exception {
		return "index";
	}

	//  회원가입 
	@RequestMapping(value="/userSignUp", method = RequestMethod.GET)
	public String userSignUp() {
		return "/user/userSignUp";
	}	
	@PostMapping("/SignUpForm")
	public String SignUp( Model model,
			@RequestParam("user_email") String email,
			@RequestParam("user_password") String password, 
			@RequestParam(value = "check", required = false, defaultValue = "")String check ) throws Exception {
			result = UserService.sUserSignUp(email, password, check);	
			model.addAttribute("result", result);
			return "/user/userSignUpAction";	
	}
	
    // 로그인	
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String login() {
		return "login";
	}	
	@PostMapping("/LoginForm")
	public String UserLogin(@RequestParam("user_email") String email, 
			                @RequestParam("user_password") String password,
			                Model model, HttpSession session) {
		try {
			result = UserService.sUserEmail(email, password);
		} catch(Exception e) {
			e.printStackTrace();
			result = 0;
		}
		// 세션생성
		session.setAttribute("email", email);
		model.addAttribute("result", result);
		return "loginAction";
	}
	
	// 로그아웃
	@RequestMapping(value="/Logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		UserService.sLogout(session);
		return "logout";
	}
	
	// MyPage 페이지
	@RequestMapping(value="/MyPage", method = RequestMethod.GET)
	public String MyPage() throws Exception {
	   return "/myPage/MyPage";
	}
	
	
	// 내설정
	@RequestMapping(value="/MyPageSet", method = RequestMethod.GET)
	public String MyPageSet(Model model, HttpSession session) throws Exception {
		String email = (String) session.getAttribute("email");
		model.addAttribute("user", UserService.sUserList(email));
		return "/myPage/MyPageSet";
	}
	
	// 회원 상세정보 편집
	@RequestMapping(value="/updateForm", method = RequestMethod.GET)
	public String updateForm(Model model, HttpSession session)throws Exception {
		String email = (String) session.getAttribute("email");
		model.addAttribute("u", UserService.sUserList(email));
		return "/myPage/updateForm";
	}
	@PostMapping("/userUpdate")
	public String updateForm(HttpServletRequest request, HttpSession session, Model model) throws Exception {
		String name = request.getParameter("user_name");
		String birth = request.getParameter("user_birth");
		String phone = request.getParameter("user_phone");
		String gender = request.getParameter("user_gender");
		String emails = (String)session.getAttribute("email");
		if ( null != session.getAttribute("email")) {
			UserService.sUserUpdate(name, birth, phone, gender, emails);
        	return "/myPage/updateFormAction";
		}
		return "forward:/myPage/MyPageSet";
	}
	
	// 회원 주소록
	@RequestMapping(value="/address", method = RequestMethod.GET)
	public String address(Model model, HttpSession session) throws Exception {
		String email = (String)session.getAttribute("email");
		model.addAttribute("address", AddressService.sGetAddressList(email));
		return "/myPage/address";
	}
	
	// 회원 주소록 등록
	@RequestMapping(value="/newAddress", method = RequestMethod.GET)
	public String newAddress() throws Exception {
	   return "/myPage/newAddress";
	}
	@PostMapping("/NewAddress") // update
	public String NewAddress(@RequestParam("address1")String address1,
			                 @RequestParam("address2")String address2,
			                 @RequestParam("address3")String address3,
			                 @RequestParam("address4")String address4,
			                 HttpSession session ) throws Exception{
		String emails = (String)session.getAttribute("email");
		if ( null != emails ) {
			AddressService.sUpDateAddress(address1, address2, address3, address4, emails);
		    return "/myPage/newAddressAction";
		}
		 return "/myPage/newAddressAction";
	}
	
	
	// 회원 주소록 새 주소 추가
	@RequestMapping(value="/subAddress", method = RequestMethod.GET)
	public String subAddress() throws Exception {
	   return "/myPage/subAddress";
	}
	@PostMapping("/SubAddress") // insert
	public String SubAddress(@RequestParam("r_name")String name,
			                 @RequestParam("address1")String address1,
			                 @RequestParam("address2")String address2,
			                 @RequestParam("address3")String address3,
			                 @RequestParam("address4")String address4,
			                 String email, HttpSession session) throws Exception{
		String emails = (String)session.getAttribute("email");
		
		if ( null != emails ) {
			AddressService.sInsertAddress(emails, name, address1, address2, address3, address4);
			return "/myPage/SubAddressAction";
		}
		 return "/myPage/SubAddressAction";
	}
	
	// 회원 비밀번호 찾기
	@RequestMapping(value="/getpass", method = RequestMethod.GET)
	public String getpass() throws Exception {
	   return "/myPage/getpass";
	}
}
