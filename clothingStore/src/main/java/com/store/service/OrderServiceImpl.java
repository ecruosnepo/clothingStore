package com.store.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.store.dao.OrderDao;
import com.store.dto.OrderDto;

@Service
public class OrderServiceImpl implements OrderService {
	@Autowired
	OrderDao oDao;
	
	@Override
	public int addOrder(OrderDto oDto) {
		System.out.println("주문 추가");
		System.out.println(oDto.toString());
				
		return oDao.addOrderDao(oDto);
	}

	@Override
	public int addOrderDetail(String order_id,String user_email) {
		return oDao.addOrderDetailDao(order_id,user_email);
	}
	
   @Override
   public int adOrderUpdate(OrderDto oDto) {
      System.out.println("주문 수정 service");
      oDao.adOrderUpdateDao(oDto);

      return oDao.adOrderUpdateDao(oDto);
   }

}
