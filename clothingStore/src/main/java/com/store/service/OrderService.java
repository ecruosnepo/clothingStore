package com.store.service;

import com.store.dto.OrderDto;

public interface OrderService {
	public int addOrder(OrderDto oDto);
	
	public int addOrderDetail(String order_id,String user_email);	
	public int adOrderUpdate(OrderDto oDto);
}
