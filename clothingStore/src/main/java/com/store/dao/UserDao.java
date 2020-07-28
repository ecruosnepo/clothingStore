package com.store.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.store.dto.UserDto;

@Mapper
public interface UserDao {
	
	 public UserDto UserList(@Param("user_email")String email);
	 
	 public int UserSignUp(@Param("user_email")String user_email, @Param("user_password")String user_password) throws Exception;

     public int UserEmail(@Param("user_email")String user_email) throws Exception;
     
     public int UserPassword(@Param("user_password")String user_password) throws Exception;
     
     public int UserUpdate(@Param("user_name")String name,@Param("user_birth")String birth, 
    		               @Param("user_phone")String phone, @Param("user_gender")String gender) throws Exception;
}
