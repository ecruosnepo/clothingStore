package com.store.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.store.dao.AddressDao;
import com.store.dto.AddressDto;
@Service
public class AddressService implements AddressServiceImpl {
	   
	    @Autowired
	    private AddressDao dao;
	
	    // address update
		@Override
		public void sUpDateAddress(String email, String address1, String address2, String address3, String address4) throws Exception {
			dao.UpDateAddress(email, address1, address2, address3, address4);
		}

		// address insert
		@Override
		public void sInsertAddress(String email, String r_name, String address1, String address2, String address3, String address4)
				throws Exception {
			dao.InsertAddress(email, r_name, address1, address2, address3, address4 );
			
		}

	
		// address select
		@Override
		public List<AddressDto> sGetAddressList(String email) {
			return dao.getAddressList(email);
		}

		
		
		


}
