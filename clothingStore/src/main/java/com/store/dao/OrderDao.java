package com.store.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.store.dto.OrderDto;


@Mapper
public interface OrderDao {
	//회원별 주문 내역 출력
	public List<OrderDto> userOrderListDao(@Param("user_email") String user_email);
}
