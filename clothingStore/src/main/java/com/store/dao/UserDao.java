package com.store.dao;


import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.store.dto.UserDto;

@Mapper
public interface UserDao {
	
	 public UserDto getUserInfo(@Param("user_email")String user_email);
	 
	 public int UserSignUp(@Param("user_email")String user_email, @Param("user_password")String user_password) throws Exception;

	 // SELECT COUNT USER_EMAIL
     public int UserEmail(@Param("user_email")String user_email) throws Exception;
     
     public int UserPassword(@Param("user_password")String user_password) throws Exception;
     
     public int UserUpdate(@Param("user_name")String name,@Param("user_birth")String birth, 
    		               @Param("user_phone")String phone, @Param("user_gender")String gender, 
    		               @Param("user_email")String email) throws Exception;

     public int updateMainAddress(@Param("main_address1")String main_address1, 
    		 					  @Param("main_address2")String main_address2,
    		 					  @Param("main_address3")String main_address3, 
    		 					  @Param("main_address4")String main_address4,
    		 					  @Param("user_email")String user_email) throws Exception;
     
     // 계정 삭제
     public int deleteInfoUser(@Param("user_email")String email) throws Exception; 
     
     // 
     public int updateOrderUserInfo(@Param("user_email")String user_email,
    		 @Param("user_name")String user_name,
    		 @Param("main_address1")String main_address1, 
    		 @Param("main_address2")String main_address2,
    		 @Param("main_address3")String main_address3, 
    		 @Param("main_address4")String main_address4,
    		 @Param("user_phone")String user_phone) throws Exception;
   
     // UPDATE USER_PASSWORD 
     public int updatePassword(@Param("user_password")String user_password,
                               @Param("user_email")String user_email) throws Exception;

	
}    
