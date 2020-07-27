package com.store.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.store.dto.CartDto;
import com.store.dto.CartListDto;

@Mapper
public interface CartDao {
	public List<CartListDto> CartListDao(String email);
	public int addCartDao(CartDto cDto);
	public int deleteCartDao(int cart_id);
	public int updateSizeCartDao(String pd_size);
	public int updateQuantityCartDao(int pd_quantity);
}
