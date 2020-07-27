package com.store.service;

import java.util.List;

import com.store.dto.CartDto;
import com.store.dto.CartListDto;

public interface CartService {
	public List<CartListDto> CartListView(String email);
	public int addCart(CartDto cDto);
	public int deleteCart(int cart_id);
	public int updateSizeCart(String pd_size);
	public int updateQuantityCart(int pd_quantity);
}
