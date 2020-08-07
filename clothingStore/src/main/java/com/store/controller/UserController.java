package com.store.controller;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.store.dto.AddressDto;
import com.store.dto.UserDto;
import com.store.service.AddressServiceImpl;
import com.store.service.UserServiceImpl;

@Controller
public class UserController {
	
	private int result; 
	
	@Autowired
	public JavaMailSender javaMailSender;

	@Autowired
	private UserServiceImpl userService;
	
	@Autowired
	private AddressServiceImpl addressService;
	Random ran = new Random();
	public String getPass() {
		String psss = "";
		for (int i = 0; i < 8; i++) {
			psss += ran.nextInt(9)+1;	
    	}
		return psss;
	}

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
	@RequestMapping(value = "/SignUpForm", method = RequestMethod.POST)
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
	
	@RequestMapping(value="/loginForm", method = RequestMethod.POST)
	   public String UserLogin(@RequestParam("user_email") String email, @RequestParam("user_password") String password,
               Model model, HttpSession session) {
		
		try {            // 20200804 UserEmail = UserLogin
			result = userService.sUserLogin(email, password);
		} catch(Exception e) {
			e.printStackTrace();
			result = 0;
		}
		if ( 4 == result ) {
			model.addAttribute("result", result);
			session.setAttribute("manager", email);
			session.setMaxInactiveInterval(60*60);
		return "/user/loginAction";
		}
		// 세션생성
		model.addAttribute("result", result);
		session.setAttribute("email", email);
		session.setMaxInactiveInterval(60*60);
		return "/user/loginAction";
	}
	
	// 로그아웃
	@RequestMapping(value="/Logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		userService.sLogout(session);
		return "logout";
	}
	
	// MyPage 페이지
	@RequestMapping(value="/myPage", method = RequestMethod.GET)
	public String MyPage() throws Exception {
	   return "/myPage/myPage";
	}
	
	// 내설정
	@RequestMapping(value="/MyPageSet", method = RequestMethod.GET)
	public String MyPageSet(Model model, HttpSession session) throws Exception {
		String email = (String) session.getAttribute("email");
		result = addressService.sSelectAddress(email);
		String message = "<a href=\"insertSubAddress\"><button type=\"button\" class=\"btn btn-primary btn-lg\" style=\"color: white; background-color: brown;\">새 주소 추가</button></a>";
		if ( result < 3 ) {
			model.addAttribute("result", result);
			model.addAttribute("message", message);
			model.addAttribute("user", userService.sGetUserInfo(email));
			return "/myPage/MyPageSet";
		}
		model.addAttribute("user", userService.sGetUserInfo(email));
		return "/myPage/MyPageSet";	
	}
	
	// 회원 상세정보 편집
	@RequestMapping(value="/updateForm", method = RequestMethod.GET)
	public String updateForm(Model model, HttpSession session)throws Exception {
		String email = (String) session.getAttribute("email");
		model.addAttribute("u", userService.sGetUserInfo(email));
		return "/myPage/updateForm";
	}

	@RequestMapping(value="/userUpdate", method = RequestMethod.POST)
	public String updateForm(@RequestParam("user_name")String name,
						     @RequestParam("user_birth")String birth,
							 @RequestParam("user_phone")String phone,
							 @RequestParam("user_gender")String gender,
			                 HttpSession session, Model model) throws Exception {
		String emails = (String)session.getAttribute("email");
		if ( null != emails) {
			userService.sUserUpdate(name, birth, phone, gender, emails);
        	return "/myPage/updateFormAction";
		}
		return "forward:/myPage/MyPageSet";
	}
	
	// 회원 주소록
	@RequestMapping(value="/address", method = RequestMethod.GET)
	public String address(Model model, HttpSession session) throws Exception {
		String email = (String)session.getAttribute("email");
		model.addAttribute("user", userService.sGetUserInfo(email));
		model.addAttribute("address", addressService.sGetAddressList(email));
		return "/myPage/address";
	}
	
	 @PostMapping("/updateMainAddress") public void updateMainAddress(UserDto
	   uDto) throws Exception{ userService.sUpdateMainAddress(uDto.getUser_email(),
	   uDto.getMain_address1(), uDto.getMain_address2(), uDto.getMain_address3(),
	   uDto.getMain_address4()); }
	  
