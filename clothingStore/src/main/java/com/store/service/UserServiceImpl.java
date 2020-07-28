package com.store.service;

import javax.servlet.http.HttpSession;

import com.store.dto.UserDto;



public interface UserServiceImpl {
	public UserDto sUserList(String email);
	 
	public int sUserSignUp(String user_email, String user_password, String check) throws Exception ;
	
	public int sUserEmail(String email, String password) throws Exception;
	
	public void sUserUpdate(String name, String birth, String phone, String gender) throws Exception;
	
	public void sLogout(HttpSession session);
	
}
