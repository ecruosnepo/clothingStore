package com.store.dao;

import org.apache.ibatis.annotations.Mapper;

import com.store.dto.StockDto;

@Mapper
public interface StockDao {
	public StockDto getStockDao(int pId);
}
