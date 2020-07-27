package com.store.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.store.dao.CartDao;
import com.store.dto.CartDto;
import com.store.dto.CartListDto;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	CartDao cDao;
	
	@Override
	public int addCart(CartDto cDto) {
		System.out.println("카트 등록");
		return cDao.addCartDao(cDto);
	}

	@Override
	public int deleteCart(int cart_id) {
		System.out.println("카트 삭제");
		return cDao.deleteCartDao(cart_id);
	}

	@Override
	public int updateSizeCart(String pd_size) {
		System.out.println("카트 사이즈 수정");
		return cDao.updateSizeCartDao(pd_size);
	}

	@Override
	public int updateQuantityCart(int pd_quantity) {
		System.out.println("카트 수량 수정");
		return cDao.updateQuantityCartDao(pd_quantity);
	}

	@Override
	public List<CartListDto> CartListView(String user_id) {
		System.out.println("카트 목록");
		return cDao.CartListDao(user_id);
	}

}
