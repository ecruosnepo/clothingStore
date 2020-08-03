package com.store.service;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
<<<<<<< HEAD
=======
import org.apache.ibatis.annotations.Param;
>>>>>>> 65991e0a8eb195f023ebe53009a565cdcd439121
import org.springframework.stereotype.Service;

import com.store.dto.AddressDto;

@Service
public interface AddressService {
	public void sUpdateAddress(String email, String r_name, String address1, String address2, String address3, String address4) throws Exception;
	   
	public void sInsertSubAddress(String email, String r_name, String address1, String address2, String address3, String address4) throws Exception;  
    
	public List<AddressDto> sGetAddressList(String email);

	public int sDeleteInfoAddress(String email) throws Exception;
	
	public int sSelectAddress(String email) throws Exception;
	
	public int sUpdateSubAddress(String r_name, String address1, String address2, String address3, String address4, String user_email, int address_index) throws Exception;
   
	public AddressDto sGetAddressDto(String email, int address_index);
	
	public int sDeleteSubAddress(String email, int address_index) throws Exception;
}
