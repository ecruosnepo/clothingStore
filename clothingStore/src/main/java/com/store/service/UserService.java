 package com.store.service;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.store.dao.AddressDao;
import com.store.dao.UserDao;
import com.store.dto.UserDto;

@Service
public class UserService implements UserServiceImpl {
	
	@Autowired
	private UserDao dao;
	
	// 이용자 리스트
	@Override
	public UserDto sUserList(String email) {
		return dao.UserList(email);
	}

	// 화원가입
	@Override
	public int sUserSignUp(String email, String password, String check) throws Exception {
	        // 이메일, 패스워드 null 체크
		    if ( "".equals(email)  && "".equals(password)) {
				return 0;
			}
			// 이메일 폼 null 체크 
			if(null == email || "".equals(email)) { 
				return 2; 
			}
			// 패스워드 폼 null 체크
			if(null == password || "".equals(password)) {
				return 3;
			}	
		    // 개인정보 동의 체크
		    if ( null == check || "".equals(check) ) {
		    	return 4;  	
			}
		    else{
		    	dao.UserSignUp(email, password);
				return 1;	
		    } 
}                 	
	
	
	// 로그인
	@Override
	public int sUserEmail(String email, String password) throws Exception {
		// 이메일 폼 체크
		if(null == email || "".equals(email)) { 
			return 2; 
		}
		
		// 패스워드 폼 체크
		if(null == password || "".equals(password)) {
			return 3;
		}		
		// email 체크
		int checkEmail = dao.UserEmail(email);
		if(0 == checkEmail) {
			// : DB에 같은 이메일 값이 존재하지 않는다.
			return 2;
		}
		// 패스워드 체크
		int checkPassword = dao.UserPassword(password);
		if(0 == checkPassword) {
			// : DB에 같은 패스워드 값이 존재하지 않는다.
			return 3;
		}
		 return 1;
	}
	
	// 내 상세정보 편집
	@Override
	public void sUserUpdate( String name, String birth, String phone, String gender, String email) throws Exception {
		dao.UserUpdate(name, birth, phone, gender, email);		
	}

	// 로그아웃
	@Override
	public void sLogout(HttpSession session) {
		 session.invalidate();	
	}
}		   
     

//String button = null;
//if( null != button || "on".equals(button)){
//	// DB email 중복 체크
//	int checkEmail = dao.UserEmail(email);
//    if ( 1 == checkEmail ) {
//    	return 4;
//	}  
//    else  if ( 0 == checkEmail ) {
//    	return 5;
//	}
//}
	



