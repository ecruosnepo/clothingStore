package com.store.service;

import java.util.List;

import com.store.dto.AddressDto;

public interface AddressService {
	public void sUpdateAddress(String email, String r_name, String address1, String address2, String address3, String address4) throws Exception;
	   
	public void sInsertAddress(String r_name, String address1, String address2, String address3, String address4, String email) throws Exception;  
    
	public List<AddressDto> sGetAddressList(String email) ;
}