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
	public int updateQuantityCart(int cart_id, int pd_quantity) {
		System.out.println("카트 수량 수정");
		return cDao.updateQuantityCartDao(cart_id, pd_quantity);
	}
	
	@Override
	public int updateDuplicateCart(int cart_id) {
		System.out.println("중복 카트 수량 수정");
		return cDao.updateDuplicateCartDao(cart_id);
	}

	@Override
	public List<CartListDto> CartListView(String user_id) {
		System.out.println("카트 목록");
		return cDao.CartListDao(user_id);
	}
	
	@Override
	public CartDto cartDuplicateCheck(String email, int pd_id, String pd_size) {
		System.out.println("카트 중복 조회");
		return cDao.cartDuplicateCheckDao(email, pd_id, pd_size);
	}

}
