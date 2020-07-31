package com.store.service;

import com.store.dto.StockDto;

public interface StockService {
	public StockDto getStock(int pId);
	public int addStock(StockDto sDto);
}
