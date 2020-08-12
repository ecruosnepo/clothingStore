package com.store.service;

import java.util.List;

import com.store.dto.MyPageDto;
import com.store.dto.OrderDto;


public interface OrderService {
	public int addOrder(OrderDto oDto);
	
	public int addOrderDetail(String order_id,String user_email);	
	
	public List<OrderDto> userOrderListDao(String user_email);
	
	public List<OrderDto> selectOrderList(String user_email) throws Exception;
	
	public List<MyPageDto> selectPdMyPage(String user_email) throws Exception;
	
	public OrderDto selectOrderDto() throws Exception;
}