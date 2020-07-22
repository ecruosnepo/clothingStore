package com.store.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.store.dao.StockDao;
import com.store.dto.StockDto;

public class StockServiceImpl implements StockService {
	@Autowired
	StockDao stockDao;

	@Override
	public StockDto getStock(int pId) {
		System.out.println("재고 정보 가져오기");
		return stockDao.getStockDao(pId);
	}
	
	
}
