package com.store.service;

import java.util.List;

import com.store.dto.OrderDetailDto;
import com.store.dto.OrderDto;

public interface OrderService {
	public int addOrder(OrderDto oDto);
	public int addOrderDetail(String order_id,String user_email);
	
	//관리자 페이지
	//전체 리스트 출력
	public List<OrderDto> adminOrderListDao();
	//전체 리스트 갯수
	public int adminOrderCountDao();
	//order_id
	public OrderDto adOrderViewDao(String order_id);
	//order수정
	public int adOrderUpdate(OrderDto oDto);
}
