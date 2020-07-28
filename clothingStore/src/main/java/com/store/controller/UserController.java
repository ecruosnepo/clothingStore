package com.store.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.store.service.UserServiceImpl;

@Controller
public class UserController {
	
	private int result; 
	 
	@Autowired
	private UserServiceImpl service;

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
	
			result = service.sUserSignUp(email, password, check);	
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
			result = service.sUserEmail(email, password);
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
		service.sLogout(session);
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
		model.addAttribute("u", service.sUserList(email));
		return "/myPage/MyPageSet";
	}
	
	// 회원 상세정보 편집
	@RequestMapping(value="/updateForm", method = RequestMethod.GET)
	public String updateForm()throws Exception {
		return "/myPage/updateForm";
	}
	@PostMapping("/UpdateForm")
	public String updateForm(@RequestParam("user_name")String name, 
			                 @RequestParam("user_birth")String birth,
			                 @RequestParam("user_phone")String phone, 
			                 @RequestParam("user_gender")String gender) throws Exception {
		service.sUserUpdate(name, birth, phone, gender);
       
	   return "redirect:index";
	}
	
	// 회원 주소록
	@RequestMapping(value="/address", method = RequestMethod.GET)
	public String address() throws Exception {
	   return "/myPage/address";
	}
	
	// 회원 주소록 등록
	@RequestMapping(value="/newAddress", method = RequestMethod.GET)
	public String newAddress() throws Exception {
	   return "/myPage/newAddress";
	}
	
	// 회원 주소록 새 주소 추가
	@RequestMapping(value="/subAddress", method = RequestMethod.GET)
	public String subAddress() throws Exception {
	   return "/myPage/subAddress";
	}
	
	// 회원 비밀번호 찾기
	@RequestMapping(value="/getpass", method = RequestMethod.GET)
	public String getpass() throws Exception {
	   return "/myPage/getpass";
	}
}