	// 주문페이지 유저 정보 수정
	@PostMapping("/updateOrderUserInfo")
	@ResponseBody
	public void updateOrderUserInfo(HttpServletRequest req, 
			@RequestParam("main_address1")String main_address1,
			@RequestParam("main_address2")String main_address2,
			@RequestParam("main_address3")String main_address3,
			@RequestParam("main_address4")String main_address4,
			@RequestParam("user_email")String user_email,
			@RequestParam("user_name")String user_name,
			@RequestParam("user_phone")String user_phone) throws Exception{
		System.out.println(main_address1);
		System.out.println(main_address2);
		System.out.println(main_address3);
		System.out.println(main_address4);
		System.out.println(user_email);
		System.out.println(user_name);
		System.out.println(user_phone);
		
		userService.sUpdateOderUserInfo(user_email, user_name, main_address1, main_address2, main_address3, main_address4, user_phone);
		/*
		 * String referer = req.getHeader("Referer"); return "redirect:"+ referer;
		 */
	}
	
	// 배송 주소 수정
	@PostMapping("/updateDeliveryAddress")
	public void updateDeliveryAddress(AddressDto aDto) throws Exception{
		addressService.sUpdateAddress(aDto.getEmail(), aDto.getR_name(), aDto.getAddress1(), aDto.getAddress2(), aDto.getAddress3(), aDto.getAddress4());
	}
	
	
	
	// 회원 주소록 등록
	@RequestMapping(value="/setMainAddress", method = RequestMethod.GET)
	public String setMainAddress(HttpSession session, Model model) throws Exception {
		String email = (String)session.getAttribute("email");
		if ( null != email ) {
			model.addAttribute("address", userService.sGetUserInfo(email));
		}
	   return "/myPage/setMainAddress";
	}
	@RequestMapping(value="/setMainAddressForm", method = RequestMethod.POST) // update
	public String setMainAddress(@RequestParam("main_address1")String main_address1,
			                     @RequestParam("main_address2")String main_address2,
			                     @RequestParam("main_address3")String main_address3,
			                     @RequestParam("main_address4")String main_address4,
			                      HttpSession session, Model model ) throws Exception{
		String emails = (String)session.getAttribute("email");
		if ( null != emails ) {
			userService.sUpdateMainAddress(main_address1, main_address2, main_address3, main_address4, emails);
			model.addAttribute("address", userService.sGetUserInfo(emails));
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
			addressService.sDeleteInfoAddress(email);
			model.addAttribute("result", result);
			userService.sLogout(session);
			return "/myPage/deleteInfoUserAction";
		}
		return "/myPage/deleteInfoUserAction";
	}
	
	// 회원 임시 비밀번호 전송
	@RequestMapping(value="/sendEmail", method = RequestMethod.GET)
	public String sendEmail() throws Exception {
	   return "sendEmail";
	}
	
	@Async
	@RequestMapping(value="/sendEmailForm", method = RequestMethod.POST)
	public String sendEmailForm(String email, HttpServletRequest request) throws Exception{
		SimpleMailMessage simpleMessage = new SimpleMailMessage();
		// simpleMessage.setFrom("보낸사람@naver.com"); // NAVER, DAUM, NATE일 경우 넣어줘야 함
		UserController s = new UserController();
		String pass = s.getPass();
		simpleMessage.setTo("rlaskagh776@gmail.com");
		simpleMessage.setSubject("옷가게 쇼핑몰 입니다. 임시 비밀번호 발송 했습니다.");
		simpleMessage.setText("임시 비밀번호 :" + pass);
		javaMailSender.send(simpleMessage); 
		String getEmail = request.getParameter("getEmail");
		userService.sUpdatePassword(pass, getEmail);
		return "index";	
  }
	
	// 비밀번호 변경
	@RequestMapping(value="/updatePassword", method = RequestMethod.GET)
	public String updatePassword() throws Exception{
		return "/myPage/updatePassword";
	}
	@RequestMapping(value="/updatePasswordForm", method = RequestMethod.POST)
	public String updatePasswordForm(@RequestParam("updatePassword1")String updatePassword1,
			                         HttpSession session) throws Exception {
		String email = (String)session.getAttribute("email");
		userService.sUpdatePassword(updatePassword1, email);
		return "login";
	}
	
}
