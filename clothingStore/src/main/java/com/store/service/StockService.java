package com.store.service;

import org.apache.ibatis.annotations.Param;

import com.store.dto.StockDto;

public interface StockService {
	public StockDto getStock(int pId);
	public int addStock(StockDto sDto);

	public int updateStock(@Param("pd_id")int pd_id, @Param("pd_size")String pd_size, @Param("pd_quantity")int pd_quantity, @Param("op") String op);
}
