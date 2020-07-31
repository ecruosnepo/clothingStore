package com.store.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.store.dto.AddressDto;



@Mapper
public interface AddressDao {
	 public void UpDateAddress(@Param("address1")String address1, @Param("address2")String address2,
					           @Param("address3")String address3, @Param("address4")String address4,
					           @Param("email")String email)throws Exception;

     public void InsertAddress(@Param("email")String email, @Param("name")String name,@Param("address1")String address1, 
					           @Param("address2")String address2, @Param("address3")String address3,
					           @Param("address4")String address4) throws Exception;

     public List<AddressDto> getAddressList(@Param("email")String email);
}
