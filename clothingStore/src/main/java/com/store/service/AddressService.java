package com.store.service;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Service;

import com.store.dto.AddressDto;

@Service
public interface AddressService {
	public void sUpdateAddress(String email, String r_name, String address1, String address2, String address3, String address4) throws Exception;
	   
	public void sInsertSubAddress(String email, String r_name, String address1, String address2, String address3, String address4) throws Exception;  
    
	public List<AddressDto> sGetAddressList(String email);
	
}
