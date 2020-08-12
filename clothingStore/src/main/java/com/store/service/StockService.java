package com.store.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.store.dto.StockDto;

public interface StockService {
	public List<StockDto> productStock(int pId);
	public int addStock(StockDto sDto);
	public int orderUpdateStock(@Param("pd_id")int pd_id, @Param("pd_size")String pd_size, @Param("pd_quantity")int pd_quantity, @Param("op") String op);
	public int updateStock(StockDto sDto);
	public int checkStock(int pd_id, String pd_size);
}
