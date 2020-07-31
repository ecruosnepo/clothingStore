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

import com.store.dto.AddressDto;
import com.store.dto.UserDto;
import com.store.service.AddressServiceImpl;
import com.store.service.UserServiceImpl;

@Controller
public class UserController {
	
	private int result; 
	private int results;
	 
	@Autowired
	private UserServiceImpl userService;
	
	@Autowired
	private AddressServiceImpl addressService;

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
			result = userService.sUserSignUp(email, password, check);	
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
			result = userService.sUserEmail(email, password);
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
		userService.sLogout(session);
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
		model.addAttribute("user", userService.sUserList(email));
		return "/myPage/MyPageSet";
	}
	
	// 회원 상세정보 편집
	@RequestMapping(value="/updateForm", method = RequestMethod.GET)
	public String updateForm(Model model, HttpSession session)throws Exception {
		String email = (String) session.getAttribute("email");
		model.addAttribute("u", userService.sUserList(email));
		return "/myPage/updateForm";
	}

	@PostMapping("/userUpdate")
	public String updateForm(@RequestParam("user_name")String name,
						     @RequestParam("user_birth")String birth,
							 @RequestParam("user_phone")String phone,
							 @RequestParam("user_gender")String gender,
			                 HttpSession session, Model model) throws Exception {
		String emails = (String)session.getAttribute("email");
		if ( null != session.getAttribute("email")) {
			userService.sUserUpdate(name, birth, phone, gender, emails);
        	return "/myPage/updateFormAction";
		}
		return "forward:/myPage/MyPageSet";
	}
	
	// 회원 주소록
	@RequestMapping(value="/address", method = RequestMethod.GET)
	public String address(Model model, HttpSession session) throws Exception {
		String email = (String)session.getAttribute("email");
		model.addAttribute("address", userService.sUserList(email));
		return "/myPage/address";
	}
	
	/*
	 * // 청구 주소 수정
	 * 
	 * @PostMapping("/updateMainAddress") public void updateMainAddress(UserDto
	 * uDto) throws Exception{ userService.sUpdateMainAddress(uDto.getUser_email(),
	 * uDto.getMain_address1(), uDto.getMain_address2(), uDto.getMain_address3(),
	 * uDto.getMain_address4()); }
	 */
	
	// 주문페이지 유저 정보 수정
	@PostMapping("/updateOrderUserInfo")
	public String updateOrderUserInfo(HttpServletRequest req, UserDto uDto) throws Exception{
		System.out.println(uDto.getMain_address1());
		System.out.println(uDto.getMain_address2());
		System.out.println(uDto.getMain_address3());
		System.out.println(uDto.getMain_address4());
		System.out.println(uDto.getUser_email());
		System.out.println(uDto.getUser_name());
		
		
		userService.sUpdateOderUserInfo(uDto.getUser_email(), uDto.getUser_name(), uDto.getMain_address1(), uDto.getMain_address2(), uDto.getMain_address3(), uDto.getMain_address4(), uDto.getUser_phone());
		
		String referer = req.getHeader("Referer");
	    return "redirect:"+ referer;
	}
	
	// 배송 주소 수정
	@PostMapping("/updateDeliveryAddress")
	public void updateDeliveryAddress(AddressDto aDto) throws Exception{
		addressService.sUpdateAddress(aDto.getEmail(), aDto.getR_name(), aDto.getAddress1(), aDto.getAddress2(), aDto.getAddress3(), aDto.getAddress4());
	}
	
	
	
	// 회원 주소록 등록
	@RequestMapping(value="/setMainAddress", method = RequestMethod.GET)
	public String newAddress(HttpSession session, Model model) throws Exception {
		String email = (String)session.getAttribute("email");
		if ( null != email ) {
			model.addAttribute("address", userService.sUserList(email));
		}
	   return "/myPage/setMainAddress";
	}
	@PostMapping("/setMainAddressForm") // update
	public String NewAddress(@RequestParam("main_address1")String main_address1,
			                 @RequestParam("main_address2")String main_address2,
			                 @RequestParam("main_address3")String main_address3,
			                 @RequestParam("main_address4")String main_address4,
			                 HttpSession session, Model model ) throws Exception{
		String emails = (String)session.getAttribute("email");
		if ( null != emails ) {
			userService.sUpdateMainAddress(main_address1, main_address2, main_address3, main_address4, emails);
			model.addAttribute("address", userService.sUserList(emails));
		    return "/myPage/setMainAddressAction";
		}
		 return "/myPage/setMainAddressAction";
	}
	
	// 계정 삭제
	@RequestMapping(value="/deleteInfoUser", method = RequestMethod.POST)
	public String deleteInfoUser(HttpSession session, Model model) throws Exception{
		String email = (String)session.getAttribute("email");
		if ( null != email ) {
			result = userService.sDeleteInfoUser(email);
			results = userService.sDeleteInfoAddress(email);
			model.addAttribute("result", result);
			model.addAttribute("results", results);
			userService.sLogout(session);
			return "/myPage/deleteInfoUserAction";
		}
		return "/myPage/deleteInfoUserAction";
	}
	
	
	
	// 회원 비밀번호 찾기
	@RequestMapping(value="/getpass", method = RequestMethod.GET)
	public String getpass() throws Exception {
	   return "/myPage/getpass";
	}
}
